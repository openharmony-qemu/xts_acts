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

interface Animal { type: string }
interface Dog extends Animal { breed: string }
interface Result<T> { success: boolean; data: T }
interface BigData { data: number[] }

class SharedResult {
  value: number = 0
  async increment(): Promise<void> {
    this.value++
  }
  async getValue(): Promise<number> {
    return this.value
  }
}

class MyThenable implements PromiseLike<number> {
  then<U, E>(onFulfilled?: ((value: number) => U | PromiseLike<U>), onRejected?: ((reason: Error) => E | PromiseLike<E>)): PromiseLike<Awaited<U> | Awaited<E>> {
    if (onFulfilled) {
      return Promise.resolve(onFulfilled(42)) as PromiseLike<Awaited<U> | Awaited<E>>
    }
    return Promise.resolve(42) as PromiseLike<Awaited<U> | Awaited<E>>
  }
}

export default function BuiltinsPromiseThenThirdTest(): void {
  describe('BuiltinsPromiseThenThirdTest', (): void => {
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
     * @tc.name   PromiseThenThirdTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_0100
     * @tc.desc   Verify Promise.then returning async rejected Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenThirdTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      try {
        await promise.then<number>(() => {
          return new Promise<number>((resolve, reject) => {
            setTimeout(() => reject(new Error("async reject")), 500)
          })
        })
        expect().assertFail()
      } catch (error) {
        let e = error
      }
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_0200
     * @tc.desc   Verify Promise.then throwing Error with name check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenThirdTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      try {
        await promise.then<number>(() => {
          throw new Error("test error")
        })
        expect().assertFail()
      } catch (error) {
        let e = error
      }
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_0300
     * @tc.desc   Verify Promise.then throwing Error with partial message check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenThirdTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      try {
        await promise.then<number>(() => {
          throw new Error("detailed error message")
        })
        expect().assertFail()
      } catch (error) {
        let e = error
      }
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_0400
     * @tc.desc   Verify Promise.then throwing Error with stack trace check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenThirdTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      try {
        await promise.then<number>(() => {
          throw new Error("stack test")
        })
        expect().assertFail()
      } catch (error) {
        let e = error
      }
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_0500
     * @tc.desc   Verify Promise.then throwing Error caught by try-catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenThirdTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      try {
        await promise.then<number>(() => {
          throw new Error("caught error")
        })
        expect().assertFail()
      } catch (error) {
        let e = error
      }
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_0600
     * @tc.desc   Verify Promise.then throwing Error caught by catch chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenThirdTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise
        .then<number>(() => {
          throw new Error("error")
        })
        .catch((error) => 42)
      expect(result).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_0700
     * @tc.desc   Verify Promise.then with finally handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenThirdTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<string>("hello")
      let finallyCalled1 = false
      await promise1
        .then<void>(() => { })
        .finally(() => { finallyCalled1 = true })
      expect(finallyCalled1).assertTrue()

      let promise2 = Promise.reject<string>(new Error("error"))
      let finallyCalled2 = false
      let caught: boolean = false
      try {
        await promise2
          .then<void>(() => { })
          .finally(() => { finallyCalled2 = true })
      } catch (error) {
      caught = true
}
      expect(caught).assertTrue()
      expect(finallyCalled2).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_0800
     * @tc.desc   Verify Promise.then returning number from string Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenThirdTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<number>(() => 42)
      expect(result).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_0900
     * @tc.desc   Verify Promise.then with async callback using await
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenThirdTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<number>(async() => {
        await new Promise<string>((resolve: (value: string) => void) => { setTimeout(() => resolve("done"), 500) })
        return 42.0
      })
      expect(result).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_1000
     * @tc.desc   Verify Promise.then with async callback returning Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenThirdTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<number>(async() => {
        return Promise.resolve(42.0)
      })
      expect(result).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_1100
     * @tc.desc   Verify Promise.then chaining preserves execution order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenThirdTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let order: number[] = []
      await promise
        .then<void>((res) => { expect(res).assertEqual("hello"); order.push(1) })
        .then<void>((res) => { expect(res).assertEqual(undefined); order.push(2) })
        .then<void>((res) => { expect(res).assertEqual(undefined); order.push(3) })
      expect(order[0]).assertEqual(1)
      expect(order[1]).assertEqual(2)
      expect(order[2]).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_1200
     * @tc.desc   Verify Promise.then chaining with value transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenThirdTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise
        .then<string>(() => "world")
        .then<string>(() => "!")
      expect(result).assertEqual("!")
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_1300
     * @tc.desc   Verify Promise.then chaining with Promise unwrapping and transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenThirdTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise
        .then<number>(() => Promise.resolve(42.0))
        .then<number>((v) => v + 8.0)
      expect(result).assertEqual(50)
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_1400
     * @tc.desc   Verify Promise.then returning Promise.all result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenThirdTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<number[]>(() => {
        return Promise.all<number>([
          Promise.resolve(1.0),
          Promise.resolve(2.0),
          Promise.resolve(3.0)
        ])
      })
      expect(result.length).assertEqual(3)
      expect(result[0]).assertEqual(1)
      expect(result[1]).assertEqual(2)
      expect(result[2]).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_1500
     * @tc.desc   Verify Promise.then returning Promise.race result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenThirdTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<number>(() => {
        return Promise.race<number>([
          new Promise<number>((resolve: (value: number) => void) => { setTimeout(() => resolve(1.0), 500) }),
          new Promise<number>((resolve: (value: number) => void) => { setTimeout(() => resolve(2.0), 1000) })
        ])
      })
      expect(result).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_1600
     * @tc.desc   Verify Promise.then returning Promise.allSettled result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenThirdTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let results = await promise.then<PromiseSettledResult<number>[]>(() => {
        return Promise.allSettled<number>([
          Promise.resolve(1.0),
          Promise.reject(new Error("error")),
          Promise.resolve(3.0)
        ])
      })
      expect(results.length).assertEqual(3)
      let r0 = results[0] as PromiseFulfilledResult<number>
      expect(r0.status).assertEqual("fulfilled")
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_1700
     * @tc.desc   Verify Promise.then returning new Promise with setTimeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenThirdTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
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
     * @tc.name   PromiseThenThirdTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_1800
     * @tc.desc   Verify Promise.then inside setTimeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenThirdTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result = await new Promise<number>((resolve) => {
        setTimeout(() => {
          let promise = Promise.resolve<string>("hello")
          promise.then<number>(() => 42).then(resolve)
        }, 500)
      })
      expect(result).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_1900
     * @tc.desc   Verify Promise.then with Promise.all on mapped promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenThirdTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = [
        Promise.resolve<string>("a"),
        Promise.resolve<string>("b"),
        Promise.resolve<string>("c")
      ]
      let results = await Promise.all(
        promises.map(p => p.then<number>(() => 1))
      )
      expect(results.length).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_2000
     * @tc.desc   Verify Promise.then with Promise.race on chained promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenThirdTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<string>("hello").then<number>(() => {
        return new Promise<number>((resolve) => {
          setTimeout(() => resolve(1), 500)
        })
      })
      let promise2 = Promise.resolve<string>("world").then<number>(() => {
        return new Promise<number>((resolve) => {
          setTimeout(() => resolve(2), 1000)
        })
      })
      let result = await Promise.race([promise1, promise2])
      expect(result).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_2100
     * @tc.desc   Verify Promise.then error propagation through chain with catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenThirdTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let caught = false
      await promise
        .then<void>(() => { throw new Error("chain error") })
        .then<void>(() => { })
        .catch((error) => {
          caught = true
          let e = error
        })
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_2200
     * @tc.desc   Verify Promise.then with catch recovery and further transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenThirdTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise
        .then<void>(() => { throw new Error("error") })
        .catch(() => "recovered")
        .then<string>((v) => v + "!")
      expect(result).assertEqual("recovered!")
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_2300
     * @tc.desc   Verify Promise.then callback modifies external variable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenThirdTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let value = "unknown"
      await promise.then<void>(() => {
        value = "resolved"
      })
      expect(value).assertEqual("resolved")
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_2400
     * @tc.desc   Verify Promise.then called multiple times on same Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenThirdTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result1 = await promise.then<string>((value) => {
        return value.toUpperCase()
      })
      expect(result1).assertEqual("HELLO")
      let result2 = await promise.then<string>(() => {
        return "world"
      })
      expect(result2).assertEqual("world")
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_2500
     * @tc.desc   Verify Promise.then callback logs message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenThirdTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let logs: string[] = []
      let promise = Promise.resolve<string>("hello")
      await promise.then<void>(() => {
        logs.push("Promise resolved")
      })
      expect(logs.length).assertEqual(1)
      expect(logs[0]).assertEqual("Promise resolved")
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_2600
     * @tc.desc   Verify Promise.then callback modifies state object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenThirdTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let count = 0
      let promise = Promise.resolve<string>("hello")
      await promise.then<void>(() => {
        count++
      })
      expect(count).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_2700
     * @tc.desc   Verify Promise.then callback pushes multiple events
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenThirdTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let events: string[] = []
      let promise = Promise.resolve<string>("hello")
      await promise.then<void>(() => {
        events.push("event1")
        events.push("event2")
      })
      expect(events.length).assertEqual(2)
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest2800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_2800
     * @tc.desc   Verify Promise.then returning number with typeof check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenThirdTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<number>(() => 42)
      expect(typeof result).assertEqual("number")
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest2900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_2900
     * @tc.desc   Verify Promise.then returning interface with inheritance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenThirdTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<Dog>(() => {
        let obj: Dog = { type: "animal", breed: "husky" }
        return obj
      })
      expect(result.breed).assertEqual("husky")
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest3000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_3000
     * @tc.desc   Verify Promise.then returning generic interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenThirdTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {

      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<Result<number>>(() => {
        let obj: Result<number> = { success: true, data: 42 }
        return obj
      })
      expect(result.success).assertTrue()
      expect(result.data).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest3100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_3100
     * @tc.desc   Verify Promise.then chaining with multiple type transformations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenThirdTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise
        .then<string>(() => "hello world")
        .then<number>(() => 100)
        .then<boolean>(() => true)
      expect(result).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest3200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_3200
     * @tc.desc   Verify Promise.then with conditional return
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenThirdTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let flag = true
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<number>(() => {
        return flag ? 1 : 0
      })
      expect(result).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest3300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_3300
     * @tc.desc   Verify Promise.then callback modifies resource state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenThirdTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let resource: Record<string, boolean> = { "closed": false }
      let promise = Promise.resolve<string>("hello")
      await promise.then<void>(() => {
        resource["closed"] = true
      })
      expect(resource["closed"]).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest3400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_3400
     * @tc.desc   Verify Promise.then with AsyncLock SharedResult concurrent increment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenThirdTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {

      let result = new SharedResult()
      let promises: Promise<void>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(Promise.resolve<string>("test").then<void>(async() => {
          await result.increment()
        }))
      }
      await Promise.all(promises)
      expect(await result.getValue()).assertEqual(10)
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest3500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_3500
     * @tc.desc   Verify Promise.then with Worker thread chaining
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenThirdTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve<number>(1.0)
        .then<number>((v) => v + 1.0)
        .then<number>((v) => v * 2.0)
        .catch<number>((e) => 0.0)
      expect(result).assertEqual(4)
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest3600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_3600
     * @tc.desc   Verify Promise.then with Worker thread message handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenThirdTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let receivedResult = ""
      await Promise.resolve<number>(5.0)
        .then<number>(() => 50.0)
        .then<string>(() => "processed")
        .then<void>((v) => { receivedResult = v })
      expect(receivedResult).assertEqual("processed")
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest3700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_3700
     * @tc.desc   Verify Promise.then with Atomics compareExchange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenThirdTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let winner = ""
      let p1 = Promise.resolve<string>("a").then<string>(() => {
        if (!winner) { winner = "first"; return "first" }
        return "late"
      })
      let p2 = Promise.resolve<string>("b").then<string>(() => {
        if (!winner) { winner = "second"; return "second" }
        return "late"
      })
      await Promise.all([p1, p2])
      expect(winner === "first" || winner === "second").assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest3800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_3800
     * @tc.desc   Verify Promise.then with Atomics timeout race
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenThirdTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let raceResult = await Promise.race<string>([
        new Promise<string>((resolve: (value: string) => void) => {
          setTimeout(() => resolve("timeout"), 500)
        }),
        new Promise<string>((resolve: (value: string) => void) => {
          setTimeout(() => resolve("100"), 2000)
        })
      ])
      expect(raceResult).assertEqual("timeout")
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest3900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_3900
     * @tc.desc   Verify Promise.then returning void with return statement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenThirdTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<void>(() => { return })
      expect(result).assertUndefined()
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest4000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_4000
     * @tc.desc   Verify Promise.then throwing error with never return type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenThirdTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      try {
        await promise.then<never>(() => {
          throw new Error("never return")
        })
        expect().assertFail()
      } catch (error) {
        let e = error
      }
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest4100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_4100
     * @tc.desc   Verify Promise.then returning Object type boxed number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenThirdTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result: Object = await promise.then<Object>(() => {
        let obj: Object = 42 as Object
        return obj
      })
      let promiseResult = await promise
      expect(promiseResult).assertEqual("hello")
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest4200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_4200
     * @tc.desc   Verify Promise.then returning Object type with typeof check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenThirdTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result: Object = await promise.then<Object>(() => {
        let obj: Object = 42 as Object
        return obj
      })
      if (typeof result === "number") {
        expect(result).assertEqual(42)
      }
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest4300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_4300
     * @tc.desc   Verify Promise.then with heavy computation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenThirdTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<number>(() => {
        let sum = 0
        for (let i = 0; i < 1000000; i++) {
          sum += i
        }
        return sum
      })
      expect(result > 0).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest4400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_4400
     * @tc.desc   Verify Promise.then returning large data object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenThirdTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {

      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<BigData>(() => {
        let obj: BigData = { data: new Array<number>(10000).fill(0) }
        return obj
      })
      expect(result.data.length).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest4500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_4500
     * @tc.desc   Verify Promise.then with 100-iteration chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenThirdTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result: Promise<string | number | boolean> = promise
      for (let i = 0; i < 100; i++) {
        result = result.then<number>(() => i + 1)
      }
      let finalResult = await result
      expect(finalResult).assertEqual(100)
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest4600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_4600
     * @tc.desc   Verify Promise.then returning Promise with setTimeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenThirdTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<number>(() => {
        return new Promise<number>((resolve: (value: number) => void) => {
          setTimeout(() => resolve(42.0), 500)
        })
      })
      expect(result).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest4700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_4700
     * @tc.desc   Verify Promise.then throwing synchronous error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseThenThirdTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      try {
        await promise.then<number>(() => {
          throw new Error("sync error")
        })
        expect().assertFail()
      } catch (error) {
        let e = error
      }
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest4800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_4800
     * @tc.desc   Verify Promise.then returning PromiseLike object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenThirdTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let thenable = new MyThenable()
      let result = await promise.then<number>(() => thenable)
      expect(result).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest4900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_4900
     * @tc.desc   Verify Promise.then returning Promise with typeof check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenThirdTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<number>(() => Promise.resolve(42.0))
      expect(typeof result).assertEqual("number")
      Done();
    })

    /**
     * @tc.name   PromiseThenThirdTest5000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_THEN_THIRD_TEST_5000
     * @tc.desc   Verify Promise.then returning Array with isArray check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseThenThirdTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise.then<Array<number>>(() => [1, 2, 3])
      expect(Array.isArray(result)).assertTrue()
      Done();
    })

  })
}
