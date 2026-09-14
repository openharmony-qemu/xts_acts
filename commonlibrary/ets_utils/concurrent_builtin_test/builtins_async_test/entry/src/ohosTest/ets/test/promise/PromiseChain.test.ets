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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import taskpool from '@ohos.taskpool';
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

const SLEEP_INTERVAL_MS: number = 20;

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

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: Function) => {
    setTimeout(resolve, ms);
  });
}

function step1(value: string): string {
  return value + '-step1';
}

function step2(value: string): string {
  return value + '-step2';
}

function step3(value: string): void {
  console.info('step3: ' + value);
}

function errorHandler(error: Error): string {
  return 'recovered';
}

function cleanup(): void {
  console.info('cleanup executed');
}

function processStep(value: string): string {
  return value + '-named';
}

function normalCatchHandler(error: Error): string {
  return 'recovered';
}

function normalFinallyHandler(): void {
  console.info('finally executed');
}

async function asyncFuncNested(): Promise<string> {
  return 'async result';
}

async function testChainNested(): Promise<void> {
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
}

class GenericA {
  x: number = 0;
}

class GenericB extends GenericA {
  y: number = 0;
}

class GenericC extends GenericB {
  z: number = 0;
}

class GenericD extends GenericC {
  w: number = 0;
}

class Chain<T extends GenericA> {
  public value: T;
  constructor(value: T) {
    this.value = value;
  }
  then<S extends T>(cb: (x: T) => S): Chain<S> {
    const result = cb(this.value);
    return new Chain<S>(result);
  }
}

class BaseDescribable extends GenericA {
  name: string = '';
  describe(): string {
    return this.name;
  }
}

class ExtendedDescribable extends BaseDescribable {
  version: number = 0;
  describe(): string {
    return this.name + '-v' + this.version;
  }
}

class FluentBuilder {
  private items: string[];
  constructor() {
    this.items = [];
  }
  add(item: string): FluentBuilder {
    this.items.push(item);
    return this;
  }
  remove(index: number): FluentBuilder {
    if (index >= 0 && index < this.items.length) {
      this.items.splice(index, 1);
    }
    return this;
  }
  count(): number {
    return this.items.length;
  }
  get(index: number): string {
    return this.items[index];
  }
  build(): string[] {
    return this.items;
  }
  buildPromise(): Promise<string[]> {
    return Promise.resolve(this.items);
  }
}

class ImmutableBuilder {
  items: string[] = [];
  add(item: string): ImmutableBuilder {
    const next: ImmutableBuilder = new ImmutableBuilder();
    for (let i = 0; i < this.items.length; i++) {
      next.items.push(this.items[i]);
    }
    next.items.push(item);
    return next;
  }
  count(): number {
    return this.items.length;
  }
  get(index: number): string {
    return this.items[index];
  }
}

class NumberAccumulator {
  total: number = 0;
  add(n: number): NumberAccumulator {
    this.total += n;
    return this;
  }
  multiply(n: number): NumberAccumulator {
    this.total *= n;
    return this;
  }
  reset(): NumberAccumulator {
    this.total = 0;
    return this;
  }
}

class Pair<A, B> {
  first: A;
  second: B;
  constructor(first: A, second: B) {
    this.first = first;
    this.second = second;
  }
  swap(): Pair<B, A> {
    return new Pair<B, A>(this.second, this.first);
  }
}

class TypedContainer<T> {
  value: T;
  constructor(value: T) {
    this.value = value;
  }
  map<S>(fn: (x: T) => S): TypedContainer<S> {
    return new TypedContainer<S>(fn(this.value));
  }
  get(): T {
    return this.value;
  }
}

interface OperationSuccess {
  status: string;
  data: string;
}

interface OperationFailure {
  status: string;
  error: string;
}

enum ProcessStatus {
  PENDING = 0,
  RUNNING = 1,
  COMPLETED = 2,
  FAILED = 3
}

interface UserProfile {
  name: string;
  age?: number;
  address?: AddressInfo;
}

interface AddressInfo {
  city: string;
  zip?: string;
}

interface ChainNode {
  value: string;
  next?: ChainNode;
}

interface ConfigOptions {
  timeout?: number;
  retries?: number;
  label?: string;
}

interface DatabaseConfig {
  host?: string;
  port?: number;
  auth?: AuthConfig;
}

interface AuthConfig {
  username?: string;
  password?: string;
}

function formatWithDefault(v: string, prefix: string = 'item'): string {
  return prefix + ':' + v;
}

function createDefaultContainer(value: string): TypedContainer<string> {
  return new TypedContainer<string>(value);
}

function createTypedContainerValue<T>(value: T): TypedContainer<T> {
  return new TypedContainer<T>(value);
}

let retryAttempt: number = 0;

function tryOnce(): Promise<string> {
  retryAttempt++;
  if (retryAttempt >= 3) {
    return Promise.resolve<string>('success');
  }
  return Promise.reject<string>(new Error(`attempt ${retryAttempt}`));
}

function chainAddHello(s: string): Promise<string> {
  return Promise.resolve('hello ' + s);
}

function chainToUpper(s: string): Promise<string> {
  return Promise.resolve(s.toUpperCase());
}

function chainAddExclamation(s: string): Promise<string> {
  return Promise.resolve(s + '!');
}

function countdownRecursive(n: number): Promise<string> {
  if (n <= 0) {
    return Promise.resolve<string>('done');
  }
  return Promise.resolve<number>(n - 1).then((next: number): Promise<string> => countdownRecursive(next));
}

function checkObjectType(v: Object): string {
  if (typeof v === 'number') return 'number';
  if (typeof v === 'string') return 'string';
  if (v instanceof GenericA) return 'GenericA';
  return 'other';
}

function createGenericB(x: number, y: number): GenericB {
  const b: GenericB = new GenericB();
  b.x = x;
  b.y = y;
  return b;
}

function createGenericC(x: number, y: number, z: number): GenericC {
  const c: GenericC = new GenericC();
  c.x = x;
  c.y = y;
  c.z = z;
  return c;
}

