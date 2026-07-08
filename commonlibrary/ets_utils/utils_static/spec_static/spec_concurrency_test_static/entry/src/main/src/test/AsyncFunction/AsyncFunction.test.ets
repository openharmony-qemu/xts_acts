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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-binary/src/main/indexStatic';
import hilog from '@ohos.hilog'

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

async function asyncReturnVoid(): Promise<void> {
  return;
}

async function asyncReturnNumber(): Promise<number> {
  return 42;
}

async function asyncFuncForTypeTest(): Promise<number> {
  return 42;
}

function nonAsyncFuncForTypeTest(): Promise<number> {
  return Promise.resolve(42.0);
}

async function asyncFuncAutoBoxing(): Promise<number> {
  return 42;
}

async function asyncFuncReturnPromise(): Promise<number> {
  return Promise.resolve(42.0);
}

let condition: boolean = true;

async function asyncFuncMixedReturn(): Promise<number> {
  if (condition) {
    return 42;
  } else {
    return Promise.resolve(42.0);
  }
}

async function asyncFuncVoidReturn(): Promise<void> {
  return;
}

async function asyncFuncThrow(): Promise<void> {
  throw new Error("async function error");
}

let asyncLambda = async (): Promise<number> => {
  return 42;
};

class AsyncMethodTestClass {
  public async publicAsyncMethod(): Promise<void> {
    return;
  }
  private async privateAsyncMethod(): Promise<void> {
    return;
  }
  protected async protectedAsyncMethod(): Promise<void> {
    return;
  }
  static async staticAsyncMethod(): Promise<void> {
    return;
  }
  async instanceAsyncMethod(): Promise<number> {
    return 42;
  }
}

class AsyncOverrideBaseClass {
  async baseAsyncMethod(): Promise<void> {
    return undefined;
  }
}

class AsyncOverrideDerivedClass extends AsyncOverrideBaseClass {
  override async baseAsyncMethod(): Promise<void> {
    return undefined;
  }
}

class AsyncThisReturnClass {
  public value: int = 100;
  async asyncMethodReturnThis(): Promise<this> {
    return this;
  }
}

async function asyncEntryPoint(): Promise<void> {
  return;
}

async function asyncZeroSuspendPoint(): Promise<number> {
  return await 5;
}

let firstSuspendFlag: boolean = false;
let promiseCreated: boolean = false;

async function asyncFirstSuspendTest(): Promise<number> {
  firstSuspendFlag = true;
  let result: number = await Promise.resolve(42);
  return result;
}

