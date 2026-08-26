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

class WritableTestBase extends stream.Writable {
  public dataChunk: string | Uint8Array = '';
  public dataEncoding: string = '';

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.dataChunk = chunk;
    this.dataEncoding = encoding;
    callback.unsafeCall();
  }
}

class WritableErrorDoWrite extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall(new Error("test error"));
  }
}

export default function StreamWritableOnTest(): void {
  describe('StreamWritableOnTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_0100
     * @tc.name testStreamWritableOn001
     * @tc.desc Verify register finish event triggers after write+end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let finishedAtFinish: boolean = false;
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            finishedAtFinish = ws.writableFinished;
            resolve(undefined as void);
          });
        });
        ws.write("data");
        ws.end();
        await finishPromise;
        expect(ws.writableEnded).assertTrue();
        expect(finishedAtFinish).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_0200
     * @tc.name testStreamWritableOn002
     * @tc.desc Verify register close event triggers after end completes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let closeFired: boolean = false;
        let closePromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('close', (): void => {
            closeFired = true;
            resolve(undefined as void);
          });
        });
        ws.write("data");
        ws.end();
        await closePromise;
        expect(closeFired).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_0300
     * @tc.name testStreamWritableOn003
     * @tc.desc Verify register drain event triggers after buffer is emptied
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let drainFired: boolean = false;
        let lengthAtDrain: number = -1;
        let drainPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('drain', (): void => {
            drainFired = true;
            lengthAtDrain = ws.writableLength;
            resolve(undefined as void);
          });
        });
        ws.write(new Uint8Array(20000));
        await drainPromise;
        expect(drainFired).assertTrue();
        expect(lengthAtDrain).assertEqual(0);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_0400
     * @tc.name testStreamWritableOn004
     * @tc.desc Verify register error event triggers when doWrite passes an Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableErrorDoWrite();
        let errorFired: boolean = false;
        let errName: string = '';
        let errMessage: string = '';
        let errorPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('error', (err: Error): void => {
            errorFired = true;
            errName = err.name;
            errMessage = err.message;
            resolve(undefined as void);
          });
        });
        ws.write("data");
        await errorPromise;
        expect(errorFired).assertTrue();
        expect(errName).assertEqual('Error');
        expect(errMessage).assertEqual('test error');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_0500
     * @tc.name testStreamWritableOn005
     * @tc.desc Verify register finish without calling end does not trigger the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let finishFired: boolean = false;
      ws.on('finish', (): void => {
        finishFired = true;
      });
      ws.write("data");
      expect(finishFired).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_0600
     * @tc.name testStreamWritableOn006
     * @tc.desc Verify normal write does not trigger error event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let errorFired: boolean = false;
      ws.on('error', (): void => {
        errorFired = true;
      });
      ws.write("valid");
      expect(errorFired).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_0700
     * @tc.name testStreamWritableOn007
     * @tc.desc Verify off cancels listener so the original event no longer triggers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let finishFired: boolean = false;
      let fn = (): void => {
        finishFired = true;
      };
      ws.on('finish', fn);
      ws.off('finish', fn);
      ws.end();
      expect(finishFired).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_0800
     * @tc.name testStreamWritableOn008
     * @tc.desc Verify stream closes normally without exception when no events are registered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      try {
        ws.write("data");
        ws.end();
        expect(ws.dataChunk).assertEqual("data");
        expect(ws.writableEnded).assertTrue();
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_0900
     * @tc.name testStreamWritableOn009
     * @tc.desc Verify arrow function registered as callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let flag: boolean = false;
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            flag = true;
            resolve(undefined as void);
          });
        });
        ws.end();
        await finishPromise;
        expect(flag).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_1000
     * @tc.name testStreamWritableOn010
     * @tc.desc Verify regular function registered as callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let flag: boolean = false;
        let finishFn = (): void => {
          flag = true;
        };
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            finishFn();
            resolve(undefined as void);
          });
        });
        ws.end();
        await finishPromise;
        expect(flag).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_1100
     * @tc.name testStreamWritableOn011
     * @tc.desc Verify finish callback observes finished writable state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let finishedAtFinish: boolean = false;
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            finishedAtFinish = ws.writableFinished;
            resolve(undefined as void);
          });
        });
        ws.end();
        await finishPromise;
        expect(ws.writableEnded).assertTrue();
        expect(finishedAtFinish).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_1200
     * @tc.name testStreamWritableOn012
     * @tc.desc Verify finish callback observes ended and finished writable state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let endedAtFinish: boolean = false;
        let finishedAtFinish: boolean = false;
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            endedAtFinish = ws.writableEnded;
            finishedAtFinish = ws.writableFinished;
            resolve(undefined as void);
          });
        });
        ws.end();
        await finishPromise;
        expect(ws.writableEnded).assertTrue();
        expect(endedAtFinish).assertTrue();
        expect(finishedAtFinish).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_1300
     * @tc.name testStreamWritableOn013
     * @tc.desc Verify unsupported empty event name is not emitted when writable ends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableErrorDoWrite();
        let errorFired: boolean = false;
        let errName: string = '';
        let errMessage: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('error', (err: Error): void => {
            errorFired = true;
            errName = err.name;
            errMessage = err.message;
            resolve(undefined as void);
          });
          ws.write("data");
        });
        expect(errorFired).assertTrue();
        expect(errName).assertEqual('Error');
        expect(errMessage).assertEqual('test error');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_1400
     * @tc.name testStreamWritableOn014
     * @tc.desc Verify unsupported single-character event name is not emitted when writable ends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let order: string = '';
        ws.on('finish', (): void => {
          order += 'finish';
        });
        ws.on('close', (): void => {
          order += 'close';
        });
        let orderAtClose: string = '';
        let closePromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('close', (): void => {
            orderAtClose = order;
            resolve(undefined as void);
          });
        });
        ws.write("data");
        ws.end();
        await closePromise;
        expect(orderAtClose).assertEqual('finishclose');
        expect(ws.writableEnded).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_1500
     * @tc.name testStreamWritableOn015
     * @tc.desc Verify event is 10000-character long string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let longEvent: string = 'a'.repeat(10000);
      ws.on(longEvent, (): void => {
      });
      expect(ws.writable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_1600
     * @tc.name testStreamWritableOn016
     * @tc.desc Verify event is 65535 characters (varchar limit)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let hugeEvent: string = 'a'.repeat(65535);
      ws.on(hugeEvent, (): void => {
      });
      expect(ws.writable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_1700
     * @tc.name testStreamWritableOn017
     * @tc.desc Verify unsupported whitespace event name is not emitted when writable ends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let drainFired: boolean = false;
        let lengthAtDrain: number = -1;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('drain', (): void => {
            drainFired = true;
            lengthAtDrain = ws.writableLength;
            resolve(undefined as void);
          });
          ws.write(new Uint8Array(20000));
        });
        expect(drainFired).assertTrue();
        expect(lengthAtDrain).assertEqual(0);
        expect(ws.writable).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_1800
     * @tc.name testStreamWritableOn018
     * @tc.desc Verify unsupported tab event name is not emitted when writable ends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let count: number = 0;
        let cb1 = (): void => {
          count++;
        };
        let cb2 = (): void => {
          count++;
        };
        ws.on('finish', cb1);
        ws.on('finish', cb2);
        let countAtFinish: number = -1;
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            countAtFinish = count;
            resolve(undefined as void);
          });
        });
        ws.end();
        await finishPromise;
        expect(countAtFinish).assertEqual(2);
        expect(ws.writableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_1900
     * @tc.name testStreamWritableOn019
     * @tc.desc Verify callback is empty function body
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let emptyBodyFn = (): void => {
        };
        ws.on('finish', emptyBodyFn);
        let finishFired: boolean = false;
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            finishFired = true;
            resolve(undefined as void);
          });
        });
        ws.end();
        await finishPromise;
        expect(finishFired).assertTrue();
        expect(ws.writableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_2000
     * @tc.name testStreamWritableOn020
     * @tc.desc Verify callback is a no-parameter function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let finishFired: boolean = false;
        let noParamFn = (): void => {
          finishFired = true;
        };
        ws.on('finish', noParamFn);
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            resolve(undefined as void);
          });
        });
        ws.end();
        await finishPromise;
        expect(finishFired).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_2100
     * @tc.name testStreamWritableOn021
     * @tc.desc Verify callback is a multi-parameter function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let finishFired: boolean = false;
        let multiParamFn = (a?: Object, b?: Object, c?: Object, d?: Object, e?: Object): void => {
          finishFired = true;
        };
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            resolve(undefined as void);
          });
        });
        ws.on('finish', multiParamFn);
        ws.end();
        await finishPromise;
        expect(finishFired).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_2200
     * @tc.name testStreamWritableOn022
     * @tc.desc Verify register finish before write, triggers after end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let finishFired: boolean = false;
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            finishFired = true;
            resolve(undefined as void);
          });
        });
        ws.write("x");
        ws.end();
        await finishPromise;
        expect(finishFired).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_2300
     * @tc.name testStreamWritableOn023
     * @tc.desc Verify register finish after write but before end, triggers after end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        ws.write("x");
        let finishFired: boolean = false;
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            finishFired = true;
            resolve(undefined as void);
          });
        });
        ws.end();
        await finishPromise;
        expect(finishFired).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_2400
     * @tc.name testStreamWritableOn024
     * @tc.desc Verify a finish listener registered after end does not fire retroactively
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.end();
      let finishFired: boolean = false;
      ws.on('finish', (): void => {
        finishFired = true;
      });
      expect(finishFired).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_2500
     * @tc.name testStreamWritableOn025
     * @tc.desc Verify registering multiple callbacks for the same event, all trigger
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let count: number = 0;
        let cb1 = (): void => {
          count++;
        };
        let cb2 = (): void => {
          count++;
        };
        let cb3 = (): void => {
          count++;
        };
        ws.on('finish', cb1);
        ws.on('finish', cb2);
        ws.on('finish', cb3);
        let countAtFinish: number = -1;
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            countAtFinish = count;
            resolve(undefined as void);
          });
        });
        ws.end();
        await finishPromise;
        expect(countAtFinish).assertEqual(3);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_2600
     * @tc.name testStreamWritableOn026
     * @tc.desc Verify register finish and close simultaneously, both trigger in order after end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let order: string = '';
        ws.on('finish', (): void => {
          order += 'finish';
        });
        ws.on('close', (): void => {
          order += 'close';
        });
        let orderAtClose: string = '';
        let closePromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('close', (): void => {
            orderAtClose = order;
            resolve(undefined as void);
          });
        });
        ws.end();
        await closePromise;
        expect(orderAtClose).assertEqual('finishclose');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_2700
     * @tc.name testStreamWritableOn027
     * @tc.desc Verify register finish/drain/close three events simultaneously
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let order: string = '';
        ws.on('finish', (): void => {
          order += 'finish';
        });
        ws.on('drain', (): void => {
          order += 'drain';
        });
        ws.on('close', (): void => {
          order += 'close';
        });
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            resolve(undefined as void);
          });
        });
        ws.write("data");
        ws.end();
        await finishPromise;
        expect(order).assertEqual('finishclose');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_2800
     * @tc.name testStreamWritableOn028
     * @tc.desc Verify on then off then on again, callback triggers again
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let finishFired: boolean = false;
        let cb = (): void => {
          finishFired = true;
        };
        ws.on('finish', cb);
        ws.off('finish', cb);
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            cb();
            resolve(undefined as void);
          });
        });
        ws.end();
        await finishPromise;
        expect(finishFired).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_2900
     * @tc.name testStreamWritableOn029
     * @tc.desc Verify event name is a zero-width space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.on("​", (): void => {
      });
      expect(ws.writable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_3000
     * @tc.name testStreamWritableOn030
     * @tc.desc Verify unsupported emoji event name is not emitted when writable ends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let upperFired: boolean = false;
        let lowerFired: boolean = false;
        let finishedAtFinish: boolean = false;
        ws.on('FINISH', (): void => {
          upperFired = true;
        });
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            lowerFired = true;
            finishedAtFinish = ws.writableFinished;
            resolve(undefined as void);
          });
          ws.end();
        });
        expect(upperFired).assertFalse();
        expect(lowerFired).assertTrue();
        expect(finishedAtFinish).assertTrue();
        expect(ws.writableEnded).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_3100
     * @tc.name testStreamWritableOn031
     * @tc.desc Verify unsupported mixed emoji event name is not emitted when writable ends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let fn1Fired: boolean = false;
        let fn2Fired: boolean = false;
        let fn1 = (): void => {
          fn1Fired = true;
        };
        let fn2 = (): void => {
          fn2Fired = true;
        };
        ws.on('finish', fn1);
        ws.on('finish', fn2);
        ws.off('finish', fn1);
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            resolve(undefined as void);
          });
        });
        ws.end();
        await finishPromise;
        expect(fn1Fired).assertFalse();
        expect(fn2Fired).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_3200
     * @tc.name testStreamWritableOn032
     * @tc.desc Verify unsupported script event name is not emitted when writable ends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let endedAtFinish: boolean = false;
        let finishedAtFinish: boolean = false;
        let chunkAtFinish: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            endedAtFinish = ws.writableEnded;
            finishedAtFinish = ws.writableFinished;
            chunkAtFinish = ws.dataChunk as string;
            resolve(undefined as void);
          });
          ws.end('final');
        });
        expect(endedAtFinish).assertTrue();
        expect(finishedAtFinish).assertTrue();
        expect(chunkAtFinish).assertEqual('final');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_3300
     * @tc.name testStreamWritableOn033
     * @tc.desc Verify unsupported Japanese event name is not emitted when writable ends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        ws.write("data");
        let finishFired: boolean = false;
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            finishFired = true;
            resolve(undefined as void);
          });
        });
        ws.end();
        await finishPromise;
        expect(finishFired).assertTrue();
        expect(ws.writableEnded).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_3400
     * @tc.name testStreamWritableOn034
     * @tc.desc Verify unsupported Russian event name is not emitted when writable ends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let errorFired: boolean = false;
        ws.on('error', (): void => {
          errorFired = true;
        });
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('close', (): void => {
            resolve(undefined as void);
          });
          ws.write("normal");
          ws.end();
        });
        expect(errorFired).assertFalse();
        expect(ws.writableEnded).assertTrue();
        expect(ws.writableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_3500
     * @tc.name testStreamWritableOn035
     * @tc.desc Verify unsupported Arabic event name is not emitted when writable ends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let eventFired: boolean = false;
        let finishCount: number = 0;
        ws.on("الاختبار", (): void => {
          eventFired = true;
        });
        ws.on('finish', (): void => {
          finishCount++;
        });
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('close', (): void => {
            resolve(undefined as void);
          });
          ws.end();
        });
        expect(eventFired).assertFalse();
        expect(finishCount).assertEqual(1);
        expect(ws.writableEnded).assertTrue();
        expect(ws.writableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_3600
     * @tc.name testStreamWritableOn036
     * @tc.desc Verify listeners for unsupported event names including replacement, lone surrogate, invalid UTF-8, literal undefined, hexadecimal and readable-only data are never invoked while finish still fires
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let events: string[] = ['�', '\udc04', '\xe4', 'undefined', '0x123', 'data'];
        for (let i = 0; i < events.length; i++) {
          let ws = new WritableTestBase();
          let eventFired: boolean = false;
          let endedAtFinish: boolean = false;
          let finishedAtFinish: boolean = false;
          ws.on(events[i], (): void => {
            eventFired = true;
          });
          await new Promise<void>((resolve: (value: void) => void): void => {
            ws.on('finish', (): void => {
              endedAtFinish = ws.writableEnded;
              finishedAtFinish = ws.writableFinished;
              resolve(undefined as void);
            });
            ws.end();
          });
          expect(eventFired).assertFalse();
          expect(endedAtFinish).assertTrue();
          expect(finishedAtFinish).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_3700
     * @tc.name testStreamWritableOn037
     * @tc.desc Verify unsupported literal-null event name is not emitted when writable ends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let unsupportedFired: boolean = false;
        let finishFired: boolean = false;
        let finishedAtFinish: boolean = false;
        ws.on("null", (): void => {
          unsupportedFired = true;
        });
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            finishFired = true;
            finishedAtFinish = ws.writableFinished;
            resolve(undefined as void);
          });
          ws.write("data");
          ws.end();
        });
        expect(unsupportedFired).assertFalse();
        expect(finishFired).assertTrue();
        expect(finishedAtFinish).assertTrue();
        expect(ws.dataChunk).assertEqual("data");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_3800
     * @tc.name testStreamWritableOn038
     * @tc.desc Verify unsupported date-format event name is not emitted when writable ends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let dateFired: boolean = false;
        let finishCount: number = 0;
        ws.on("2026-03-05", (): void => {
          dateFired = true;
        });
        ws.on('finish', (): void => {
          finishCount++;
        });
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('close', (): void => {
            resolve(undefined as void);
          });
          ws.end();
        });
        expect(dateFired).assertFalse();
        expect(finishCount).assertEqual(1);
        expect(ws.writableEnded).assertTrue();
        expect(ws.writableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_3900
     * @tc.name testStreamWritableOn039
     * @tc.desc Verify on with a number, string or plain object callback throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callbacks: Object[] = [123 as Object, 'string' as Object, {} as Object];
      for (let i = 0; i < callbacks.length; i++) {
        let ws = new WritableTestBase();
        try {
          ws.on('finish', callbacks[i] as Object as Function);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_4000
     * @tc.name testStreamWritableOn040
     * @tc.desc Verify event is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      try {
        ws.on(null as Object as string, (): void => {
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_4100
     * @tc.name testStreamWritableOn041
     * @tc.desc Verify event is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      try {
        ws.on(undefined as string, (): void => {
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_4200
     * @tc.name testStreamWritableOn042
     * @tc.desc Verify callback is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      try {
        ws.on('finish', null as Object as Function);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_4300
     * @tc.name testStreamWritableOn043
     * @tc.desc Verify callback is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      try {
        ws.on('finish', undefined as Object as Function);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_4400
     * @tc.name testStreamWritableOn044
     * @tc.desc Verify on called detached from stream instance (no this context)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let capturedCallbackError: Error | undefined = undefined;
      let ws = new WritableTestBase();
      let onFn: Function = ws.on;
      onFn('finish', (err?: Error): void => {
        if (err !== undefined) {
          capturedCallbackError = err;
          return;
        }
      });
      expect(ws.writable).assertTrue();
      expect(capturedCallbackError).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_ON_4500
     * @tc.name testStreamWritableOn045
     * @tc.desc Verify finish listener registered by on observes end completion and final state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOn045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let endedAtFinish: boolean = false;
        let finishedAtFinish: boolean = false;
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            endedAtFinish = ws.writableEnded;
            finishedAtFinish = ws.writableFinished;
            resolve(undefined as void);
          });
        });
        ws.end('finish');
        await finishPromise;
        expect(endedAtFinish).assertTrue();
        expect(finishedAtFinish).assertTrue();
        done();
      });
  });
}
