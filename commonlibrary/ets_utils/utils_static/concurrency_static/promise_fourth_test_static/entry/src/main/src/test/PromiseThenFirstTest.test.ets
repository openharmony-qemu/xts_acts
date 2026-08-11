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

export default function BuiltinsPromiseThenFirstTest(): void {
  describe('BuiltinsPromiseThenFirstTest', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {

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
     * @tc.name   PromiseThenFirstTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_0100
     * @tc.desc   Verify Promise.then with string concatenation in onFulfilled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFirstTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = promise.then((value: string) => {
        return value + " world"
      })
      let val = await result
      expect(val).assertEqual("hello world")
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_0200
     * @tc.desc   Verify Promise.then with both onFulfilled and onRejected callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFirstTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let rejectedCalled = false
      let result = promise.then<string, string>(
        (value: string) => { return value + " processed" },
        (error: Error) => { rejectedCalled = true; return "fallback" }
      )
      let val = await result
      expect(val).assertEqual("hello processed")
      expect(rejectedCalled).assertFalse()
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_0300
     * @tc.desc   Verify Promise.then with undefined onRejected propagates rejection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFirstTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let expectedError = new Error("failed")
      let promise = Promise.reject<string>(expectedError)
      let result = promise.then(
        (value: string) => { return value },
        undefined
      )
      try {
        await result
        expect().assertFail()
      } catch (error) {
        expect(error === expectedError).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_0400
     * @tc.desc   Verify Promise.then with arrow function onFulfilled returning string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFirstTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = promise.then((value: string) => value + " processed")
      let val = await result
      expect(val).assertEqual("hello processed")
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_0500
     * @tc.desc   Verify Promise.then with named function handler as onFulfilled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFirstTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let handler: (value: string) => string = (value: string): string => {
        return value + " processed";
      };
      let result = promise.then(handler)
      let val = await result
      expect(val).assertEqual("hello processed")
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_0600
     * @tc.desc   Verify Promise.then with number multiplication in onFulfilled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFirstTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<number>(42)
      let result = promise.then((value: number) => value * 2)
      let val = await result
      expect(val).assertEqual(84)
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_0700
     * @tc.desc   Verify Promise.then returning resolved Promise unwraps value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFirstTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<number>(42)
      let result = promise.then((value: number) => {
        return Promise.resolve<number>(value * 2)
      })
      let val = await result
      expect(val).assertEqual(84)
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_0800
     * @tc.desc   Verify Promise.then callback receives correct value type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFirstTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let checkType = false
      await promise.then((value: string) => {
        checkType = typeof value === "string"
      })
      expect(checkType).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_0900
     * @tc.desc   Verify Promise.then with null type value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFirstTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<null>(null)
      let val = await promise.then((value: null) => {
        expect(value).assertNull()
        return value
      })
      expect(val).assertNull()
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_1000
     * @tc.desc   Verify Promise.then with undefined type value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFirstTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<void>(undefined)
      let val = await promise.then((value: void) => {
        expect(value).assertUndefined()
        return value
      })
      expect(val).assertUndefined()
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_1100
     * @tc.desc   Verify Promise.then with union type value in callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFirstTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string | number>("hello")
      let result = await promise.then((value: string | number): string => {
        if (typeof value === "string") {
          return value
        }
        return value.toString()
      })
      expect(result).assertEqual("hello")
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_1200
     * @tc.desc   Verify Promise.then throwing error in onFulfilled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFirstTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let expectedError = new Error("handler error")
      let result = promise.then((value: string) => {
        throw expectedError
      })
      let caught: boolean = false
      try {
        await result
        expect().assertFail()
      } catch (error) {
        caught = true
        expect(error === expectedError).assertTrue()
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_1300
     * @tc.desc   Verify Promise.then onRejected receives Error instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFirstTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let expectedError = new Error("standard error")
      let promise = Promise.reject<string>(expectedError)
      let result = promise
        .then<string>((value: string) => value)
        .catch<string>((error: Error) => {
          expect(error === expectedError).assertTrue()
          return "recovered"
        })
      let val = await result
      expect(val).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_1400
     * @tc.desc   Verify Promise.then onRejected catches Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFirstTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let expectedError = new Error("custom error")
      let promise = Promise.reject<string>(expectedError)
      let result = promise
        .then<string>((value: string) => value)
        .catch<string>((error: Error) => {
          expect(error === expectedError).assertTrue()
          return "recovered"
        })
      let val = await result
      expect(val).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_1500
     * @tc.desc   Verify Promise.then onRejected returns recovery value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFirstTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let expectedError = new Error("failed")
      let promise = Promise.reject<string>(expectedError)
      let result = promise
        .then<string>((value: string) => value)
        .catch<string>((error: Error) => {
          expect(error === expectedError).assertTrue()
          return "recovered"
        })
      let val = await result
      expect(val).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_1600
     * @tc.desc   Verify Promise.then without onRejected propagates rejection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFirstTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let expectedError = new Error("failed")
      let promise = Promise.reject<string>(expectedError)
      let result = promise.then((value: string) => value)
      try {
        await result
        expect().assertFail()
      } catch (error) {
        expect(error === expectedError).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_1700
     * @tc.desc   Verify Promise.then returns a new Promise instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFirstTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<string>("hello")
      let promise2 = promise1.then((value: string) => value + " world")
      expect(promise1 === promise2).assertFalse()
      expect(await promise2).assertEqual("hello world")
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_1800
     * @tc.desc   Verify Promise.then returning resolved Promise with string value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFirstTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = promise.then((value: string) => {
        return Promise.resolve<string>(value)
      })
      let val = await result
      expect(val).assertEqual("hello")
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_1900
     * @tc.desc   Verify Promise.then transforms string to number via length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFirstTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = promise.then((value: string) => value.length)
      let val = await result
      expect(val).assertEqual(5)
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_2000
     * @tc.desc   Verify Promise.then returning new Promise with setTimeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFirstTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<number>(1)
      let result = promise.then((value: number) => {
        return new Promise<number>((resolve) => {
          setTimeout(() => resolve(value + 1), 100)
        })
      })
      let val = await result
      expect(val).assertEqual(2)
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_2100
     * @tc.desc   Verify Promise.then callback returning null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFirstTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = promise.then((value: string) => null)
      let val = await result
      expect(val).assertNull()
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_2200
     * @tc.desc   Verify Promise.then callback returning undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFirstTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = promise.then((value: string) => undefined)
      let val = await result
      expect(val).assertUndefined()
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_2300
     * @tc.desc   Verify Promise.then with explicit generic type changing return type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFirstTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result: Promise<string | number> = promise.then<string | number>(
        (value: string) => value.length
      )
      let val = await result
       expect(val).assertEqual(5)
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_2400
     * @tc.desc   Verify Promise.then callback with empty return statement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFirstTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = promise.then((value: string) => {
        return
      })
      let val = await result
      expect(val).assertUndefined()
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_2500
     * @tc.desc   Verify Promise.then with typed Promise variable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFirstTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise: Promise<string> = Promise.resolve("hello")
      let result = promise.then((value: string) => value)
      let val = await result
      expect(val).assertEqual("hello")
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_2600
     * @tc.desc   Verify Promise.then with two generic type parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFirstTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<number>(42.0)
      let catchCalled = false
      let result = promise
        .then<string>((value: number) => value.toString())
        .catch<string>((error: Error) => { catchCalled = true; return "-1" })
      let val = await result
      expect(val).assertEqual("42")
      expect(catchCalled).assertFalse()
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_2700
     * @tc.desc   Verify Promise.then throwing error with different message in onFulfilled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFirstTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let expectedError = new Error("handler failed")
      let result = promise.then((value: string) => {
        throw expectedError
      })
      try {
        await result
        expect().assertFail()
      } catch (error) {
        expect(error === expectedError).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest2800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_2800
     * @tc.desc   Verify Promise.then onRejected throwing transformed error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFirstTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let originalError = new Error("original")
      let transformedError = new Error("transformed")
      let promise = Promise.reject<string>(originalError)
      let result = promise
        .then<string>((value: string) => value)
        .catch<string>((error: Error) => {
          expect(error === originalError).assertTrue()
          throw transformedError
        })
      try {
        await result
        expect().assertFail()
      } catch (error) {
        expect(error === transformedError).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest2900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_2900
     * @tc.desc   Verify Promise.then returning rejected Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFirstTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let expectedError = new Error("nested reject")
      let result = promise.then((value: string) => {
        return Promise.reject<string>(expectedError)
      })
      try {
        await result
        expect().assertFail()
      } catch (error) {
        expect(error === expectedError).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest3000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_3000
     * @tc.desc   Verify Promise.then error does not affect original Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFirstTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<string>("hello")
      let expectedError = new Error("error")
      let promise2 = promise1.then((value: string) => {
        throw expectedError
      })
      let val1 = await promise1
      expect(val1).assertEqual("hello")
      try {
        await promise2
        expect().assertFail()
      } catch (error) {
        expect(error === expectedError).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest3100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_3100
     * @tc.desc   Verify Promise.then callback executes asynchronously
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFirstTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let order: string[] = []
      let completion = promise.then<void>((value: string) => {
        expect(value).assertEqual("hello")
        order.push("then")
      })
      order.push("sync")
      await completion
      expect(order[0]).assertEqual("sync")
      expect(order[1]).assertEqual("then")
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest3200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_3200
     * @tc.desc   Verify Promise.then multiple handlers on same Promise execute in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFirstTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let order: string[] = []
      let first = promise.then<void>((value: string) => { expect(value).assertEqual("hello"); order.push("first") })
      let second = promise.then<void>((value: string) => { expect(value).assertEqual("hello"); order.push("second") })
      let third = promise.then<void>((value: string) => { expect(value).assertEqual("hello"); order.push("third") })
      await Promise.all<void>([first, second, third])
      expect(order[0]).assertEqual("first")
      expect(order[1]).assertEqual("second")
      expect(order[2]).assertEqual("third")
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest3300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_3300
     * @tc.desc   Verify Promise.then chaining with type transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFirstTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve<number>(1)
        .then((value: number) => { expect(value).assertEqual(1); return value + 1 })
        .then((value: number) => { expect(value).assertEqual(2); return value * 2 })
        .then((value: number) => { expect(value).assertEqual(4); return value.toString() })
      expect(result).assertEqual("4")
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest3400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_3400
     * @tc.desc   Verify Promise.then error propagation through chain with catch recovery
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFirstTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let expectedError = new Error("failed at step 2")
      let result = await Promise.resolve<number>(1.0)
        .then<number>((value: number) => {
          expect(value).assertEqual(1)
          throw expectedError
        })
        .catch<string>((error: Error) => {
          expect(error === expectedError).assertTrue()
          return "recovered"
        })
      expect(result).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest3500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_3500
     * @tc.desc   Verify Promise.then simple string transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFirstTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve<string>("hello")
        .then((value: string) => value + " world")
      expect(result).assertEqual("hello world")
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest3600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_3600
     * @tc.desc   Verify Promise.then with async callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFirstTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = promise.then<string>(async (value: string) => {
        await new Promise<string>((resolve: (value: string) => void) => { setTimeout(() => resolve("done"), 100) })
        return value + " async"
      })
      let val = await result
      expect(val).assertEqual("hello async")
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest3700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_3700
     * @tc.desc   Verify Promise.then with Promise.all concurrent execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFirstTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = 0
      let promises = [
        Promise.resolve<number>(1).then((v) => { counter += v }),
        Promise.resolve<number>(2).then((v) => { counter += v }),
        Promise.resolve<number>(3).then((v) => { counter += v })
      ]
      await Promise.all(promises)
      expect(counter).assertEqual(6)
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest3800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_3800
     * @tc.desc   Verify Promise.then callbacks accumulate shared counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFirstTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = 0
      let promises = [
        Promise.resolve<number>(1.0).then<void>((v: number) => {
          counter += v
        }),
        Promise.resolve<number>(2.0).then<void>((v: number) => {
          counter += v
        })
      ]
      await Promise.all(promises)
      expect(counter).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest3900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_3900
     * @tc.desc   Verify Promise.then with nested Promise chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFirstTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve<number>(1)
        .then((v1: number) => {
          expect(v1).assertEqual(1)
          return Promise.resolve<number>(v1 + 1)
            .then((v2: number) => { expect(v2).assertEqual(2); return v2 * 2 })
        })
      expect(result).assertEqual(4)
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest4000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_4000
     * @tc.desc   Verify Promise.then with setTimeout and async processing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFirstTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let resultPromise = new Promise<string>((resolve) => {
        setTimeout(async() => {
          let data = await Promise.resolve<string>("timer data")
            .then((value: string) => { expect(value).assertEqual("timer data"); return value + " processed" })
          resolve(data)
        }, 500)
      })
      let result = await resultPromise
      expect(result).assertEqual("timer data processed")
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest4100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_4100
     * @tc.desc   Verify Promise.then with Promise.race for timing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFirstTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let winner: string = ""
      let promise1 = new Promise<string>((resolve: (value: string) => void) => {
        setTimeout(() => {
          Promise.resolve<string>("timer1").then<void>((v: string) => {
            winner = v
            resolve("done1")
          })
        }, 100)
      })
      let promise2 = new Promise<string>((resolve: (value: string) => void) => {
        setTimeout(() => {
          Promise.resolve<string>("timer2").then<void>((v: string) => {
            if (!winner) winner = v
            resolve("done2")
          })
        }, 200)
      })
      await Promise.race([promise1, promise2])
      expect(winner).assertEqual("timer1")
      await Promise.all([promise1, promise2])
      expect(winner).assertEqual("timer1")
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest4200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_4200
     * @tc.desc   Verify Promise.then chaining with async callbacks preserves order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFirstTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let order: number[] = []
      await Promise.resolve<void>(undefined)
        .then(async(res: void) => { expect(res).assertUndefined(); order.push(1) })
        .then(async(res: void) => { expect(res).assertUndefined(); order.push(2) })
        .then(async(res: void) => { expect(res).assertUndefined(); order.push(3) })
      expect(order[0]).assertEqual(1)
      expect(order[1]).assertEqual(2)
      expect(order[2]).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest4300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_4300
     * @tc.desc   Verify Promise.then with Promise.all and transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFirstTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let results = await Promise.all([
        Promise.resolve<number>(1).then((v) => { expect(v).assertEqual(1); return v * 10 }),
        Promise.resolve<number>(2).then((v) => { expect(v).assertEqual(2); return v * 10 }),
        Promise.resolve<number>(3).then((v) => { expect(v).assertEqual(3); return v * 10 })
      ])
      expect(results[0]).assertEqual(10)
      expect(results[1]).assertEqual(20)
      expect(results[2]).assertEqual(30)
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest4400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_4400
     * @tc.desc   Verify Promise.then with catch recovery in chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFirstTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let expectedError = new Error("failed")
      let step1 = await Promise.resolve<number>(1.0)
        .then<number>((v: number) => { expect(v).assertEqual(1); throw expectedError })
        .catch<number>((error: Error) => { expect(error === expectedError).assertTrue(); return 10.0 })
      let result = await Promise.resolve<number>(step1)
        .then<number>((v: number) => v + 5.0)
      expect(result).assertEqual(15)
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest4500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_4500
     * @tc.desc   Verify Promise.then with Promise.race
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFirstTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let fastPromise = new Promise<string>((resolve: (value: string) => void) => {
        setTimeout(() => resolve("fast"), 100)
      })
      let slowPromise = new Promise<string>((resolve: (value: string) => void) => {
        setTimeout(() => resolve("slow"), 200)
      })
      let result = await Promise.resolve<void>(undefined)
        .then<string>(() => {
          return Promise.race<string>([fastPromise, slowPromise])
        })
      expect(result).assertEqual("fast")
      let settled = await Promise.all<string>([fastPromise, slowPromise])
      expect(settled[0]).assertEqual("fast")
      expect(settled[1]).assertEqual("slow")
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest4600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_4600
     * @tc.desc   Verify Promise.then with Promise.race for timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFirstTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let resultPromise = new Promise<string>((resolve: (value: string) => void) => {
        setTimeout(() => resolve("slow result"), 1000)
      })
      let timeoutPromise = new Promise<string>((resolve: (value: string) => void) => {
        setTimeout(() => resolve("timeout"), 500)
      })
      let raceResult = await Promise.race<string>([
        resultPromise.then<string>((v: string) => v),
        timeoutPromise
      ])
      expect(raceResult).assertEqual("timeout")
      let settled = await Promise.all<string>([resultPromise, timeoutPromise])
      expect(settled[0]).assertEqual("slow result")
      expect(settled[1]).assertEqual("timeout")
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest4700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_4700
     * @tc.desc   Verify Promise.then callbacks increment shared counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFirstTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = 0
      let promises = [
        Promise.resolve(1.0).then<void>((v: number) => {
          counter++
        }),
        Promise.resolve(2.0).then<void>((v: number) => {
          counter++
        })
      ]
      await Promise.all(promises)
      expect(counter).assertEqual(2)
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest4800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_4800
     * @tc.desc   Verify Promise.then callbacks update shared data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFirstTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let data = ""
      let promises = [
        Promise.resolve<string>("a").then<void>((v: string) => {
          data = v
        }),
        Promise.resolve<string>("b").then<void>((v: string) => {
          data = v
        })
      ]
      await Promise.all(promises)
      expect(data).assertEqual("b")
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest4900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_4900
     * @tc.desc   Verify Promise.then callbacks set shared branch variable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFirstTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let branch = ""
      let p1 = Promise.resolve(1.0).then<void>(() => {
        branch = "first"
      })
      let p2 = Promise.resolve(2.0).then<void>(() => {
        if (!branch) branch = "second"
      })
      await Promise.all([p1, p2])
      expect(branch).assertEqual("first")
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest5000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_5000
     * @tc.desc   Verify Promise.race resolves with earlier timeout branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFirstTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let timeoutPromise = new Promise<string>((resolve: (value: string) => void) => {
        setTimeout(() => resolve("timeout"), 500)
      })
      let donePromise = new Promise<string>((resolve: (value: string) => void) => {
        setTimeout(() => resolve("done"), 2000)
      })
      let raceResult = await Promise.race<string>([timeoutPromise, donePromise])
      expect(raceResult).assertEqual("timeout")
      let settled = await Promise.all<string>([timeoutPromise, donePromise])
      expect(settled[0]).assertEqual("timeout")
      expect(settled[1]).assertEqual("done")
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest5100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_5100
     * @tc.desc   Verify Promise.then with nested Promise resolution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFirstTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve("a")
        .then((value: string) => {
          expect(value).assertEqual("a")
          return Promise.resolve("b")
            .then((v) => { expect(v).assertEqual("b"); return v.toUpperCase() })
        })
      expect(result).assertEqual("B")
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest5200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_5200
     * @tc.desc   Verify Promise.then with counter 3 iterations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFirstTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = 0
      let promises: Promise<void>[] = []
      for (let i = 0; i < 3; i++) {
        promises.push(Promise.resolve(i).then<void>(() => {
          counter++
        }))
      }
      await Promise.all(promises)
      expect(counter).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest5300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_5300
     * @tc.desc   Verify Promise.then with counter 5 iterations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFirstTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = 0
      let promises: Promise<void>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(Promise.resolve(i).then<void>(() => {
          counter++
        }))
      }
      await Promise.all(promises)
      expect(counter).assertEqual(5)
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest5400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_5400
     * @tc.desc   Verify Promise.then with counter 10 iterations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFirstTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = 0
      let promises: Promise<void>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(Promise.resolve(i).then<void>(() => {
          counter++
        }))
      }
      await Promise.all(promises)
      expect(counter).assertEqual(10)
      Done();
    })

    /**
     * @tc.name   PromiseThenFirstTest5500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FIRST_TEST_5500
     * @tc.desc   Verify Promise.then callbacks increment shared counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFirstTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let processedCount = 0
      let promises = [
        Promise.resolve<number>(1.0).then<void>(() => { processedCount++ }),
        Promise.resolve<number>(2.0).then<void>(() => { processedCount++ }),
        Promise.resolve<number>(3.0).then<void>(() => { processedCount++ })
      ]
      await Promise.all(promises)
      expect(processedCount).assertEqual(3)
      Done();
    })
  })
}
