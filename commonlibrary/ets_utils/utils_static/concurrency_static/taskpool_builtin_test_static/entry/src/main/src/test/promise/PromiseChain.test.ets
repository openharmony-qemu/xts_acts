'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '../../../../hypium/index';
import Utils, { sleep } from '../Utils.test';
import defaultExportedPromise, {
  exportedPromiseFunc,
  exportedPromiseArrow,
  exportedPromiseWithGetterSetter,
  ExportedPromiseClass,
  ExportedMultiplePromiseClass
} from './promiseExportModule';
import { PromiseNamespace } from './promiseNamespaceModule';
import {
  PromiseInterface,
  AbstractPromiseClass,
  PromiseInterfaceImpl,
  AbstractPromiseImpl
} from './promiseInterfaceModule';
import {
  SendablePromiseClass,
  sendablePromiseFunc,
  SendableMultiplePromiseClass
} from './promiseSendableModule';
import {
  taskPoolPromiseFunc,
  taskPoolAsyncPromise,
  taskPoolPromiseChain,
  taskPoolAsyncChain
} from './promiseTaskPoolModule';

const SLEEP_INTERVAL_MS: int = 100;

interface TestObjectData {
  name: string;
  age: number;
  data: number[];
}

interface CircularObject {
  name: string;
  self?: CircularObject;
}

interface ValueObject {
  value: number;
}

interface Level3Object {
  value: string;
  array: number[];
}

interface Level2Object {
  level3: Level3Object;
}

interface Level1Object {
  level2: Level2Object;
}

interface ComplexNestedObject {
  level1: Level1Object;
}

function step1(value: string): string {
  return value + '-step1';
}

function step2(value: string): string {
  return value + '-step2';
}

function step3(value: string): string {
  console.info('step3: ' + value);
  return value;
}

function errorHandler(error: Error): string {
  return 'recovered';
}

let cleanupExecuted: boolean = false;
let normalFinallyExecuted: boolean = false;

function cleanup(): void {
  cleanupExecuted = true;
  console.info('cleanup executed');
}

function processStep(value: string): string {
  return value + '-named';
}

function normalCatchHandler(error: Error): string {
  return 'recovered';
}

function normalFinallyHandler(): void {
  normalFinallyExecuted = true;
  console.info('finally executed');
}

async function asyncFuncNested(): Promise<string> {
  return 'async result';
}

async function testChainNested(): Promise<string> {
  const result: string = await Promise.resolve<string>('start')
    .then((v: string): string => {
      expect(v).assertEqual('start');
      return v + '1';
    })
    .then((v: string): string => {
      expect(v).assertEqual('start1');
      return v + '2';
    });

  expect(result).assertEqual('start12');
  return result;
}

class CustomError extends Error {
  private _customCode: int = 0;
  get customCode(): int {
    return this._customCode;
  }
  set customCode(val: int) {
    this._customCode = val;
  }
  constructor(message: string, code: int) {
    super(message);
    this.name = 'CustomError';
    this.customCode = code;
  }
}

interface SettledResult {
  status: string;
  value?: Object;
  reason?: Object;
}

