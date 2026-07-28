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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
            expect(error.message).assertEqual('inner error');
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
            expect(error.message).assertEqual('thrown error');
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainCatchArrowFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainCatchArrowFunction';
      console.info(`${caseName} test start`);

      await Promise.reject(new Error('error'))
        .catch((error: Error): string => {
          expect(error.message).assertEqual('error');
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainMixedCatchFinally', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainMixedCatchFinally';
      console.info(`${caseName} test start`);

      let finallyExecuted: boolean = false;

      await Promise.reject(new Error('failed'))
        .catch((error: Error): string => {
          expect(error.message).assertEqual('failed');
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
          expect(error.message).assertEqual('then failed');
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
          expect(error.message).assertEqual('failed at step 2');
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainFailCompleteFlow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainFailCompleteFlow';
      console.info(`${caseName} test start`);

      let steps: string[] = [];

      await Promise.reject(new Error('failed'))
        .catch((error: Error): string => {
          expect(error.message).assertEqual('failed');
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
          expect(error.message).assertEqual('then error');
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainMultipleCatchFirstCatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainMultipleCatchFirstCatch';
      console.info(`${caseName} test start`);

      let catchCount: number = 0;

      await Promise.reject(new Error('error'))
        .catch((error: Error): string => {
          expect(error.message).assertEqual('error');
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainCatchThrowNextCatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainCatchThrowNextCatch';
      console.info(`${caseName} test start`);

      await Promise.reject(new Error('original'))
        .catch((error: Error): string => {
          expect(error.message).assertEqual('original');
          throw new Error('new error');
        })
        .catch((error: Error): string => {
          expect(error.message).assertEqual('new error');
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainCatchRecoverContinue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainCatchRecoverContinue';
      console.info(`${caseName} test start`);

      await Promise.reject(new Error('failed'))
        .catch((error: Error): string => {
          expect(error.message).assertEqual('failed');
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainCatchRecoverFinallyContinue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainCatchRecoverFinallyContinue';
      console.info(`${caseName} test start`);

      let finallyExecuted: boolean = false;

      await Promise.reject(new Error('failed'))
        .catch((error: Error): string => {
          expect(error.message).assertEqual('failed');
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainMultipleRejectRecover', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseChainMultipleRejectRecover';
      console.info(`${caseName} test start`);

      await Promise.reject(new Error('error1'))
        .catch((error: Error): Promise<string> => {
          expect(error.message).assertEqual('error1');
          return Promise.reject(new Error('error2'));
        })
        .catch((error: Error): string => {
          expect(error.message).assertEqual('error2');
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseCatchReturnString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseCatchReturnString';
      console.info(`${caseName} test start`);

      await Promise.reject(new Error('failed'))
        .catch((error: Error): string => {
          expect(error.message).assertEqual('failed');
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseCatchReturnUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseCatchReturnUndefined';
      console.info(`${caseName} test start`);

      await Promise.reject(new Error('failed'))
        .catch((error: Error): undefined => {
          expect(error.message).assertEqual('failed');
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseCatchReturnPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseCatchReturnPromise';
      console.info(`${caseName} test start`);

      await Promise.reject(new Error('failed'))
        .catch((error: Error): Promise<string> => {
          expect(error.message).assertEqual('failed');
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseCatchThrowError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseCatchThrowError';
      console.info(`${caseName} test start`);

      await Promise.reject(new Error('original'))
        .catch((error: Error): string => {
          expect(error.message).assertEqual('original');
          throw new Error('new error');
        })
        .catch((error: Error): string => {
          expect(error.message).assertEqual('new error');
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseCatchReturnRejectPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseCatchReturnRejectPromise';
      console.info(`${caseName} test start`);

      await Promise.reject(new Error('original'))
        .catch((error: Error): Promise<string> => {
          expect(error.message).assertEqual('original');
          return Promise.reject(new Error('rejected again'));
        })
        .catch((error: Error): string => {
          expect(error.message).assertEqual('rejected again');
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseCatchNoReturn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseCatchNoReturn';
      console.info(`${caseName} test start`);

      await Promise.reject(new Error('failed'))
        .catch((error: Error): void => {
          expect(error.message).assertEqual('failed');
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseFinallyRejectCatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseFinallyRejectCatch';
      console.info(`${caseName} test start`);

      let finallyExecuted: boolean = false;

      await Promise.reject(new Error('failed'))
        .catch((error: Error): string => {
          expect(error.message).assertEqual('failed');
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
          expect(error.message).assertEqual('finally error');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_CATCH_FINALLY_1400
     * @tc.name testPromiseFinallyReturnRejectPromise
     * @tc.desc Test Promise finally returning Promise.reject() - verify error propagates to catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseFinallyReturnRejectPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testPromiseFinallyReturnRejectPromise';
      console.info(`${caseName} test start`);

      await Promise.resolve<string>('value')
        .finally(() => {
          return Promise.reject(new Error('finally reject'));
        })
        .catch((error: Error): void => {
          expect(error.message).assertEqual('finally reject');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_CATCH_FINALLY_1500
     * @tc.name testPromiseCustomErrorCatch
     * @tc.desc Test Promise catch with custom error class - verify error properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
          expect(customError.message).assertEqual('custom error');
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
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