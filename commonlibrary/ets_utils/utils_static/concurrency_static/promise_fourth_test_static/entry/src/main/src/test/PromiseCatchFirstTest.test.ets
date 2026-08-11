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

class RecoverResult {
  status: string = ""
  code: number = 0
  constructor(status: string, code: number) {
    this.status = status
    this.code = code
  }
}

interface CatchState {
  state: string
}

class DeepObject {
  a: DeepObjectInner = new DeepObjectInner()
}

class DeepObjectInner {
  b: DeepObjectInner2 = new DeepObjectInner2()
}

class DeepObjectInner2 {
  c: DeepObjectInner3 = new DeepObjectInner3()
}

class DeepObjectInner3 {
  d: DeepObjectInner4 = new DeepObjectInner4()
}

class DeepObjectInner4 {
  e: string = "deep"
}

class CustomPromiseLike<T> implements PromiseLike<T> {
  value: T
  constructor(value: T) { this.value = value }
  then<U, E>(onFulfilled: ((value: T) => U | PromiseLike<U>), onRejected: ((reason: Error) => E | PromiseLike<E>) | undefined): PromiseLike<Awaited<U> | Awaited<E>> {
    if (onFulfilled) { onFulfilled(this.value) }
    return Promise.resolve<T>(this.value) as PromiseLike<Awaited<U> | Awaited<E>>
  }
}

class RejectedPromiseLike<T> implements PromiseLike<T> {
  error: Error
  constructor(error: Error) { this.error = error }
  then<U, E>(onFulfilled: ((value: T) => U | PromiseLike<U>), onRejected: ((reason: Error) => E | PromiseLike<E>) | undefined): PromiseLike<Awaited<U> | Awaited<E>> {
    if (onRejected) { onRejected(this.error) }
    return Promise.resolve<T>(undefined as T) as PromiseLike<Awaited<U> | Awaited<E>>
  }
}