export default function promiseChainTest(): void {
  describe('PromiseChainTest', (): void => {
    beforeAll((): void => {
      console.info('beforeAll called');
    });

    beforeEach((): void => { });

    afterEach((): void => {
      console.info('afterEach called');
    });

    afterAll((): void => {
      console.info('afterAll called');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_BASIC_0100
     * @tc.name testPromiseChainStringPass
     * @tc.desc Test Promise chain with string value passing - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainStringPass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testPromiseChainStringPass';
        console.info(`${caseName} test start`);

        await Promise.resolve<string>('start')
          .then((value: string): string => {
            expect(value).assertEqual('start');
            return 'modified';
          })
          .then((value: string): string => {
            expect(value).assertEqual('modified');
            return 'final';
          })
          .then((value: string): void => {
            expect(value).assertEqual('final');
          });

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_BASIC_0200
     * @tc.name testPromiseChainNumberType
     * @tc.desc Test Promise chain with number type conversion - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainNumberType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testPromiseChainNumberType';
        console.info(`${caseName} test start`);

        await Promise.resolve<string>('100')
          .then((value: string): number => {
            expect(value).assertEqual('100');
            return parseInt(value);
          })
          .then((value: number): string => {
            expect(value).assertEqual(100);
            return value.toString();
          })
          .then((value: string): void => {
            expect(value).assertEqual('100');
          });

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_BASIC_0300
     * @tc.name testPromiseChainObjectPass
     * @tc.desc Test Promise chain with object value passing - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainObjectPass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testPromiseChainObjectPass';
        console.info(`${caseName} test start`);

        await Promise.resolve<void>(undefined)
          .then(() => {
            const obj: TestObjectData = { name: 'test', age: 25, data: [1, 2, 3] };
            return obj;
          })
          .then((obj: TestObjectData): string => {
            expect(obj.name).assertEqual('test');
            expect(obj.age).assertEqual(25);
            expect(obj.data.length).assertEqual(3);
            expect(obj.data[0]).assertEqual(1);
            expect(obj.data[1]).assertEqual(2);
            expect(obj.data[2]).assertEqual(3);
            return obj.name;
          })
          .then((value: string): void => {
            expect(value).assertEqual('test');
          });

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_BASIC_0400
     * @tc.name testPromiseChainArrayPass
     * @tc.desc Test Promise chain with array value passing - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainArrayPass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testPromiseChainArrayPass';
        console.info(`${caseName} test start`);

        await Promise.resolve<number>(1)
          .then((value: number): number[] => {
            expect(value).assertEqual(1);
            return [value, value * 2, value * 3];
          })
          .then((arr: number[]): number => {
            expect(arr.length).assertEqual(3);
            expect(arr[0]).assertEqual(1);
            expect(arr[1]).assertEqual(2);
            expect(arr[2]).assertEqual(3);
            return arr[1];
          })
          .then((value: number): void => {
            expect(value).assertEqual(2);
          });

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_BASIC_0500
     * @tc.name testPromiseChainBooleanPass
     * @tc.desc Test Promise chain with boolean value passing - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainBooleanPass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testPromiseChainBooleanPass';
        console.info(`${caseName} test start`);

        await Promise.resolve<number>(10)
          .then((value: number): boolean => {
            expect(value).assertEqual(10);
            return value > 5;
          })
          .then((result: boolean): string => {
            expect(result).assertTrue();
            return result ? 'yes' : 'no';
          })
          .then((value: string): void => {
            expect(value).assertEqual('yes');
          });

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_BASIC_0600
     * @tc.name testPromiseChainReturnUndefined
     * @tc.desc Test Promise chain returning undefined - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainReturnUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testPromiseChainReturnUndefined';
        console.info(`${caseName} test start`);

        await Promise.resolve<string>('value')
          .then((value: string): undefined => {
            expect(value).assertEqual('value');
            return undefined;
          })
          .then((value: undefined): string => {
            console.log(caseName + ": " + value)
            expect(value).assertEqual(undefined);
            return 'after undefined';
          })
          .then((value: string): void => {
            expect(value).assertEqual('after undefined');
          });

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_BASIC_0700
     * @tc.name testPromiseChainReturnNull
     * @tc.desc Test Promise chain returning null - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainReturnNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testPromiseChainReturnNull';
        console.info(`${caseName} test start`);

        await Promise.resolve<string>('value')
          .then((value: string): null => {
            expect(value).assertEqual('value');
            return null;
          })
          .then((value: null): string => {
            expect(value).assertNull();
            return 'after null';
          })
          .then((value: string): void => {
            expect(value).assertEqual('after null');
          });

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_BASIC_0800
     * @tc.name testPromiseChainVoidReturn
     * @tc.desc Test Promise chain with void return (no return statement) - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainVoidReturn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testPromiseChainVoidReturn';
        console.info(`${caseName} test start`);

        await Promise.resolve<string>('value')
          .then((value: string): void => {
            expect(value).assertEqual('value');
          })
          .then(() => {
            return 'after void';
          })
          .then((value: string): void => {
            expect(value).assertEqual('after void');
          });

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_BASIC_0900
     * @tc.name testPromiseChainReturnPromiseResolve
     * @tc.desc Test Promise chain returning Promise.resolve() - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainReturnPromiseResolve', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testPromiseChainReturnPromiseResolve';
        console.info(`${caseName} test start`);

        await Promise.resolve<string>('outer')
          .then((value: string): Promise<string> => {
            expect(value).assertEqual('outer');
            return Promise.resolve('inner');
          })
          .then((value: string): void => {
            expect(value).assertEqual('inner');
          });

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_BASIC_1000
     * @tc.name testPromiseChainReturnPromiseReject
     * @tc.desc Test Promise chain returning Promise.reject() - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainReturnPromiseReject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testPromiseChainReturnPromiseReject';
        console.info(`${caseName} test start`);

        await Promise.resolve<string>('start')
          .then((value: string): Promise<string> => {
            expect(value).assertEqual('start');
            return Promise.reject(new Error('inner error'));
          })
          .then(() => {
            expect().assertFail();
          })
          .catch((error: Error): string => {
            expect(error instanceof Error).assertTrue();
            return 'recovered';
          })
          .then((value: string | void): void => {
            expect(value).assertEqual('recovered');
          });

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_BASIC_1100
     * @tc.name testPromiseChainReturnPendingPromise
     * @tc.desc Test Promise chain returning pending Promise - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainReturnPendingPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testPromiseChainReturnPendingPromise';
        console.info(`${caseName} test start`);

        await Promise.resolve<string>('start')
          .then((value: string): Promise<string> => {
            expect(value).assertEqual('start');
            return new Promise<string>((resolve: (value: string) => void) => {
              setTimeout(() => {
                resolve('delayed');
              }, 500);
            });
          })
          .then((value: string): void => {
            expect(value).assertEqual('delayed');
          });

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_BASIC_1200
     * @tc.name testPromiseChainThrowError
     * @tc.desc Test Promise chain throwing Error - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainThrowError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testPromiseChainThrowError';
        console.info(`${caseName} test start`);

        await Promise.resolve<string>('start')
          .then((value: string): string => {
            expect(value).assertEqual('start');
            throw new Error('thrown error');
          })
          .then(() => {
            expect().assertFail();
          })
          .catch((error: Error): string => {
            expect(error instanceof Error).assertTrue();
            return 'recovered';
          })
          .then((value: string | void): void => {
            expect(value).assertEqual('recovered');
          });

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_BASIC_1300
     * @tc.name testPromiseChainEmptyString
     * @tc.desc Test Promise chain returning empty string - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainEmptyString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testPromiseChainEmptyString';
        console.info(`${caseName} test start`);

        await Promise.resolve<string>('start')
          .then((value: string): string => {
            expect(value).assertEqual('start');
            return '';
          })
          .then((value: string): void => {
            expect(value).assertEqual('');
            expect(value.length).assertEqual(0);
          });

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_BASIC_1400
     * @tc.name testPromiseChainEmptyObject
     * @tc.desc Test Promise chain returning empty object - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainEmptyObject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testPromiseChainEmptyObject';
        console.info(`${caseName} test start`);

        await Promise.resolve<void>(undefined)
          .then(() => {
            const emptyObj: Record<string, Object> = {};
            return emptyObj;
          })
          .then((obj: Record<string, Object>): void => {
            expect(Object.keys(obj).length).assertEqual(0);
          });

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_BASIC_1500
     * @tc.name testPromiseChainEmptyArray
     * @tc.desc Test Promise chain returning empty array - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainEmptyArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testPromiseChainEmptyArray';
        console.info(`${caseName} test start`);

        await Promise.resolve<void>(undefined)
          .then(() => {
            const emptyArr: Object[] = [];
            return emptyArr;
          })
          .then((arr: Object[]): void => {
            expect(arr.length).assertEqual(0);
          });

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_FUNC_TYPE_0100
     * @tc.name testPromiseChainArrowFunction
     * @tc.desc Test Promise chain using arrow functions - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainArrowFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainArrowFunction';
      console.info(`${caseName} test start`);

      await Promise.resolve<string>('start')
        .then((value: string): string => {
          expect(value).assertEqual('start');
          return 'a';
        })
        .then((value: string): string => {
          expect(value).assertEqual('a');
          return 'b';
        })
        .then((value: string): string => {
          expect(value).assertEqual('b');
          return 'c';
        })
        .then((value: string): void => {
          expect(value).assertEqual('c');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_FUNC_TYPE_0200
     * @tc.name testPromiseChainNormalFunction
     * @tc.desc Test Promise chain using normal functions - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainNormalFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainNormalFunction';
      console.info(`${caseName} test start`);

      await Promise.resolve<string>('start')
        .then((value: string): string => {
          expect(value).assertEqual('start');
          return 'a';
        })
        .then((value: string): string => {
          expect(value).assertEqual('a');
          return 'b';
        })
        .then((value: string): string => {
          expect(value).assertEqual('b');
          return 'c';
        })
        .then((value: string): void => {
          expect(value).assertEqual('c');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_FUNC_TYPE_0300
     * @tc.name testPromiseChainMixedFunction
     * @tc.desc Test Promise chain mixing arrow and normal functions - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainMixedFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainMixedFunction';
      console.info(`${caseName} test start`);

      await Promise.resolve<string>('start')
        .then((value: string): string => {
          expect(value).assertEqual('start');
          return 'arrow1';
        })
        .then((value: string): string => {
          expect(value).assertEqual('arrow1');
          return 'normal1';
        })
        .then((value: string): string => {
          expect(value).assertEqual('normal1');
          return 'arrow2';
        })
        .then((value: string): void => {
          expect(value).assertEqual('arrow2');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_FUNC_TYPE_0400
     * @tc.name testPromiseChainNamedFunction
     * @tc.desc Test Promise chain using named function references - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainNamedFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainNamedFunction';
      console.info(`${caseName} test start`);

      const result: string = await Promise.resolve<string>('start')
        .then(step1)
        .then(step2)
        .then(step3);
      expect(result).assertEqual('start-step1-step2');

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_FUNC_TYPE_0500
     * @tc.name testPromiseChainCatchArrowFunction
     * @tc.desc Test Promise catch using arrow function - verify error input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainCatchArrowFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainCatchArrowFunction';
      console.info(`${caseName} test start`);

      await Promise.reject(new Error('error'))
        .catch((error: Error): string => {
          expect(error instanceof Error).assertTrue();
          return 'recovered';
        })
        .then((value: string): void => {
          expect(value).assertEqual('recovered');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_FUNC_TYPE_0600
     * @tc.name testPromiseChainCatchNormalFunction
     * @tc.desc Test Promise catch using normal function - verify error input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainCatchNormalFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainCatchNormalFunction';
      console.info(`${caseName} test start`);

      await Promise.reject(new Error('error'))
        .catch(normalCatchHandler)
        .then((value: string): void => {
          expect(value).assertEqual('recovered');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_FUNC_TYPE_0700
     * @tc.name testPromiseChainCatchNamedFunction
     * @tc.desc Test Promise catch using named function reference - verify error input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainCatchNamedFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainCatchNamedFunction';
      console.info(`${caseName} test start`);

      await Promise.reject(new Error('error'))
        .catch(errorHandler)
        .then((value: string): void => {
          expect(value).assertEqual('recovered');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_FUNC_TYPE_0800
     * @tc.name testPromiseChainFinallyArrowFunction
     * @tc.desc Test Promise finally using arrow function - verify execution
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainFinallyArrowFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainFinallyArrowFunction';
      console.info(`${caseName} test start`);

      let executed: boolean = false;

      await Promise.resolve<string>('value')
        .finally(() => {
          executed = true;
        })
        .then((value: string): void => {
          expect(value).assertEqual('value');
          expect(executed).assertTrue();
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_FUNC_TYPE_0900
     * @tc.name testPromiseChainFinallyNormalFunction
     * @tc.desc Test Promise finally using normal function - verify execution
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainFinallyNormalFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainFinallyNormalFunction';
      console.info(`${caseName} test start`);

      normalFinallyExecuted = false;

      await Promise.resolve<string>('value')
        .finally(normalFinallyHandler)
        .then((value: string): void => {
          expect(value).assertEqual('value');
        });
      expect(normalFinallyExecuted).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_FUNC_TYPE_1000
     * @tc.name testPromiseChainFinallyNamedFunction
     * @tc.desc Test Promise finally using named function reference - verify execution
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainFinallyNamedFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainFinallyNamedFunction';
      console.info(`${caseName} test start`);

      cleanupExecuted = false;

      await Promise.resolve<string>('value')
        .finally(cleanup)
        .then((value: string): void => {
          expect(value).assertEqual('value');
        });
      expect(cleanupExecuted).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_FUNC_TYPE_1100
     * @tc.name testPromiseChainMixedCatchFinally
     * @tc.desc Test Promise chain with mixed function types in catch and finally - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainMixedCatchFinally', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainMixedCatchFinally';
      console.info(`${caseName} test start`);

      let finallyExecuted: boolean = false;

      await Promise.reject(new Error('failed'))
        .catch((error: Error): string => {
          expect(error instanceof Error).assertTrue();
          return 'arrow recovered';
        })
        .then((value: string): string => {
          expect(value).assertEqual('arrow recovered');
          return value + ' normal';
        })
        .finally(() => {
          finallyExecuted = true;
        })
        .then((value: string): void => {
          expect(value).assertEqual('arrow recovered normal');
          expect(finallyExecuted).assertTrue();
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_FUNC_TYPE_1200
     * @tc.name testPromiseChainComplexFunctionMix
     * @tc.desc Test Promise chain with complex mix of function types - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainComplexFunctionMix', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainComplexFunctionMix';
      console.info(`${caseName} test start`);

      let finallyCount: number = 0;

      await Promise.resolve<string>('start')
        .then((v: string): string => {
          expect(v).assertEqual('start');
          return v + '-arrow';
        })
        .then((v: string): string => {
          expect(v).assertEqual('start-arrow');
          return v + '-normal';
        })
        .then(processStep)
        .then((v: string): void => {
          expect(v).assertEqual('start-arrow-normal-named');
        })
        .catch((e: Error): string => {
          return 'error';
        })
        .finally(() => {
          finallyCount++;
        })
        .then((v: string | void): void => {
          expect(finallyCount).assertEqual(1);
        });

      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_MULTI_0100
     * @tc.name testPromiseChainThreeLevels
     * @tc.desc Test Promise chain with 3 consecutive then calls - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainThreeLevels', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainThreeLevels';
      console.info(`${caseName} test start`);

      await Promise.resolve<number>(1)
        .then((value: number): number => {
          expect(value).assertEqual(1);
          return value * 2;
        })
        .then((value: number): number => {
          expect(value).assertEqual(2);
          return value + 3;
        })
        .then((value: number): void => {
          expect(value).assertEqual(5);
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_MULTI_0200
     * @tc.name testPromiseChainFiveLevels
     * @tc.desc Test Promise chain with 5 consecutive then calls - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainFiveLevels', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainFiveLevels';
      console.info(`${caseName} test start`);

      await Promise.resolve<string>('')
        .then((value: string): string => {
          expect(value).assertEqual('');
          expect(value.length).assertEqual(0);
          return value + 'a';
        })
        .then((value: string): string => {
          expect(value).assertEqual('a');
          expect(value.length).assertEqual(1);
          return value + 'b';
        })
        .then((value: string): string => {
          expect(value).assertEqual('ab');
          return value + 'c';
        })
        .then((value: string): string => {
          expect(value).assertEqual('abc');
          return value + 'd';
        })
        .then((value: string): void => {
          expect(value).assertEqual('abcd');
          expect(value.length).assertEqual(4);
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_MULTI_0300
     * @tc.name testPromiseChainTypeConversion
     * @tc.desc Test Promise chain with type conversion at each level - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainTypeConversion', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainTypeConversion';
      console.info(`${caseName} test start`);

      await Promise.resolve<string>('100')
        .then((value: string): number => {
          expect(value).assertEqual('100');
          return parseInt(value);
        })
        .then((value: number): boolean => {
          expect(value).assertEqual(100);
          return value > 50;
        })
        .then((value: boolean): string => {
          expect(value).assertTrue();
          return value ? 'yes' : 'no';
        })
        .then((value: string): void => {
          expect(value).assertEqual('yes');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_MULTI_0400
     * @tc.name testPromiseChainThenSuccessCatchSkip
     * @tc.desc Test Promise chain where then succeeds and catch is skipped - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainThenSuccessCatchSkip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainThenSuccessCatchSkip';
      console.info(`${caseName} test start`);

      let catchExecuted: boolean = false;

      await Promise.resolve<string>('value')
        .then((value: string): string => {
          expect(value).assertEqual('value');
          return 'success';
        })
        .catch((error: Error): string => {
          catchExecuted = true;
          return 'caught';
        })
        .then((value: string): void => {
          expect(value).assertEqual('success');
          expect(catchExecuted).assertFalse();
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_MULTI_0500
     * @tc.name testPromiseChainThenFailCatchExecute
     * @tc.desc Test Promise chain where then fails and catch executes - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainThenFailCatchExecute', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainThenFailCatchExecute';
      console.info(`${caseName} test start`);

      await Promise.resolve<string>('value')
        .then((value: string): string => {
          expect(value).assertEqual('value');
          throw new Error('then failed');
        })
        .catch((error: Error): string => {
          expect(error instanceof Error).assertTrue();
          return 'recovered';
        })
        .then((value: string): void => {
          expect(value).assertEqual('recovered');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_MULTI_0600
     * @tc.name testPromiseChainMultipleThenThenCatch
     * @tc.desc Test Promise chain with multiple then before catch - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainMultipleThenThenCatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainMultipleThenThenCatch';
      console.info(`${caseName} test start`);

      await Promise.resolve<string>('start')
        .then((value: string): string => {
          expect(value).assertEqual('start');
          return value + '1';
        })
        .then((value: string): string => {
          expect(value).assertEqual('start1');
          throw new Error('failed at step 2');
        })
        .then((value: string): string => {
          expect().assertFail();
          return value;
        })
        .catch((error: Error): string => {
          expect(error instanceof Error).assertTrue();
          return 'caught';
        })
        .then((value: string): void => {
          expect(value).assertEqual('caught');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_MULTI_0700
     * @tc.name testPromiseChainSuccessCompleteFlow
     * @tc.desc Test Promise chain with successful complete flow (resolve→then→then→catch(skip)→finally→then) - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainSuccessCompleteFlow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainSuccessCompleteFlow';
      console.info(`${caseName} test start`);

      let steps: string[] = [];

      await Promise.resolve<string>('start')
        .then((value: string): string => {
          expect(value).assertEqual('start');
          steps.push('then1');
          return value + '1';
        })
        .then((value: string): string => {
          expect(value).assertEqual('start1');
          steps.push('then2');
          return value + '2';
        })
        .catch((error: Error): string => {
          steps.push('catch');
          return 'caught';
        })
        .finally(() => {
          steps.push('finally');
        })
        .then((value: string): void => {
          expect(value).assertEqual('start12');
          steps.push('final then');
          expect(steps.join(',')).assertEqual('then1,then2,finally,final then');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_MULTI_0800
     * @tc.name testPromiseChainFailCompleteFlow
     * @tc.desc Test Promise chain with failure complete flow (reject→catch→finally→then) - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainFailCompleteFlow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainFailCompleteFlow';
      console.info(`${caseName} test start`);

      let steps: string[] = [];

      await Promise.reject(new Error('failed'))
        .catch((error: Error): string => {
          expect(error instanceof Error).assertTrue();
          steps.push('catch');
          return 'recovered';
        })
        .finally(() => {
          steps.push('finally');
        })
        .then((value: string): void => {
          expect(value).assertEqual('recovered');
          steps.push('then');
          expect(steps.join(',')).assertEqual('catch,finally,then');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_MULTI_0900
     * @tc.name testPromiseChainThenFailCatchRecoverFinally
     * @tc.desc Test Promise chain with then fail, catch recover, and finally - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainThenFailCatchRecoverFinally', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainThenFailCatchRecoverFinally';
      console.info(`${caseName} test start`);

      let steps: string[] = [];

      await Promise.resolve<string>('start')
        .then((value: string): string => {
          expect(value).assertEqual('start');
          steps.push('then');
          throw new Error('then error');
        })
        .catch((error: Error): string => {
          expect(error instanceof Error).assertTrue();
          steps.push('catch');
          return 'recovered';
        })
        .finally(() => {
          steps.push('finally');
        })
        .then((value: string): void => {
          expect(value).assertEqual('recovered');
          steps.push('final then');
          expect(steps.join(',')).assertEqual('then,catch,finally,final then');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_MULTI_1000
     * @tc.name testPromiseChainMultipleCatchFirstCatch
     * @tc.desc Test Promise chain where first catch captures error - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainMultipleCatchFirstCatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainMultipleCatchFirstCatch';
      console.info(`${caseName} test start`);

      let catchCount: number = 0;

      await Promise.reject(new Error('error'))
        .catch((error: Error): string => {
          expect(error instanceof Error).assertTrue();
          catchCount++;
          return 'caught1';
        })
        .catch((error: Error): string => {
          catchCount++;
          return 'caught2';
        })
        .then((value: string): void => {
          expect(value).assertEqual('caught1');
          expect(catchCount).assertEqual(1);
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_MULTI_1100
     * @tc.name testPromiseChainCatchThrowNextCatch
     * @tc.desc Test Promise chain where catch throws to next catch - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainCatchThrowNextCatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainCatchThrowNextCatch';
      console.info(`${caseName} test start`);

      await Promise.reject(new Error('original'))
        .catch((error: Error): string => {
          expect(error instanceof Error).assertTrue();
          throw new Error('new error');
        })
        .catch((error: Error): string => {
          expect(error instanceof Error).assertTrue();
          return 'caught2';
        })
        .then((value: string): void => {
          expect(value).assertEqual('caught2');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_MULTI_1200
     * @tc.name testPromiseChainCatchRecoverContinue
     * @tc.desc Test Promise chain where catch recovers and chain continues - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainCatchRecoverContinue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainCatchRecoverContinue';
      console.info(`${caseName} test start`);

      await Promise.reject(new Error('failed'))
        .catch((error: Error): string => {
          expect(error instanceof Error).assertTrue();
          return 'recovered';
        })
        .then((value: string): string => {
          expect(value).assertEqual('recovered');
          return value + ' processed';
        })
        .then((value: string): void => {
          expect(value).assertEqual('recovered processed');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_MULTI_1300
     * @tc.name testPromiseChainCatchRecoverFinallyContinue
     * @tc.desc Test Promise chain where catch recovers, finally executes, and chain continues - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainCatchRecoverFinallyContinue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainCatchRecoverFinallyContinue';
      console.info(`${caseName} test start`);

      let finallyExecuted: boolean = false;

      await Promise.reject(new Error('failed'))
        .catch((error: Error): string => {
          expect(error instanceof Error).assertTrue();
          return 'recovered';
        })
        .finally(() => {
          finallyExecuted = true;
        })
        .then((value: string): void => {
          expect(value).assertEqual('recovered');
          expect(finallyExecuted).assertTrue();
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_MULTI_1400
     * @tc.name testPromiseChainMultipleRejectRecover
     * @tc.desc Test Promise chain with multiple reject-recover cycles - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainMultipleRejectRecover', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainMultipleRejectRecover';
      console.info(`${caseName} test start`);

      await Promise.reject(new Error('error1'))
        .catch((error: Error): Promise<string> => {
          expect(error instanceof Error).assertTrue();
          return Promise.reject(new Error('error2'));
        })
        .catch((error: Error): string => {
          expect(error instanceof Error).assertTrue();
          return 'final recovery';
        })
        .then((value: string): void => {
          expect(value).assertEqual('final recovery');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_CATCH_FINALLY_0100
     * @tc.name testPromiseCatchReturnString
     * @tc.desc Test Promise catch returning string value - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseCatchReturnString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseCatchReturnString';
      console.info(`${caseName} test start`);

      await Promise.reject(new Error('failed'))
        .catch((error: Error): string => {
          expect(error instanceof Error).assertTrue();
          return 'recovered';
        })
        .then((value: string): string => {
          expect(value).assertEqual('recovered');
          return value + ' processed';
        })
        .then((value: string): void => {
          expect(value).assertEqual('recovered processed');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_CATCH_FINALLY_0200
     * @tc.name testPromiseCatchReturnUndefined
     * @tc.desc Test Promise catch returning undefined - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseCatchReturnUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseCatchReturnUndefined';
      console.info(`${caseName} test start`);

      await Promise.reject(new Error('failed'))
        .catch((error: Error): undefined => {
          expect(error instanceof Error).assertTrue();
          return undefined;
        })
        .then((value: undefined): string => {
          expect(value).assertEqual(undefined);
          return 'after undefined';
        })
        .then((value: string): void => {
          expect(value).assertEqual('after undefined');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_CATCH_FINALLY_0300
     * @tc.name testPromiseCatchReturnPromise
     * @tc.desc Test Promise catch returning Promise - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseCatchReturnPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseCatchReturnPromise';
      console.info(`${caseName} test start`);

      await Promise.reject(new Error('failed'))
        .catch((error: Error): Promise<string> => {
          expect(error instanceof Error).assertTrue();
          return Promise.resolve('promise recovered');
        })
        .then((value: string): void => {
          expect(value).assertEqual('promise recovered');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_CATCH_FINALLY_0400
     * @tc.name testPromiseCatchThrowError
     * @tc.desc Test Promise catch throwing new error - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseCatchThrowError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseCatchThrowError';
      console.info(`${caseName} test start`);

      await Promise.reject(new Error('original'))
        .catch((error: Error): string => {
          expect(error instanceof Error).assertTrue();
          throw new Error('new error');
        })
        .catch((error: Error): string => {
          expect(error instanceof Error).assertTrue();
          return 'final recovered';
        })
        .then((value: string): void => {
          expect(value).assertEqual('final recovered');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_CATCH_FINALLY_0500
     * @tc.name testPromiseCatchReturnRejectPromise
     * @tc.desc Test Promise catch returning Promise.reject() - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseCatchReturnRejectPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseCatchReturnRejectPromise';
      console.info(`${caseName} test start`);

      await Promise.reject(new Error('original'))
        .catch((error: Error): Promise<string> => {
          expect(error instanceof Error).assertTrue();
          return Promise.reject(new Error('rejected again'));
        })
        .catch((error: Error): string => {
          expect(error instanceof Error).assertTrue();
          return 'recovered';
        })
        .then((value: string): void => {
          expect(value).assertEqual('recovered');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_CATCH_FINALLY_0600
     * @tc.name testPromiseCatchNoReturn
     * @tc.desc Test Promise catch with no return statement - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseCatchNoReturn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseCatchNoReturn';
      console.info(`${caseName} test start`);

      await Promise.reject(new Error('failed'))
        .catch((error: Error): void => {
          expect(error instanceof Error).assertTrue();
        })
        .then((value: void): string => {
          expect(value).assertEqual(undefined);
          return 'after catch void';
        })
        .then((value: string): void => {
          expect(value).assertEqual('after catch void');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_CATCH_FINALLY_0700
     * @tc.name testPromiseFinallyResolveThen
     * @tc.desc Test Promise finally after resolve and then - verify finally execution and value passing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseFinallyResolveThen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseFinallyResolveThen';
      console.info(`${caseName} test start`);

      let finallyExecuted: boolean = false;

      await Promise.resolve<string>('value')
        .then((value: string): string => {
          expect(value).assertEqual('value');
          return 'modified';
        })
        .finally(() => {
          finallyExecuted = true;
        })
        .then((value: string): void => {
          expect(value).assertEqual('modified');
          expect(finallyExecuted).assertTrue();
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_CATCH_FINALLY_0800
     * @tc.name testPromiseFinallyRejectCatch
     * @tc.desc Test Promise finally after reject and catch - verify finally execution and value passing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseFinallyRejectCatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseFinallyRejectCatch';
      console.info(`${caseName} test start`);

      let finallyExecuted: boolean = false;

      await Promise.reject(new Error('failed'))
        .catch((error: Error): string => {
          expect(error instanceof Error).assertTrue();
          return 'recovered';
        })
        .finally(() => {
          finallyExecuted = true;
        })
        .then((value: string): void => {
          expect(value).assertEqual('recovered');
          expect(finallyExecuted).assertTrue();
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_CATCH_FINALLY_0900
     * @tc.name testPromiseFinallyNoParameter
     * @tc.desc Test Promise finally receives no parameter - verify no value passed to finally
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseFinallyNoParameter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseFinallyNoParameter';
      console.info(`${caseName} test start`);

      await Promise.resolve<string>('value')
        .finally(() => {
        })
        .then((value: string): void => {
          expect(value).assertEqual('value');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_CATCH_FINALLY_1000
     * @tc.name testPromiseFinallyReturnValueIgnored
     * @tc.desc Test Promise finally returning value is ignored - verify value unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseFinallyReturnValueIgnored', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseFinallyReturnValueIgnored';
      console.info(`${caseName} test start`);

      await Promise.resolve<string>('original')
        .finally(() => {
          return 'ignored';
        })
        .then((value: string): void => {
          expect(value).assertEqual('original');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_CATCH_FINALLY_1100
     * @tc.name testPromiseFinallyReturnUndefined
     * @tc.desc Test Promise finally returning undefined - verify value unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseFinallyReturnUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseFinallyReturnUndefined';
      console.info(`${caseName} test start`);

      await Promise.resolve<string>('value')
        .finally(() => {
          return undefined;
        })
        .then((value: string): void => {
          expect(value).assertEqual('value');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_CATCH_FINALLY_1200
     * @tc.name testPromiseFinallyReturnPromise
     * @tc.desc Test Promise finally returning Promise - verify Promise completes but value unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseFinallyReturnPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseFinallyReturnPromise';
      console.info(`${caseName} test start`);

      await Promise.resolve<string>('value')
        .finally(() => {
          return new Promise<void>((resolve: (value: void) => void) => {
            setTimeout(() => {
              resolve(undefined);
            }, 500);
          });
        })
        .then((value: string): void => {
          expect(value).assertEqual('value');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_CATCH_FINALLY_1300
     * @tc.name testPromiseFinallyThrowError
     * @tc.desc Test Promise finally throwing error - verify error propagates to catch
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseFinallyThrowError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseFinallyThrowError';
      console.info(`${caseName} test start`);

      await Promise.resolve<string>('value')
        .then((value: string): string => {
          expect(value).assertEqual('value');
          return 'processed';
        })
        .finally(() => {
          throw new Error('finally error');
        })
        .then((value: string): void => {
          expect().assertFail();
        })
        .catch((error: Error): void => {
          expect(error instanceof Error).assertTrue();
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_CATCH_FINALLY_1400
     * @tc.name testPromiseFinallyReturnRejectPromise
     * @tc.desc Test Promise finally returning Promise.reject() - verify error propagates to catch
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseFinallyReturnRejectPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseFinallyReturnRejectPromise';
      console.info(`${caseName} test start`);

      await Promise.resolve<string>('value')
        .finally(() => {
          return Promise.reject(new Error('finally reject'));
        })
        .catch((error: Error): void => {
          expect(error instanceof Error).assertTrue();
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_CATCH_FINALLY_1500
     * @tc.name testPromiseCustomErrorCatch
     * @tc.desc Test Promise catch with custom error class - verify error properties
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseCustomErrorCatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseCustomErrorCatch';
      console.info(`${caseName} test start`);

      await Promise.resolve<void>(undefined)
        .then(() => {
          throw new CustomError('custom error', 500);
        })
        .catch((error: Error): string => {
          const customError = error as CustomError;
          expect(customError instanceof Error).assertTrue();
          expect(customError.customCode).assertEqual(500);
          return 'recovered';
        })
        .then((value: string): void => {
          expect(value).assertEqual('recovered');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_NESTED_0100
     * @tc.name testPromiseChainNestedPromise
     * @tc.desc Test Promise chain returning nested Promise - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainNestedPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainNestedPromise';
      console.info(`${caseName} test start`);

      await Promise.resolve<string>('outer')
        .then((value: string): Promise<string> => {
          expect(value).assertEqual('outer');
          return Promise.resolve<string>('inner')
            .then((v: string): string => {
              expect(v).assertEqual('inner');
              return v + '-nested';
            });
        })
        .then((value: string): void => {
          expect(value).assertEqual('inner-nested');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_NESTED_0200
     * @tc.name testPromiseChainDoubleNested
     * @tc.desc Test Promise chain with double nested Promise - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainDoubleNested', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainDoubleNested';
      console.info(`${caseName} test start`);

      await Promise.resolve<void>(undefined)
        .then(() => {
          return Promise.resolve<void>(undefined)
            .then(() => {
              return Promise.resolve<string>('deep');
            });
        })
        .then((value: string): void => {
          expect(value).assertEqual('deep');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_NESTED_0300
     * @tc.name testPromiseChainNestedErrorHandling
     * @tc.desc Test Promise chain with nested error handling - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainNestedErrorHandling', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainNestedErrorHandling';
      console.info(`${caseName} test start`);

      await Promise.resolve<string>('outer')
        .then((value: string): Promise<string> => {
          expect(value).assertEqual('outer');
          return Promise.reject(new Error('nested error'))
            .catch((error: Error): string => {
              expect(error instanceof Error).assertTrue();
              return 'nested recovered';
            });
        })
        .then((value: string): void => {
          expect(value).assertEqual('nested recovered');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_NESTED_0400
     * @tc.name testPromiseChainAsyncFunctionThen
     * @tc.desc Test async function return value passed to then chain - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainAsyncFunctionThen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainAsyncFunctionThen';
      console.info(`${caseName} test start`);

      await asyncFuncNested()
        .then((value: string): string => {
          expect(value).assertEqual('async result');
          return value + ' then';
        })
        .then((value: string): void => {
          expect(value).assertEqual('async result then');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_NESTED_0500
     * @tc.name testPromiseChainAwaitPromiseChain
     * @tc.desc Test await waiting for Promise chain completion - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainAwaitPromiseChain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainAwaitPromiseChain';
      console.info(`${caseName} test start`);

      const result: string = await testChainNested();
      expect(result).assertEqual('start12');

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_NESTED_0600
     * @tc.name testPromiseChainNestedThenChain
     * @tc.desc Test nested Promise with inner then chain - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainNestedThenChain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainNestedThenChain';
      console.info(`${caseName} test start`);

      await Promise.resolve<void>(undefined)
        .then(() => {
          return Promise.resolve<string>('inner')
            .then((v: string): string => {
              expect(v).assertEqual('inner');
              return v + '1';
            })
            .then((v: string): string => {
              expect(v).assertEqual('inner1');
              return v + '2';
            });
        })
        .then((value: string): void => {
          expect(value).assertEqual('inner12');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_NESTED_0700
     * @tc.name testPromiseChainValuePenetration
     * @tc.desc Test Promise chain value penetration with undefined callbacks - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainValuePenetration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainValuePenetration';
      console.info(`${caseName} test start`);

      await Promise.resolve<string>('original')
        .then((value: string): string => value)
        .then((value: string): string => value)
        .then((value: string): string => value)
        .then((value: string): void => {
          expect(value).assertEqual('original');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_NESTED_0800
     * @tc.name testPromiseChainErrorPenetration
     * @tc.desc Test Promise chain error penetration - verify error reaches catch
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainErrorPenetration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainErrorPenetration';
      console.info(`${caseName} test start`);

      await Promise.reject(new Error('error'))
        .then((value: string): string => value)
        .then((value: string): string => value)
        .catch((error: Error): void => {
          expect(error instanceof Error).assertTrue();
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_NESTED_0900
     * @tc.name testPromiseChainCreateNewPromise
     * @tc.desc Test Promise chain creating new Promise inside then - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainCreateNewPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainCreateNewPromise';
      console.info(`${caseName} test start`);

      await Promise.resolve<void>(undefined)
        .then(() => {
          return new Promise<string>((resolve: (value: string) => void) => {
            resolve('new promise');
          });
        })
        .then((value: string): void => {
          expect(value).assertEqual('new promise');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_NESTED_1000
     * @tc.name testPromiseChainResolveRejectThen
     * @tc.desc Test Promise.resolve().then() throwing error caught by catch - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainResolveRejectThen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainResolveRejectThen';
      console.info(`${caseName} test start`);

      await Promise.resolve<void>(undefined)
        .then(() => {
          throw new Error('then error');
        })
        .catch((error: Error): void => {
          expect(error instanceof Error).assertTrue();
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_NESTED_1100
     * @tc.name testPromiseChainPromiseAllNested
     * @tc.desc Test Promise.all with nested chains - verify each chain value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainPromiseAllNested', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainPromiseAllNested';
      console.info(`${caseName} test start`);

      const chain1: Promise<string> = Promise.resolve<string>('chain1')
        .then((v: string): string => {
          expect(v).assertEqual('chain1');
          return v + 'a';
        });

      const chain2: Promise<string> = Promise.resolve<string>('chain2')
        .then((v: string): string => {
          expect(v).assertEqual('chain2');
          return v + 'b';
        });

      await Promise.all([chain1, chain2])
        .then((results: string[]): void => {
          expect(results[0]).assertEqual('chain1a');
          expect(results[1]).assertEqual('chain2b');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_NESTED_1200
     * @tc.name testPromiseChainAsyncAwaitInThen
     * @tc.desc Test async/await inside then callback - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainAsyncAwaitInThen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainAsyncAwaitInThen';
      console.info(`${caseName} test start`);

      await Promise.resolve<string>('start')
        .then(async (value: string): Promise<string> => {
          expect(value).assertEqual('start');
          const delayed: string = await new Promise<string>((resolve: (value: string) => void) => {
            setTimeout(() => {
              resolve('delayed');
            }, 500);
          });
          return value + '-' + delayed;
        })
        .then((value: string): void => {
          expect(value).assertEqual('start-delayed');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_SPECIAL_0100
     * @tc.name testPromiseChainMaxValue
     * @tc.desc Test Promise chain returning Number.MAX_VALUE - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainMaxValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainMaxValue';
      console.info(`${caseName} test start`);

      await Promise.resolve<void>(undefined)
        .then(() => {
          return Number.MAX_VALUE;
        })
        .then((value: number): void => {
          expect(value).assertEqual(Number.MAX_VALUE);
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_SPECIAL_0200
     * @tc.name testPromiseChainMinValue
     * @tc.desc Test Promise chain returning Number.MIN_VALUE - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainMinValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainMinValue';
      console.info(`${caseName} test start`);

      await Promise.resolve<void>(undefined)
        .then(() => {
          return Number.MIN_VALUE;
        })
        .then((value: number): void => {
          expect(value).assertEqual(Number.MIN_VALUE);
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_SPECIAL_0300
     * @tc.name testPromiseChainLongString
     * @tc.desc Test Promise chain returning 10000 character string - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainLongString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainLongString';
      console.info(`${caseName} test start`);

      const longString: string = 'a'.repeat(10000);

      await Promise.resolve<void>(undefined)
        .then(() => {
          return longString;
        })
        .then((value: string): void => {
          expect(value.length).assertEqual(10000);
          expect(value).assertEqual(longString);
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_SPECIAL_0400
     * @tc.name testPromiseChainLargeArray
     * @tc.desc Test Promise chain returning 1000 element array - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainLargeArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainLargeArray';
      console.info(`${caseName} test start`);

      const largeArray: number[] = [];
      for (let i = 0; i < 1000; i++) {
        largeArray.push(i);
      }

      await Promise.resolve<void>(undefined)
        .then(() => {
          return largeArray;
        })
        .then((value: number[]): void => {
          expect(value.length).assertEqual(1000);
          expect(value[0]).assertEqual(0);
          expect(value[999]).assertEqual(999);
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_SPECIAL_0500
     * @tc.name testPromiseChainCircularObject
     * @tc.desc Test Promise chain returning object with circular reference - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainCircularObject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainCircularObject';
      console.info(`${caseName} test start`);

      const circularObj: CircularObject = { name: 'test' };
      circularObj.self = circularObj;

      await Promise.resolve<void>(undefined)
        .then(() => {
          return circularObj;
        })
        .then((obj: CircularObject): void => {
          expect(obj.name).assertEqual('test');
          expect(obj.self).assertEqual(obj);
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_SPECIAL_0600
     * @tc.name testPromiseChainDateObject
     * @tc.desc Test Promise chain returning Date object - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainDateObject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainDateObject';
      console.info(`${caseName} test start`);

      const date: Date = new Date('2025-01-01');

      await Promise.resolve<void>(undefined)
        .then(() => {
          return date;
        })
        .then((value: Date): void => {
          expect(value.getFullYear()).assertEqual(2025);
          expect(value.getMonth()).assertEqual(0);
          expect(value.getDate()).assertEqual(1);
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_SPECIAL_0700
     * @tc.name testPromiseChainMapObject
     * @tc.desc Test Promise chain returning Map object - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainMapObject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainMapObject';
      console.info(`${caseName} test start`);

      const map: Map<string, number> = new Map<string, number>();
      map.set('a', 1);
      map.set('b', 2);

      await Promise.resolve<void>(undefined)
        .then(() => {
          return map;
        })
        .then((value: Map<string, number>): void => {
          expect(value.size).assertEqual(2);
          expect(value.get('a')).assertEqual(1);
          expect(value.get('b')).assertEqual(2);
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_SPECIAL_0800
     * @tc.name testPromiseChainSetObject
     * @tc.desc Test Promise chain returning Set object - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainSetObject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainSetObject';
      console.info(`${caseName} test start`);

      const set: Set<number> = new Set<number>();
      set.add(1);
      set.add(2);
      set.add(3);

      await Promise.resolve<void>(undefined)
        .then(() => {
          return set;
        })
        .then((value: Set<number>): void => {
          expect(value.size).assertEqual(3);
          expect(value.has(1)).assertTrue();
          expect(value.has(2)).assertTrue();
          expect(value.has(3)).assertTrue();
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_SPECIAL_0900
     * @tc.name testPromiseChainDataProcessing
     * @tc.desc Test Promise chain simulating data processing pipeline - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainDataProcessing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainDataProcessing';
      console.info(`${caseName} test start`);

      await Promise.resolve<string>('{"value": 100}')
        .then((json: string): ValueObject => {
          expect(json).assertEqual('{"value": 100}');
          const data: ValueObject = { value: 100 };
          return data;
        })
        .then((data: ValueObject): number => {
          expect(data.value).assertEqual(100);
          return data.value * 2;
        })
        .then((result: number): string => {
          expect(result).assertEqual(200);
          return `Result: ${result}`;
        })
        .then((output: string): void => {
          expect(output).assertEqual('Result: 200');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_SPECIAL_1000
     * @tc.name testPromiseChainZeroValue
     * @tc.desc Test Promise chain returning zero value - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainZeroValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainZeroValue';
      console.info(`${caseName} test start`);

      await Promise.resolve<number>(0)
        .then((value: number): number => {
          expect(value).assertEqual(0);
          return value;
        })
        .then((value: number): string => {
          expect(value).assertEqual(0);
          return value.toString();
        })
        .then((value: string): void => {
          expect(value).assertEqual('0');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_SPECIAL_1100
     * @tc.name testPromiseChainNegativeValue
     * @tc.desc Test Promise chain returning negative value - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainNegativeValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainNegativeValue';
      console.info(`${caseName} test start`);

      await Promise.resolve<number>(-100)
        .then((value: number): number => {
          expect(value).assertEqual(-100);
          return Math.abs(value);
        })
        .then((value: number): void => {
          expect(value).assertEqual(100);
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_SPECIAL_1200
     * @tc.name testPromiseChainFalseValue
     * @tc.desc Test Promise chain returning false value - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainFalseValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainFalseValue';
      console.info(`${caseName} test start`);

      await Promise.resolve<boolean>(false)
        .then((value: boolean): boolean => {
          expect(value).assertFalse();
          return value;
        })
        .then((value: boolean): string => {
          expect(value).assertFalse();
          return value ? 'true' : 'false';
        })
        .then((value: string): void => {
          expect(value).assertEqual('false');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_SPECIAL_1300
     * @tc.name testPromiseChainComplexObject
     * @tc.desc Test Promise chain returning complex nested object - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainComplexObject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainComplexObject';
      console.info(`${caseName} test start`);

      const level3Obj: Level3Object = { value: 'deep value', array: [1, 2, 3] };
      const level2Obj: Level2Object = { level3: level3Obj };
      const level1Obj: Level1Object = { level2: level2Obj };
      const complexObj: ComplexNestedObject = { level1: level1Obj };

      await Promise.resolve<void>(undefined)
        .then(() => {
          return complexObj;
        })
        .then((obj: ComplexNestedObject): void => {
          expect(obj.level1.level2.level3.value).assertEqual('deep value');
          expect(obj.level1.level2.level3.array.length).assertEqual(3);
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_SPECIAL_1400
     * @tc.name testPromiseChainUnicodeString
     * @tc.desc Test Promise chain returning Unicode string - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainUnicodeString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainUnicodeString';
      console.info(`${caseName} test start`);

      const unicodeString: string = '你好世界 Hello World 🌍';

      await Promise.resolve<void>(undefined)
        .then(() => {
          return unicodeString;
        })
        .then((value: string): void => {
          expect(value).assertEqual('你好世界 Hello World 🌍');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_EXPORT_0100
     * @tc.name testPromiseChainExportedPromiseFunc
     * @tc.desc Test exported Promise chain function from module - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainExportedPromiseFunc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainExportedPromiseFunc';
      console.info(`${caseName} test start`);

      const result: string = await exportedPromiseFunc();
      expect(result).assertEqual('exported-chain');

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_EXPORT_0200
     * @tc.name testPromiseChainExportedPromiseArrow
     * @tc.desc Test exported Promise chain arrow function from module - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainExportedPromiseArrow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainExportedPromiseArrow';
      console.info(`${caseName} test start`);

      const result: number = await exportedPromiseArrow();
      expect(result).assertEqual(84);

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_EXPORT_0300
     * @tc.name testPromiseChainDefaultExportedPromise
     * @tc.desc Test default exported Promise chain function - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainDefaultExportedPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainDefaultExportedPromise';
      console.info(`${caseName} test start`);

      const result: string = await defaultExportedPromise();
      expect(result).assertEqual('exported-chain');

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_EXPORT_0400
     * @tc.name testPromiseChainExportedPromiseClassMethod
     * @tc.desc Test exported Promise chain class method - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainExportedPromiseClassMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainExportedPromiseClassMethod';
      console.info(`${caseName} test start`);

      const instance = new ExportedPromiseClass();
      instance.value = 10;
      const result: string = await instance.exportedPromiseMethod();
      expect(result).assertEqual('class-method');

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_EXPORT_0500
     * @tc.name testPromiseChainExportedMultiplePromiseClass
     * @tc.desc Test exported Promise chain class with multiple methods - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testPromiseChainExportedMultiplePromiseClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainExportedMultiplePromiseClass';
      console.info(`${caseName} test start`);

      const instance = new ExportedMultiplePromiseClass();
      instance.x = 5;
      instance.y = 10;

      const result1: number = await instance.promiseMethod1();
      expect(result1).assertEqual(10);

      const result2: number = await instance.promiseMethod2();
      expect(result2).assertEqual(20);

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_NAMESPACE_0100
     * @tc.name testPromiseChainNamespacePromiseFunc
     * @tc.desc Test namespace Promise chain function - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainNamespacePromiseFunc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainNamespacePromiseFunc';
      console.info(`${caseName} test start`);

      const result: string = await PromiseNamespace.namespacePromiseFunc();
      expect(result).assertEqual('namespace-chain');

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_NAMESPACE_0200
     * @tc.name testPromiseChainNamespacePromiseClassMethod
     * @tc.desc Test namespace Promise chain class method - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainNamespacePromiseClassMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainNamespacePromiseClassMethod';
      console.info(`${caseName} test start`);

      const instance = new PromiseNamespace.NamespacePromiseClass();
      instance.value = 20;
      const result: string = await instance.namespacePromiseMethod();
      expect(result).assertEqual('namespace-class-method');

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_NAMESPACE_0300
     * @tc.name testPromiseChainInnerNamespacePromiseFunc
     * @tc.desc Test inner namespace Promise chain function - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testPromiseChainInnerNamespacePromiseFunc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainInnerNamespacePromiseFunc';
      console.info(`${caseName} test start`);

      const result: string = await PromiseNamespace.InnerPromiseNamespace.innerNamespacePromiseFunc();
      expect(result).assertEqual('inner-namespace-inner');

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_INTERFACE_0100
     * @tc.name testPromiseChainInterfacePromiseMethod
     * @tc.desc Test interface Promise chain method - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainInterfacePromiseMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainInterfacePromiseMethod';
      console.info(`${caseName} test start`);

      const instance: PromiseInterface = new PromiseInterfaceImpl();
      const result: string = await instance.promiseMethod();
      expect(result).assertEqual('interface-impl');

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_INTERFACE_0200
     * @tc.name testPromiseChainAbstractPromiseMethod
     * @tc.desc Test abstract class Promise chain method - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainAbstractPromiseMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainAbstractPromiseMethod';
      console.info(`${caseName} test start`);

      const instance = new AbstractPromiseImpl();
      const result: number = await instance.abstractPromiseMethod();
      expect(result).assertEqual(200);

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_SENDABLE_0100
     * @tc.name testPromiseChainSendablePromiseFunc
     * @tc.desc Test Sendable Promise chain function - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainSendablePromiseFunc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainSendablePromiseFunc';
      console.info(`${caseName} test start`);

      const result: string = await sendablePromiseFunc();
      expect(result).assertEqual('sendable-chain');

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_SENDABLE_0200
     * @tc.name testPromiseChainSendablePromiseClassMethod
     * @tc.desc Test Sendable Promise chain class method - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainSendablePromiseClassMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainSendablePromiseClassMethod';
      console.info(`${caseName} test start`);

      const instance = new SendablePromiseClass();
      instance.value = 10;
      const result: number = await instance.sendablePromiseMethod();
      expect(result).assertEqual(30);

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_SENDABLE_0300
     * @tc.name testPromiseChainSendableMultiplePromiseClass
     * @tc.desc Test Sendable Promise chain class with multiple methods - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testPromiseChainSendableMultiplePromiseClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainSendableMultiplePromiseClass';
      console.info(`${caseName} test start`);

      const instance = new SendableMultiplePromiseClass();
      instance.x = 5;
      instance.y = 10;

      const result1: number = await instance.sendablePromiseMethod1();
      expect(result1).assertEqual(15);

      const result2: number = await instance.sendablePromiseMethod2();
      expect(result2).assertEqual(30);

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_TASKPOOL_0100
     * @tc.name testPromiseChainTaskPoolPromiseFunc
     * @tc.desc Test TaskPool Promise chain function - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainTaskPoolPromiseFunc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainTaskPoolPromiseFunc';
      console.info(`${caseName} test start`);

      const task = taskpool.execute(taskPoolPromiseFunc, 10);
      const result = await task as int;
      expect(result).assertEqual(20);

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_TASKPOOL_0200
     * @tc.name testPromiseChainTaskPoolAsyncPromise
     * @tc.desc Test TaskPool async Promise chain - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseChainTaskPoolAsyncPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainTaskPoolAsyncPromise';
      console.info(`${caseName} test start`);

      const task = taskpool.execute(taskPoolAsyncPromise, 5);
      const result: int = await task as int;
      expect(result).assertEqual(15);

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_TASKPOOL_0300
     * @tc.name testPromiseChainTaskPoolPromiseChain
     * @tc.desc Test TaskPool multi-layer Promise chain - verify each layer input parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testPromiseChainTaskPoolPromiseChain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainTaskPoolPromiseChain';
      console.info(`${caseName} test start`);

      const task = taskpool.execute(taskPoolPromiseChain, 10, 5);
      const result: int = await task as int;
      expect(result).assertEqual(30);

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_STATIC_0100
     * @tc.name testPromiseRaceBasic
     * @tc.desc Test Promise.race with basic values - verify fastest Promise wins
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseRaceBasic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseRaceBasic';
      console.info(`${caseName} test start`);

      const result: string = await Promise.race([
        Promise.resolve<string>('fast'),
        new Promise<string>((resolve: (value: string) => void) => {
          setTimeout(() => {
            resolve('slow');
          }, 100);
        })
      ]);
      expect(result).assertEqual('fast');

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_STATIC_0200
     * @tc.name testPromiseRaceReject
     * @tc.desc Test Promise.race with rejection - verify first rejection wins
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseRaceReject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseRaceReject';
      console.info(`${caseName} test start`);

      try {
        await Promise.race([
          Promise.reject(new Error('first error')),
          Promise.resolve<string>('success')
        ]);
        expect().assertFail();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
      }

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_STATIC_0300
     * @tc.name testPromiseAllSettledMixed
     * @tc.desc Test Promise.allSettled with mixed results - verify all results captured
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPromiseAllSettledMixed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseAllSettledMixed';
      console.info(`${caseName} test start`);

      const results: Object[] = await Promise.allSettled([
        Promise.resolve<string>('success'),
        Promise.reject(new Error('failed'))
      ]) as Object[];

      expect(results.length).assertEqual(2);
      const r0 = results[0] as PromiseSettledResult<string>;
      const r1 = results[1] as PromiseSettledResult<string>;
      expect(r0.status).assertEqual('fulfilled');
      expect(r1.status).assertEqual('rejected');

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_STATIC_0400
     * @tc.name testPromiseAllSettledAllSuccess
     * @tc.desc Test Promise.allSettled with all success - verify all fulfilled
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testPromiseAllSettledAllSuccess', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseAllSettledAllSuccess';
      console.info(`${caseName} test start`);

      const results: Object[] = await Promise.allSettled([
        Promise.resolve<number>(10)
          .then((v: number): number => v * 2),
        Promise.resolve<number>(20)
          .then((v: number): number => v + 5)
      ]) as Object[];

      expect(results.length).assertEqual(2);
      const r0 = results[0] as PromiseSettledResult<number>;
      const r1 = results[1] as PromiseSettledResult<number>;
      expect(r0.status).assertEqual('fulfilled');
      expect(r1.status).assertEqual('fulfilled');

      console.info(`${caseName} test end`);
      done();
    });
  });
}
