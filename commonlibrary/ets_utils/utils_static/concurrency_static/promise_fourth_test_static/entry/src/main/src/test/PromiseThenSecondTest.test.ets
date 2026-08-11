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

interface Data { id: number; name: string }
interface User { id: number; name: string; email: string }
interface ThenObj { then: string }
interface Data2 { id: number; name: string | null }
interface Data3 { id: number; name?: string }

class ValidationError extends Error {
  constructor(message: string) {
    super(message)
    this.name = "ValidationError"
  }
}
class CustomError extends Error {
  constructor(message: string) {
    super(message)
    this.name = "CustomError"
  }
}
class CustomPromiseLike implements PromiseLike<number> {
  value: number
  constructor(value: number) {
    this.value = value
  }
  then<U, E>(onFulfilled: ((value: number) => U | PromiseLike<U>), onRejected: ((reason: Error) => E | PromiseLike<E>) | undefined): PromiseLike<Awaited<U> | Awaited<E>> {
    if (onFulfilled) {
      let result = onFulfilled(this.value)
      return result as PromiseLike<Awaited<U> | Awaited<E>>
    }
    return Promise.resolve(this.value) as PromiseLike<Awaited<U> | Awaited<E>>
  }
}

export default function BuiltinsPromiseThenSecondTest(): void  {
  describe('BuiltinsPromiseThenSecondTest', (): void => {
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
     * @tc.name   PromiseThenSecondTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_0100
     * @tc.desc   Verify Promise.then with undefined passes through resolved value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenSecondTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then(undefined)
      expect(result).assertEqual("hello")
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_0200
     * @tc.desc   Verify Promise.then with explicit generic returning number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenSecondTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<number>(() => 42)
      expect(result).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_0300
     * @tc.desc   Verify Promise.then with explicit generic returning string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenSecondTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<string>(() => "world")
      expect(result).assertEqual("world")
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_0400
     * @tc.desc   Verify Promise.then with explicit generic returning boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenSecondTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<boolean>(() => true)
      expect(result).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_0500
     * @tc.desc   Verify Promise.then with explicit generic returning null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenSecondTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<null>(() => null)
      expect(result).assertNull()
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_0600
     * @tc.desc   Verify Promise.then with explicit generic returning void with return
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenSecondTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<void>(() => { return })
      expect(result).assertUndefined()
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_0700
     * @tc.desc   Verify Promise.then with explicit generic returning void with empty body
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenSecondTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<void>(() => { })
      expect(result).assertUndefined()
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_0800
     * @tc.desc   Verify Promise.then with explicit generic returning interface type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenSecondTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {

      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<Data>(() => {
        let obj: Data = { id: 1, name: "test" }
        return obj
      })
      expect(result.id).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_0900
     * @tc.desc   Verify Promise.then with explicit generic returning interface with null field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenSecondTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {

      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<Data2>(() => {
        let obj: Data2 = { id: 1, name: null }
        return obj
      })
      expect(result.id).assertEqual(1)
      expect(result.name).assertNull()
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_1000
     * @tc.desc   Verify Promise.then with explicit generic returning interface with optional field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenSecondTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {

      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<Data3>(() => {
        let obj: Data3 = { id: 1 }
        return obj
      })
      expect(result.id).assertEqual(1)
      expect(result.name).assertUndefined()
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_1100
     * @tc.desc   Verify Promise.then with explicit generic returning empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenSecondTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<number[]>(() => [])
      expect(result.length).assertEqual(0)
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_1200
     * @tc.desc   Verify Promise.then with explicit generic returning single-element array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenSecondTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<number[]>(() => [42])
      expect(result.length).assertEqual(1)
      expect(result[0]).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_1300
     * @tc.desc   Verify Promise.then with explicit generic returning multi-element array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenSecondTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<number[]>(() => [1, 2, 3])
      expect(result.length).assertEqual(3)
      expect(result[0]).assertEqual(1)
      expect(result[1]).assertEqual(2)
      expect(result[2]).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_1400
     * @tc.desc   Verify Promise.then with explicit generic returning array with null elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenSecondTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<(number | null)[]>(() => [1, null, 3])
      expect(result[0]).assertEqual(1)
      expect(result[1]).assertNull()
      expect(result[2]).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_1500
     * @tc.desc   Verify Promise.then with explicit generic returning union type number or string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenSecondTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result1 = await promise.then<number | string>(() => 42)
      expect(result1).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_1600
     * @tc.desc   Verify Promise.then with explicit generic returning union type number or null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenSecondTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<number | null>(() => null)
      expect(result).assertNull()
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_1700
     * @tc.desc   Verify Promise.then with explicit generic returning union type string or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenSecondTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<string | undefined>(() => undefined)
      expect(result).assertUndefined()
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_1800
     * @tc.desc   Verify Promise.then with explicit generic returning union type number string or null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenSecondTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<number | string | null>(() => null)
      expect(result).assertNull()
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_1900
     * @tc.desc   Verify Promise.then returning resolved Promise unwraps value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenSecondTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<number>(() => Promise.resolve(42.0))
      expect(result).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_2000
     * @tc.desc   Verify Promise.then returning rejected Promise propagates error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenSecondTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let expectedError = new Error("test error")
      try {
        await promise.then<number>(() => Promise.reject(expectedError))
        expect().assertFail()
      } catch (error) {
        expect(error === expectedError).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_2100
     * @tc.desc   Verify Promise.then returning new Promise with setTimeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenSecondTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<number>(() => {
        return new Promise<number>((resolve) => {
          setTimeout(() => resolve(42), 500)
        })
      })
      expect(result).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_2200
     * @tc.desc   Verify Promise.then returning PromiseLike object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenSecondTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {

      let promise = Promise.resolve<string>("hello")
      let like = new CustomPromiseLike(42)
      let result = await promise.then<number>(() => like)
      expect(result).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_2300
     * @tc.desc   Verify Promise.then throwing error in callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenSecondTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let expectedError = new Error("callback error")
      try {
        await promise.then<number>(() => {
          throw expectedError
        })
        expect().assertFail()
      } catch (error) {
        expect(error === expectedError).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_2400
     * @tc.desc   Verify Promise.then throwing CustomError in callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenSecondTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {

      let promise = Promise.resolve<string>("hello")
      let expectedError = new CustomError("custom error")
      let caught: boolean = false
      try {
        await promise.then<number>(() => {
          throw expectedError
        })
        expect().assertFail()
      } catch (error) {
        caught = true
        expect(error === expectedError).assertTrue()
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_2500
     * @tc.desc   Verify Promise.then returning object with then property not thenable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenSecondTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")

      let result = await promise.then<ThenObj>(() => {
        let obj: ThenObj = { then: "not a function" }
        return obj
      })
      expect(result.then).assertEqual("not a function")
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_2600
     * @tc.desc   Verify Promise.then returns Promise instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenSecondTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let newPromise = promise.then<number>(() => 42)
      expect(newPromise === promise).assertFalse()
      expect(await newPromise).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_2700
     * @tc.desc   Verify Promise.then returning Promise unwraps to value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenSecondTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result: number = await promise.then<number>(() => Promise.resolve(42.0))
      expect(result).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest2800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_2800
     * @tc.desc   Verify Promise.then returning nested Promise unwraps deeply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenSecondTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result: number = await promise.then<number>(() => {
        return Promise.resolve(42.0)
      })
      expect(result).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest2900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_2900
     * @tc.desc   Verify Promise.then chaining with type transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenSecondTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise
        .then<number>((value: string) => { expect(value).assertEqual("hello"); return 1 })
        .then<number>((v) => { expect(v).assertEqual(1); return v + 10 })
        .then<number>((v) => { expect(v).assertEqual(11); return v * 2 })
      expect(result).assertEqual(22)
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest3000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_3000
     * @tc.desc   Verify Promise.then with catch in chain when no error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenSecondTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let catchCalled = false
      let result = await promise
        .then<number>(() => 42)
        .catch((error) => { catchCalled = true; return 0 })
      expect(result).assertEqual(42)
      expect(catchCalled).assertFalse()
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest3100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_3100
     * @tc.desc   Verify Promise.then with finally in chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenSecondTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let executed = false
      let result = await promise
        .then<number>(() => 42)
        .finally(() => { executed = true })
      expect(result).assertEqual(42)
      expect(executed).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest3200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_3200
     * @tc.desc   Verify Promise.then returning undefined explicitly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenSecondTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<void>(() => undefined)
      expect(result).assertUndefined()
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest3300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_3300
     * @tc.desc   Verify Promise.then returning an empty record
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenSecondTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<Record<string, string>>(() => {
        let obj: Record<string, string> = {}
        return obj
      })
      expect(Object.keys(result).length).assertEqual(0)
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest3400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_3400
     * @tc.desc   Verify Promise.then returning zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenSecondTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<number>(() => 0)
      expect(result).assertEqual(0)
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest3500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_3500
     * @tc.desc   Verify Promise.then returning false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenSecondTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<boolean>(() => false)
      expect(result).assertFalse()
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest3600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_3600
     * @tc.desc   Verify Promise.then returning empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenSecondTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<string>(() => "")
      expect(result).assertEqual("")
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest3700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_3700
     * @tc.desc   Verify Promise.then with inferred return type string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenSecondTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then(() => "world")
      expect(result).assertEqual("world")
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest3800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_3800
     * @tc.desc   Verify Promise.then returning Array type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenSecondTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<Array<number>>(() => [1, 2, 3])
      expect(result.length).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest3900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_3900
     * @tc.desc   Verify Promise.then returning numeric array values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenSecondTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<Array<number>>(() => [1, 2, 3])
       expect(result).assertDeepEquals([1.0, 2.0, 3.0])
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest4000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_4000
     * @tc.desc   Verify Promise.then returning number with typeof check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenSecondTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<number>(() => 42)
       expect(typeof result).assertEqual("number")
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest4100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_4100
     * @tc.desc   Verify Promise.then returning interface with multiple fields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenSecondTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<User>(() => {
        let obj: User = { id: 1, name: "test", email: "test@example.com" }
        return obj
      })
      expect(result.id).assertEqual(1)
      expect(result.email).assertEqual("test@example.com")
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest4200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_4200
     * @tc.desc   Verify Promise.then returning Number.MAX_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenSecondTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<number>(() => Number.MAX_VALUE)
      expect(result).assertEqual(Number.MAX_VALUE)
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest4300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_4300
     * @tc.desc   Verify Promise.then returning Number.MIN_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenSecondTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<number>(() => Number.MIN_VALUE)
      expect(result).assertEqual(Number.MIN_VALUE)
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest4400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_4400
     * @tc.desc   Verify Promise.then returning negative Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenSecondTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<number>(() => -Infinity)
      expect(result).assertEqual(-Infinity)
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest4500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_4500
     * @tc.desc   Verify Promise.then returning Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenSecondTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<number>(() => Infinity)
      expect(result).assertEqual(Infinity)
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest4600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_4600
     * @tc.desc   Verify Promise.then returning NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenSecondTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<number>(() => NaN)
      expect(Number.isNaN(result)).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest4700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_4700
     * @tc.desc   Verify Promise.then returning long string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenSecondTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let longStr = "a".repeat(10000)
      let result = await promise.then<string>(() => longStr)
      expect(result.length).assertEqual(10000)
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest4800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_4800
     * @tc.desc   Verify Promise.then returning Unicode string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenSecondTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<string>(() => "你好世界🌍💖")
      expect(result).assertEqual("你好世界🌍💖")
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest4900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_4900
     * @tc.desc   Verify Promise.then returning string with zero-width space
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenSecondTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<string>(() => "hello\u200Bworld")
      expect(result).assertEqual("hello\u200Bworld")
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest5000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_5000
     * @tc.desc   Verify Promise.then returning HTML-like string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenSecondTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<string>(() => "<script>alert(1)</script>")
      expect(result).assertEqual("<script>alert(1)</script>")
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest5100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_5100
     * @tc.desc   Verify Promise.then onFulfilled is not called for rejected Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenSecondTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let expectedError = new Error("original error")
      let promise = Promise.reject<string>(expectedError)
      let called = false
      try {
        await promise.then<void>(() => {
          called = true
        })
        expect().assertFail()
      } catch (error) {
        expect(called).assertFalse()
        expect(error === expectedError).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest5200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_5200
     * @tc.desc   Verify Promise.then with catch in chain for rejection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenSecondTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let expectedError = new Error("original error")
      let promise = Promise.reject<string>(expectedError)
      let recovered = await promise
        .then<string>((value: string) => value)
        .catch<string>((error: Error) => {
          expect(error === expectedError).assertTrue()
          return "recovered"
        })
      expect(recovered).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest5300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_5300
     * @tc.desc   Verify Promise.then rejection propagates through multiple then
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenSecondTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let expectedError = new Error("original error")
      let promise = Promise.reject<string>(expectedError)
      try {
        await promise
          .then<void>(() => { })
          .then<void>(() => { })
          .then<void>(() => { })
        expect().assertFail()
      } catch (error) {
        expect(error === expectedError).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest5400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_5400
     * @tc.desc   Verify Promise.then throwing standard Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenSecondTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let expectedError = new Error("standard error")
      try {
        await promise.then<number>(() => {
          throw expectedError
        })
        expect().assertFail()
      } catch (error) {
        expect(error === expectedError).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest5500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_5500
     * @tc.desc   Verify Promise.then throwing ValidationError custom error class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenSecondTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {

      let promise = Promise.resolve<string>("hello")
      let expectedError = new ValidationError("validation failed")
      try {
        await promise.then<number>(() => {
          throw expectedError
        })
        expect().assertFail()
      } catch (error) {
        expect(error === expectedError).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest5600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_5600
     * @tc.desc   Verify Promise.then throwing RangeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenSecondTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let expectedError = new RangeError("out of range")
      try {
        await promise.then<number>(() => {
          throw expectedError
        })
        expect().assertFail()
      } catch (error) {
        expect(error === expectedError).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest5700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_5700
     * @tc.desc   Verify Promise.then throwing TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenSecondTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let expectedError = new TypeError("type error")
      try {
        await promise.then<number>(() => {
          throw expectedError
        })
        expect().assertFail()
      } catch (error) {
        expect(error === expectedError).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseThenSecondTest5800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_SECOND_TEST_5800
     * @tc.desc   Verify Promise.then returning rejected Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenSecondTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let expectedError = new Error("rejected")
      try {
        await promise.then<number>(() => Promise.reject(expectedError))
        expect().assertFail()
      } catch (error) {
        expect(error === expectedError).assertTrue()
      }
      Done();
    })
  })
}
