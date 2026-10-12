'use static'
/*
 * Copyright (c) 2026 RKH Corp.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';

class ValidationError extends Error {
  constructor(message: string) {
    super(message)
    this.name = "ValidationError"
  }
}

class CustomError extends Error {
  errorCode: number
  constructor(message: string, errorCode: number) {
    super(message)
    this.errorCode = errorCode
  }
}

class CustomError2 extends Error {
  errorCode: number
  constructor(message: string, errorCode: number) {
    super(message)
    this.name = "CustomError"
    this.errorCode = errorCode
  }
}

interface Data { name: string; age: number }
interface Result { value: number }

export default function BuiltinsPromiseLikeThenFirstTest(): void {
  describe('BuiltinsPromiseLikeThenFirstTest', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach((): void => {

      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach((): void => {
      // Required by XTS describe completeness; no per-case cleanup for this suite.
    })
    afterAll((): void => {
      // Required by XTS describe completeness; no suite-level cleanup for this suite.
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_0100
     * @tc.desc   Verify PromiseLike.then with string toUpperCase transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseLikeThenFirstTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = promise.then((value: string) => value.toUpperCase())
      let val = await result
      expect(val).assertEqual("HELLO")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_0200
     * @tc.desc   Verify PromiseLike.then with onFulfilled and onRejected callbacks on resolved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseLikeThenFirstTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = promise.then(
        (value: string) => value.toUpperCase(),
        (error: Error) => { expect(error instanceof Error).assertTrue(); return "fallback" }
      )
      let val = await result
      expect(val).assertEqual("HELLO")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_0300
     * @tc.desc   Verify PromiseLike.then without callbacks passes value through
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = promise.then()
      let val = await result
      expect(val).assertEqual("hello")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_0400
     * @tc.desc   Verify PromiseLike.then with identity onFulfilled and onRejected on resolved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = promise.then(
        (value: string) => value,
        (error: Error) => { expect(error instanceof Error).assertTrue(); return "error" }
      )
      let val = await result
      expect(val).assertEqual("hello")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_0500
     * @tc.desc   Verify PromiseLike.then with number multiplication transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseLikeThenFirstTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<number> = Promise.resolve<number>(42)
      let result = promise.then((value: number) => value * 2)
      let val = await result
      expect(val).assertEqual(84)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_0600
     * @tc.desc   Verify PromiseLike.then with block body returning toUpperCase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseLikeThenFirstTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = promise.then((value: string) => {
        return value.toUpperCase()
      })
      let val = await result
      expect(val).assertEqual("HELLO")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_0700
     * @tc.desc   Verify PromiseLike.then returns PromiseLike with explicit type annotation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseLikeThenFirstTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.resolve<string>("hello")
      let result: PromiseLike<string> = promise.then((value: string) => value.toUpperCase())
      let val = await result
      expect(val).assertEqual("HELLO")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_0800
     * @tc.desc   Verify PromiseLike.then returning Promise resolves to string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseLikeThenFirstTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<number> = Promise.resolve<number>(42)
      let result = promise.then((value: number) => {
        return Promise.resolve<string>(value.toString())
      })
      let val = await result
      expect(val).assertEqual("42")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_0900
     * @tc.desc   Verify PromiseLike.then returning null from onFulfilled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = promise.then((_value: string) => null)
      let val = await result
      expect(val).assertNull()
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_1000
     * @tc.desc   Verify PromiseLike.then returning undefined from onFulfilled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = promise.then((_value: string) => undefined)
      let val = await result
      expect(val).assertUndefined()
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_1100
     * @tc.desc   Verify PromiseLike.then with union type string|number return
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<number> = Promise.resolve<number>(42)
      let result = promise.then((value: number): string | number => {
        return value > 10 ? value : "small"
      })
      let val = await result
      expect(val).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_1200
     * @tc.desc   Verify PromiseLike.then transforms string to number via length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseLikeThenFirstTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = promise.then((value: string) => value.length)
      let val = await result
      expect(val).assertEqual(5)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_1300
     * @tc.desc   Verify PromiseLike.then with Data interface extracts name property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {

      let promise: PromiseLike<Data> = Promise.resolve<Data>({ name: "Alice", age: 30 })
      let result = promise.then((value: Data) => value.name)
      let val = await result
      expect(val).assertEqual("Alice")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_1400
     * @tc.desc   Verify PromiseLike.then with number array returns length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<number[]> = Promise.resolve<number[]>([1, 2, 3])
      let result = promise.then((value: number[]) => value.length)
      let val = await result
      expect(val).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_1500
     * @tc.desc   Verify PromiseLike.then with null input transforms to string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<null> = Promise.resolve<null>(null)
      let result = promise.then((_value: null) => "was null")
      let val = await result
      expect(val).assertEqual("was null")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_1600
     * @tc.desc   Verify PromiseLike.then with undefined input transforms to string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<undefined> = Promise.resolve<undefined>(undefined)
      let result = promise.then((_value: undefined) => "was undefined")
      let val = await result
      expect(val).assertEqual("was undefined")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_1700
     * @tc.desc   Verify PromiseLike.then with union type string|number input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let numPromise: PromiseLike<number> = Promise.resolve<number>(42)
      let strPromise: PromiseLike<string> = Promise.resolve<string>("hello")
      let numResult = await numPromise.then<number>((value: number) => value)
      let strResult = await strPromise.then<number>((value: string) => value.length)
      expect(numResult).assertEqual(42)
      expect(strResult).assertEqual(5)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_1800
     * @tc.desc   Verify PromiseLike.then throwing Error in onFulfilled rejects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = promise.then((value: string) => {
        throw new Error("Intentional error")
      })
      let caught: boolean = false
      try {
        await result
        expect().assertFail()
      } catch (error) {
        caught = true
        expect(error instanceof Error).assertTrue()
        expect(error.message).assertEqual("Intentional error")
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_1900
     * @tc.desc   Verify PromiseLike.then onRejected recovers from rejection with string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseLikeThenFirstTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.reject<string>(new Error("failed"))
      let result = promise.then(
        (value: string) => value,
        (error: Error) => { expect(error instanceof Error).assertTrue(); return "recovered" }
      )
      let val = await result
      expect(val).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_2000
     * @tc.desc   Verify PromiseLike.then onRejected with block body recovers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseLikeThenFirstTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.reject<string>(new Error("failed"))
      let result = promise.then(
        (value: string) => value,
        (error: Error) => {
          expect(error instanceof Error).assertTrue()
          return "recovered"
        }
      )
      let val = await result
      expect(val).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_2100
     * @tc.desc   Verify PromiseLike.then onRejected with explicit return type recovers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseLikeThenFirstTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.reject<string>(new Error("failed"))
      let result = promise.then(
        (value: string) => value,
        (error: Error): string => { expect(error instanceof Error).assertTrue(); return "recovered" }
      )
      let val = await result
      expect(val).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_2200
     * @tc.desc   Verify PromiseLike.then onRejected returning Promise resolves
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.reject<string>(new Error("failed"))
      let result = promise.then(
        (value: string) => value,
        (error: Error) => {
          expect(error instanceof Error).assertTrue()
          return Promise.resolve<string>("recovered")
        }
      )
      let val = await result
      expect(val).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_2300
     * @tc.desc   Verify PromiseLike.then onRejected returning null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.reject<string>(new Error("failed"))
      let result = promise.then(
        (value: string) => value,
        (_error: Error) => null
      )
      let val = await result
      expect(val).assertNull()
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_2400
     * @tc.desc   Verify PromiseLike.then onRejected returning undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.reject<string>(new Error("failed"))
      let result = promise.then(
        (value: string) => value,
        (_error: Error) => undefined
      )
      let val = await result
      expect(val).assertUndefined()
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_2500
     * @tc.desc   Verify PromiseLike.then onRejected re-throwing error rejects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.reject<string>(new Error("failed"))
      let result = promise.then(
        (value: string) => value,
        (error: Error) => {
          throw error
        }
      )
      let caught: boolean = false
      try {
        await result
        expect().assertFail()
      } catch (error) {
        caught = true
        expect(error instanceof Error).assertTrue()
        expect(error.message).assertEqual("failed")
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_2600
     * @tc.desc   onRejected returns recovery value for custom error message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseLikeThenFirstTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let customError = new Error("Custom error")
      let promise: PromiseLike<string> = Promise.reject<string>(customError)
      let result = promise.then(
        (value: string) => value,
        (error: Error) => {
          expect(error instanceof Error).assertTrue()
          return "recovered"
        }
      )
      let val = await result
      expect(val).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_2700
     * @tc.desc   onRejected returns recovery value for CustomError2 rejection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let customError = new CustomError2("Custom error", 500)
      let promise: PromiseLike<string> = Promise.reject<string>(customError)
      let result = promise.then(
        (value: string) => value,
        (error: Error) => {
          expect(error instanceof Error).assertTrue()
          return "recovered"
        }
      )
      let val = await result
      expect(val).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest2800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_2800
     * @tc.desc   Verify PromiseLike.then onRejected throwing new error replaces original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.reject<string>(new Error("first error"))
      let result = promise.then(
        (value: string) => value,
        (error: Error) => {
          expect(error instanceof Error).assertTrue()
          throw new Error("Second error")
        }
      )
      let caught: boolean = false
      try {
        await result
        expect().assertFail()
      } catch (error) {
        caught = true
        expect(error instanceof Error).assertTrue()
        expect(error.message).assertEqual("Second error")
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest2900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_2900
     * @tc.desc   then maps string value to uppercase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseLikeThenFirstTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = promise.then((value: string) => value.toUpperCase())
      let val = await result
      expect(val).assertEqual("HELLO")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest3000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_3000
     * @tc.desc   Verify PromiseLike.then chain with number to string transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseLikeThenFirstTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<number> = Promise.resolve<number>(42)
      let result = promise
        .then((value: number) => value * 2)
        .then((value: number) => value + 8)
        .then((value: number) => value.toString())
      let val = await result
      expect(val).assertEqual("92")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest3100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_3100
     * @tc.desc   Verify PromiseLike.then with explicit PromiseLike return type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<number> = Promise.resolve<number>(42)
      let result: PromiseLike<string> = promise.then((value: number) => value.toString())
      let val = await result
      expect(val).assertEqual("42")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest3200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_3200
     * @tc.desc   Verify PromiseLike.then onRejected returns number type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.reject<string>(new Error("failed"))
      let result = promise.then(
        (value: string) => value,
        (error: Error): number => { expect(error instanceof Error).assertTrue(); return 42 }
      )
      let val = await result
      expect(val).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest3300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_3300
     * @tc.desc   Verify PromiseLike.then returning Promise unwraps to number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = promise.then((value: string) => {
        return Promise.resolve<number>(42)
      })
      let val = await result
      expect(val).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest3400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_3400
     * @tc.desc   Verify PromiseLike.then returning empty object from resolved Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = promise.then<Record<string, Object>>((_value: string) => {
        let obj: Record<string, Object> = {}
        return obj
      })
      let val = await result
      expect((val instanceof Object)).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest3500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_3500
     * @tc.desc   Verify PromiseLike.then returning empty array from resolved Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = promise.then<number[]>((_value: string) => {
        let arr: number[] = []
        return arr
      })
      let val = await result
      expect(Array.isArray(val)).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest3600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_3600
     * @tc.desc   Verify PromiseLike.then returning number 0 from resolved Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = promise.then((_value: string) => 0)
      let val = await result
      expect(val).assertEqual(0)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest3700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_3700
     * @tc.desc   Verify PromiseLike.then returning boolean false from resolved Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = promise.then((_value: string) => false)
      let val = await result
      expect(val).assertFalse()
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest3800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_3800
     * @tc.desc   Verify PromiseLike.then returning empty string from number Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<number> = Promise.resolve<number>(42)
      let result = promise.then((_value: number) => "")
      let val = await result
      expect(val).assertEqual("")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest3900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_3900
     * @tc.desc   then maps string value to uppercase result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseLikeThenFirstTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = promise.then((value: string) => value.toUpperCase())
      let val = await result
      expect(val).assertEqual("HELLO")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest4000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_4000
     * @tc.desc   Verify PromiseLike.then returning nested Promise unwraps deeply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = promise.then((value: string) => {
        return Promise.resolve<number>(Promise.resolve<number>(42))
      })
      let val = await result
      expect(val).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest4100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_4100
     * @tc.desc   Verify PromiseLike.then returning Number.MAX_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = promise.then((_value: string) => Number.MAX_VALUE)
      let val = await result
      expect(val).assertEqual(Number.MAX_VALUE)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest4200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_4200
     * @tc.desc   Verify PromiseLike.then returning Number.MIN_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = promise.then((_value: string) => Number.MIN_VALUE)
      let val = await result
      expect(val).assertEqual(Number.MIN_VALUE)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest4300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_4300
     * @tc.desc   Verify PromiseLike.then with Promise.all for multiple transformations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<number> = Promise.resolve<number>(42)
      let result1 = promise.then((value: number) => value * 2)
      let result2 = promise.then((value: number) => value * 3)
      let result3 = promise.then((value: number) => value * 4)
      let vals = await Promise.all([result1, result2, result3])
      expect(vals[0]).assertEqual(84)
      expect(vals[1]).assertEqual(126)
      expect(vals[2]).assertEqual(168)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest4400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_4400
     * @tc.desc   onRejected returns recovery value for Error rejection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseLikeThenFirstTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let error = new Error("Standard error")
      let promise: PromiseLike<string> = Promise.reject<string>(error)
      let result = promise.then(
        (value: string) => value,
        () => {
          return "recovered"
        }
      )
      let val = await result
      expect(val).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest4500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_4500
     * @tc.desc   Verify PromiseLike.then with CustomError code property check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let error = new CustomError("Custom error", 500)
      let promise: PromiseLike<string> = Promise.reject<string>(error)
      let result = promise.then(
        (value: string) => value,
        (error: Error) => {
          expect(error instanceof CustomError).assertTrue()
          if (error instanceof CustomError) {
            expect(error.errorCode).assertEqual(500)
          }
          return "recovered"
        }
      )
      let val = await result
      expect(val).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest4600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_4600
     * @tc.desc   onRejected returns recovery value for named error input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let error = new Error("Test error")
      error.name = "TestError"
      let promise: PromiseLike<string> = Promise.reject<string>(error)
      let result = promise.then(
        (value: string) => value,
        (error: Error) => {
          expect(error instanceof Error).assertTrue()
          return "recovered"
        }
      )
      let val = await result
      expect(val).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest4700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_4700
     * @tc.desc   onRejected returns recovery value for detailed message input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let error = new Error("Detailed error message")
      let promise: PromiseLike<string> = Promise.reject<string>(error)
      let result = promise.then(
        (value: string) => value,
        (error: Error) => {
          expect(error instanceof Error).assertTrue()
          return "recovered"
        }
      )
      let val = await result
      expect(val).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest4800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_4800
     * @tc.desc   onRejected returns recovery value for stack-test error input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let error = new Error("Stack trace test")
      let promise: PromiseLike<string> = Promise.reject<string>(error)
      let result = promise.then(
        (value: string) => value,
        (error: Error) => {
          expect(error instanceof Error).assertTrue()
          return "recovered"
        }
      )
      let val = await result
      expect(val).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest4900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_4900
     * @tc.desc   onFulfilled throwing Error rejects and is caught
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = promise.then((value: string) => {
        throw new Error("Thrown from onFulfilled")
      })
      let caught: boolean = false
      try {
        await result
        expect().assertFail()
      } catch (error) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest5000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_5000
     * @tc.desc   Verify PromiseLike.then onRejected throwing new Error replaces original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.reject<string>(new Error("First error"))
      let result = promise.then(
        (value: string) => value,
        (error: Error) => {
          expect(error instanceof Error).assertTrue()
          throw new Error("Thrown from onRejected")
        }
      )
      let caught: boolean = false
      try {
        await result
        expect().assertFail()
      } catch (error) {
        caught = true
        expect(error instanceof Error).assertTrue()
        expect(error.message).assertEqual("Thrown from onRejected")
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest5100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_5100
     * @tc.desc   onFulfilled throwing ValidationError rejects and is caught
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {

      let promise: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = promise.then((value: string) => {
        throw new ValidationError("Invalid value")
      })
      let caught: boolean = false
      try {
        await result
        expect().assertFail()
      } catch (error) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest5200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_5200
     * @tc.desc   Verify PromiseLike.then with try-catch in onFulfilled catches error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = promise.then((value: string) => {
        try {
          return value.toUpperCase()
        } catch (_e) {
          return "error"
        }
      })
      let val = await result
      expect(val).assertEqual("HELLO")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest5300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_5300
     * @tc.desc   Verify PromiseLike.then with try-catch in onFulfilled catches thrown error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = promise.then((_value: string) => {
        try {
          throw new Error("Try block error")
        } catch (_e) {
          return "caught"
        }
      })
      let val = await result
      expect(val).assertEqual("caught")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest5400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_5400
     * @tc.desc   Verify PromiseLike.then with try-finally in onFulfilled executes finally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let finallyExecuted = false
      let promise: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = promise.then((value: string) => {
        try {
          return value.toUpperCase()
        } finally {
          finallyExecuted = true
        }
      })
      let val = await result
      expect(val).assertEqual("HELLO")
      expect(finallyExecuted).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest5500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_5500
     * @tc.desc   Verify PromiseLike.then onRejected with try-catch recovers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.reject<string>(new Error("failed"))
      let result = promise.then(
        (value: string) => value,
        (_error: Error) => {
          try {
            return "recovered"
          } catch (_e) {
            return "error"
          }
        }
      )
      let val = await result
      expect(val).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest5600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_5600
     * @tc.desc   Verify PromiseLike.then onRejected with try-catch catches thrown error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.reject<string>(new Error("failed"))
      let result = promise.then(
        (value: string) => value,
        (_error: Error) => {
          try {
            throw new Error("New error")
          } catch (_e) {
            return "caught"
          }
        }
      )
      let val = await result
      expect(val).assertEqual("caught")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest5700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_5700
     * @tc.desc   Verify PromiseLike.then onRejected with try-finally executes finally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let finallyExecuted = false
      let promise: PromiseLike<string> = Promise.reject<string>(new Error("failed"))
      let result = promise.then(
        (value: string) => value,
        (_error: Error) => {
          try {
            return "recovered"
          } finally {
            finallyExecuted = true
          }
        }
      )
      let val = await result
      expect(val).assertEqual("recovered")
      expect(finallyExecuted).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest5800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_5800
     * @tc.desc   Verify PromiseLike.then with try-catch verifies caught Error instanceof
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = promise.then((_value: string) => {
        try {
          throw new Error("Test error")
        } catch (error) {
          expect(error instanceof Error).assertTrue()
          return "caught"
        }
      })
      let val = await result
      expect(val).assertEqual("caught")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest5900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_5900
     * @tc.desc   Verify PromiseLike.then onFulfilled throwing uncaught Error rejects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = promise.then((value: string) => {
        throw new Error("Uncaught error")
      })
      let caught: boolean = false
      try {
        await result
        expect().assertFail()
      } catch (error) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest6000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_6000
     * @tc.desc   Verify PromiseLike.then onRejected throwing uncaught Error rejects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.reject<string>(new Error("First error"))
      let result = promise.then(
        (value: string) => value,
        (error: Error) => {
          expect(error instanceof Error).assertTrue()
          throw new Error("Uncaught from onRejected")
        }
      )
      let caught: boolean = false
      try {
        await result
        expect().assertFail()
      } catch (error) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest6100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_6100
     * @tc.desc   Verify PromiseLike.then transforms number to string via toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<number> = Promise.resolve<number>(42)
      let result = promise.then((value: number) => value.toString())
      let val = await result
      expect(val).assertEqual("42")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest6200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_6200
     * @tc.desc   Verify PromiseLike.then with toUpperCase on resolved string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = promise.then((value: string) => value.toUpperCase())
      let val = await result
      expect(val).assertEqual("HELLO")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest6300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_6300
     * @tc.desc   Verify PromiseLike.then with explicit PromiseLike number return type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.resolve<string>("hello")
      let result: PromiseLike<number> = promise.then((value: string) => 42.0)
      let val = await result
      expect(val).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest6400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_6400
     * @tc.desc   Verify PromiseLike.then returning Result interface with value property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {

      let promise: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = promise.then<Result>((value: string): Result => {
        let r: Result = { value: value.length }
        return r
      })
      let val = await result
      expect(val.value).assertEqual(5)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenFirstTest6500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_FIRST_TEST_6500
     * @tc.desc   Verify PromiseLike.then returning number array from string Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenFirstTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<string> = Promise.resolve<string>("hello")
      let result: PromiseLike<number[]> = promise.then<number[]>((_value: string) => {
        return [1.0, 2.0, 3.0]
      })
      let val = await result
      expect(val.length).assertEqual(3)
      Done();
    })

  })
}