export default function promiseChainTest() {
  describe('PromiseChainTest', () => {
    beforeAll(() => {
      console.info('beforeAll called');
    });

    beforeEach(async () => {
      await sleep(SLEEP_INTERVAL_MS);
    });

    afterEach(() => {
      console.info('afterEach called');
    });

    afterAll(() => {
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
      async (done: Function): Promise<void> => {
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
      async (done: Function): Promise<void> => {
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
      async (done: Function): Promise<void> => {
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
      async (done: Function): Promise<void> => {
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
      async (done: Function): Promise<void> => {
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
      async (done: Function): Promise<void> => {
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
      async (done: Function): Promise<void> => {
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
      async (done: Function): Promise<void> => {
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
      async (done: Function): Promise<void> => {
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
      async (done: Function): Promise<void> => {
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainReturnPendingPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testPromiseChainReturnPendingPromise';
        console.info(`${caseName} test start`);

        await Promise.resolve<string>('start')
          .then((value: string): Promise<string> => {
            expect(value).assertEqual('start');
            return new Promise<string>((resolve: Function) => {
              setTimeout(() => {
                resolve('delayed');
              }, 50);
            });
          })
          .then((value: string): void => {
            expect(value).assertEqual('delayed');
          });

        await sleep(100);
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
      async (done: Function): Promise<void> => {
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
            expect(error.name).assertEqual('Error');
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainEmptyString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
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
      async (done: Function): Promise<void> => {
        const caseName = 'testPromiseChainEmptyObject';
        console.info(`${caseName} test start`);

        await Promise.resolve<void>(undefined)
          .then(() => {
            const emptyObj: Record<string, Object> = {};
            return emptyObj;
          })
          .then((obj: Record<string, Object>): void => {
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
      async (done: Function): Promise<void> => {
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
    it('testPromiseChainArrowFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
    it('testPromiseChainNormalFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
    it('testPromiseChainMixedFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
    it('testPromiseChainNamedFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testPromiseChainNamedFunction';
      console.info(`${caseName} test start`);

      await Promise.resolve<string>('start')
        .then(step1)
        .then(step2)
        .then(step3);

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
    it('testPromiseChainCatchArrowFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testPromiseChainCatchArrowFunction';
      console.info(`${caseName} test start`);

      await Promise.reject(new Error('error'))
        .catch((error: Error): string => {
          expect(error.message).assertEqual('error');
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainCatchNormalFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
    it('testPromiseChainCatchNamedFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
    it('testPromiseChainFinallyArrowFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
    it('testPromiseChainFinallyNormalFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testPromiseChainFinallyNormalFunction';
      console.info(`${caseName} test start`);

      let executed: boolean = false;

      await Promise.resolve<string>('value')
        .finally(normalFinallyHandler)
        .then((value: string): void => {
          expect(value).assertEqual('value');
          executed = true;
        });

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
    it('testPromiseChainFinallyNamedFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testPromiseChainFinallyNamedFunction';
      console.info(`${caseName} test start`);

      let executed: boolean = false;

      await Promise.resolve<string>('value')
        .finally(cleanup)
        .then((value: string): void => {
          expect(value).assertEqual('value');
          executed = true;
        });

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
    it('testPromiseChainMixedCatchFinally', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
    it('testPromiseChainComplexFunctionMix', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
    it('testPromiseChainThreeLevels', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
    it('testPromiseChainFiveLevels', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
    it('testPromiseChainTypeConversion', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
    it('testPromiseChainThenSuccessCatchSkip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
    it('testPromiseChainThenFailCatchExecute', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
    it('testPromiseChainMultipleThenThenCatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
    it('testPromiseChainSuccessCompleteFlow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
    it('testPromiseChainFailCompleteFlow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
    it('testPromiseChainThenFailCatchRecoverFinally', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
    it('testPromiseChainMultipleCatchFirstCatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
    it('testPromiseChainCatchThrowNextCatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
    it('testPromiseChainCatchRecoverContinue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
    it('testPromiseChainCatchRecoverFinallyContinue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
    it('testPromiseChainMultipleRejectRecover', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
    it('testPromiseCatchReturnString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testPromiseCatchReturnString';
      console.info(`${caseName} test start`);

      await Promise.reject(new Error('failed'))
        .catch((error: Error): string => {
          expect(error.message).assertEqual('failed');
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseCatchReturnUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
    it('testPromiseCatchReturnPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
    it('testPromiseCatchThrowError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
    it('testPromiseCatchReturnRejectPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
    it('testPromiseCatchNoReturn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
    it('testPromiseFinallyResolveThen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
    it('testPromiseFinallyRejectCatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
    it('testPromiseFinallyNoParameter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
    it('testPromiseFinallyReturnValueIgnored', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
    it('testPromiseFinallyReturnUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
    it('testPromiseFinallyReturnPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testPromiseFinallyReturnPromise';
      console.info(`${caseName} test start`);

      await Promise.resolve<string>('value')
        .finally(() => {
          return new Promise<void>((resolve: Function) => {
            setTimeout(resolve, 50);
          });
        })
        .then((value: string): void => {
          expect(value).assertEqual('value');
        });

      await sleep(100);
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
    it('testPromiseFinallyThrowError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
    it('testPromiseFinallyReturnRejectPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
    it('testPromiseCustomErrorCatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testPromiseCustomErrorCatch';
      console.info(`${caseName} test start`);

      class CustomError extends Error {
        public code: number;
        constructor(message: string, code: number) {
          super(message);
          this.name = 'CustomError';
          this.code = code;
        }
      }

      await Promise.resolve<void>(undefined)
        .then(() => {
          throw new CustomError('custom error', 500);
        })
        .catch((error: CustomError): string => {
          expect(error.message).assertEqual('custom error');
          expect(error.name).assertEqual('CustomError');
          expect(error.code).assertEqual(500);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_NESTED_0100
     * @tc.name testPromiseChainNestedPromise
     * @tc.desc Test Promise chain returning nested Promise - verify each layer input parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainNestedPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
    it('testPromiseChainDoubleNested', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainNestedErrorHandling', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testPromiseChainNestedErrorHandling';
      console.info(`${caseName} test start`);

      await Promise.resolve<string>('outer')
        .then((value: string): Promise<string> => {
          expect(value).assertEqual('outer');
          return Promise.reject(new Error('nested error'))
            .catch((error: Error): string => {
              expect(error.message).assertEqual('nested error');
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainAsyncFunctionThen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainAwaitPromiseChain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testPromiseChainAwaitPromiseChain';
      console.info(`${caseName} test start`);

      await testChainNested();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_NESTED_0600
     * @tc.name testPromiseChainNestedThenChain
     * @tc.desc Test nested Promise with inner then chain - verify each layer input parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainNestedThenChain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainValuePenetration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainErrorPenetration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testPromiseChainErrorPenetration';
      console.info(`${caseName} test start`);

      await Promise.reject(new Error('error'))
        .then((value: string): string => value)
        .then((value: string): string => value)
        .catch((error: Error): void => {
          expect(error.message).assertEqual('error');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_NESTED_0900
     * @tc.name testPromiseChainCreateNewPromise
     * @tc.desc Test Promise chain creating new Promise inside then - verify each layer input parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainCreateNewPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testPromiseChainCreateNewPromise';
      console.info(`${caseName} test start`);

      await Promise.resolve<void>(undefined)
        .then(() => {
          return new Promise<string>((resolve: Function) => {
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainResolveRejectThen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testPromiseChainResolveRejectThen';
      console.info(`${caseName} test start`);

      await Promise.resolve<void>(undefined)
        .then(() => {
          throw new Error('then error');
        })
        .catch((error: Error): void => {
          expect(error.message).assertEqual('then error');
        });

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_NESTED_1100
     * @tc.name testPromiseChainPromiseAllNested
     * @tc.desc Test Promise.all with nested chains - verify each chain value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainPromiseAllNested', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainAsyncAwaitInThen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testPromiseChainAsyncAwaitInThen';
      console.info(`${caseName} test start`);

      await Promise.resolve<string>('start')
        .then(async (value: string): Promise<string> => {
          expect(value).assertEqual('start');
          const delayed: string = await new Promise<string>((resolve: Function) => {
            setTimeout(() => {
              resolve('delayed');
            }, 50);
          });
          return value + '-' + delayed;
        })
        .then((value: string): void => {
          expect(value).assertEqual('start-delayed');
        });

      await sleep(100);
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_SPECIAL_0100
     * @tc.name testPromiseChainMaxValue
     * @tc.desc Test Promise chain returning Number.MAX_VALUE - verify each layer input parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainMaxValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainMinValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainLongString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainLargeArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainCircularObject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainDateObject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainMapObject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainSetObject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainDataProcessing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testPromiseChainDataProcessing';
      console.info(`${caseName} test start`);

      await Promise.resolve<string>('{"value": 100}')
        .then((json: string): ValueObject => {
          expect(json).assertEqual('{"value": 100}');
          return JSON.parse(json) as ValueObject;
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainZeroValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainNegativeValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainFalseValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainComplexObject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
        .then((obj): void => {
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainUnicodeString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainExportedPromiseFunc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainExportedPromiseArrow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainDefaultExportedPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainExportedPromiseClassMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPromiseChainExportedMultiplePromiseClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function): Promise<void> => {
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainNamespacePromiseFunc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainNamespacePromiseClassMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPromiseChainInnerNamespacePromiseFunc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function): Promise<void> => {
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainInterfacePromiseMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainAbstractPromiseMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainSendablePromiseFunc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainSendablePromiseClassMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPromiseChainSendableMultiplePromiseClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function): Promise<void> => {
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainTaskPoolPromiseFunc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testPromiseChainTaskPoolPromiseFunc';
      console.info(`${caseName} test start`);

      const task = taskpool.execute(taskPoolPromiseFunc, 10);
      const result = await task as number;
      expect(result).assertEqual(20);

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_TASKPOOL_0200
     * @tc.name testPromiseChainTaskPoolAsyncPromise
     * @tc.desc Test TaskPool async Promise chain - verify each layer input parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainTaskPoolAsyncPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testPromiseChainTaskPoolAsyncPromise';
      console.info(`${caseName} test start`);

      const task = taskpool.execute(taskPoolAsyncPromise, 5);
      const result: number = await task as number;
      expect(result).assertEqual(15);

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_TASKPOOL_0300
     * @tc.name testPromiseChainTaskPoolPromiseChain
     * @tc.desc Test TaskPool multi-layer Promise chain - verify each layer input parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPromiseChainTaskPoolPromiseChain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function): Promise<void> => {
      const caseName = 'testPromiseChainTaskPoolPromiseChain';
      console.info(`${caseName} test start`);

      const task = taskpool.execute(taskPoolPromiseChain, 10, 5);
      const result: number = await task as number;
      expect(result).assertEqual(30);

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_STATIC_0100
     * @tc.name testPromiseRaceBasic
     * @tc.desc Test Promise.race with basic values - verify fastest Promise wins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseRaceBasic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testPromiseRaceBasic';
      console.info(`${caseName} test start`);

      const result: string = await Promise.race([
        Promise.resolve<string>('fast'),
        new Promise<string>((resolve: Function) => {
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseRaceReject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testPromiseRaceReject';
      console.info(`${caseName} test start`);

      try {
        await Promise.race([
          Promise.reject(new Error('first error')),
          Promise.resolve<string>('success')
        ]);
        expect().assertFail();
      } catch (error) {
        expect(error.message).assertEqual('first error');
      }

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_STATIC_0300
     * @tc.name testPromiseAllSettledMixed
     * @tc.desc Test Promise.allSettled with mixed results - verify all results captured
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseAllSettledMixed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testPromiseAllSettledMixed';
      console.info(`${caseName} test start`);

      const results: Object[] = await Promise.allSettled([
        Promise.resolve<string>('success'),
        Promise.reject(new Error('failed'))
      ]);
      
      expect(results.length).assertEqual(2);
      expect((results[0] as Record<string, string>).status).assertEqual('fulfilled');
      expect((results[1] as Record<string, string>).status).assertEqual('rejected');

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_STATIC_0400
     * @tc.name testPromiseAllSettledAllSuccess
     * @tc.desc Test Promise.allSettled with all success - verify all fulfilled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPromiseAllSettledAllSuccess', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function): Promise<void> => {
      const caseName = 'testPromiseAllSettledAllSuccess';
      console.info(`${caseName} test start`);

      const results: Object[] = await Promise.allSettled([
        Promise.resolve<number>(10)
          .then((v: number): number => v * 2),
        Promise.resolve<number>(20)
          .then((v: number): number => v + 5)
      ]);
      
      expect(results.length).assertEqual(2);
      expect((results[0] as Record<string, Object>).status).assertEqual('fulfilled');
      expect((results[1] as Record<string, Object>).status).assertEqual('fulfilled');

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_GENERIC_CHAIN_0100
     * @tc.name testGenericChainBasicDown
     * @tc.desc Test generic Chain narrowing from A to B to C - verify value at each layer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testGenericChainBasicDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testGenericChainBasicDown';
        console.info(`${caseName} test start`);

        const chainA: Chain<GenericA> = new Chain<GenericA>(new GenericA());
        chainA.value.x = 1;

        const chainB: Chain<GenericB> = chainA.then<GenericB>((a: GenericA): GenericB => {
          expect(a.x).assertEqual(1);
          const b: GenericB = new GenericB();
          b.x = a.x;
          b.y = 2;
          return b;
        });

        const chainC: Chain<GenericC> = chainB.then<GenericC>((b: GenericB): GenericC => {
          expect(b.x).assertEqual(1);
          expect(b.y).assertEqual(2);
          const c: GenericC = new GenericC();
          c.x = b.x;
          c.y = b.y;
          c.z = 3;
          return c;
        });

        expect(chainC.value.x).assertEqual(1);
        expect(chainC.value.y).assertEqual(2);
        expect(chainC.value.z).assertEqual(3);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_GENERIC_CHAIN_0200
     * @tc.name testGenericChainSameTypeReturn
     * @tc.desc Test generic Chain returning same type at each layer - verify type preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testGenericChainSameTypeReturn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testGenericChainSameTypeReturn';
        console.info(`${caseName} test start`);

        const chainA: Chain<GenericA> = new Chain<GenericA>(new GenericA());
        chainA.value.x = 10;

        const chainA2: Chain<GenericA> = chainA.then<GenericA>((a: GenericA): GenericA => {
          expect(a.x).assertEqual(10);
          a.x = 20;
          return a;
        });

        const chainA3: Chain<GenericA> = chainA2.then<GenericA>((a: GenericA): GenericA => {
          expect(a.x).assertEqual(20);
          a.x = 30;
          return a;
        });

        expect(chainA3.value.x).assertEqual(30);
        expect(chainA3.value instanceof GenericA).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_GENERIC_CHAIN_0300
     * @tc.name testGenericChainPropertyAccess
     * @tc.desc Test generic Chain property access at narrowed types - verify subclass properties accessible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testGenericChainPropertyAccess', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testGenericChainPropertyAccess';
        console.info(`${caseName} test start`);

        const chainA: Chain<GenericA> = new Chain<GenericA>(new GenericA());
        chainA.value.x = 100;

        const chainB: Chain<GenericB> = chainA.then<GenericB>((a: GenericA): GenericB => {
          expect(a.x).assertEqual(100);
          const b: GenericB = new GenericB();
          b.x = a.x;
          b.y = 200;
          return b;
        });

        expect(chainB.value.x).assertEqual(100);
        expect(chainB.value.y).assertEqual(200);

        const chainC: Chain<GenericC> = chainB.then<GenericC>((b: GenericB): GenericC => {
          expect(b.x).assertEqual(100);
          expect(b.y).assertEqual(200);
          const c: GenericC = new GenericC();
          c.x = b.x;
          c.y = b.y;
          c.z = 300;
          return c;
        });

        expect(chainC.value.x).assertEqual(100);
        expect(chainC.value.y).assertEqual(200);
        expect(chainC.value.z).assertEqual(300);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_GENERIC_CHAIN_0400
     * @tc.name testGenericChainValueFlow
     * @tc.desc Test generic Chain value modification flows through chain - verify modified values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testGenericChainValueFlow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testGenericChainValueFlow';
        console.info(`${caseName} test start`);

        const chainA: Chain<GenericA> = new Chain<GenericA>(new GenericA());
        chainA.value.x = 1;

        const chainB: Chain<GenericB> = chainA.then<GenericB>((a: GenericA): GenericB => {
          const b: GenericB = new GenericB();
          b.x = a.x + 1;
          b.y = 10;
          return b;
        });

        const chainC: Chain<GenericC> = chainB.then<GenericC>((b: GenericB): GenericC => {
          const c: GenericC = new GenericC();
          c.x = b.x + 1;
          c.y = b.y + 10;
          c.z = 100;
          return c;
        });

        expect(chainA.value.x).assertEqual(1);
        expect(chainB.value.x).assertEqual(2);
        expect(chainB.value.y).assertEqual(10);
        expect(chainC.value.x).assertEqual(3);
        expect(chainC.value.y).assertEqual(20);
        expect(chainC.value.z).assertEqual(100);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_GENERIC_CHAIN_0500
     * @tc.name testGenericChainInstanceofCheck
     * @tc.desc Test generic Chain instanceof verification at each layer - verify type narrowing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testGenericChainInstanceofCheck', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testGenericChainInstanceofCheck';
        console.info(`${caseName} test start`);

        const chainA: Chain<GenericA> = new Chain<GenericA>(new GenericA());
        expect(chainA.value instanceof GenericA).assertTrue();
        expect(chainA.value instanceof GenericB).assertFalse();
        expect(chainA.value instanceof GenericC).assertFalse();

        const chainB: Chain<GenericB> = chainA.then<GenericB>((a: GenericA): GenericB => {
          return new GenericB();
        });

        expect(chainB.value instanceof GenericA).assertTrue();
        expect(chainB.value instanceof GenericB).assertTrue();
        expect(chainB.value instanceof GenericC).assertFalse();

        const chainC: Chain<GenericC> = chainB.then<GenericC>((b: GenericB): GenericC => {
          return new GenericC();
        });

        expect(chainC.value instanceof GenericA).assertTrue();
        expect(chainC.value instanceof GenericB).assertTrue();
        expect(chainC.value instanceof GenericC).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_GENERIC_CHAIN_0600
     * @tc.name testGenericChainMixedNarrowing
     * @tc.desc Test generic Chain with mixed narrowing and same-type returns - verify type at each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testGenericChainMixedNarrowing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testGenericChainMixedNarrowing';
        console.info(`${caseName} test start`);

        const chainA: Chain<GenericA> = new Chain<GenericA>(new GenericA());
        chainA.value.x = 5;

        const chainA2: Chain<GenericA> = chainA.then<GenericA>((a: GenericA): GenericA => {
          expect(a.x).assertEqual(5);
          a.x = 10;
          return a;
        });

        const chainB: Chain<GenericB> = chainA2.then<GenericB>((a: GenericA): GenericB => {
          expect(a.x).assertEqual(10);
          const b: GenericB = new GenericB();
          b.x = a.x;
          b.y = 20;
          return b;
        });

        const chainB2: Chain<GenericB> = chainB.then<GenericB>((b: GenericB): GenericB => {
          expect(b.x).assertEqual(10);
          expect(b.y).assertEqual(20);
          b.y = 30;
          return b;
        });

        const chainC: Chain<GenericC> = chainB2.then<GenericC>((b: GenericB): GenericC => {
          expect(b.x).assertEqual(10);
          expect(b.y).assertEqual(30);
          const c: GenericC = new GenericC();
          c.x = b.x;
          c.y = b.y;
          c.z = 40;
          return c;
        });

        expect(chainC.value.x).assertEqual(10);
        expect(chainC.value.y).assertEqual(30);
        expect(chainC.value.z).assertEqual(40);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_GENERIC_CHAIN_0700
     * @tc.name testGenericChainFourLevelHierarchy
     * @tc.desc Test generic Chain with four-level hierarchy A to B to C to D - verify all properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testGenericChainFourLevelHierarchy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName = 'testGenericChainFourLevelHierarchy';
        console.info(`${caseName} test start`);

        const chainA: Chain<GenericA> = new Chain<GenericA>(new GenericA());
        chainA.value.x = 1;

        const chainB: Chain<GenericB> = chainA.then<GenericB>((a: GenericA): GenericB => {
          expect(a.x).assertEqual(1);
          const b: GenericB = new GenericB();
          b.x = a.x;
          b.y = 2;
          return b;
        });

        const chainC: Chain<GenericC> = chainB.then<GenericC>((b: GenericB): GenericC => {
          expect(b.x).assertEqual(1);
          expect(b.y).assertEqual(2);
          const c: GenericC = new GenericC();
          c.x = b.x;
          c.y = b.y;
          c.z = 3;
          return c;
        });

        const chainD: Chain<GenericD> = chainC.then<GenericD>((c: GenericC): GenericD => {
          expect(c.x).assertEqual(1);
          expect(c.y).assertEqual(2);
          expect(c.z).assertEqual(3);
          const d: GenericD = new GenericD();
          d.x = c.x;
          d.y = c.y;
          d.z = c.z;
          d.w = 4;
          return d;
        });

        expect(chainD.value.x).assertEqual(1);
        expect(chainD.value.y).assertEqual(2);
        expect(chainD.value.z).assertEqual(3);
        expect(chainD.value.w).assertEqual(4);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_GENERIC_CHAIN_0800
     * @tc.name testGenericChainFiveConsecutiveThen
     * @tc.desc Test generic Chain with five consecutive then calls A-B-C-C-C - verify final value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testGenericChainFiveConsecutiveThen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testGenericChainFiveConsecutiveThen';
        console.info(`${caseName} test start`);

        const chainA: Chain<GenericA> = new Chain<GenericA>(new GenericA());
        chainA.value.x = 1;

        const chainB: Chain<GenericB> = chainA.then<GenericB>((a: GenericA): GenericB => {
          const b: GenericB = new GenericB();
          b.x = a.x;
          b.y = 2;
          return b;
        });

        const chainC1: Chain<GenericC> = chainB.then<GenericC>((b: GenericB): GenericC => {
          const c: GenericC = new GenericC();
          c.x = b.x;
          c.y = b.y;
          c.z = 3;
          return c;
        });

        const chainC2: Chain<GenericC> = chainC1.then<GenericC>((c: GenericC): GenericC => {
          expect(c.x).assertEqual(1);
          expect(c.y).assertEqual(2);
          expect(c.z).assertEqual(3);
          c.z = 30;
          return c;
        });

        const chainC3: Chain<GenericC> = chainC2.then<GenericC>((c: GenericC): GenericC => {
          expect(c.x).assertEqual(1);
          expect(c.y).assertEqual(2);
          expect(c.z).assertEqual(30);
          c.z = 300;
          return c;
        });

        expect(chainC3.value.x).assertEqual(1);
        expect(chainC3.value.y).assertEqual(2);
        expect(chainC3.value.z).assertEqual(300);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_PROMISE_HIERARCHY_0100
     * @tc.name testPromiseChainClassHierarchyDown
     * @tc.desc Test Promise chain with class hierarchy narrowing A to B to C - verify each layer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainClassHierarchyDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testPromiseChainClassHierarchyDown';
        console.info(`${caseName} test start`);

        const result: GenericC = await Promise.resolve<GenericA>(new GenericA())
          .then((a: GenericA): GenericB => {
            expect(a.x).assertEqual(0);
            a.x = 1;
            const b: GenericB = new GenericB();
            b.x = a.x;
            b.y = 2;
            return b;
          })
          .then((b: GenericB): GenericC => {
            expect(b.x).assertEqual(1);
            expect(b.y).assertEqual(2);
            const c: GenericC = new GenericC();
            c.x = b.x;
            c.y = b.y;
            c.z = 3;
            return c;
          });

        expect(result.x).assertEqual(1);
        expect(result.y).assertEqual(2);
        expect(result.z).assertEqual(3);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_PROMISE_HIERARCHY_0200
     * @tc.name testPromiseChainSubclassPropertyAccess
     * @tc.desc Test Promise chain subclass property access - verify subclass properties accessible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainSubclassPropertyAccess', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testPromiseChainSubclassPropertyAccess';
        console.info(`${caseName} test start`);

        const result: GenericC = await Promise.resolve<GenericA>(new GenericA())
          .then((a: GenericA): GenericB => {
            const b: GenericB = new GenericB();
            b.x = 10;
            b.y = 20;
            return b;
          })
          .then((b: GenericB): GenericC => {
            expect(b.x).assertEqual(10);
            expect(b.y).assertEqual(20);
            const c: GenericC = new GenericC();
            c.x = b.x;
            c.y = b.y;
            c.z = 30;
            return c;
          });

        expect(result.x).assertEqual(10);
        expect(result.y).assertEqual(20);
        expect(result.z).assertEqual(30);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_PROMISE_HIERARCHY_0300
     * @tc.name testPromiseChainInstanceofInPromise
     * @tc.desc Test Promise chain instanceof verification - verify runtime type at each layer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainInstanceofInPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testPromiseChainInstanceofInPromise';
        console.info(`${caseName} test start`);

        const result: GenericC = await Promise.resolve<GenericA>(new GenericA())
          .then((a: GenericA): GenericB => {
            expect(a instanceof GenericA).assertTrue();
            const b: GenericB = new GenericB();
            return b;
          })
          .then((b: GenericB): GenericC => {
            expect(b instanceof GenericA).assertTrue();
            expect(b instanceof GenericB).assertTrue();
            const c: GenericC = new GenericC();
            return c;
          });

        expect(result instanceof GenericA).assertTrue();
        expect(result instanceof GenericB).assertTrue();
        expect(result instanceof GenericC).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_PROMISE_HIERARCHY_0400
     * @tc.name testPromiseChainPropertyAccumulation
     * @tc.desc Test Promise chain property accumulation x then x+y then x+y+z - verify accumulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainPropertyAccumulation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testPromiseChainPropertyAccumulation';
        console.info(`${caseName} test start`);

        const result: GenericC = await Promise.resolve<GenericA>(new GenericA())
          .then((a: GenericA): GenericA => {
            a.x = 1;
            expect(a.x).assertEqual(1);
            return a;
          })
          .then((a: GenericA): GenericB => {
            const b: GenericB = new GenericB();
            b.x = a.x;
            b.y = 2;
            expect(b.x).assertEqual(1);
            expect(b.y).assertEqual(2);
            return b;
          })
          .then((b: GenericB): GenericC => {
            const c: GenericC = new GenericC();
            c.x = b.x;
            c.y = b.y;
            c.z = 3;
            expect(c.x).assertEqual(1);
            expect(c.y).assertEqual(2);
            expect(c.z).assertEqual(3);
            return c;
          });

        expect(result.x).assertEqual(1);
        expect(result.y).assertEqual(2);
        expect(result.z).assertEqual(3);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_PROMISE_HIERARCHY_0500
     * @tc.name testPromiseChainBaseClassPropertyFromDerived
     * @tc.desc Test Promise chain base class property access from derived instance - verify inheritance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainBaseClassPropertyFromDerived', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testPromiseChainBaseClassPropertyFromDerived';
        console.info(`${caseName} test start`);

        const result: GenericC = await Promise.resolve<GenericB>(new GenericB())
          .then((b: GenericB): GenericC => {
            b.x = 100;
            b.y = 200;
            const c: GenericC = new GenericC();
            c.x = b.x;
            c.y = b.y;
            c.z = 300;
            return c;
          });

        expect(result.x).assertEqual(100);
        expect(result.y).assertEqual(200);
        expect(result.z).assertEqual(300);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_PROMISE_HIERARCHY_0600
     * @tc.name testPromiseChainSameClassInPromise
     * @tc.desc Test Promise chain returning same class type at each layer - verify type preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainSameClassInPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testPromiseChainSameClassInPromise';
        console.info(`${caseName} test start`);

        const result: GenericC = await Promise.resolve<GenericC>(new GenericC())
          .then((c: GenericC): GenericC => {
            c.x = 1;
            c.y = 2;
            c.z = 3;
            return c;
          })
          .then((c: GenericC): GenericC => {
            expect(c.x).assertEqual(1);
            expect(c.y).assertEqual(2);
            expect(c.z).assertEqual(3);
            c.z = 30;
            return c;
          })
          .then((c: GenericC): GenericC => {
            expect(c.x).assertEqual(1);
            expect(c.y).assertEqual(2);
            expect(c.z).assertEqual(30);
            return c;
          });

        expect(result.x).assertEqual(1);
        expect(result.y).assertEqual(2);
        expect(result.z).assertEqual(30);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_PROMISE_HIERARCHY_0700
     * @tc.name testPromiseChainClassAndPrimitiveMix
     * @tc.desc Test Promise chain mixing class types and primitive types - verify type conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainClassAndPrimitiveMix', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testPromiseChainClassAndPrimitiveMix';
        console.info(`${caseName} test start`);

        const result: string = await Promise.resolve<GenericA>(new GenericA())
          .then((a: GenericA): number => {
            a.x = 42;
            return a.x;
          })
          .then((n: number): GenericB => {
            expect(n).assertEqual(42);
            const b: GenericB = new GenericB();
            b.x = n;
            b.y = 100;
            return b;
          })
          .then((b: GenericB): string => {
            expect(b.x).assertEqual(42);
            expect(b.y).assertEqual(100);
            return `x=${b.x},y=${b.y}`;
          });

        expect(result).assertEqual('x=42,y=100');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_PROMISE_HIERARCHY_0800
     * @tc.name testPromiseChainFourLevelInPromise
     * @tc.desc Test Promise chain with four-level class hierarchy A to B to C to D - verify all properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPromiseChainFourLevelInPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName = 'testPromiseChainFourLevelInPromise';
        console.info(`${caseName} test start`);

        const result: GenericD = await Promise.resolve<GenericA>(new GenericA())
          .then((a: GenericA): GenericB => {
            a.x = 1;
            const b: GenericB = new GenericB();
            b.x = a.x;
            b.y = 2;
            return b;
          })
          .then((b: GenericB): GenericC => {
            const c: GenericC = new GenericC();
            c.x = b.x;
            c.y = b.y;
            c.z = 3;
            return c;
          })
          .then((c: GenericC): GenericD => {
            const d: GenericD = new GenericD();
            d.x = c.x;
            d.y = c.y;
            d.z = c.z;
            d.w = 4;
            return d;
          });

        expect(result.x).assertEqual(1);
        expect(result.y).assertEqual(2);
        expect(result.z).assertEqual(3);
        expect(result.w).assertEqual(4);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_TYPE_NARROWING_0100
     * @tc.name testTypeNarrowingMethodOverride
     * @tc.desc Test Promise chain with method override in class hierarchy - verify polymorphic behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTypeNarrowingMethodOverride', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testTypeNarrowingMethodOverride';
        console.info(`${caseName} test start`);

        const result: ExtendedDescribable = await Promise.resolve<BaseDescribable>(new BaseDescribable())
          .then((base: BaseDescribable): ExtendedDescribable => {
            base.name = 'test';
            const ext: ExtendedDescribable = new ExtendedDescribable();
            ext.name = base.name;
            ext.version = 1;
            return ext;
          });

        expect(result.name).assertEqual('test');
        expect(result.version).assertEqual(1);
        expect(result.describe()).assertEqual('test-v1');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_TYPE_NARROWING_0200
     * @tc.name testTypeNarrowingMethodChain
     * @tc.desc Test Promise chain with method override through hierarchy - verify polymorphic dispatch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTypeNarrowingMethodChain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testTypeNarrowingMethodChain';
        console.info(`${caseName} test start`);

        const result: string = await Promise.resolve<BaseDescribable>(new BaseDescribable())
          .then((base: BaseDescribable): ExtendedDescribable => {
            base.name = 'base';
            const ext: ExtendedDescribable = new ExtendedDescribable();
            ext.name = base.name;
            ext.version = 2;
            return ext;
          })
          .then((ext: ExtendedDescribable): string => {
            return ext.describe();
          });

        expect(result).assertEqual('base-v2');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_TYPE_NARROWING_0300
     * @tc.name testTypeNarrowingErrorInChain
     * @tc.desc Test generic Chain error handling with throw in callback - verify error propagation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTypeNarrowingErrorInChain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testTypeNarrowingErrorInChain';
        console.info(`${caseName} test start`);

        const chain: Chain<GenericA> = new Chain<GenericA>(new GenericA());
        chain.value.x = 1;

        try {
          chain.then<GenericB>((a: GenericA): GenericB => {
            expect(a.x).assertEqual(1);
            throw new Error('chain error');
          });
          expect().assertFail();
        } catch (error) {
          expect((error as Error).message).assertEqual('chain error');
        }

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_TYPE_NARROWING_0400
     * @tc.name testTypeNarrowingAsyncCallback
     * @tc.desc Test Promise chain with async callback returning narrowed type - verify async narrowing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTypeNarrowingAsyncCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testTypeNarrowingAsyncCallback';
        console.info(`${caseName} test start`);

        const result: GenericC = await Promise.resolve<GenericA>(new GenericA())
          .then(async (a: GenericA): Promise<GenericB> => {
            a.x = 1;
            const b: GenericB = new GenericB();
            b.x = a.x;
            b.y = 2;
            return b;
          })
          .then(async (b: GenericB): Promise<GenericC> => {
            expect(b.x).assertEqual(1);
            expect(b.y).assertEqual(2);
            const c: GenericC = new GenericC();
            c.x = b.x;
            c.y = b.y;
            c.z = 3;
            return c;
          });

        expect(result.x).assertEqual(1);
        expect(result.y).assertEqual(2);
        expect(result.z).assertEqual(3);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_TYPE_NARROWING_0500
     * @tc.name testTypeNarrowingArrayOfType
     * @tc.desc Test Promise chain with array of class hierarchy types - verify array element types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTypeNarrowingArrayOfType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testTypeNarrowingArrayOfType';
        console.info(`${caseName} test start`);

        const result: GenericC[] = await Promise.resolve<GenericA>(new GenericA())
          .then((a: GenericA): GenericA[] => {
            a.x = 1;
            return [a, new GenericA(), new GenericA()];
          })
          .then((arr: GenericA[]): GenericB[] => {
            expect(arr.length).assertEqual(3);
            const b1: GenericB = new GenericB();
            b1.x = arr[0].x;
            b1.y = 10;
            const b2: GenericB = new GenericB();
            b2.x = arr[1].x;
            b2.y = 20;
            return [b1, b2];
          })
          .then((arr: GenericB[]): GenericC[] => {
            expect(arr.length).assertEqual(2);
            const c1: GenericC = new GenericC();
            c1.x = arr[0].x;
            c1.y = arr[0].y;
            c1.z = 100;
            const c2: GenericC = new GenericC();
            c2.x = arr[1].x;
            c2.y = arr[1].y;
            c2.z = 200;
            return [c1, c2];
          });

        expect(result.length).assertEqual(2);
        expect(result[0].x).assertEqual(1);
        expect(result[0].y).assertEqual(10);
        expect(result[0].z).assertEqual(100);
        expect(result[1].y).assertEqual(20);
        expect(result[1].z).assertEqual(200);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_TYPE_NARROWING_0600
     * @tc.name testTypeNarrowingConstraintBoundary
     * @tc.desc Test generic Chain boundary where S equals T - verify same type satisfies constraint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTypeNarrowingConstraintBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testTypeNarrowingConstraintBoundary';
        console.info(`${caseName} test start`);

        const chainA: Chain<GenericA> = new Chain<GenericA>(new GenericA());
        chainA.value.x = 50;

        const chainA2: Chain<GenericA> = chainA.then<GenericA>((a: GenericA): GenericA => {
          expect(a.x).assertEqual(50);
          return a;
        });

        const chainA3: Chain<GenericA> = chainA2.then<GenericA>((a: GenericA): GenericA => {
          expect(a.x).assertEqual(50);
          a.x = 60;
          return a;
        });

        expect(chainA3.value.x).assertEqual(60);
        expect(chainA3.value instanceof GenericA).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_GENERIC_CHAIN_0900
     * @tc.name testGenericChainValueImmutability
     * @tc.desc Test generic Chain then does not modify original Chain - verify immutability
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testGenericChainValueImmutability', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testGenericChainValueImmutability';
        console.info(`${caseName} test start`);

        const chainA: Chain<GenericA> = new Chain<GenericA>(new GenericA());
        chainA.value.x = 1;

        const chainB: Chain<GenericB> = chainA.then<GenericB>((a: GenericA): GenericB => {
          const b: GenericB = new GenericB();
          b.x = a.x;
          b.y = 2;
          return b;
        });

        expect(chainA.value.x).assertEqual(1);
        expect(chainA.value instanceof GenericA).assertTrue();
        expect(chainA.value instanceof GenericB).assertFalse();
        expect(chainB.value.x).assertEqual(1);
        expect(chainB.value.y).assertEqual(2);
        expect(chainB.value instanceof GenericB).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_GENERIC_CHAIN_1000
     * @tc.name testGenericChainTenLevels
     * @tc.desc Test generic Chain with ten consecutive then calls A-B-C-D-D-D-D-D-D-D - verify stability
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testGenericChainTenLevels', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName = 'testGenericChainTenLevels';
        console.info(`${caseName} test start`);

        const chainA: Chain<GenericA> = new Chain<GenericA>(new GenericA());
        chainA.value.x = 1;

        const chainB: Chain<GenericB> = chainA.then<GenericB>((a: GenericA): GenericB => {
          const b: GenericB = new GenericB();
          b.x = a.x;
          b.y = 2;
          return b;
        });

        const chainC: Chain<GenericC> = chainB.then<GenericC>((b: GenericB): GenericC => {
          const c: GenericC = new GenericC();
          c.x = b.x;
          c.y = b.y;
          c.z = 3;
          return c;
        });

        const chainD1: Chain<GenericD> = chainC.then<GenericD>((c: GenericC): GenericD => {
          const d: GenericD = new GenericD();
          d.x = c.x;
          d.y = c.y;
          d.z = c.z;
          d.w = 4;
          return d;
        });

        const chainD2: Chain<GenericD> = chainD1.then<GenericD>((d: GenericD): GenericD => {
          d.w += 1;
          return d;
        });

        const chainD3: Chain<GenericD> = chainD2.then<GenericD>((d: GenericD): GenericD => {
          d.w += 1;
          return d;
        });

        const chainD4: Chain<GenericD> = chainD3.then<GenericD>((d: GenericD): GenericD => {
          d.w += 1;
          return d;
        });

        const chainD5: Chain<GenericD> = chainD4.then<GenericD>((d: GenericD): GenericD => {
          d.w += 1;
          return d;
        });

        const chainD6: Chain<GenericD> = chainD5.then<GenericD>((d: GenericD): GenericD => {
          d.w += 1;
          return d;
        });

        const chainD7: Chain<GenericD> = chainD6.then<GenericD>((d: GenericD): GenericD => {
          d.w += 1;
          return d;
        });

        expect(chainD7.value.x).assertEqual(1);
        expect(chainD7.value.y).assertEqual(2);
        expect(chainD7.value.z).assertEqual(3);
        expect(chainD7.value.w).assertEqual(10);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_GENERIC_CHAIN_1100
     * @tc.name testGenericChainConditionalReturn
     * @tc.desc Test generic Chain with conditional logic in callback - verify conditional property values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testGenericChainConditionalReturn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testGenericChainConditionalReturn';
        console.info(`${caseName} test start`);

        const chainA: Chain<GenericA> = new Chain<GenericA>(new GenericA());
        chainA.value.x = 10;

        const chainB: Chain<GenericB> = chainA.then<GenericB>((a: GenericA): GenericB => {
          const b: GenericB = new GenericB();
          b.x = a.x;
          if (a.x > 5) {
            b.y = 100;
          } else {
            b.y = 0;
          }
          return b;
        });

        const chainC: Chain<GenericC> = chainB.then<GenericC>((b: GenericB): GenericC => {
          const c: GenericC = new GenericC();
          c.x = b.x;
          c.y = b.y;
          if (b.y > 50) {
            c.z = 999;
          } else {
            c.z = 1;
          }
          return c;
        });

        expect(chainC.value.x).assertEqual(10);
        expect(chainC.value.y).assertEqual(100);
        expect(chainC.value.z).assertEqual(999);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_GENERIC_CHAIN_1200
     * @tc.name testGenericChainReusable
     * @tc.desc Test generic Chain then called multiple times on same Chain - verify independent branches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testGenericChainReusable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testGenericChainReusable';
        console.info(`${caseName} test start`);

        const chainA: Chain<GenericA> = new Chain<GenericA>(new GenericA());
        chainA.value.x = 5;

        const chainB1: Chain<GenericB> = chainA.then<GenericB>((a: GenericA): GenericB => {
          const b: GenericB = new GenericB();
          b.x = a.x;
          b.y = 10;
          return b;
        });

        const chainB2: Chain<GenericB> = chainA.then<GenericB>((a: GenericA): GenericB => {
          const b: GenericB = new GenericB();
          b.x = a.x;
          b.y = 20;
          return b;
        });

        expect(chainB1.value.y).assertEqual(10);
        expect(chainB2.value.y).assertEqual(20);
        expect(chainA.value.x).assertEqual(5);
        expect(chainA.value instanceof GenericB).assertFalse();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_GENERIC_CHAIN_1300
     * @tc.name testGenericChainPromiseIntegration
     * @tc.desc Test generic Chain integrated with Promise - verify Chain returned from Promise chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testGenericChainPromiseIntegration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testGenericChainPromiseIntegration';
        console.info(`${caseName} test start`);

        const result: GenericC = await Promise.resolve<GenericA>(new GenericA())
          .then((a: GenericA): GenericB => {
            a.x = 1;
            const b: GenericB = new GenericB();
            b.x = a.x;
            b.y = 2;
            const chainB: Chain<GenericB> = new Chain<GenericB>(b);
            expect(chainB.value.x).assertEqual(1);
            expect(chainB.value.y).assertEqual(2);
            return chainB.value;
          })
          .then((b: GenericB): GenericC => {
            const chainB: Chain<GenericB> = new Chain<GenericB>(b);
            const chainC: Chain<GenericC> = chainB.then<GenericC>((innerB: GenericB): GenericC => {
              const c: GenericC = new GenericC();
              c.x = innerB.x;
              c.y = innerB.y;
              c.z = 3;
              return c;
            });
            return chainC.value;
          });

        expect(result.x).assertEqual(1);
        expect(result.y).assertEqual(2);
        expect(result.z).assertEqual(3);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_GENERIC_CHAIN_1400
     * @tc.name testGenericChainFactoryPattern
     * @tc.desc Test generic Chain with factory functions in callbacks - verify factory pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testGenericChainFactoryPattern', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testGenericChainFactoryPattern';
        console.info(`${caseName} test start`);

        const chainA: Chain<GenericA> = new Chain<GenericA>(new GenericA());
        chainA.value.x = 1;

        const chainB: Chain<GenericB> = chainA.then<GenericB>((a: GenericA): GenericB => {
          return createGenericB(a.x, 2);
        });

        const chainC: Chain<GenericC> = chainB.then<GenericC>((b: GenericB): GenericC => {
          return createGenericC(b.x, b.y, 3);
        });

        expect(chainC.value.x).assertEqual(1);
        expect(chainC.value.y).assertEqual(2);
        expect(chainC.value.z).assertEqual(3);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_PROMISE_HIERARCHY_0900
     * @tc.name testPromiseHierarchyErrorRecovery
     * @tc.desc Test Promise chain with class hierarchy error recovery - verify catch recovers to class type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseHierarchyErrorRecovery', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testPromiseHierarchyErrorRecovery';
        console.info(`${caseName} test start`);

        const result: GenericC = await Promise.resolve<GenericA>(new GenericA())
          .then((a: GenericA): GenericB => {
            a.x = 1;
            throw new Error('hierarchy error');
          })
          .catch((error: Error): GenericB => {
            expect(error.message).assertEqual('hierarchy error');
            const b: GenericB = new GenericB();
            b.x = 1;
            b.y = 2;
            return b;
          })
          .then((b: GenericB): GenericC => {
            const c: GenericC = new GenericC();
            c.x = b.x;
            c.y = b.y;
            c.z = 3;
            return c;
          });

        expect(result.x).assertEqual(1);
        expect(result.y).assertEqual(2);
        expect(result.z).assertEqual(3);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_PROMISE_HIERARCHY_1000
     * @tc.name testPromiseHierarchyWithFinally
     * @tc.desc Test Promise chain with class hierarchy and finally - verify finally execution and value passing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseHierarchyWithFinally', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testPromiseHierarchyWithFinally';
        console.info(`${caseName} test start`);

        let finallyExecuted: boolean = false;

        const result: GenericC = await Promise.resolve<GenericA>(new GenericA())
          .then((a: GenericA): GenericB => {
            a.x = 1;
            const b: GenericB = new GenericB();
            b.x = a.x;
            b.y = 2;
            return b;
          })
          .then((b: GenericB): GenericC => {
            const c: GenericC = new GenericC();
            c.x = b.x;
            c.y = b.y;
            c.z = 3;
            return c;
          })
          .finally(() => {
            finallyExecuted = true;
          });

        expect(result.x).assertEqual(1);
        expect(result.y).assertEqual(2);
        expect(result.z).assertEqual(3);
        expect(finallyExecuted).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_PROMISE_HIERARCHY_1100
     * @tc.name testPromiseHierarchyAll
     * @tc.desc Test Promise.all with class hierarchy chains - verify parallel chain results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseHierarchyAll', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testPromiseHierarchyAll';
        console.info(`${caseName} test start`);

        const chain1: Promise<GenericC> = Promise.resolve<GenericA>(new GenericA())
          .then((a: GenericA): GenericC => {
            const c: GenericC = new GenericC();
            c.x = 1;
            c.y = 10;
            c.z = 100;
            return c;
          });

        const chain2: Promise<GenericC> = Promise.resolve<GenericB>(new GenericB())
          .then((b: GenericB): GenericC => {
            const c: GenericC = new GenericC();
            c.x = 2;
            c.y = 20;
            c.z = 200;
            return c;
          });

        const results: GenericC[] = await Promise.all([chain1, chain2]);

        expect(results.length).assertEqual(2);
        expect(results[0].x).assertEqual(1);
        expect(results[0].z).assertEqual(100);
        expect(results[1].x).assertEqual(2);
        expect(results[1].z).assertEqual(200);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_PROMISE_HIERARCHY_1200
     * @tc.name testPromiseHierarchyRace
     * @tc.desc Test Promise.race with class hierarchy chains - verify fastest chain wins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPromiseHierarchyRace', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName = 'testPromiseHierarchyRace';
        console.info(`${caseName} test start`);

        const fastC: GenericC = new GenericC();
        fastC.x = 99;
        fastC.y = 88;
        fastC.z = 77;

        const fastChain: Promise<GenericC> = Promise.resolve<GenericC>(fastC);

        const slowChain: Promise<GenericC> = new Promise<GenericC>((resolve: Function) => {
          setTimeout(() => {
            const c: GenericC = new GenericC();
            c.x = 1;
            resolve(c);
          }, 50);
        });

        const result: GenericC = await Promise.race([fastChain, slowChain]);

        expect(result.x).assertEqual(99);
        expect(result.y).assertEqual(88);
        expect(result.z).assertEqual(77);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_PROMISE_HIERARCHY_1300
     * @tc.name testPromiseHierarchyNestedPromise
     * @tc.desc Test nested Promise with class hierarchy - verify outer and inner chain values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseHierarchyNestedPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testPromiseHierarchyNestedPromise';
        console.info(`${caseName} test start`);

        const result: GenericC = await Promise.resolve<GenericA>(new GenericA())
          .then((a: GenericA): Promise<GenericB> => {
            a.x = 1;
            return Promise.resolve<GenericB>(new GenericB())
              .then((b: GenericB): GenericB => {
                b.x = a.x;
                b.y = 2;
                return b;
              });
          })
          .then((b: GenericB): GenericC => {
            const c: GenericC = new GenericC();
            c.x = b.x;
            c.y = b.y;
            c.z = 3;
            return c;
          });

        expect(result.x).assertEqual(1);
        expect(result.y).assertEqual(2);
        expect(result.z).assertEqual(3);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_PROMISE_HIERARCHY_1400
     * @tc.name testPromiseHierarchyAllSettled
     * @tc.desc Test Promise.allSettled with class hierarchy types - verify settled results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseHierarchyAllSettled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testPromiseHierarchyAllSettled';
        console.info(`${caseName} test start`);

        const results: Object[] = await Promise.allSettled([
          Promise.resolve<GenericA>(new GenericA())
            .then((a: GenericA): GenericB => {
              a.x = 1;
              const b: GenericB = new GenericB();
              b.x = a.x;
              b.y = 2;
              return b;
            }),
          Promise.reject<GenericB>(new Error('settled error'))
        ]);

        expect(results.length).assertEqual(2);
        expect((results[0] as Record<string, string>).status).assertEqual('fulfilled');
        expect((results[1] as Record<string, string>).status).assertEqual('rejected');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_TYPE_NARROWING_0700
     * @tc.name testTypeNarrowingWithMap
     * @tc.desc Test Promise chain with Map of class hierarchy types - verify Map value type narrowing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTypeNarrowingWithMap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testTypeNarrowingWithMap';
        console.info(`${caseName} test start`);

        const result: Map<string, GenericC> = await Promise.resolve<GenericA>(new GenericA())
          .then((a: GenericA): Map<string, GenericA> => {
            a.x = 1;
            const map: Map<string, GenericA> = new Map<string, GenericA>();
            map.set('a', a);
            return map;
          })
          .then((mapA: Map<string, GenericA>): Map<string, GenericB> => {
            const a: GenericA = mapA.get('a') as GenericA;
            const b: GenericB = new GenericB();
            b.x = a.x;
            b.y = 2;
            const mapB: Map<string, GenericB> = new Map<string, GenericB>();
            mapB.set('b', b);
            return mapB;
          })
          .then((mapB: Map<string, GenericB>): Map<string, GenericC> => {
            const b: GenericB = mapB.get('b') as GenericB;
            const c: GenericC = new GenericC();
            c.x = b.x;
            c.y = b.y;
            c.z = 3;
            const mapC: Map<string, GenericC> = new Map<string, GenericC>();
            mapC.set('c', c);
            return mapC;
          });

        const finalC: GenericC = result.get('c') as GenericC;
        expect(finalC.x).assertEqual(1);
        expect(finalC.y).assertEqual(2);
        expect(finalC.z).assertEqual(3);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_TYPE_NARROWING_0800
     * @tc.name testTypeNarrowingWithSet
     * @tc.desc Test Promise chain with Set of class hierarchy types - verify Set element type narrowing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTypeNarrowingWithSet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testTypeNarrowingWithSet';
        console.info(`${caseName} test start`);

        const result: Set<GenericC> = await Promise.resolve<GenericA>(new GenericA())
          .then((a: GenericA): Set<GenericB> => {
            a.x = 1;
            const b: GenericB = new GenericB();
            b.x = a.x;
            b.y = 2;
            const setB: Set<GenericB> = new Set<GenericB>();
            setB.add(b);
            return setB;
          })
          .then((setB: Set<GenericB>): Set<GenericC> => {
            const setC: Set<GenericC> = new Set<GenericC>();
            setB.forEach((b: GenericB) => {
              const c: GenericC = new GenericC();
              c.x = b.x;
              c.y = b.y;
              c.z = 3;
              setC.add(c);
            });
            return setC;
          });

        expect(result.size).assertEqual(1);
        let resultC: GenericC = new GenericC();
        result.forEach((c: GenericC) => {
          resultC = c;
        });
        expect(resultC.x).assertEqual(1);
        expect(resultC.y).assertEqual(2);
        expect(resultC.z).assertEqual(3);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_TYPE_NARROWING_0900
     * @tc.name testTypeNarrowingConditionalNarrowing
     * @tc.desc Test Promise chain with conditional logic causing type narrowing - verify conditional values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTypeNarrowingConditionalNarrowing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testTypeNarrowingConditionalNarrowing';
        console.info(`${caseName} test start`);

        const result: GenericC = await Promise.resolve<GenericA>(new GenericA())
          .then((a: GenericA): GenericB => {
            a.x = 10;
            const b: GenericB = new GenericB();
            b.x = a.x;
            if (a.x > 5) {
              b.y = 100;
            } else {
              b.y = 0;
            }
            return b;
          })
          .then((b: GenericB): GenericC => {
            const c: GenericC = new GenericC();
            c.x = b.x;
            c.y = b.y;
            if (b.y > 50) {
              c.z = 999;
            } else {
              c.z = 1;
            }
            return c;
          });

        expect(result.x).assertEqual(10);
        expect(result.y).assertEqual(100);
        expect(result.z).assertEqual(999);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_TYPE_NARROWING_1000
     * @tc.name testTypeNarrowingDeepChain
     * @tc.desc Test Promise chain with ten-level type narrowing A-B-C-D-D-D-D-D-D-D - verify deep chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTypeNarrowingDeepChain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testTypeNarrowingDeepChain';
        console.info(`${caseName} test start`);

        const result: GenericD = await Promise.resolve<GenericA>(new GenericA())
          .then((a: GenericA): GenericB => {
            a.x = 1;
            const b: GenericB = new GenericB();
            b.x = a.x;
            b.y = 2;
            return b;
          })
          .then((b: GenericB): GenericC => {
            const c: GenericC = new GenericC();
            c.x = b.x;
            c.y = b.y;
            c.z = 3;
            return c;
          })
          .then((c: GenericC): GenericD => {
            const d: GenericD = new GenericD();
            d.x = c.x;
            d.y = c.y;
            d.z = c.z;
            d.w = 4;
            return d;
          })
          .then((d: GenericD): GenericD => { d.w += 1; return d; })
          .then((d: GenericD): GenericD => { d.w += 1; return d; })
          .then((d: GenericD): GenericD => { d.w += 1; return d; })
          .then((d: GenericD): GenericD => { d.w += 1; return d; })
          .then((d: GenericD): GenericD => { d.w += 1; return d; })
          .then((d: GenericD): GenericD => { d.w += 1; return d; })
          .then((d: GenericD): GenericD => { d.w += 1; return d; });

        expect(result.x).assertEqual(1);
        expect(result.y).assertEqual(2);
        expect(result.z).assertEqual(3);
        expect(result.w).assertEqual(11);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_TYPE_NARROWING_1100
     * @tc.name testTypeNarrowingMethodOverrideDeep
     * @tc.desc Test deep method override through Promise chain - verify polymorphic dispatch at depth
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTypeNarrowingMethodOverrideDeep', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testTypeNarrowingMethodOverrideDeep';
        console.info(`${caseName} test start`);

        const result: string = await Promise.resolve<BaseDescribable>(new BaseDescribable())
          .then((base: BaseDescribable): ExtendedDescribable => {
            base.name = 'item';
            const ext: ExtendedDescribable = new ExtendedDescribable();
            ext.name = base.name;
            ext.version = 1;
            return ext;
          })
          .then((ext: ExtendedDescribable): ExtendedDescribable => {
            ext.version = 2;
            return ext;
          })
          .then((ext: ExtendedDescribable): ExtendedDescribable => {
            ext.version = 3;
            return ext;
          })
          .then((ext: ExtendedDescribable): string => {
            return ext.describe();
          });

        expect(result).assertEqual('item-v3');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_TYPE_NARROWING_1200
     * @tc.name testTypeNarrowingChainedMethodCalls
     * @tc.desc Test chained method calls on narrowed types - verify method chaining on subclass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTypeNarrowingChainedMethodCalls', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testTypeNarrowingChainedMethodCalls';
        console.info(`${caseName} test start`);

        const result: string = await Promise.resolve<BaseDescribable>(new BaseDescribable())
          .then((base: BaseDescribable): ExtendedDescribable => {
            base.name = 'chain';
            const ext: ExtendedDescribable = new ExtendedDescribable();
            ext.name = base.name;
            ext.version = 5;
            return ext;
          })
          .then((ext: ExtendedDescribable): ExtendedDescribable => {
            ext.version = ext.version + 5;
            return ext;
          })
          .then((ext: ExtendedDescribable): string => {
            return ext.describe().toUpperCase();
          });

        expect(result).assertEqual('CHAIN-V10');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_SELF_RETURNING_0100
     * @tc.name testFluentBuilderBasic
     * @tc.desc Test fluent builder returning this - verify items added via method chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testFluentBuilderBasic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testFluentBuilderBasic';
        console.info(`${caseName} test start`);

        const builder: FluentBuilder = new FluentBuilder();
        builder.add('a').add('b').add('c');

        expect(builder.count()).assertEqual(3);
        expect(builder.get(0)).assertEqual('a');
        expect(builder.get(1)).assertEqual('b');
        expect(builder.get(2)).assertEqual('c');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_SELF_RETURNING_0200
     * @tc.name testFluentBuilderChainedMethods
     * @tc.desc Test fluent builder with five method chain and remove - verify state after chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testFluentBuilderChainedMethods', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testFluentBuilderChainedMethods';
        console.info(`${caseName} test start`);

        const builder: FluentBuilder = new FluentBuilder();
        builder.add('a').add('b').add('c').add('d').add('e');

        expect(builder.count()).assertEqual(5);
        expect(builder.get(0)).assertEqual('a');
        expect(builder.get(4)).assertEqual('e');

        builder.remove(2);
        expect(builder.count()).assertEqual(4);
        expect(builder.get(2)).assertEqual('d');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_SELF_RETURNING_0300
     * @tc.name testFluentBuilderWithPromise
     * @tc.desc Test fluent builder buildPromise returning Promise - verify Promise integration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testFluentBuilderWithPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testFluentBuilderWithPromise';
        console.info(`${caseName} test start`);

        const builder: FluentBuilder = new FluentBuilder();
        builder.add('x').add('y').add('z');

        const items: string[] = await builder.buildPromise();
        expect(items.length).assertEqual(3);
        expect(items[0]).assertEqual('x');
        expect(items[2]).assertEqual('z');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_SELF_RETURNING_0400
     * @tc.name testFluentBuilderImmutable
     * @tc.desc Test immutable builder returning new instance - verify original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testFluentBuilderImmutable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testFluentBuilderImmutable';
        console.info(`${caseName} test start`);

        const builder1: ImmutableBuilder = new ImmutableBuilder();
        const builder2: ImmutableBuilder = builder1.add('a').add('b');

        expect(builder1.count()).assertEqual(0);
        expect(builder2.count()).assertEqual(2);
        expect(builder2.get(0)).assertEqual('a');
        expect(builder2.get(1)).assertEqual('b');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_SELF_RETURNING_0500
     * @tc.name testFluentBuilderConditional
     * @tc.desc Test fluent builder with conditional method execution - verify conditional branching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testFluentBuilderConditional', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testFluentBuilderConditional';
        console.info(`${caseName} test start`);

        const builder: FluentBuilder = new FluentBuilder();
        const x: number = 10;
        if (x > 5) {
          builder.add('big');
        } else {
          builder.add('small');
        }
        builder.add('done');

        expect(builder.count()).assertEqual(2);
        expect(builder.get(0)).assertEqual('big');
        expect(builder.get(1)).assertEqual('done');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_SELF_RETURNING_0600
     * @tc.name testFluentBuilderToPromise
     * @tc.desc Test fluent builder converted to Promise chain - verify builder to Promise integration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testFluentBuilderToPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testFluentBuilderToPromise';
        console.info(`${caseName} test start`);

        const builder: FluentBuilder = new FluentBuilder();
        builder.add('step1').add('step2').add('step3');

        const result: string = await builder.buildPromise()
          .then((items: string[]): number => items.length)
          .then((len: number): string => `count=${len}`);

        expect(result).assertEqual('count=3');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_SELF_RETURNING_0700
     * @tc.name testSelfReturningWithCatch
     * @tc.desc Test self-returning chain with error recovery - verify catch and continue fluent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSelfReturningWithCatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testSelfReturningWithCatch';
        console.info(`${caseName} test start`);

        let builder: FluentBuilder = new FluentBuilder();
        try {
          builder = builder.add('a').add('b');
          throw new Error('fluent error');
        } catch (error) {
          builder = builder.add('recovered');
        }

        expect(builder.count()).assertEqual(3);
        expect(builder.get(2)).assertEqual('recovered');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_SELF_RETURNING_0800
     * @tc.name testNumberAccumulatorChain
     * @tc.desc Test NumberAccumulator fluent chain add multiply reset - verify numerical fluent chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testNumberAccumulatorChain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testNumberAccumulatorChain';
        console.info(`${caseName} test start`);

        const acc: NumberAccumulator = new NumberAccumulator();
        acc.add(5).add(3).multiply(2);

        expect(acc.total).assertEqual(16);

        acc.reset();
        expect(acc.total).assertEqual(0);

        acc.add(10).multiply(3);
        expect(acc.total).assertEqual(30);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_GENERIC_ADVANCED_0100
     * @tc.name testGenericTypedContainerBasic
     * @tc.desc Test TypedContainer generic container basic usage - verify value storage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testGenericTypedContainerBasic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testGenericTypedContainerBasic';
        console.info(`${caseName} test start`);

        const container: TypedContainer<number> = new TypedContainer<number>(42);
        expect(container.get()).assertEqual(42);
        expect(container.value).assertEqual(42);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_GENERIC_ADVANCED_0200
     * @tc.name testGenericTypedContainerMap
     * @tc.desc Test TypedContainer map method transforming type - verify functor pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testGenericTypedContainerMap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testGenericTypedContainerMap';
        console.info(`${caseName} test start`);

        const container: TypedContainer<string> = new TypedContainer<string>('100');
        const mapped: TypedContainer<number> = container.map<number>((s: string): number => parseInt(s));

        expect(mapped.get()).assertEqual(100);
        expect(mapped.value).assertEqual(100);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_GENERIC_ADVANCED_0300
     * @tc.name testGenericPairBasic
     * @tc.desc Test Pair with multiple type parameters - verify first and second access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testGenericPairBasic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testGenericPairBasic';
        console.info(`${caseName} test start`);

        const pair: Pair<string, number> = new Pair<string, number>('hello', 42);
        expect(pair.first).assertEqual('hello');
        expect(pair.second).assertEqual(42);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_GENERIC_ADVANCED_0400
     * @tc.name testGenericPairSwap
     * @tc.desc Test Pair swap method interchanging type parameters - verify type swap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testGenericPairSwap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testGenericPairSwap';
        console.info(`${caseName} test start`);

        const pair: Pair<string, number> = new Pair<string, number>('hello', 42);
        const swapped: Pair<number, string> = pair.swap();

        expect(swapped.first).assertEqual(42);
        expect(swapped.second).assertEqual('hello');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_GENERIC_ADVANCED_0500
     * @tc.name testGenericTypedContainerChained
     * @tc.desc Test TypedContainer with chained map calls - verify multiple type transformations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testGenericTypedContainerChained', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testGenericTypedContainerChained';
        console.info(`${caseName} test start`);

        const container: TypedContainer<number> = new TypedContainer<number>(100);
        const result: TypedContainer<number> = container
          .map<string>((n: number): string => n.toString())
          .map<number>((s: string): number => parseInt(s) + 1);

        expect(result.get()).assertEqual(101);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_GENERIC_ADVANCED_0600
     * @tc.name testGenericTypedContainerWithPromise
     * @tc.desc Test TypedContainer integrated with Promise chain - verify container in Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testGenericTypedContainerWithPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testGenericTypedContainerWithPromise';
        console.info(`${caseName} test start`);

        const container: TypedContainer<number> = new TypedContainer<number>(5);
        const result: string = await Promise.resolve(container)
          .then((c: TypedContainer<number>): TypedContainer<string> => {
            return c.map<string>((n: number): string => `value=${n}`);
          })
          .then((c: TypedContainer<string>): string => {
            return c.get();
          });

        expect(result).assertEqual('value=5');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_PATTERN_0100
     * @tc.name testPromiseChainClosureCapture
     * @tc.desc Test Promise chain capturing outer variable in closure - verify closure capture
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainClosureCapture', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testPromiseChainClosureCapture';
        console.info(`${caseName} test start`);

        let captured: string = 'initial';
        await Promise.resolve<string>('captured-value')
          .then((v: string): string => {
            captured = v;
            return v;
          })
          .then((v: string): void => {
            expect(captured).assertEqual('captured-value');
            expect(v).assertEqual('captured-value');
          });

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_PATTERN_0200
     * @tc.name testPromiseChainRetry
     * @tc.desc Test Promise chain with retry logic using catch - verify retry succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainRetry', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testPromiseChainRetry';
        console.info(`${caseName} test start`);

        retryAttempt = 0;

        const result: string = await tryOnce()
          .catch((): Promise<string> => tryOnce())
          .catch((): Promise<string> => tryOnce())
          .catch((): Promise<string> => tryOnce());

        expect(result).assertEqual('success');
        expect(retryAttempt).assertEqual(3);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_PATTERN_0300
     * @tc.name testPromiseChainTimeout
     * @tc.desc Test Promise chain with timeout race - verify faster Promise wins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainTimeout', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testPromiseChainTimeout';
        console.info(`${caseName} test start`);

        const fastPromise: Promise<string> = new Promise<string>((resolve: Function) => {
          setTimeout((): void => { resolve('fast'); }, 50);
        });
        const timeoutPromise: Promise<string> = new Promise<string>((resolve: Function) => {
          setTimeout((): void => { resolve('timeout'); }, 200);
        });

        const result: string = await Promise.race([fastPromise, timeoutPromise]);
        expect(result).assertEqual('fast');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_PATTERN_0400
     * @tc.name testPromiseChainPipeline
     * @tc.desc Test Promise chain as data pipeline with filter map reduce - verify pipeline result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainPipeline', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testPromiseChainPipeline';
        console.info(`${caseName} test start`);

        const data: number[] = [1, 2, 3, 4];
        const result: number = await Promise.resolve<number[]>(data)
          .then((arr: number[]): number[] => arr.filter((n: number): boolean => n % 2 === 0))
          .then((arr: number[]): number[] => arr.map((n: number): number => n * 2))
          .then((arr: number[]): number => arr.reduce((acc: number, n: number): number => acc + n, 0));

        expect(result).assertEqual(12);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_PATTERN_0500
     * @tc.name testPromiseChainAccumulator
     * @tc.desc Test Promise chain with state accumulator - verify accumulated state through chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainAccumulator', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testPromiseChainAccumulator';
        console.info(`${caseName} test start`);

        const accumulator: number[] = [];
        const result: number = await Promise.resolve<number>(1)
          .then((n: number): number => { accumulator.push(n); return n + 2; })
          .then((n: number): number => { accumulator.push(n); return n + 3; })
          .then((n: number): number => { accumulator.push(n); return n + 4; });

        expect(result).assertEqual(10);
        expect(accumulator.length).assertEqual(3);
        expect(accumulator[0]).assertEqual(1);
        expect(accumulator[1]).assertEqual(3);
        expect(accumulator[2]).assertEqual(6);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_PATTERN_0600
     * @tc.name testPromiseChainConditionalSkip
     * @tc.desc Test Promise chain with conditional skip execution - verify conditional branching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainConditionalSkip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testPromiseChainConditionalSkip';
        console.info(`${caseName} test start`);

        const result: string = await Promise.resolve<number>(5)
          .then((n: number): string => {
            if (n < 10) {
              return 'skipped';
            }
            return `processed: ${n * 2}`;
          })
          .then((v: string): string => {
            return v === 'skipped' ? 'value was too small' : v;
          });

        expect(result).assertEqual('value was too small');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_PATTERN_0700
     * @tc.name testPromiseChainSideEffects
     * @tc.desc Test Promise chain with side effects between steps - verify side effect logging
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainSideEffects', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testPromiseChainSideEffects';
        console.info(`${caseName} test start`);

        const log: string[] = [];
        const result: string = await Promise.resolve<string>('start')
          .then((v: string): string => { log.push(`step1:${v}`); return v + '1'; })
          .then((v: string): string => { log.push(`step2:${v}`); return v + '2'; })
          .then((v: string): string => { log.push(`step3:${v}`); return v + '3'; });

        expect(result).assertEqual('start123');
        expect(log.length).assertEqual(3);
        expect(log[0]).assertEqual('step1:start');
        expect(log[1]).assertEqual('step2:start1');
        expect(log[2]).assertEqual('step3:start12');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_PATTERN_0800
     * @tc.name testPromiseChainComposition
     * @tc.desc Test Promise chain with function composition pipe pattern - verify composed result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainComposition', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testPromiseChainComposition';
        console.info(`${caseName} test start`);

        const result: string = await chainAddHello('world')
          .then((s: string): Promise<string> => chainToUpper(s))
          .then((s: string): Promise<string> => chainAddExclamation(s));

        expect(result).assertEqual('HELLO WORLD!');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_PATTERN_0900
     * @tc.name testPromiseChainBranching
     * @tc.desc Test same Promise with multiple then branches - verify independent branch results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPromiseChainBranching', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testPromiseChainBranching';
        console.info(`${caseName} test start`);

        const basePromise: Promise<string> = Promise.resolve<string>('base');

        const branch1: string = await basePromise.then((v: string): string => v + '-branch1');
        const branch2: string = await basePromise.then((v: string): string => v + '-branch2');

        expect(branch1).assertEqual('base-branch1');
        expect(branch2).assertEqual('base-branch2');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_PATTERN_1000
     * @tc.name testPromiseChainRecursive
     * @tc.desc Test recursive Promise chain with countdown - verify recursive resolution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testPromiseChainRecursive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName = 'testPromiseChainRecursive';
        console.info(`${caseName} test start`);

        const result: string = await countdownRecursive(5);
        expect(result).assertEqual('done');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_TYPE_GUARD_0100
     * @tc.name testInstanceofGuardInPromise
     * @tc.desc Test instanceof type guard in Promise then callback - verify type discrimination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testInstanceofGuardInPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testInstanceofGuardInPromise';
        console.info(`${caseName} test start`);

        const result: string = await Promise.resolve<GenericA>(new GenericB())
          .then((a: GenericA): string => {
            if (a instanceof GenericB) {
              return 'is B';
            }
            return 'is A';
          });

        expect(result).assertEqual('is B');

        const result2: string = await Promise.resolve<GenericA>(new GenericA())
          .then((a: GenericA): string => {
            if (a instanceof GenericB) {
              return 'is B';
            }
            return 'is A';
          });

        expect(result2).assertEqual('is A');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_TYPE_GUARD_0200
     * @tc.name testDiscriminatedUnionInChain
     * @tc.desc Test discriminated union with status field in Promise chain - verify status discrimination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testDiscriminatedUnionInChain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testDiscriminatedUnionInChain';
        console.info(`${caseName} test start`);

        const success: OperationSuccess = { status: 'success', data: 'operation data' };
        const result1: string = await Promise.resolve<OperationSuccess>(success)
          .then((r: OperationSuccess): string => {
            if (r.status === 'success') {
              return r.data;
            }
            return 'not success';
          });

        expect(result1).assertEqual('operation data');

        const failure: OperationFailure = { status: 'error', error: 'operation error' };
        const result2: string = await Promise.resolve<OperationFailure>(failure)
          .then((r: OperationFailure): string => {
            if (r.status === 'error') {
              return r.error;
            }
            return 'no error';
          });

        expect(result2).assertEqual('operation error');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_TYPE_GUARD_0300
     * @tc.name testTypeofGuardInChain
     * @tc.desc Test typeof type guard in Promise chain - verify typeof discrimination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTypeofGuardInChain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testTypeofGuardInChain';
        console.info(`${caseName} test start`);

        const result1: string = await Promise.resolve<Object>(42)
          .then((v: Object): string => {
            if (typeof v === 'number') {
              const n: number = v as number;
              return 'number: ' + n;
            }
            return 'not number';
          });

        expect(result1).assertEqual('number: 42');

        const result2: string = await Promise.resolve<Object>('hello')
          .then((v: Object): string => {
            if (typeof v === 'string') {
              const s: string = v as string;
              return 'string: ' + s;
            }
            return 'not string';
          });

        expect(result2).assertEqual('string: hello');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_TYPE_GUARD_0400
     * @tc.name testArrayTypeGuard
     * @tc.desc Test Array.isArray type guard in Promise chain - verify array discrimination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testArrayTypeGuard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testArrayTypeGuard';
        console.info(`${caseName} test start`);

        const result1: string = await Promise.resolve<Object>([1, 2, 3])
          .then((v: Object): string => {
            if (Array.isArray(v)) {
              const arr: Object[] = v as Object[];
              return 'array length: ' + arr.length;
            }
            return 'not array';
          });

        expect(result1).assertEqual('array length: 3');

        const result2: string = await Promise.resolve<Object>(42)
          .then((v: Object): string => {
            if (Array.isArray(v)) {
              return 'is array';
            }
            return 'not array';
          });

        expect(result2).assertEqual('not array');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_TYPE_GUARD_0500
     * @tc.name testPropertyCheckGuard
     * @tc.desc Test property existence check guard in Promise chain - verify property discrimination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPropertyCheckGuard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testPropertyCheckGuard';
        console.info(`${caseName} test start`);

        class ErrorWithCode {
          message: string = '';
          code: number = 0;
        }

        const error: ErrorWithCode = new ErrorWithCode();
        error.message = 'test error';
        error.code = 500;

        const result: string = await Promise.resolve<ErrorWithCode>(error)
          .then((e: ErrorWithCode): string => {
            if (e.code > 0) {
              return `error code ${e.code}: ${e.message}`;
            }
            return `error: ${e.message}`;
          });

        expect(result).assertEqual('error code 500: test error');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_TYPE_GUARD_0600
     * @tc.name testMultiTypeGuard
     * @tc.desc Test multiple type guards in Promise chain - verify multi-type discrimination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testMultiTypeGuard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testMultiTypeGuard';
        console.info(`${caseName} test start`);

        const result1: string = await Promise.resolve<Object>(42)
          .then<string>((v: Object): string => checkObjectType(v));
        expect(result1).assertEqual('number');

        const result2: string = await Promise.resolve<Object>('hello')
          .then<string>((v: Object): string => checkObjectType(v));
        expect(result2).assertEqual('string');

        const result3: string = await Promise.resolve<Object>(new GenericA())
          .then<string>((v: Object): string => checkObjectType(v));
        expect(result3).assertEqual('GenericA');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_ENUM_CHAIN_0100
     * @tc.name testEnumChainBasicPass
     * @tc.desc Test enum value passed through Promise chain - verify value preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testEnumChainBasicPass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testEnumChainBasicPass';
        console.info(`${caseName} test start`);

        const result: number = await Promise.resolve<number>(ProcessStatus.RUNNING)
          .then((s: number): number => {
            expect(s).assertEqual(ProcessStatus.RUNNING);
            return s;
          })
          .then((s: number): number => {
            expect(s).assertEqual(1);
            return s;
          });

        expect(result).assertEqual(ProcessStatus.RUNNING);
        expect(result).assertEqual(1);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_ENUM_CHAIN_0200
     * @tc.name testEnumChainConversion
     * @tc.desc Test enum to string conversion in Promise chain - verify conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testEnumChainConversion', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testEnumChainConversion';
        console.info(`${caseName} test start`);

        const result: string = await Promise.resolve<number>(ProcessStatus.COMPLETED)
          .then((s: number): string => {
            expect(s).assertEqual(ProcessStatus.COMPLETED);
            let label: string = '';
            if (s === ProcessStatus.PENDING) { label = 'PENDING'; }
            else if (s === ProcessStatus.RUNNING) { label = 'RUNNING'; }
            else if (s === ProcessStatus.COMPLETED) { label = 'COMPLETED'; }
            else if (s === ProcessStatus.FAILED) { label = 'FAILED'; }
            return label;
          });

        expect(result).assertEqual('COMPLETED');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_ENUM_CHAIN_0300
     * @tc.name testEnumChainConditionalBranch
     * @tc.desc Test enum-based conditional branching in Promise chain - verify correct branch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testEnumChainConditionalBranch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testEnumChainConditionalBranch';
        console.info(`${caseName} test start`);

        const result: string = await Promise.resolve<number>(ProcessStatus.FAILED)
          .then((s: number): string => {
            if (s === ProcessStatus.COMPLETED) {
              return 'success path';
            } else if (s === ProcessStatus.FAILED) {
              return 'error path';
            } else {
              return 'pending path';
            }
          });

        expect(result).assertEqual('error path');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_ENUM_CHAIN_0400
     * @tc.name testEnumChainStateTransition
     * @tc.desc Test enum state machine transition through Promise chain PENDING to RUNNING to COMPLETED
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testEnumChainStateTransition', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testEnumChainStateTransition';
        console.info(`${caseName} test start`);

        const result: number = await Promise.resolve<number>(ProcessStatus.PENDING)
          .then((s: number): number => {
            expect(s).assertEqual(ProcessStatus.PENDING);
            return ProcessStatus.RUNNING;
          })
          .then((s: number): number => {
            expect(s).assertEqual(ProcessStatus.RUNNING);
            return ProcessStatus.COMPLETED;
          })
          .then((s: number): number => {
            expect(s).assertEqual(ProcessStatus.COMPLETED);
            return s;
          });

        expect(result).assertEqual(ProcessStatus.COMPLETED);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_ENUM_CHAIN_0500
     * @tc.name testEnumChainNumericComparison
     * @tc.desc Test enum numeric value comparison in Promise chain - verify comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testEnumChainNumericComparison', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testEnumChainNumericComparison';
        console.info(`${caseName} test start`);

        const result: boolean = await Promise.resolve<number>(ProcessStatus.RUNNING)
          .then((s: number): boolean => {
            return s > ProcessStatus.PENDING && s < ProcessStatus.COMPLETED;
          });

        expect(result).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_ENUM_CHAIN_0600
     * @tc.name testEnumChainWithCatch
     * @tc.desc Test enum-based error handling in Promise chain - verify FAILED triggers catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testEnumChainWithCatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testEnumChainWithCatch';
        console.info(`${caseName} test start`);

        const result: number = await Promise.resolve<number>(ProcessStatus.FAILED)
          .then((s: number): number => {
            if (s === ProcessStatus.FAILED) {
              throw new Error('Process failed');
            }
            return s;
          })
          .catch((error: Error): number => {
            expect(error.message).assertEqual('Process failed');
            return ProcessStatus.PENDING;
          });

        expect(result).assertEqual(ProcessStatus.PENDING);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_ENUM_CHAIN_0700
     * @tc.name testEnumChainValueMapping
     * @tc.desc Test enum value mapping through Promise chain - verify enum to different type conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testEnumChainValueMapping', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testEnumChainValueMapping';
        console.info(`${caseName} test start`);

        const result: string = await Promise.resolve<number>(ProcessStatus.RUNNING)
          .then((s: number): number => {
            expect(s).assertEqual(1);
            return s * 100;
          })
          .then((n: number): string => {
            expect(n).assertEqual(100);
            return `score=${n}`;
          });

        expect(result).assertEqual('score=100');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_ENUM_CHAIN_0800
     * @tc.name testEnumChainStrictEquality
     * @tc.desc Test enum strict equality comparison in Promise chain - verify === operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testEnumChainStrictEquality', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testEnumChainStrictEquality';
        console.info(`${caseName} test start`);

        const result: boolean = await Promise.resolve<number>(ProcessStatus.COMPLETED)
          .then((s: number): boolean => {
            expect(s === ProcessStatus.COMPLETED).assertTrue();
            expect(s === 2).assertTrue();
            expect(s !== ProcessStatus.PENDING).assertTrue();
            expect(s !== ProcessStatus.FAILED).assertTrue();
            return s === ProcessStatus.COMPLETED;
          });

        expect(result).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_OPTIONAL_CHAIN_0100
     * @tc.name testOptionalChainBasicAccess
     * @tc.desc Test optional chaining on existing property in Promise chain - verify value returned
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testOptionalChainBasicAccess', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testOptionalChainBasicAccess';
        console.info(`${caseName} test start`);

        const user: UserProfile = { name: 'Alice', age: 25 };
        const result: string = await Promise.resolve<UserProfile>(user)
          .then((u: UserProfile): string => {
            const age: number = u.age !== undefined ? u.age : 0;
            return `${u.name}:${age}`;
          });

        expect(result).assertEqual('Alice:25');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_OPTIONAL_CHAIN_0200
     * @tc.name testOptionalChainMissingProperty
     * @tc.desc Test optional chaining on missing property in Promise chain - verify undefined handled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testOptionalChainMissingProperty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testOptionalChainMissingProperty';
        console.info(`${caseName} test start`);

        const user: UserProfile = { name: 'Bob' };
        const result: string = await Promise.resolve<UserProfile>(user)
          .then((u: UserProfile): string => {
            if (u.age !== undefined) {
              return `age=${u.age}`;
            }
            return 'no age';
          });

        expect(result).assertEqual('no age');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_OPTIONAL_CHAIN_0300
     * @tc.name testOptionalChainNested
     * @tc.desc Test nested optional chaining through Promise chain - verify deep access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testOptionalChainNested', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testOptionalChainNested';
        console.info(`${caseName} test start`);

        const user: UserProfile = {
          name: 'Charlie',
          address: { city: 'Beijing', zip: '100000' }
        };
        const result: string = await Promise.resolve<UserProfile>(user)
          .then((u: UserProfile): string => {
            if (u.address !== undefined) {
              return u.address.zip !== undefined ? u.address.zip : 'no zip';
            }
            return 'no address';
          });

        expect(result).assertEqual('100000');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_OPTIONAL_CHAIN_0400
     * @tc.name testOptionalChainWithDefault
     * @tc.desc Test optional chaining with nullish coalescing for default value in Promise chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testOptionalChainWithDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testOptionalChainWithDefault';
        console.info(`${caseName} test start`);

        const user: UserProfile = { name: 'Dave' };
        const result: number = await Promise.resolve<UserProfile>(user)
          .then((u: UserProfile): number => {
            const age: number = u.age !== undefined ? u.age : 0;
            return age;
          });

        expect(result).assertEqual(0);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_OPTIONAL_CHAIN_0500
     * @tc.name testOptionalChainInThenCallback
     * @tc.desc Test optional property access inside then callback - verify safe access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testOptionalChainInThenCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testOptionalChainInThenCallback';
        console.info(`${caseName} test start`);

        const user: UserProfile = { name: 'Eve', address: { city: 'Shanghai' } };
        const result: string = await Promise.resolve<UserProfile>(user)
          .then((u: UserProfile): string => {
            const city: string = u.address !== undefined ? u.address.city : 'unknown';
            const zip: string = u.address !== undefined && u.address.zip !== undefined ? u.address.zip : 'no zip';
            return `${city}:${zip}`;
          });

        expect(result).assertEqual('Shanghai:no zip');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_OPTIONAL_CHAIN_0600
     * @tc.name testOptionalChainConditionalReturn
     * @tc.desc Test conditional return based on optional property existence in Promise chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testOptionalChainConditionalReturn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testOptionalChainConditionalReturn';
        console.info(`${caseName} test start`);

        const userWithAge: UserProfile = { name: 'Frank', age: 30 };
        const userWithoutAge: UserProfile = { name: 'Grace' };

        const result1: string = await Promise.resolve<UserProfile>(userWithAge)
          .then((u: UserProfile): string => {
            return u.age !== undefined && u.age >= 18 ? 'adult' : 'minor';
          });
        expect(result1).assertEqual('adult');

        const result2: string = await Promise.resolve<UserProfile>(userWithoutAge)
          .then((u: UserProfile): string => {
            return u.age !== undefined && u.age >= 18 ? 'adult' : 'unknown';
          });
        expect(result2).assertEqual('unknown');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_OPTIONAL_CHAIN_0700
     * @tc.name testOptionalChainDeepNode
     * @tc.desc Test deep nested ChainNode optional property access through Promise chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testOptionalChainDeepNode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testOptionalChainDeepNode';
        console.info(`${caseName} test start`);

        const deep: ChainNode = {
          value: 'level1',
          next: {
            value: 'level2',
            next: {
              value: 'level3',
              next: undefined
            }
          }
        };

        const result: string = await Promise.resolve<ChainNode>(deep)
          .then((node: ChainNode): string => {
            const l2: ChainNode | undefined = node.next;
            if (l2 !== undefined) {
              const l3: ChainNode | undefined = l2.next;
              if (l3 !== undefined) {
                return l3.value;
              }
              return l2.value;
            }
            return node.value;
          });

        expect(result).assertEqual('level3');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_OPTIONAL_CHAIN_0800
     * @tc.name testOptionalChainMissingNested
     * @tc.desc Test missing nested optional property returns default through Promise chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testOptionalChainMissingNested', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testOptionalChainMissingNested';
        console.info(`${caseName} test start`);

        const shallow: ChainNode = { value: 'root', next: undefined };

        const result: string = await Promise.resolve<ChainNode>(shallow)
          .then((node: ChainNode): string => {
            const next: ChainNode | undefined = node.next;
            if (next !== undefined) {
              return next.value;
            }
            return 'no next';
          });

        expect(result).assertEqual('no next');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_NULLISH_CHAIN_0100
     * @tc.name testNullishCoalescingWithNull
     * @tc.desc Test nullish coalescing with null value in Promise chain - verify default returned
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testNullishCoalescingWithNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testNullishCoalescingWithNull';
        console.info(`${caseName} test start`);

        const result: string = await Promise.resolve<null>(null)
          .then((v: null): string => {
            return v !== null && v !== undefined ? v : 'default';
          });

        expect(result).assertEqual('default');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_NULLISH_CHAIN_0200
     * @tc.name testNullishCoalescingWithUndefined
     * @tc.desc Test nullish coalescing with undefined value in Promise chain - verify default returned
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testNullishCoalescingWithUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testNullishCoalescingWithUndefined';
        console.info(`${caseName} test start`);

        const result: string = await Promise.resolve<void>(undefined)
          .then((): string => {
            return undefined !== null && undefined !== undefined ? 'value' : 'default';
          });

        expect(result).assertEqual('default');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_NULLISH_CHAIN_0300
     * @tc.name testNullishCoalescingWithEmptyString
     * @tc.desc Test nullish coalescing with empty string - verify NOT coalesced (empty string is not nullish)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testNullishCoalescingWithEmptyString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testNullishCoalescingWithEmptyString';
        console.info(`${caseName} test start`);

        const result: string = await Promise.resolve<string>('')
          .then((v: string): string => {
            return v !== null && v !== undefined ? v : 'default';
          });

        expect(result).assertEqual('');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_NULLISH_CHAIN_0400
     * @tc.name testNullishCoalescingWithZero
     * @tc.desc Test nullish coalescing with zero - verify NOT coalesced (zero is not nullish)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testNullishCoalescingWithZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testNullishCoalescingWithZero';
        console.info(`${caseName} test start`);

        const result: number = await Promise.resolve<number>(0)
          .then((v: number): number => {
            return v !== null && v !== undefined ? v : 99;
          });

        expect(result).assertEqual(0);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_NULLISH_CHAIN_0500
     * @tc.name testNullishCoalescingWithFalse
     * @tc.desc Test nullish coalescing with false - verify NOT coalesced (false is not nullish)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testNullishCoalescingWithFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testNullishCoalescingWithFalse';
        console.info(`${caseName} test start`);

        const result: boolean = await Promise.resolve<boolean>(false)
          .then((v: boolean): boolean => {
            return v !== null && v !== undefined ? v : true;
          });

        expect(result).assertFalse();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_NULLISH_CHAIN_0600
     * @tc.name testNullishCoalescingChained
     * @tc.desc Test chained nullish coalescing in Promise chain - verify first non-nullish returned
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testNullishCoalescingChained', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testNullishCoalescingChained';
        console.info(`${caseName} test start`);

        const result: string = await Promise.resolve<null>(null)
          .then((v: null): string => {
            const first: string | null = v;
            if (first !== null && first !== undefined) {
              return first;
            }
            const second: string | undefined = undefined;
            if (second !== null && second !== undefined) {
              return second;
            }
            return 'final';
          });

        expect(result).assertEqual('final');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_NULLISH_CHAIN_0700
     * @tc.name testNullishVsOrComparison
     * @tc.desc Test nullish coalescing vs OR operator comparison - verify different behavior with falsy values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testNullishVsOrComparison', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testNullishVsOrComparison';
        console.info(`${caseName} test start`);

        const nullishResult: number = await Promise.resolve<number>(0)
          .then((v: number): number => {
            return v !== null && v !== undefined ? v : 99;
          });
        expect(nullishResult).assertEqual(0);

        const orResult: number = await Promise.resolve<number>(0)
          .then((v: number): number => {
            return v || 99;
          });
        expect(orResult).assertEqual(99);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_NULLISH_CHAIN_0800
     * @tc.name testNullishCoalescingInChain
     * @tc.desc Test nullish coalescing applied in multi-step Promise chain - verify defaults at each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testNullishCoalescingInChain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testNullishCoalescingInChain';
        console.info(`${caseName} test start`);

        const result: string = await Promise.resolve<null>(null)
          .then((v: null): string => {
            return v !== null && v !== undefined ? v : 'step1-default';
          })
          .then((v: string): string => {
            return v !== null && v !== undefined ? v : 'step2-default';
          });

        expect(result).assertEqual('step1-default');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_GENERIC_CONSTRAINT_0100
     * @tc.name testTypeConstraintHierarchyVerification
     * @tc.desc Test T extends GenericA constraint verification at each chain level - verify instanceof
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTypeConstraintHierarchyVerification', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testTypeConstraintHierarchyVerification';
        console.info(`${caseName} test start`);

        const chainA: Chain<GenericA> = new Chain<GenericA>(new GenericA());
        expect(chainA.value instanceof GenericA).assertTrue();

        const chainB: Chain<GenericB> = chainA.then<GenericB>((a: GenericA): GenericB => {
          return createGenericB(a.x, 2);
        });
        expect(chainB.value instanceof GenericA).assertTrue();
        expect(chainB.value instanceof GenericB).assertTrue();

        const chainC: Chain<GenericC> = chainB.then<GenericC>((b: GenericB): GenericC => {
          return createGenericC(b.x, b.y, 3);
        });
        expect(chainC.value instanceof GenericA).assertTrue();
        expect(chainC.value instanceof GenericB).assertTrue();
        expect(chainC.value instanceof GenericC).assertTrue();

        const chainD: Chain<GenericD> = chainC.then<GenericD>((c: GenericC): GenericD => {
          const d: GenericD = new GenericD();
          d.x = c.x;
          d.y = c.y;
          d.z = c.z;
          d.w = 4;
          return d;
        });
        expect(chainD.value instanceof GenericA).assertTrue();
        expect(chainD.value instanceof GenericB).assertTrue();
        expect(chainD.value instanceof GenericC).assertTrue();
        expect(chainD.value instanceof GenericD).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_GENERIC_CONSTRAINT_0200
     * @tc.name testTypeConstraintSNarrowsT
     * @tc.desc Test S extends T narrowing at each then call - verify subtype relationship
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTypeConstraintSNarrowsT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testTypeConstraintSNarrowsT';
        console.info(`${caseName} test start`);

        const chainA: Chain<GenericA> = new Chain<GenericA>(new GenericA());
        chainA.value.x = 10;

        const chainB: Chain<GenericB> = chainA.then<GenericB>((a: GenericA): GenericB => {
          expect(a instanceof GenericA).assertTrue();
          return createGenericB(a.x, 20);
        });
        expect(chainB.value instanceof GenericA).assertTrue();
        expect(chainB.value instanceof GenericB).assertTrue();
        expect(chainB.value.y).assertEqual(20);

        const chainC: Chain<GenericC> = chainB.then<GenericC>((b: GenericB): GenericC => {
          expect(b instanceof GenericA).assertTrue();
          expect(b instanceof GenericB).assertTrue();
          return createGenericC(b.x, b.y, 30);
        });
        expect(chainC.value instanceof GenericA).assertTrue();
        expect(chainC.value instanceof GenericB).assertTrue();
        expect(chainC.value instanceof GenericC).assertTrue();
        expect(chainC.value.z).assertEqual(30);

        const chainD: Chain<GenericD> = chainC.then<GenericD>((c: GenericC): GenericD => {
          expect(c instanceof GenericA).assertTrue();
          expect(c instanceof GenericB).assertTrue();
          expect(c instanceof GenericC).assertTrue();
          const d: GenericD = new GenericD();
          d.x = c.x;
          d.y = c.y;
          d.z = c.z;
          d.w = 40;
          return d;
        });
        expect(chainD.value instanceof GenericA).assertTrue();
        expect(chainD.value instanceof GenericD).assertTrue();
        expect(chainD.value.w).assertEqual(40);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_GENERIC_CONSTRAINT_0300
     * @tc.name testTypeConstraintPropertyProgression
     * @tc.desc Test property accessibility progression as type constraint narrows A to B to C to D
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTypeConstraintPropertyProgression', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testTypeConstraintPropertyProgression';
        console.info(`${caseName} test start`);

        const chainA: Chain<GenericA> = new Chain<GenericA>(new GenericA());
        chainA.value.x = 1;
        expect(chainA.value.x).assertEqual(1);

        const chainB: Chain<GenericB> = chainA.then<GenericB>((a: GenericA): GenericB => {
          const b: GenericB = new GenericB();
          b.x = a.x;
          b.y = 2;
          return b;
        });
        expect(chainB.value.x).assertEqual(1);
        expect(chainB.value.y).assertEqual(2);

        const chainC: Chain<GenericC> = chainB.then<GenericC>((b: GenericB): GenericC => {
          const c: GenericC = new GenericC();
          c.x = b.x;
          c.y = b.y;
          c.z = 3;
          return c;
        });
        expect(chainC.value.x).assertEqual(1);
        expect(chainC.value.y).assertEqual(2);
        expect(chainC.value.z).assertEqual(3);

        const chainD: Chain<GenericD> = chainC.then<GenericD>((c: GenericC): GenericD => {
          const d: GenericD = new GenericD();
          d.x = c.x;
          d.y = c.y;
          d.z = c.z;
          d.w = 4;
          return d;
        });
        expect(chainD.value.x).assertEqual(1);
        expect(chainD.value.y).assertEqual(2);
        expect(chainD.value.z).assertEqual(3);
        expect(chainD.value.w).assertEqual(4);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_GENERIC_CONSTRAINT_0400
     * @tc.name testTypeConstraintContainerMap
     * @tc.desc Test TypedContainer map with constrained types - verify map S respects type hierarchy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTypeConstraintContainerMap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testTypeConstraintContainerMap';
        console.info(`${caseName} test start`);

        const containerA: TypedContainer<GenericA> = new TypedContainer<GenericA>(new GenericA());
        containerA.value.x = 5;

        const containerB: TypedContainer<GenericB> = containerA.map<GenericB>((a: GenericA): GenericB => {
          expect(a instanceof GenericA).assertTrue();
          return createGenericB(a.x, 10);
        });
        expect(containerB.value instanceof GenericA).assertTrue();
        expect(containerB.value instanceof GenericB).assertTrue();
        expect(containerB.value.x).assertEqual(5);
        expect(containerB.value.y).assertEqual(10);

        const containerC: TypedContainer<GenericC> = containerB.map<GenericC>((b: GenericB): GenericC => {
          expect(b instanceof GenericA).assertTrue();
          expect(b instanceof GenericB).assertTrue();
          return createGenericC(b.x, b.y, 15);
        });
        expect(containerC.value instanceof GenericA).assertTrue();
        expect(containerC.value instanceof GenericB).assertTrue();
        expect(containerC.value instanceof GenericC).assertTrue();
        expect(containerC.value.z).assertEqual(15);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_GENERIC_CONSTRAINT_0500
     * @tc.name testTypeConstraintWithPromiseAll
     * @tc.desc Test Promise.all with Chain results maintaining type constraints - verify parallel chains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTypeConstraintWithPromiseAll', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testTypeConstraintWithPromiseAll';
        console.info(`${caseName} test start`);

        const chain1: Chain<GenericC> = new Chain<GenericC>(createGenericC(1, 2, 3));
        const chain2: Chain<GenericC> = new Chain<GenericC>(createGenericC(4, 5, 6));

        const results: GenericC[] = await Promise.all<GenericC>([
          Promise.resolve<GenericC>(chain1.value),
          Promise.resolve<GenericC>(chain2.value)
        ]);

        expect(results.length).assertEqual(2);
        expect(results[0] instanceof GenericA).assertTrue();
        expect(results[0] instanceof GenericB).assertTrue();
        expect(results[0] instanceof GenericC).assertTrue();
        expect(results[0].x).assertEqual(1);
        expect(results[0].z).assertEqual(3);
        expect(results[1] instanceof GenericC).assertTrue();
        expect(results[1].x).assertEqual(4);
        expect(results[1].z).assertEqual(6);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_GENERIC_CONSTRAINT_0600
     * @tc.name testTypeConstraintPolymorphicDispatch
     * @tc.desc Test polymorphic dispatch in generic chain - verify method override preserved through constraint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTypeConstraintPolymorphicDispatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testTypeConstraintPolymorphicDispatch';
        console.info(`${caseName} test start`);

        const base: BaseDescribable = new BaseDescribable();
        base.name = 'item';

        const chainBase: Chain<BaseDescribable> = new Chain<BaseDescribable>(base);

        const chainExt: Chain<ExtendedDescribable> = chainBase.then<ExtendedDescribable>((b: BaseDescribable): ExtendedDescribable => {
          expect(b instanceof BaseDescribable).assertTrue();
          const ext: ExtendedDescribable = new ExtendedDescribable();
          ext.name = b.name;
          ext.version = 1;
          return ext;
        });

        expect(chainExt.value instanceof BaseDescribable).assertTrue();
        expect(chainExt.value instanceof ExtendedDescribable).assertTrue();
        expect(chainExt.value.describe()).assertEqual('item-v1');

        const chainExt2: Chain<ExtendedDescribable> = chainExt.then<ExtendedDescribable>((ext: ExtendedDescribable): ExtendedDescribable => {
          expect(ext instanceof BaseDescribable).assertTrue();
          expect(ext instanceof ExtendedDescribable).assertTrue();
          ext.version = 2;
          return ext;
        });

        expect(chainExt2.value.describe()).assertEqual('item-v2');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_TERNARY_CHAIN_0100
     * @tc.name testTernaryInThenReturn
     * @tc.desc Test ternary expression in then callback return value - verify conditional return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTernaryInThenReturn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testTernaryInThenReturn';
        console.info(`${caseName} test start`);

        const result1: string = await Promise.resolve<number>(10)
          .then((n: number): string => n > 5 ? 'big' : 'small');
        expect(result1).assertEqual('big');

        const result2: string = await Promise.resolve<number>(3)
          .then((n: number): string => n > 5 ? 'big' : 'small');
        expect(result2).assertEqual('small');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_TERNARY_CHAIN_0200
     * @tc.name testTernaryNestedInChain
     * @tc.desc Test nested ternary expression (3-level deep) in then callback - verify nested branching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTernaryNestedInChain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testTernaryNestedInChain';
        console.info(`${caseName} test start`);

        const result1: string = await Promise.resolve<number>(15)
          .then((n: number): string => n > 10 ? 'high' : (n > 5 ? 'medium' : 'low'));
        expect(result1).assertEqual('high');

        const result2: string = await Promise.resolve<number>(7)
          .then((n: number): string => n > 10 ? 'high' : (n > 5 ? 'medium' : 'low'));
        expect(result2).assertEqual('medium');

        const result3: string = await Promise.resolve<number>(3)
          .then((n: number): string => n > 10 ? 'high' : (n > 5 ? 'medium' : 'low'));
        expect(result3).assertEqual('low');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_TERNARY_CHAIN_0300
     * @tc.name testTernaryWithClassHierarchy
     * @tc.desc Test ternary choosing between class hierarchy instances - verify correct type selected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTernaryWithClassHierarchy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testTernaryWithClassHierarchy';
        console.info(`${caseName} test start`);

        const result1: GenericA = await Promise.resolve<number>(1)
          .then((n: number): GenericA => {
            const a: GenericA = n === 1 ? new GenericA() : (n === 2 ? new GenericB() : new GenericC());
            return a;
          });
        expect(result1 instanceof GenericA).assertTrue();
        expect(result1 instanceof GenericB).assertFalse();

        const result2: GenericA = await Promise.resolve<number>(2)
          .then((n: number): GenericA => {
            const a: GenericA = n === 1 ? new GenericA() : (n === 2 ? new GenericB() : new GenericC());
            return a;
          });
        expect(result2 instanceof GenericB).assertTrue();

        const result3: GenericA = await Promise.resolve<number>(3)
          .then((n: number): GenericA => {
            const a: GenericA = n === 1 ? new GenericA() : (n === 2 ? new GenericB() : new GenericC());
            return a;
          });
        expect(result3 instanceof GenericC).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_TERNARY_CHAIN_0400
     * @tc.name testTernaryWithTypeConversion
     * @tc.desc Test ternary with type conversion through Promise chain - verify cross-type conditional
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTernaryWithTypeConversion', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testTernaryWithTypeConversion';
        console.info(`${caseName} test start`);

        const result: string = await Promise.resolve<number>(42)
          .then((n: number): string => {
            const s: string = n > 0 ? 'positive' : (n < 0 ? 'negative' : 'zero');
            return s;
          })
          .then((s: string): number => {
            const n: number = s === 'positive' ? 1 : (s === 'negative' ? -1 : 0);
            return n;
          })
          .then((n: number): string => {
            const s: string = n > 0 ? 'yes' : 'no';
            return s;
          });

        expect(result).assertEqual('yes');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_TERNARY_CHAIN_0500
     * @tc.name testTernaryConditionalChain
     * @tc.desc Test conditional chain with ternary at each step - verify multi-step ternary pipeline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTernaryConditionalChain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testTernaryConditionalChain';
        console.info(`${caseName} test start`);

        const result: string = await Promise.resolve<number>(5)
          .then((n: number): number => {
            const r: number = n > 3 ? n + 10 : n - 10;
            expect(r).assertEqual(15);
            return r;
          })
          .then((n: number): number => {
            const r: number = n > 10 ? n * 2 : n + 1;
            expect(r).assertEqual(30);
            return r;
          })
          .then((n: number): string => {
            const s: string = n > 20 ? 'high' : 'low';
            return s;
          });

        expect(result).assertEqual('high');

        const result2: string = await Promise.resolve<number>(2)
          .then((n: number): number => {
            const r: number = n > 3 ? n + 10 : n - 10;
            return r;
          })
          .then((n: number): number => {
            const r: number = n > 10 ? n * 2 : n + 1;
            return r;
          })
          .then((n: number): string => {
            const s: string = n > 20 ? 'high' : 'low';
            return s;
          });

        expect(result2).assertEqual('low');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_TERNARY_CHAIN_0600
     * @tc.name testTernaryInCatch
     * @tc.desc Test ternary in catch callback deciding recovery strategy - verify conditional recovery
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTernaryInCatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testTernaryInCatch';
        console.info(`${caseName} test start`);

        const result: string = await Promise.reject(new Error('known error'))
          .catch((error: Error): string => {
            const recovery: string = error.message === 'known error' ? 'recovered' : 'unknown error';
            return recovery;
          })
          .then((s: string): string => {
            const r: string = s === 'recovered' ? 'success' : 'failure';
            return r;
          });

        expect(result).assertEqual('success');

        const result2: string = await Promise.reject(new Error('unknown'))
          .catch((error: Error): string => {
            const recovery: string = error.message === 'known error' ? 'recovered' : 'unknown error';
            return recovery;
          })
          .then((s: string): string => {
            const r: string = s === 'recovered' ? 'success' : 'failure';
            return r;
          });

        expect(result2).assertEqual('failure');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_TERNARY_CHAIN_0700
     * @tc.name testTernaryPipeline
     * @tc.desc Test multi-step data pipeline with nested ternary at each step - verify grade calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTernaryPipeline', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testTernaryPipeline';
        console.info(`${caseName} test start`);

        const result: string = await Promise.resolve<string>('{"value": 85}')
          .then((json: string): number => {
            const data: ValueObject = JSON.parse(json) as ValueObject;
            return data.value;
          })
          .then((score: number): string => {
            const grade: string = score >= 90 ? 'A' : (score >= 80 ? 'B' : (score >= 70 ? 'C' : 'F'));
            return grade;
          })
          .then((grade: string): string => {
            const label: string = grade === 'A' ? 'excellent' : (grade === 'B' ? 'good' : (grade === 'C' ? 'fair' : 'fail'));
            return label;
          });

        expect(result).assertEqual('good');

        const result2: string = await Promise.resolve<string>('{"value": 55}')
          .then((json: string): number => {
            const data: ValueObject = JSON.parse(json) as ValueObject;
            return data.value;
          })
          .then((score: number): string => {
            const grade: string = score >= 90 ? 'A' : (score >= 80 ? 'B' : (score >= 70 ? 'C' : 'F'));
            return grade;
          })
          .then((grade: string): string => {
            const label: string = grade === 'A' ? 'excellent' : (grade === 'B' ? 'good' : (grade === 'C' ? 'fair' : 'fail'));
            return label;
          });

        expect(result2).assertEqual('fail');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_TERNARY_CHAIN_0800
     * @tc.name testTernaryWithArrayOperation
     * @tc.desc Test ternary choosing between array operations in Promise chain - verify conditional array processing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTernaryWithArrayOperation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testTernaryWithArrayOperation';
        console.info(`${caseName} test start`);

        const result: string = await Promise.resolve<number[]>([1, 2, 3, 4, 5])
          .then((arr: number[]): number[] => {
            const r: number[] = arr.length > 3 ? arr.filter((n: number): boolean => n % 2 === 0) : arr;
            return r;
          })
          .then((arr: number[]): number => {
            const r: number = arr.length > 0 ? arr.reduce((acc: number, n: number): number => acc + n, 0) : 0;
            return r;
          })
          .then((sum: number): string => {
            const s: string = sum > 5 ? 'large sum' : 'small sum';
            return s;
          });

        expect(result).assertEqual('large sum');

        const result2: string = await Promise.resolve<number[]>([1])
          .then((arr: number[]): number[] => {
            const r: number[] = arr.length > 3 ? arr.filter((n: number): boolean => n % 2 === 0) : arr;
            return r;
          })
          .then((arr: number[]): number => {
            const r: number = arr.length > 0 ? arr.reduce((acc: number, n: number): number => acc + n, 0) : 0;
            return r;
          })
          .then((sum: number): string => {
            const s: string = sum > 5 ? 'large sum' : 'small sum';
            return s;
          });

        expect(result2).assertEqual('small sum');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_DEFAULT_VALUE_0100
     * @tc.name testFunctionParamDefaultInPromise
     * @tc.desc Test function with default parameter called from Promise chain - verify default and override
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testFunctionParamDefaultInPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testFunctionParamDefaultInPromise';
        console.info(`${caseName} test start`);

        const result1: string = await Promise.resolve<string>('test')
          .then((v: string): string => formatWithDefault(v));
        expect(result1).assertEqual('item:test');

        const result2: string = await Promise.resolve<string>('test')
          .then((v: string): string => formatWithDefault(v, 'data'));
        expect(result2).assertEqual('data:test');

        const result3: string = await Promise.resolve<string>('value')
          .then((v: string): string => formatWithDefault(v))
          .then((v: string): string => formatWithDefault(v, 'prefix'));
        expect(result3).assertEqual('prefix:item:value');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_DEFAULT_VALUE_0200
     * @tc.name testClassPropertyDefaultPreserved
     * @tc.desc Test class property default values preserved through Promise chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testClassPropertyDefaultPreserved', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testClassPropertyDefaultPreserved';
        console.info(`${caseName} test start`);

        const result: string = await Promise.resolve<GenericC>(new GenericC())
          .then((c: GenericC): string => {
            expect(c.x).assertEqual(0);
            expect(c.y).assertEqual(0);
            expect(c.z).assertEqual(0);
            return 'defaults preserved';
          });

        expect(result).assertEqual('defaults preserved');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_DEFAULT_VALUE_0300
     * @tc.name testClassPropertyDefaultOverride
     * @tc.desc Test class property default values overridden through Promise chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testClassPropertyDefaultOverride', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testClassPropertyDefaultOverride';
        console.info(`${caseName} test start`);

        const result: GenericC = await Promise.resolve<GenericC>(new GenericC())
          .then((c: GenericC): GenericC => {
            expect(c.x).assertEqual(0);
            c.x = 10;
            c.y = 20;
            c.z = 30;
            return c;
          })
          .then((c: GenericC): GenericC => {
            expect(c.x).assertEqual(10);
            expect(c.y).assertEqual(20);
            expect(c.z).assertEqual(30);
            c.z = 300;
            return c;
          });

        expect(result.x).assertEqual(10);
        expect(result.y).assertEqual(20);
        expect(result.z).assertEqual(300);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_DEFAULT_VALUE_0400
     * @tc.name testDefaultFactoryWithType
     * @tc.desc Test factory function defaulting to string type vs explicit type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testDefaultFactoryWithType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testDefaultFactoryWithType';
        console.info(`${caseName} test start`);

        const result1: string = await Promise.resolve<string>('hello')
          .then((v: string): TypedContainer<string> => createDefaultContainer(v))
          .then((c: TypedContainer<string>): string => c.get());
        expect(result1).assertEqual('hello');

        const result2: number = await Promise.resolve<number>(42)
          .then((v: number): TypedContainer<number> => createTypedContainerValue<number>(v))
          .then((c: TypedContainer<number>): number => c.get());
        expect(result2).assertEqual(42);

        const result3: number = await Promise.resolve<string>('world')
          .then((v: string): TypedContainer<string> => createDefaultContainer(v))
          .then((c: TypedContainer<string>): TypedContainer<number> => {
            return c.map<number>((s: string): number => s.length);
          })
          .then((c: TypedContainer<number>): number => c.get());
        expect(result3).assertEqual(5);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_DEFAULT_VALUE_0500
     * @tc.name testConfigObjectDefaultValues
     * @tc.desc Test config object with optional fields applying defaults in Promise chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testConfigObjectDefaultValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testConfigObjectDefaultValues';
        console.info(`${caseName} test start`);

        const result: ConfigOptions = await Promise.resolve<ConfigOptions>({ timeout: 1000 })
          .then((config: ConfigOptions): ConfigOptions => {
            const full: ConfigOptions = {
              timeout: config.timeout !== undefined ? config.timeout : 5000,
              retries: config.retries !== undefined ? config.retries : 3,
              label: config.label !== undefined ? config.label : 'default'
            };
            return full;
          });

        expect(result.timeout).assertEqual(1000);
        expect(result.retries).assertEqual(3);
        expect(result.label).assertEqual('default');

        const result2: ConfigOptions = await Promise.resolve<ConfigOptions>({ label: 'custom', retries: 5 })
          .then((config: ConfigOptions): ConfigOptions => {
            const full: ConfigOptions = {
              timeout: config.timeout !== undefined ? config.timeout : 5000,
              retries: config.retries !== undefined ? config.retries : 3,
              label: config.label !== undefined ? config.label : 'default'
            };
            return full;
          });

        expect(result2.timeout).assertEqual(5000);
        expect(result2.retries).assertEqual(5);
        expect(result2.label).assertEqual('custom');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_DEFAULT_VALUE_0600
     * @tc.name testDefaultWithConditional
     * @tc.desc Test default value combined with conditional ternary in Promise chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testDefaultWithConditional', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testDefaultWithConditional';
        console.info(`${caseName} test start`);

        const result1: string = await Promise.resolve<string>('provided')
          .then((v: string): string => {
            const r: string = v.length > 0 ? v : 'empty default';
            return r;
          });
        expect(result1).assertEqual('provided');

        const result2: string = await Promise.resolve<string>('')
          .then((v: string): string => {
            const r: string = v.length > 0 ? v : 'empty default';
            return r;
          });
        expect(result2).assertEqual('empty default');

        const result3: number = await Promise.resolve<number>(0)
          .then((v: number): number => {
            const r: number = v !== 0 ? v : -1;
            return r;
          });
        expect(result3).assertEqual(-1);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_DEFAULT_VALUE_0700
     * @tc.name testDefaultWithNullishCheck
     * @tc.desc Test nullish check pattern for default value in Promise chain - null vs zero vs empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testDefaultWithNullishCheck', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testDefaultWithNullishCheck';
        console.info(`${caseName} test start`);

        const result1: number = await Promise.resolve<number>(0)
          .then((v: number): number => {
            const r: number = v !== null && v !== undefined ? v : 99;
            return r;
          });
        expect(result1).assertEqual(0);

        const result2: string = await Promise.resolve<string>('')
          .then((v: string): string => {
            const r: string = v !== null && v !== undefined ? v : 'default';
            return r;
          });
        expect(result2).assertEqual('');

        const result3: string = await Promise.resolve<null>(null)
          .then((v: null): string => {
            const r: string = v === null ? 'default' : 'has value';
            return r;
          });
        expect(result3).assertEqual('default');

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROMISECHAIN_DEFAULT_VALUE_0800
     * @tc.name testNestedDefaultValues
     * @tc.desc Test nested object with multi-level default values in Promise chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testNestedDefaultValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testNestedDefaultValues';
        console.info(`${caseName} test start`);

        const result: DatabaseConfig = await Promise.resolve<DatabaseConfig>({ host: 'localhost' })
          .then((config: DatabaseConfig): DatabaseConfig => {
            const full: DatabaseConfig = {
              host: config.host !== undefined ? config.host : 'default-host',
              port: config.port !== undefined ? config.port : 5432,
              auth: {
                username: config.auth !== undefined && config.auth.username !== undefined ? config.auth.username : 'admin',
                password: config.auth !== undefined && config.auth.password !== undefined ? config.auth.password : 'secret'
              }
            };
            return full;
          });

        expect(result.host).assertEqual('localhost');
        expect(result.port).assertEqual(5432);
        const auth1: AuthConfig = result.auth as AuthConfig;
        expect(auth1.username).assertEqual('admin');
        expect(auth1.password).assertEqual('secret');

        const result2: DatabaseConfig = await Promise.resolve<DatabaseConfig>({ host: 'remote', port: 3306, auth: { username: 'root' } })
          .then((config: DatabaseConfig): DatabaseConfig => {
            const full: DatabaseConfig = {
              host: config.host !== undefined ? config.host : 'default-host',
              port: config.port !== undefined ? config.port : 5432,
              auth: {
                username: config.auth !== undefined && config.auth.username !== undefined ? config.auth.username : 'admin',
                password: config.auth !== undefined && config.auth.password !== undefined ? config.auth.password : 'secret'
              }
            };
            return full;
          });

        expect(result2.host).assertEqual('remote');
        expect(result2.port).assertEqual(3306);
        const auth2: AuthConfig = result2.auth as AuthConfig;
        expect(auth2.username).assertEqual('root');
        expect(auth2.password).assertEqual('secret');

        console.info(`${caseName} test end`);
        done();
      });
   });
}
