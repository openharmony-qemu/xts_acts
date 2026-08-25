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

class SlowEventDuplex extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push(chunk as string);
    setTimeout((): void => { callback.unsafeCall(); }, 10);
  }
}

export default function StreamDuplexPauseTest(): void {
  describe('StreamDuplexPauseTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PAUSE_0100
     * @tc.name testStreamDuplexPause001
     * @tc.desc Verify pause makes isPaused return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPause001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      expect(ds.isPaused()).assertFalse();
      ds.pause();
      expect(ds.isPaused()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PAUSE_0200
     * @tc.name testStreamDuplexPause002
     * @tc.desc Verify pause returns the Duplex instance itself (chained call support)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPause002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let result: Object = ds.pause();
      expect(result).assertEqual(ds);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PAUSE_0300
     * @tc.name testStreamDuplexPause003
     * @tc.desc Verify newly pushed data after pause is buffered, no data event fires
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPause003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let dataReceived: boolean = false;
      ds.on("data", (chunk: Object): void => {
        dataReceived = true;
      });
      ds.pause();
      ds.push("world");
      expect(dataReceived).assertFalse();
      expect(ds.readableLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PAUSE_0400
     * @tc.name testStreamDuplexPause004
     * @tc.desc Verify pause after stream has ended (push null) does not error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPause004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.push(null);
      try {
        let result = ds.pause();
        expect(result).assertEqual(ds);
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PAUSE_0500
     * @tc.name testStreamDuplexPause005
     * @tc.desc Verify pause followed by resume and pause switches state correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPause005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      expect(ds.isPaused()).assertTrue();
      ds.resume();
      expect(ds.isPaused()).assertFalse();
      ds.pause();
      expect(ds.isPaused()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PAUSE_0600
     * @tc.name testStreamDuplexPause006
     * @tc.desc Verify String, Uint8Array and mixed data buffered during pause accumulate in readableLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPause006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds1: DuplexTestBase = new DuplexTestBase();
      ds1.pause();
      ds1.push("hello");
      expect(ds1.readableLength).assertEqual(5);
      let ds2: DuplexTestBase = new DuplexTestBase();
      ds2.pause();
      ds2.push(new Uint8Array([1, 2, 3]));
      expect(ds2.readableLength).assertEqual(3);
      let ds3: DuplexTestBase = new DuplexTestBase();
      ds3.pause();
      ds3.push("a");
      ds3.push(new Uint8Array([1]));
      expect(ds3.readableLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PAUSE_0700
     * @tc.name testStreamDuplexPause007
     * @tc.desc Verify setEncoding with gbk and gb18030 then pause keeps data buffered and decodable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPause007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encodings: string[] = ["gbk", "gb18030"];
      for (let i = 0; i < encodings.length; i++) {
        let ds: DuplexTestBase = new DuplexTestBase();
        ds.setEncoding(encodings[i]);
        ds.pause();
        ds.push("中文", encodings[i]);
        expect(ds.readableLength).assertEqual(2);
        expect(ds.read()?.toString()).assertEqual("中文");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PAUSE_0800
     * @tc.name testStreamDuplexPause008
     * @tc.desc Verify pause followed by resume clears the paused state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPause008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      ds.resume();
      expect(ds.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PAUSE_0900
     * @tc.name testStreamDuplexPause009
     * @tc.desc Verify pause when buffer is empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPause009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      expect(ds.readableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PAUSE_1000
     * @tc.name testStreamDuplexPause010
     * @tc.desc Verify pause then buffer 1 byte, readableLength=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPause010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      ds.push("a");
      expect(ds.readableLength).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PAUSE_1100
     * @tc.name testStreamDuplexPause011
     * @tc.desc Verify pause called 100 times after pause (high frequency idempotency)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPause011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      for (let i: int = 0; i < 100; i++) {
        ds.pause();
      }
      expect(ds.isPaused()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PAUSE_1200
     * @tc.name testStreamDuplexPause012
     * @tc.desc Verify a full pause, resume, pause, and resume cycle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPause012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      expect(ds.isPaused()).assertTrue();
      ds.resume();
      expect(ds.isPaused()).assertFalse();
      ds.pause();
      expect(ds.isPaused()).assertTrue();
      ds.resume();
      expect(ds.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PAUSE_1300
     * @tc.name testStreamDuplexPause013
     * @tc.desc Verify calling pause in 'readable' event callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPause013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let pauseCalled: boolean = false;
        let paused: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let ds: DuplexTestBase = new DuplexTestBase();
          ds.pause();
          ds.on("readable", (): void => {
            ds.pause();
            pauseCalled = true;
            paused = ds.isPaused();
            resolve(undefined as void);
          });
          ds.push("x");
        });
        expect(pauseCalled).assertTrue();
        expect(paused).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PAUSE_1400
     * @tc.name testStreamDuplexPause014
     * @tc.desc Verify calling pause in 'data' event callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPause014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let pauseCalled: boolean = false;
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexTestBase = new DuplexTestBase();
        ds.on("data", (chunk: Object): void => {
          ds.pause();
          pauseCalled = true;
          ds.resume();
        });
        ds.on("end", (): void => {
          resolve(undefined as void);
        });
        ds.resume();
        ds.push("x");
        ds.push(null);
      });
      expect(pauseCalled).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PAUSE_1500
     * @tc.name testStreamDuplexPause015
     * @tc.desc Verify after pipe connection, pause is overridden, pause may not actually pause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPause015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let ws: TestWritable = new TestWritable();
      ds.pipe(ws);
      ds.pause();
      expect(ds.isPaused()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PAUSE_1600
     * @tc.name testStreamDuplexPause016
     * @tc.desc Verify pause/resume high frequency switching 1000 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPause016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      for (let i: int = 0; i < 1000; i++) {
        ds.pause();
        ds.resume();
      }
      expect(ds.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PAUSE_1700
     * @tc.name testStreamDuplexPause017
     * @tc.desc Verify pause after buffering data keeps the stream paused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPause017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.push("data");
      ds.pause();
      expect(ds.isPaused()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PAUSE_1800
     * @tc.name testStreamDuplexPause018
     * @tc.desc Verify data buffered during pause containing special characters (emoji/null) stays buffered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPause018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      ds.push("😀\x00测试");
      expect(ds.readableLength).assertEqual(11);
      expect(ds.read()?.toString()).assertEqual("😀\x00测试");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PAUSE_1900
     * @tc.name testStreamDuplexPause019
     * @tc.desc Verify buffered extra large data (100KB) during pause, no data event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPause019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let dataReceived: boolean = false;
      ds.on("data", (chunk: Object): void => {
        dataReceived = true;
      });
      ds.pause();
      ds.push(new Uint8Array(102400));
      expect(dataReceived).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PAUSE_2000
     * @tc.name testStreamDuplexPause020
     * @tc.desc Verify pause only affects readable side while write still works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPause020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      let r: boolean = ds.write("write-during-pause");
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PAUSE_2100
     * @tc.name testStreamDuplexPause021
     * @tc.desc Verify pause buffers a string containing a null byte and keeps it buffered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPause021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      ds.push("a\x00b");
      expect(ds.readableLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PAUSE_2200
     * @tc.name testStreamDuplexPause022
     * @tc.desc Verify pause then push empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPause022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let dataEventFired: boolean = false;
      ds.on("data", (chunk: Object): void => {
        dataEventFired = true;
      });
      ds.pause();
      ds.push("");
      expect(dataEventFired).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PAUSE_2300
     * @tc.name testStreamDuplexPause023
     * @tc.desc Verify pause after stream error (error event)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPause023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let ds: DuplexThrowDoRead = new DuplexThrowDoRead();
      let errName: string = "";
      let errMsg: string = "";
      let pauseResult: Object = "";
      let paused: boolean = false;
      await new Promise<void>((resolve: (value: void) => void): void => {
        ds.on("error", (err: Error): void => {
          errName = err.name;
          errMsg = err.message;
          pauseResult = ds.pause();
          paused = ds.isPaused();
          resolve(undefined as void);
        });
        ds.resume();
      });
      expect(errName).assertEqual("Error");
      expect(errMsg).assertEqual("test error");
      expect(pauseResult).assertEqual(ds);
      expect(paused).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PAUSE_2400
     * @tc.name testStreamDuplexPause024
     * @tc.desc Verify subclass stream with doRead throwing exception, pause then resume triggers exception again
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPause024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let errorCount: int = 0;
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexThrowDoRead = new DuplexThrowDoRead();
        ds.on("error", (err: Object): void => {
          errorCount++;
          resolve(undefined as void);
        });
        ds.pause();
        ds.resume();
      });
      expect(errorCount).assertEqual(1);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PAUSE_2500
     * @tc.name testStreamDuplexPause025
     * @tc.desc Verify calling pause in 'end' event callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPause025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let paused: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let ds: DuplexTestBase = new DuplexTestBase();
          ds.on("end", (): void => {
            ds.pause();
            paused = ds.isPaused();
            resolve(undefined as void);
          });
          ds.resume();
          ds.push(null);
        });
        expect(paused).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PAUSE_2600
     * @tc.name testStreamDuplexPause026
     * @tc.desc Verify pause after all data consumed and stream ended
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPause026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.push("x");
      ds.push(null);
      ds.read();
      try {
        let result = ds.pause();
        expect(result).assertEqual(ds);
        expect(ds.isPaused()).assertTrue();
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PAUSE_2700
     * @tc.name testStreamDuplexPause027
     * @tc.desc Verify calling pause on null/undefined reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPause027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let ds: Object | null = null;
        (ds as DuplexTestBase).pause();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PAUSE_2800
     * @tc.name testStreamDuplexPause028
     * @tc.desc Verify write beyond the high watermark returns false to signal backpressure on the Duplex write side
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPause028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new SlowEventDuplex();
      let backpressureTriggered: boolean = false;
      for (let i: int = 0; i < 20; i++) {
        let ret: boolean = d.write('x'.repeat(2000));
        if (!ret) {
          backpressureTriggered = true;
        }
      }
      expect(backpressureTriggered).assertTrue();
      expect(d.readableLength).assertEqual(2000);
    });
  });
}