export default function BuiltinsPromiseCatchFirstTest(): void {
  describe('BuiltinsPromiseCatchFirstTest', (): void => {
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
     * @tc.name   PromiseCatchFirstTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_0100
     * @tc.desc   Verify missing onRejected parameter passes through rejection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let sourceError = new Error("test")
      let promise = Promise.reject<string>(sourceError)
      let caught: boolean = false
      try {
        let result = promise.catch()
        await result
      } catch (error) {
        caught = true
        expect(error === sourceError).assertTrue()
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_0200
     * @tc.desc   Verify passing normal function as callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let recoveryCallback: () => string = (): string => {
        return "recovered";
      };
      let result = promise.catch(recoveryCallback)
      let value = await result
      expect(value).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_0300
     * @tc.desc   Verify passing arrow function as callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let arrowFn = (): string => "recovered-by-arrow"
      let result = promise.catch(arrowFn)
      let value = await result
      expect(value).assertEqual("recovered-by-arrow")
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_0400
     * @tc.desc   Verify onRejected returns number type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let result = promise.catch<number>(() => 123)
      let value = await result
      expect(value).assertEqual(123)
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_0500
     * @tc.desc   Verify onRejected returns string type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let result = promise.catch<string>(() => "recovered")
      let value = await result
      expect(value).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_0600
     * @tc.desc   Verify onRejected returns boolean type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let result = promise.catch<boolean>(() => true)
      let value = await result
      expect(value).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_0700
     * @tc.desc   Verify onRejected returns null value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let result = promise.catch<null>(() => null)
      let value = await result
      expect(value).assertNull()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_0800
     * @tc.desc   Verify onRejected returns undefined value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let result = promise.catch<undefined>(() => undefined)
      let value = await result
      expect(value).assertUndefined()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_0900
     * @tc.desc   Verify onRejected returns object type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let result = promise.catch<RecoverResult>(() => new RecoverResult("recovered", 200))
      let value = await result
      expect((value as RecoverResult).status).assertEqual("recovered")
      expect((value as RecoverResult).code).assertEqual(200)
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_1000
     * @tc.desc   Verify onRejected returns array type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let result = promise.catch<number[]>(() => [1, 2, 3])
      let value = await result
      expect(value.length).assertEqual(3)
      expect((value as number[])[0]).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_1100
     * @tc.desc   Verify onRejected returns string|number union type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchFirstTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let result: Promise<string|number> = promise.catch<string|number>(() => "recovered")
      let value = await result
       expect(value).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_1200
     * @tc.desc   Verify onRejected returns resolved Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let result = promise.catch<Promise<string>>(() => Promise.resolve("recovered"))
      let value = await result
      expect(value).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_1300
     * @tc.desc   Verify onRejected returns rejected Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let rejection = new Error("new error")
      let result = promise.catch<Promise<string>>(() => Promise.reject(rejection))
      let caught: boolean = false
      try {
        await result
      } catch (error) {
        caught = true
        expect(error === rejection).assertTrue()
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_1400
     * @tc.desc   Verify onRejected returns thenable object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchFirstTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let thenable = new CustomPromiseLike<string>("thenable result")
      let result = promise.catch<PromiseLike<string>>(() => thenable)
      let value = await result
      expect(value).assertEqual("thenable result")
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_1500
     * @tc.desc   Verify onRejected with no return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let result = promise.catch(() => {})
      let value = await result
      expect(value).assertUndefined()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_1600
     * @tc.desc   Verify onRejected throws Error inside callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let callbackError = new Error("callback error")
      let result = promise.catch(() => { throw callbackError })
      let caught: boolean = false
      try {
        await result
      } catch (error) {
        caught = true
        expect(error === callbackError).assertTrue()
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_1700
     * @tc.desc   Verify zero-parameter onRejected callback executes exactly once
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let callbackCount: int = 0
      let promise = Promise.reject<string>(new Error("test"))
      let result = await promise.catch<string>(() => {
        callbackCount++
        return "recovered"
      })
      expect(callbackCount).assertEqual(1)
      expect(result).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_1800
     * @tc.desc   Verify explicit undefined onRejected passes through rejection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let sourceError = new Error("test")
      let promise = Promise.reject<string>(sourceError)
      let caught: boolean = false
      try {
        await promise.catch(undefined)
      } catch (error) {
        caught = true
        expect(error === sourceError).assertTrue()
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_1900
     * @tc.desc   Verify parameterized onRejected receives the source Error once
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let sourceError = new Error("test")
      let promise = Promise.reject<string>(sourceError)
      let callbackCount: int = 0
      let result = await promise.catch<string>((error: Error): string => {
        callbackCount++
        expect(error === sourceError).assertTrue()
        return "recovered"
      })
      expect(callbackCount).assertEqual(1)
      expect(result).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_2000
     * @tc.desc   Verify onRejected can recover with an Error object as a value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let recoveryError = new Error("recovery value")
      let promise = Promise.reject<Error>(new Error("test"))
      let result: Error = await promise.catch<Error>(() => recoveryError)
      expect(result === recoveryError).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_2100
     * @tc.desc   Verify parameterized onRejected can replace the rejection reason
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let sourceError = new Error("source error")
      let replacementError = new Error("replacement error")
      let promise = Promise.reject<string>(sourceError)
      let caught: boolean = false
      let result = promise.catch<Promise<string>>((error: Error): Promise<string> => {
        expect(error === sourceError).assertTrue()
        return Promise.reject<string>(replacementError)
      })
      try {
        await result
      } catch (error) {
        caught = true
        expect(error === replacementError).assertTrue()
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_2200
     * @tc.desc   Verify rejected Promise recovers through catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("operation failed"))
      let result = promise.catch(() => "recovered")
      let value = await result
      expect(value).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_2300
     * @tc.desc   Verify resolved Promise skips catch and passes value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve("original value")
      let executed = false
      let result = promise.catch(() => {
        executed = true
        return "should not execute"
      })
      let value = await result
      expect(value).assertEqual("original value")
      expect(executed).assertFalse()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_2400
     * @tc.desc   Verify catch returns Promise that can chain then
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let value = await promise
        .catch(() => "recovered")
        .then(value => {
          expect(value).assertEqual("recovered")
          return value.toUpperCase()
        })
        .then(value => {
          expect(value).assertEqual("RECOVERED")
          return value
        })
      expect(value).assertEqual("RECOVERED")
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_2500
     * @tc.desc   Verify catch returns Promise that can chain catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let chainedError = new Error("new error")
      let value = await promise
        .catch(() => { throw chainedError })
        .catch<string>((error: Error) => {
          expect(error === chainedError).assertTrue()
          return "caught"
        })
      expect(value).assertEqual("caught")
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_2600
     * @tc.desc   Verify catch returns Promise that can chain finally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let cleanup = false
      let value = await promise
        .catch(() => "recovered")
        .finally(() => { cleanup = true })
      expect(value).assertEqual("recovered")
      expect(cleanup).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_2700
     * @tc.desc   Verify catch returns null to recover Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("original error"))
      let recoveredPromise = promise.catch<null>(() => null)
      let value = await recoveredPromise
      expect(value).assertNull()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest2800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_2800
     * @tc.desc   Verify catch returns undefined to recover Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("original error"))
      let recoveredPromise = promise.catch<undefined>((error: Error) => {
        return undefined
      })
      let value = await recoveredPromise
      expect(value).assertUndefined()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest2900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_2900
     * @tc.desc   Verify catch returns empty object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchFirstTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
       let promise = Promise.reject<never>(new Error("test"))
       let result: Promise<CatchState> = promise.catch<CatchState>(() : CatchState => {
         let recovered: CatchState = { state: "recovered" }
         return recovered
       })
       let value = await result
       expect(value.state).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest3000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_3000
     * @tc.desc   Verify catch returns empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchFirstTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let result = promise.catch<number[]>(() => [])
      let value = await result
      expect(value.length).assertEqual(0)
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest3100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_3100
     * @tc.desc   Verify catch returns number 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let result = promise.catch<number>(() => 0)
      let value = await result
      expect(value).assertEqual(0)
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest3200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_3200
     * @tc.desc   Verify catch returns boolean false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let result = promise.catch<boolean>(() => false)
      let value = await result
      expect(value).assertFalse()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest3300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_3300
     * @tc.desc   Verify catch returns empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let result = promise.catch<string>(() => "")
      let value = await result
      expect(value).assertEqual("")
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest3400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_3400
     * @tc.desc   Verify catch returns the recovered value from a typed Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let result: Promise<string> = promise.catch(() => "recovered")
      let recovered = await result
      expect(recovered).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest3500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_3500
     * @tc.desc   Verify Awaited type resolution when returning Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchFirstTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let result = promise.catch<Promise<string>>(() => Promise.resolve("value"))
      let value: string = await result
      expect(value).assertEqual("value")
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest3600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_3600
     * @tc.desc   Verify default generic U = never when not specified
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchFirstTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let thrownError = new Error("always throw")
      let result = promise.catch(() => { throw thrownError })
      let caught: boolean = false
      try {
        await result
      } catch (error) {
        caught = true
        expect(error === thrownError).assertTrue()
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest3700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_3700
     * @tc.desc   Verify explicit generic U as number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let result = promise.catch<number>((error: Error) => {
        return 456
      })
      let value = await result
      expect(value).assertEqual(456)
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest3800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_3800
     * @tc.desc   Verify T|U Awaited type resolution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchFirstTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("original")
      let result = promise.catch<number>(() => 123)
      let value: string|number = await result
      expect(value).assertEqual("original")
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest3900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_3900
     * @tc.desc   Verify catch returns Number.MAX_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchFirstTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let result = promise.catch<number>(() => Number.MAX_VALUE)
      let value = await result
      expect(value).assertEqual(Number.MAX_VALUE)
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest4000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_4000
     * @tc.desc   Verify catch returns Number.MIN_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchFirstTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let result = promise.catch<number>(() => Number.MIN_VALUE)
      let value = await result
      expect(value).assertEqual(Number.MIN_VALUE)
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest4100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_4100
     * @tc.desc   Verify catch returns very long string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseCatchFirstTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let longStr = "a".repeat(10000)
      let result = promise.catch<string>(() => longStr)
      let value = await result
      expect(value.length).assertEqual(10000)
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest4200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_4200
     * @tc.desc   Verify catch returns large array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseCatchFirstTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let largeArray: number[] = []
      for (let i = 0; i < 10000; i++) {
        largeArray.push(i)
      }
      let result = promise.catch<number[]>(() => largeArray)
      let value = await result
      expect(value.length).assertEqual(10000)
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest4300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_4300
     * @tc.desc   Verify catch returns deeply nested object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseCatchFirstTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let deepObj = new DeepObject()
      let result = promise.catch<DeepObject>(() => deepObj)
      let value = await result
      expect((value as DeepObject).a.b.c.d.e).assertEqual("deep")
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest4400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_4400
     * @tc.desc   Verify onRejected throws Error instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let callbackError = new Error("callback error")
      let result = promise.catch(() => { throw callbackError })
      let caught: boolean = false
      try {
        await result
      } catch (error) {
        caught = true
        expect(error === callbackError).assertTrue()
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest4500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_4500
     * @tc.desc   Verify onRejected propagates the thrown Error object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let customError = new Error("custom error")
      let result = promise.catch(() => { throw customError })
      let caught: boolean = false
      try {
        await result
      } catch (error) {
        caught = true
        expect(error === customError).assertTrue()
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest4600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_4600
     * @tc.desc   Verify onRejected throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let result = promise.catch(() => { throw new TypeError("type mismatch") })
      try {
        await result
        expect().assertFail()
      } catch (error) {
        expect(error instanceof TypeError).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest4700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_4700
     * @tc.desc   Verify onRejected throws RangeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let result = promise.catch(() => { throw new RangeError("out of range") })
      try {
        await result
        expect().assertFail()
      } catch (error) {
        expect(error instanceof RangeError).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest4800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_4800
     * @tc.desc   Verify onRejected returns rejected Promise with custom error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let rejection = new Error("new rejection")
      let result = promise.catch<Promise<string>>(() => Promise.reject(rejection))
      let caught: boolean = false
      try {
        await result
      } catch (error) {
        caught = true
        expect(error === rejection).assertTrue()
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest4900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_4900
     * @tc.desc   Verify onRejected returns Promise that rejects inside
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let rejection = new Error("promise rejection")
      let result = promise.catch<Promise<string>>(() => {
        return new Promise<string>((_, reject) => {
          reject(rejection)
        })
      })
      let caught: boolean = false
      try {
        await result
      } catch (error) {
        caught = true
        expect(error === rejection).assertTrue()
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest5000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_5000
     * @tc.desc   Verify thenable object rejects in catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchFirstTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let thenable = new RejectedPromiseLike<string>(new Error("thenable rejection"))
      let result = promise.catch<PromiseLike<string>>(() => thenable)
      let caught: boolean = false
      try {
        await result
      } catch (error) {
        caught = true
        expect(error === thenable.error).assertTrue()
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest5100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_5100
     * @tc.desc   Verify try-catch inside onRejected callback catches error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let errorCaught = false
      let result = promise.catch(() => {
        try {
          throw new Error("internal error")
        } catch (e) {
          errorCaught = true
          return "recovered from internal error"
        }
      })
      let value = await result
      expect(value).assertEqual("recovered from internal error")
      expect(errorCaught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest5200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_5200
     * @tc.desc   Verify finally block executes inside onRejected callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let cleanup = false
      let result = promise.catch(() => {
        try {
          return "result"
        } finally {
          cleanup = true
        }
      })
      let value = await result
      expect(value).assertEqual("result")
      expect(cleanup).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest5300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_5300
     * @tc.desc   Verify uncaught error in onRejected causes new Promise rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let uncaughtError = new Error("uncaught in callback")
      let result = promise.catch(() => { throw uncaughtError })
      let caught: boolean = false
      try {
        await result
      } catch (error) {
        caught = true
        expect(error === uncaughtError).assertTrue()
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest5400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_5400
     * @tc.desc   Verify rejected Promise triggers onRejected callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let callbackExecuted = false
      await promise.catch(() => { callbackExecuted = true })
      expect(callbackExecuted).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest5500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_5500
     * @tc.desc   Verify resolved Promise does not trigger onRejected callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve("value")
      let callbackExecuted = false
      await promise.catch(() => { callbackExecuted = true })
      expect(callbackExecuted).assertFalse()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest5600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_5600
     * @tc.desc   Verify pending Promise triggers catch after rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let callbackExecuted = false
      let promise = new Promise<string>((_, reject) => {
        setTimeout(() => reject(new Error("delayed")), 100)
      })
      let catchPromise = promise.catch(() => { callbackExecuted = true })
      expect(callbackExecuted).assertFalse()
      await catchPromise
      expect(callbackExecuted).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest5700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_5700
     * @tc.desc   Verify async function await rejected Promise with catch recovery
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let result = await promise.catch(() => "recovered")
      expect(result).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest5800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_5800
     * @tc.desc   Verify async function await resolved Promise, catch not executed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve("original")
      let result = await promise.catch(() => "should not execute")
      expect(result).assertEqual("original")
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest5900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_5900
     * @tc.desc   Verify onRejected as async function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let result = promise.catch<string>(async () => {
        await new Promise<number>((resolve) => { setTimeout(() => resolve(0), 100) })
        return "async recovered"
      })
      let value = await result
      expect(value).assertEqual("async recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest6000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_6000
     * @tc.desc   Verify onRejected throws a custom error class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject(new Error("test"))
      let customError = new CustomError("custom error")
      let result = promise.catch(() => {
        throw customError
      })
      let caught: boolean = false
      try {
        await result
      } catch (error) {
        caught = true
        expect(error === customError).assertTrue()
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFirstTest6100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FIRST_TEST_6100
     * @tc.desc   Verify onRejected receives a custom Error type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFirstTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let customError = new CustomError("custom failed")
      let promise = Promise.reject<string>(customError)
      let errorReceived: Error|null = null
      let resultPromise = promise.catch((error: Error) => {
        errorReceived = error
        return "recovered"
      })
      await resultPromise
      expect(errorReceived === customError).assertTrue()
      Done();
    })
  })
}
