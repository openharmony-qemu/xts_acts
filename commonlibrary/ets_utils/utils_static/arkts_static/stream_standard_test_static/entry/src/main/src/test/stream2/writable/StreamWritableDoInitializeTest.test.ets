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

class InitTracker extends WritableTestBase {
  public static initCalled: boolean = false;
  public static initCount: number = 0;

  doInitialize(callback: Function): void {
    InitTracker.initCalled = true;
    InitTracker.initCount++;
    callback.unsafeCall();
  }
}

class ArrowInit extends WritableTestBase {
  doInitialize(callback: Function): void {
    let fn = (cb: Function): void => {
      cb.unsafeCall();
    };
    fn(callback);
  }
}

class FuncExprInit extends WritableTestBase {
  public static initDone: boolean = false;

  doInitialize(callback: Function): void {
    let fn = (cb: Function): void => {
      cb.unsafeCall();
    };
    fn(callback);
    FuncExprInit.initDone = true;
  }
}

class SuperChainInit extends WritableTestBase {
  public static chainDone: boolean = false;

  doInitialize(callback: Function): void {
    super.doInitialize(callback);
    SuperChainInit.chainDone = true;
  }
}

class HangInit extends WritableTestBase {
  doInitialize(callback: Function): void {
  }
}

class MultiFlagInit extends WritableTestBase {
  public static flag: string = '';

  doInitialize(callback: Function): void {
    MultiFlagInit.flag = 'init';
    callback.unsafeCall();
  }
}

class DelayedInit extends WritableTestBase {
  doInitialize(callback: Function): void {
    setTimeout((): void => {
      callback.unsafeCall();
    }, 100);
  }
}

class TypedArrowInit extends WritableTestBase {
  doInitialize(callback: Function): void {
    let fn = (cb: Function): void => {
      cb.unsafeCall();
    };
    fn(callback);
  }
}

class NamedFnInit extends WritableTestBase {
  doInitialize(callback: Function): void {
    let initCb = (cb: Function): void => {
      cb.unsafeCall();
    };
    initCb(callback);
  }
}

class AsyncInit extends WritableTestBase {
  doInitialize(callback: Function): void {
    callback.unsafeCall();
  }
}

class MultiParamInit extends WritableTestBase {
  doInitialize(callback: Function): void {
    let fn = (a: Function, b: int, c: string): void => {
      a.unsafeCall();
    };
    fn(callback, 1, "x");
  }
}

class HeavyInit extends WritableTestBase {
  public static heavyDone: boolean = false;

  doInitialize(callback: Function): void {
    for (let i: int = 0; i < 100; i++) {
      let x: int = i * 2;
    }
    HeavyInit.heavyDone = true;
    callback.unsafeCall();
  }
}

class NullInit extends WritableTestBase {
  doInitialize(callback: Function): void {
    callback.unsafeCall(null);
  }
}

class UndefinedInit extends WritableTestBase {
  doInitialize(callback: Function): void {
    callback.unsafeCall(undefined);
  }
}

class GeneratorInit extends WritableTestBase {
  doInitialize(callback: Function): void {
    callback.unsafeCall();
  }
}

class BindInit extends WritableTestBase {
  doInitialize(callback: Function): void {
    callback.unsafeCall();
  }
}

class ThrowInit extends WritableTestBase {
  doInitialize(callback: Function): void {
    throw new Error('init crash');
  }
}

class ThrowStringInit extends WritableTestBase {
  doInitialize(callback: Function): void {
    throw new Error('string_error');
  }
}

class CbThenThrowInit extends WritableTestBase {
  doInitialize(callback: Function): void {
    callback.unsafeCall();
    throw new Error('post callback error');
  }
}

