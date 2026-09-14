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
import { stream } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';

class OffTestTransform extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    this.push(chunk);
    callback.unsafeCall();
  }

  doFlush(callback: Function): void {
    callback.unsafeCall();
  }
}

class OffErrorTransform extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    callback.unsafeCall(new Error('transform error'));
  }
}

let regularListenerCalled: boolean = false;

function regularDataListener(): void {
  regularListenerCalled = true;
}

export default function StreamTransformOffTest(): void {
  describe('StreamTransformOffTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_OFF_0100
     * @tc.name testStreamTransformOff001
     * @tc.desc Verify off(data) without callback removes all data listeners
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOff001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new OffTestTransform();
      let fn1Called: boolean = false;
      let fn2Called: boolean = false;
      transform.on('data', (): void => {
        fn1Called = true;
      });
      transform.on('data', (): void => {
        fn2Called = true;
      });
      transform.off('data');
      transform.write('x', 'utf8');
      expect(fn1Called).assertFalse();
      expect(fn2Called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_OFF_0200
     * @tc.name testStreamTransformOff002
     * @tc.desc Verify off for all event types works without error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOff002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new OffTestTransform();
      let code: int = 0;
      try {
        transform.off('data');
        transform.off('drain');
        transform.off('finish');
        transform.off('error');
        transform.off('close');
        transform.off('readable');
        transform.off('pipe');
        transform.off('unpipe');
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        code = e.code;
      }
      expect(code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_OFF_0300
     * @tc.name testStreamTransformOff003
     * @tc.desc Verify off unregistered event does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOff003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new OffTestTransform();
      let code: int = 0;
      try {
        transform.off('data', (): void => {
        });
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        code = e.code;
      }
      expect(code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_OFF_0400
     * @tc.name testStreamTransformOff004
     * @tc.desc Verify off finish listener prevents finish callback on end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOff004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new OffTestTransform();
      let finishCalled: boolean = false;
      let fn = (): void => {
        finishCalled = true;
      };
      transform.on('finish', fn);
      transform.off('finish', fn);
      transform.end();
      expect(finishCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_OFF_0500
     * @tc.name testStreamTransformOff005
     * @tc.desc Verify off removes arrow function listener
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOff005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new OffTestTransform();
      let called: boolean = false;
      let fn = (): void => {
        called = true;
      };
      transform.on('data', fn);
      transform.off('data', fn);
      transform.write('x', 'utf8');
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_OFF_0600
     * @tc.name testStreamTransformOff006
     * @tc.desc Verify off removes function declaration listener
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOff006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new OffTestTransform();
      regularListenerCalled = false;
      transform.on('data', regularDataListener);
      transform.off('data', regularDataListener);
      transform.write('x', 'utf8');
      expect(regularListenerCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_OFF_0700
     * @tc.name testStreamTransformOff007
     * @tc.desc Verify off with empty event name does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOff007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new OffTestTransform();
      let code: int = 0;
      try {
        transform.off('', (): void => {
        });
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        code = e.code;
      }
      expect(code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_OFF_0800
     * @tc.name testStreamTransformOff008
     * @tc.desc Verify off with nonexistent event name does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOff008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new OffTestTransform();
      let code: int = 0;
      try {
        transform.off('nonexistent', (): void => {
        });
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        code = e.code;
      }
      expect(code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_OFF_0900
     * @tc.name testStreamTransformOff009
     * @tc.desc Verify multiple off calls on same event do not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOff009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new OffTestTransform();
      let fn = (): void => {
      };
      transform.on('data', fn);
      transform.off('data', fn);
      let code: int = 0;
      try {
        transform.off('data', fn);
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        code = e.code;
      }
      expect(code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_OFF_1000
     * @tc.name testStreamTransformOff010
     * @tc.desc Verify off removes an error listener before doTransform emits an error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOff010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new OffErrorTransform();
      let errorCalled: boolean = false;
      let fn = (): void => {
        errorCalled = true;
      };
      transform.on('error', fn);
      transform.off('error', fn);
      transform.write('x', 'utf8');
      expect(errorCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_OFF_1100
     * @tc.name testStreamTransformOff011
     * @tc.desc Verify off drain then backpressure does not trigger drain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOff011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new OffTestTransform();
      let drainCalled: boolean = false;
      let fn = (): void => {
        drainCalled = true;
      };
      transform.on('drain', fn);
      transform.off('drain', fn);
      let largeData: string = '';
      for (let i: int = 0; i < 20000; i++) {
        largeData += 'x';
      }
      transform.write(largeData);
      expect(drainCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_OFF_1200
     * @tc.name testStreamTransformOff012
     * @tc.desc Verify off removes data listeners while end completion still succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOff012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new OffTestTransform();
        let dataCalled: boolean = false;
        transform.on('data', (): void => {
          dataCalled = true;
        });
        transform.off('data');
        transform.resume();
        try {
          await new Promise<void>((resolve: (value: void) => void, reject: (err: Error) => void): void => {
            transform.write('x', 'utf8');
            transform.end('end', 'utf8', (err?: Error): void => {
              if (err !== undefined) {
                reject(err);
                return;
              }
              resolve(undefined as void);
            });
          });
          expect(dataCalled).assertFalse();
        } catch (e) {
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_OFF_1300
     * @tc.name testStreamTransformOff013
     * @tc.desc Verify off removes the pipe listener before pipe is established
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOff013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new OffTestTransform();
      let writable = new stream.Writable();
      let pipeCalled: boolean = false;
      transform.on('pipe', (): void => {
        pipeCalled = true;
      });
      transform.off('pipe');
      transform.pipe(writable);
      expect(pipeCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_OFF_1400
     * @tc.name testStreamTransformOff014
     * @tc.desc Verify off with null and undefined callback throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOff014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t1 = new OffTestTransform();
      try {
        t1.off("data", null as Object as Function);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      let t2 = new OffTestTransform();
      try {
        t2.off("data", undefined as Object as Function);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_OFF_1500
     * @tc.name testStreamTransformOff015
     * @tc.desc Verify off removes every registration of the same data callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOff015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new OffTestTransform();
      let callCount: int = 0;
      let fn = (): void => {
        callCount++;
      };
      transform.on('data', fn);
      transform.on('data', fn);
      transform.off('data', fn);
      transform.write('x', 'utf8');
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_OFF_1600
     * @tc.name testStreamTransformOff016
     * @tc.desc Verify off removes a data listener across pause and resume
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOff016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new OffTestTransform();
      let called: boolean = false;
      let listener = (): void => {
        called = true;
      };
      transform.on('data', listener);
      transform.pause();
      transform.off('data', listener);
      transform.resume();
      transform.write('removed after resume', 'utf8');
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_OFF_1700
     * @tc.name testStreamTransformOff017
     * @tc.desc Verify off data without listener does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOff017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new OffTestTransform();
      let errorCode: int = 0;
      try {
        transform.off('data');
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        errorCode = e.code;
      }
      expect(errorCode).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_OFF_1800
     * @tc.name testStreamTransformOff018
     * @tc.desc Verify off end listener prevents end callback on push(null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOff018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new OffTestTransform();
      let endCalled: boolean = false;
      let listener = (): void => {
        endCalled = true;
      };
      transform.on('end', listener);
      transform.off('end', listener);
      transform.push(null);
      expect(endCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_OFF_1900
     * @tc.name testStreamTransformOff019
     * @tc.desc Verify off close listener prevents close callback after end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOff019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new OffTestTransform();
      let closeCalled: boolean = false;
      let listener = (): void => {
        closeCalled = true;
      };
      transform.on('close', listener);
      transform.off('close', listener);
      transform.end();
      expect(closeCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_OFF_2000
     * @tc.name testStreamTransformOff020
     * @tc.desc Verify off readable listener prevents readable callback on write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOff020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new OffTestTransform();
      let readableCalled: boolean = false;
      let listener = (): void => {
        readableCalled = true;
      };
      transform.on('readable', listener);
      transform.off('readable', listener);
      transform.write('hello', 'utf8');
      expect(readableCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_OFF_2100
     * @tc.name testStreamTransformOff021
     * @tc.desc Verify off drain listener prevents drain callback on backpressure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOff021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new OffTestTransform();
      let drainCalled: boolean = false;
      let listener = (): void => {
        drainCalled = true;
      };
      transform.on('drain', listener);
      transform.off('drain', listener);
      transform.write(new Uint8Array(20000), 'utf8');
      expect(drainCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_OFF_2200
     * @tc.name testStreamTransformOff022
     * @tc.desc Verify off pipe listener prevents pipe callback on pipe()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOff022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new OffTestTransform();
      let pipeCalled: boolean = false;
      let listener = (): void => {
        pipeCalled = true;
      };
      transform.on('pipe', listener);
      transform.off('pipe', listener);
      let ws: stream.Writable = new stream.Writable();
      transform.pipe(ws);
      expect(pipeCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_OFF_2300
     * @tc.name testStreamTransformOff023
     * @tc.desc Verify off unpipe listener prevents unpipe callback on unpipe()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOff023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new OffTestTransform();
      let unpipeCalled: boolean = false;
      let listener = (): void => {
        unpipeCalled = true;
      };
      transform.on('unpipe', listener);
      transform.off('unpipe', listener);
      let ws: stream.Writable = new stream.Writable();
      transform.pipe(ws);
      transform.unpipe(ws);
      expect(unpipeCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_OFF_2400
     * @tc.name testStreamTransformOff024
     * @tc.desc Verify off pause listener prevents pause callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOff024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new OffTestTransform();
      let pauseCalled: boolean = false;
      let listener = (): void => {
        pauseCalled = true;
      };
      transform.on('pause', listener);
      transform.off('pause', listener);
      transform.pause();
      expect(pauseCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_OFF_2500
     * @tc.name testStreamTransformOff025
     * @tc.desc Verify off resume listener prevents resume callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOff025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new OffTestTransform();
      let resumeCalled: boolean = false;
      let listener = (): void => {
        resumeCalled = true;
      };
      transform.on('resume', listener);
      transform.off('resume', listener);
      transform.pause();
      transform.resume();
      expect(resumeCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_OFF_2600
     * @tc.name testStreamTransformOff026
     * @tc.desc Verify off two different listeners removes both targeted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOff026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new OffTestTransform();
      let call1: boolean = false;
      let call2: boolean = false;
      let listener1 = (): void => {
        call1 = true;
      };
      let listener2 = (): void => {
        call2 = true;
      };
      transform.on('data', listener1);
      transform.on('data', listener2);
      transform.off('data', listener1);
      transform.off('data', listener2);
      transform.write('hello', 'utf8');
      expect(call1).assertFalse();
      expect(call2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_OFF_2700
     * @tc.name testStreamTransformOff027
     * @tc.desc Verify off with whitespace event name does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOff027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new OffTestTransform();
      let errorCode: int = 0;
      try {
        transform.off('  ', (): void => {
        });
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        errorCode = e.code;
      }
      expect(errorCode).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_OFF_2800
     * @tc.name testStreamTransformOff028
     * @tc.desc Verify off data listener keeps finish listener active
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOff028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new OffTestTransform();
        let finishCalled: boolean = false;
        let dataListener = (): void => {
        };
        transform.on('data', dataListener);
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('finish', (): void => {
            finishCalled = true;
            resolve(undefined as void);
          });
          transform.off('data', dataListener);
          transform.end();
        });
        expect(finishCalled).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_OFF_2900
     * @tc.name testStreamTransformOff029
     * @tc.desc Verify off finish listener keeps data listener active
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOff029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new OffTestTransform();
        let dataCalled: boolean = false;
        let finishListener = (): void => {
        };
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('data', (): void => {
            dataCalled = true;
            resolve(undefined as void);
          });
          transform.on('finish', finishListener);
          transform.off('finish', finishListener);
          transform.write('hello', 'utf8');
        });
        expect(dataCalled).assertTrue();

        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_OFF_3000
     * @tc.name testStreamTransformOff030
     * @tc.desc Verify off removes a registered data listener without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOff030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new OffTestTransform();
      let listener = (): void => {
      };
      transform.on('data', listener);
      let code: int = 0;
      try {
        transform.off('data', listener);
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        code = e.code;
      }
      expect(code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_OFF_3100
     * @tc.name testStreamTransformOff031
     * @tc.desc Verify off does not affect isPaused, readable state or writable state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOff031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new OffTestTransform();
      transform.off("data", (): void => {
      });
      expect(transform.isPaused()).assertFalse();
      expect(transform.readable).assertTrue();
      expect(transform.readableEnded).assertFalse();
      expect(transform.readableLength).assertEqual(0);
      expect(transform.writable).assertTrue();
      expect(transform.writableEnded).assertFalse();
      expect(transform.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_OFF_3200
     * @tc.name testStreamTransformOff032
     * @tc.desc Verify off with numeric-string event name does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformOff032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new OffTestTransform();
      let errorCode: int = 0;
      try {
        transform.off('123', (): void => {
        });
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        errorCode = e.code;
      }
      expect(errorCode).assertEqual(0);
    });

  });
}
