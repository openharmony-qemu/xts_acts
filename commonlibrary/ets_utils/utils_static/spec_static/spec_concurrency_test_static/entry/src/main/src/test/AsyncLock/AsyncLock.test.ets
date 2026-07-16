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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import hilog from '@ohos.hilog'

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

class SharedState {
  public value: string = "nothing";
}

let sharedData: SharedState = new SharedState();

function checkAndModify(data: SharedState, expected: string, updated: string): void {
  if (data.value !== expected) {
  }
  data.value = updated;
}

async function delay(): Promise<void> {
  return new Promise<void>((resolve, reject) => {
    setTimeout(resolve, 1, undefined);
  });
}

let asyncLock: AsyncLock = new AsyncLock();
let lockAcquired: boolean = false;
let callbackExecuted: boolean = false;

// F-01: sync top-level function (parameterless, matches AsyncLockCallback<T> = () => T)
function syncCallbackFunc(): number {
  return 42;
}

// F-02: async top-level function (parameterless, matches AsyncLockCallback<T> = () => Promise<T>)
async function asyncCallbackFunc(): Promise<number> {
  return 100;
}

// F-03: generic sync function (takes param, signature mismatch with () => T)
function genericSyncCallbackFunc<T>(x: T): T {
  return x;
}

// F-04: generic async function (takes param, signature mismatch with () => Promise<T>)
async function genericAsyncCallbackFunc<T>(x: T): Promise<T> {
  return x;
}

// F-05: arrow function expression stored in variable (parameterless)
let arrowCallbackVar = (): number => 42;

// F-06: async Lambda expression stored in variable (parameterless)
let asyncLambdaCallbackVar = async (): Promise<number> => { return 88; };

// F-07: class instance method (parameterless)
class InstanceCallbackCls {
  instanceCallbackMethod(): number {
    return 55;
  }
}

// F-08: class static method (parameterless)
class StaticCallbackCls {
  static staticCallbackMethod(): number {
    return 66;
  }
}

// F-09: async class instance method (parameterless)
class AsyncInstanceCallbackCls {
  async asyncInstanceCallbackMethod(): Promise<number> {
    return 77;
  }
}

// F-10: async class static method (parameterless)
class AsyncStaticCallbackCls {
  static async asyncStaticCallbackMethod(): Promise<string> {
    return "async_static_result";
  }
}

// F-12: optional param async function (can be called with 0 args)
async function asyncOptParamCallback(x?: number): Promise<number> {
  if (x === undefined) {
    return 0;
  }
  return x;
}

// F-13: default param async function (can be called with 0 args)
async function asyncDefaultParamCallback(x: number = 10): Promise<number> {
  return x * 2;
}

// F-14: rest param async function (can be called with 0 args since rest accepts 0+)
async function asyncRestParamCallback(...nums: number[]): Promise<number> {
  let sum: number = 0;
  for (let i: int = 0; i < nums.length; i++) {
    sum += nums[i];
  }
  return sum;
}

// F-15: readonly param async function (requires 1 arg)
async function asyncReadonlyParamCallback(arr: readonly number[]): Promise<number> {
  return arr.length;
}

// F-16: native function (parameterless)
native function nativeCallbackFunc(): number;