export default function StreamWritableDoInitializeTest(): void {
  describe('StreamWritableDoInitializeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_INITIALIZE_0100
     * @tc.name testStreamWritableDoInitialize001
     * @tc.desc Verify doInitialize is automatically called during construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoInitialize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        InitTracker.initCalled = false;
        let ws = new InitTracker();
        let initCalled: boolean = false;
        let writable: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.write("test", "utf8", (): void => {
            initCalled = InitTracker.initCalled;
            writable = ws.writable;
            resolve(undefined as void);
          });
        });
        expect(initCalled).assertTrue();
        expect(writable).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_INITIALIZE_0200
     * @tc.name testStreamWritableDoInitialize002
     * @tc.desc Verify arrow, typed arrow, named, async, multi-parameter, generator and bind callback forms in doInitialize all complete construction so write succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoInitialize002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let streams: WritableTestBase[] = [new ArrowInit(), new TypedArrowInit(), new NamedFnInit(),
        new AsyncInit(), new MultiParamInit(), new GeneratorInit(), new BindInit()];
      for (let i = 0; i < streams.length; i++) {
        let result = streams[i].write("test");
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_INITIALIZE_0300
     * @tc.name testStreamWritableDoInitialize003
     * @tc.desc Verify function expression implements normal callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoInitialize003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        FuncExprInit.initDone = false;
        let ws = new FuncExprInit();
        let initDone: boolean = false;
        let writableEnded: boolean = false;
        let writableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.write("test", "utf8", (): void => {
            initDone = FuncExprInit.initDone;
            writableEnded = ws.writableEnded;
            writableFinished = ws.writableFinished;
            resolve(undefined as void);
          });
        });
        expect(initDone).assertTrue();
        expect(writableEnded).assertFalse();
        expect(writableFinished).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_INITIALIZE_0400
     * @tc.name testStreamWritableDoInitialize004
     * @tc.desc Verify super.doInitialize call chain propagation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoInitialize004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        SuperChainInit.chainDone = false;
        let ws = new SuperChainInit();
        let firstDone: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.write("test", "utf8", (): void => {
            firstDone = SuperChainInit.chainDone;
            resolve(undefined as void);
          });
        });
        expect(firstDone).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_INITIALIZE_0500
     * @tc.name testStreamWritableDoInitialize005
     * @tc.desc Verify not calling callback causes construction to hang
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoInitialize005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new HangInit();
      ws.write("test");
      expect(ws.dataChunk).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_INITIALIZE_0600
     * @tc.name testStreamWritableDoInitialize006
     * @tc.desc Verify default handling when doInitialize is not implemented
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoInitialize006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let result = ws.write("test");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_INITIALIZE_0700
     * @tc.name testStreamWritableDoInitialize007
     * @tc.desc Verify multiple instances initialize independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoInitialize007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        MultiFlagInit.flag = '';
        let ws1 = new MultiFlagInit();
        let ws2 = new MultiFlagInit();
        let flag1: string = '';
        let chunk1: string = '';
        let flag2: string = '';
        let chunk2: string = '';
        try {
          await new Promise<void>((resolve: (value: void) => void, reject: (err: Error) => void): void => {
            ws1.write("test", "utf8", (err?: Error): void => {
              if (err !== undefined) {
                reject(err);
                return;
              }
              flag1 = MultiFlagInit.flag;
              ws1.dataChunk = 'a';
              chunk1 = ws1.dataChunk as string;
              ws2.write("test", "utf8", (err?: Error): void => {
                if (err !== undefined) {
                  reject(err);
                  return;
                }
                flag2 = MultiFlagInit.flag;
                ws2.dataChunk = 'b';
                chunk2 = ws2.dataChunk as string;
                resolve(undefined as void);
              });
            });
          });
          expect(flag1).assertEqual('init');
          expect(chunk1).assertEqual('a');
          expect(flag2).assertEqual('init');
          expect(chunk2).assertEqual('b');
        } catch (e) {
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_INITIALIZE_0800
     * @tc.name testStreamWritableDoInitialize008
     * @tc.desc Verify delayed asynchronous callback invocation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoInitialize008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new DelayedInit();
        let dataChunk: string = '';
        try {
          await new Promise<void>((resolve: (value: void) => void, reject: (err: Error) => void): void => {
            ws.write("test", "utf8", (err?: Error): void => {
              if (err !== undefined) {
                reject(err);
                return;
              }
              dataChunk = ws.dataChunk as string;
              resolve(undefined as void);
            });
          });
          expect(dataChunk).assertEqual('test');
        } catch (e) {
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_INITIALIZE_0900
     * @tc.name testStreamWritableDoInitialize009
     * @tc.desc Verify minimal implementation with empty function body
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoInitialize009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      InitTracker.initCalled = false;
      let ws = new InitTracker();
      let result = ws.write("test");
      expect(result).assertTrue();
      expect(InitTracker.initCalled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_INITIALIZE_1000
     * @tc.name testStreamWritableDoInitialize010
     * @tc.desc Verify doInitialize runs once during construction and not during write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoInitialize010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      InitTracker.initCount = 0;
      let ws = new InitTracker();
      expect(InitTracker.initCount).assertEqual(1);
      let result = ws.write("test");
      expect(result).assertTrue();
      expect(InitTracker.initCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_INITIALIZE_1100
     * @tc.name testStreamWritableDoInitialize011
     * @tc.desc Verify callback is a strictly single-parameter function passed by the system
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoInitialize011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        InitTracker.initCalled = false;
        let ws = new InitTracker();
        let initCalled: boolean = false;
        let dataChunk: string = '';
        try {
          await new Promise<void>((resolve: (value: void) => void, reject: (err: Error) => void): void => {
            ws.write("test", "utf8", (err?: Error): void => {
              if (err !== undefined) {
                reject(err);
                return;
              }
              initCalled = InitTracker.initCalled;
              dataChunk = ws.dataChunk as string;
              resolve(undefined as void);
            });
          });
          expect(initCalled).assertTrue();
          expect(dataChunk).assertEqual('test');
        } catch (e) {
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_INITIALIZE_1200
     * @tc.name testStreamWritableDoInitialize012
     * @tc.desc Verify heavy initialization logic inside doInitialize then callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoInitialize012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        HeavyInit.heavyDone = false;
        let ws = new HeavyInit();
        let heavyDone: boolean = false;
        let dataChunk: string = '';
        try {
          await new Promise<void>((resolve: (value: void) => void, reject: (err: Error) => void): void => {
            ws.write("test", "utf8", (err?: Error): void => {
              if (err !== undefined) {
                reject(err);
                return;
              }
              heavyDone = HeavyInit.heavyDone;
              dataChunk = ws.dataChunk as string;
              resolve(undefined as void);
            });
          });
          expect(heavyDone).assertTrue();
          expect(dataChunk).assertEqual('test');
        } catch (e) {
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_INITIALIZE_1300
     * @tc.name testStreamWritableDoInitialize013
     * @tc.desc Verify end before doInitialize completes still marks writableEnded true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoInitialize013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new HangInit();
      ws.end();
      expect(ws.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_INITIALIZE_1400
     * @tc.name testStreamWritableDoInitialize014
     * @tc.desc Verify writable stays true while doInitialize has not completed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoInitialize014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new HangInit();
      expect(ws.writable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_INITIALIZE_1500
     * @tc.name testStreamWritableDoInitialize015
     * @tc.desc Verify calling cork before initialization completes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoInitialize015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new HangInit();
      ws.cork();
      ws.write("x");
      expect(ws.writableCorked).assertEqual(1);
      expect(ws.dataChunk).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_INITIALIZE_1600
     * @tc.name testStreamWritableDoInitialize016
     * @tc.desc Verify end the stream immediately after callback is invoked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoInitialize016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new InitTracker();
      ws.end("final");
      expect(ws.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_INITIALIZE_1700
     * @tc.name testStreamWritableDoInitialize017
     * @tc.desc Verify passing null or undefined to the doInitialize callback carries no error semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoInitialize017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let streams: WritableTestBase[] = [new NullInit(), new UndefinedInit()];
      for (let i = 0; i < streams.length; i++) {
        let result = streams[i].write("test");
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_INITIALIZE_1800
     * @tc.name testStreamWritableDoInitialize018
     * @tc.desc Verify doInitialize throws an Error exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoInitialize018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let ws = new ThrowInit();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_INITIALIZE_1900
     * @tc.name testStreamWritableDoInitialize019
     * @tc.desc Verify doInitialize throws a non-Error type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoInitialize019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let ws = new ThrowStringInit();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_INITIALIZE_2000
     * @tc.name testStreamWritableDoInitialize020
     * @tc.desc Verify throw exception after calling callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoInitialize020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let ws = new CbThenThrowInit();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_INITIALIZE_2100
     * @tc.name testStreamWritableDoInitialize021
     * @tc.desc Verify delayed doInitialize completion gates write and finish until its callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoInitialize021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new DelayedInit();
        let writeFinished: boolean = false;
        let capturedFinished: boolean = false;
        let capturedWriteFinished: boolean = false;
        let writeReject: (reason: Error) => void = (reason: Error): void => {
        };
        let finishPromise = new Promise<void>((resolve: (value: void) => void,
          reject: (reason: Error) => void): void => {
          writeReject = reject;
          ws.on('finish', (): void => {
            capturedFinished = ws.writableFinished;
            capturedWriteFinished = writeFinished;
            resolve(undefined as void);
          });
          ws.write('delayed', 'utf8', (err?: Error): void => {
            writeFinished = true;
            if (err !== undefined) {
              writeReject(err);
              return;
            }
          });
        });
        ws.end();
        try {
          await finishPromise;
          expect(capturedFinished).assertTrue();
          expect(capturedWriteFinished).assertTrue();
        } catch (e) {
          expect(false).assertTrue();
        }
        done();
      });
  });
}
