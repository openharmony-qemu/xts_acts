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

async function identity<T>(x: T) {
  return await x;
}

let genericLock: AsyncLock = new AsyncLock();

async function processAsyncLambda<T>(fn: () => Promise<T>) {
  return await fn();
}

interface IGenericPromise<T> {
  m(): Promise<T>;
}

class GenericPromiseImpl implements IGenericPromise<number> {
  async m(): Promise<number> {
    return 42;
  }
}

class GenericAsyncClass<T> {
  async instanceMethod(): Promise<T> {
    let value: T = this.createValue();
    return value;
  }
  
  createValue(): T {
    return new Object() as T;
  }
}

class GenericAsyncClassWithNumber extends GenericAsyncClass<number> {
  createValue(): number {
    return 100;
  }
}

async function constrainedAsyncFunc<T extends Number>(x: T): Promise<T> {
  return x;
}

export default function GenericsConcurrencyTest():void {
  describe('GenericsConcurrencyTest', (): void => {
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
     * @tc.number SUB_SPEC_GENERIC_CONCURRENCY_0100
     * @tc.name GenericAsyncAwaitNonPromiseTest
     * @tc.desc test async function with await on non-Promise type: await number/string does not suspend
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('GenericAsyncAwaitNonPromiseTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-075: await non-Promise type parameter
      // SPEC: Awaited<number> = number, Awaited<string> = string (3_types.rst:2825-2826)
      let result: number = await identity<number>(42);
      expect(result).assertEqual(42);
      expect(typeof result).assertEqual("number");
      
      let strResult: string = await identity<string>("hello");
      expect(strResult).assertEqual("hello");
    });

    /**
     * @tc.number SUB_SPEC_GENERIC_CONCURRENCY_0200
     * @tc.name GenericAsyncLockTypeInferenceTest
     * @tc.desc test generic AsyncLock.lockAsync type inference: result type inferred as T
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('GenericAsyncLockTypeInferenceTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-076: generic AsyncLock.lockAsync type inference
      let result: number = await genericLock.lockAsync<number>(async () => {
        return 42;
      });
      expect(result).assertEqual(42);
      expect(typeof result).assertEqual("number");
      
      let strResult: string = await genericLock.lockAsync<string>(async () => {
        return "test string";
      });
      expect(strResult).assertEqual("test string");
    });

    /**
     * @tc.number SUB_SPEC_GENERIC_CONCURRENCY_0300
     * @tc.name GenericInterfacePromiseMethodTest
     * @tc.desc test generic interface with Promise method: interface method cannot be async (no body), but implementation class can use async
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('GenericInterfacePromiseMethodTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-077: generic interface declares Promise method (non-async)
      let impl: IGenericPromise<number> = new GenericPromiseImpl();
      let result: number = await impl.m();
      expect(result).assertEqual(42);
      
      let implInstance: GenericPromiseImpl = new GenericPromiseImpl();
      let result2: number = await implInstance.m();
      expect(result2).assertEqual(42);
    });

    /**
     * @tc.number SUB_SPEC_GENERIC_CONCURRENCY_0400
     * @tc.name AsyncGenericClassInstanceMethodTest
     * @tc.desc test async generic class instance method referencing class type parameter: T available in async method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncGenericClassInstanceMethodTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-078: async generic class instance method references class type parameter
      let instance: GenericAsyncClassWithNumber = new GenericAsyncClassWithNumber();
      let result: number = await instance.instanceMethod();
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_SPEC_GENERIC_CONCURRENCY_0500
     * @tc.name GenericAsyncFunctionWithTypeConstraintTest
     * @tc.desc test generic async function with type constraint: constraint and async coexist
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('GenericAsyncFunctionWithTypeConstraintTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-080: generic async function + type constraint
      let numValue: number = 3.14;
      let result: number = await constrainedAsyncFunc<number>(numValue);
      expect(result).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_SPEC_GENERIC_CONCURRENCY_0600
     * @tc.name AsyncLambdaInGenericFunctionContextTest
     * @tc.desc test async lambda in generic function context: lambda return type inferred as Promise<T>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncLambdaInGenericFunctionContextTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-081: async lambda in generic function context inference
      let result: number = await processAsyncLambda<number>(async () => {
        return 42;
      });
      expect(result).assertEqual(42);

      let strResult: string = await processAsyncLambda<string>(async () => {
        return "inferred string";
      });
      expect(strResult).assertEqual("inferred string");
    });



  });
}