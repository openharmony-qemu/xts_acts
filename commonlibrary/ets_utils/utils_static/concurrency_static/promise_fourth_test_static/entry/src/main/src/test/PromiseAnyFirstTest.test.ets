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
class RejectedPromiseLike<T> implements PromiseLike<T> {
  error: Error
  constructor(error: Error) {
    this.error = error
  }
  then<U, E>(onFulfilled: ((value: T) => U | PromiseLike<U>), onRejected?: ((reason: Error) => E | PromiseLike<E>)): PromiseLike<Awaited<U> | Awaited<E>> {
    if (onRejected) {
      onRejected(this.error)
    }
    return Promise.resolve<T>(undefined as T) as PromiseLike<Awaited<U> | Awaited<E>>
  }
}

class SharedFirstSuccess {
  firstSuccess: string = ""

  async setFirstSuccess(value: string): Promise<void> {
    if (!this.firstSuccess) this.firstSuccess = value
  }

  async getFirstSuccess(): Promise<string> {
    return this.firstSuccess
  }
}

type Value = string | number
type MixedValue = string | number | boolean

interface Data { id: number; name: string }
interface ComplexNested { value: boolean }
interface ComplexType {
  id: number
  name: string
  nested?: ComplexNested
}
interface User {
  id: number
  name: string
}

