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

class NetworkError extends Error {
  errorCode: number = 0
  constructor(message: string, errorCode: number) {
    super(message)
    this.name = "NetworkError"
    this.errorCode = errorCode
  }
}

class UserInfo {
  name: string = ""
  age: number = 0
  constructor(name: string, age: number) {
    this.name = name
    this.age = age
  }
}

class CustomPromiseLike<T> implements PromiseLike<T> {
  value: T
  constructor(value: T) { this.value = value }
  then<U, E>(onFulfilled: ((value: T) => U | PromiseLike<U>), onRejected?: ((reason: Error) => E | PromiseLike<E>)): PromiseLike<Awaited<U> | Awaited<E>> {
    if (onFulfilled) { onFulfilled(this.value) }
    return Promise.resolve<T>(this.value) as PromiseLike<Awaited<U> | Awaited<E>>
  }
}

export default function BuiltinsPromiseConstructorFirstTest(): void {
  describe('BuiltinsPromiseConstructorFirstTest', (): void => {
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
     * @tc.name   PromiseConstructorFirstTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_0100
     * @tc.desc   Verify callback parameter is required
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let caught = false
      try {
        let promise = new Promise<void>(undefined as Object as (resolve: (value: void) => void, reject: (error: Error) => void) => void)
      } catch (error) {
        caught = true
        expect(error instanceof Error).assertTrue();
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_0200
     * @tc.desc   Verify callback receives resolve and reject parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<number>((resolve, reject) => {
        resolve(100)
      })
      let result = await promise
      expect(result).assertEqual(100)
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_0300
     * @tc.desc   Verify callback can use only resolve parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<string>((resolve) => {
        resolve("hello")
      })
      let result = await promise
      expect(result).assertEqual("hello")
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_0400
     * @tc.desc   Verify callback as normal function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let executor: (resolve: (value: number) => void, reject: (error: Error) => void) => void =
        (resolve: (value: number) => void, reject: (error: Error) => void): void => {
          resolve(42);
        };
      let promise = new Promise<number>(executor)
      let result = await promise
      expect(result).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_0500
     * @tc.desc   Verify callback as arrow function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<string>((resolve, reject) => {
        resolve("success")
      })
      let result = await promise
      expect(result).assertEqual("success")
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_0600
     * @tc.desc   Verify callback as null throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let caught = false
      try {
        let promise = new Promise<void>(null as Object as (resolve: (value: void) => void, reject: (error: Error) => void) => void)
      } catch (error) {
        caught = true
        expect(error instanceof Error).assertTrue();
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_0700
     * @tc.desc   Verify callback as undefined throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let caught: boolean = false
      try {
        let promise = new Promise<void>(undefined as Object as (resolve: (value: void) => void, reject: (error: Error) => void) => void)
        expect().assertFail()
      } catch (error) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_0800
     * @tc.desc   Verify callback as non-function type throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let caught = false
      try {
        let promise = new Promise<void>("string" as Object as (resolve: (value: void) => void, reject: (error: Error) => void) => void)
      } catch (error) {
        caught = true
        expect(error instanceof Error).assertTrue();
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_0900
     * @tc.desc   Verify resolve with number type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<number>((resolve, reject) => {
        resolve(100)
      })
      let value = await promise
      expect(value).assertEqual(100)
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_1000
     * @tc.desc   Verify resolve with string type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<string>((resolve, reject) => {
        resolve("hello world")
      })
      let value = await promise
      expect(value).assertEqual("hello world")
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_1100
     * @tc.desc   Verify resolve with boolean type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<boolean>((resolve, reject) => {
        resolve(true)
      })
      let value = await promise
      expect(value).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_1200
     * @tc.desc   Verify resolve with undefined for Promise<void>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<void>((resolve, reject) => {
        resolve(undefined)
      })
      let value = await promise
      expect(value).assertUndefined()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_1300
     * @tc.desc   Verify resolve with null type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<string|null>((resolve, reject) => {
        resolve(null)
      })
      let value = await promise
      expect(value).assertNull()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_1400
     * @tc.desc   Verify resolve with object type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<UserInfo>((resolve, reject) => {
        resolve(new UserInfo("Alice", 30))
      })
      let value = await promise
      expect(value.name).assertEqual("Alice")
      expect(value.age).assertEqual(30)
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_1500
     * @tc.desc   Verify resolve with array type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<number[]>((resolve, reject) => {
        resolve([1, 2, 3, 4, 5])
      })
      let value = await promise
      expect(value.length).assertEqual(5)
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_1600
     * @tc.desc   Verify resolve with Promise object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let innerPromise = Promise.resolve<string>("inner value")
      let promise = new Promise<string>((resolve, reject) => {
        resolve(innerPromise)
      })
      let value = await promise
      expect(value).assertEqual("inner value")
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_1700
     * @tc.desc   Verify resolve with thenable object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorFirstTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let thenable = new CustomPromiseLike<string>("thenable value")
      let promise = new Promise<string>((resolve, reject) => {
        resolve(thenable)
      })
      let value = await promise
      expect(value).assertEqual("thenable value")
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_1800
     * @tc.desc   Verify resolve with union type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorFirstTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = new Promise<string|number>((resolve, reject) => {
        resolve("string value")
      })
      let promise2 = new Promise<string|number>((resolve, reject) => {
        resolve(123)
      })
      let v1 = await promise1
      let v2 = await promise2
      expect(v1).assertEqual("string value")
      expect(v2).assertEqual(123)
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_1900
     * @tc.desc   Verify Promise supports generic type parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let p1 = await new Promise<number>((resolve) => { resolve(100) })
      let p2 = await new Promise<string>((resolve) => { resolve("hello") })
      let p3 = await new Promise<number[]>((resolve) => { resolve([1, 2, 3]) })
      expect(p1).assertEqual(100)
      expect(p2).assertEqual("hello")
      expect(p3.length).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_2000
     * @tc.desc   Verify reject with Error object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<number>((resolve, reject) => {
        reject(new Error("Something went wrong"))
      })
      let caught: boolean = false
      await promise.catch((error) => {
        expect(error instanceof Error).assertTrue()
        caught = true
      })
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_2100
     * @tc.desc   Verify reject with custom Error subclass
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<number>((resolve, reject) => {
        reject(new CustomError("Custom error occurred"))
      })
      await promise.catch((error) => {
        expect(error instanceof Error).assertTrue();
        expect(error instanceof CustomError).assertTrue();
        return "caught";
      })
      let caught: boolean = false
      try {
        await promise
        expect().assertFail()
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_2200
     * @tc.desc   Verify reject with TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<number>((resolve, reject) => {
        reject(new TypeError("Type error"))
      })
      await promise.catch((error) => {
        expect(error instanceof TypeError).assertTrue()
      })
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_2300
     * @tc.desc   Verify reject with RangeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<number>((resolve, reject) => {
        reject(new RangeError("Range error"))
      })
      await promise.catch((error) => {
        expect(error instanceof RangeError).assertTrue()
      })
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_2400
     * @tc.desc   Verify reject with Error wrapping string value still yields rejected state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<number>((resolve, reject) => {
        reject(new Error("error string"))
      })
      let caught: boolean = false
      await promise.catch((error) => {
        expect(error instanceof Error).assertTrue()
        caught = true
      })
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_2500
     * @tc.desc   Verify reject with Error wrapping number value still yields rejected state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<number>((resolve, reject) => {
        reject(new Error("404"))
      })
      let caught: boolean = false
      await promise.catch((error) => {
        expect(error instanceof Error).assertTrue()
        caught = true
      })
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_2600
     * @tc.desc   Verify reject with Error wrapping object-like message still yields rejected state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<number>((resolve, reject) => {
        reject(new Error("code: 500, message: error"))
      })
      let caught: boolean = false
      await promise.catch((error) => {
        expect(error instanceof Error).assertTrue()
        caught = true
      })
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_2700
     * @tc.desc   Verify reject with Error wrapping null text still yields rejected state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<number>((resolve, reject) => {
        reject(new Error("null"))
      })
      let caught: boolean = false
      await promise.catch((error) => {
        expect(error instanceof Error).assertTrue()
        caught = true
      })
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest2800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_2800
     * @tc.desc   Verify reject with Error wrapping undefined text still yields rejected state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<number>((resolve, reject) => {
        reject(new Error("undefined"))
      })
      let caught: boolean = false
      await promise.catch((error) => {
        expect(error instanceof Error).assertTrue()
        caught = true
      })
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest2900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_2900
     * @tc.desc   Verify constructor returns Promise object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<number>((resolve, reject) => {
        resolve(100)
      })
      let result = await promise
      expect(result).assertEqual(100)
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest3000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_3000
     * @tc.desc   Verify initial state is pending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let settled = false
      let promise = new Promise<number>(() => {})
      let raceResult = await Promise.race([
        promise.then(() => { settled = true }),
        new Promise<void>((resolve) => { setTimeout(() => resolve(undefined), 100) })
      ])
      expect(settled).assertFalse()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest3100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_3100
     * @tc.desc   Verify resolved state after calling resolve
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<string>((resolve, reject) => {
        resolve("success")
      })
      let value = await promise
      expect(value).assertEqual("success")
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest3200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_3200
     * @tc.desc   Verify rejected state after calling reject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<string>((resolve, reject) => {
        reject(new Error("failed"))
      })
      let caught: boolean = false
      await promise.catch((error) => {
        expect(error instanceof Error).assertTrue()
        caught = true
      })
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest3300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_3300
     * @tc.desc   Verify resolve with boundary value 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<number>((resolve, reject) => {
        resolve(0)
      })
      let value = await promise
      expect(value).assertEqual(0)
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest3400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_3400
     * @tc.desc   Verify resolve with empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<string>((resolve, reject) => {
        resolve("")
      })
      let value = await promise
      expect(value).assertEqual("")
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest3500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_3500
     * @tc.desc   Verify resolve with false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<boolean>((resolve, reject) => {
        resolve(false)
      })
      let value = await promise
      expect(value).assertFalse()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest3600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_3600
     * @tc.desc   Verify resolve with empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<number[]>((resolve, reject) => {
        resolve([])
      })
      let value = await promise
      expect(value.length).assertEqual(0)
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest3700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_3700
     * @tc.desc   Verify resolve with empty object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorFirstTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<UserInfo>((resolve, reject) => {
        resolve(new UserInfo("", 0))
      })
      let value = await promise
      expect(value.name).assertEqual("")
      expect(value.age).assertEqual(0)
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest3800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_3800
     * @tc.desc   Verify Promise generic type correctness
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise: Promise<number> = new Promise<number>((resolve, reject) => {
        resolve(100)
      })
      let value = await promise
      expect((value instanceof number)).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest3900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_3900
     * @tc.desc   Verify then method chain returns new Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<number>((resolve, reject) => {
        resolve(100)
      })
      let p2 = promise.then((value) => {
        return value * 2
      })
      let result = await p2
      expect(result).assertEqual(200)
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest4000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_4000
     * @tc.desc   Verify catch method chain returns new Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<number>((resolve, reject) => {
        reject(new Error("error"))
      })
      let p2 = promise.catch((error) => {
        expect(error instanceof Error).assertTrue()
        return 0
      })
      let result = await p2
      expect(result).assertEqual(0)
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest4100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_4100
     * @tc.desc   Verify resolve with Number.MAX_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorFirstTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<number>((resolve, reject) => {
        resolve(Number.MAX_VALUE)
      })
      let value = await promise
      expect(value).assertEqual(Number.MAX_VALUE)
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest4200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_4200
     * @tc.desc   Verify resolve with Number.MIN_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorFirstTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<number>((resolve, reject) => {
        resolve(Number.MIN_VALUE)
      })
      let value = await promise
      expect(value).assertEqual(Number.MIN_VALUE)
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest4300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_4300
     * @tc.desc   Verify resolve with Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorFirstTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<number>((resolve, reject) => {
        resolve(Infinity)
      })
      let value = await promise
      expect(value).assertEqual(Infinity)
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest4400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_4400
     * @tc.desc   Verify resolve with NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorFirstTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<number>((resolve, reject) => {
        resolve(NaN)
      })
      let value = await promise
      expect(Number.isNaN(value)).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest4500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_4500
     * @tc.desc   Verify resolve with long string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorFirstTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let longString = "a".repeat(10000)
      let promise = new Promise<string>((resolve, reject) => {
        resolve(longString)
      })
      let value = await promise
      expect(value.length).assertEqual(10000)
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest4600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_4600
     * @tc.desc   Verify resolve with Unicode string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorFirstTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let unicodeString = "你好世界"
      let promise = new Promise<string>((resolve, reject) => {
        resolve(unicodeString)
      })
      let value = await promise
      expect(value).assertEqual(unicodeString)
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest4700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_4700
     * @tc.desc   Verify reject with new Error()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<void>((resolve, reject) => {
        reject(new Error())
      })
      let caught: boolean = false
      await promise.catch((error) => {
        expect(error instanceof Error).assertTrue()
        caught = true
      })
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest4800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_4800
     * @tc.desc   Verify reject with new Error(message)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<void>((resolve, reject) => {
        reject(new Error("Custom error message"))
      })
      let caught: boolean = false
      await promise.catch((error) => {
        expect(error instanceof Error).assertTrue()
        caught = true
      })
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest4900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_4900
     * @tc.desc   Verify reject with NetworkError subclass
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<void>((resolve, reject) => {
        reject(new NetworkError("Connection timeout", 408))
      })
      await promise.catch((error) => {
        expect(error instanceof NetworkError).assertTrue()
      })
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest5000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_5000
     * @tc.desc   Verify Error property validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorFirstTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<void>((resolve, reject) => {
        let error = new Error("Test error")
        reject(error)
      })
      await promise.catch((error) => {
        expect(error instanceof Error).assertTrue();
        return "caught";
      })
      let caught: boolean = false
      try {
        await promise
        expect().assertFail()
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest5100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_5100
     * @tc.desc   Verify callback synchronous throw Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<void>((resolve, reject) => {
        throw new Error("Sync error in executor")
      })
      let caught: boolean = false
      await promise.catch((error) => {
        expect(error instanceof Error).assertTrue()
        caught = true
      })
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest5200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_5200
     * @tc.desc   Verify callback async throw Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<number>((resolve, reject) => {
        setTimeout(() => {
          try {
            throw new Error("Async error")
          } catch (e) {
            reject(e)
          }
        }, 100)
      })
      let caught: boolean = false
      await promise.catch((error) => {
        expect(error instanceof Error).assertTrue()
        caught = true
      })
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest5300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_5300
     * @tc.desc   Verify callback try-catch error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<number>((resolve, reject) => {
        try {
          throw new Error("parse error")
        } catch (e) {
          reject(new Error("JSON parse failed"))
        }
      })
      let caught: boolean = false
      await promise.catch((error) => {
        expect(error instanceof Error).assertTrue()
        caught = true
      })
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest5400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_5400
     * @tc.desc   Verify multiple resolve calls only first takes effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<number>((resolve, reject) => {
        resolve(100)
        resolve(200)
        resolve(300)
      })
      let value = await promise
      expect(value).assertEqual(100)
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest5500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_5500
     * @tc.desc   Verify multiple reject calls only first takes effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let firstError = new Error("First error")
      let promise = new Promise<void>((resolve, reject) => {
        reject(firstError)
        reject(new Error("Second error"))
      })
      let caught: boolean = false
      await promise.catch((error) => {
        caught = true
        expect(error instanceof Error).assertTrue()
        expect(error === firstError).assertTrue()
      })
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest5600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_5600
     * @tc.desc   Verify resolve then reject, resolve takes effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let status = ""
      let promise = new Promise<number>((resolve, reject) => {
        resolve(100)
        reject(new Error("Should not happen"))
      })
      await promise.then((value) => {
        status = "fulfilled"
      }).catch(() => {
        status = "rejected"
      })
      expect(status).assertEqual("fulfilled")
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest5700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_5700
     * @tc.desc   Verify reject then resolve, reject takes effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let status = ""
      let promise = new Promise<number>((resolve, reject) => {
        reject(new Error("First"))
        resolve(100)
      })
      await promise.then((value) => {
        status = "fulfilled"
      }).catch(() => {
        status = "rejected"
      })
      expect(status).assertEqual("rejected")
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest5800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_5800
     * @tc.desc   Verify executor throwing Error yields rejected state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<void>((resolve, reject) => {
        throw new Error("valid error")
      })
      let caught: boolean = false
      await promise.catch((error) => {
        expect(error instanceof Error).assertTrue()
        caught = true
      })
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest5900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_5900
     * @tc.desc   Verify resolve with number value yields fulfilled state and number instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorFirstTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<number>((resolve, reject) => {
        resolve(100)
      })
      let value = await promise
      expect((value instanceof number)).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest6000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_6000
     * @tc.desc   Verify reject with Error value still yields rejected state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorFirstTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<void>((resolve, reject) => {
        reject(new Error("valid"))
      })
      let caught: boolean = false
      await promise.catch((error) => {
        expect(error instanceof Error).assertTrue()
        caught = true
      })
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorFirstTest6100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_FIRST_TEST_6100
     * @tc.desc   Verify setTimeout async resolve
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorFirstTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<string>((resolve, reject) => {
        setTimeout(() => {
          resolve("delayed success")
        }, 100)
      })
      let value = await promise
      expect(value).assertEqual("delayed success")
      Done();
    })
  })
}
