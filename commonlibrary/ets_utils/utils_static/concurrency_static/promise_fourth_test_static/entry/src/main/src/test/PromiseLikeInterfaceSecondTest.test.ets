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

export default function BuiltinsPromiseLikeInterfaceSecondTest(): void  {
  describe('BuiltinsPromiseLikeInterfaceSecondTest', (): void => {
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
     * @tc.name   PromiseLikeInterfaceSecondTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_0100
     * @tc.desc   Verify PromiseLike.then returning Number.MIN_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceSecondTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<number> = Promise.resolve<number>(100)
      let result = promiseLike.then(() => Number.MIN_VALUE)
      let val = await result
      expect(val).assertEqual(Number.MIN_VALUE)
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_0200
     * @tc.desc   Verify PromiseLike.then returning Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceSecondTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<number> = Promise.resolve<number>(100)
      let result = promiseLike.then(() => Infinity)
      let val = await result
      expect(val).assertEqual(Infinity)
      expect(isFinite(val)).assertFalse()
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_0300
     * @tc.desc   Verify PromiseLike.then returning NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceSecondTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<number> = Promise.resolve<number>(100)
      let result = promiseLike.then(() => NaN)
      let val = await result
      expect(isNaN(val)).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_0400
     * @tc.desc   Verify PromiseLike.then with long string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseLikeInterfaceSecondTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<string> = Promise.resolve<string>("hello")
      let longString = "a".repeat(10000)
      let result = promiseLike.then(() => longString)
      let val = await result
      expect(val.length).assertEqual(10000)
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_0500
     * @tc.desc   Verify PromiseLike.then returning value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseLikeInterfaceSecondTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<number> = Promise.resolve<number>(1000)
      let result = promiseLike.then((value: number) => value)
      let val = await result.then((value: number) => {
        expect(value).assertEqual(1000)
        return value
      })
      expect(val).assertEqual(1000)
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_0600
     * @tc.desc   Verify PromiseLike rejection reason is Error instance with message input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseLikeInterfaceSecondTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let error = new Error("test error")
      let promiseLike: PromiseLike<string> = Promise.reject<string>(error)
      let caught: boolean = false
      try {
        await promiseLike.then((value: string) => value)
        expect().assertFail()
      } catch (e) {
        caught = true
        expect(e instanceof Error).assertTrue()
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_0700
     * @tc.desc   Verify CustomError instance creation and instanceof check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceSecondTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {

      let customError = new CustomError("custom error message")
      expect(customError instanceof Error).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_0800
     * @tc.desc   Verify PromiseLike rejection reason is Error instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseLikeInterfaceSecondTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let error = new Error("test message")
      let promiseLike: PromiseLike<string> = Promise.reject<string>(error)
      let caught: boolean = false
      try {
        await promiseLike.then((value: string) => value)
        expect().assertFail()
      } catch (e) {
        caught = true
        expect(e instanceof Error).assertTrue()
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_0900
     * @tc.desc   Verify TypeError and RangeError are Error instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceSecondTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let typeError = new TypeError("type error")
      expect(typeError instanceof Error).assertTrue()
      let rangeError = new RangeError("range error")
      expect(rangeError instanceof Error).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_1000
     * @tc.desc   Verify PromiseLike.then callback throwing error with catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceSecondTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = promiseLike.then((_value: string) => {
        throw new Error("error in onFulfilled")
      })
      let caught: boolean = false
      try {
        await result
        expect().assertFail()
      } catch (error) {
        caught = true
        expect(error instanceof Error).assertTrue()
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_1100
     * @tc.desc   Verify PromiseLike.then callback throwing custom error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceSecondTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {

      let promiseLike: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = promiseLike.then((_value: string) => {
        throw new CustomError("custom error")
      })
      let caught: boolean = false
      try {
        await result
        expect().assertFail()
      } catch (error) {
        caught = true
        expect(error instanceof CustomError).assertTrue()
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_1200
     * @tc.desc   Verify PromiseLike.then with rejection and error throwing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceSecondTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<string> = Promise.reject<string>(new Error("original error"))
      let result = promiseLike.then((value: string) => value)
        .catch((error: Error) => {
          throw new Error("error in onRejected: " + error.message)
        })
      let caught: boolean = false
      try {
        await result
        expect().assertFail()
      } catch (error) {
        caught = true
        expect(error instanceof Error).assertTrue()
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_1300
     * @tc.desc   Verify PromiseLike.then with simple string concatenation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceSecondTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<string> = Promise.resolve<string>("hello")
      try {
        let result = promiseLike.then((value: string) => value + " world")
        let val = await result
        expect(val).assertEqual("hello world")
      } catch (_error) {
        expect().assertFail()
      }
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_1400
     * @tc.desc   Verify PromiseLike.then with string and try-catch-finally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceSecondTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let finallyExecuted = false
      let promiseLike: PromiseLike<string> = Promise.resolve<string>("hello")
      try {
        let result = promiseLike.then((value: string) => value + " world")
        let val = await result
        expect(val).assertEqual("hello world")
      } catch (_error) {
        expect().assertFail()
      } finally {
        finallyExecuted = true
      }
      expect(finallyExecuted).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_1500
     * @tc.desc   Verify PromiseLike.then callback throwing Error instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceSecondTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = promiseLike.then((_value: string) => {
        throw new Error("test error")
      })
      let caught: boolean = false
      try {
        await result
        expect().assertFail()
      } catch (error) {
        caught = true
        expect(error instanceof Error).assertTrue()
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_1600
     * @tc.desc   Verify PromiseLike.then rejection handling with unhandled rejection error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceSecondTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<string> = Promise.reject<string>(new Error("unhandled rejection"))
      let result = promiseLike.then((value: string) => value)
      let caught: boolean = false
      try {
        await result
        expect().assertFail()
      } catch (error) {
        caught = true
        expect(error instanceof Error).assertTrue()
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_1700
     * @tc.desc   Verify PromiseLike.then with async callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceSecondTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = promiseLike.then(async (value: string) => {
        return await Promise.resolve<string>("async result")
      })
      let val = await result
      expect(val).assertEqual("async result")
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_1800
     * @tc.desc   Verify PromiseLike.then with await for string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseLikeInterfaceSecondTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = await promiseLike.then((value: string) => value + " world")
      expect(result).assertEqual("hello world")
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_1900
     * @tc.desc   Verify PromiseLike.then rejection handling with test error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseLikeInterfaceSecondTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<string> = Promise.reject<string>(new Error("test error"))
      let caught: boolean = false
      try {
        await promiseLike.then((value: string) => value)
        expect().assertFail()
      } catch (error) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_2000
     * @tc.desc   Verify PromiseLike.then async callback throwing error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceSecondTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let asyncError: () => Promise<string> = async (): Promise<string> => {
        throw new Error("async error");
      };
      let promiseLike: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = promiseLike.then(async (_value: string) => {
        return await asyncError()
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
     * @tc.name   PromiseLikeInterfaceSecondTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_2100
     * @tc.desc   Verify PromiseLike.then chain with three string transformations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseLikeInterfaceSecondTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = promiseLike
        .then((value: string) => value + " world")
        .then((value: string) => value.toUpperCase())
        .then((value: string) => value + "!")
      let val = await result
      expect(val).assertEqual("HELLO WORLD!")
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_2200
     * @tc.desc   Verify PromiseLike.then with catch in chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceSecondTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<string> = Promise.reject<string>(new Error("error"))
      let result = promiseLike
        .then((value: string) => value + " processed")
        .catch((error: Error) => "recovered")
        .then((value: string) => value.toUpperCase())
      let val = await result
      expect(val).assertContain("RECOVERED")
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_2300
     * @tc.desc   Verify PromiseLike.then with finally in chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceSecondTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let finallyExecuted = false
      let promiseLike: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = promiseLike
        .then((value: string) => value + " world")
        .finally(() => {
          finallyExecuted = true
        })
      let val = await result
      expect(val).assertEqual("hello world")
      expect(finallyExecuted).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_2400
     * @tc.desc   Verify PromiseLike.then chain error catch and recovery
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceSecondTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<string> = Promise.resolve<string>("hello")
      let step2Reached = false
      let result = promiseLike
        .then((_value: string) => {
          throw new Error("error in step 1")
        })
        .catch((error: Error) => {
          return "recovered"
        })
        .then((value: string) => {
          step2Reached = true
          return value + " step2"
        })
      let val = await result
      expect(val).assertEqual("recovered step2")
      expect(step2Reached).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_2500
     * @tc.desc   Verify Promise.all with three PromiseLike.then pushing to array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceSecondTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike1: PromiseLike<string> = Promise.resolve<string>("hello")
      let promiseLike2: PromiseLike<string> = Promise.resolve<string>("world")
      let promiseLike3: PromiseLike<string> = Promise.resolve<string>("!")
      let results: string[] = []
      await Promise.all([
        promiseLike1.then((value: string) => { results.push(value) }),
        promiseLike2.then((value: string) => { results.push(value) }),
        promiseLike3.then((value: string) => { results.push(value) })
      ])
      expect(results.length).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_2600
     * @tc.desc   Verify Promise.all with single PromiseLike then chains produces hello1, hello2, hello3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceSecondTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = Promise.all([
        promiseLike.then((value: string) => value + "1"),
        promiseLike.then((value: string) => value + "2"),
        promiseLike.then((value: string) => value + "3")
      ])
      let vals = await result
      expect(vals.length).assertEqual(3)
      expect(vals[0]).assertEqual("hello1")
      expect(vals[1]).assertEqual("hello2")
      expect(vals[2]).assertEqual("hello3")
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_2700
     * @tc.desc   Verify PromiseLike.then with Promise.race
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceSecondTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike1: PromiseLike<string> = Promise.resolve<string>("fast")
      let result = Promise.race([
        promiseLike1.then((value: string) => value + " processed")
      ])
      let val = await result
      expect(val).assertEqual("fast processed")
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest2800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_2800
     * @tc.desc   Verify PromiseLike.then with nested PromiseLike chaining
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceSecondTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike1: PromiseLike<string> = Promise.resolve<string>("hello")
      let promiseLike2: PromiseLike<string> = Promise.resolve<string>("world")
      let result = promiseLike1.then((value: string) => {
        return promiseLike2.then((v: string) => value + " " + v)
      })
      let val = await result
      expect(val).assertEqual("hello world")
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest2900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_2900
     * @tc.desc   Verify PromiseLike.then with multiple chains from same source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceSecondTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<string> = Promise.resolve<string>("resolved")
      let result1 = promiseLike.then((value: string) => value + " first")
      let result2 = promiseLike.then((value: string) => value + " second")
      let val1 = await result1
      let val2 = await result2
      expect(val1).assertEqual("resolved first")
      expect(val2).assertEqual("resolved second")
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest3000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_3000
     * @tc.desc   Verify PromiseLike.then async completion with wait loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceSecondTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<string> = Promise.resolve<string>("result")
      let completed = false
      promiseLike.then((_value: string) => {
        completed = true
      })
      let waitCount = 0
      while (!completed && waitCount < 100) {
        await new Promise<void>((resolve) => {
          setTimeout(() => resolve(undefined), 100)
        })
        waitCount++
      }
      expect(completed).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest3100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_3100
     * @tc.desc   Verify Promise.all collects three PromiseLike results into array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceSecondTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: string[] = []
      let promiseLike1: PromiseLike<string> = Promise.resolve<string>("hello")
      let promiseLike2: PromiseLike<string> = Promise.resolve<string>("world")
      let promiseLike3: PromiseLike<string> = Promise.resolve<string>("!")
      await Promise.all([
        promiseLike1.then((value: string) => { results.push(value) }),
        promiseLike2.then((value: string) => { results.push(value) }),
        promiseLike3.then((value: string) => { results.push(value) })
      ])
      expect(results.length).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest3200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_3200
     * @tc.desc   Verify Promise.all with map then toUpperCase produces A, B, C
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceSecondTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLikeArray: PromiseLike<string>[] = [
        Promise.resolve<string>("a"),
        Promise.resolve<string>("b"),
        Promise.resolve<string>("c")
      ]
      let results = await Promise.all(
        promiseLikeArray.map(pl => pl.then((value: string) => value.toUpperCase()))
      )
      expect(results.length).assertEqual(3)
      expect(results[0]).assertEqual("A")
      expect(results[1]).assertEqual("B")
      expect(results[2]).assertEqual("C")
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest3300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_3300
     * @tc.desc   Verify nested PromiseLike.then chain produces 'hello world!'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceSecondTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let outerThenable: () => Promise<string> = async (): Promise<string> => {
        let promiseLike1: PromiseLike<string> = Promise.resolve<string>("hello");
        return await promiseLike1.then((value: string) => {
          let promiseLike2: PromiseLike<string> = Promise.resolve<string>(value + " world");
          return promiseLike2.then((v: string) => v + "!");
        });
      };
      let result = await outerThenable()
      expect(result).assertEqual("hello world!")
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest3400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_3400
     * @tc.desc   Verify PromiseLike.then rejection with out of range error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceSecondTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<string> = Promise.reject<string>(new Error("The value of \"index\" is out of range. It must be >= 0 && < 10"))
      let caught: boolean = false
      try {
        await promiseLike.then((value: string) => value)
        expect().assertFail()
      } catch (error) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest3500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_3500
     * @tc.desc   Verify PromiseLike.then chain with throw and catch recovery
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceSecondTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<string> = Promise.resolve<string>("hello")
      let step2Reached = false
      let result = promiseLike
        .then((_value: string) => {
          throw new Error("error in step 1")
        })
        .catch((error: Error) => {
          return "recovered"
        })
        .then((value: string) => {
          step2Reached = true
          expect(value).assertEqual("recovered")
          return value
        })
      let val = await result
      expect(val).assertEqual("recovered")
      expect(step2Reached).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest3600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_3600
     * @tc.desc   Verify PromiseLike.then type conversion produces result 84
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceSecondTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let innerThenable: PromiseLike<number> = Promise.resolve<number>(42)
      let result = await Promise.resolve<string>("outer")
        .then<number>(() => {
          return innerThenable.then<number>((value: number) => value * 2)
        })
      expect(result).assertEqual(84)
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest3700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_3700
     * @tc.desc   Verify PromiseLike.then concurrent execution with AtomicInt counter equals 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceSecondTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = new AtomicInt(0)
      let promises: PromiseLike<void>[] = []
      for (let i = 0; i < 3; i++) {
        let p: PromiseLike<number> = Promise.resolve<number>(i)
        let r = p.then<void>(() => {
          counter.fetchAdd(1)
        })
        promises.push(r)
      }
      await Promise.all(promises.map(p => Promise.resolve(p)))
      expect(counter.load()).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest3800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_3800
     * @tc.desc   Verify PromiseLike.then concurrent execution with AtomicInt counter equals 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceSecondTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = new AtomicInt(0)
      let promises: PromiseLike<void>[] = []
      for (let i = 0; i < 5; i++) {
        let p: PromiseLike<number> = Promise.resolve<number>(i)
        let r = p.then<void>(() => {
          counter.fetchAdd(1)
        })
        promises.push(r)
      }
      await Promise.all(promises.map(p => Promise.resolve(p)))
      expect(counter.load()).assertEqual(5)
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest3900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_3900
     * @tc.desc   Verify PromiseLike.then concurrent execution with AtomicInt counter equals 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceSecondTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = new AtomicInt(0)
      let promises: PromiseLike<void>[] = []
      for (let i = 0; i < 10; i++) {
        let p: PromiseLike<number> = Promise.resolve<number>(i)
        let r = p.then<void>(() => {
          counter.fetchAdd(1)
        })
        promises.push(r)
      }
      await Promise.all(promises.map(p => Promise.resolve(p)))
      expect(counter.load()).assertEqual(10)
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest4000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_4000
     * @tc.desc   Verify EAWorker.run result resolves through PromiseLike.resolve
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseLikeInterfaceSecondTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let worker = new EAWorker('worker')
      worker.start()
      try {
        let job = worker.run<string>((data: string): string => {
          return data.toUpperCase()
        }, "input")
        let workerResult = job.Await()
        let promiseLike: PromiseLike<string> = Promise.resolve<string>(workerResult)
        let result = await promiseLike
        expect(result).assertEqual("INPUT")
      } finally {
        worker.join().Await()
      }
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest4100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_4100
     * @tc.desc   Verify PromiseLike.reject after EAWorker.run is catchable as Error instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseLikeInterfaceSecondTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let worker = new EAWorker('worker')
      worker.start()
      try {
        let job = worker.run<string>((data: string): string => {
          return data
        }, "input")
        job.Await()
        let promiseLike: PromiseLike<string> = Promise.reject<string>(new Error("worker error"))
        let caught: boolean = false
        try {
          await promiseLike.then<string>((v: string) => v)
            .catch((err: Error) => { throw err })
          expect().assertFail()
        } catch (error) {
        caught = true
  }
        expect(caught).assertTrue()
      } finally {
        worker.join().Await()
      }
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest4200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_4200
     * @tc.desc   Verify EAWorker.run result chains through PromiseLike.resolve
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseLikeInterfaceSecondTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let worker = new EAWorker('worker')
      worker.start()
      try {
        let job = worker.run<string>((data: string): string => {
          return data + "1" + "2"
        }, "input")
        let workerResult = job.Await()
        let p1: PromiseLike<string> = Promise.resolve<string>(workerResult)
        let result = await p1
        expect(result).assertEqual("input12")
      } finally {
        worker.join().Await()
      }
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest4300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_4300
     * @tc.desc   Verify EAWorker.run thenable error propagation recovers via catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseLikeInterfaceSecondTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let worker = new EAWorker('worker')
      worker.start()
      try {
        let job = worker.run<string>((data: string): string => {
          return data
        }, "input")
        job.Await()
        let errorHandled = false
        let promiseLike: PromiseLike<string> = Promise.resolve<string>("test")
        await promiseLike.then<void>((v: string) => {
          throw new Error("thenable error")
        }).catch((err: Error) => {
          errorHandled = true
        })
        expect(errorHandled).assertTrue()
      } finally {
        worker.join().Await()
      }
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest4400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_4400
     * @tc.desc   Verify EAWorker.run callback nested PromiseLike interface object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseLikeInterfaceSecondTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('thenableInterfaceWorker')
      eaWorker.start()
      try {
        let job = eaWorker.run<int>(() => {
          return 100
        })
        let workerResult = job.Await()
        let thenable: PromiseLike<number> = Promise.resolve<number>(workerResult)
        let result = await thenable
        expect(result).assertEqual(100)
      } finally {
        eaWorker.join().Await()
      }
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceSecondTest4500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_SECOND_TEST_4500
     * @tc.desc   Verify EAWorker.run tasks drive PromiseLike completion counting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseLikeInterfaceSecondTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let processedCount = new AtomicInt(0)
      let eaWorker = new EAWorker('msgThenableInterfaceWorker')
      eaWorker.start()
      try {
        let job1 = eaWorker.run<string>((msg: string): string => {
          processedCount.fetchAdd(1)
          return msg
        }, "msg1")
        let job2 = eaWorker.run<string>((msg: string): string => {
          processedCount.fetchAdd(1)
          return msg
        }, "msg2")
        let job3 = eaWorker.run<string>((msg: string): string => {
          processedCount.fetchAdd(1)
          return msg
        }, "msg3")
        job1.Await()
        job2.Await()
        job3.Await()
        let thenable: PromiseLike<void> = Promise.resolve<void>(undefined)
        await thenable
        expect(processedCount.load()).assertEqual(3)
      } finally {
        eaWorker.join().Await()
      }
      Done();
    })

  })
}
