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

class TestClass {
  public value: int;
  constructor(v: int) {
    this.value = v;
  }
}

class OptionalAsyncMethodClass {
  public async asyncMethod(): Promise<string> {
    return "async result";
  }
}

let optionalObj: OptionalAsyncMethodClass | null = null;

async function getOptionalPromise(): Promise<number | undefined> {
  if (optionalObj !== null) {
    return 42;
  }
  return undefined;
}

async function getUnionTypePromise(): Promise<number | string> {
  return Promise.resolve(42 as number | string);
}

let caughtError: Error | null = null;

async function awaitTryCatchRejectedFunc(): Promise<number> {
  try {
    let v = await Promise.reject(new Error("catchable error"));
    return v;
  } catch (e) {
    caughtError = e as Error;
    return 0;
  }
}

export default function AwaitExpressionTest():void {
  describe('AwaitExpressionTest', (): void => {
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
     * @tc.number SUB_SPEC_AWAIT_EXPRESSION_0100
     * @tc.name AwaitResolvedPromiseTest
     * @tc.desc test await on resolved Promise: suspend -> resume -> returns value, Awaited<Promise<number>> = number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AwaitResolvedPromiseTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-014: await resolved Promise
      let result: number = await Promise.resolve(42);
      expect(result).assertEqual(42);
      expect(typeof result).assertEqual("number");
    });

    /**
     * @tc.number SUB_SPEC_AWAIT_EXPRESSION_0200
     * @tc.name AwaitRejectedPromiseTest
     * @tc.desc test await on rejected Promise: suspend -> throw Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AwaitRejectedPromiseTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-015: await rejected Promise throws error
      let caught: boolean = false;
      let errorMsg: string = "";
      try {
        let v = await Promise.reject(new Error("test rejection error"));
      } catch (e) {
        caught = true;
        errorMsg = (e as Error).message;
      }
      expect(caught).assertTrue();
      expect(errorMsg).assertEqual("test rejection error");
    });

    /**
     * @tc.number SUB_SPEC_AWAIT_EXPRESSION_0300
     * @tc.name AwaitTryCatchRejectedTest
     * @tc.desc test await rejected Promise in try-catch: catch block catches Error instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AwaitTryCatchRejectedTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-016: await rejected Promise in try-catch
      caughtError = null;
      let result: number = await awaitTryCatchRejectedFunc();
      expect(result).assertEqual(0);
      expect(caughtError).not().assertNull();
      expect(caughtError!.message).assertEqual("catchable error");
    });

    /**
     * @tc.number SUB_SPEC_AWAIT_EXPRESSION_0400
     * @tc.name AwaitNumberLiteralTest
     * @tc.desc test await on number literal: no suspend, Awaited<int> = int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AwaitNumberLiteralTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-017: await number literal
      let result: number = await 42;
      expect(result).assertEqual(42);
      expect(typeof result).assertEqual("number");
    });

    /**
     * @tc.number SUB_SPEC_AWAIT_EXPRESSION_0500
     * @tc.name AwaitStringLiteralTest
     * @tc.desc test await on string literal: no suspend
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AwaitStringLiteralTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-018: await string literal
      let result: string = await "hello";
      expect(result).assertEqual("hello");
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number SUB_SPEC_AWAIT_EXPRESSION_0600
     * @tc.name AwaitNullTest
     * @tc.desc test await on null: no suspend
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AwaitNullTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-019: await null
      let result: null = await null;
      expect(result).assertNull();
    });

    /**
     * @tc.number SUB_SPEC_AWAIT_EXPRESSION_0700
     * @tc.name AwaitUndefinedTest
     * @tc.desc test await on undefined: no suspend
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AwaitUndefinedTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-020: await undefined
      let result: undefined = await undefined;
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_SPEC_AWAIT_EXPRESSION_0800
     * @tc.name AwaitClassInstanceTest
     * @tc.desc test await on class instance: no suspend
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AwaitClassInstanceTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-021: await class instance
      let instance: TestClass = new TestClass(42);
      let result: TestClass = await instance;
      expect(result.value).assertEqual(42);
    });

    /**
     * @tc.number SUB_SPEC_AWAIT_EXPRESSION_0900
     * @tc.name AwaitPromiseOrUndefinedTest
     * @tc.desc test await on Promise<T>|undefined: partial suspend - null/undefined no suspend, non-null suspend
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AwaitPromiseOrUndefinedTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-027: await Promise<T>|undefined
      optionalObj = null;
      let result1: number | undefined = await getOptionalPromise();
      expect(result1).assertUndefined();

      optionalObj = new OptionalAsyncMethodClass();
      let result2: number | undefined = await getOptionalPromise();
      expect(result2).assertEqual(42);
    });

    /**
     * @tc.number SUB_SPEC_AWAIT_EXPRESSION_1000
     * @tc.name AwaitUnionTypePromiseTest
     * @tc.desc test await on Promise<union type>: result type is union type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AwaitUnionTypePromiseTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-028: await Promise<union type>
      let result: number | string = await getUnionTypePromise();
      expect(result).assertEqual(42);
      expect(typeof result === "number" || typeof result === "string").assertTrue();
    });

    /**
     * @tc.number SUB_SPEC_AWAIT_EXPRESSION_1100
     * @tc.name AwaitOptionalChainMethodTest
     * @tc.desc test await on optional chain method call: Awaited<Promise<string>|undefined> = string|undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AwaitOptionalChainMethodTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-029: await optional chain method call
      optionalObj = null;
      let result1: string | undefined = await optionalObj?.asyncMethod();
      expect(result1).assertUndefined();

      optionalObj = new OptionalAsyncMethodClass();
      let result2: string | undefined = await optionalObj?.asyncMethod();
      expect(result2).assertEqual("async result");
    });

  });
}