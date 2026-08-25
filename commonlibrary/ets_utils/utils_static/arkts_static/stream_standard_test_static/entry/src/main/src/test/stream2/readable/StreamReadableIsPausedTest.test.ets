'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../../hypium/index';
import { stream, util } from '@kit.ArkTS';

class ReadableTestBase extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }
}

class TestWritable extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(data: Object, encoding: String, cb: Function): void {
    cb.unsafeCall();
  }
}

class TestDuplex extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doWrite(data: Object, encoding: String, cb: Function): void {
    cb.unsafeCall();
  }
}

class TestTransform extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(data: Object, encoding: String, cb: Function): void {
    cb.unsafeCall(undefined, data);
  }
}

class DataPushReadable extends ReadableTestBase {
  private emitted: boolean = false;

  doRead(size: int): void {
    if (!this.emitted) {
      this.emitted = true;
      this.push("data");
      this.push(null);
    }
  }
}

class ErrorDoRead extends ReadableTestBase {
  doRead(size: int): void {
    throw new Error("test error");
  }
}

class EndDoRead extends ReadableTestBase {
  doRead(size: int): void {
    this.push(null);
  }
}

export default function StreamReadableIsPausedTest(): void {
  describe('StreamReadableIsPausedTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: (value: void) => void): void => {
        setTimeout((): void => resolve(undefined as void), 0);
      });
    });
    beforeAll((): void => {
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_IS_PAUSED_0100
     * @tc.name testStreamReadableIsPaused001
     * @tc.desc Verify isPaused returns false by default after construction (flowing mode)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableIsPaused001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      let result = rs.isPaused();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_IS_PAUSED_0200
     * @tc.name testStreamReadableIsPaused002
     * @tc.desc Verify isPaused returns true after pause()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableIsPaused002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      rs.pause();
      let result = rs.isPaused();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_IS_PAUSED_0300
     * @tc.name testStreamReadableIsPaused003
     * @tc.desc Verify resume after pause restores isPaused to false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableIsPaused003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      rs.pause();
      rs.resume();
      let result = rs.isPaused();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_IS_PAUSED_0400
     * @tc.name testStreamReadableIsPaused004
     * @tc.desc Verify pause-resume-pause full state tracking
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableIsPaused004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      rs.pause();
      expect(rs.isPaused()).assertTrue();
      rs.resume();
      expect(rs.isPaused()).assertFalse();
      rs.pause();
      expect(rs.isPaused()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_IS_PAUSED_0500
     * @tc.name testStreamReadableIsPaused005
     * @tc.desc Verify isPaused remains false after resume without prior pause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableIsPaused005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      rs.resume();
      let result = rs.isPaused();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_IS_PAUSED_0600
     * @tc.name testStreamReadableIsPaused006
     * @tc.desc Verify isPaused stays true after pause under a pipe connection with and without a preceding resume
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableIsPaused006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let useResume: boolean[] = [false, true];
      for (let i = 0; i < useResume.length; i++) {
        let rs = new DataPushReadable();
        let ws = new TestWritable();
        rs.pipe(ws);
        if (useResume[i]) {
          rs.resume();
        }
        rs.pause();
        expect(rs.isPaused()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_IS_PAUSED_0700
     * @tc.name testStreamReadableIsPaused007
     * @tc.desc Verify isPaused does not throw after push(null) ends the stream
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableIsPaused007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      rs.pause();
      rs.push(null);
      let result = rs.isPaused();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_IS_PAUSED_0800
     * @tc.name testStreamReadableIsPaused008
     * @tc.desc Verify isPaused does not throw after end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableIsPaused008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      rs.push(null);
      let result = rs.isPaused();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_IS_PAUSED_0900
     * @tc.name testStreamReadableIsPaused009
     * @tc.desc Verify isPaused is true after pausing Duplex and Transform stream read sides
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableIsPaused009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new TestDuplex();
      d.pause();
      expect(d.isPaused()).assertTrue();
      let t = new TestTransform();
      t.pause();
      expect(t.isPaused()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_IS_PAUSED_1000
     * @tc.name testStreamReadableIsPaused010
     * @tc.desc Verify isPaused returns true after pause for plain, emoji-mixed, embedded-null and empty pushed data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableIsPaused010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chunks: string[] = ['hello', '😀测试', 'a\x00b', ''];
      for (let i = 0; i < chunks.length; i++) {
        let rs = new ReadableTestBase();
        rs.push(chunks[i]);
        rs.pause();
        let result = rs.isPaused();
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_IS_PAUSED_1100
     * @tc.name testStreamReadableIsPaused011
     * @tc.desc Verify isPaused is true after pause when buffer contains Uint8Array data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableIsPaused011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      rs.push(new Uint8Array([116, 101, 115, 116]));
      rs.pause();
      let result = rs.isPaused();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_IS_PAUSED_1200
     * @tc.name testStreamReadableIsPaused012
     * @tc.desc Verify isPaused remains false after resume and end marker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableIsPaused012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      rs.resume();
      rs.push(null);
      rs.push(null);
      let result = rs.isPaused();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_IS_PAUSED_1300
     * @tc.name testStreamReadableIsPaused013
     * @tc.desc Verify isPaused after two consecutive resume calls (idempotent)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableIsPaused013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      rs.pause();
      rs.resume();
      expect(rs.isPaused()).assertFalse();
      rs.resume();
      expect(rs.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_IS_PAUSED_1400
     * @tc.name testStreamReadableIsPaused014
     * @tc.desc Verify full pause-resume-pause-resume cycle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableIsPaused014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      rs.pause();
      rs.resume();
      rs.pause();
      rs.resume();
      let result = rs.isPaused();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_IS_PAUSED_1500
     * @tc.name testStreamReadableIsPaused015
     * @tc.desc Verify isPaused remains true after pause with buffered string data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableIsPaused015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs = new ReadableTestBase();
        rs.pause();
        rs.push("data");
        expect(rs.isPaused()).assertTrue();
        expect(rs.readableLength).assertEqual(4);
        let dataReceived: string = "";
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on("data", (chunk: Object): void => {
            dataReceived = chunk.toString();
            resolve(undefined as void);
          });
          rs.resume();
        });
        expect(rs.isPaused()).assertFalse();
        expect(dataReceived).assertEqual("data");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_IS_PAUSED_1600
     * @tc.name testStreamReadableIsPaused016
     * @tc.desc Verify isPaused retains previous pause state after buffered data and end marker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableIsPaused016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      rs.pause();
      rs.push("data");
      rs.push(null);
      let result = rs.isPaused();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_IS_PAUSED_1700
     * @tc.name testStreamReadableIsPaused017
     * @tc.desc Verify isPaused remains true after registering a data listener while paused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableIsPaused017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      rs.pause();
      rs.on('data', (): void => {
      });
      let result = rs.isPaused();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_IS_PAUSED_1800
     * @tc.name testStreamReadableIsPaused018
     * @tc.desc Verify isPaused returns true when pause is called inside the data and readable event callbacks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableIsPaused018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let events: string[] = ['data', 'readable'];
        for (let i = 0; i < events.length; i++) {
          let pausedRes: boolean = false;
          await new Promise<void>((resolve: (value: void) => void): void => {
            let rs = new DataPushReadable();
            rs.on(events[i], (): void => {
              rs.pause();
              pausedRes = rs.isPaused();
              resolve(undefined as void);
            });
          });
          expect(pausedRes).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_IS_PAUSED_1900
     * @tc.name testStreamReadableIsPaused019
     * @tc.desc Verify isPaused after 100 rapid pause/resume toggles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableIsPaused019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      for (let i: int = 0; i < 100; i++) {
        rs.pause();
        rs.resume();
      }
      let result = rs.isPaused();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_IS_PAUSED_2000
     * @tc.name testStreamReadableIsPaused020
     * @tc.desc Verify isPaused after pause under downstream backpressure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableIsPaused020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      for (let i: int = 0; i < 100; i++) {
        rs.push("x".repeat(1024));
      }
      rs.pause();
      let result = rs.isPaused();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_IS_PAUSED_2100
     * @tc.name testStreamReadableIsPaused021
     * @tc.desc Verify isPaused after pause when buffer reaches highWaterMark (16384 bytes)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableIsPaused021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      rs.push("x".repeat(16384));
      rs.pause();
      let result = rs.isPaused();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_IS_PAUSED_2200
     * @tc.name testStreamReadableIsPaused022
     * @tc.desc Verify isPaused remains unchanged while buffered data is consumed by read after pause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableIsPaused022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      rs.pause();
      rs.push("data");
      rs.read();
      let result = rs.isPaused();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_IS_PAUSED_2300
     * @tc.name testStreamReadableIsPaused023
     * @tc.desc Verify flowing mode is confirmed after resume (push auto-triggers data)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableIsPaused023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await new Promise<void>((resolve: (value: void) => void): void => {
          let rs = new ReadableTestBase();
          rs.pause();
          rs.resume();
          expect(rs.isPaused()).assertFalse();
          rs.on('data', (): void => {
            resolve(undefined as void);
          });
          rs.push("x");
        });
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_IS_PAUSED_2400
     * @tc.name testStreamReadableIsPaused024
     * @tc.desc Verify isPaused returns true after pause with encoded text, empty, large, mixed and gb18030 data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableIsPaused024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cases: string[] = ["utf8", "empty", "large", "mixed", "gb18030"];
      for (let i = 0; i < cases.length; i++) {
        let rs = new ReadableTestBase();
        let kind: string = cases[i];
        if (kind == "utf8") {
          rs.setEncoding("utf8");
          rs.push("测试工程师");
        } else if (kind == "empty") {
          rs.push(new Uint8Array([]));
        } else if (kind == "large") {
          rs.push(new Uint8Array(65536));
        } else if (kind == "mixed") {
          rs.push("hello");
          rs.push(new Uint8Array([0, 255, 128]));
        } else {
          rs.setEncoding("gb18030");
          rs.push(new Uint8Array([0xB2, 0xE2, 0xCA, 0xD4]));
        }
        rs.pause();
        expect(rs.isPaused()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_IS_PAUSED_2500
     * @tc.name testStreamReadableIsPaused025
     * @tc.desc Verify isPaused remains true after 100 consecutive pauses
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableIsPaused025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      for (let i: int = 0; i < 100; i++) {
        rs.pause();
        expect(rs.isPaused()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_IS_PAUSED_2600
     * @tc.name testStreamReadableIsPaused026
     * @tc.desc Verify isPaused after error event triggers (query in error state)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableIsPaused026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let pausedRes: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let rs = new ErrorDoRead();
          rs.on('error', (): void => {
            pausedRes = rs.isPaused();
            resolve(undefined as void);
          });
          rs.read();
        });
        expect(pausedRes).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_IS_PAUSED_2700
     * @tc.name testStreamReadableIsPaused027
     * @tc.desc Verify isPaused called in end event callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableIsPaused027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let pausedRes: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let rs = new EndDoRead();
          rs.on('end', (): void => {
            pausedRes = rs.isPaused();
            resolve(undefined as void);
          });
          rs.resume();
        });
        expect(pausedRes).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_IS_PAUSED_2800
     * @tc.name testStreamReadableIsPaused028
     * @tc.desc Verify isPaused called on non-Readable object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableIsPaused028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = {} as Object;
        (obj as stream.Readable).isPaused();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_IS_PAUSED_2900
     * @tc.name testStreamReadableIsPaused029
     * @tc.desc Verify isPaused called on null reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableIsPaused029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let rs: Object | null = null;
        (rs as stream.Readable).isPaused();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_IS_PAUSED_3000
     * @tc.name testStreamReadableIsPaused030
     * @tc.desc Verify resume changes isPaused before pushed data is delivered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableIsPaused030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let dataPaused: boolean = false;
        let dataString: string = '';
        let endPaused: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let rs = new ReadableTestBase();
          rs.on('data', (data: Object): void => {
            dataPaused = rs.isPaused();
            dataString = data.toString();
          });
          rs.on('end', (): void => {
            endPaused = rs.isPaused();
            resolve(undefined as void);
          });
          rs.pause();
          expect(rs.isPaused()).assertTrue();
          rs.resume();
          rs.push('state');
          rs.push(null);
        });
        expect(dataPaused).assertFalse();
        expect(dataString).assertEqual('state');
        expect(endPaused).assertFalse();

        done();
      });
  });
}
