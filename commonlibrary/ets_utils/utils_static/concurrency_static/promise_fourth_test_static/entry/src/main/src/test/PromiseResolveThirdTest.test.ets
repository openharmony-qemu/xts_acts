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

class CustomPromiseLike<T> implements PromiseLike<T> {
  value: T
  constructor(value: T) { this.value = value }
  then<U, E>(onFulfilled: ((value: T) => U | PromiseLike<U>), onRejected?: ((reason: Error) => E | PromiseLike<E>)): PromiseLike<Awaited<U> | Awaited<E>> {
    if (onFulfilled) { onFulfilled(this.value) }
    return Promise.resolve<T>(this.value) as PromiseLike<Awaited<U> | Awaited<E>>
  }
}

class AsyncPromiseLike<T> implements PromiseLike<T> {
  value: T
  delay: int
  constructor(value: T, delay: int) { this.value = value; this.delay = delay }
  then<U, E>(onFulfilled: ((value: T) => U | PromiseLike<U>), onRejected?: ((reason: Error) => E | PromiseLike<E>)): PromiseLike<Awaited<U> | Awaited<E>> {
    if (onFulfilled) {
      setTimeout(() => { onFulfilled(this.value) }, this.delay)
    }
    return Promise.resolve<T>(this.value) as PromiseLike<Awaited<U> | Awaited<E>>
  }
}

class ThrowingPromiseLike<T> implements PromiseLike<T> {
  errorMsg: string
  constructor(errorMsg: string) { this.errorMsg = errorMsg }
  then<U, E>(onFulfilled: ((value: T) => U | PromiseLike<U>), onRejected?: ((reason: Error) => E | PromiseLike<E>)): PromiseLike<Awaited<U> | Awaited<E>> {
    throw new Error(this.errorMsg)
  }
}

interface ConfigResult {
  db: string
  api: string
  cache: string
}

