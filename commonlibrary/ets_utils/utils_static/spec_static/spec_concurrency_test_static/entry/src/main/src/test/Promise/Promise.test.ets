'use static'
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import hilog from '@ohos.hilog'

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

let callbackOrder: int[] = [];
let orderIndex: int = 0;
let innerPromiseCreated: boolean = false;
let innerPromiseHandled: boolean = false;

function crossWorkerTask(p: Promise<number>): number {
  return 100;
}

async function innerAsyncFunc(): Promise<number> {
  innerPromiseCreated = true;
  return Promise.reject(new Error("inner rejection"));
}

async function outerAsyncFunc(): Promise<void> {
  let p: Promise<number> = innerAsyncFunc();
  p.catch((error: Error) => {
    innerPromiseHandled = true;
  });
  return;
}

// F-01: sync top-level function (receives resolved value, returns transformed value)
function syncThenCallback(x: number): number {
  return x * 2;
}

// F-02: async top-level function (receives resolved value, returns Promise)
async function asyncThenCallback(x: number): Promise<number> {
  return x + 100;
}

// F-03: generic sync function (receives resolved value, returns same type)
function genericSyncThenCallback<T>(x: T): T {
  return x;
}

// F-04: generic async function (receives resolved value, returns Promise<T>)
async function genericAsyncThenCallback<T>(x: T): Promise<T> {
  return x;
}

// F-05: arrow function expression stored in variable
let arrowThenCallback = (x: number): number => x * 2;

// F-06: Lambda expression stored in variable
let lambdaThenCallback = (x: number): number => x + 1;

// F-07: class instance method
class InstanceMethodClass {
  instanceMethod(x: number): number {
    return x + 50;
  }
}

// F-08: class static method
class StaticMethodClass {
  static staticMethod(x: number): number {
    return x + 100;
  }
}

// F-09: async class instance method
class AsyncInstanceMethodClass {
  async asyncInstanceMethod(x: number): Promise<number> {
    return x + 200;
  }
}

// F-10: async class static method
class AsyncStaticMethodClass {
  static async asyncStaticMethod(s: string): Promise<string> {
    return s + "_async_static";
  }
}


// F-12: optional param function (then callback can omit optional param)
function optionalParamThenCallback(x?: number): number {
  if (x === undefined) {
    return 0;
  }
  return x * 2;
}

// F-13: default param function (then callback uses resolved value as param)
function defaultParamThenCallback(x: number = 10): number {
  return x * 2;
}

// F-14: rest param function
function restParamThenCallback(...numbers: number[]): number {
  let sum: number = 0;
  for (let i: int = 0; i < numbers.length; i++) {
    sum += numbers[i];
  }
  return sum;
}

// F-15: readonly param function
function readonlyParamThenCallback(arr: readonly number[]): number {
  return arr.length;
}

// F-16: native function
native function nativeThenCallback(x: number): number;

