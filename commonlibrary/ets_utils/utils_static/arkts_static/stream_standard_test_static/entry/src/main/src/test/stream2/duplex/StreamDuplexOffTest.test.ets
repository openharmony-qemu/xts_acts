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
    throw new Error("source error");
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

class EventDuplex extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push(chunk as string);
    callback.unsafeCall();
  }
}

export default function StreamDuplexOffTest(): void {
  describe('StreamDuplexOffTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_OFF_0100
     * @tc.name testStreamDuplexOff001
     * @tc.desc Verify off("data", cb) drops the callback while the stream still reaches end normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOff001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let dataFired: boolean = false;
      let endedAtEnd: boolean = false;
      let lengthAtEnd: int = -1;
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexTestBase = new DuplexTestBase();
        let cb = (chunk: Object): void => {
          dataFired = true;
        };
        ds.on("data", cb);
        ds.off("data", cb);
        ds.on("end", (): void => {
          endedAtEnd = ds.readableEnded;
          lengthAtEnd = ds.readableLength;
          resolve(undefined as void);
        });
        ds.resume();
        ds.push("payload");
        ds.push(null);
      });
      expect(dataFired).assertFalse();
      expect(endedAtEnd).assertTrue();
      expect(lengthAtEnd).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_OFF_0200
     * @tc.name testStreamDuplexOff002
     * @tc.desc Verify off("end", cb) cancels the end callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOff002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let endFired: boolean = false;
      let cb = (): void => {
        endFired = true;
      };
      ds.on("end", cb);
      ds.off("end", cb);
      ds.push(null);
      expect(endFired).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_OFF_0300
     * @tc.name testStreamDuplexOff003
     * @tc.desc Verify off("error", cb) cancels the error callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOff003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexThrowDoRead = new DuplexThrowDoRead();
      let errorFired: boolean = false;
      let cb = (err: Object): void => {
        errorFired = true;
      };
      ds.on("error", cb);
      ds.off("error", cb);
      ds.resume();
      expect(errorFired).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_OFF_0400
     * @tc.name testStreamDuplexOff004
     * @tc.desc Verify off("readable", cb) cancels the readable callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOff004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let readableFired: boolean = false;
      let cb = (): void => {
        readableFired = true;
      };
      ds.on("readable", cb);
      ds.off("readable", cb);
      ds.pause();
      ds.push("test");
      expect(readableFired).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_OFF_0500
     * @tc.name testStreamDuplexOff005
     * @tc.desc Verify off then on re-register works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOff005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let received: boolean = false;
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexTestBase = new DuplexTestBase();
        let cb = (chunk: Object): void => {
          received = true;
        };
        ds.on("data", cb);
        ds.off("data", cb);
        ds.on("data", cb);
        ds.on("end", (): void => {
          resolve(undefined as void);
        });
        ds.resume();
        ds.push("test");
        ds.push(null);
      });
      expect(received).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_OFF_0600
     * @tc.name testStreamDuplexOff006
     * @tc.desc Verify off same callback multiple times (dedup)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOff006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let received: boolean = false;
      let cb = (chunk: Object): void => {
        received = true;
      };
      ds.on("data", cb);
      ds.off("data", cb);
      ds.off("data", cb);
      ds.push("test");
      expect(received).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_OFF_0700
     * @tc.name testStreamDuplexOff007
     * @tc.desc Verify off("data", cb) after pause cancels callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOff007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let received: boolean = false;
      let cb = (chunk: Object): void => {
        received = true;
      };
      ds.on("data", cb);
      ds.pause();
      ds.off("data", cb);
      ds.resume();
      ds.push("test");
      expect(received).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_OFF_0800
     * @tc.name testStreamDuplexOff008
     * @tc.desc Verify off("end", cb) after push(null) does not retro-cancel
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOff008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let endCount: int = 0;
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexTestBase = new DuplexTestBase();
        let cb = (): void => {
          endCount++;
          ds.off("end");
          resolve(undefined as void);
        };
        ds.on("end", cb);
        ds.resume();
        ds.push(null);
      });
      expect(endCount).assertEqual(1);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_OFF_0900
     * @tc.name testStreamDuplexOff009
     * @tc.desc Verify off("data", cb) does not affect isPaused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOff009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let cb = (chunk: Object): void => {
      };
      ds.on("data", cb);
      ds.off("data", cb);
      ds.resume();
      expect(ds.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_OFF_1000
     * @tc.name testStreamDuplexOff010
     * @tc.desc Verify stream stays readable and setEncoding still works after off(data, cb)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOff010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let cb = (chunk: Object): void => {
      };
      ds.on("data", cb);
      ds.off("data", cb);
      expect(ds.setEncoding("utf8")).assertTrue();
      ds.push("test");
      ds.pause();
      let data = ds.read();
      expect(data?.toString()).assertEqual("test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_OFF_1100
     * @tc.name testStreamDuplexOff011
     * @tc.desc Verify write, end, cork/uncork and setDefaultEncoding still work after off(data, cb)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOff011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ops: string[] = ["write", "end", "cork", "setDefaultEncoding"];
      for (let i = 0; i < ops.length; i++) {
        let ds: DuplexTestBase = new DuplexTestBase();
        let cb = (chunk: Object): void => {
        };
        ds.on("data", cb);
        ds.off("data", cb);
        let op: string = ops[i];
        if (op == "write") {
          expect(ds.write("test")).assertTrue();
        } else if (op == "end") {
          ds.end();
          expect(ds.writableEnded).assertTrue();
        } else if (op == "cork") {
          ds.cork();
          expect(ds.writableCorked).assertEqual(1);
          ds.uncork();
          expect(ds.writableCorked).assertEqual(0);
        } else {
          expect(ds.setDefaultEncoding("utf8")).assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_OFF_1200
     * @tc.name testStreamDuplexOff012
     * @tc.desc Verify off("data", cb) stream still can pipe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOff012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let ws: TestWritable = new TestWritable();
      let cb = (chunk: Object): void => {
      };
      ds.on("data", cb);
      ds.off("data", cb);
      ds.pipe(ws);
      expect(ds.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_OFF_1300
     * @tc.name testStreamDuplexOff013
     * @tc.desc Verify off("data", cb) stream still can unpipe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOff013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let ws: TestWritable = new TestWritable();
      ds.pipe(ws);
      let cb = (chunk: Object): void => {
      };
      ds.on("data", cb);
      ds.off("data", cb);
      let result: Object = ds.unpipe(ws);
      expect(result).assertEqual(ds);
      ds.resume();
      expect(ds.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_OFF_1400
     * @tc.name testStreamDuplexOff014
     * @tc.desc Verify off("data", cb) stream still can push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOff014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let cb = (chunk: Object): void => {
      };
      ds.on("data", cb);
      ds.off("data", cb);
      ds.pause();
      let r: boolean = ds.push("test");
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_OFF_1500
     * @tc.name testStreamDuplexOff015
     * @tc.desc Verify off("data", cb) stream still can pause/resume
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOff015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let cb = (chunk: Object): void => {
      };
      ds.on("data", cb);
      ds.off("data", cb);
      ds.pause();
      expect(ds.isPaused()).assertTrue();
      ds.resume();
      expect(ds.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_OFF_1600
     * @tc.name testStreamDuplexOff016
     * @tc.desc Verify off("close", cb) cancels the close callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOff016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let closeFired: boolean = false;
      let cb = (): void => {
        closeFired = true;
      };
      ds.on("close", cb);
      ds.off("close", cb);
      ds.push(null);
      ds.end();
      expect(closeFired).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_OFF_1700
     * @tc.name testStreamDuplexOff017
     * @tc.desc Verify off all callbacks via multiple off calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOff017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let received1: boolean = false;
      let received2: boolean = false;
      let received3: boolean = false;
      let cb1 = (chunk: Object): void => {
        received1 = true;
      };
      let cb2 = (chunk: Object): void => {
        received2 = true;
      };
      let cb3 = (chunk: Object): void => {
        received3 = true;
      };
      ds.on("data", cb1);
      ds.on("data", cb2);
      ds.on("data", cb3);
      ds.off("data", cb1);
      ds.off("data", cb2);
      ds.off("data", cb3);
      ds.push("test");
      expect(received1).assertFalse();
      expect(received2).assertFalse();
      expect(received3).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_OFF_1800
     * @tc.name testStreamDuplexOff018
     * @tc.desc Verify off("data", cb) when cb not registered on data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOff018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let received: boolean = false;
      let cb = (chunk: Object): void => {
        received = true;
      };
      ds.on("end", cb);
      ds.off("data", cb);
      ds.push("test");
      expect(received).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_OFF_1900
     * @tc.name testStreamDuplexOff019
     * @tc.desc Verify off does not affect readable and writable properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOff019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let cb = (chunk: Object): void => {
      };
      ds.on("data", cb);
      ds.off("data", cb);
      expect(ds.readable).assertTrue();
      expect(ds.readableLength).assertEqual(0);
      expect(ds.readableEnded).assertFalse();
      expect(ds.writable).assertTrue();
      expect(ds.writableLength).assertEqual(0);
      expect(ds.writableCorked).assertEqual(0);
      expect(ds.writableEnded).assertFalse();
      expect(ds.writableFinished).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_OFF_2000
     * @tc.name testStreamDuplexOff020
     * @tc.desc Verify off("data", cb) after end does not error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOff020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let ds: DuplexTestBase = new DuplexTestBase();
        let readableEnded: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let cb = (chunk: Object): void => {
          };
          ds.on("data", cb);
          ds.on("end", (): void => {
            ds.off("data", cb);
            readableEnded = ds.readableEnded;
            resolve(undefined as void);
          });
          ds.resume();
          ds.push(null);
        });
        expect(readableEnded).assertTrue();

      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_OFF_2100
     * @tc.name testStreamDuplexOff021
     * @tc.desc Verify off without callback removes all data listeners
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOff021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let dataFired: boolean = false;
      let cb = (chunk: Object): void => {
        dataFired = true;
      };
      ds.on("data", cb);
      ds.off("data");
      ds.push("test");
      expect(dataFired).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_OFF_2200
     * @tc.name testStreamDuplexOff022
     * @tc.desc Verify off("resume") removes the listener so resume() no longer invokes the callback while stream still exits paused state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOff022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new EventDuplex();
      let resumeFired: boolean = false;
      let resumeHandler = (): void => {
        resumeFired = true;
      };
      d.pause();
      d.on('resume', resumeHandler);
      d.off('resume', resumeHandler);
      d.resume();
      expect(resumeFired).assertFalse();
      expect(d.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_OFF_2300
     * @tc.name testStreamDuplexOff023
     * @tc.desc Verify off("pause") removes the listener so pause() no longer invokes the callback while stream still enters paused state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOff023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new EventDuplex();
      let pauseFired: boolean = false;
      let pauseHandler = (): void => {
        pauseFired = true;
      };
      d.on('pause', pauseHandler);
      d.off('pause', pauseHandler);
      d.pause();
      expect(pauseFired).assertFalse();
      expect(d.isPaused()).assertTrue();
      expect(d.readableFlowing).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_OFF_2400
     * @tc.name testStreamDuplexOff024
     * @tc.desc Verify off("finish") removes the listener so finish event no longer invokes the callback after end()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOff024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let d = new EventDuplex();
        let finishFired: boolean = false;
        let closeFired: boolean = false;
        let finishHandler = (): void => {
          finishFired = true;
        };
        await new Promise<void>((resolve: (value: void) => void): void => {
          d.on('finish', finishHandler);
          d.off('finish', finishHandler);
          d.on('close', (): void => {
            closeFired = true;
            setTimeout((): void => resolve(undefined as void), 50);
          });
          d.write('finish-data');
          d.end();
        });
        expect(closeFired).assertTrue();
        expect(finishFired).assertFalse();
        expect(d.writableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_OFF_2500
     * @tc.name testStreamDuplexOff025
     * @tc.desc Verify off("drain") removes the listener so drain event no longer invokes the callback after backpressure resolves
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOff025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let d = new EventDuplex();
        let drainFired: boolean = false;
        let finishFired: boolean = false;
        let drainHandler = (): void => {
          drainFired = true;
        };
        await new Promise<void>((resolve: (value: void) => void): void => {
          d.on('drain', drainHandler);
          d.off('drain', drainHandler);
          d.on('finish', (): void => {
            finishFired = true;
            setTimeout((): void => resolve(undefined as void), 50);
          });
          for (let i: int = 0; i < 20; i++) {
            d.write('x'.repeat(2000));
          }
          d.end();
        });
        expect(finishFired).assertTrue();
        expect(drainFired).assertFalse();
        done();
      });
  });
}