export default function BuiltinsPromiseResolveThirdTest(): void {
  describe('BuiltinsPromiseResolveThirdTest', (): void => {
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
     * @tc.name   PromiseResolveThirdTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_0100
     * @tc.desc   Verify Promise.resolve then handler receives resolved value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveThirdTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("success")
      let result = ""
      promise.then((value) => {
        result = value
      })
      await promise
      expect(result).assertEqual("success")
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_0200
     * @tc.desc   Verify Promise.resolve with number type resolves to 99
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveThirdTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<number>(99)
      let result = await promise
      expect(result).assertEqual(99)
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_0300
     * @tc.desc   Verify Promise.resolve then chain with arithmetic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveThirdTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<number>(1)
      let result = await promise
        .then(x => x + 1)
        .then(x => x * 2)
        .then(x => x + 3)
      expect(result).assertEqual(7)
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_0400
     * @tc.desc   Verify Promise.resolve with null value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveThirdTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<null>(null)
      let result = await promise
      expect(result).assertNull()
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_0500
     * @tc.desc   Verify Promise.resolve with rejected Promise input propagates rejection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveThirdTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let rejectedPromise = Promise.reject<number>(new Error("original reject"))
      let promise = Promise.resolve<number>(rejectedPromise)
      try {
        await promise
        expect().assertFail()
      } catch (error) {
        let e = error
        expect(e instanceof Error).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_0600
     * @tc.desc   Verify Promise.resolve with rejected Promise input caught as Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveThirdTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let caught: boolean = false
      try {
        let rejectedPromise = Promise.reject<string>(new Error("catch test"))
        let promise = Promise.resolve<string>(rejectedPromise)
        await promise
        expect().assertFail()
      } catch (error) {
        caught = true
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_0700
     * @tc.desc   Verify Promise.resolve with try-finally executes finally block
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveThirdTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let finallyExecuted = false
      try {
        let promise = Promise.resolve<number>(42)
        await promise
      } finally {
        finallyExecuted = true
      }
      expect(finallyExecuted).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_0800
     * @tc.desc   Verify Promise.resolve with string resolves to the value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveThirdTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve<string>("test")
      expect(result).assertEqual("test")
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_0900
     * @tc.desc   Verify awaiting resolved Promise returns the value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveThirdTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("test")
      let result = await promise
      expect(result).assertEqual("test")
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_1000
     * @tc.desc   Verify Promise.resolve with await inside async function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveThirdTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let testAwait: () => Promise<void> = async (): Promise<void> => {
        let result = await Promise.resolve<string>("async test");
        expect(result).assertEqual("async test");
      };
      await testAwait()
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_1100
     * @tc.desc   Verify Promise.resolve returned from async function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveThirdTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let getValue: () => Promise<number> = async (): Promise<number> => {
        return await Promise.resolve<number>(100);
      };
      let result = await getValue()
      expect(result).assertEqual(100)
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_1200
     * @tc.desc   Verify Promise.resolve then chain with type transformation number to string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveThirdTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve<number>(1)
        .then(x => x + 1)
        .then(x => x * 2)
        .then(x => "value: " + x)
      expect(result).assertEqual("value: 4")
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_1300
     * @tc.desc   Verify Promise.resolve then throwing error caught by catch with recovery
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveThirdTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve<number>(10)
        .then(x => {
          if (x > 5) throw new Error("too large")
          return x
        })
        .catch(() => {
          return -1
        })
      expect(result).assertEqual(-1)
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_1400
     * @tc.desc   Verify Promise.resolve then with finally handler executes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveThirdTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let finallyCalled = false
      let result = await Promise.resolve<number>(5)
        .then(x => x * 2)
        .finally(() => {
          finallyCalled = true
        })
      expect(result).assertEqual(10)
      expect(finallyCalled).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_1500
     * @tc.desc   Verify Promise.resolve with async PromiseLike thenable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveThirdTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let thenable = new AsyncPromiseLike<string>("delayed", 100)
      let promise = Promise.resolve<string>(thenable)
      let result = await promise
      expect(result).assertEqual("delayed")
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_1600
     * @tc.desc   Verify Promise.resolve with Promise.all for multiple values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveThirdTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = [
        Promise.resolve<number>(1),
        Promise.resolve<number>(2),
        Promise.resolve<number>(3)
      ]
      let results = await Promise.all(promises)
      expect(results[0]).assertEqual(1)
      expect(results[1]).assertEqual(2)
      expect(results[2]).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_1700
     * @tc.desc   Verify Promise.resolve with Promise.allSettled mixed results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveThirdTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = [
        Promise.resolve<string>("success"),
        Promise.reject<string>(new Error("fail"))
      ]
      let results = await Promise.allSettled(promises)
      expect(results[0].status).assertEqual("fulfilled")
      expect(results[1].status).assertEqual("rejected")
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_1800
     * @tc.desc   Verify Promise.resolve can be awaited multiple times with same result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveThirdTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<number>(42)
      let result1 = await promise
      let result2 = await promise
      let result3 = await promise
      expect(result1).assertEqual(42)
      expect(result2).assertEqual(42)
      expect(result3).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_1900
     * @tc.desc   Verify Promise.resolve multiple then handlers on same Promise execute in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveThirdTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("test")
      let results: string[] = []
      let count = 0
      promise.then(v => { results.push(v + "1"); count++ })
      promise.then(v => { results.push(v + "2"); count++ })
      promise.then(v => { results.push(v + "3"); count++ })
      while (count < 3) {
        await new Promise<void>((resolve: (value: void) => void, _reject: (reason: Error) => void): void => {
          setTimeout(() => { resolve(undefined) }, 100)
        })
      }
      expect(results.length).assertEqual(3)
      expect(results[0]).assertEqual("test1")
      expect(results[1]).assertEqual("test2")
      expect(results[2]).assertEqual("test3")
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_2000
     * @tc.desc   Verify Promise.resolve with PromiseLike number thenable resolves value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveThirdTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let thenable = new CustomPromiseLike<number>(100.0)
      let promise = Promise.resolve<number>(thenable)
      let result = await promise
      expect(result).assertEqual(100)
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_2100
     * @tc.desc   Verify Promise.resolve with Promise.all and then side effects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveThirdTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: number[] = []
      let promises = [
        Promise.resolve<number>(1).then(v => { results.push(v) }),
        Promise.resolve<number>(2).then(v => { results.push(v) }),
        Promise.resolve<number>(3).then(v => { results.push(v) })
      ]
      await Promise.all(promises)
      expect(results.length).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_2200
     * @tc.desc   Verify Promise.resolve then chain preserves execution order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveThirdTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let order: number[] = []
      await Promise.resolve<number>(0)
        .then(x => { order.push(1); return x + 1 })
        .then(x => { order.push(2); return x + 1 })
        .then(x => { order.push(3); return x + 1 })
      expect(order[0]).assertEqual(1)
      expect(order[1]).assertEqual(2)
      expect(order[2]).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_2300
     * @tc.desc   Verify Promise.resolve with throwing thenable rejects with Error instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveThirdTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let thenable = new ThrowingPromiseLike<string>("Error: Detailed message with path /src/test/file.ets:42")
      try {
        let promise = Promise.resolve<string>(thenable)
        await promise
        expect().assertFail()
      } catch (error) {
        let e = error
        expect(e instanceof Error).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_2400
     * @tc.desc   Verify Promise.resolve with number type resolves to 42
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveThirdTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<number>(42)
      let result = await promise
      expect(result).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_2500
     * @tc.desc   Verify Promise.resolve with string type resolves to test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveThirdTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("test")
      let result = await promise
      expect(result).assertEqual("test")
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_2600
     * @tc.desc   Verify Promise.resolve with nested Promise unwraps value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveThirdTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let innerPromise = Promise.resolve<string>("nested")
      let promise = Promise.resolve<Promise<string>>(innerPromise)
      let result = await promise
      expect(result).assertEqual("nested")
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_2700
     * @tc.desc   Verify Promise.resolve with triple nested Promise unwraps deeply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveThirdTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let innerInnerPromise = Promise.resolve<number>(99)
      let innerPromise = Promise.resolve<number>(innerInnerPromise)
      let promise = Promise.resolve<number>(innerPromise)
      let result = await promise
      expect(result).assertEqual(99)
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest2800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_2800
     * @tc.desc   Verify Promise.resolve with Promise|string|number union type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveThirdTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<Promise<string> | number>(Promise.resolve<string>("text"))
      let result1 = await promise1
      expect(result1).assertEqual("text")
      let promise2 = Promise.resolve<Promise<string> | number>(100)
      let result2 = await promise2
      expect(result2).assertEqual(100)
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest2900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_2900
     * @tc.desc   Verify Promise.resolve with function return value cached across awaits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveThirdTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let computeExpensiveValue: () => number = (): number => {
        return 42;
      };
      let cachedPromise = Promise.resolve<number>(computeExpensiveValue())
      let result1 = await cachedPromise
      let result2 = await cachedPromise
      expect(result1).assertEqual(42)
      expect(result2).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest3000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_3000
     * @tc.desc   Verify Promise.resolve used as fast path in conditional Promise function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveThirdTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let fetchData: (id: number) => Promise<string> = (id: number): Promise<string> => {
        if (id === 0) {
          return Promise.resolve<string>("default");
        }
        return new Promise<string>(resolve => resolve("data-" + id));
      };
      let result1 = await fetchData(0)
      expect(result1).assertEqual("default")
      let result2 = await fetchData(1)
      expect(result2).assertEqual("data-1")
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest3100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_3100
     * @tc.desc   Verify Promise.resolve used as mock API call return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveThirdTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let mockApiCall: () => Promise<string> = (): Promise<string> => {
        return Promise.resolve<string>("mock data");
      };
      let result = await mockApiCall()
      expect(result).assertEqual("mock data")
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest3200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_3200
     * @tc.desc   Verify Promise.resolve then chain building config object step by step
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveThirdTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let config: ConfigResult = { db: "", api: "", cache: "" }
      let result = await Promise.resolve<ConfigResult>(config)
        .then<ConfigResult>((cfg: ConfigResult): ConfigResult => {
          cfg.db = "mysql"
          return cfg
        })
        .then<ConfigResult>((cfg: ConfigResult): ConfigResult => {
          cfg.api = "rest"
          return cfg
        })
        .then<ConfigResult>((cfg: ConfigResult): ConfigResult => {
          cfg.cache = "redis"
          return cfg
        })
      expect(result.db).assertEqual("mysql")
      expect(result.api).assertEqual("rest")
      expect(result.cache).assertEqual("redis")
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest3300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_3300
     * @tc.desc   Verify Promise.resolve then returning inner Promise unwraps value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveThirdTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve<string>("outer")
        .then(() => {
          return Promise.resolve<string>("inner-resolved")
        })
      expect(result).assertEqual("inner-resolved")
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest3400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_3400
     * @tc.desc   Verify Promise.resolve with Promise.all 3 concurrent then handlers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveThirdTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = 0
      let promises: Promise<void>[] = []
      for (let i = 0; i < 3; i++) {
        promises.push(
          Promise.resolve<number>(i).then(() => {
            counter++
          })
        )
      }
      await Promise.all(promises)
      expect(counter).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest3500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_3500
     * @tc.desc   Verify Promise.resolve with Promise.all 5 concurrent then handlers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveThirdTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = 0
      let promises: Promise<void>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(
          Promise.resolve<number>(i).then(() => {
            counter++
          })
        )
      }
      await Promise.all(promises)
      expect(counter).assertEqual(5)
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest3600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_3600
     * @tc.desc   Verify Promise.resolve with Promise.all 10 concurrent then handlers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveThirdTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = 0
      let promises: Promise<void>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(
          Promise.resolve<number>(i).then(() => {
            counter++
          })
        )
      }
      await Promise.all(promises)
      expect(counter).assertEqual(10)
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest3700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_3700
     * @tc.desc   Verify Promise.resolve then with string toUpperCase transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveThirdTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve<string>("value")
        .then((v) => v.toUpperCase())
      expect(result).assertEqual("VALUE")
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest3800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_3800
     * @tc.desc   Verify Promise.resolve then chain with string concatenation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveThirdTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve<string>("test")
        .then((v) => {
          expect(v).assertEqual("test")
          return v + "1"
        })
        .then((v) => v + "2")
      expect(result).assertEqual("test12")
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest3900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_3900
     * @tc.desc   Verify Promise.resolve then chain with toUpperCase and concatenation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveThirdTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve<string>("test")
        .then((v) => v.toUpperCase())
        .then((v) => v + "!")
      expect(result).assertEqual("TEST!")
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest4000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_4000
     * @tc.desc   Verify Promise.resolve then/catch/finally chain with resolved value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveThirdTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("value")
      let finallyCalled = false
      let result = await promise
        .then((v) => v)
        .catch(() => "recovered")
        .finally(() => { finallyCalled = true })
      expect(result).assertEqual("value")
      expect(finallyCalled).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest4100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_4100
     * @tc.desc   Verify Promise.resolve then chain with arithmetic add multiply subtract
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveThirdTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve<number>(1)
        .then((x) => x + 1)
        .then((x) => x * 2)
        .then((x) => x - 1)
      expect(result).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest4200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_4200
     * @tc.desc   Verify Promise.resolve then returning inner Promise with concatenation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveThirdTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve<string>("hello")
        .then((v) => Promise.resolve<string>(v + " world"))
      expect(result).assertEqual("hello world")
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest4300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_4300
     * @tc.desc   Verify Promise.resolve then throwing error is caught with Error instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveThirdTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let caught: boolean = false
      await Promise.resolve<string>("test")
        .then(() => { throw new Error("error") })
        .catch((error) => {
          caught = true
          expect(error instanceof Error).assertTrue()
        })
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest4400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_4400
     * @tc.desc   Verify Promise.resolve then with finally handler preserves value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveThirdTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let finallyCalled = false
      let result = await Promise.resolve<string>("test")
        .then((v) => v)
        .finally(() => { finallyCalled = true })
      expect(result).assertEqual("test")
      expect(finallyCalled).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest4500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_4500
     * @tc.desc   Verify Promise.resolve with Promise.all for string values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveThirdTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let results = await Promise.all([
        Promise.resolve<string>("a"),
        Promise.resolve<string>("b"),
        Promise.resolve<string>("c")
      ])
      expect(results[0]).assertEqual("a")
      expect(results[1]).assertEqual("b")
      expect(results[2]).assertEqual("c")
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest4600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_4600
     * @tc.desc   Verify Promise.resolve with Promise.allSettled mixed fulfilled and rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveThirdTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let results = await Promise.allSettled([
        Promise.resolve<string>("ok"),
        Promise.reject<string>(new Error("fail"))
      ])
      expect(results[0].status).assertEqual("fulfilled")
      expect(results[1].status).assertEqual("rejected")
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest4700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_4700
     * @tc.desc   Verify Promise.resolve with Promise.race wins over delayed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveThirdTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.race([
        Promise.resolve<string>("fast"),
        new Promise<string>((resolve: (value: string) => void, _reject: (reason: Error) => void): void => {
          setTimeout(() => { resolve("slow") }, 200)
        })
      ])
      expect(result).assertEqual("fast")
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest4800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_4800
     * @tc.desc   Verify Promise.resolve with Promise.any returns first resolved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveThirdTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.any([
        Promise.resolve<string>("first"),
        Promise.resolve<string>("second")
      ])
      expect(result).assertEqual("first")
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest4900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_4900
     * @tc.desc   Verify Promise.resolve with Promise.all 50 concurrent then handlers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveThirdTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promises: Promise<void>[] = []
      let resolvedCount = new AtomicInt(0)
      for (let i = 0; i < 50; i++) {
        promises.push(Promise.resolve<number>(i).then(() => { resolvedCount.fetchAdd(1) }))
      }
      await Promise.all(promises)
      expect(promises.length).assertEqual(50)
      expect(resolvedCount.load()).assertEqual(50)
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest5000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_5000
     * @tc.desc   Verify Promise.resolve then with zero value pass-through
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveThirdTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve<number>(0)
        .then((x) => x)
      expect(result).assertEqual(0)
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest5100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_5100
     * @tc.desc   Verify Promise.resolve then with false value pass-through
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveThirdTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve<boolean>(false)
        .then((x) => x)
      expect(result).assertFalse()
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest5200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_5200
     * @tc.desc   Verify Promise.resolve then with empty string pass-through
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveThirdTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve<string>("")
        .then((x) => x)
      expect(result).assertEqual("")
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest5300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_5300
     * @tc.desc   Verify Promise.resolve then with null value pass-through
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveThirdTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve<null>(null)
        .then((x) => x)
      expect(result).assertNull()
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest5400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_5400
     * @tc.desc   Verify Promise.resolve then with undefined value pass-through
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveThirdTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve<undefined>(undefined)
        .then((x) => x)
      expect(result).assertUndefined()
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest5500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_5500
     * @tc.desc   Verify Promise.resolve then with object pass-through
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveThirdTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let obj: Record<string, string> = { "name": "test" }
      let result = await Promise.resolve<Record<string, string>>(obj)
        .then((x: Record<string, string>): Record<string, string> => x)
      expect(result["name"]).assertEqual("test")
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest5600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_5600
     * @tc.desc   Verify Promise.resolve then with array pass-through
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveThirdTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let arr: number[] = [1.0, 2.0, 3.0]
      let result = await Promise.resolve<number[]>(arr)
        .then((x) => x)
      expect(result.length).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest5700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_5700
     * @tc.desc   Verify Promise.resolve then returns new Promise instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveThirdTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<string>("a")
      let promise2 = promise1.then((v) => v)
      expect(promise1 === promise2).assertFalse()
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest5800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_5800
     * @tc.desc   Verify Promise.resolve then with number to string conversion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveThirdTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve<number>(42)
        .then((x) => x.toString())
      expect(result).assertEqual("42")
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest5900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_5900
     * @tc.desc   Verify Promise.resolve then with string to number conversion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveThirdTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve<string>("42")
        .then((x) => parseInt(x))
      expect(result).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest6000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_6000
     * @tc.desc   Verify Promise.resolve then with number to boolean conversion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveThirdTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve<number>(3)
        .then((x) => x > 0)
      expect(result).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest6100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_6100
     * @tc.desc   Verify Promise.resolve then with boolean to number conversion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveThirdTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve<boolean>(true)
        .then((x) => x ? 1 : 0)
      expect(result).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest6200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_6200
     * @tc.desc   Verify Promise.resolve then with array to length conversion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveThirdTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve<number[]>([1, 2, 3])
        .then((arr) => arr.length)
      expect(result).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest6300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_6300
     * @tc.desc   Verify Promise.resolve then with string split operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveThirdTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve<string>("hello world")
        .then((s) => s.split(" "))
      expect(result.length).assertEqual(2)
      expect(result[0]).assertEqual("hello")
      expect(result[1]).assertEqual("world")
      Done();
    })

    /**
     * @tc.name   PromiseResolveThirdTest6400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_THIRD_TEST_6400
     * @tc.desc   Verify Promise.resolve with Promise.all 100 concurrent then handlers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveThirdTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promises: Promise<void>[] = []
      let resolvedCount = new AtomicInt(0)
      for (let i = 0; i < 100; i++) {
        promises.push(Promise.resolve<number>(i).then(() => { resolvedCount.fetchAdd(1) }))
      }
      await Promise.all(promises)
      expect(promises.length).assertEqual(100)
      expect(resolvedCount.load()).assertEqual(100)
      Done();
    })
  })
}
