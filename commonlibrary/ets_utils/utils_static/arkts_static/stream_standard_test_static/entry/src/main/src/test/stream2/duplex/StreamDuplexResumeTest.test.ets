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

class DuplexTestBase extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }
}

class DuplexThrowDoRead extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: int): void {
    throw new Error("test error");
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
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

export default function StreamDuplexResumeTest(): void {
  describe('StreamDuplexResumeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_RESUME_0100
     * @tc.name testStreamDuplexResume001
     * @tc.desc Verify resume after pause makes isPaused return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexResume001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      expect(ds.isPaused()).assertTrue();
      ds.resume();
      expect(ds.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_RESUME_0200
     * @tc.name testStreamDuplexResume002
     * @tc.desc Verify resume returns the Duplex instance itself (chained call support)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexResume002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let result: Object = ds.resume();
      expect(result).assertEqual(ds);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_RESUME_0300
     * @tc.name testStreamDuplexResume003
     * @tc.desc Verify data pushed during pause triggers data event after resume
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexResume003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let dataReceived: string = "";
      let dataPromise = new Promise<void>((resolve: (value: void) => void): void => {
        ds.on("data", (chunk: Object): void => {
          dataReceived = chunk.toString();
          resolve(undefined as void);
        });
      });
      ds.pause();
      ds.push("hello");
      expect(dataReceived).assertEqual("");
      ds.resume();
      await dataPromise;
      expect(dataReceived).assertEqual("hello");
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_RESUME_0400
     * @tc.name testStreamDuplexResume004
     * @tc.desc Verify newly pushed data after resume automatically triggers data event (flowing mode)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexResume004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let dataReceived: string = "";
      let dataPromise = new Promise<void>((resolve: (value: void) => void): void => {
        ds.on("data", (chunk: Object): void => {
          dataReceived = chunk.toString();
          resolve(undefined as void);
        });
      });
      ds.pause();
      ds.resume();
      ds.push("world");
      await dataPromise;
      expect(dataReceived).assertEqual("world");
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_RESUME_0500
     * @tc.name testStreamDuplexResume005
     * @tc.desc Verify resume immediately after construction without prior pause keeps isPaused false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexResume005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      expect(ds.isPaused()).assertFalse();
      ds.resume();
      expect(ds.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_RESUME_0600
     * @tc.name testStreamDuplexResume006
     * @tc.desc Verify resume after stream has ended (push null) does not error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexResume006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.push(null);
      try {
        let result = ds.resume();
        expect(result).assertEqual(ds);
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_RESUME_0700
     * @tc.name testStreamDuplexResume007
     * @tc.desc Verify resume returns the same instance on every call across a pause cycle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexResume007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let firstResume: Object = ds.resume();
      ds.pause();
      let secondResume: Object = ds.resume();
      expect(firstResume).assertEqual(ds);
      expect(secondResume).assertEqual(ds);
      expect(ds.isPaused()).assertFalse();
      expect(ds.readableFlowing).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_RESUME_0800
     * @tc.name testStreamDuplexResume008
     * @tc.desc Verify Uint8Array data buffered during pause is correctly output after resume
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexResume008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let dataReceived: boolean = false;
      let dataPromise = new Promise<void>((resolve: (value: void) => void): void => {
        ds.on("data", (chunk: Object): void => {
          dataReceived = true;
          resolve(undefined as void);
        });
      });
      ds.pause();
      ds.push(new Uint8Array([1, 2, 3]));
      ds.resume();
      await dataPromise;
      expect(dataReceived).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_RESUME_0900
     * @tc.name testStreamDuplexResume009
     * @tc.desc Verify mixed buffer String+Uint8Array during pause outputs in order after resume
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexResume009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let received: string = "";
      let receivedCount: int = 0;
      let dataPromise: Promise<void> = new Promise<void>((resolve: (value: void) => void): void => {
        ds.on("data", (chunk: Object): void => {
          received += chunk.toString();
          receivedCount++;
          if (receivedCount == 2) {
            resolve(undefined as void);
          }
        });
      });
      ds.pause();
      ds.push("a");
      ds.push(new Uint8Array([1]));
      ds.resume();
      await dataPromise;
      expect(received).assertEqual("a\x01");
      expect(receivedCount).assertEqual(2);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_RESUME_1000
     * @tc.name testStreamDuplexResume010
     * @tc.desc Verify setEncoding with gbk and gb18030 then pause buffer, resume correctly decodes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexResume010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let encodings: string[] = ["gbk", "gb18030"];
      for (let i = 0; i < encodings.length; i++) {
        let ds: DuplexTestBase = new DuplexTestBase();
        let dataReceived: string = "";
        ds.setEncoding(encodings[i]);
        ds.pause();
        ds.push("中文", encodings[i]);
        await new Promise<void>((resolve: (value: void) => void): void => {
          ds.on("data", (chunk: Object): void => {
            dataReceived = chunk.toString();
            resolve(undefined as void);
          });
          ds.resume();
        });
        expect(dataReceived).assertEqual("中文");
      }
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_RESUME_1100
     * @tc.name testStreamDuplexResume011
     * @tc.desc Verify resume when buffer is empty after pause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexResume011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      let dataEventFired: boolean = false;
      ds.on("data", (chunk: Object): void => {
        dataEventFired = true;
      });
      ds.resume();
      expect(ds.isPaused()).assertFalse();
      expect(dataEventFired).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_RESUME_1200
     * @tc.name testStreamDuplexResume012
     * @tc.desc Verify pause then buffer 1 byte, resume normal output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexResume012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let dataReceived: string = "";
      let dataPromise = new Promise<void>((resolve: (value: void) => void): void => {
        ds.on("data", (chunk: Object): void => {
          dataReceived = chunk.toString();
          resolve(undefined as void);
        });
      });
      ds.pause();
      ds.push("a");
      ds.resume();
      await dataPromise;
      expect(dataReceived).assertEqual("a");
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_RESUME_1300
     * @tc.name testStreamDuplexResume013
     * @tc.desc Verify pause then buffer reaching highWaterMark (16384 bytes), resume outputs all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexResume013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let dataReceived: boolean = false;
      let dataPromise = new Promise<void>((resolve: (value: void) => void): void => {
        ds.on("data", (chunk: Object): void => {
          dataReceived = true;
          resolve(undefined as void);
        });
      });
      ds.pause();
      let chunk: string = "";
      for (let i: int = 0; i < 16384; i++) {
        chunk += "a";
      }
      ds.push(chunk);
      ds.resume();
      await dataPromise;
      expect(dataReceived).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_RESUME_1400
     * @tc.name testStreamDuplexResume014
     * @tc.desc Verify resume called 100 times after pause (high frequency idempotency)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexResume014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      for (let i: int = 0; i < 100; i++) {
        ds.resume();
      }
      expect(ds.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_RESUME_1500
     * @tc.name testStreamDuplexResume015
     * @tc.desc Verify the final resume of a pause cycle drains data buffered while paused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexResume015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let dataReceived: string = "";
      let lengthAfterPush: int = -1;
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexTestBase = new DuplexTestBase();
        ds.on("data", (chunk: Object): void => {
          dataReceived = chunk.toString();
          resolve(undefined as void);
        });
        ds.pause();
        ds.resume();
        ds.pause();
        ds.push("cycled");
        lengthAfterPush = ds.readableLength;
        ds.resume();
      });
      expect(lengthAfterPush).assertEqual(6);
      expect(dataReceived).assertEqual("cycled");
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_RESUME_1600
     * @tc.name testStreamDuplexResume016
     * @tc.desc Verify calling resume in 'data' event callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexResume016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let dataReceived: boolean = false;
      let dataPromise = new Promise<void>((resolve: (value: void) => void): void => {
        ds.on("data", (chunk: Object): void => {
          ds.resume();
          dataReceived = true;
          resolve(undefined as void);
        });
      });
      ds.pause();
      ds.push("x");
      ds.resume();
      await dataPromise;
      expect(dataReceived).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_RESUME_1700
     * @tc.name testStreamDuplexResume017
     * @tc.desc Verify after pipe connection, pause is overridden, resume keeps pipe forcing flowing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexResume017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let ws: TestWritable = new TestWritable();
      ds.pipe(ws);
      ds.pause();
      ds.resume();
      expect(ds.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_RESUME_1800
     * @tc.name testStreamDuplexResume018
     * @tc.desc Verify a stream stays usable for reading after 1000 resume calls following one pause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexResume018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      for (let i: int = 0; i < 1000; i++) {
        ds.resume();
      }
      expect(ds.readableFlowing).assertTrue();
      ds.pause();
      ds.push("still-alive");
      let data = ds.read();
      expect(data?.toString()).assertEqual("still-alive");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_RESUME_1900
     * @tc.name testStreamDuplexResume019
     * @tc.desc Verify resume after write-side end keeps the readable side flowing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexResume019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.end();
      ds.resume();
      expect(ds.writableEnded).assertTrue();
      expect(ds.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_RESUME_2000
     * @tc.name testStreamDuplexResume020
     * @tc.desc Verify resume only affects the readable side while write still works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexResume020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      ds.resume();
      let r: boolean = ds.write("write-after-resume");
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_RESUME_2100
     * @tc.name testStreamDuplexResume021
     * @tc.desc Verify data buffered during pause with emoji and null bytes is delivered intact after resume
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexResume021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let inputs: string[] = ["😀\x00测试", "a\x00b"];
      for (let i = 0; i < inputs.length; i++) {
        let ds: DuplexTestBase = new DuplexTestBase();
        let dataReceived: string = "";
        ds.pause();
        ds.push(inputs[i]);
        await new Promise<void>((resolve: (value: void) => void): void => {
          ds.on("data", (chunk: Object): void => {
            dataReceived = chunk.toString();
            resolve(undefined as void);
          });
          ds.resume();
        });
        expect(dataReceived).assertEqual(inputs[i]);
      }
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_RESUME_2200
     * @tc.name testStreamDuplexResume022
     * @tc.desc Verify buffered extra large data (100KB) during pause, all delivered after resume
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexResume022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let dataReceived: boolean = false;
      let dataPromise = new Promise<void>((resolve: (value: void) => void): void => {
        ds.on("data", (chunk: Object): void => {
          dataReceived = true;
          resolve(undefined as void);
        });
      });
      ds.pause();
      ds.push(new Uint8Array(102400));
      ds.resume();
      await dataPromise;
      expect(dataReceived).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_RESUME_2300
     * @tc.name testStreamDuplexResume023
     * @tc.desc Verify resume is independent of write side state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexResume023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      ds.write("buffered");
      ds.resume();
      expect(ds.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_RESUME_2400
     * @tc.name testStreamDuplexResume024
     * @tc.desc Verify pause then push empty string then resume
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexResume024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let dataEventFired: boolean = false;
      ds.on("data", (chunk: Object): void => {
        dataEventFired = true;
      });
      ds.pause();
      ds.push("");
      ds.resume();
      expect(ds.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_RESUME_2500
     * @tc.name testStreamDuplexResume025
     * @tc.desc Verify subclass stream with doRead throwing exception, pause then resume triggers exception again
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexResume025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let ds: DuplexThrowDoRead = new DuplexThrowDoRead();
      let errorCount: int = 0;
      let errorMessage: string = '';
      let errorPromise = new Promise<void>((resolve: (value: void) => void): void => {
        ds.on("error", (err: Error): void => {
          errorCount++;
          errorMessage = err.message;
          resolve(undefined as void);
        });
      });
      ds.pause();
      ds.resume();
      await errorPromise;
      expect(errorCount).assertEqual(1);
      expect(errorMessage).assertEqual("test error");
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_RESUME_2600
     * @tc.name testStreamDuplexResume026
     * @tc.desc Verify calling resume in 'end' event callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexResume026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let resumeResult: Object | null = null;
      let endPromise = new Promise<void>((resolve: (value: void) => void): void => {
        ds.on("end", (): void => {
          resumeResult = ds.resume();
          resolve(undefined as void);
        });
      });
      ds.resume();
      ds.push(null);
      await endPromise;
      expect(resumeResult).assertEqual(ds);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_RESUME_2700
     * @tc.name testStreamDuplexResume027
     * @tc.desc Verify resume after all data consumed and stream ended
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexResume027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.push("x");
      ds.push(null);
      ds.read();
      try {
        let result = ds.resume();
        expect(result).assertEqual(ds);
        expect(ds.isPaused()).assertFalse();
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_RESUME_2800
     * @tc.name testStreamDuplexResume028
     * @tc.desc Verify calling resume on null/undefined reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexResume028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let ds: Object | null = null;
        (ds as DuplexTestBase).resume();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_RESUME_2900
     * @tc.name testStreamDuplexResume029
     * @tc.desc Verify calling resume on non-Duplex object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexResume029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = {};
        (obj as DuplexTestBase).resume();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_RESUME_3000
     * @tc.name testStreamDuplexResume030
     * @tc.desc Verify resume delivers buffered data before readable end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexResume030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let ds = new DuplexTestBase();
      let dataStr: string = '';
      let pausedAtEnd: boolean = true;
      await new Promise<void>((resolve: (value: void) => void): void => {
        ds.on('data', (data: Object): void => {
          dataStr = data.toString();
        });
        ds.on('end', (): void => {
          pausedAtEnd = ds.isPaused();
          resolve(undefined as void);
        });
        ds.pause();
        ds.push('resume-data');
        ds.push(null);
        ds.resume();
      });
      expect(dataStr).assertEqual('resume-data');
      expect(pausedAtEnd).assertFalse();

      done();
    });
  });
}
