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
  constructor(value: T) {
    this.value = value
  }
  then<U, E>(onFulfilled: ((value: T) => U | PromiseLike<U>), onRejected?: ((reason: Error) => E | PromiseLike<E>)): PromiseLike<Awaited<U> | Awaited<E>> {
    if (onFulfilled) {
      onFulfilled(this.value)
    }
    return Promise.resolve<T>(this.value) as PromiseLike<Awaited<U> | Awaited<E>>
  }
}

class CustomError extends Error {
  errorCode: number
  constructor(message: string, errorCode: number) {
    super(message)
    this.name = "CustomError"
    this.errorCode = errorCode
  }
}

class SharedCounter {
  count: number = 0
  async increment(): Promise<number> {
    this.count++
    return this.count
  }
  getCount(): number {
    return this.count
  }
}

class EventEmitter {
  listeners: Map<string, (() => void)[]> = new Map<string, (() => void)[]>()
  on(event: string, callback: () => void) {
    if (!this.listeners.has(event)) {
      this.listeners.set(event, [])
    }
    this.listeners.get(event)!.push(callback)
  }
  emit(event: string) {
    let callbacks = this.listeners.get(event)
    if (callbacks) {
      callbacks.forEach(cb => cb())
    }
  }
}

function anyFixedArrayFunc(): string {
  return "taskpool-success";
}

function anySetFunc(): string {
  return "taskpool-success";
}