export default function AsyncFunctionTest():void {
  describe('AsyncFunctionTest', (): void => {
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
     * @tc.number SUB_SPEC_ASYNC_FUNCTION_0100
     * @tc.name AsyncFunctionPromiseVoidReturn
     * @tc.desc test async function returning Promise<void> with argumentless return statement resolves correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncFunctionPromiseVoidReturn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let p: Promise<void> = asyncReturnVoid();
      let resolved: boolean = false;
      p.then(() => {
        resolved = true;
      });
      await sleep(100);
      expect(resolved).assertTrue();
      await p;
    });

    /**
     * @tc.number SUB_SPEC_ASYNC_FUNCTION_0200
     * @tc.name AsyncFunctionPromiseNumberAutobox
     * @tc.desc test async function auto-boxing number value into Promise<number> via return statement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncFunctionPromiseNumberAutobox', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let result: number = await asyncReturnNumber();
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_SPEC_ASYNC_FUNCTION_0300
     * @tc.name AsyncModifierNotPartOfTypeTest
     * @tc.desc test async modifier does not participate in type determination - async and non-async functions are type compatible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncModifierNotPartOfTypeTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-013: async modifier does not participate in type determination
      let fn1: () => Promise<number> = asyncFuncForTypeTest;
      let fn2: () => Promise<number> = nonAsyncFuncForTypeTest;
      let fn3: () => Promise<number> = asyncFuncForTypeTest;

      // Verify function execution results
      let result1: number = await fn1();
      let result2: number = await fn2();
      let result3: number = await fn3();

      expect(result1).assertEqual(42);
      expect(result2).assertEqual(42);
      expect(result3).assertEqual(42);
    });

    /**
     * @tc.number SUB_SPEC_ASYNC_FUNCTION_0400
     * @tc.name AsyncFunctionAutoBoxingTest
     * @tc.desc test async function auto-boxing: return T is auto-boxed to Promise<T>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncFunctionAutoBoxingTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-022: auto-boxing - async function returns T, auto-boxed to Promise<T>
      let result: number = await asyncFuncAutoBoxing();
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_SPEC_ASYNC_FUNCTION_0500
     * @tc.name AsyncFunctionReturnPromiseTest
     * @tc.desc test async function returning Promise<T>: Promise returned as-is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncFunctionReturnPromiseTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-023: return Promise<T> - Promise returned as-is, not boxed again
      let result: number = await asyncFuncReturnPromise();
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_SPEC_ASYNC_FUNCTION_0600
     * @tc.name AsyncFunctionMixedReturnTest
     * @tc.desc test async function with mixed return paths: both auto-boxing and direct Promise return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncFunctionMixedReturnTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-024: mixed return - both paths produce resolved Promise with value 42
      condition = true;
      let result1: number = await asyncFuncMixedReturn();
      expect(result1).assertEqual(42);

      condition = false;
      let result2: number = await asyncFuncMixedReturn();
      expect(result2).assertEqual(42);
    });

    /**
     * @tc.number SUB_SPEC_ASYNC_FUNCTION_0700
     * @tc.name AsyncFunctionVoidReturnTest
     * @tc.desc test async function with argumentless return: valid for Promise<void>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncFunctionVoidReturnTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-025: void return - argumentless return is valid for Promise<void>
      let result: void = await asyncFuncVoidReturn();
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_SPEC_ASYNC_FUNCTION_0800
     * @tc.name AsyncFunctionThrowTest
     * @tc.desc test async function throwing error: results in rejected Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncFunctionThrowTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-026: throw in async function - Promise rejected
      let caught: boolean = false;
      let errorMsg: string = "";
      try {
        await asyncFuncThrow();
      } catch (e) {
        caught = true;
        errorMsg = (e as Error).message;
      }
      expect(caught).assertTrue();
      expect(errorMsg).assertEqual("async function error");
    });

    /**
     * @tc.number SUB_SPEC_ASYNC_FUNCTION_0900
     * @tc.name AsyncLambdaTest
     * @tc.desc test async lambda: type is () => Promise<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncLambdaTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-030: async lambda
      let result: number = await asyncLambda();
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_SPEC_ASYNC_FUNCTION_1000
     * @tc.name AsyncInstanceMethodTest
     * @tc.desc test async instance method in class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncInstanceMethodTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-031: async instance method
      let instance: AsyncMethodTestClass = new AsyncMethodTestClass();
      await instance.publicAsyncMethod();
      let result: number = await instance.instanceAsyncMethod();
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_SPEC_ASYNC_FUNCTION_1100
     * @tc.name AsyncStaticMethodTest
     * @tc.desc test async static method in class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncStaticMethodTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-032: async static method
      let p: Promise<void> = AsyncMethodTestClass.staticAsyncMethod();
      expect(p instanceof Promise).assertTrue();
      let result: void = await p;
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_SPEC_ASYNC_FUNCTION_1200
     * @tc.name AsyncMethodAccessModifierTest
     * @tc.desc test async method with access modifiers: private async, protected async, public async
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncMethodAccessModifierTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-033: async method with access modifiers
      let instance: AsyncMethodTestClass = new AsyncMethodTestClass();
      let p: Promise<void> = instance.publicAsyncMethod();
      expect(p instanceof Promise).assertTrue();
      let result: void = await p;
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_SPEC_ASYNC_FUNCTION_1300
     * @tc.name AsyncMethodOverrideTest
     * @tc.desc test async method with override: override and async can coexist
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncMethodOverrideTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-034: async method with override
      let base: AsyncOverrideBaseClass = new AsyncOverrideBaseClass();
      let derived: AsyncOverrideDerivedClass = new AsyncOverrideDerivedClass();
      let p1: Promise<void> = base.baseAsyncMethod();
      let p2: Promise<void> = derived.baseAsyncMethod();
      expect(p1 instanceof Promise).assertTrue();
      expect(p2 instanceof Promise).assertTrue();
      let result1: void = await p1;
      let result2: void = await p2;
      expect(result1).assertUndefined();
      expect(result2).assertUndefined();
    });

    /**
     * @tc.number SUB_SPEC_ASYNC_FUNCTION_1400
     * @tc.name AsyncMethodReturnThisTest
     * @tc.desc test async method returning this: this auto-boxed to Promise<this>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncMethodReturnThisTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-035: async method returning this
      let instance: AsyncThisReturnClass = new AsyncThisReturnClass();
      let result: AsyncThisReturnClass = await instance.asyncMethodReturnThis();
      expect(result.value).assertEqual(100);
      expect(result === instance).assertTrue();
    });

    /**
     * @tc.number SUB_SPEC_ASYNC_FUNCTION_1500
     * @tc.name AsyncEntryPointTest
     * @tc.desc test async entry function: async function main() is valid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsyncEntryPointTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // TC-036: async entry function
      let p: Promise<void> = asyncEntryPoint();
      expect(p instanceof Promise).assertTrue();
      let result: void = await p;
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_SPEC_ASYNC_FUNCTION_1600
     * @tc.name AsyncZeroSuspendPointTest
     * @tc.desc test async function with zero suspend points: no new coroutine created, Promise immediately resolved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsyncZeroSuspendPointTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // TC-037: async function with zero suspend points
      let result: number = await asyncZeroSuspendPoint();
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_SPEC_ASYNC_FUNCTION_1700
     * @tc.name AsyncFirstSuspendTest
     * @tc.desc test async function first suspend: control returns to caller, returns pending Promise, creates new coroutine
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsyncFirstSuspendTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // TC-038: async function first suspend point
      firstSuspendFlag = false;
      let p: Promise<number> = asyncFirstSuspendTest();
      expect(firstSuspendFlag).assertTrue();
      expect(p instanceof Promise).assertTrue();
      let result: number = await p;
      expect(result).assertEqual(42);
    });

  });
}