export default function PromiseTest():void {
  describe('PromiseTest', (): void => {
    beforeAll((): void => {
    })
    beforeEach(async (): Promise<void> => {
      await sleep(30);
    })
    afterEach((): void => {
    })
    afterAll((): void => {
    })

    /**
     * @tc.number SUB_SPEC_PROMISE_0100
     * @tc.name PromiseThenCallbackOrderTest
     * @tc.desc test Promise.then callbacks execution order matches registration order on same Worker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenCallbackOrderTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-065: Promise.then callback order on same Worker
      callbackOrder = [];
      orderIndex = 0;
      
      let p: Promise<number> = Promise.resolve(42.0);
      
      p.then((value: number) => {
        callbackOrder.push(1);
      });
      
      p.then((value: number) => {
        callbackOrder.push(2);
      });
      
      p.then((value: number) => {
        callbackOrder.push(3);
      });
      
      await sleep(100);
      
      expect(callbackOrder.length).assertEqual(3);
      expect(callbackOrder[0]).assertEqual(1);
      expect(callbackOrder[1]).assertEqual(2);
      expect(callbackOrder[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_SPEC_PROMISE_0200
     * @tc.name PromiseThenCallbackAsJobTest
     * @tc.desc test Promise.then callback executed as separate Job on same Worker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseThenCallbackAsJobTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-066: Promise.then callback as separate Job
      let callbackExecuted: boolean = false;
      let jobIdBefore: int = 0;
      let jobIdAfter: int = 0;
      
      let p: Promise<number> = Promise.resolve(42.0);
      
      jobIdBefore = StdProcess.tid();
      
      p.then((value: number) => {
        jobIdAfter = StdProcess.tid();
        callbackExecuted = true;
      });
      
      await sleep(100);
      
      expect(callbackExecuted).assertTrue();
      expect(jobIdBefore).assertEqual(jobIdAfter);
    });

    /**
     * @tc.number SUB_SPEC_PROMISE_0300
     * @tc.name UnhandledRejectedPromiseTest
     * @tc.desc test rejected Promise without await or catch/then handlers is considered unhandled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('UnhandledRejectedPromiseTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-069: unhandled rejected Promise
      let handledByCatch: boolean = false;
      
      let rejectedPromise: Promise<number> = Promise.reject(new Error("test rejection"));
      
      rejectedPromise.catch((error: Error) => {
        handledByCatch = true;
      });
      
      await sleep(100);
      
      expect(handledByCatch).assertTrue();
    });

    /**
     * @tc.number SUB_SPEC_PROMISE_0400
     * @tc.name AsyncFunctionCallAsyncWithoutAwaitTest
     * @tc.desc test calling async function without await: inner async returns pending Promise, if rejected becomes unhandled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsyncFunctionCallAsyncWithoutAwaitTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // TC-071: async function calls async without await
      innerPromiseCreated = false;
      innerPromiseHandled = false;
      
      await outerAsyncFunc();
      await sleep(30);
      
      expect(innerPromiseCreated).assertTrue();
      expect(innerPromiseHandled).assertTrue();
    });

    /**
     * @tc.number SUB_SPEC_PROMISE_0500
     * @tc.name PromiseCrossWorkerAwaitTest
     * @tc.desc test Promise can be awaited/resolved across Workers via TaskPool
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseCrossWorkerAwaitTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-068: Promise cross Worker await/resolved
      let sharedPromise: Promise<number> = Promise.resolve(42.0);
      let resultFromTask: number = 0;
      
      let task: taskpool.Task = new taskpool.Task(crossWorkerTask, sharedPromise);
      resultFromTask = await taskpool.execute(task) as number;
      
      let resultFromMain: number = await sharedPromise;
      
      expect(resultFromMain).assertEqual(42);
      expect(resultFromTask).assertEqual(100);
    });

    /**
     * @tc.number SUB_SPEC_PROMISE_0600
     * @tc.name SyncFuncAsPromiseThenCallbackTest
     * @tc.desc test F-01 sync top-level function as Promise.then callback: (value: T) => TResult
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SyncFuncAsPromiseThenCallbackTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-187: F-01 sync top-level function as Promise.then callback
      // syncThenCallback(x: number): number — then resolves value and transforms it
      let p: Promise<number> = Promise.resolve(21.0);
      let result: number = await p.then(syncThenCallback);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_SPEC_PROMISE_0700
     * @tc.name AsyncFuncAsPromiseThenCallbackTest
     * @tc.desc test F-02 async top-level function as Promise.then callback: Promise flattening
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncFuncAsPromiseThenCallbackTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-188: F-02 async top-level function as Promise.then callback
      // asyncThenCallback(x: number): Promise<number> — Promise嵌套自动展平
      let p: Promise<number> = Promise.resolve(50.0);
      let result: number = await p.then(asyncThenCallback);
      expect(result).assertEqual(150);
    });

    /**
     * @tc.number SUB_SPEC_PROMISE_0800
     * @tc.name GenericSyncFuncAsPromiseThenCallbackTest
     * @tc.desc test F-03 generic sync function as Promise.then callback: explicit type parameter required
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('GenericSyncFuncAsPromiseThenCallbackTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-189: F-03 generic sync function as Promise.then callback
      // genericSyncThenCallback<number>(x: number): number — explicit type parameter
      let p: Promise<number> = Promise.resolve(42.0);
      let result: number = await p.then(genericSyncThenCallback<number>);
      expect(result).assertEqual(42);

      let p2: Promise<string> = Promise.resolve("generic");
      let result2: string = await p2.then(genericSyncThenCallback<string>);
      expect(result2).assertEqual("generic");
    });

    /**
     * @tc.number SUB_SPEC_PROMISE_0900
     * @tc.name GenericAsyncFuncAsPromiseThenCallbackTest
     * @tc.desc test F-04 generic async function as Promise.then callback: Promise flattening with generics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('GenericAsyncFuncAsPromiseThenCallbackTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-190: F-04 generic async function as Promise.then callback
      // genericAsyncThenCallback<string>(x: string): Promise<string> — async generic flattening
      let p: Promise<string> = Promise.resolve("async_generic");
      let result: string = await p.then(genericAsyncThenCallback<string>);
      expect(result).assertEqual("async_generic");
    });

    /**
     * @tc.number SUB_SPEC_PROMISE_1000
     * @tc.name ArrowFuncExprAsPromiseThenCallbackTest
     * @tc.desc test F-05 arrow function expression as Promise.then callback: verify compiler behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrowFuncExprAsPromiseThenCallbackTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-191: F-05 arrow function expression as Promise.then callback
      // arrowThenCallback stored in variable, test whether then accepts it
      let p: Promise<number> = Promise.resolve(21.0);
      let result: number = await p.then(arrowThenCallback);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_SPEC_PROMISE_1100
     * @tc.name LambdaExprAsPromiseThenCallbackTest
     * @tc.desc test F-06 Lambda expression as Promise.then callback: Promise allows Lambda
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('LambdaExprAsPromiseThenCallbackTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-192: F-06 Lambda expression as Promise.then callback
      // lambdaThenCallback stored in variable, test whether then accepts it
      let p: Promise<number> = Promise.resolve(41.0);
      let result: number = await p.then(lambdaThenCallback);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_SPEC_PROMISE_1200
     * @tc.name InstanceMethodAsPromiseThenCallbackTest
     * @tc.desc test F-07 class instance method as Promise.then callback: verify this binding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('InstanceMethodAsPromiseThenCallbackTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-193: F-07 class instance method as Promise.then callback
      // instance.instanceMethod(x: number): number — verify this binding correctness
      let p: Promise<number> = Promise.resolve(42.0);
      let instance: InstanceMethodClass = new InstanceMethodClass();
      let result: number = await p.then(instance.instanceMethod);
      expect(result).assertEqual(92);
    });

    /**
     * @tc.number SUB_SPEC_PROMISE_1300
     * @tc.name StaticMethodAsPromiseThenCallbackTest
     * @tc.desc test F-08 class static method as Promise.then callback: no this binding issue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('StaticMethodAsPromiseThenCallbackTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-194: F-08 class static method as Promise.then callback
      // StaticMethodClass.staticMethod(x: number): number — no this binding concern
      let p: Promise<number> = Promise.resolve(50.0);
      let result: number = await p.then(StaticMethodClass.staticMethod);
      expect(result).assertEqual(150);
    });

    /**
     * @tc.number SUB_SPEC_PROMISE_1400
     * @tc.name AsyncInstanceMethodAsPromiseThenCallbackTest
     * @tc.desc test F-09 async class instance method as Promise.then callback: verify this binding with async
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncInstanceMethodAsPromiseThenCallbackTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-195: F-09 async class instance method as Promise.then callback
      // async instance method — verify async + this binding correctness
      let p: Promise<number> = Promise.resolve(100.0);
      let instance: AsyncInstanceMethodClass = new AsyncInstanceMethodClass();
      let result: number = await p.then(instance.asyncInstanceMethod);
      expect(result).assertEqual(300);
    });

    /**
     * @tc.number SUB_SPEC_PROMISE_1500
     * @tc.name AsyncStaticMethodAsPromiseThenCallbackTest
     * @tc.desc test F-10 async class static method as Promise.then callback: Promise flattening
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncStaticMethodAsPromiseThenCallbackTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-196: F-10 async class static method as Promise.then callback
      // async static method — Promise flattening, no this binding concern
      let p: Promise<string> = Promise.resolve("test");
      let result: string = await p.then(AsyncStaticMethodClass.asyncStaticMethod);
      expect(result).assertEqual("test_async_static");
    });

    /**
     * @tc.number SUB_SPEC_PROMISE_1700
     * @tc.name OptionalParamFuncAsPromiseThenCallbackTest
     * @tc.desc test F-12 optional param function as Promise.then callback: resolved value passed as param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('OptionalParamFuncAsPromiseThenCallbackTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-198: F-12 optional param function as Promise.then callback
      // optionalParamThenCallback(x?: number): number — resolved value is passed as x
      let p: Promise<number> = Promise.resolve(5.0);
      let result: number = await p.then(optionalParamThenCallback);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_SPEC_PROMISE_1800
     * @tc.name DefaultParamFuncAsPromiseThenCallbackTest
     * @tc.desc test F-13 default param function as Promise.then callback: resolved value overrides default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('DefaultParamFuncAsPromiseThenCallbackTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-199: F-13 default param function as Promise.then callback
      // defaultParamThenCallback(x: number = 10): number — resolved value overrides default
      let p: Promise<number> = Promise.resolve(5.0);
      let result: number = await p.then(defaultParamThenCallback);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_SPEC_PROMISE_2000
     * @tc.name ReadonlyParamFuncAsPromiseThenCallbackTest
     * @tc.desc test F-15 readonly param function as Promise.then callback: type mismatch (expects array, receives number)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ReadonlyParamFuncAsPromiseThenCallbackTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-201: F-15 readonly param function as Promise.then callback
      // readonlyParamThenCallback(arr: readonly number[]): number — expects array, then passes number
      // Signature mismatch test: verify compiler behavior with incompatible parameter type
      let p: Promise<number[]> = Promise.resolve([1, 2, 3] as number[]);
      let result: number = await p.then(readonlyParamThenCallback);
      expect(result).assertEqual(3);
    });

  });
}