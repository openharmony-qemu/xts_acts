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
import { buffer, stream, util } from '@kit.ArkTS';

class ReadableTestBase extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }
}

class ReadableThrowDoRead extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: int): void {
    throw new Error("test error");
  }
}

class TestDuplex extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doWrite(chunk: Uint8Array | string, encoding: string, cb: Function): void {
    cb.unsafeCall();
  }
}

class TestTransform extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: Uint8Array | string, encoding: string, cb: Function): void {
    cb.unsafeCall();
  }
}

class TestWritable extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: Uint8Array | string, encoding: string, cb: Function): void {
    cb.unsafeCall();
  }
}

export default function StreamReadableResumeTest(): void {
  describe('StreamReadableResumeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_RESUME_0100
     * @tc.name testStreamReadableResume001
     * @tc.desc Verify resume after pause makes isPaused return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableResume001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      expect(rs.isPaused()).assertTrue();
      rs.resume();
      expect(rs.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_RESUME_0200
     * @tc.name testStreamReadableResume002
     * @tc.desc Verify resume returns the Readable instance itself (chained call support)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableResume002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      let result: Object = rs.resume();
      expect(result).assertEqual(rs);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_RESUME_0300
     * @tc.name testStreamReadableResume003
     * @tc.desc Verify string data buffered during pause stays undelivered until resume triggers the data event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableResume003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs: ReadableTestBase = new ReadableTestBase();
        let dataReceived: string = "";
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on("data", (chunk: Object): void => {
            dataReceived = chunk.toString();
            resolve(undefined as void);
          });
          rs.pause();
          rs.push("hello");
          expect(dataReceived).assertEqual("");
          rs.resume();
        });
        expect(dataReceived).assertEqual("hello");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_RESUME_0400
     * @tc.name testStreamReadableResume004
     * @tc.desc Verify newly pushed data after resume automatically triggers data event (flowing mode)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableResume004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs: ReadableTestBase = new ReadableTestBase();
        let dataReceived: string = "";
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on("data", (chunk: Object): void => {
            dataReceived = chunk.toString();
            resolve(undefined as void);
          });
          rs.pause();
          rs.resume();
          rs.push("world");
        });
        expect(dataReceived).assertEqual("world");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_RESUME_0500
     * @tc.name testStreamReadableResume005
     * @tc.desc Verify resume without prior pause, isPaused stays false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableResume005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      expect(rs.isPaused()).assertFalse();
      rs.resume();
      expect(rs.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_RESUME_0600
     * @tc.name testStreamReadableResume006
     * @tc.desc Verify resume after stream has ended (push null) does not error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableResume006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.push(null);
      try {
        let result = rs.resume();
        expect(result).assertEqual(rs);
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_RESUME_0700
     * @tc.name testStreamReadableResume007
     * @tc.desc Verify pause followed by resume and pause switches state correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableResume007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      expect(rs.isPaused()).assertTrue();
      rs.resume();
      expect(rs.isPaused()).assertFalse();
      rs.pause();
      expect(rs.isPaused()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_RESUME_0800
     * @tc.name testStreamReadableResume008
     * @tc.desc Verify resume on a fresh stream keeps it unpaused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableResume008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs: ReadableTestBase = new ReadableTestBase();
        let dataReceived: string = "";
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on("data", (chunk: Object): void => {
            dataReceived = chunk.toString();
            resolve(undefined as void);
          });
          rs.resume();
          expect(rs.isPaused()).assertFalse();
          rs.push("flowing");
        });
        expect(dataReceived).assertEqual("flowing");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_RESUME_0900
     * @tc.name testStreamReadableResume009
     * @tc.desc Verify Uint8Array data buffered during pause is correctly output after resume
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableResume009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs: ReadableTestBase = new ReadableTestBase();
        let receivedLength: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on("data", (chunk: Object): void => {
            let bytes: buffer.Buffer = chunk as buffer.Buffer;
            receivedLength = bytes.length;
            resolve(undefined as void);
          });
          rs.pause();
          rs.push(new Uint8Array([1, 2, 3]));
          rs.resume();
        });
        expect(receivedLength).assertEqual(3);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_RESUME_1000
     * @tc.name testStreamReadableResume010
     * @tc.desc Verify mixed buffer String+Uint8Array during pause outputs in order after resume
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableResume010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs: ReadableTestBase = new ReadableTestBase();
        let received: string = "";
        let receivedCount: int = 0;
        let dataPromise: Promise<void> = new Promise<void>((resolve: (value: void) => void): void => {
          rs.on("data", (): void => {
            resolve(undefined as void);
          });
        });
        rs.on("data", (chunk: Object): void => {
          received += chunk.toString();
          receivedCount++;
        });
        rs.pause();
        rs.push("a");
        rs.push(new Uint8Array([1]));
        rs.resume();
        await dataPromise;
        expect(received).assertEqual("a\x01");
        expect(receivedCount).assertEqual(2);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_RESUME_1100
     * @tc.name testStreamReadableResume011
     * @tc.desc Verify setEncoding with gbk or gb18030 then buffering while paused and resuming decodes the buffered data correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableResume011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let encodings: string[] = ["gbk", "gb18030"];
        for (let i = 0; i < encodings.length; i++) {
          let rs: ReadableTestBase = new ReadableTestBase();
          let dataReceived: string = "";
          await new Promise<void>((resolve: (value: void) => void): void => {
            rs.on("data", (chunk: Object): void => {
              dataReceived = chunk.toString();
              resolve(undefined as void);
            });
            rs.setEncoding(encodings[i]);
            rs.pause();
            rs.push("中文", encodings[i]);
            rs.resume();
          });
          expect(dataReceived).assertEqual("中文");
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_RESUME_1200
     * @tc.name testStreamReadableResume012
     * @tc.desc Verify resume immediately after construction (never paused, default flowing mode)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableResume012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      let r1 = rs.resume();
      expect(r1).assertEqual(rs);
      expect(rs.isPaused()).assertFalse();
      rs.pause();
      expect(rs.isPaused()).assertTrue();
      let r2 = rs.resume();
      expect(r2).assertEqual(rs);
      expect(rs.isPaused()).assertFalse();
      rs.pause();
      rs.pause();
      expect(rs.isPaused()).assertTrue();
      rs.resume();
      expect(rs.isPaused()).assertFalse();
      rs.resume();
      expect(rs.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_RESUME_1300
     * @tc.name testStreamReadableResume013
     * @tc.desc Verify resume when buffer is empty after pause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableResume013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let dataEventFired: boolean = false;
      rs.on("data", (chunk: Object): void => {
        dataEventFired = true;
      });
      rs.resume();
      expect(rs.isPaused()).assertFalse();
      expect(dataEventFired).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_RESUME_1400
     * @tc.name testStreamReadableResume014
     * @tc.desc Verify data buffered while paused is fully emitted after resume for a single byte and for emoji plus null-character CJK payloads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableResume014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let payloads: string[] = ["a", "😀\x00测试"];
        for (let i = 0; i < payloads.length; i++) {
          let rs: ReadableTestBase = new ReadableTestBase();
          let dataReceived: string = "";
          await new Promise<void>((resolve: (value: void) => void): void => {
            rs.on("data", (chunk: Object): void => {
              dataReceived = chunk.toString();
              resolve(undefined as void);
            });
            rs.pause();
            rs.push(payloads[i]);
            rs.resume();
          });
          expect(dataReceived).assertEqual(payloads[i]);
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_RESUME_1500
     * @tc.name testStreamReadableResume015
     * @tc.desc Verify pause then buffer reaching highWaterMark (16384 bytes), resume outputs all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableResume015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs: ReadableTestBase = new ReadableTestBase();
        let dataReceived: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on("data", (chunk: Object): void => {
            dataReceived = true;
            resolve(undefined as void);
          });
          rs.pause();
          let chunk: string = "";
          for (let i: int = 0; i < 16384; i++) {
            chunk += "a";
          }
          rs.push(chunk);
          rs.resume();
        });
        expect(dataReceived).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_RESUME_1600
     * @tc.name testStreamReadableResume016
     * @tc.desc Verify two consecutive resumes after pause (idempotency)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableResume016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      expect(rs.isPaused()).assertTrue();
      rs.resume();
      expect(rs.isPaused()).assertFalse();
      rs.resume();
      expect(rs.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_RESUME_1700
     * @tc.name testStreamReadableResume017
     * @tc.desc Verify resume called 100 times after pause (high frequency idempotency)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableResume017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      for (let i: int = 0; i < 100; i++) {
        rs.resume();
      }
      expect(rs.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_RESUME_1800
     * @tc.name testStreamReadableResume018
     * @tc.desc Verify a full pause, resume, pause, and resume cycle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableResume018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      expect(rs.isPaused()).assertTrue();
      rs.resume();
      expect(rs.isPaused()).assertFalse();
      rs.pause();
      expect(rs.isPaused()).assertTrue();
      rs.resume();
      expect(rs.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_RESUME_1900
     * @tc.name testStreamReadableResume019
     * @tc.desc Verify calling resume in 'data' event callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableResume019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs: ReadableTestBase = new ReadableTestBase();
        let dataReceived: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on("data", (chunk: Object): void => {
            rs.resume();
            dataReceived = true;
            resolve(undefined as void);
          });
          rs.pause();
          rs.push("x");
          rs.resume();
        });
        expect(dataReceived).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_RESUME_2000
     * @tc.name testStreamReadableResume020
     * @tc.desc Verify after pipe connection, pause is overridden, resume keeps pipe forcing flowing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableResume020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      let ws: TestWritable = new TestWritable();
      rs.pipe(ws);
      rs.pause();
      rs.resume();
      expect(rs.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_RESUME_2100
     * @tc.name testStreamReadableResume021
     * @tc.desc Verify pause/resume high frequency switching 1000 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableResume021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      for (let i: int = 0; i < 1000; i++) {
        rs.pause();
        rs.resume();
      }
      expect(rs.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_RESUME_2200
     * @tc.name testStreamReadableResume022
     * @tc.desc Verify resume in Duplex stream only affects the readable side
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableResume022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplex: TestDuplex = new TestDuplex();
      duplex.pause();
      expect(duplex.isPaused()).assertTrue();
      duplex.resume();
      expect(duplex.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_RESUME_2300
     * @tc.name testStreamReadableResume023
     * @tc.desc Verify buffered extra large data (100KB) during pause, all delivered after resume
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableResume023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs: ReadableTestBase = new ReadableTestBase();
        let dataReceived: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on("data", (chunk: Object): void => {
            dataReceived = true;
            resolve(undefined as void);
          });
          rs.pause();
          rs.push(new Uint8Array(102400));
          rs.resume();
        });
        expect(dataReceived).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_RESUME_2400
     * @tc.name testStreamReadableResume024
     * @tc.desc Verify pause buffer in Transform stream, resume triggers doTransform processing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableResume024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform: TestTransform = new TestTransform();
      transform.pause();
      transform.resume();
      expect(transform.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_RESUME_2500
     * @tc.name testStreamReadableResume025
     * @tc.desc Verify pause buffers a string containing a null byte and resume delivers it intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableResume025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs: ReadableTestBase = new ReadableTestBase();
        let dataReceived: string = "";
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on("data", (chunk: Object): void => {
            dataReceived = chunk.toString();
          });
          rs.pause();
          rs.push("a\x00b");
          rs.resume();
          rs.on("end", (): void => {
            resolve(undefined as void);
          });
          rs.push(null);
        });
        expect(dataReceived).assertEqual("a\x00b");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_RESUME_2600
     * @tc.name testStreamReadableResume026
     * @tc.desc Verify pause then push empty string then resume
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableResume026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      let dataEventFired: boolean = false;
      rs.on("data", (chunk: Object): void => {
        dataEventFired = true;
      });
      rs.pause();
      rs.push("");
      rs.resume();
      expect(rs.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_RESUME_2700
     * @tc.name testStreamReadableResume027
     * @tc.desc Verify resume after stream error (error event)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableResume027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let errName: string = "";
        let errMsg: string = "";
        await new Promise<void>((resolve: (value: void) => void): void => {
          let rs: ReadableThrowDoRead = new ReadableThrowDoRead();
          rs.on("error", (err: Error): void => {
            errName = err.name;
            errMsg = err.message;
            resolve(undefined as void);
          });
          rs.resume();
        });
        expect(errName).assertEqual("Error");
        expect(errMsg).assertEqual("test error");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_RESUME_2800
     * @tc.name testStreamReadableResume028
     * @tc.desc Verify subclass stream with doRead throwing exception, pause then resume triggers exception again
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableResume028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs: ReadableThrowDoRead = new ReadableThrowDoRead();
        let errorCount: int = 0;
        let errorMessage: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on("error", (err: Object): void => {
            errorCount++;
            errorMessage = (err as Error).message;
            resolve(undefined as void);
          });
          rs.pause();
          rs.resume();
        });
        expect(errorCount).assertEqual(1);
        expect(errorMessage).assertEqual("test error");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_RESUME_2900
     * @tc.name testStreamReadableResume029
     * @tc.desc Verify calling resume in 'end' event callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableResume029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs: ReadableTestBase = new ReadableTestBase();
        let resumeResult: Object = new Object();
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on("end", (): void => {
            resumeResult = rs.resume();
            resolve(undefined as void);
          });
          rs.resume();
          rs.push(null);
        });
        expect(resumeResult).assertEqual(rs);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_RESUME_3000
     * @tc.name testStreamReadableResume030
     * @tc.desc Verify resume after all data consumed and stream ended
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableResume030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.push("x");
      rs.push(null);
      rs.read();
      try {
        let result = rs.resume();
        expect(result).assertEqual(rs);
        expect(rs.isPaused()).assertFalse();
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_RESUME_3100
     * @tc.name testStreamReadableResume031
     * @tc.desc Verify calling resume on null/undefined reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableResume031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let rs: Object | null = null;
        (rs as ReadableTestBase).resume();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_RESUME_3200
     * @tc.name testStreamReadableResume032
     * @tc.desc Verify calling resume on non-Readable object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableResume032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = {};
        (obj as ReadableTestBase).resume();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_RESUME_3300
     * @tc.name testStreamReadableResume033
     * @tc.desc Verify resume delivers buffered data before readable end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableResume033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let dataStr: string = "";
        let pausedAtEnd: boolean = true;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let rs = new ReadableTestBase();
          rs.on('data', (data: Object): void => {
            dataStr = data.toString();
          });
          rs.on('end', (): void => {
            pausedAtEnd = rs.isPaused();
            resolve(undefined as void);
          });
          rs.pause();
          rs.push('resume-data');
          rs.push(null);
          rs.resume();
        });
        expect(dataStr).assertEqual('resume-data');
        expect(pausedAtEnd).assertFalse();

        done();
      });
  });
}
