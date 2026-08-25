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

class DuplexTestBase extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doWrite(data: string | Uint8Array, encoding: string, cb: Function): void {
    cb.unsafeCall();
  }
}

class TransformTestBase extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(data: string | Uint8Array, encoding: string, cb: Function): void {
    cb.unsafeCall(undefined, data);
  }
}

class PipeWritable extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(data: string | Uint8Array, encoding: string, cb: Function): void {
    cb.unsafeCall();
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

export default function StreamReadablePauseTest(): void {
  describe('StreamReadablePauseTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PAUSE_0100
     * @tc.name testStreamReadablePause001
     * @tc.desc Verify pause prevents push from triggering data event (data buffered)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePause001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let flag: boolean = false;
      r.on("data", (d: Object): void => {
        flag = true;
      });
      r.pause();
      r.push("test");
      expect(flag).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PAUSE_0200
     * @tc.name testStreamReadablePause002
     * @tc.desc Verify read() can still read buffered data after pause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePause002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      r.pause();
      r.push("hello");
      let result = r.read();
      expect(result?.toString()).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PAUSE_0300
     * @tc.name testStreamReadablePause003
     * @tc.desc Verify pause after resume sets isPaused back to true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePause003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      r.pause();
      r.resume();
      expect(r.isPaused()).assertFalse();
      r.pause();
      expect(r.isPaused()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PAUSE_0400
     * @tc.name testStreamReadablePause004
     * @tc.desc Verify pause on Duplex and Transform streams affects only the read side
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePause004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds = new DuplexTestBase();
      ds.push("data");
      ds.pause();
      expect(ds.isPaused()).assertTrue();
      let ts = new TransformTestBase();
      ts.push("data");
      ts.pause();
      expect(ts.isPaused()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PAUSE_0500
     * @tc.name testStreamReadablePause005
     * @tc.desc Verify pause on a newly created stream returns the Readable itself and reports isPaused true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePause005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let result = r.pause();
      expect(result).assertEqual(r);
      expect(r.isPaused()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PAUSE_0600
     * @tc.name testStreamReadablePause006
     * @tc.desc Verify pause after pushing 1 byte of data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePause006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let flag: boolean = false;
      r.on("data", (d: Object): void => {
        flag = true;
      });
      r.push("a");
      r.pause();
      r.push("b");
      expect(flag).assertFalse();
      let result = r.read();
      expect(result?.toString()).assertEqual("ab");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PAUSE_0700
     * @tc.name testStreamReadablePause007
     * @tc.desc Verify pause then read returns the full data for payloads of 16384 and 16385 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePause007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sizes: int[] = [16384, 16385];
      for (let i = 0; i < sizes.length; i++) {
        let r = new ReadableTestBase();
        let data: string = 'x'.repeat(sizes[i]);
        r.push(data);
        r.pause();
        expect(r.isPaused()).assertTrue();
        let result = r.read();
        expect(result?.toString()).assertEqual(data);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PAUSE_0800
     * @tc.name testStreamReadablePause008
     * @tc.desc Verify pause with no data event listener (read-only mode)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePause008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      r.pause();
      expect(r.isPaused()).assertTrue();
      r.push("data");
      let result = r.read();
      expect(result?.toString()).assertEqual("data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PAUSE_0900
     * @tc.name testStreamReadablePause009
     * @tc.desc Verify pause does not error after push(null) end signal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePause009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new ReadableTestBase();
        r.pause();
        await new Promise<void>((resolve: (value: void) => void): void => {
          r.on('end', (): void => {
            expect(r.readableEnded).assertTrue();
            resolve(undefined as void);
          });
          r.push(null);
          r.resume();
        });
        let p1 = r.pause();
        expect(p1).assertEqual(r);
        expect(r.isPaused()).assertTrue();
        let rs1 = r.resume();
        expect(rs1).assertEqual(r);
        expect(r.isPaused()).assertFalse();
        let p2 = r.pause();
        expect(p2).assertEqual(r);
        expect(r.isPaused()).assertTrue();
        expect(r.readableEnded).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PAUSE_1000
     * @tc.name testStreamReadablePause010
     * @tc.desc Verify pause in data callback suspends subsequent binary data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePause010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let count: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let r = new ReadableTestBase();
          r.on("data", (d: Object): void => {
            count++;
            r.pause();
            resolve(undefined as void);
          });
          r.push("a");
          r.push(new Uint8Array([0x62]));
          r.push("c");
        });
        expect(count).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PAUSE_1100
     * @tc.name testStreamReadablePause011
     * @tc.desc Verify pause, push bulk data (10 chunks), then resume triggers all in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePause011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let chunks: string[] = [];
        await new Promise<void>((resolve: (value: void) => void): void => {
          let r = new ReadableTestBase();
          r.on("data", (d: Object): void => {
            chunks.push(d.toString());
          });
          r.on("end", (): void => {
            resolve(undefined as void);
          });
          r.pause();
          for (let i: int = 0; i < 10; i++) {
            r.push("chunk" + i);
          }
          r.push(null);
          r.resume();
        });
        expect(chunks.length).assertEqual(10);
        expect(chunks[0]).assertEqual("chunk0");
        expect(chunks[9]).assertEqual("chunk9");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PAUSE_1200
     * @tc.name testStreamReadablePause012
     * @tc.desc Verify pause/resume toggle 100 times (high-frequency state switching)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePause012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      for (let i: int = 0; i < 100; i++) {
        r.pause();
        r.resume();
      }
      let result: boolean = r.isPaused();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PAUSE_1300
     * @tc.name testStreamReadablePause013
     * @tc.desc Verify pause in readable event callback enters paused mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePause013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let pausedAtReadable: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let r = new ReadableTestBase();
          r.on("readable", (): void => {
            r.pause();
            pausedAtReadable = r.isPaused();
            resolve(undefined as void);
          });
          r.push("x");
        });
        expect(pausedAtReadable).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PAUSE_1400
     * @tc.name testStreamReadablePause014
     * @tc.desc Verify pause at the binary highWaterMark boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePause014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let data = new Uint8Array(16384);
      r.push(data);
      r.pause();
      expect(r.isPaused()).assertTrue();
      let result = r.read();
      expect(result?.length).assertEqual(16384);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PAUSE_1500
     * @tc.name testStreamReadablePause015
     * @tc.desc Verify pause stays paused before backpressure relief
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePause015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      for (let i: int = 0; i < 100; i++) {
        r.push("x".repeat(1024));
      }
      r.pause();
      expect(r.isPaused()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PAUSE_1600
     * @tc.name testStreamReadablePause016
     * @tc.desc Verify complete flowing-paused-flowing state cycle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePause016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let isPausedAtData: boolean = true;
        let dataStr: string = "";
        await new Promise<void>((resolve: (value: void) => void): void => {
          let r = new ReadableTestBase();
          r.on("data", (d: Object): void => {
            isPausedAtData = r.isPaused();
            dataStr = d.toString();
            resolve(undefined as void);
          });
          r.pause();
          expect(r.isPaused()).assertTrue();
          r.resume();
          expect(r.isPaused()).assertFalse();
          r.push("new");
        });
        expect(isPausedAtData).assertFalse();
        expect(dataStr).assertEqual("new");

        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PAUSE_1700
     * @tc.name testStreamReadablePause017
     * @tc.desc Verify read decodes correctly after pause with setEncoding("utf8")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePause017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      r.setEncoding("utf8");
      r.push("测试工程师");
      r.pause();
      expect(r.isPaused()).assertTrue();
      let result = r.read();
      expect(result).assertEqual("测试工程师");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PAUSE_1800
     * @tc.name testStreamReadablePause018
     * @tc.desc Verify pause with mixed buffer types (String+Uint8Array) and read returns in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePause018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      r.pause();
      r.push("abc");
      r.push(new Uint8Array([100, 101, 102]));
      let first = r.read();
      expect(first?.toString()).assertEqual("abcdef");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PAUSE_1900
     * @tc.name testStreamReadablePause019
     * @tc.desc Verify end after pause closes the stream normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePause019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new ReadableTestBase();
        r.pause();
        expect(r.isPaused()).assertTrue();
        await new Promise<void>((resolve: (value: void) => void): void => {
          r.on('close', (): void => {
            resolve(undefined as void);
          });
          r.push(null);
          r.resume();
        });
        expect(r.readableEnded).assertTrue();
        expect(r.isPaused()).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PAUSE_2000
     * @tc.name testStreamReadablePause020
     * @tc.desc Verify multiple pause event listeners all trigger
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePause020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let count: int = 0;
      r.on("pause", (): void => {
        count++;
      });
      r.on("pause", (): void => {
        count++;
      });
      r.pause();
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PAUSE_2100
     * @tc.name testStreamReadablePause021
     * @tc.desc Verify 100 consecutive pause calls (high-frequency idempotent)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePause021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      for (let i: int = 0; i < 100; i++) {
        r.pause();
        expect(r.isPaused()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PAUSE_2200
     * @tc.name testStreamReadablePause022
     * @tc.desc Verify pause called after end (operation on ended stream)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePause022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new ReadableTestBase();
        await new Promise<void>((resolve: (value: void) => void): void => {
          r.on('end', (): void => {
            resolve(undefined as void);
          });
          r.push(null);
          r.resume();
        });
        expect(r.readableEnded).assertTrue();
        let result = r.pause();
        expect(result).assertEqual(r);
        expect(r.isPaused()).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PAUSE_2300
     * @tc.name testStreamReadablePause023
     * @tc.desc Verify pause called after error event triggers (error state)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePause023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ErrorDoRead();
      let pausedInError: boolean = false;
      r.on("error", (err: Object): void => {
        r.pause();
        pausedInError = r.isPaused();
      });
      r.read();
      expect(pausedInError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PAUSE_2400
     * @tc.name testStreamReadablePause024
     * @tc.desc Verify pause then push Uint8Array with null bytes (0x00), data intact after resume
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePause024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new ReadableTestBase();
        r.pause();
        r.push(new Uint8Array([0, 1, 0, 2]));
        r.resume();
        let received = r.read()?.toString();
        expect(received?.length).assertEqual(4);
        expect(received?.charCodeAt(0)).assertEqual(0);
        expect(received?.charCodeAt(1)).assertEqual(1);
        expect(received?.charCodeAt(2)).assertEqual(0);
        expect(received?.charCodeAt(3)).assertEqual(2);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PAUSE_2500
     * @tc.name testStreamReadablePause025
     * @tc.desc Verify pause called with lost this context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePause025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let fn: Function = r.pause;
      let result = fn();
      expect(result).assertEqual(r);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PAUSE_2600
     * @tc.name testStreamReadablePause026
     * @tc.desc Verify pause called on non-Readable object (plain Object)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePause026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = {} as Object;
        (obj as stream.Readable).pause();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PAUSE_2700
     * @tc.name testStreamReadablePause027
     * @tc.desc Verify paused data remains buffered until resume
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePause027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      r.pause();
      r.push('buffered');
      expect(r.isPaused()).assertTrue();
      expect(r.readableLength).assertEqual(8);
      r.resume();
      r.pause();
      expect(r.read()?.toString()).assertEqual('buffered');
      expect(r.readableLength).assertEqual(0);
    });
  });
}