export default function AsyncLockTest():void {
  describe('AsyncLockTest', (): void => {
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
     * @tc.number SUB_SPEC_ASYNCLOCK_0100
     * @tc.name AsyncLockBasicTest
     * @tc.desc test AsyncLock.lockAsync basic usage: callback executed after lock acquired
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncLockBasicTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-044: AsyncLock.lockAsync basic usage
      lockAcquired = false;
      callbackExecuted = false;

      let p: Promise<void> = asyncLock.lockAsync<void>(async () => {
        callbackExecuted = true;
        lockAcquired = true;
      });

      expect(p instanceof Promise).assertTrue();

      await p;
      expect(callbackExecuted).assertTrue();
      expect(lockAcquired).assertTrue();
    });

    /**
     * @tc.number SUB_SPEC_ASYNCLOCK_0200
     * @tc.name AsyncLockCallbackAwaitTest
     * @tc.desc test AsyncLock.lockAsync callback with await suspension: lock held during suspension
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncLockCallbackAwaitTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-045: AsyncLock.lockAsync callback with await suspension
      sharedData.value = "nothing";

      let p1: Promise<void> = asyncLock.lockAsync<void>(async () => {
        checkAndModify(sharedData, "nothing", "paraglider");
        await delay();
        checkAndModify(sharedData, "paraglider", "nothing");
      }, AsyncLockMode.EXCLUSIVE);

      let p2: Promise<void> = asyncLock.lockAsync<void>(async () => {
        checkAndModify(sharedData, "nothing", "apple");
        await delay();
        checkAndModify(sharedData, "apple", "nothing");
      });

      await p1;
      await p2;

      expect(sharedData.value).assertEqual("nothing");
    });

    /**
     * @tc.number SUB_SPEC_ASYNCLOCK_0300
     * @tc.name SyncFuncAsLockAsyncCallbackTest
     * @tc.desc test F-01 sync top-level function as lockAsync callback: AsyncLockCallback<T> = () => T | Promise<T>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SyncFuncAsLockAsyncCallbackTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-155: F-01 sync top-level function as lockAsync callback
      // AsyncLockCallback<T> = () => T | Promise<T>, sync () => number matches () => T
      let lock: AsyncLock = new AsyncLock();
      let result: number = await lock.lockAsync<number>(syncCallbackFunc);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_SPEC_ASYNCLOCK_0400
     * @tc.name AsyncFuncAsLockAsyncCallbackTest
     * @tc.desc test F-02 async top-level function as lockAsync callback: AsyncLockCallback<T> = () => T | Promise<T>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncFuncAsLockAsyncCallbackTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-156: F-02 async top-level function as lockAsync callback
      // AsyncLockCallback<T> = () => T | Promise<T>, async () => Promise<number> matches () => Promise<T>
      let lock: AsyncLock = new AsyncLock();
      let result: number = await lock.lockAsync<number>(asyncCallbackFunc);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_SPEC_ASYNCLOCK_0700
     * @tc.name ArrowFuncExprAsLockAsyncCallbackTest
     * @tc.desc test F-05 arrow function expression as lockAsync callback: AsyncLockCallback<T> = () => T | Promise<T>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrowFuncExprAsLockAsyncCallbackTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-159: F-05 arrow function expression stored in variable as lockAsync callback
      // Arrow function type () => number matches AsyncLockCallback<number> = () => number
      let lock: AsyncLock = new AsyncLock();
      let result: number = await lock.lockAsync<number>(arrowCallbackVar);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_SPEC_ASYNCLOCK_0800
     * @tc.name AsyncLambdaAsLockAsyncCallbackTest
     * @tc.desc test F-06 async Lambda expression as lockAsync callback: AsyncLockCallback<T> = () => T | Promise<T>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncLambdaAsLockAsyncCallbackTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-160: F-06 async Lambda expression stored in variable as lockAsync callback
      // async Lambda type () => Promise<number> matches AsyncLockCallback<number> = () => Promise<number>
      let lock: AsyncLock = new AsyncLock();
      let result: number = await lock.lockAsync<number>(asyncLambdaCallbackVar);
      expect(result).assertEqual(88);
    });

    /**
     * @tc.number SUB_SPEC_ASYNCLOCK_0900
     * @tc.name InstanceMethodAsLockAsyncCallbackTest
     * @tc.desc test F-07 class instance method as lockAsync callback: AsyncLockCallback<T> = () => T | Promise<T>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('InstanceMethodAsLockAsyncCallbackTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-161: F-07 class instance method as lockAsync callback
      // instance.instanceCallbackMethod type () => number matches AsyncLockCallback<number>
      let lock: AsyncLock = new AsyncLock();
      let instance: InstanceCallbackCls = new InstanceCallbackCls();
      let result: number = await lock.lockAsync<number>(instance.instanceCallbackMethod);
      expect(result).assertEqual(55);
    });

    /**
     * @tc.number SUB_SPEC_ASYNCLOCK_1000
     * @tc.name StaticMethodAsLockAsyncCallbackTest
     * @tc.desc test F-08 class static method as lockAsync callback: AsyncLockCallback<T> = () => T | Promise<T>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('StaticMethodAsLockAsyncCallbackTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-162: F-08 class static method as lockAsync callback
      // StaticCallbackCls.staticCallbackMethod type () => number matches AsyncLockCallback<number>
      let lock: AsyncLock = new AsyncLock();
      let result: number = await lock.lockAsync<number>(StaticCallbackCls.staticCallbackMethod);
      expect(result).assertEqual(66);
    });

    /**
     * @tc.number SUB_SPEC_ASYNCLOCK_1100
     * @tc.name AsyncInstanceMethodAsLockAsyncCallbackTest
     * @tc.desc test F-09 async class instance method as lockAsync callback: AsyncLockCallback<T> = () => T | Promise<T>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncInstanceMethodAsLockAsyncCallbackTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-163: F-09 async class instance method as lockAsync callback
      // instance.asyncInstanceCallbackMethod type () => Promise<number> matches AsyncLockCallback<number>
      let lock: AsyncLock = new AsyncLock();
      let instance: AsyncInstanceCallbackCls = new AsyncInstanceCallbackCls();
      let result: number = await lock.lockAsync<number>(instance.asyncInstanceCallbackMethod);
      expect(result).assertEqual(77);
    });

    /**
     * @tc.number SUB_SPEC_ASYNCLOCK_1200
     * @tc.name AsyncStaticMethodAsLockAsyncCallbackTest
     * @tc.desc test F-10 async class static method as lockAsync callback: SPEC未明确静态方法是否可传递
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncStaticMethodAsLockAsyncCallbackTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-164: F-10 async class static method as lockAsync callback
      // AsyncStaticCallbackCls.asyncStaticCallbackMethod type () => Promise<string> matches AsyncLockCallback<string>
      let lock: AsyncLock = new AsyncLock();
      let result: string = await lock.lockAsync<string>(AsyncStaticCallbackCls.asyncStaticCallbackMethod);
      expect(result).assertEqual("async_static_result");
    });

  });
}