export default function BuiltinsPromiseAnySecondTest(): void {
  describe('BuiltinsPromiseAnySecondTest', (): void => {
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
     * @tc.name   PromiseAnySecondTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_0100
     * @tc.desc   Verify Promise.any with single resolved string promise in Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnySecondTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.resolve("test"))
      let result = await Promise.any<string>(promises)
      expect(result).assertEqual("test")
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_0200
     * @tc.desc   Verify Promise.any with single resolved number promise in Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<number>>()
      promises.add(Promise.resolve<number>(1.0))
      let result = await Promise.any<number>(promises)
      expect(result).assertEqual(1.0)
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_0300
     * @tc.desc   Verify Promise.any with multiple resolved promises returns one of them
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnySecondTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.resolve("first"))
      promises.add(Promise.resolve("second"))
      let result = await Promise.any<string>(promises)
      expect(result === "first" || result === "second").assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_0400
     * @tc.desc   Verify Promise.any ignores rejected promises when a resolved one exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnySecondTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.reject<string>(new Error("failed")))
      promises.add(Promise.resolve("success"))
      let result = await Promise.any<string>(promises)
      expect(result).assertEqual("success")
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_0500
     * @tc.desc   Verify Promise.any throws AggregateError when all promises reject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnySecondTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.reject<string>(new Error("error1")))
      promises.add(Promise.reject<string>(new Error("error2")))
      try {
        await Promise.any<string>(promises)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof AggregateError).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_0600
     * @tc.desc   Verify Promise.any with custom iterable object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let iterable = new Set<string|PromiseLike<string>>()
      iterable.add(Promise.resolve<string>("custom"))
      iterable.add(Promise.resolve<string>("iterable"))
      let result = await Promise.any<string>(iterable)
      expect(result === "custom" || result === "iterable").assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_0700
     * @tc.desc   Verify Promise.any with array of promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnySecondTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises: Promise<string>[] = [
        Promise.resolve("a"),
        Promise.resolve("b")
      ]
      let result = await Promise.any<string>(promises)
      expect(result === "a" || result === "b").assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_0800
     * @tc.desc   Verify Promise.any throws AggregateError with empty iterable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnySecondTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let emptyIterable = new Set<Promise<string>>()
      try {
        await Promise.any<string>(emptyIterable)
        expect().assertFail()
      } catch (error) {
        if (error instanceof AggregateError) {
          expect(error.errors.length).assertEqual(0)
        }
      }
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_0900
     * @tc.desc   Verify Promise.any throws TypeError with null input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      try {
        await Promise.any<string>(null as Object as Iterable<string|PromiseLike<string>>)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof TypeError).assertFalse()
      }
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_1000
     * @tc.desc   Verify Promise.any throws TypeError with undefined input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      try {
        await Promise.any<string>(undefined as Object as Iterable<string|PromiseLike<string>>)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof TypeError).assertFalse()
      }
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_1100
     * @tc.desc   Verify Promise.any handles iterator that throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      try {
        let promises = new Set<string|PromiseLike<string>>()
        let promiseLike = new CustomPromiseLike<string>("test")
        promises.add(promiseLike)
        let result = await Promise.any<string>(promises)
        expect(result === "test").assertTrue()
      } catch (error) {
        expect().assertFail()
      }
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_1200
     * @tc.desc   Verify Promise.any with non-Promise values in Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let values = new Set<number>()
      values.add(1)
      values.add(2)
      let result = await Promise.any<number>(values)
      expect(result === 1 || result === 2).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_1300
     * @tc.desc   Verify Promise.any with mixed plain values and promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let mixed = new Set<string|PromiseLike<string>>()
      mixed.add("plain")
      mixed.add(Promise.resolve("promise"))
      let result = await Promise.any<string>(mixed)
      expect(result === "plain" || result === "promise").assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_1400
     * @tc.desc   Verify Promise.any with PromiseLike object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
            let promiseLike = new CustomPromiseLike<number>(42.0)
      let iterable = new Set<number|PromiseLike<number>>()
      iterable.add(promiseLike)
      let result = await Promise.any<number>(iterable)
      expect(result).assertEqual(42.0)
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_1500
     * @tc.desc   Verify Promise.any with null value in Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let values = new Set<string|null>()
      values.add(null)
      values.add("value")
      let result = await Promise.any<string|null>(values)
      expect(result === null || result === "value").assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_1600
     * @tc.desc   Verify Promise.any with undefined value in Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let values = new Set<string|undefined>()
      values.add(undefined)
      values.add("value")
      let result = await Promise.any<string|undefined>(values)
      expect(result === undefined || result === "value").assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_1700
     * @tc.desc   Verify Promise.any with multiple number promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnySecondTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<number>>()
      promises.add(Promise.resolve<number>(100.0))
      promises.add(Promise.resolve<number>(200.0))
      let result = await Promise.any<number>(promises)
      expect(result === 100.0 || result === 200.0).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_1800
     * @tc.desc   Verify Promise.any with object type promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let user: Record<string, Object> = { "id": 1 as Object, "name": "Alice" as Object }
      let promises = new Set<Promise<Record<string, Object>>>()
      promises.add(Promise.resolve(user))
      let result = await Promise.any<Record<string, Object>>(promises)
      expect(result["id"]).assertEqual(1)
      expect(result["name"]).assertEqual("Alice")
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_1900
     * @tc.desc   Verify Promise.any with union type promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string|number>>()
      promises.add(Promise.resolve<string|number>("text"))
      promises.add(Promise.resolve<string|number>(123))
      let result = await Promise.any<string|number>(promises)
      expect(typeof result === "string" || typeof result === "number").assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_2000
     * @tc.desc   Verify Promise.any resolves with the fastest resolving promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnySecondTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(new Promise<string>((resolve) => {
        setTimeout(() => resolve("fast"), 100)
      }))
      promises.add(new Promise<string>((resolve) => {
        setTimeout(() => resolve("slow"), 200)
      }))
      let result = await Promise.any<string>(promises)
      expect(result).assertEqual("fast")
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_2100
     * @tc.desc   Verify Promise.any with single resolved string promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnySecondTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.resolve("only"))
      let result = await Promise.any<string>(promises)
      expect(result).assertEqual("only")
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_2200
     * @tc.desc   Verify Promise.any with three number promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<number>>()
      promises.add(Promise.resolve<number>(1.0))
      promises.add(Promise.resolve<number>(2.0))
      promises.add(Promise.resolve<number>(3.0))
      let result = await Promise.any<number>(promises)
      expect([1.0, 2.0, 3.0].indexOf(result) >= 0).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_2300
     * @tc.desc   Verify Promise.any resolving to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string|null>>()
      promises.add(Promise.resolve<string|null>(null))
      let result = await Promise.any<string|null>(promises)
      expect(result).assertEqual(null)
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_2400
     * @tc.desc   Verify Promise.any resolving to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string|undefined>>()
      promises.add(Promise.resolve<string|undefined>(undefined))
      let result = await Promise.any<string|undefined>(promises)
      expect(result).assertEqual(undefined)
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_2500
     * @tc.desc   Verify Promise.any with empty object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<object>>()
      promises.add(Promise.resolve<object>({}))
      let result = await Promise.any<object>(promises)
      expect(Object.keys(result).length).assertEqual(0)
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_2600
     * @tc.desc   Verify Promise.any with empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<number[]>>()
      promises.add(Promise.resolve<number[]>([]))
      let result = await Promise.any<number[]>(promises)
      expect(result.length).assertEqual(0)
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_2700
     * @tc.desc   Verify Promise.any with zero value (falsy)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<number>>()
      promises.add(Promise.resolve<number>(0.0))
      let result = await Promise.any<number>(promises)
      expect(result).assertEqual(0.0)
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest2800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_2800
     * @tc.desc   Verify Promise.any with false value (falsy)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<boolean>>()
      promises.add(Promise.resolve(false))
      let result = await Promise.any<boolean>(promises)
      expect(result).assertFalse()
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest2900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_2900
     * @tc.desc   Verify Promise.any with empty string (falsy)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.resolve(""))
      let result = await Promise.any<string>(promises)
      expect(result).assertEqual("")
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest3000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_3000
     * @tc.desc   Verify Promise.any returns a Promise instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnySecondTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.resolve("test"))
      let resultPromise = Promise.any<string>(promises)
      let result = await resultPromise
      expect(result).assertEqual("test")
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest3100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_3100
     * @tc.desc   Verify Promise.any with nested promise (auto-flattening)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<string|PromiseLike<string>>()
      promises.add(Promise.resolve<string>("nested"))
      let result = await Promise.any<string>(promises)
      expect(result).assertEqual("nested")
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest3200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_3200
     * @tc.desc   Verify Promise.any result has then method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnySecondTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<number>>()
      promises.add(Promise.resolve<number>(42.0))
      let resultPromise = Promise.any<number>(promises)
      let result = await resultPromise
      expect(result).assertEqual(42.0)
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest3300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_3300
     * @tc.desc   Verify Promise.any with Number.MAX_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnySecondTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<number>>()
      promises.add(Promise.resolve(Number.MAX_VALUE))
      let result = await Promise.any<number>(promises)
      expect(result).assertEqual(Number.MAX_VALUE)
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest3400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_3400
     * @tc.desc   Verify Promise.any with Number.MIN_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnySecondTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<number>>()
      promises.add(Promise.resolve(Number.MIN_VALUE))
      let result = await Promise.any<number>(promises)
      expect(result).assertEqual(Number.MIN_VALUE)
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest3500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_3500
     * @tc.desc   Verify Promise.any with long string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnySecondTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let longString = "a".repeat(10000)
      let promises = new Set<Promise<string>>()
      promises.add(Promise.resolve(longString))
      let result = await Promise.any<string>(promises)
      expect(result.length).assertEqual(10000)
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest3600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_3600
     * @tc.desc   Verify Promise.any with large array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnySecondTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let largeArray: number[] = []
      for (let i = 0; i < 1000; i++) {
        largeArray.push(i)
      }
      let promises = new Set<Promise<number[]>>()
      promises.add(Promise.resolve(largeArray))
      let result = await Promise.any<number[]>(promises)
      expect(result.length).assertEqual(1000)
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest3700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_3700
     * @tc.desc   Verify Promise.any chained with then for value transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnySecondTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<number>>()
      promises.add(Promise.resolve<number>(10.0))
      let result = await Promise.any<number>(promises)
        .then<number>(value => value * 2.0)
        .then<number>(value => value + 5.0)
      expect(result).assertEqual(25.0)
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest3800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_3800
     * @tc.desc   Verify Promise.any chained with catch for error recovery
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnySecondTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.reject<string>(new Error("fail")))
      let result = await Promise.any<string>(promises)
        .catch<string>(() => "recovered")
      expect(result).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest3900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_3900
     * @tc.desc   Verify Promise.any chained with finally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnySecondTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let finallyCalled = false
      let promises = new Set<Promise<string>>()
      promises.add(Promise.resolve("success"))
      let result = await Promise.any<string>(promises)
        .finally(() => {
          finallyCalled = true
        })
      expect(result).assertEqual("success")
      expect(finallyCalled).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest4000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_4000
     * @tc.desc   Verify AggregateError name property when all promises reject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnySecondTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.reject<string>(new Error("error1")))
      promises.add(Promise.reject<string>(new Error("error2")))
      try {
        await Promise.any<string>(promises)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof AggregateError).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest4100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_4100
     * @tc.desc   Verify AggregateError contains all error messages when all reject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnySecondTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.reject<string>(new Error("error1")))
      promises.add(Promise.reject<string>(new Error("error2")))
      promises.add(Promise.reject<string>(new Error("error3")))
      try {
        await Promise.any<string>(promises)
        expect().assertFail()
      } catch (error) {
        if (error instanceof AggregateError) {
          expect(error.errors.length).assertEqual(3)
        }
      }
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest4200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_4200
     * @tc.desc   Verify AggregateError has message property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.reject<string>(new Error("fail")))
      try {
        await Promise.any<string>(promises)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof AggregateError).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest4300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_4300
     * @tc.desc   Verify AggregateError preserves custom error properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<CustomError>>()
      promises.add(Promise.reject<CustomError>(new CustomError("custom", 500)))
      try {
        await Promise.any<CustomError>(promises)
        expect().assertFail()
      } catch (error) {
        if (error instanceof AggregateError) {
          let firstError: Error = error.errors[0]
          expect(firstError instanceof CustomError).assertTrue()
        }
      }
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest4400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_4400
     * @tc.desc   Verify Promise.any handles throwing iterable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      try {
        let promises = new Set<Promise<string>>()
        promises.add(Promise.reject<string>(new Error("Sync iterator error")))
        let result = await Promise.any<string>(promises)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof AggregateError).assertTrue();
      }
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest4500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_4500
     * @tc.desc   Verify Promise.any throws AggregateError with single rejected promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnySecondTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.reject<string>(new Error("rejected")))
      try {
        await Promise.any<string>(promises)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof AggregateError).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest4600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_4600
     * @tc.desc   Verify Promise.any does not throw when at least one resolves
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnySecondTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.resolve("success"))
      let caught = false
      try {
        let result = await Promise.any<string>(promises)
        expect(result).assertEqual("success")
      } catch (error) {
        caught = true
      }
      expect(caught).assertFalse()
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest4700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_4700
     * @tc.desc   Verify catch block is triggered when all promises reject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnySecondTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.reject<string>(new Error("fail")))
      let caught = false
      try {
        await Promise.any<string>(promises)
      } catch (error) {
        caught = true
        expect(error instanceof AggregateError).assertTrue()
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest4800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_4800
     * @tc.desc   Verify finally block executes on successful resolve
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnySecondTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.resolve("success"))
      let finallyCalled = false
      try {
        let result = await Promise.any<string>(promises)
        expect(result).assertEqual("success")
      } catch (error) {
        expect().assertFail()
      } finally {
        finallyCalled = true
      }
      expect(finallyCalled).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest4900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_4900
     * @tc.desc   Verify catch handler receives AggregateError with error details
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.reject<string>(new Error("error1")))
      promises.add(Promise.reject<string>(new Error("error2")))
      let result = await Promise.any<string>(promises).catch<string>((error: Error) => {
        if (error instanceof AggregateError) {
          let messages = ""
          for (let i = 0; i < error.errors.length; i++) {
            if (i > 0) messages = messages + ", "
            messages = messages + error.errors[i].message
          }
          return "All failed: " + messages
        }
        return "All failed"
      })
      expect(result).assertContain("All failed")
      expect(result).assertContain("error1")
      expect(result).assertContain("error2")
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest5000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_5000
     * @tc.desc   Verify Promise.any resolves with the first timed promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnySecondTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(new Promise<string>((resolve) => {
        setTimeout(() => resolve("first"), 100)
      }))
      promises.add(new Promise<string>((resolve) => {
        setTimeout(() => resolve("second"), 100)
      }))
      promises.add(new Promise<string>((resolve) => {
        setTimeout(() => resolve("third"), 150)
      }))
      let result = await Promise.any<string>(promises)
      expect(result).assertEqual("first")
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest5100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_5100
     * @tc.desc   Verify Promise.any resolves with delayed promise after immediate reject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnySecondTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.reject<string>(new Error("immediate reject")))
      promises.add(new Promise<string>((resolve) => {
        setTimeout(() => resolve("delayed resolve"), 100)
      }))
      let result = await Promise.any<string>(promises)
      expect(result).assertEqual("delayed resolve")
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest5200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_5200
     * @tc.desc   Verify Promise.any throws AggregateError with delayed rejections
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnySecondTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(new Promise<string>((_, reject) => {
        setTimeout(() => reject(new Error("error1")), 100)
      }))
      promises.add(new Promise<string>((_, reject) => {
        setTimeout(() => reject(new Error("error2")), 100)
      }))
      try {
        await Promise.any<string>(promises)
        expect().assertFail()
      } catch (error) {
        if (error instanceof AggregateError) {
          expect(error.errors.length).assertEqual(2)
        }
      }
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest5300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_5300
     * @tc.desc   Verify Promise.any with two number promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnySecondTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<number>>()
      promises.add(Promise.resolve<number>(1.0))
      promises.add(Promise.resolve<number>(2.0))
      let result = await Promise.any<number>(promises)
      expect([1.0, 2.0].indexOf(result) >= 0).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest5400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_5400
     * @tc.desc   Verify Promise.any resolves with faster promise regardless of insertion order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnySecondTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(new Promise<string>((resolve) => {
        setTimeout(() => resolve("slow"), 300)
      }))
      promises.add(new Promise<string>((resolve) => {
        setTimeout(() => resolve("fast"), 100)
      }))
      let result = await Promise.any<string>(promises)
      expect(result).assertEqual("fast")
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest5500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_5500
     * @tc.desc   Verify Promise.any resolves with first promise and tracks execution order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let order: string[] = []
      let promises = new Set<Promise<string>>()
      promises.add(new Promise<string>((resolve) => {
        setTimeout(() => {
          order.push("first")
          resolve("first")
        }, 50)
      }))
      promises.add(new Promise<string>((resolve) => {
        setTimeout(() => {
          order.push("second")
          resolve("second")
        }, 150)
      }))
      let result = await Promise.any<string>(promises)
      expect(result).assertEqual("first")
      await new Promise<number>((resolve) => { setTimeout(() => resolve(0), 300) })
      expect(order[0]).assertEqual("first")
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest5600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_5600
     * @tc.desc   Verify Promise.any ignores pending promise when another resolves
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      let pendingPromise = new Promise<string>(() => {})
      promises.add(new Promise<string>((resolve) => {
        setTimeout(() => resolve("resolved"), 100)
      }))
      promises.add(pendingPromise)
      let result = await Promise.any<string>(promises)
      expect(result).assertEqual("resolved")
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest5700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_5700
     * @tc.desc   Verify Promise.any with already resolved promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnySecondTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.resolve("already resolved"))
      let result = await Promise.any<string>(promises)
      expect(result).assertEqual("already resolved")
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest5800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_5800
     * @tc.desc   Verify Promise.any with already rejected and resolved promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnySecondTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.reject<string>(new Error("already rejected")))
      promises.add(Promise.resolve("valid"))
      let result = await Promise.any<string>(promises)
      expect(result).assertEqual("valid")
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest5900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_5900
     * @tc.desc   Verify Promise.any with shared counter incrementing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = new SharedCounter()
      let promises = new Set<Promise<number>>()
      for (let i = 0; i < 5; i++) {
        promises.add(counter.increment())
      }
      let result = await Promise.any<number>(promises)
      expect(result >= 1 && result <= 5).assertTrue()
      expect(counter.getCount()).assertEqual(5)
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest6000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_6000
     * @tc.desc   Verify Promise.any with shared state modification by timed promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let sharedState: string = ""
      let promises = new Set<Promise<string>>()
      promises.add(new Promise<string>((resolve) => {
        setTimeout(() => {
          sharedState = "first"
          resolve("first")
        }, 50)
      }))
      promises.add(new Promise<string>((resolve) => {
        setTimeout(() => {
          sharedState = "second"
          resolve("second")
        }, 150)
      }))
      let result = await Promise.any<string>(promises)
      expect(result).assertEqual("first")
      expect(sharedState).assertEqual("first")
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest6100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_6100
     * @tc.desc   Verify Promise.any result can be used in chained string expression
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.resolve("inner"))
      let inner = await Promise.any<string>(promises)
      let result = "outer: " + inner
      expect(result).assertEqual("outer: inner")
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest6200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_6200
     * @tc.desc   Verify deeply nested sequential Promise.any calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises3 = new Set<Promise<string>>()
      promises3.add(Promise.resolve("deep"))
      let result3 = await Promise.any<string>(promises3)
      let promises2 = new Set<Promise<string>>()
      promises2.add(Promise.resolve(result3))
      let result2 = await Promise.any<string>(promises2)
      let promises1 = new Set<Promise<string>>()
      promises1.add(Promise.resolve(result2))
      let result = await Promise.any<string>(promises1)
      expect(result).assertEqual("deep")
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest6300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_6300
     * @tc.desc   Verify Promise.any with setTimeout-resolved promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(new Promise<string>((resolve) => {
        setTimeout(() => resolve("timer resolved"), 100)
      }))
      let result = await Promise.any<string>(promises)
      expect(result).assertEqual("timer resolved")
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest6400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_6400
     * @tc.desc   Verify Promise.any with multiple timed promises resolves with first
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<number>>()
      promises.add(new Promise<number>((resolve) => {
        setTimeout(() => resolve(1.0), 100)
      }))
      promises.add(new Promise<number>((resolve) => {
        setTimeout(() => resolve(2.0), 100)
      }))
      promises.add(new Promise<number>((resolve) => {
        setTimeout(() => resolve(3.0), 150)
      }))
      let result = await Promise.any<number>(promises)
      expect(result).assertEqual(1.0)
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest6500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_6500
     * @tc.desc   Verify Promise.any with cancelled timer promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnySecondTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      let promise = new Promise<string>((resolve) => {
        let timer = setTimeout(() => {
          resolve("cancelled timer")
        }, 100)
        clearTimeout(timer)
      })
      promises.add(promise)
      promises.add(Promise.resolve("valid"))
      let result = await Promise.any<string>(promises)
      expect(result).assertEqual("valid")
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest6600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_6600
     * @tc.desc   Verify sequential chained Promise.any with value passing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises1 = new Set<Promise<number>>()
      promises1.add(Promise.resolve<number>(1.0))
      let result1 = await Promise.any<number>(promises1)
      let promises2 = new Set<Promise<number>>()
      promises2.add(Promise.resolve<number>(result1 + 1.0))
      let result2 = await Promise.any<number>(promises2)
      let promises3 = new Set<Promise<number>>()
      promises3.add(Promise.resolve<number>(result2 + 1.0))
      let result = await Promise.any<number>(promises3)
      expect(result).assertEqual(3.0)
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest6700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_6700
     * @tc.desc   Verify Promise.any combined with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises1 = new Set<Promise<string>>()
      promises1.add(Promise.resolve("a1"))
      promises1.add(Promise.resolve("a2"))
      let promises2 = new Set<Promise<string>>()
      promises2.add(Promise.resolve("b1"))
      promises2.add(Promise.resolve("b2"))
      let results = await Promise.all([
        Promise.any<string>(promises1),
        Promise.any<string>(promises2)
      ])
      expect(["a1", "a2"].indexOf(results[0]) >= 0).assertTrue()
      expect(["b1", "b2"].indexOf(results[1]) >= 0).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest6800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_6800
     * @tc.desc   Verify sequential then parallel Promise.any execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises1 = new Set<Promise<string>>()
      promises1.add(Promise.resolve("step1"))
      let step1 = await Promise.any<string>(promises1)
      let promises2a = new Set<Promise<string>>()
      promises2a.add(Promise.resolve(step1 + "-a"))
      let promises2b = new Set<Promise<string>>()
      promises2b.add(Promise.resolve(step1 + "-b"))
      let results = await Promise.all([
        Promise.any<string>(promises2a),
        Promise.any<string>(promises2b)
      ])
      expect(results[0]).assertEqual("step1-a")
      expect(results[1]).assertEqual("step1-b")
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest6900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_6900
     * @tc.desc   Verify Promise.any with shared data and multiple timeouts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnySecondTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let sharedData: number = 0
      let promises = new Set<Promise<number>>()
      for (let i = 0; i < 5; i++) {
        promises.add(new Promise<number>((resolve) => {
          setTimeout(() => {
            sharedData++
            resolve(sharedData)
          }, 50 + i * 20)
        }))
      }
      let result = await Promise.any<number>(promises)
      expect(result >= 1 && result <= 5).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest7000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_7000
     * @tc.desc   Verify Promise.any resolves with first promise modifying shared state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnySecondTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let state: number = 0
      let promises = new Set<Promise<number>>()
      promises.add(new Promise<number>((resolve) => {
        setTimeout(() => {
          state = 1
          resolve(state)
        }, 50)
      }))
      promises.add(new Promise<number>((resolve) => {
        setTimeout(() => {
          state = 2
          resolve(state)
        }, 150)
      }))
      let result = await Promise.any<number>(promises)
      expect(result).assertEqual(1.0)
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest7100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_7100
     * @tc.desc   Verify Promise.any with cancellation flag pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnySecondTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let cancelled = false
      let promises = new Set<Promise<string>>()
      let pendingPromise = new Promise<string>((resolve, reject) => {
        setTimeout(() => {
          if (!cancelled) {
            resolve("completed")
          } else {
            reject(new Error("cancelled"))
          }
        }, 300)
      })
      promises.add(pendingPromise)
      promises.add(new Promise<string>((resolve) => {
        setTimeout(() => resolve("immediate"), 100)
      }))
      let result = await Promise.any<string>(promises)
      expect(result).assertEqual("immediate")
      cancelled = true
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest7200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_7200
     * @tc.desc   Verify Promise.any with fast-resolving promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnySecondTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.resolve("fast"))
      let result = await Promise.any<string>(promises)
      expect(result).assertEqual("fast")
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest7300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_7300
     * @tc.desc   Verify Promise.any with Promise.race timeout pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnySecondTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.resolve("success"))
      let result: string
      try {
        let raceResult = await Promise.race([
          Promise.any<string>(promises),
          new Promise<string>((_, reject) => {
            setTimeout(() => reject(new Error("Timeout")), 500)
          })
        ])
        result = raceResult
      } catch (error) {
        result = "fallback"
      }
      expect(result).assertEqual("success")
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest7400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_7400
     * @tc.desc   Verify retry pattern with Promise.any until success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnySecondTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let attempts = 0
      let result: string = ""
      for (let i = 0; i < 3; i++) {
        attempts++
        let promises = new Set<Promise<string>>()
        if (attempts < 3) {
          promises.add(Promise.reject<string>(new Error("attempt " + attempts.toString())))
        } else {
          promises.add(Promise.resolve("success"))
        }
        try {
          result = await Promise.any<string>(promises)
          break
        } catch (error) {
          if (i === 2) {
            result = "failed"
          }
        }
      }
      expect(result).assertEqual("success")
      expect(attempts).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest7500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_7500
     * @tc.desc   Verify Promise.any with EventEmitter integration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnySecondTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let emitter = new EventEmitter()
      let promises = new Set<Promise<string>>()
      promises.add(new Promise<string>((resolve) => {
        emitter.on("data", () => resolve("event triggered"))
      }))
      setTimeout(() => emitter.emit("data"), 100)
      let result = await Promise.any<string>(promises)
      expect(result).assertEqual("event triggered")
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest7600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_7600
     * @tc.desc   Verify Promise.any with multiple timed event promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnySecondTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(new Promise<string>((resolve) => {
        setTimeout(() => resolve("event1"), 100)
      }))
      promises.add(new Promise<string>((resolve) => {
        setTimeout(() => resolve("event2"), 100)
      }))
      promises.add(new Promise<string>((resolve) => {
        setTimeout(() => resolve("event3"), 150)
      }))
      let result = await Promise.any<string>(promises)
      expect(result).assertEqual("event1")
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest7700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_7700
     * @tc.desc   Verify Promise.any with mixed reject and resolve
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnySecondTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.reject<string>(new Error("error")))
      promises.add(Promise.resolve("success"))
      let result = await Promise.any<string>(promises)
      expect(result).assertEqual("success")
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest7800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_7800
     * @tc.desc   Verify Promise.any captures side effects from resolving promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let successFlag = 0
      let promises = new Set<Promise<number>>()
      promises.add(new Promise<number>((resolve) => {
        successFlag = 1
        resolve(1.0)
      }))
      promises.add(Promise.reject<number>(new Error("error")))
      let result = await Promise.any<number>(promises)
      expect(successFlag).assertEqual(1)
      expect(result).assertEqual(1.0)
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest7900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_7900
     * @tc.desc   Verify Promise.any tracks first success with shared flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnySecondTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let firstSuccess: string = ""
      let promises = new Set<Promise<string>>()
      promises.add(new Promise<string>((resolve) => {
        if (!firstSuccess) firstSuccess = "first"
        resolve("first")
      }))
      promises.add(new Promise<string>((resolve) => {
        if (!firstSuccess) firstSuccess = "second"
        resolve("second")
      }))
      await Promise.any<string>(promises)
      expect(firstSuccess).assertEqual("first")
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest8000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_8000
     * @tc.desc   Verify Promise.any result can be stored in Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnySecondTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.reject<string>(new Error("error")))
      promises.add(Promise.resolve("success"))
      let result = await Promise.any<string>(promises)
      let resultMap: Map<string, string> = new Map<string, string>()
      resultMap.set("winner", result)
      expect(resultMap.get("winner")).assertEqual("success")
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest8100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_8100
     * @tc.desc   Verify Promise.any with large number of promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnySecondTest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<number>>()
      for (let i = 0; i < 100; i++) {
        promises.add(Promise.resolve<number>(i * 1.0))
      }
      let result = await Promise.any<number>(promises)
      expect(result >= 0 && result < 100).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest8200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_8200
     * @tc.desc   Verify AggregateError message and error details
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.reject<string>(new Error("All promises rejected")))
      try {
        await Promise.any<string>(promises)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof AggregateError).assertTrue();
      }
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest8300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_8300
     * @tc.desc   Verify Promise.any inside then chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve("outer")
        .then<string>(() => {
          let promises = new Set<Promise<string>>()
          promises.add(Promise.resolve("inner-success"))
          promises.add(Promise.reject<string>(new Error("inner-error")))
          return Promise.any<string>(promises)
        })
      expect(result).assertEqual("inner-success")
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest8400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_8400
     * @tc.desc   Verify then callbacks execute with Promise.any (3 promises)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = 0
      let promises = new Set<Promise<number>>()
      for (let i = 0; i < 3; i++) {
        promises.add(Promise.resolve<number>(i * 1.0).then<number>(() => {
          counter++
          return i * 1.0
        }))
      }
      await Promise.any<number>(promises)
      expect(counter > 0).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest8500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_8500
     * @tc.desc   Verify then callbacks execute with Promise.any (5 promises)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = 0
      let promises = new Set<Promise<number>>()
      for (let i = 0; i < 5; i++) {
        promises.add(Promise.resolve<number>(i * 1.0).then<number>(() => {
          counter++
          return i * 1.0
        }))
      }
      await Promise.any<number>(promises)
      expect(counter > 0).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest8600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_8600
     * @tc.desc   Verify then callbacks execute with Promise.any (10 promises)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnySecondTest8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = 0
      let promises = new Set<Promise<number>>()
      for (let i = 0; i < 10; i++) {
        promises.add(Promise.resolve<number>(i * 1.0).then<number>(() => {
          counter++
          return i * 1.0
        }))
      }
      await Promise.any<number>(promises)
      expect(counter > 0).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest8700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_8700
     * @tc.desc   Verify Promise.any with worker-like success/reject pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnySecondTest8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.resolve("worker-success"))
      promises.add(Promise.reject<string>(new Error("worker-error")))
      let result = await Promise.any<string>(promises)
      expect(result).assertEqual("worker-success")
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest8800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_8800
     * @tc.desc   Verify Promise.any processes exactly one result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnySecondTest8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let processedCount = 0
      let promises = new Set<Promise<string>>()
      promises.add(Promise.resolve("a"))
      promises.add(Promise.resolve("b"))
      promises.add(Promise.resolve("c"))
      let result = await Promise.any<string>(promises)
      processedCount++
      expect(processedCount).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest8900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_8900
     * @tc.desc   Verify Promise.any with worker success and error rejection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnySecondTest8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      let worker1 = new Promise<string>((resolve) => {
        setTimeout(() => resolve("worker1-success"), 100)
      })
      let worker2 = new Promise<string>((_, reject) => {
        setTimeout(() => reject(new Error("worker2-error")), 100)
      })
      promises.add(worker1)
      promises.add(worker2)
      let result = await Promise.any<string>(promises)
      expect(result).assertEqual("worker1-success")
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest9000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_9000
     * @tc.desc   Verify Promise.any with forEach-created promises and counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnySecondTest9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let processedCount = 0
      let promises = new Set<Promise<string>>()
      let items: string[] = ["a", "b", "c"]
      items.forEach((s: string) => { promises.add(Promise.resolve(s)) })
      let result = await Promise.any<string>(promises)
      processedCount++
      expect(processedCount).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest9100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_9100
     * @tc.desc   Verify Promise.any resolves when one promise resolves among rejections
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnySecondTest9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.reject<string>(new Error("error1")))
      promises.add(Promise.reject<string>(new Error("error2")))
      promises.add(Promise.resolve("success"))
      let result = await Promise.any<string>(promises)
      expect(result).assertEqual("success")
      Done();
    })

    /**
     * @tc.name   PromiseAnySecondTest9200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_SECOND_TEST_9200
     * @tc.desc   EAWorker.run callback nested Promise.any
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnySecondTest9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('anyWorker');
      eaWorker.start();

      let job = eaWorker.run<int>((a: int, b: int, c: int, d: int): int => {
        if (a > 0) return a;
        if (b > 0) return b;
        if (c > 0) return c;
        return d;
      }, -1, 2, -3, 4);

      let workerResult = job.Await();
      let promises: Promise<int>[] = [Promise.resolve(workerResult)];
      let result = await Promise.any<int>(promises);
      expect(result).assertEqual(2);

      await eaWorker.join();
      Done();
    })

  })
}
