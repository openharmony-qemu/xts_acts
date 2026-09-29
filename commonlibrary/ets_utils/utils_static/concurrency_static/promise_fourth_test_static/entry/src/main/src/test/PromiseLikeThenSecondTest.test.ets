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


interface EmptyObj {}
interface LargeObject { id: number; data: string[] }
interface NestedLevel3 { value: number }
interface NestedLevel2 { level3: NestedLevel3 }
interface NestedLevel1 { level2: NestedLevel2 }
interface NestedObject { level1: NestedLevel1 }
let nestedObject: NestedObject = {
  level1: {
    level2: {
      level3: {
        value: 42
      }
    }
  }
}
interface CircularRef { value: string; ref?: CircularRef }

export default function BuiltinsPromiseLikeThenSecondTest(): void {
  describe('BuiltinsPromiseLikeThenSecondTest', (): void => {
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
     * @tc.name   PromiseLikeThenSecondTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_0100
     * @tc.desc   Verify PromiseLike.then with union type string|number return from both callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: Promise<string> = Promise.resolve<string>("hello")
      let result = promise.then<string | number, string | number>(
        (value: string): string | number => value.length,
        (error: Error): string | number => { expect(error instanceof Error).assertTrue(); return 0 }
      )
      let val = await result
      expect(val).assertEqual(5)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_0200
     * @tc.desc   Verify PromiseLike.then with nested PromiseLike resolution unwraps deeply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: Promise<string> = Promise.resolve<string>("hello")
      let result = promise.then((value: string) => {
        return Promise.resolve<number>(42)
      })
      let val = await result
      expect(val).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_0300
     * @tc.desc   Verify PromiseLike.then asserts input value and transforms to uppercase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseLikeThenSecondTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise: Promise<string> = Promise.resolve<string>("hello")
      let result = promise.then((value: string) => {
        expect(value).assertEqual("hello")
        return value.toUpperCase()
      })
      let val = await result
      expect(val).assertEqual("HELLO")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_0400
     * @tc.desc   onRejected returns recovery value without message assertion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseLikeThenSecondTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise: Promise<string> = Promise.reject<string>(new Error("failed"))
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
     * @tc.name   PromiseLikeThenSecondTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_0500
     * @tc.desc   Verify PromiseLike.then without onRejected propagates rejection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: Promise<string> = Promise.reject<string>(new Error("failed"))
      let result = promise.then((value: string) => value.toUpperCase())
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
     * @tc.name   PromiseLikeThenSecondTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_0600
     * @tc.desc   Verify PromiseLike.then chain with number arithmetic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseLikeThenSecondTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<number> = Promise.resolve<number>(1)
      let result = promise
        .then((value: number) => value + 1)
        .then((value: number) => value * 2)
        .then((value: number) => value + 3)
      let val = await result
      expect(val).assertEqual(7)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_0700
     * @tc.desc   Verify PromiseLike.then chain with intermediate assertion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseLikeThenSecondTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<number> = Promise.resolve<number>(1)
      let result = promise
        .then((value: number) => value + 1)
        .then((value: number) => value * 2)
        .then((value: number) => {
          expect(value).assertEqual(4)
          return value
        })
      let val = await result
      expect(val).assertEqual(4)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_0800
     * @tc.desc   Verify PromiseLike.then chain catches error from first then
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: Promise<string> = Promise.reject<string>(new Error("Error in first then"))
      let result = promise.then<string>(
          (value: string) => value
        ).catch((error: Error) => {
            expect(error instanceof Error).assertTrue()
            return "recovered"
          }
        )
      let val = await result
      expect(val).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_0900
     * @tc.desc   Verify PromiseLike.then chain recovers from rejection and transforms
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: Promise<string> = Promise.reject<string>(new Error("failed"))
      let result = promise.then<string>(
          (value: string) => value
        ).catch((error: Error) => { expect(error instanceof Error).assertTrue(); return "recovered" }
        )
        .then((value: string) => value.toUpperCase())
      let val = await result
      expect(val).assertEqual("RECOVERED")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_1000
     * @tc.desc   Verify PromiseLike.then with direct await and toUpperCase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: Promise<string> = Promise.resolve<string>("hello")
      let val = await promise.then((value: string) => value.toUpperCase())
      expect(val).assertEqual("HELLO")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_1100
     * @tc.desc   Verify PromiseLike.then with nested PromiseLike from outer to inner
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let innerPromise: Promise<string> = Promise.resolve<string>("inner")
      let outerPromise: Promise<string> = Promise.resolve<string>("outer")
      let result = outerPromise.then((_value: string) => {
        return innerPromise.then((v: string) => v.toUpperCase())
      })
      let val = await result
      expect(val).assertEqual("INNER")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_1200
     * @tc.desc   Verify PromiseLike.then with AsyncLock synchronization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let lock = new AsyncLock()
      let sharedResult = ""
      let promise: Promise<string> = Promise.resolve<string>("hello")
      let result = promise.then(async (value: string) => {
        await lock.lockAsync(() => {
          sharedResult = value.toUpperCase()
        })
        return sharedResult
      })
      let val = await result
      expect(val).assertEqual("HELLO")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_1300
     * @tc.desc   Verify PromiseLike.then callback executes exactly once
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let completedCount = 0
      let promise: Promise<string> = Promise.resolve<string>("hello")
      let result = promise.then((value: string) => {
        completedCount++
        return value
      })
      await result
      expect(completedCount).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_1400
     * @tc.desc   Verify PromiseLike.then with Promise.all for multiple transformations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<number> = Promise.resolve<number>(42)
      let result1 = promise.then((value: number) => value * 2)
      let result2 = promise.then((value: number) => value * 3)
      let vals = await Promise.all([result1, result2])
      expect(vals[0]).assertEqual(84)
      expect(vals[1]).assertEqual(126)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_1500
     * @tc.desc   Verify PromiseLike.then with Promise.all for three transformations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<number> = Promise.resolve<number>(42)
      let results = await Promise.all([
        promise.then((v: number) => v * 2),
        promise.then((v: number) => v * 3),
        promise.then((v: number) => v * 4)
      ])
      expect(results.length).assertEqual(3)
      expect(results[0]).assertEqual(84)
      expect(results[1]).assertEqual(126)
      expect(results[2]).assertEqual(168)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_1600
     * @tc.desc   Verify PromiseLike.then with Promise.race for competing transformations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1: PromiseLike<number> = Promise.resolve<number>(10)
      let promise2: PromiseLike<number> = new Promise<number>((resolve: (value: number) => void, _reject: (reason: Error) => void): void => {
        setTimeout(() => { resolve(20) }, 100)
      })
      let result = Promise.race([
        promise1.then((v: number) => v * 2),
        promise2.then((v: number) => v * 3)
      ])
      let val = await result
      expect(val).assertEqual(20)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_1700
     * @tc.desc   Verify PromiseLike.then with AsyncLock for 5 concurrent callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let lock = new AsyncLock()
      let results: number[] = []
      let promises: PromiseLike<void>[] = []
      for (let i = 0; i < 5; i++) {
        let p: PromiseLike<number> = Promise.resolve<number>(i)
        let r = p.then(async (value: number) => {
          await lock.lockAsync(() => {
            results.push(value)
          })
        })
        promises.push(r)
      }
      await Promise.all(promises.map(p => Promise.resolve(p)))
      expect(results.length).assertEqual(5)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_1800
     * @tc.desc   Verify PromiseLike.then with AsyncLock for 10 concurrent callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let lock = new AsyncLock()
      let results: number[] = []
      let promises: PromiseLike<void>[] = []
      for (let i = 0; i < 10; i++) {
        let p: PromiseLike<number> = Promise.resolve<number>(i)
        let r = p.then(async (value: number) => {
          await lock.lockAsync(() => {
            results.push(value)
          })
        })
        promises.push(r)
      }
      await Promise.all(promises.map(p => Promise.resolve(p)))
      expect(results.length).assertEqual(10)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_1900
     * @tc.desc   Verify PromiseLike.then with Promise.allSettled inside callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<number> = Promise.resolve<number>(42)
      let result = promise.then((value: number) => {
        return Promise.allSettled([Promise.resolve(value * 2), Promise.reject(new Error("err"))])
      })
      let val = await result
      expect(val.length).assertEqual(2)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_2000
     * @tc.desc   Verify PromiseLike.then with async callback and sequential awaits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: Promise<string> = Promise.resolve<string>("hello")
      let result = promise.then(async (value: string) => {
        let r1 = await Promise.resolve<string>(value + "_1")
        let r2 = await Promise.resolve<string>(r1 + "_2")
        return r2
      })
      let val = await result
      expect(val).assertEqual("hello_1_2")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_2100
     * @tc.desc   Verify PromiseLike.then returning null from onFulfilled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: Promise<string> = Promise.resolve<string>("hello")
      let result = promise.then((_value: string) => null)
      let val = await result
      expect(val).assertNull()
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_2200
     * @tc.desc   Verify PromiseLike.then returning undefined from onFulfilled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: Promise<string> = Promise.resolve<string>("hello")
      let result = promise.then((_value: string) => undefined)
      let val = await result
      expect(val).assertUndefined()
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_2300
     * @tc.desc   Verify PromiseLike.then onRejected returning null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: Promise<string> = Promise.reject<string>(new Error("failed"))
      let result = promise.then<string | null, string | null>(
        (value: string) => value,
        (_error: Error) => null
      )
      let val = await result
      expect(val).assertNull()
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_2400
     * @tc.desc   Verify PromiseLike.then onRejected returning undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: Promise<string> = Promise.reject<string>(new Error("failed"))
      let result = promise.then<string | undefined, string | undefined>(
        (value: string) => value,
        (_error: Error) => undefined
      )
      let val = await result
      expect(val).assertUndefined()
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_2500
     * @tc.desc   Verify PromiseLike.then with null input transforms to string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<null> = Promise.resolve<null>(null)
      let result = promise.then((_value: null) => "was null")
      let val = await result
      expect(val).assertEqual("was null")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_2600
     * @tc.desc   Verify PromiseLike.then with undefined input transforms to string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<undefined> = Promise.resolve<undefined>(undefined)
      let result = promise.then((_value: undefined) => "was undefined")
      let val = await result
      expect(val).assertEqual("was undefined")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_2700
     * @tc.desc   Verify PromiseLike.then with union type string|number conditional length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: Promise<string> = Promise.resolve<string>("hello")
      let result = promise.then<number>((value: string) => value.length)
      let val = await result
      expect(val).assertEqual(5)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest2800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_2800
     * @tc.desc   Verify PromiseLike.then with union type string|number returns number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<number> = Promise.resolve<number>(42)
      let result = promise.then<number>((value: number) => value)
      let val = await result
      expect(val).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest2900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_2900
     * @tc.desc   onRejected verifies Error instance and returns recovered string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: Promise<string> = Promise.reject<string>(new Error("failed"))
      let result = promise.then<string | number, string | number>(
        (value: string) => value,
        (error: Error): string | number => { expect(error instanceof Error).assertTrue(); return "recovered" }
      )
      let val = await result
      expect(val).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest3000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_3000
     * @tc.desc   Verify PromiseLike.then with union type string|number toUpperCase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: Promise<string> = Promise.resolve<string>("hello")
      let result = promise.then<string>((value: string) => value.toUpperCase())
      let val = await result
      expect(val).assertEqual("HELLO")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest3100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_3100
     * @tc.desc   Verify PromiseLike.then with empty string returns length 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: Promise<string> = Promise.resolve<string>("")
      let result = promise.then((value: string) => value.length)
      let val = await result
      expect(val).assertEqual(0)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest3200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_3200
     * @tc.desc   Verify PromiseLike.then with empty object interface transforms to string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {

      let promise: PromiseLike<EmptyObj> = Promise.resolve<EmptyObj>({})
      let result = promise.then((_value: EmptyObj) => "empty object")
      let val = await result
      expect(val).assertEqual("empty object")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest3300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_3300
     * @tc.desc   Verify PromiseLike.then with empty number array returns length 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<number[]> = Promise.resolve<number[]>([])
      let result = promise.then((value: number[]) => value.length)
      let val = await result
      expect(val).assertEqual(0)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest3400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_3400
     * @tc.desc   Verify PromiseLike.then with Number.MAX_SAFE_INTEGER increment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<number> = Promise.resolve<number>(Number.MAX_SAFE_INTEGER)
      let result = promise.then((value: number) => value + 1)
      let val = await result
      expect(val).assertEqual(Number.MAX_SAFE_INTEGER + 1)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest3500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_3500
     * @tc.desc   Verify PromiseLike.then with Number.MIN_SAFE_INTEGER decrement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<number> = Promise.resolve<number>(Number.MIN_SAFE_INTEGER)
      let result = promise.then((value: number) => value - 1)
      let val = await result
      expect(val).assertEqual(Number.MIN_SAFE_INTEGER - 1)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest3600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_3600
     * @tc.desc   Verify PromiseLike.then with NaN input returns isNaN true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<number> = Promise.resolve<number>(NaN)
      let result = promise.then((value: number) => isNaN(value))
      let val = await result
      expect(val).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest3700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_3700
     * @tc.desc   Verify PromiseLike.then loop chain increments 5 times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<number> = Promise.resolve<number>(1)
      let p = promise
      for (let i = 0; i < 5; i++) {
        p = p.then((value: number) => value + 1)
      }
      let val = await p
      expect(val).assertEqual(6)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest3800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_3800
     * @tc.desc   Verify PromiseLike.then chain transforms number to string with suffix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<number> = Promise.resolve<number>(1)
      let result = promise
        .then((value: number) => value.toString())
        .then((value: string) => value + "_suffix")
      let val = await result
      expect(val).assertEqual("1_suffix")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest3900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_3900
     * @tc.desc   Verify PromiseLike.then chain skips middle then after error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: Promise<string> = Promise.resolve<string>("hello")
      let result = promise
        .then((_value: string) => {
          throw new Error("Error in first then")
        })
        .then((value: string) => value.toUpperCase())
        .then(
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
     * @tc.name   PromiseLikeThenSecondTest4000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_4000
     * @tc.desc   Verify PromiseLike.then returning Promise resolves to uppercase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: Promise<string> = Promise.resolve<string>("hello")
      let result = promise.then((value: string) => {
        return Promise.resolve<string>(value.toUpperCase())
      })
      let val = await result
      expect(val).assertEqual("HELLO")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest4100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_4100
     * @tc.desc   Verify PromiseLike.then returning Promise.reject rejects with error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: Promise<string> = Promise.resolve<string>("hello")
      let result = promise.then((_value: string) => {
        return Promise.reject<string>(new Error("Rejected in then"))
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
     * @tc.name   PromiseLikeThenSecondTest4200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_4200
     * @tc.desc   Verify PromiseLike.then returning forever pending Promise times out
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: Promise<string> = Promise.resolve<string>("hello")
      let result = promise.then((value: string) => {
        return new Promise<string>((_resolve, _reject) => {
        })
      })
      let raceResult = await Promise.race([
        result,
        new Promise<string>((resolve) => resolve("timeout"))
      ])
      expect(raceResult).assertEqual("timeout")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest4300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_4300
     * @tc.desc   Verify PromiseLike.then with number multiplication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<number> = Promise.resolve<number>(42)
      let result = promise.then((value: number) => value * 2)
      let val = await result
      expect(val).assertEqual(84)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest4400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_4400
     * @tc.desc   Verify PromiseLike.then chain transforms number to string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<number> = Promise.resolve<number>(1)
      let result = promise
        .then((value: number) => value + 1)
        .then((value: number) => value.toString())
      let val = await result
      expect(val).assertEqual("2")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest4500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_4500
     * @tc.desc   Verify PromiseLike.then with toUpperCase transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: Promise<string> = Promise.resolve<string>("hello")
      let result = promise.then((value: string) => value.toUpperCase())
      let val = await result
      expect(val).assertEqual("HELLO")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest4600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_4600
     * @tc.desc   Verify PromiseLike.then direct and Promise return both resolve same value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<number> = Promise.resolve<number>(42)
      let result1 = promise.then((value: number) => value * 2)
      let result2 = promise.then((value: number) => Promise.resolve<number>(value * 2))
      let val1 = await result1
      let val2 = await result2
      expect(val1).assertEqual(84)
      expect(val2).assertEqual(84)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest4700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_4700
     * @tc.desc   Verify PromiseLike.then onRejected direct and Promise return both recover
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: Promise<string> = Promise.reject<string>(new Error("failed"))
      let result1 = promise.then<string>(
        (value: string) => value
      ).catch((error: Error) => { expect(error instanceof Error).assertTrue(); return "recovered" }
      )
      let result2 = promise.then<string>(
        (value: string) => value
      ).catch((error: Error) => { expect(error instanceof Error).assertTrue(); return Promise.resolve<string>("recovered") }
      )
      let val1 = await result1
      let val2 = await result2
      expect(val1).assertEqual("recovered")
      expect(val2).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest4800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_4800
     * @tc.desc   Verify PromiseLike.then asserts value type and returns length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: Promise<string> = Promise.resolve<string>("hello")
      let result = promise.then((value: string) => {
        expect(value instanceof string).assertTrue()
        return value.length
      })
      let val = await result
      expect(val).assertEqual(5)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest4900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_4900
     * @tc.desc   onRejected catch returns recovery value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: Promise<string> = Promise.reject<string>(new Error("failed"))
      let result = promise.then<string>(
        (value: string) => value
      ).catch(() => {
          return "recovered"
        }
      )
      let val = await result
      expect(val).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest5000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_5000
     * @tc.desc   Verify PromiseLike.then loop chain increments 100 times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseLikeThenSecondTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<number> = Promise.resolve<number>(0)
      let p = promise
      for (let i = 0; i < 100; i++) {
        p = p.then((value: number) => value + 1)
      }
      let val = await p
      expect(val).assertEqual(100)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest5100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_5100
     * @tc.desc   Verify PromiseLike.then loop chain increments 1000 times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseLikeThenSecondTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<number> = Promise.resolve<number>(0)
      let p = promise
      for (let i = 0; i < 1000; i++) {
        p = p.then((value: number) => value + 1)
      }
      let val = await p
      expect(val).assertEqual(1000)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest5200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_5200
     * @tc.desc   Verify PromiseLike.then with 100 parallel callbacks on same Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseLikeThenSecondTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<number> = Promise.resolve<number>(42)
      let results: number[] = []
      for (let i = 0; i < 100; i++) {
        promise.then((value: number) => {
          results.push(value)
          return value
        }).catch((error: Error) => { expect(error instanceof Error).assertTrue(); expect().assertFail() })
      }
      await Promise.resolve(promise)
      expect(results.length).assertEqual(100)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest5300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_5300
     * @tc.desc   Verify PromiseLike.then with 200 parallel callbacks on same Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseLikeThenSecondTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promise: PromiseLike<number> = Promise.resolve<number>(42)
      let results: number[] = []
      for (let i = 0; i < 200; i++) {
        promise.then((value: number) => {
          results.push(value)
          return value
        }).catch((error: Error) => { expect(error instanceof Error).assertTrue(); expect().assertFail() })
      }
      await Promise.resolve(promise)
      expect(results.length).assertEqual(200)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest5400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_5400
     * @tc.desc   then passes through large object with 3-element array property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseLikeThenSecondTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {

      let largeObject: LargeObject = {
        id: 1,
        data: ["data", "data", "data"]
      }
      let promise: PromiseLike<LargeObject> = Promise.resolve<LargeObject>(largeObject)
      let result = promise.then((value: LargeObject) => {
        expect(value.id).assertEqual(1)
        expect(value.data.length).assertEqual(3)
        return value
      })
      let val = await result
      expect(val.id).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest5500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_5500
     * @tc.desc   Verify PromiseLike.then with deeply nested object property access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseLikeThenSecondTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {

      let promise: PromiseLike<NestedObject> = Promise.resolve<NestedObject>(nestedObject)
      let result = promise.then((value: NestedObject) => {
        expect(value.level1.level2.level3.value).assertEqual(42)
        return value
      })
      let val = await result
      expect(val.level1.level2.level3.value).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest5600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_5600
     * @tc.desc   Verify PromiseLike.then with closure capturing external variable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseLikeThenSecondTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let externalValue = "external"
      let promise: Promise<string> = Promise.resolve<string>("hello")
      let result = promise.then((value: string) => {
        return value + externalValue
      })
      let val = await result
      expect(val).assertEqual("helloexternal")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest5700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_5700
     * @tc.desc   Verify PromiseLike.then onRejected with closure capturing external variable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseLikeThenSecondTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let externalValue = "recovered"
      let promise: Promise<string> = Promise.reject<string>(new Error("failed"))
      let result = promise.then<string>(
        (value: string) => value
      ).catch((_error: Error) => externalValue
      )
      let val = await result
      expect(val).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest5800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_5800
     * @tc.desc   Verify PromiseLike.then with circular reference object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseLikeThenSecondTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {

      let obj: CircularRef = { value: "test" }
      obj.ref = obj
      let promise: PromiseLike<CircularRef> = Promise.resolve<CircularRef>(obj)
      let result = promise.then((value: CircularRef) => {
        expect(value.value).assertEqual("test")
        return value
      })
      let val = await result
      expect(val.value).assertEqual("test")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest5900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_5900
     * @tc.desc   Verify PromiseLike.then with nested PromiseLike from outer Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let thenable: Promise<string> = Promise.resolve<string>("inner-value")
      let result = await Promise.resolve<string>("outer")
        .then<string>(() => {
          return thenable.then<string>((value: string) => value.toUpperCase())
        })
      expect(result).assertEqual("INNER-VALUE")
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest6000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_6000
     * @tc.desc   Verify PromiseLike.then with AtomicInt counter for 3 concurrent callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
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
     * @tc.name   PromiseLikeThenSecondTest6100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_6100
     * @tc.desc   Verify PromiseLike.then with AtomicInt counter for 5 concurrent callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
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
     * @tc.name   PromiseLikeThenSecondTest6200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_6200
     * @tc.desc   Verify PromiseLike.then with AtomicInt counter for 10 concurrent callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeThenSecondTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
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
     * @tc.name   PromiseLikeThenSecondTest6300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_6300
     * @tc.desc   Verify EAWorker.run callback nested PromiseLike.then
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseLikeThenSecondTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('thenableWorker')
      eaWorker.start()
      try {
        let job = eaWorker.run<int>(() => {
          return 42
        })
        let workerResult = job.Await()
        let thenable: PromiseLike<number> = Promise.resolve<number>(workerResult)
        let result = await thenable.then<number>((value: number) => value * 2)
        expect(result).assertEqual(84)
      } finally {
        eaWorker.join().Await()
      }
      Done();
    })

    /**
     * @tc.name   PromiseLikeThenSecondTest6400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_THEN_SECOND_TEST_6400
     * @tc.desc   EAWorker.run results drive PromiseLike.then completion counting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseLikeThenSecondTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let processedCount = new AtomicInt(0)
      let eaWorker = new EAWorker('msgThenableWorker')
      eaWorker.start()
      try {
        let job1 = eaWorker.run<string>((msg: string): string => {
          return msg
        }, "msg1")
        let job2 = eaWorker.run<string>((msg: string): string => {
          return msg
        }, "msg2")
        let job3 = eaWorker.run<string>((msg: string): string => {
          return msg
        }, "msg3")
        let jr1 = job1.Await();
        let thenable: PromiseLike<string> = Promise.resolve<string>(jr1)
        await thenable.then<void>(() => { processedCount.fetchAdd(1) })
        let jr2 = job2.Await();
        let thenable2: PromiseLike<string> = Promise.resolve<string>(jr2)
        await thenable2.then<void>(() => { processedCount.fetchAdd(1) })
        let jr3 = job3.Await();
        let thenable3: PromiseLike<string> = Promise.resolve<string>(jr3)
        await thenable3.then<void>(() => { processedCount.fetchAdd(1) })
        expect(processedCount.load()).assertEqual(3)
      } finally {
        eaWorker.join().Await()
      }
      Done();
    })

  })
}
