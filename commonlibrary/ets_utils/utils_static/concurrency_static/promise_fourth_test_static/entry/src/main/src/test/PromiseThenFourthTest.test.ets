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

class CustomError extends Error {
  constructor(message: string) {
    super(message)
    this.name = "CustomError"
  }
}

class SharedData {
  count: number = 0
  async add(): Promise<void> {
    this.count++
  }
  async getValue(): Promise<number> {
    return this.count
  }
}

interface Data { id: number; name: string }
interface Nested { level1: NestedLevel1 }
interface NestedLevel1 { level2: NestedLevel2 }
interface NestedLevel2 { value: string }
interface Circular { value: number; self?: Circular }

export default function BuiltinsPromiseThenFourthTest(): void {
  describe('BuiltinsPromiseThenFourthTest', (): void => {
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
     * @tc.name   PromiseThenFourthTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_0100
     * @tc.desc   Verify Promise.then without arguments passes through resolved value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFourthTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<string>("hello")
      let promise2 = promise1.then()
      let result = await promise2
      expect(result).assertEqual("hello")
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_0200
     * @tc.desc   Verify Promise.then with undefined passes through resolved value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFourthTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<number>(42)
      let promise2 = promise1.then(undefined)
      let result = await promise2
      expect(result).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_0300
     * @tc.desc   Verify Promise.then with null throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<string>("hello")
      let caught: boolean = false
      try {
        let promise2 = promise1.then(null as undefined)
        await promise2
        expect().assertFail()
      } catch (error) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_0400
     * @tc.desc   Verify Promise.then with undefined passes through boolean value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFourthTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<boolean>(true)
      let promise2 = promise1.then(undefined)
      let result = await promise2
      expect(result).assertEqual(true)
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_0500
     * @tc.desc   Verify Promise.then with undefined variable passes through value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFourthTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let undefinedValue: undefined = undefined
      let promise1 = Promise.resolve<number>(100)
      let promise2 = promise1.then(undefinedValue)
      let result = await promise2
      expect(result).assertEqual(100)
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_0600
     * @tc.desc   Verify Promise.then with null|undefined variable as undefined passes through value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let undefinedOrNull: null | undefined = undefined
      let promise1 = Promise.resolve<number>(123)
      let promise2 = promise1.then(undefinedOrNull)
      let result = await promise2
      expect(result).assertEqual(123)
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_0700
     * @tc.desc   Verify Promise.then with null|undefined variable as null throws
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let undefinedOrNull: null | undefined = null
      let promise1 = Promise.resolve<string>("value")
      let caught: boolean = false
      try {
        let promise2 = promise1.then(undefinedOrNull as undefined)
        await promise2
        expect().assertFail()
      } catch (error) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_0800
     * @tc.desc   Verify Promise.then with undefined then null throws
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<string>("hello")
      let promise2 = promise1.then(undefined)
      let caught: boolean = false
      try {
        let promise2 = promise1.then(null as undefined)
        await promise2
        expect().assertFail()
      } catch (error) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_0900
     * @tc.desc   Verify Promise.then without arguments returns new Promise with same value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFourthTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<string>("resolved value")
      let promise2 = promise1.then()
      let result = await promise2
      expect(result).assertEqual("resolved value")
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_1000
     * @tc.desc   Verify Promise.then without arguments on rejected Promise propagates rejection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFourthTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.reject<string>(new Error("rejected error"))
      let promise2 = promise1.then()
      try {
        await promise2
        expect().assertFail()
      } catch (error) {
        let e = error
      }
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_1100
     * @tc.desc   Verify Promise.then without arguments on async Promise passes through value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFourthTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise1 = new Promise<string>((resolve) => {
        setTimeout(() => resolve("async value"), 100)
      })
      let promise2 = promise1.then()
      let result = await promise2
      expect(result).assertEqual("async value")
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_1200
     * @tc.desc   Verify Promise.then without arguments returns new Promise instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFourthTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<number>(10)
      let promise2 = promise1.then()
      expect(promise2 !== promise1).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_1300
     * @tc.desc   Verify Promise.then without arguments unwraps nested Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<Promise<string>>(Promise.resolve("nested"))
      let promise2 = promise1.then()
      let result = await promise2
      expect(result).assertEqual("nested")
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_1400
     * @tc.desc   Verify Promise.then without arguments preserves number type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFourthTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<number>(42)
      let promise2 = promise1.then()
      let result = await promise2
      expect(typeof result).assertEqual("number")
      expect(result).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_1500
     * @tc.desc   Verify Promise.then without arguments preserves string type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFourthTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<string>("hello world")
      let promise2 = promise1.then()
      let result = await promise2
      expect(typeof result).assertEqual("string")
      expect(result).assertEqual("hello world")
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_1600
     * @tc.desc   Verify Promise.then without arguments preserves boolean type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFourthTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<boolean>(true)
      let promise2 = promise1.then()
      let result = await promise2
      expect(typeof result).assertEqual("boolean")
      expect(result).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_1700
     * @tc.desc   Verify Promise.then without arguments with interface type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFourthTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {

      let data: Data = { id: 1, name: "test" }
      let promise1 = Promise.resolve<Data>(data)
      let promise2 = promise1.then()
      let result = await promise2
      expect(result.id).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_1800
     * @tc.desc   Verify Promise.then without arguments with array type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFourthTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<number[]>([1, 2, 3, 4, 5])
      let promise2 = promise1.then()
      let result = await promise2
      expect(result.length).assertEqual(5)
      expect(result[0]).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_1900
     * @tc.desc   Verify Promise.then without arguments with union type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<string | number>(42)
      let promise2 = promise1.then()
      let result = await promise2
      expect(typeof result === "number" || typeof result === "string").assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_2000
     * @tc.desc   Verify Promise.then without arguments with null value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<string | null>(null)
      let promise2 = promise1.then()
      let result = await promise2
      expect(result).assertNull()
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_2100
     * @tc.desc   Verify Promise.then without arguments with undefined value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<string | undefined>(undefined)
      let promise2 = promise1.then()
      let result = await promise2
      expect(result).assertUndefined()
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_2200
     * @tc.desc   Verify Promise.then without arguments with empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<string>("")
      let promise2 = promise1.then()
      let result = await promise2
      expect(result).assertEqual("")
      expect(result.length).assertEqual(0)
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_2300
     * @tc.desc   Verify Promise.then without arguments with zero value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<number>(0)
      let promise2 = promise1.then()
      let result = await promise2
      expect(result).assertEqual(0)
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_2400
     * @tc.desc   Verify Promise.then without arguments with false value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<boolean>(false)
      let promise2 = promise1.then()
      let result = await promise2
      expect(result).assertFalse()
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_2500
     * @tc.desc   Verify Promise.then without arguments with NaN value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<number>(NaN)
      let promise2 = promise1.then()
      let result = await promise2
      expect(Number.isNaN(result)).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_2600
     * @tc.desc   Verify Promise.then without arguments with Infinity value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<number>(Infinity)
      let promise2 = promise1.then()
      let result = await promise2
      expect(result).assertEqual(Infinity)
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_2700
     * @tc.desc   Verify Promise.then without arguments with Number.MAX_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<number>(Number.MAX_VALUE)
      let promise2 = promise1.then()
      let result = await promise2
      expect(result).assertEqual(Number.MAX_VALUE)
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest2800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_2800
     * @tc.desc   Verify Promise.then without arguments with Number.MIN_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<number>(Number.MIN_VALUE)
      let promise2 = promise1.then()
      let result = await promise2
      expect(result).assertEqual(Number.MIN_VALUE)
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest2900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_2900
     * @tc.desc   Verify Promise.then without arguments with long string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let longString = "a".repeat(10000)
      let promise1 = Promise.resolve<string>(longString)
      let promise2 = promise1.then()
      let result = await promise2
      expect(result.length).assertEqual(10000)
      expect(result).assertEqual(longString)
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest3000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_3000
     * @tc.desc   Verify Promise.then without arguments with Unicode string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let unicodeString = "你好世界🌍🎉"
      let promise1 = Promise.resolve<string>(unicodeString)
      let promise2 = promise1.then()
      let result = await promise2
      expect(result).assertEqual("你好世界🌍🎉")
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest3100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_3100
     * @tc.desc   Verify Promise.then without arguments with nested object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {

      let nestedData: Nested = { level1: { level2: { value: "deep" } } }
      let promise1 = Promise.resolve<Nested>(nestedData)
      let promise2 = promise1.then()
      let result = await promise2
      expect(result.level1.level2.value).assertEqual("deep")
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest3200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_3200
     * @tc.desc   Verify Promise.then without arguments with circular reference object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {

      let circular: Circular = { value: 1 }
      circular.self = circular
      let promise1 = Promise.resolve<Circular>(circular)
      let promise2 = promise1.then()
      let result = await promise2
      expect(result.value).assertEqual(1)
      expect(result.self!.value).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest3300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_3300
     * @tc.desc   Verify Promise.then without arguments propagates Error rejection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFourthTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let error = new Error("test error")
      let promise1 = Promise.reject<string>(error)
      let promise2 = promise1.then()
      try {
        await promise2
        expect().assertFail()
      } catch (e) {
        let err = e
      }
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest3400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_3400
     * @tc.desc   Verify Promise.then without arguments propagates string rejection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.reject<string>(new Error("error string"))
      let promise2 = promise1.then()
      try {
        await promise2
        expect().assertFail()
      } catch (e) {
        let err = e
      }
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest3500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_3500
     * @tc.desc   Verify Promise.then without arguments propagates CustomError rejection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {

      let customError = new CustomError("custom error")
      let promise1 = Promise.reject<string>(customError)
      let promise2 = promise1.then()
      try {
        await promise2
        expect().assertFail()
      } catch (e) {
        let err = e
      }
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest3600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_3600
     * @tc.desc   Verify Promise.then without arguments propagates null rejection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.reject<string>(new Error("null"))
      let promise2 = promise1.then()
      try {
        await promise2
        expect().assertFail()
      } catch (e) {
        let err = e
      }
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest3700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_3700
     * @tc.desc   Verify Promise.then without arguments propagates undefined rejection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.reject<string>(new Error("undefined"))
      let promise2 = promise1.then()
      try {
        await promise2
        expect().assertFail()
      } catch (e) {
        let err = e
      }
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest3800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_3800
     * @tc.desc   Verify Promise.then without arguments rejection caught by catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFourthTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.reject<string>(new Error("chain error"))
      let promise2 = promise1.then()
      let errorCaught = false
      await promise2.catch((error) => {
        errorCaught = true
        let e = error
      })
      expect(errorCaught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest3900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_3900
     * @tc.desc   Verify Promise.then without arguments chaining passes through value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFourthTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<number>(10)
      let promise2 = promise1.then()
      let promise3 = promise2.then()
      let promise4 = promise3.then()
      let result = await promise4
      expect(result).assertEqual(10)
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest4000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_4000
     * @tc.desc   Verify Promise.then without arguments chaining propagates rejection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFourthTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.reject<number>(new Error("first error"))
      let promise2 = promise1.then()
      let promise3 = promise2.then()
      let promise4 = promise3.then()
      try {
        await promise4
        expect().assertFail()
      } catch (error) {
        let e = error
      }
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest4100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_4100
     * @tc.desc   Verify Promise.then without arguments triple chaining passes through value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFourthTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<string>("chain value")
      let promise2 = promise1.then()
      let promise3 = promise2.then()
      let promise4 = promise3.then()
      let result = await promise4
      expect(result).assertEqual("chain value")
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest4200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_4200
     * @tc.desc   Verify Promise.then without arguments chaining with callback after pass-through
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFourthTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<number>(5)
      let promise2 = promise1.then()
      let promise3 = promise2.then((value) => value * 2)
      let result = await promise3
      expect(result).assertEqual(10)
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest4300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_4300
     * @tc.desc   Verify Promise.then without arguments chaining with catch after pass-through
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFourthTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<number>(20)
      let promise2 = promise1.then()
      let promise3 = promise2.then((value) => value + 10)
      let promise4 = promise3.catch(() => -1)
      let result = await promise4
      expect(result).assertEqual(30)
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest4400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_4400
     * @tc.desc   Verify Promise.then without arguments inside async function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFourthTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let testAwait: () => Promise<void> = async (): Promise<void> => {
        let promise1 = Promise.resolve<string>("await value");
        let promise2 = promise1.then();
        let result = await promise2;
        expect(result).assertEqual("await value");
      };
      await testAwait()
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest4500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_4500
     * @tc.desc   Verify Promise.then without arguments rejection inside async function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFourthTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let testRejected: () => Promise<void> = async (): Promise<void> => {
        let promise1 = Promise.reject<string>(new Error("await error"));
        let promise2 = promise1.then();
        try {
          await promise2;
          expect().assertFail();
        } catch (error) {
          let e = error
        }
      };
      await testRejected()
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest4600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_4600
     * @tc.desc   Verify Promise.then without arguments with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFourthTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<number>(1).then()
      let promise2 = Promise.resolve<number>(2).then()
      let promise3 = Promise.resolve<number>(3).then()
      let results = await Promise.all([promise1, promise2, promise3])
      expect(results[0]).assertEqual(1)
      expect(results[1]).assertEqual(2)
      expect(results[2]).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest4700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_4700
     * @tc.desc   Verify Promise.then without arguments on delayed Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = new Promise<string>((resolve) => {
        setTimeout(() => resolve("delayed"), 500)
      })
      let promise2 = promise1.then()
      let result = await promise2
      expect(result).assertEqual("delayed")
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest4800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_4800
     * @tc.desc   Verify Promise.then without arguments on delayed rejected Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = new Promise<string>((_, reject) => {
        setTimeout(() => reject(new Error("delayed error")), 500)
      })
      let promise2 = promise1.then()
      try {
        await promise2
        expect().assertFail()
      } catch (error) {
        let e = error
      }
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest4900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_4900
     * @tc.desc   Verify Promise.then without arguments with Promise.race
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = new Promise<string>((resolve) => {
        setTimeout(() => resolve("slow"), 1000)
      })
      let promise2 = new Promise<string>((resolve) => {
        setTimeout(() => resolve("fast"), 100)
      })
      let result = await Promise.race([promise1.then(), promise2.then()])
      expect(result).assertEqual("fast")
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest5000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_5000
     * @tc.desc   Verify Promise.then without arguments returns Promise instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = new Promise<string>((resolve) => {
        setTimeout(() => resolve("state change"), 100)
      })
      let promise2 = promise1.then()
      let result = await promise2
      expect(result).assertEqual("state change")
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest5100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_5100
     * @tc.desc   Verify Promise.then without arguments on short delayed rejected Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = new Promise<string>((_, reject) => {
        setTimeout(() => reject(new Error("state reject")), 100)
      })
      let promise2 = promise1.then()
      try {
        await promise2
        expect().assertFail()
      } catch (error) {
        let e = error
      }
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest5200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_5200
     * @tc.desc   Verify Promise.then without arguments on already settled Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<string>("settled")
      await promise1
      let promise2 = promise1.then()
      let result = await promise2
      expect(result).assertEqual("settled")
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest5300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_5300
     * @tc.desc   Verify Promise.then without arguments chaining with mixed callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFourthTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<number>(1)
      let promise2 = promise1.then()
      let promise3 = promise2.then((v) => v + 10)
      let promise4 = promise3.then()
      let promise5 = promise4.then((v) => v * 2)
      let result = await promise5
      expect(result).assertEqual(22)
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest5400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_5400
     * @tc.desc   Verify Promise.then without arguments long chain 10 iterations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: Promise<string> = Promise.resolve("long chain")
      for (let i = 0; i < 10; i++) {
        promise = promise.then()
      }
      let result = await promise
      expect(result).assertEqual("long chain")
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest5500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_5500
     * @tc.desc   Verify Promise.then without arguments with Promise.all on same Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenFourthTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<number>(42)
      let promise2 = promise1.then()
      let promise3 = promise1.then()
      let promise4 = promise1.then()
      let results = await Promise.all([promise2, promise3, promise4])
      expect(results[0]).assertEqual(42)
      expect(results[1]).assertEqual(42)
      expect(results[2]).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest5600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_5600
     * @tc.desc   Verify Promise.then without arguments updates shared data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {

      let shared = new SharedData()
      let promises: Promise<void>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(Promise.resolve(i).then().then<void>(async() => {
          await shared.add()
        }))
      }
      await Promise.all(promises)
      expect(await shared.getValue()).assertEqual(5)
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest5700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_5700
     * @tc.desc   Verify Promise.then without arguments propagates value through chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let receivedResult = ""
      await Promise.resolve<string>("test")
        .then<string>((v: string) => v)
        .then<string>((v: string) => v + " processed")
        .then<void>((v: string) => { receivedResult = v })
      expect(receivedResult).assertEqual("test processed")
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest5800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_5800
     * @tc.desc   Verify Promise.then without arguments updates shared string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let shared = ""
      let promises = [
        Promise.resolve<string>("a").then<void>(() => {
          shared = "a"
        }),
        Promise.resolve<string>("b").then<void>(() => {
          shared = "b"
        })
      ]
      await Promise.all(promises)
      expect(shared === "a" || shared === "b").assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest5900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_5900
     * @tc.desc   Verify Promise.then without arguments sets shared branch variable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let branch = ""
      let p1 = Promise.resolve(1.0).then<void>(() => {
        branch = "first"
      })
      let p2 = Promise.resolve(2.0).then<void>(() => {
        if (!branch) branch = "second"
      })
      await Promise.all([p1, p2])
      expect(branch === "first" || branch === "second").assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest6000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_6000
     * @tc.desc   Verify Promise.race resolves with earlier timeout branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let raceResult = await Promise.race<string>([
        new Promise<string>((resolve: (value: string) => void) => {
          setTimeout(() => resolve("timeout"), 500)
        }),
        new Promise<string>((resolve: (value: string) => void) => {
          setTimeout(() => resolve("done"), 2000)
        })
      ])
      expect(raceResult).assertEqual("timeout")
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest6100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_6100
     * @tc.desc   Verify Promise.then without arguments with counter 3 iterations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = 0
      let promises: Promise<void>[] = []
      for (let i = 0; i < 3; i++) {
        promises.push(Promise.resolve(i * 1.0).then<void>(() => {
          counter++
        }))
      }
      await Promise.all(promises)
      expect(counter).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest6200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_6200
     * @tc.desc   Verify Promise.then without arguments with counter 5 iterations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = 0
      let promises: Promise<void>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(Promise.resolve(i * 1.0).then<void>(() => {
          counter++
        }))
      }
      await Promise.all(promises)
      expect(counter).assertEqual(5)
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest6300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_6300
     * @tc.desc   Verify Promise.then without arguments with counter 10 iterations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = 0
      let promises: Promise<void>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(Promise.resolve(i * 1.0).then<void>(() => {
          counter++
        }))
      }
      await Promise.all(promises)
      expect(counter).assertEqual(10)
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest6400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_6400
     * @tc.desc   Verify Promise.then without arguments callbacks increment shared counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
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

    /**
     * @tc.name   PromiseThenFourthTest6500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_6500
     * @tc.desc   Verify Promise.then without arguments chaining with void callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve<void>(undefined)
        .then()
        .then<void>(() => { })
      expect(result).assertUndefined()
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest6600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_6600
     * @tc.desc   Verify Promise.then without arguments double chaining propagates rejection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.reject<string>(new Error("never resolve"))
      let promise2 = promise1.then()
      let promise3 = promise2.then()
      try {
        await promise3
        expect().assertFail()
      } catch (error) {
        let e = error
      }
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest6700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_6700
     * @tc.desc   Verify Promise.then without arguments long chain 100 iterations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: Promise<number> = Promise.resolve(1.0)
      for (let i = 0; i < 100; i++) {
        promise = promise.then<number>((v: number) => v)
      }
      let result = await promise
      expect(result).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest6800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_6800
     * @tc.desc   Verify Promise.then without arguments with Promise.all 100 promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<number>[] = []
      for (let i = 0; i < 100; i++) {
        promises.push(Promise.resolve(i * 1.0).then<number>((v: number) => v))
      }
      let results = await Promise.all(promises)
      expect(results.length).assertEqual(100)
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest6900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_6900
     * @tc.desc   Verify Promise.then without arguments chaining with mixed callbacks and type transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve<string>("test")
        .then()
        .then<string>((v) => v.toUpperCase())
        .then()
      expect(result).assertEqual("TEST")
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest7000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_7000
     * @tc.desc   Verify Promise.then without arguments chaining with type transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<number>(42)
      let promise2 = promise1.then()
      let promise3 = promise2.then()
      let promise4 = promise3.then((v) => v.toString())
      let result = await promise4
      expect(result).assertEqual("42")
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest7100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_7100
     * @tc.desc   Verify Promise.then without arguments double chaining rejection caught by catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.reject<number>(new Error("err"))
      let promise2 = promise1.then()
      let promise3 = promise2.then()
      let caught = false
      await promise3.catch((error) => {
        caught = true
        let e = error
      })
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest7200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_7200
     * @tc.desc   Verify Promise.then without arguments chaining with undefined callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenFourthTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<number>(10)
      let promise2 = promise1.then()
      let promise3 = promise2.then(undefined)
      let result = await promise3
      expect(result).assertEqual(10)
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest7300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_7300
     * @tc.desc   Verify EAWorker.run callback nested Promise then/catch/finally chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseThenFourthTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('thenWorker')
      eaWorker.start()
      let job = eaWorker.run<int>((input: int): int => {
        return input * 2 + 10
      }, 10)
      let workerResult = job.Await()
      let result = await Promise.resolve<int>(workerResult)
        .then<int>((v: int) => v)
        .catch<int>((e: Error) => 0)
      expect(result).assertEqual(30)
      await eaWorker.join()
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest7400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_7400
     * @tc.desc   Verify EAWorker.run callback nested Promise.then chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseThenFourthTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('msgHandlerWorker')
      eaWorker.start()
      let job = eaWorker.run<string>((msg: int): string => {
        return "result: " + (msg * 3).toString()
      }, 10)
      let workerResult = job.Await()
      expect(workerResult).assertEqual("result: 30")
      await eaWorker.join()
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest7500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_7500
     * @tc.desc   Verify EAWorker.run callback nested Promise.then chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseThenFourthTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('thenWorker')
      eaWorker.start()
      let job = eaWorker.run<int>((data: int): int => {
        return data * 2 + 10
      }, 5)
      let workerResult = job.Await()
      let result = await Promise.resolve<int>(workerResult)
      expect(result).assertEqual(20)
      await eaWorker.join()
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest7600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_7600
     * @tc.desc   Verify EAWorker multiple jobs with Promise.all and then chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseThenFourthTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let processedCount = new AtomicInt(0)
      let eaWorker = new EAWorker('msgThenWorker')
      eaWorker.start()
      let job1 = eaWorker.run<string>((msg: string): string => { return msg }, "a")
      let job2 = eaWorker.run<string>((msg: string): string => { return msg }, "b")
      let job3 = eaWorker.run<string>((msg: string): string => { return msg }, "c")
      let jr1 = job1.Await();
      let jr2 = job2.Await();
      let jr3 = job3.Await();
      await Promise.all<string>([Promise.resolve(jr1), Promise.resolve(jr2), Promise.resolve(jr3)])
        .then<void>(() => { processedCount.fetchAdd(3) })
      expect(processedCount.load()).assertEqual(3)
      await eaWorker.join()
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest7700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_7700
     * @tc.desc   Verify EAWorker.run callback nested parameterless then
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseThenFourthTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('thenWorker')
      eaWorker.start()
      let job = eaWorker.run<string>(() => {
        return "done"
      })
      let workerResult = job.Await()
      let result = await Promise.resolve<string>(workerResult)
      expect(result).assertEqual("done")
      await eaWorker.join()
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest7800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_7800
     * @tc.desc   Verify EAWorker.run callback nested full Promise chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseThenFourthTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('chainWorker')
      eaWorker.start()
      let job = eaWorker.run<int>(() => {
        return 4
      })
      let workerResult = job.Await()
      let result = await Promise.resolve<int>(workerResult)
      expect(result).assertEqual(4)
      await eaWorker.join()
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest7900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_7900
     * @tc.desc   Verify EAWorker.run callback nested parameterless then chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseThenFourthTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('msgWorker')
      eaWorker.start()
      let job = eaWorker.run<string>((data: int): string => {
        return "processed"
      }, 5)
      let workerResult = job.Await()
      expect(workerResult).assertEqual("processed")
      await eaWorker.join()
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest8000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_8000
     * @tc.desc   Verify EAWorker.run callback nested Promise.then with parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseThenFourthTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('thenParamWorker')
      eaWorker.start()
      let job = eaWorker.run<int>((data: string): int => {
        return data.length
      }, "hello")
      let workerResult = job.Await()
      expect(workerResult).assertEqual(5)
      await eaWorker.join()
      Done();
    })

    /**
     * @tc.name   PromiseThenFourthTest8100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_FOURTH_TEST_8100
     * @tc.desc   Verify EAWorker.run callback nested Promise.then with parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseThenFourthTest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let processedCount = new AtomicInt(0)
      let eaWorker = new EAWorker('msgThenParamWorker')
      eaWorker.start()
      let job1 = eaWorker.run<string>((msg: string): string => { return msg }, "msg1")
      let job2 = eaWorker.run<string>((msg: string): string => { return msg }, "msg2")
      let job3 = eaWorker.run<string>((msg: string): string => { return msg }, "msg3")
      let jr1 = job1.Await();
      let jr2 = job2.Await();
      let jr3 = job3.Await();
      let results = await Promise.all<string>([Promise.resolve(jr1), Promise.resolve(jr2), Promise.resolve(jr3)])
      processedCount.fetchAdd(results.length)
      expect(processedCount.load()).assertEqual(3)
      await eaWorker.join()
      Done();
    })

  })
}
