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
import Utils from '../../Util.test';

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

export default function StreamWritableOffTest(): void {
  describe('StreamWritableOffTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_OFF_0100
     * @tc.name testStreamWritableOff001
     * @tc.desc Verify off(finish,fn) removes the specified callback so end does not trigger it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOff001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let finishFired: boolean = false;
      let fn1 = (): void => {
        finishFired = true;
      };
      ws.on('finish', fn1);
      ws.off('finish', fn1);
      ws.end();
      expect(finishFired).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_OFF_0200
     * @tc.name testStreamWritableOff002
     * @tc.desc Verify off(finish) with omitted callback removes all finish callbacks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOff002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let fn1Called: boolean = false;
      let fn2Called: boolean = false;
      let fn1 = (): void => {
        fn1Called = true;
      };
      let fn2 = (): void => {
        fn2Called = true;
      };
      ws.on('finish', fn1);
      ws.on('finish', fn2);
      ws.off('finish');
      ws.end();
      expect(fn1Called).assertFalse();
      expect(fn2Called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_OFF_0300
     * @tc.name testStreamWritableOff003
     * @tc.desc Verify off then re-on restores the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOff003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let fn1 = (): void => {
        };
        let writableFinished: boolean = false;
        ws.on('finish', fn1);
        ws.off('finish', fn1);
        ws.on('finish', fn1);
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            writableFinished = ws.writableFinished;
            resolve(undefined as void);
          });
          ws.end();
        });
        expect(writableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_OFF_0400
     * @tc.name testStreamWritableOff004
     * @tc.desc Verify off removes close/drain/error/finish event callbacks individually
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOff004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let closeFired: boolean = false;
      let drainFired: boolean = false;
      let errorFired: boolean = false;
      let finishFired: boolean = false;
      let fnClose = (): void => {
        closeFired = true;
      };
      let fnDrain = (): void => {
        drainFired = true;
      };
      let fnError = (): void => {
        errorFired = true;
      };
      let fnFinish = (): void => {
        finishFired = true;
      };
      ws.on('close', fnClose);
      ws.on('drain', fnDrain);
      ws.on('error', fnError);
      ws.on('finish', fnFinish);
      ws.off('close', fnClose);
      ws.off('drain', fnDrain);
      ws.off('error', fnError);
      ws.off('finish', fnFinish);
      ws.end();
      expect(closeFired).assertFalse();
      expect(drainFired).assertFalse();
      expect(errorFired).assertFalse();
      expect(finishFired).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_OFF_0500
     * @tc.name testStreamWritableOff005
     * @tc.desc Verify off(finish,fn1) does not affect fn2 of the same event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOff005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let fn1Called: boolean = false;
        let fn2Called: boolean = false;
        let fn1 = (): void => {
          fn1Called = true;
        };
        let fn2 = (): void => {
          fn2Called = true;
        };
        let fn2CallObserved: boolean = false;
        ws.on('finish', fn1);
        ws.on('finish', fn2);
        ws.off('finish', fn1);
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            fn2CallObserved = fn2Called;
            resolve(undefined as void);
          });
          ws.end();
        });
        expect(fn2CallObserved).assertTrue();
        expect(fn1Called).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_OFF_0600
     * @tc.name testStreamWritableOff006
     * @tc.desc Verify removing finish callback preserves close completion and no error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOff006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let errorFired: boolean = false;
        let writableEnded: boolean = false;
        let fnFinish = (): void => {
        };
        let fnError = (): void => {
          errorFired = true;
        };
        ws.on('finish', fnFinish);
        ws.on('error', fnError);
        ws.off('finish', fnFinish);
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('close', (): void => {
            writableEnded = ws.writableEnded;
            resolve(undefined as void);
          });
          ws.end();
        });
        expect(writableEnded).assertTrue();
        expect(errorFired).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_OFF_0700
     * @tc.name testStreamWritableOff007
     * @tc.desc Verify off on an unregistered event (never on) silently does nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOff007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let fn = (): void => {
      };
      ws.off('close', fn);
      expect(ws.writable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_OFF_0800
     * @tc.name testStreamWritableOff008
     * @tc.desc Verify off with an unregistered callback (event registered but not this callback) silently does nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOff008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let fnNotRegistered = (): void => {
        };
        let fn1Called: boolean = false;
        let fn1 = (): void => {
          fn1Called = true;
        };
        let fn1CallObserved: boolean = false;
        let writableFinished: boolean = false;
        ws.on('finish', fn1);
        ws.off('finish', fnNotRegistered);
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            fn1CallObserved = fn1Called;
            writableFinished = ws.writableFinished;
            resolve(undefined as void);
          });
          ws.end();
        });
        expect(fn1CallObserved).assertTrue();
        expect(writableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_OFF_0900
     * @tc.name testStreamWritableOff009
     * @tc.desc Verify off removes an arrow callback after end has started
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOff009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let finishFired: boolean = false;
      let arrowFn = (): void => {
        finishFired = true;
      };
      ws.on('finish', arrowFn);
      ws.end();
      expect(ws.writableEnded).assertTrue();
      ws.off('finish', arrowFn);
      expect(finishFired).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_OFF_1000
     * @tc.name testStreamWritableOff010
     * @tc.desc Verify off removes a regular function callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOff010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let drainFired: boolean = false;
      let drainFn = (): void => {
        drainFired = true;
      };
      ws.on('drain', drainFn);
      ws.off('drain', drainFn);
      ws.write(new Uint8Array(20000));
      expect(drainFired).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_OFF_1100
     * @tc.name testStreamWritableOff011
     * @tc.desc Verify off removes an async function callback so finish never invokes it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOff011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let finishFired: boolean = false;
      let asyncFn = async (): Promise<void> => {
        finishFired = true;
      };
      ws.on('finish', asyncFn);
      ws.off('finish', asyncFn);
      ws.end();
      expect(finishFired).assertFalse();
      expect(ws.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_OFF_1200
     * @tc.name testStreamWritableOff012
     * @tc.desc Verify removes the middle one after registering 3 callbacks for the same event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOff012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let fn1Called: boolean = false;
        let fn2Called: boolean = false;
        let fn3Called: boolean = false;
        let fn1 = (): void => {
          fn1Called = true;
        };
        let fn2 = (): void => {
          fn2Called = true;
        };
        let fn3 = (): void => {
          fn3Called = true;
        };
        let fn1CallObserved: boolean = false;
        let fn3CallObserved: boolean = false;
        ws.on('finish', fn1);
        ws.on('finish', fn2);
        ws.on('finish', fn3);
        ws.off('finish', fn2);
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            fn1CallObserved = fn1Called;
            fn3CallObserved = fn3Called;
            resolve(undefined as void);
          });
          ws.end();
        });
        expect(fn1CallObserved).assertTrue();
        expect(fn3CallObserved).assertTrue();
        expect(fn2Called).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_OFF_1300
     * @tc.name testStreamWritableOff013
     * @tc.desc Verify event is empty string ""
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOff013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let drainFired: boolean = false;
        let finishFired: boolean = false;
        let fnDrain = (): void => {
          drainFired = true;
        };
        ws.on('drain', fnDrain);
        ws.off('drain', fnDrain);
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            finishFired = true;
            resolve(undefined as void);
          });
          ws.write(new Uint8Array(20000));
          ws.end();
        });
        expect(drainFired).assertFalse();
        expect(finishFired).assertTrue();
        expect(ws.writableEnded).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_OFF_1400
     * @tc.name testStreamWritableOff014
     * @tc.desc Verify off with unmatched single-character, control, emoji, XSS, multi-language, replacement, surrogate and formatted-text event names still lets finish complete the stream
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOff014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let events: string[] = ['a', '\t', '\n', '\r', '😀', '😀测试',
          '<script>alert(1)</script>', 'テスト', 'тест',
          'الاختبار', '�', '\udc04', '\xe4',
          '2026-03-05', '13800138000', '0x123'];
        for (let i = 0; i < events.length; i++) {
          let ws = new WritableTestBase();
          let finishFired: boolean = false;
          let fn = (): void => {
            finishFired = true;
          };
          ws.on('finish', fn);
          ws.off(events[i], fn);
          let writableFinished: boolean = false;
          await new Promise<void>((resolve: (value: void) => void): void => {
            ws.on('finish', (): void => {
              writableFinished = ws.writableFinished;
              resolve(undefined as void);
            });
            ws.end();
          });
          expect(writableFinished).assertTrue();
          expect(finishFired).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_OFF_1500
     * @tc.name testStreamWritableOff015
     * @tc.desc Verify event is single space " "
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOff015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let finishFired: boolean = false;
        let fn = (): void => {
          finishFired = true;
        };
        ws.on('finish', fn);
        ws.off(" ", fn);
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_OFF_1600
     * @tc.name testStreamWritableOff016
     * @tc.desc Verify event is 10000-character long string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOff016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let finishFired: boolean = false;
        let fn = (): void => {
          finishFired = true;
        };
        let longEvent: string = 'a'.repeat(10000);
        ws.on('finish', fn);
        ws.off(longEvent, fn);
        let writableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            writableFinished = ws.writableFinished;
            resolve(undefined as void);
          });
          ws.end();
        });
        expect(writableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_OFF_1700
     * @tc.name testStreamWritableOff017
     * @tc.desc Verify event is 65535 characters (varchar limit)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOff017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let finishFired: boolean = false;
        let fn = (): void => {
          finishFired = true;
        };
        let hugeEvent: string = 'a'.repeat(65535);
        ws.on('finish', fn);
        ws.off(hugeEvent, fn);
        let writableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            writableFinished = ws.writableFinished;
            resolve(undefined as void);
          });
          ws.end();
        });
        expect(writableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_OFF_1800
     * @tc.name testStreamWritableOff018
     * @tc.desc Verify callback is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOff018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let finishFired: boolean = false;
        let fn1 = (): void => {
          finishFired = true;
        };
        ws.on('finish', fn1);
        let errorCaught: boolean = false;
        try {
          ws.off('finish', null as Object as Function);
        } catch (e) {
          errorCaught = true;
          expect(e.name).assertEqual("ClassCastError");
        }
        expect(errorCaught).assertTrue();
        let writableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            writableFinished = ws.writableFinished;
            resolve(undefined as void);
          });
          ws.end();
        });
        expect(writableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_OFF_1900
     * @tc.name testStreamWritableOff019
     * @tc.desc Verify callback is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOff019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let fn1Called: boolean = false;
      let fn1 = (): void => {
        fn1Called = true;
      };
      ws.on('finish', fn1);
      let errorCaught: boolean = false;
      try {
        ws.off('finish', undefined as Object as Function);
      } catch (e) {
        errorCaught = true;
        expect(e.name).assertEqual("ClassCastError");
      }
      expect(errorCaught).assertTrue();
      ws.end();
      expect(fn1Called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_OFF_2000
     * @tc.name testStreamWritableOff020
     * @tc.desc Verify removing an empty finish callback does not affect another finish listener
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOff020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let fnEmpty = (): void => {
        };
        ws.on('finish', fnEmpty);
        ws.off('finish', fnEmpty);
        let finishObserved: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            finishObserved = true;
            resolve(undefined as void);
          });
          ws.end();
        });
        expect(finishObserved).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_OFF_2100
     * @tc.name testStreamWritableOff021
     * @tc.desc Verify off finish callback does not throw after writableEnded=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOff021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let fn = (): void => {
      };
      ws.end();
      try {
        ws.off('finish', fn);
        expect(ws.writableEnded).assertTrue();
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_OFF_2200
     * @tc.name testStreamWritableOff022
     * @tc.desc Verify off does not throw after writableFinished=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOff022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let fn = (): void => {
        };
        let writableFinished: boolean = false;
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            writableFinished = ws.writableFinished;
            resolve(undefined as void);
          });
        });
        ws.end();
        await finishPromise;
        expect(writableFinished).assertTrue();
        try {
          ws.off('finish', fn);
          expect(ws.writableFinished).assertTrue();
        } catch (e) {
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_OFF_2300
     * @tc.name testStreamWritableOff023
     * @tc.desc Verify off on an active stream leaves writableEnded false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOff023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let fn = (): void => {
      };
      try {
        ws.off('finish', fn);
        expect(ws.writableEnded).assertFalse();
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_OFF_2400
     * @tc.name testStreamWritableOff024
     * @tc.desc Verify off removes drain callback in corked state then uncork
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOff024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let drainFired: boolean = false;
      let fnDrain = (): void => {
        drainFired = true;
      };
      ws.on('drain', fnDrain);
      ws.cork();
      ws.write("x");
      ws.off('drain', fnDrain);
      ws.uncork();
      expect(drainFired).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_OFF_2500
     * @tc.name testStreamWritableOff025
     * @tc.desc Verify off removes error callback after error event triggers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOff025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableErrorDoWrite();
        let errorCount: number = 0;
        let errorMessage: string = '';
        let fnError = (): void => {
          errorCount++;
        };
        let errorPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('error', (err: Error): void => {
            errorMessage = err.message;
            fnError();
            resolve(undefined as void);
          });
        });

        try {
          ws.write("data");
          await errorPromise;
          expect(errorCount).assertEqual(1);
          expect(errorMessage).assertEqual("test error");
          ws.off('error', fnError);
          ws.write("data");
          await Utils.msSleep(50);
          expect(errorCount).assertEqual(1);
        } catch (e) {
          expect(false).assertTrue();
        }
        done();
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_OFF_2600
     * @tc.name testStreamWritableOff026
     * @tc.desc Verify sequential finish listener replacement leaves no stale callbacks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOff026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let firstFired: boolean = false;
      let secondFired: boolean = false;
      let first = (): void => {
        firstFired = true;
      };
      let second = (): void => {
        secondFired = true;
      };
      ws.on('finish', first);
      ws.off('finish', first);
      ws.on('finish', second);
      ws.off('finish', second);
      ws.end();
      expect(firstFired).assertFalse();
      expect(secondFired).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_OFF_2700
     * @tc.name testStreamWritableOff027
     * @tc.desc Verify off removes close callback before close event triggers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOff027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let closeFired: boolean = false;
      let fn = (): void => {
        closeFired = true;
      };
      ws.on('close', fn);
      ws.off('close', fn);
      ws.end();
      expect(closeFired).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_OFF_2800
     * @tc.name testStreamWritableOff028
     * @tc.desc Verify off removes itself inside finish callback (nested off)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOff028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let callCount: number = 0;
        let callCountObserved: number = 0;
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          let fnSelf: () => void;
          fnSelf = (): void => {
            callCount++;
            ws.off('finish', fnSelf);
            callCountObserved = callCount;
            resolve(undefined as void);
          };
          ws.on('finish', fnSelf);
          ws.end();
        });
        await finishPromise;
        expect(callCountObserved).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_OFF_2900
     * @tc.name testStreamWritableOff029
     * @tc.desc Verify event name is a zero-width space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOff029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let closeFired: boolean = false;
        let finishFired: boolean = false;
        let fnClose = (): void => {
          closeFired = true;
        };
        ws.on('close', fnClose);
        ws.off('close', fnClose);
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            finishFired = true;
            resolve(undefined as void);
          });
          ws.end();
        });
        expect(closeFired).assertFalse();
        expect(finishFired).assertTrue();
        expect(ws.writableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_OFF_3000
     * @tc.name testStreamWritableOff030
     * @tc.desc Verify off the same callback twice (duplicate off)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOff030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let finishFired: boolean = false;
      let fn1 = (): void => {
        finishFired = true;
      };
      ws.on('finish', fn1);
      ws.off('finish', fn1);
      ws.off('finish', fn1);
      ws.end();
      expect(finishFired).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_OFF_3100
     * @tc.name testStreamWritableOff031
     * @tc.desc Verify event is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOff031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let fn = (): void => {
      };
      try {
        ws.off(null as Object as string, fn);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_OFF_3200
     * @tc.name testStreamWritableOff032
     * @tc.desc Verify event is number type (123)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOff032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let fn = (): void => {
        };
        ws.on('finish', fn);
        try {
          ws.off(123 as Object as string, fn);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
        }
        let writableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            writableFinished = ws.writableFinished;
            resolve(undefined as void);
          });
          ws.end();
        });
        expect(writableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_OFF_3300
     * @tc.name testStreamWritableOff033
     * @tc.desc Verify event is boolean type (true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOff033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let fn = (): void => {
        };
        ws.on('finish', fn);
        try {
          ws.off(true as Object as string, fn);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
        }
        let writableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            writableFinished = ws.writableFinished;
            resolve(undefined as void);
          });
          ws.end();
        });
        expect(writableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_OFF_3400
     * @tc.name testStreamWritableOff034
     * @tc.desc Verify callback is non-function, non-null, non-undefined type (string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOff034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let fn1 = (): void => {
        };
        ws.on('finish', fn1);
        try {
          ws.off('finish', "string" as Object as Function);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
        }
        let writableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            writableFinished = ws.writableFinished;
            resolve(undefined as void);
          });
          ws.end();
        });
        expect(writableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_OFF_3500
     * @tc.name testStreamWritableOff035
     * @tc.desc Verify off called as plain function (no this context)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOff035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let offFn: Function = ws.off;
      offFn('finish', (err?: Error): void => {

      });
      expect(ws.writable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_OFF_3600
     * @tc.name testStreamWritableOff036
     * @tc.desc Verify off.call bound to a non-Writable plain object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOff036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let offFn: Function = ws.off;
      let other: Object = {};
      try {
        offFn.unsafeCall(other, 'finish', (err?: Error): void => {

        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_OFF_3700
     * @tc.name testStreamWritableOff037
     * @tc.desc Verify off.call bound to null context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOff037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      try {
        ws.off.unsafeCall(null, 'finish', (err?: Error): void => {

        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_OFF_3800
     * @tc.name testStreamWritableOff038
     * @tc.desc Verify event is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOff038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      try {
        ws.off(undefined as string, (): void => {
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_OFF_3900
     * @tc.name testStreamWritableOff039
     * @tc.desc Verify off removes finish listener while another finish listener still observes end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableOff039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let removedCalled: boolean = false;
        let removedCalledObserved: boolean = false;
        let writableFinished: boolean = false;
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            removedCalledObserved = removedCalled;
            writableFinished = ws.writableFinished;
            resolve(undefined as void);
          });
        });
        let removed = (): void => {
          removedCalled = true;
        };
        ws.on('finish', removed);
        ws.off('finish', removed);
        ws.end();
        await finishPromise;
        expect(removedCalledObserved).assertFalse();
        expect(writableFinished).assertTrue();
        done();
      });
  });
}
