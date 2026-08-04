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


class NetworkError extends Error {
  ecode: number
  constructor(message: string, ecode: number) {
    super(message)
    this.name = "NetworkError"
    this.ecode = ecode
  }
}
class HandlerError extends Error {
  constructor(message: string) {
    super(message)
    this.name = "HandlerError"
  }
}
class RecoveryData {
  status: string = ""
  value: number = 0
  constructor(status: string, value: number) {
    this.status = status
    this.value = value
  }
}
class DeepObj {
  level1: DeepObjL2 = new DeepObjL2()
}
class DeepObjL2 {
  level2: DeepObjL3 = new DeepObjL3()
}
class DeepObjL3 {
  level3: string = ""
  constructor() { this.level3 = "recovered" }
}
class EmptyObj {}
class CustomPromiseLike<T> implements PromiseLike<T> {
  value: T
  constructor(value: T) { this.value = value }
  then<U, E>(onFulfilled: ((value: T) => U | PromiseLike<U>), onRejected: ((reason: Error) => E | PromiseLike<E>) | undefined): PromiseLike<Awaited<U> | Awaited<E>> {
    if (onFulfilled) { onFulfilled(this.value) }
    return Promise.resolve<T>(this.value) as PromiseLike<Awaited<U> | Awaited<E>>
  }
}
export default function BuiltinsPromiseCatchThirdTest(): void {
  describe('BuiltinsPromiseCatchThirdTest', (): void => {
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
     * @tc.name   PromiseCatchThirdTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_0100
     * @tc.desc   Verify no onRejected parameter passes through error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchThirdTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("failed"))
      let resultPromise = promise.catch()
      let caught = false
      await resultPromise.catch(() => {
        caught = true
      })
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_0200
     * @tc.desc   Verify providing onRejected callback function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchThirdTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("failed"))
      let resultPromise = promise.catch((error: Error) => "recovered")
      let result = await resultPromise
      expect(result).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_0300
     * @tc.desc   Verify passing undefined as onRejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchThirdTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("failed"))
      let resultPromise = promise.catch(undefined)
      let caught = false
      await resultPromise.catch(() => {
        caught = true
      })
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_0400
     * @tc.desc   Verify callback returns number type recovery value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchThirdTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<number>(new Error("failed"))
      let resultPromise = promise.catch<number>((error: Error) => 42)
      let result = await resultPromise
      expect(result).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_0500
     * @tc.desc   Verify callback returns string type recovery value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchThirdTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("failed"))
      let resultPromise = promise.catch<string>((error: Error) => "recovered")
      let result = await resultPromise
      expect(result).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_0600
     * @tc.desc   Verify callback returns boolean type recovery value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchThirdTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<boolean>(new Error("failed"))
      let resultPromise = promise.catch<boolean>((error: Error) => true)
      let result = await resultPromise
      expect(result).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_0700
     * @tc.desc   Verify callback returns void type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchThirdTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<void>(new Error("failed"))
      let resultPromise = promise.catch<string|undefined>((error: Error) => undefined)
      let result = await resultPromise
      expect(result).assertUndefined()
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_0800
     * @tc.desc   Verify callback returns null value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchThirdTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("failed"))
      let resultPromise = promise.catch<null>((error: Error) => null)
      let result = await resultPromise
      expect(result).assertNull()
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_0900
     * @tc.desc   Verify callback returns object type recovery value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchThirdTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<RecoveryData>(new Error("failed"))
      let resultPromise = promise.catch<RecoveryData>((error: Error) => new RecoveryData("recovered", 100))
      let result = await resultPromise
      expect(result.status).assertEqual("recovered")
      expect(result.value).assertEqual(100)
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_1000
     * @tc.desc   Verify callback returns array type recovery value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchThirdTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<number[]>(new Error("failed"))
      let resultPromise = promise.catch<number[]>((error: Error) => [1.0, 2.0, 3.0])
      let result = await resultPromise
      expect(result.length).assertEqual(3)
      expect(result[0]).assertEqual(1.0)
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_1100
     * @tc.desc   Verify callback returns union type value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchThirdTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string|number>(new Error("failed"))
      let resultPromise = promise.catch<string|number>((error: Error) => 123)
      let result = await resultPromise
      expect(result).assertEqual(123)
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_1200
     * @tc.desc   Verify callback returns Promise object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchThirdTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("failed"))
      let resultPromise = promise.catch<string>((error: Error) => Promise.resolve("async recovered"))
      let result = await resultPromise
      expect(result).assertEqual("async recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_1300
     * @tc.desc   Verify callback returns PromiseLike object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchThirdTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike = new CustomPromiseLike<string>("promiseLike value")
      let promise = Promise.reject<string>(new Error("failed"))
      let resultPromise = promise.catch<string>((error: Error) => promiseLike)
      let result = await resultPromise
      expect(result).assertEqual("promiseLike value")
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_1400
     * @tc.desc   Verify onRejected receives normal Error object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchThirdTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("operation failed"))
      let result = await promise.catch((error: Error) => {
        expect(error instanceof Error).assertTrue();
        return "recovered"
      })
      expect(result).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_1500
     * @tc.desc   Verify onRejected receives custom Error type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchThirdTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let customErr = new Error()
      customErr.message = "custom failed"
      customErr.name = "CustomError"
      let promise = Promise.reject<string>(customErr)
      let result = await promise.catch((error: Error) => {
        expect(error instanceof Error).assertTrue();
        return "recovered"
      })
      expect(result).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_1600
     * @tc.desc   Verify onRejected receives Error with stack info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchThirdTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let error = new Error("failed")
      error.stack = "Error stack trace"
      let promise = Promise.reject<string>(error)
      let hasStack: boolean = false
      let resultPromise = promise.catch((error: Error) => {
        hasStack = error.stack !== null
        return "recovered"
      })
      await resultPromise
      expect(hasStack).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_1700
     * @tc.desc   Verify onRejected receives empty Error object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchThirdTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error())
      let result = await promise.catch((error: Error) => {
        expect(error instanceof Error).assertTrue();
        return "recovered"
      })
      expect(result).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_1800
     * @tc.desc   Verify onRejected callback throws Error inside
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchThirdTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("first error"))
      let resultPromise = promise.catch((error: Error) => { throw new Error("second error") })
      let caught = false
      await resultPromise.catch(() => {
        caught = true
      })
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_1900
     * @tc.desc   Verify onRejected returns rejected Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchThirdTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("first error"))
      let resultPromise = promise.catch<string>((error: Error) => Promise.reject(new Error("second error")))
      let caught = false
      await resultPromise.catch(() => {
        caught = true
      })
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_2000
     * @tc.desc   Verify null as callback parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchThirdTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("failed"))
      let caught = false
      try {
        let resultPromise = promise.catch(null as Object as (error: Error) => string)
        await resultPromise.catch(() => {
          caught = true
        })
      } catch (error) {
        caught = true
        expect(error instanceof Error).assertTrue();
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_2100
     * @tc.desc   Verify non-function type as onRejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchThirdTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("failed"))
      let caught = false
      try {
        let resultPromise = promise.catch(123 as Object as (error: Error) => string)
        await resultPromise
      } catch (error) {
        caught = true
        expect(error instanceof Error).assertTrue();
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_2200
     * @tc.desc   Verify callback return type mismatch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchThirdTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<number>(new Error("failed"))
      let resultPromise = promise.catch<string>((error: Error) => {
        return "string instead of number"
      })
      let result = await resultPromise
      expect(typeof result === "string").assertTrue()
      expect(result).assertEqual("string instead of number")
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_2300
     * @tc.desc   Verify catch returns new Promise object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchThirdTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("failed"))
      let resultPromise = promise.catch<string>((error: Error) => "recovered")
      let result = await resultPromise
      expect(result).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_2400
     * @tc.desc   Verify rejected Promise recovers through catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchThirdTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("failed"))
      let resultPromise = promise.catch<string>((error: Error) => {
        return "recovered"
      })
      let result = await resultPromise
      expect(result).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_2500
     * @tc.desc   Verify catch can chain then
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchThirdTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("failed"))
      let result = await promise.catch<string>((error: Error) => "recovered")
        .then((result: string) => {
          expect(result).assertEqual("recovered")
          return result
        })
      expect(result).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_2600
     * @tc.desc   Verify catch can chain another catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchThirdTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("first error"))
      let result = await promise.catch<string>((error: Error) => {
        throw new Error("second error")
      }).catch((error: Error) => {
        return "final recovery"
      })
      expect(result).assertEqual("final recovery")
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_2700
     * @tc.desc   Verify catch can chain finally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchThirdTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("failed"))
      let finallyCalled = false
      let result = await promise.catch<string>((error: Error) => "recovered")
        .finally(() => { finallyCalled = true })
      expect(finallyCalled).assertTrue()
      expect(result).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest2800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_2800
     * @tc.desc   Verify resolved Promise calling catch does not affect result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchThirdTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve("success")
      let catchCalled = false
      let resultPromise = promise.catch<string>((error: Error) => {
        catchCalled = true
        return "recovered"
      })
      let result = await resultPromise
      expect(catchCalled).assertFalse()
      expect(result).assertEqual("success")
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest2900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_2900
     * @tc.desc   Verify catch callback returns null as recovery value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchThirdTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("failed"))
      let resultPromise = promise.catch<null>((error: Error) => {
        return null
      })
      let result = await resultPromise
      expect(result).assertNull()
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest3000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_3000
     * @tc.desc   Verify catch callback returns undefined as recovery value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchThirdTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("failed"))
      let resultPromise = promise.catch<string|undefined>((error: Error) => {
        return undefined
      })
      let result = await resultPromise
      expect(result).assertUndefined()
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest3100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_3100
     * @tc.desc   Verify catch callback returns empty string as recovery value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchThirdTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("failed"))
      let resultPromise = promise.catch<string>((error: Error) => "")
      let result = await resultPromise
      expect(result).assertEqual("")
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest3200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_3200
     * @tc.desc   Verify catch callback returns 0 as recovery value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchThirdTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<number>(new Error("failed"))
      let resultPromise = promise.catch<number>((error: Error) => 0)
      let result = await resultPromise
      expect(result).assertEqual(0)
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest3300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_3300
     * @tc.desc   Verify catch callback returns false as recovery value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchThirdTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<boolean>(new Error("failed"))
      let resultPromise = promise.catch<boolean>((error: Error) => false)
      let result = await resultPromise
      expect(result).assertFalse()
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest3400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_3400
     * @tc.desc   Verify catch callback returns empty array as recovery value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchThirdTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<number[]>(new Error("failed"))
      let resultPromise = promise.catch<number[]>((error: Error) => [])
      let result = await resultPromise
      expect(result.length).assertEqual(0)
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest3500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_3500
     * @tc.desc   Verify catch callback returns empty object as recovery value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchThirdTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<EmptyObj>(new Error("failed"))
      let resultPromise = promise.catch<EmptyObj>((error: Error) => new EmptyObj())
      let result = await resultPromise
      expect(result instanceof EmptyObj).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest3600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_3600
     * @tc.desc   Verify catch without callback returns Promise<Awaited<T>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchThirdTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("failed"))
      let resultPromise = promise.catch()
      await resultPromise.catch((error: Error) => {
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
     * @tc.name   PromiseCatchThirdTest3700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_3700
     * @tc.desc   Verify generic U default as never
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchThirdTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("failed"))
      let resultPromise = promise.catch((error: Error) => undefined)
      let result = await resultPromise
      expect(result === undefined).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest3800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_3800
     * @tc.desc   Verify specified generic U returns Promise<Awaited<T|U>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchThirdTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("failed"))
      let resultPromise = promise.catch<number>((error: Error) => 42)
      let result = await resultPromise
      expect(typeof result === "number").assertTrue()
      expect(result).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest3900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_3900
     * @tc.desc   Verify Awaited unwraps nested Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchThirdTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("failed"))
      let resultPromise = promise.catch<string>((error: Error) => Promise.resolve(Promise.resolve("deeply nested")))
      let result = await resultPromise
      expect(result).assertEqual("deeply nested")
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest4000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_4000
     * @tc.desc   Verify return value is Promise instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchThirdTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("failed"))
      let resultPromise = promise.catch<string>((error: Error) => "recovered")
      let result = await resultPromise
      expect(result).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest4100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_4100
     * @tc.desc   Verify returned Promise has then method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchThirdTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("failed"))
      let resultPromise = promise.catch<string>((error: Error) => "recovered")
      let result = await resultPromise.then((value: string) => value)
      expect(result).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest4200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_4200
     * @tc.desc   Verify generic U max type range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchThirdTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("failed"))
      let resultPromise = promise.catch<number|boolean|string>((error: Error) => 123)
      let result = await resultPromise
      expect(typeof result === "number").assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest4300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_4300
     * @tc.desc   Verify union type return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchThirdTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string|number|boolean>(new Error("failed"))
      let resultPromise = promise.catch<string|number|boolean>((error: Error) => 42)
      let result: string|number|boolean = await resultPromise
      expect(typeof result === "number").assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest4400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_4400
     * @tc.desc   Verify deep nested object return
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchThirdTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<DeepObj>(new Error("failed"))
      let resultPromise = promise.catch<DeepObj>((error: Error) => new DeepObj())
      let result = await resultPromise
      expect(result.level1.level2.level3).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest4500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_4500
     * @tc.desc   Verify catch receives standard Error object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchThirdTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let error = new Error("standard error")
      let promise = Promise.reject<string>(error)
      let result = await promise.catch((receivedError: Error) => {
        return "recovered"
      })
      expect(result).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest4600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_4600
     * @tc.desc   Verify catch receives custom Error type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchThirdTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new NetworkError("network failed", 500))
      let result = promise.catch((error: Error) => {
        if (error instanceof NetworkError) {
          expect(error.ecode).assertEqual(500)
        }
        return "recovered"
      })

      let value = await result
      expect(value).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest4700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_4700
     * @tc.desc   Verify Error property completeness
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchThirdTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let error = new Error("test error")
      error.stack = "test stack trace"
      let promise = Promise.reject<string>(error)
      let result = await promise.catch((receivedError: Error) => {
        return "recovered"
      })
      expect(result).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest4800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_4800
     * @tc.desc   Verify onRejected callback throws Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchThirdTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("first error"))
      let resultPromise = promise.catch((error: Error) => { throw new Error("error in catch handler") })
      await resultPromise.catch((finalError: Error) => {
        expect(finalError instanceof Error).assertTrue();
        return "caught";
      })
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest4900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_4900
     * @tc.desc   Verify onRejected callback throws custom Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchThirdTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("first error"))
      let resultPromise = promise.catch((error: Error) => { throw new Error("handler failed") })
      await resultPromise.catch((finalError: Error) => {
        expect(finalError instanceof Error).assertTrue();
        return "caught";
      })
      Done();
    })

    /**
     * @tc.name   PromiseCatchThirdTest5000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_THIRD_TEST_5000
     * @tc.desc   Verify throw must throw Error assignable type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchThirdTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("failed"))
      let resultPromise = promise.catch((error: Error) => { throw new Error("valid error") })
      let caught = false
      await resultPromise.catch(() => {
        caught = true
      })
      expect(caught).assertTrue()
      Done();
    })
  })
}