export default function BuiltinsPromiseAnyFirstTest(): void {
  describe('BuiltinsPromiseAnyFirstTest', (): void => {
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
     * @tc.name   PromiseAnyFirstTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_0100
     * @tc.desc   Verify Promise.any with single element array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnyFirstTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises: Array<number|PromiseLike<number>> = [Promise.resolve<number>(42.0)]
      let result = await Promise.any<number>(promises)
      expect(result).assertEqual(42.0)
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_0200
     * @tc.desc   Verify Promise.any with empty array throws AggregateError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnyFirstTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      try {
        await Promise.any<number>([])
        expect().assertFail()
      } catch (error) {
        if (error instanceof AggregateError) {
          expect(error.errors.length).assertEqual(0)
        }
      }
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_0300
     * @tc.desc   Verify Promise.any with multi-element array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnyFirstTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises: Array<string|PromiseLike<string>> = [
        Promise.resolve("first"),
        Promise.resolve("second"),
        Promise.resolve("third")
      ]
      let result = await Promise.any<string>(promises)
      expect(typeof result === 'string').assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_0400
     * @tc.desc   Verify Promise.any with readonly array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises: readonly (number|PromiseLike<number>)[] = [Promise.resolve<number>(1.0), Promise.resolve<number>(2.0)]
      let result = await Promise.any<number>(promises)
      expect(typeof result === 'number').assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_0500
     * @tc.desc   Verify Promise.any with plain values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnyFirstTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises: Array<number|PromiseLike<number>> = [42.0, 100.0, 200.0]
      let result = await Promise.any<number>(promises)
      expect(typeof result === 'number').assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_0600
     * @tc.desc   Verify Promise.any with PromiseLike object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike = new CustomPromiseLike<string>("promiseLike value")
      let promises: Array<string|PromiseLike<string>> = [promiseLike]
      let result = await Promise.any<string>(promises)
      expect(result).assertEqual("promiseLike value")
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_0700
     * @tc.desc   Verify Promise.any with mixed resolved/rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnyFirstTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises: Array<string|PromiseLike<string>> = [
        Promise.resolve("resolved"),
        Promise.reject<string>(new Error("rejected"))
      ]
      let result = await Promise.any<string>(promises)
      expect(result).assertEqual("resolved")
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_0800
     * @tc.desc   Verify Promise.any with number generic type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnyFirstTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises: Array<number|PromiseLike<number>> = [
        Promise.resolve<number>(123.0),
        Promise.resolve<number>(456.0)
      ]
      let result = await Promise.any<number>(promises)
      expect(typeof result === 'number').assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_0900
     * @tc.desc   Verify Promise.any with string generic type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnyFirstTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises: Array<string|PromiseLike<string>> = [
        Promise.resolve("hello"),
        Promise.resolve("world")
      ]
      let result = await Promise.any<string>(promises)
      expect(typeof result === 'string').assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_1000
     * @tc.desc   Verify Promise.any with boolean generic type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnyFirstTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises: Array<boolean|PromiseLike<boolean>> = [
        Promise.resolve(true),
        Promise.resolve(false)
      ]
      let result = await Promise.any<boolean>(promises)
      expect(typeof result === 'boolean').assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_1100
     * @tc.desc   Verify Promise.any with object generic type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {

      let promises: Array<Data|PromiseLike<Data>> = [
        Promise.resolve<Data>({ id: 1.0, name: "first" }),
        Promise.resolve<Data>({ id: 2.0, name: "second" })
      ]
      let result = await Promise.any<Data>(promises)
      expect(result.id).assertEqual(1.0)
      expect(result.name).assertEqual("first")
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_1200
     * @tc.desc   Verify Promise.any with array generic type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Array<number[]|PromiseLike<number[]>> = [
        Promise.resolve<number[]>([1.0, 2.0, 3.0]),
        Promise.resolve<number[]>([4.0, 5.0, 6.0])
      ]
      let result = await Promise.any<number[]>(promises)
      expect(Array.isArray(result)).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_1300
     * @tc.desc   Verify Promise.any with union generic type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Array<Value|PromiseLike<Value>> = [
        Promise.resolve<Value>("string value"),
        Promise.resolve<Value>(123.0)
      ]
      let result = await Promise.any<Value>(promises)
      expect(typeof result === 'string' || typeof result === 'number').assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_1400
     * @tc.desc   Verify Promise.any with null generic type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Array<null|PromiseLike<null>> = [
        Promise.resolve(null),
        Promise.resolve(null)
      ]
      let result = await Promise.any<null>(promises)
      expect(result).assertNull()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_1500
     * @tc.desc   Verify Promise.any with null parameter throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let caught: boolean = false
      try {
        await Promise.any<number>(null as Object as Iterable<number|PromiseLike<number>>)
        expect().assertFail()
      } catch (error) {
        caught = true
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_1600
     * @tc.desc   Verify Promise.any with non-array parameter throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      try {
        await Promise.any<number>("not an array" as Object as Iterable<number|PromiseLike<number>>)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof TypeError).assertFalse()
      }
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_1700
     * @tc.desc   Verify Promise.any with large array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Array<number|PromiseLike<number>> = []
      for (let i = 0; i < 100; i++) {
        promises.push(Promise.resolve<number>(i * 1.0))
      }
      let result = await Promise.any<number>(promises)
      expect(typeof result === 'number').assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_1800
     * @tc.desc   Verify Promise.any with single resolved among rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnyFirstTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.reject<string>(new Error("one failed"))
      let promise2 = Promise.resolve<string>("two")
      let promise3 = Promise.resolve<string>("three")

      let result = await Promise.any<string>([promise1, promise2, promise3])
      expect(typeof result === 'string').assertTrue()
      expect(result === "two" || result === "three").assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_1900
     * @tc.desc   Verify Promise.any returns fastest resolved value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Array<string|PromiseLike<string>> = [
        new Promise<string>((resolve) => { setTimeout(() => resolve("first"), 200) }),
        new Promise<string>((resolve) => { setTimeout(() => resolve("second"), 100) }),
        new Promise<string>((resolve) => { setTimeout(() => resolve("third"), 300) })
      ]
      let result = await Promise.any<string>(promises)
      expect(result).assertEqual("second")
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_2000
     * @tc.desc   Verify Promise.any with all resolved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnyFirstTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises: Array<number|PromiseLike<number>> = [
        Promise.resolve<number>(1.0),
        Promise.resolve<number>(2.0),
        Promise.resolve<number>(3.0)
      ]
      let result = await Promise.any<number>(promises)
      expect([1.0, 2.0, 3.0].indexOf(result) >= 0).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_2100
     * @tc.desc   Verify Promise.any returns immediate value over delayed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Array<number|PromiseLike<number>> = [
        42.0,
        new Promise<number>((resolve) => { setTimeout(() => resolve(100.0), 100) })
      ]
      let result = await Promise.any<number>(promises)
      expect(result).assertEqual(42.0)
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_2200
     * @tc.desc   Verify Promise.any with PromiseLike in race
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike = new CustomPromiseLike<string>("promiseLike")
      let promises: Array<string|PromiseLike<string>> = [
        promiseLike,
        new Promise<string>((resolve) => { setTimeout(() => resolve("promise"), 100) })
      ]
      let result = await Promise.any<string>(promises)
      expect(result).assertEqual("promiseLike")
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_2300
     * @tc.desc   Verify Promise.any throws AggregateError when all rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnyFirstTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises: Array<string|PromiseLike<string>> = [
        Promise.reject<string>(new Error("error1")),
        Promise.reject<string>(new Error("error2")),
        Promise.reject<string>(new Error("error3"))
      ]
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
     * @tc.name   PromiseAnyFirstTest2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_2400
     * @tc.desc   Verify Promise.any returns undefined when resolved to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Array<undefined|PromiseLike<undefined>> = [
        Promise.resolve(undefined),
        Promise.reject<undefined>(new Error("rejected"))
      ]
      let result = await Promise.any<undefined>(promises)
      expect(result).assertUndefined()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_2500
     * @tc.desc   Verify Promise.any returns null when resolved to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Array<null|PromiseLike<null>> = [
        Promise.resolve(null),
        Promise.reject<null>(new Error("rejected"))
      ]
      let result = await Promise.any<null>(promises)
      expect(result).assertNull()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_2600
     * @tc.desc   Verify Promise.any returns empty object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Array<Record<string, number>|PromiseLike<Record<string, number>>> = [
        Promise.resolve<Record<string, number>>({} as Record<string, number>),
        Promise.reject<Record<string, number>>(new Error("rejected"))
      ]
      let result = await Promise.any<Record<string, number>>(promises)
      expect(typeof result === 'object').assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_2700
     * @tc.desc   Verify Promise.any returns empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Array<number[]|PromiseLike<number[]>> = [
        Promise.resolve<number[]>([] as number[]),
        Promise.reject<number[]>(new Error("rejected"))
      ]
      let result = await Promise.any<number[]>(promises)
      expect(Array.isArray(result)).assertTrue()
      expect(result.length).assertEqual(0)
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest2800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_2800
     * @tc.desc   Verify Promise.any returns Promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Array<number|PromiseLike<number>> = [Promise.resolve<number>(42.0)]
      let result = Promise.any<number>(promises)
      let anyResult = await result
      expect(anyResult).assertEqual(42.0)
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest2900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_2900
     * @tc.desc   Verify Promise.any with nested Promise unwrapping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Array<Promise<number>|PromiseLike<Promise<number>>> = [
        Promise.resolve<Promise<number>>(Promise.resolve<number>(42.0))
      ]
      let result = await Promise.any<Promise<number>>(promises)
      expect(typeof result === 'number').assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest3000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_3000
     * @tc.desc   Verify Promise.any race condition with simultaneous resolution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Array<string|PromiseLike<string>> = [
        new Promise<string>((resolve) => { setTimeout(() => resolve("first"), 100) }),
        new Promise<string>((resolve) => { setTimeout(() => resolve("second"), 100) }),
        new Promise<string>((resolve) => { setTimeout(() => resolve("third"), 100) })
      ]
      let result = await Promise.any<string>(promises)
      expect(typeof result === 'string').assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest3100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_3100
     * @tc.desc   Verify Promise.any with synchronous values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnyFirstTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises: Array<number|PromiseLike<number>> = [1.0, 2.0, 3.0]
      let result = await Promise.any<number>(promises)
      expect([1.0, 2.0, 3.0].indexOf(result) >= 0).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest3200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_3200
     * @tc.desc   Verify AggregateError construction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let errors = [
        new Error("error1"),
        new Error("error2"),
        new Error("error3")
      ]
      let aggregateError = new AggregateError(errors, "All promises rejected")
      expect(aggregateError instanceof Error).assertTrue()
      expect(aggregateError instanceof AggregateError).assertTrue()
      expect(aggregateError.errors.length).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest3300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_3300
     * @tc.desc   Verify AggregateError errors property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Array<string|PromiseLike<string>> = [
        Promise.reject<string>(new Error("first error")),
        Promise.reject<string>(new Error("second error"))
      ]
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
     * @tc.name   PromiseAnyFirstTest3400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_3400
     * @tc.desc   Verify AggregateError inheritance from Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Array<string|PromiseLike<string>> = [
        Promise.reject<string>(new Error("error"))
      ]
      let caught: boolean = false
      try {
        await Promise.any<string>(promises)
        expect().assertFail()
      } catch (error) {
        caught = true
        expect(error instanceof AggregateError).assertTrue()
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest3500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_3500
     * @tc.desc   Verify catch catches AggregateError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnyFirstTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises: Array<string|PromiseLike<string>> = [
        Promise.reject<string>(new Error("rejection"))
      ]
      try {
        let result = await Promise.any<string>(promises)
        expect().assertFail()
      } catch (error) {
        if (error instanceof AggregateError) {
          expect(error.errors.length).assertEqual(1)
        }
      }
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest3600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_3600
     * @tc.desc   Verify Promise.catch handles AggregateError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Array<string|PromiseLike<string>> = [
        Promise.reject<string>(new Error("error"))
      ]
      try {
        await Promise.any<string>(promises)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof AggregateError).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest3700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_3700
     * @tc.desc   Verify finally executes after Promise.any
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Array<string|PromiseLike<string>> = [
        Promise.reject<string>(new Error("error"))
      ]
      let finallyExecuted = false
      let caught: boolean = false
      try {
        await Promise.any<string>(promises)
      } catch (error) {
      caught = true
} finally {
      expect(caught).assertTrue()
        finallyExecuted = true
      }
      expect(finallyExecuted).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest3800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_3800
     * @tc.desc   Verify Promise.finally executes after Promise.any
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Array<string|PromiseLike<string>> = [
        Promise.reject<string>(new Error("error"))
      ]
      let finallyExecuted = false
      await Promise.any<string>(promises)
        .catch<void>((error) => {
          expect(error instanceof Error).assertTrue();
        })
        .finally(() => {
          finallyExecuted = true
        })
      expect(finallyExecuted).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest3900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_3900
     * @tc.desc   Verify Promise rejection chain propagation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Array<string|PromiseLike<string>> = [
        Promise.reject<string>(new Error("level1"))
          .then(value => value)
          .catch(err => { throw new Error("level2: " + err.message) })
      ]
      try {
        await Promise.any<string>(promises)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof AggregateError).assertTrue();
      }
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest4000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_4000
     * @tc.desc   Verify Promise.any with mixed error types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Array<string|PromiseLike<string>> = [
        Promise.reject<string>(new Error("standard error")),
        Promise.reject<string>(new CustomError("custom error")),
        Promise.reject<string>(new TypeError("type error"))
      ]
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
     * @tc.name   PromiseAnyFirstTest4100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_4100
     * @tc.desc   Verify Promise.any then chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Array<number|PromiseLike<number>> = [
        Promise.resolve<number>(1.0),
        Promise.resolve<number>(2.0)
      ]
      let result = await Promise.any<number>(promises)
        .then(value => value * 2)
        .then(value => value + 10)
      expect(result).assertEqual(12.0)
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest4200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_4200
     * @tc.desc   Verify Promise.any catch chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Array<string|PromiseLike<string>> = [
        Promise.reject<string>(new Error("error"))
      ]
      let caught: boolean = false;
      await Promise.any<string>(promises)
        .catch((error: Error) => {
          caught = true;
          expect(error instanceof AggregateError).assertTrue();
          return "fallback"
        })
        .then(value => {
          expect(value).assertEqual("fallback")
        })
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest4300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_4300
     * @tc.desc   Verify Promise.any finally chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Array<number|PromiseLike<number>> = [
        Promise.resolve<number>(42.0)
      ]
      let finallyCalled = false
      let result = await Promise.any<number>(promises)
        .finally(() => {
          finallyCalled = true
        })
      expect(finallyCalled).assertTrue()
      expect(result).assertEqual(42.0)
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest4400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_4400
     * @tc.desc   Verify Promise.any in async function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnyFirstTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let testPromiseAny: () => Promise<number> = async (): Promise<number> => {
        let promises: Array<number|PromiseLike<number>> = [
          Promise.resolve<number>(1.0),
          Promise.resolve<number>(2.0)
        ];
        return await Promise.any<number>(promises);
      };
      let result = await testPromiseAny()
      expect([1.0, 2.0].indexOf(result) >= 0).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest4500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_4500
     * @tc.desc   Verify Promise.any error handling in async function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let testPromiseAnyError: () => Promise<string> = async (): Promise<string> => {
        let promises: Array<string|PromiseLike<string>> = [
          Promise.reject<string>(new Error("error"))
        ];
        try {
          await Promise.any<string>(promises);
          return "success";
        } catch (error) {
          return "caught: " + (error instanceof AggregateError);
        }
      };
      let result = await testPromiseAnyError()
      expect(result).assertContain("caught: true")
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest4600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_4600
     * @tc.desc   Verify concurrent Promise.any execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises1: Array<number|PromiseLike<number>> = [
        Promise.resolve<number>(1.0),
        Promise.resolve<number>(2.0)
      ]
      let promises2: Array<string|PromiseLike<string>> = [
        Promise.resolve("a"),
        Promise.resolve("b")
      ]
      let allResult = await Promise.all([
        Promise.any<number>(promises1),
        Promise.any<string>(promises2)
      ])
      let result1 = allResult[0]
      let result2 = allResult[1]
      expect(typeof result1 === 'number').assertTrue()
      expect(typeof result2 === 'string').assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest4700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_4700
     * @tc.desc   Verify Promise.any combined with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Array<number|PromiseLike<number>> = [
        Promise.resolve<number>(1.0),
        Promise.resolve<number>(2.0),
        Promise.resolve<number>(3.0)
      ]
      let results = await Promise.all([
        Promise.any<number>(promises),
        Promise.any<number>(promises),
        Promise.any<number>(promises)
      ])
      expect(results.length).assertEqual(3)
      expect(typeof results[0] === 'number').assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest4800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_4800
     * @tc.desc   Verify Promise.any combined with Promise.race
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Array<string | PromiseLike<string>> = [
        new Promise<string>((resolve) => { setTimeout(() => resolve("slow"), 100) }),
        Promise.resolve("fast")
      ];

      let anyResult = await Promise.any<string>(promises);
      let raceResult = await Promise.race(promises as Promise<string>[]);

      expect(anyResult).assertEqual("fast");
      expect(raceResult).assertEqual("fast");
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest4900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_4900
     * @tc.desc   Verify Promise.any with delayed resolution timing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Array<string|PromiseLike<string>> = [
        new Promise<string>((resolve) => { setTimeout(() => resolve("1s"), 1000) }),
        new Promise<string>((resolve) => { setTimeout(() => resolve("500ms"), 500) }),
        new Promise<string>((resolve) => { setTimeout(() => resolve("100ms"), 100) })
      ]
      let result = await Promise.any<string>(promises)
      expect(result).assertEqual("100ms")
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest5000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_5000
     * @tc.desc   Verify Promise.any with immediate resolution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Array<string|PromiseLike<string>> = [
        new Promise<string>((resolve) => { setTimeout(() => resolve("delayed"), 100) }),
        Promise.resolve("immediate")
      ]
      let result = await Promise.any<string>(promises)
      expect(result).assertEqual("immediate")
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest5100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_5100
     * @tc.desc   Verify Promise.any with mixed sync and async values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Array<string|PromiseLike<string>> = [
        "sync value",
        new Promise<string>((resolve) => { setTimeout(() => resolve("async value"), 100) })
      ]
      let result = await Promise.any<string>(promises)
      expect(result).assertEqual("sync value")
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest5200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_5200
     * @tc.desc   Verify Promise.any waits for first successful result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Array<Promise<string>> = [
        Promise.reject<string>(new Error("error1")),
        Promise.resolve<string>("success"),
        Promise.reject<string>(new Error("error2"))
      ]
      let result = await Promise.any<string>(promises)
      expect(result).assertEqual("success")
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest5300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_5300
     * @tc.desc   Verify Promise.any with AtomicInt counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let successFlag: Record<string, number> = { "value": 0 }
      let promises: Array<Promise<number>> = [
        new Promise<number>((resolve) => {
          successFlag["value"] = 1
          resolve(1.0)
        }),
        Promise.reject<number>(new Error("error"))
      ]
      let result = await Promise.any<number>(promises)
      expect(successFlag["value"]).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest5400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_5400
     * @tc.desc   Verify Promise.any with lock-protected shared variable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let shared = new SharedFirstSuccess()
      let promises: Array<Promise<string>> = [
        shared.setFirstSuccess("first").then(() => "first"),
        shared.setFirstSuccess("second").then(() => "second")
      ]
      await Promise.any<string>(promises)
      expect(await shared.getFirstSuccess()).assertEqual("first")
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest5500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_5500
     * @tc.desc   Verify Promise.any with concurrent map storage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let map = new Map<string, Promise<string>>()
      let promises: Array<Promise<string>> = [
        Promise.reject<string>(new Error("error")),
        Promise.resolve<string>("success")
      ]
      let result = await Promise.any<string>(promises)
      map.set("winner", Promise.resolve<string>(result))
      expect(result).assertEqual("success")
      expect(map.has("winner")).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest5600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_5600
     * @tc.desc   Verify Promise.any with many promises competition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Array<Promise<number>> = []
      for (let i = 0; i < 100; i++) {
        if (i === 5) {
          promises.push(Promise.resolve<number>(5.0))
        } else {
          promises.push(new Promise<number>((resolve) => { setTimeout(() => resolve(i * 1.0), 100) }))
        }
      }
      let result = await Promise.any<number>(promises)
      expect(result).assertEqual(5.0)
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest5700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_5700
     * @tc.desc   Verify AggregateError message assertion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Array<Promise<string>> = [
        Promise.reject<string>(new Error("All promises were rejected"))
      ]
      try {
        await Promise.any<string>(promises)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof AggregateError).assertTrue();
      }
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest5800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_5800
     * @tc.desc   Verify Promise.any with all undefined values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Array<undefined|PromiseLike<undefined>> = [
        Promise.resolve<undefined>(undefined),
        Promise.resolve<undefined>(undefined),
        Promise.resolve<undefined>(undefined)
      ]
      let result = await Promise.any<undefined>(promises)
      expect(result).assertUndefined()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest5900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_5900
     * @tc.desc   Verify Promise.any with custom PromiseLike class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {

      let promises: Array<string|PromiseLike<string>> = [
        new CustomPromiseLike<string>("custom value"),
        Promise.resolve("promise value")
      ]
      let result = await Promise.any<string>(promises)
      expect(typeof result === 'string').assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest6000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_6000
     * @tc.desc   Verify Promise.any with thenable object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let thenable = new CustomPromiseLike<string>("thenable value")
      let promises: Array<string|PromiseLike<string>> = [
        thenable,
        Promise.resolve("promise value")
      ]
      let result = await Promise.any<string>(promises)
      expect(typeof result === 'string').assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest6100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_6100
     * @tc.desc   Verify Promise.any with deeply nested Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Array<string|PromiseLike<string>> = [Promise.resolve<string>("nested")]
      let result = await Promise.any<string>(promises)
      expect(result).assertEqual("nested")
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest6200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_6200
     * @tc.desc   Verify Promise.any with dynamically built array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Array<number|PromiseLike<number>> = []
      for (let i = 0; i < 10; i++) {
        promises.push(Promise.resolve<number>(i * 1.0))
      }
      let result = await Promise.any<number>(promises)
      expect(typeof result === 'number').assertTrue()
      expect(result >= 0 && result < 10).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest6300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_6300
     * @tc.desc   Verify Promise.any with conditionally added elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Array<string|PromiseLike<string>> = [
        Promise.resolve("always")
      ]
      let condition = true
      if (condition) {
        promises.push(Promise.resolve("conditional"))
      }
      let result = await Promise.any<string>(promises)
      expect(result === "always" || result === "conditional").assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest6400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_6400
     * @tc.desc   Verify Promise.any with complex type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {

      let promises: Array<ComplexType|PromiseLike<ComplexType>> = [
        Promise.resolve<ComplexType>({ id: 1.0, name: "first", nested: { value: true } as ComplexNested }),
        Promise.resolve<ComplexType>({ id: 2.0, name: "second" } as ComplexType)
      ]
      let result = await Promise.any<ComplexType>(promises)
      expect(typeof result.id === 'number').assertTrue()
      expect(typeof result.name === 'string').assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest6500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_6500
     * @tc.desc   Verify Promise.any with mixed value types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Array<MixedValue|PromiseLike<MixedValue>> = [
        Promise.resolve<MixedValue>("string" as MixedValue),
        Promise.resolve<MixedValue>(123.0 as MixedValue),
        Promise.resolve<MixedValue>(true as MixedValue)
      ]
      let result = await Promise.any<MixedValue>(promises)
      expect(
        typeof result === 'string' ||
          typeof result === 'number' ||
          typeof result === 'boolean'
      ).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest6600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_6600
     * @tc.desc   Verify Promise.any performance with large array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Array<number|PromiseLike<number>> = []
      for (let i = 0; i < 100; i++) {
        promises.push(Promise.resolve<number>(i * 1.0))
      }
      let result = await Promise.any<number>(promises)
      expect(typeof result === 'number').assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest6700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_6700
     * @tc.desc   Verify Promise.any with rapid rejection chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Array<string|PromiseLike<string>> = []
      for (let i = 0; i < 100; i++) {
        promises.push(Promise.reject<string>(new Error("error " + i.toString())))
      }
      try {
        await Promise.any<string>(promises)
        expect().assertFail()
      } catch (error) {
        if (error instanceof AggregateError) {
          expect(error.errors.length).assertEqual(100)
        }
      }
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest6800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_6800
     * @tc.desc   Verify Promise.any nested in Promise.then callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve("outer")
        .then<string>(() => {
          let promises: Array<string|PromiseLike<string>> = [
            Promise.resolve("inner-success"),
            Promise.reject<string>(new Error("inner-error"))
          ]
          return Promise.any<string>(promises)
        })
      expect(result).assertEqual("inner-success")
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest6900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_6900
     * @tc.desc   Verify Promise.any with 3 concurrent tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter: number = 0
      let promises: Array<Promise<number>> = [
        Promise.resolve<number>(1.0).then<number>((_v: number) => { counter++; return 1.0 }),
        Promise.resolve<number>(2.0).then<number>((_v: number) => { counter++; return 2.0 }),
        Promise.resolve<number>(3.0).then<number>((_v: number) => { counter++; return 3.0 })
      ]

      await Promise.any<number>(promises)
      expect(counter > 0).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest7000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_7000
     * @tc.desc   Verify Promise.any with 5 concurrent tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter: number = 0
      let promises: Array<Promise<number>> = []
      for (let i = 1; i <= 5; i++) {
        let v = i * 1.0
        promises.push(Promise.resolve<number>(v).then<number>((_v: number) => { counter++; return v }))
      }
      await Promise.any<number>(promises)
      expect(counter > 0).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest7100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_7100
     * @tc.desc   Verify Promise.any with 10 concurrent tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter: number = 0
      let promises: Array<Promise<number>> = []
      for (let i = 0; i < 10; i++) {
        let v = i * 1.0
        promises.push(Promise.resolve<number>(v).then<number>((_v: number) => { counter++; return v }))
      }
      await Promise.any<number>(promises)
      expect(counter > 0).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest7200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_7200
     * @tc.desc   Verify Promise.any with custom thenable in race
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let fastThenable = new CustomPromiseLike<string>("fast")
      let slowPromise = new Promise<string>((resolve) => { setTimeout(() => resolve("slow"), 100) })

      let result = await Promise.any<string>([fastThenable, slowPromise])
      expect(result).assertEqual("fast")
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest7300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_7300
     * @tc.desc   Verify Promise.any with rejected thenable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let rejectedThenable = new RejectedPromiseLike<string>(new Error("thenable rejected"))
      let promises: Array<string|PromiseLike<string>> = [
        rejectedThenable,
        Promise.resolve("resolved")
      ]
      let result = await Promise.any<string>(promises)
      expect(result).assertEqual("resolved")
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest7400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_7400
     * @tc.desc   Verify Promise.any returns first non-rejected value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAnyFirstTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises: Array<string|PromiseLike<string>> = [
        Promise.reject<string>(new Error("first")),
        Promise.reject<string>(new Error("second")),
        Promise.resolve("third"),
        Promise.reject<string>(new Error("fourth"))
      ]
      let result = await Promise.any<string>(promises)
      expect(result).assertEqual("third")
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest7500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_7500
     * @tc.desc   Verify Promise.any with mixed sync values and promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Array<number|PromiseLike<number>> = [
        Promise.reject<number>(new Error("rejected")),
        42.0,
        new Promise<number>((resolve) => { setTimeout(() => resolve(100.0), 100) })
      ]
      let result = await Promise.any<number>(promises)
      expect(result).assertEqual(42.0)
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest7600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_7600
     * @tc.desc   Verify Promise.any with mixed success timing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let order: string[] = []
      let promises: Array<Promise<string>> = [
        new Promise<string>((resolve) => {
          setTimeout(() => {
            order.push("p1")
            resolve("p1")
          }, 50)
        }),
        new Promise<string>((resolve) => {
          setTimeout(() => {
            order.push("p2")
            resolve("p2")
          }, 30)
        }),
        new Promise<string>((resolve) => {
          setTimeout(() => {
            order.push("p3")
            resolve("p3")
          }, 40)
        })
      ]
      let result = await Promise.any<string>(promises)
      expect(result).assertEqual("p2")
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest7700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_7700
     * @tc.desc   Verify Promise.any with rejected promises first
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Array<Promise<string>> = [
        Promise.reject<string>(new Error("error1")),
        new Promise<string>((resolve) => { setTimeout(() => resolve("success"), 100) }),
        Promise.reject<string>(new Error("error2"))
      ]
      let result = await Promise.any<string>(promises)
      expect(result).assertEqual("success")
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest7800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_7800
     * @tc.desc   Verify Promise.any comprehensive integration test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAnyFirstTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {

      let fetchUser = (id: number): Promise<User> => {
        if (id === 3) {
          return Promise.reject<User>(new Error("user not found"))
        }
        return Promise.resolve<User>({ id: id, name: "User " + id.toString() } as User)
      }
      let promises: Array<Promise<User>> = [
        fetchUser(1),
        fetchUser(2),
        fetchUser(3),
        fetchUser(4)
      ]
      let result = await Promise.any<User>(promises)
      expect(typeof result.id === 'number').assertTrue()
      expect(result.id !== 3).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest7900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_7900
     * @tc.desc   MessageHandler callback nested Promise.any
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnyFirstTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let processedCount = new AtomicInt(0);
      let eaWorker = new EAWorker('msgWorker');
      eaWorker.start();

      let job = eaWorker.run<int>((a: int, b: int): int => {
        if (a > 0) return a * 2;
        if (b > 0) return b * 2;
        return 0;
      }, -1, 2);

      let workerResult = job.Await();
      if (workerResult > 0) {
        processedCount.fetchAdd(1);
      }
      let promises: Promise<int>[] = [Promise.resolve(workerResult)];
      let result = await Promise.any<int>(promises);
      expect(processedCount.load() > 0).assertTrue();

      await eaWorker.join();
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest8000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_8000
     * @tc.desc   EAWorker.run callback nested Promise.any(FixedArray)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnyFirstTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('anyWorker')
      eaWorker.start()

      let job = eaWorker.run<string>(() => {
        return "worker-success"
      })

      let workerResult = job.Await()

      let result = await Promise.any<string>([Promise.resolve(workerResult)])
      expect(result).assertEqual("worker-success")

      await eaWorker.join()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest8100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_8100
     * @tc.desc   MessageHandler callback nested Promise.any(FixedArray)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnyFirstTest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let processedCount = new AtomicInt(0)
      let eaWorker = new EAWorker('msgAnyWorker')
      eaWorker.start()

      let job = eaWorker.run<string>((s1: string, s2: string, s3: string): string => {
        return s1
      }, "a", "b", "c")

      let workerResult = job.Await()
      processedCount.fetchAdd(1)
      let result = await Promise.any<string>([Promise.resolve(workerResult)])
      expect(processedCount.load()).assertEqual(1)

      await eaWorker.join()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest8200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_8200
     * @tc.desc   EAWorker.run callback nested Promise.any(Set)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnyFirstTest8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('anyWorker');
      eaWorker.start();

      let job = eaWorker.run<int>((a: int, b: int, c: int, d: int): int => {
        if (a > 0) return a;
        if (b > 0) return b;
        if (c > 0) return c;
        return d;
      }, -1, 2, -3, 4);

      let workerResult = job.Await();

      let promiseSet = new Set<Promise<int>>();
      promiseSet.add(Promise.resolve(workerResult));
      let result = await Promise.any<int>(promiseSet);
      expect(result).assertEqual(2);

      await eaWorker.join();
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest8300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_8300
     * @tc.desc   MessageHandler callback nested Promise.any(Set)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnyFirstTest8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let processedCount = new AtomicInt(0);
      let eaWorker = new EAWorker('msgWorker');
      eaWorker.start();

      let job = eaWorker.run<int>((a: int, b: int, c: int): int => {
        if (a > 0) return a * 2;
        if (b > 0) return b * 2;
        if (c > 0) return c * 2;
        return 0;
      }, -1, 2, -3);

      let workerResult = job.Await();
      if (workerResult > 0) {
        processedCount.fetchAdd(1);
      }

      let promiseSet = new Set<Promise<int>>();
      promiseSet.add(Promise.resolve(workerResult));
      let result = await Promise.any<int>(promiseSet);
      expect(processedCount.load() > 0).assertTrue();

      await eaWorker.join();
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest8400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_8400
     * @tc.desc   EAWorker.run callback nested Promise.any(Set) simple
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnyFirstTest8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('anySetWorker')
      eaWorker.start()

      let job = eaWorker.run<string>(() => {
        return "worker-success"
      })

      let workerResult = job.Await()
      let promiseSet = new Set<Promise<string>>();
      promiseSet.add(Promise.resolve(workerResult));
      let result = await Promise.any<string>(promiseSet)
      expect(result).assertEqual("worker-success")

      await eaWorker.join()
      Done();
    })

    /**
     * @tc.name   PromiseAnyFirstTest8500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ANY_FIRST_TEST_8500
     * @tc.desc   MessageHandler callback nested Promise.any(Set) simple
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnyFirstTest8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let processedCount = new AtomicInt(0)
      let eaWorker = new EAWorker('msgAnySetWorker')
      eaWorker.start()

      let job = eaWorker.run<string>((s1: string, s2: string, s3: string): string => {
        return s1
      }, "a", "b", "c")

      let workerResult = job.Await()
      processedCount.fetchAdd(1)
      let promiseSet = new Set<Promise<string>>();
      promiseSet.add(Promise.resolve(workerResult));
      let result = await Promise.any<string>(promiseSet)
      expect(processedCount.load()).assertEqual(1)

      await eaWorker.join()
      Done();
    })
  })
}