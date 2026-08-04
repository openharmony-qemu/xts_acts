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

class StatusResult {
  status: string = ""
  constructor(status: string) {
    this.status = status
  }
}

class GenericObject {
  status: string = ""
  constructor(status: string) {
    this.status = status
  }
}

export default function BuiltinsPromiseCatchSecondTest(): void {
  describe('BuiltinsPromiseCatchSecondTest', (): void => {
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
     * @tc.name   PromiseCatchSecondTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_0100
     * @tc.desc   Verify multiple catch chain calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchSecondTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("error1"))
      let value = await promise
        .catch(() => { throw new Error("error2") })
        .catch(() => { throw new Error("error3") })
        .catch((error: Error) => {
          return "caught"
        })
      expect(value).assertEqual("caught")
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_0200
     * @tc.desc   Verify catch recovery then continue then chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchSecondTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let results: number[] = []
      await promise
        .catch(() => {
          results.push(1)
          return 100
        })
        .then(value => {
          results.push(2)
          expect(value).assertEqual(100)
          return value
        })
        .finally(() => { results.push(3) })
      expect(results.length).assertEqual(3)
      expect(results[0]).assertEqual(1)
      expect(results[1]).assertEqual(2)
      expect(results[2]).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_0300
     * @tc.desc   Verify Promise.race with catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchSecondTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = new Promise<string>((_, reject) => {
        setTimeout(() => reject(new Error("race reject")), 100)
      })
      let promise2 = new Promise<string>(resolve => {
        setTimeout(() => resolve("slow"), 100)
      })
      let result = Promise.race<string>([promise1, promise2])
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
     * @tc.name   PromiseCatchSecondTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_0400
     * @tc.desc   Verify Promise.all with one rejected, overall catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchSecondTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve("value1")
      let promise2 = Promise.reject<string>(new Error("all reject"))
      let promise3 = Promise.resolve("value3")
      let caught: boolean = false
      try {
        await Promise.all([promise1, promise2, promise3])
        expect().assertFail()
      } catch (error) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_0500
     * @tc.desc   Verify multiple rejected Promises concurrent catch recovery
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchSecondTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = [
        Promise.reject<string>(new Error("error1")),
        Promise.reject<string>(new Error("error2")),
        Promise.reject<string>(new Error("error3"))
      ]
      let results = await Promise.all(
        promises.map(p => p.catch(() => "recovered"))
      )
      expect(results[0]).assertEqual("recovered")
      expect(results[1]).assertEqual("recovered")
      expect(results[2]).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_0600
     * @tc.desc   Verify resolved Promise then and catch competition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchSecondTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve("value")
      let thenExecuted = false
      let catchExecuted = false
      await promise
        .then(() => { thenExecuted = true })
        .catch(() => { catchExecuted = true })
      expect(thenExecuted).assertTrue()
      expect(catchExecuted).assertFalse()
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_0700
     * @tc.desc   Verify setTimeout delayed reject Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchSecondTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<string>((_, reject) => {
        setTimeout(() => reject(new Error("delayed reject")), 100)
      })
      let caught: boolean = false
      try {
        await promise
        expect().assertFail()
      } catch (error) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_0800
     * @tc.desc   Verify onRejected with setTimeout delayed return
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchSecondTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let result = promise.catch(() => {
        return new Promise<string>(resolve => {
          setTimeout(() => resolve("delayed recovery"), 100)
        })
      })
      let value = await result
      expect(value).assertEqual("delayed recovery")
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_0900
     * @tc.desc   Verify onRejected callback without parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchSecondTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("specific error"))
      let result = promise.catch(() => "generic recovery")
      let value = await result
      expect(value).assertEqual("generic recovery")
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_1000
     * @tc.desc   Verify comparison with parameterized catch can access error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchSecondTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("error2"))
      let result = promise.catch((error: Error) => {
        return "recovered"
      })
      let value = await result
      expect(value).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_1100
     * @tc.desc   Verify no-param catch can only do generic processing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchSecondTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("unknown error"))
      let result = promise.catch(() => "generic recovery")
      let value = await result
      expect(value).assertEqual("generic recovery")
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_1200
     * @tc.desc   Verify no-param catch for simple recovery
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchSecondTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("error"))
      let result = promise.catch(() => "default value")
      let value = await result
      expect(value).assertEqual("default value")
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_1300
     * @tc.desc   Verify parameterized catch for branch processing by error type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchSecondTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new TypeError("type error"))
      let result = promise.catch((error: Error) => {
        if (error instanceof TypeError) {
          return "type error recovery"
        }
        return "generic recovery"
      })
      let value = await result
      expect(value).assertEqual("type error recovery")
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_1400
     * @tc.desc   Verify no-param catch cannot log error details
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchSecondTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("critical error"))
      let logMessage = "出错了"
      let result = promise.catch(() => logMessage)
      let value = await result
      expect(value).assertEqual("出错了")
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_1500
     * @tc.desc   Verify generic U default value never when not specified
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchSecondTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let result = promise.catch(() => { throw new Error("always throw") })
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
     * @tc.name   PromiseCatchSecondTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_1600
     * @tc.desc   Verify U = never, Awaited<T|never> = Awaited<T>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchSecondTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<number>(100)
      let result = promise.catch(() => { return undefined as Object as number })
      let value: number = await result
      expect(value).assertEqual(100)
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_1700
     * @tc.desc   Verify explicit generic U as string type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchSecondTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<number>(new Error("test"))
      let result = promise.catch<string>(() => "recovered")
      let value: number|string = await result
      expect(typeof value === "string").assertTrue()
      expect(value).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_1800
     * @tc.desc   Verify explicit generic U as number type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchSecondTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let result = promise.catch<number>(() => 200)
      let value: string|number = await result
      expect(typeof value === "number").assertTrue()
      expect(value).assertEqual(200)
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_1900
     * @tc.desc   Verify explicit generic U as object type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchSecondTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let result = promise.catch<GenericObject>(() => new GenericObject("recovered"))
      let value: string|GenericObject = await result
      expect(typeof value === "object").assertTrue()
      expect((value as GenericObject).status).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_2000
     * @tc.desc   Verify explicit generic U as array type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchSecondTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let result = promise.catch<number[]>(() => [1, 2, 3])
      let value: string|number[] = await result
      expect(Array.isArray(value)).assertTrue()
      expect((value as number[]).length).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_2100
     * @tc.desc   Verify explicit generic U as Promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchSecondTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let result = promise.catch<Promise<number>>(() => Promise.resolve<number>(123.0))
      let value: string|number = await result
      expect(typeof value === "number").assertTrue()
      expect(value).assertEqual(123.0)
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_2200
     * @tc.desc   Verify explicit generic U as null type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchSecondTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let result = promise.catch<null>(() => null)
      let value: string|null = await result
      expect(value).assertNull()
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_2300
     * @tc.desc   Verify explicit generic U as undefined type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchSecondTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let result = promise.catch<undefined>(() => undefined)
      let value: string|undefined = await result
      expect(value).assertUndefined()
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_2400
     * @tc.desc   Verify explicit generic U as union type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchSecondTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let result = promise.catch<number|boolean>(() => 123)
      let value: string|number|boolean = await result
      expect(typeof value === "number").assertTrue()
      expect(value).assertEqual(123)
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_2500
     * @tc.desc   Verify T inferred from resolved Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchSecondTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve("value")
      let result = promise.catch(() => "recovered")
      let value: string = await result
      expect(value).assertEqual("value")
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_2600
     * @tc.desc   Verify T explicitly specified as number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchSecondTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<number>(new Error("test"))
      let result = promise.catch(() => 123.0)
      let value: number = await result
      expect(value).assertEqual(123.0)
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_2700
     * @tc.desc   Verify T as void type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchSecondTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<void>(new Error("test"))
      let result = promise.catch<string>(() => "recovered")
      let value: void|string = await result
      expect(typeof value === "string").assertTrue()
      expect(value).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest2800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_2800
     * @tc.desc   Verify T as never type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchSecondTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<never>(new Error("test"))
      let result = promise.catch<string>(() => "recovered")
      let value: string = await result
      expect(value).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest2900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_2900
     * @tc.desc   Verify catch returned Promise can be caught again
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchSecondTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("error1"))
      let caughtPromise = promise.catch<Promise<string>>((error: Error) => {
        return Promise.reject(new Error("error2"))
      })
      let errorCaught: boolean = false
      try {
        await caughtPromise
        expect().assertFail()
      } catch (error) {
      errorCaught = true
}
      expect(errorCaught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest3000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_3000
     * @tc.desc   Verify catch returns null, new Promise resolved as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchSecondTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let result = promise.catch<null>(() => null)
      let value = await result
      expect(value).assertNull()
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest3100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_3100
     * @tc.desc   Verify catch returns undefined, new Promise resolved as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchSecondTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let result = promise.catch<undefined>(() => undefined)
      let value = await result
      expect(value).assertUndefined()
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest3200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_3200
     * @tc.desc   Verify catch with no return value, new Promise resolved as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchSecondTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let result = promise.catch(() => {})
      let value = await result
      expect(value).assertUndefined()
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest3300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_3300
     * @tc.desc   Verify 100-layer catch chain calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseCatchSecondTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("error0"))
      let chain: Promise<string> = promise
      for (let i = 0; i < 100; i++) {
        let idx = i
        chain = chain.catch<string>(() => {
          if (idx < 99) throw new Error("error" + (idx + 1).toString())
          return "recovered" + idx.toString()
        })
      }
      let value = await chain
      expect(value.indexOf("recovered99") >= 0).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest3400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_3400
     * @tc.desc   Verify catch recovery then infinite then chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseCatchSecondTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<number>(new Error("test"))
      let chain: Promise<number> = promise.catch(() => 0.0)
      for (let i = 0; i < 100; i++) {
        chain = chain.then(value => value + 1)
      }
      let value = await chain
      expect(value).assertEqual(100)
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest3500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_3500
     * @tc.desc   Verify catch returns Date instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchSecondTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let date = new Date("2024-01-01")
      let result = promise.catch<Date>(() => date)
      let value = await result
      expect(value instanceof Date).assertTrue()
      expect((value as Date).getFullYear()).assertEqual(2024)
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest3600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_3600
     * @tc.desc   Verify catch returns Map instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchSecondTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let map = new Map<string, string>()
      map.set("key1", "value1")
      map.set("key2", "value2")
      let result = promise.catch<Map<string, string>>(() => map)
      let value = await result
      expect(value instanceof Map).assertTrue()
      expect((value as Map<string, string>).size).assertEqual(2)
      expect((value as Map<string, string>).get("key1")).assertEqual("value1")
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest3700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_3700
     * @tc.desc   Verify catch returns Set instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchSecondTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let set = new Set<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let result = promise.catch<Set<number>>(() => set)
      let value = await result
      expect(value instanceof Set).assertTrue()
      expect((value as Set<number>).size).assertEqual(3)
      expect((value as Set<number>).has(2)).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest3800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_3800
     * @tc.desc   Verify catch returns ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchSecondTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let buffer = new ArrayBuffer(10)
      let result = promise.catch<ArrayBuffer>(() => buffer)
      let value = await result
      expect(value instanceof ArrayBuffer).assertTrue()
      expect((value as ArrayBuffer).byteLength).assertEqual(10)
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest3900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_3900
     * @tc.desc   Verify catch returns Uint8Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchSecondTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let arr = new Uint8Array(5)
      arr[0] = 1
      arr[1] = 2
      arr[2] = 3
      arr[3] = 4
      arr[4] = 5
      let result = promise.catch<Uint8Array>(() => arr)
      let value = await result
      expect(value instanceof Uint8Array).assertTrue()
      expect(value.length).assertEqual(5)
      expect((value as Uint8Array)[0]).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest4000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_4000
     * @tc.desc   Verify Promise.then callback nested catch error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchSecondTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve("start")
        .then<string>(() => {
          return Promise.reject<string>(new Error("nested error"))
            .catch<string>((error: Error) => "nested-recovered")
        })
      expect(result).assertEqual("nested-recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest4100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_4100
     * @tc.desc   Verify 3 concurrent catch tasks increment shared count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchSecondTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let count = 0
      let promises: Promise<string|undefined>[] = []
      for (let i = 0; i < 3; i++) {
        let p = Promise.reject<string>(new Error("error" + i.toString()))
          .catch<string|undefined>(() => { count++; return undefined })
        promises.push(p)
      }
      await Promise.all(promises)
      expect(count).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest4200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_4200
     * @tc.desc   Verify 5 concurrent catch tasks increment shared count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchSecondTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let count = 0
      let promises: Promise<string|undefined>[] = []
      for (let i = 0; i < 5; i++) {
        let p = Promise.reject<string>(new Error("error" + i.toString()))
          .catch<string|undefined>(() => { count++; return undefined })
        promises.push(p)
      }
      await Promise.all(promises)
      expect(count).assertEqual(5)
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest4300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_4300
     * @tc.desc   Verify 10 concurrent catch tasks increment shared count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchSecondTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let count = 0
      let promises: Promise<string|undefined>[] = []
      for (let i = 0; i < 10; i++) {
        let p = Promise.reject<string>(new Error("error" + i.toString()))
          .catch<string|undefined>(() => { count++; return undefined })
        promises.push(p)
      }
      await Promise.all(promises)
      expect(count).assertEqual(10)
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest4400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_4400
     * @tc.desc   Verify EAWorker.run callback nested Promise.catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseCatchSecondTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let processedCount = 0
      let msgs = ["error1", "error2", "error3"]
      let promises: Promise<string|undefined>[] = []
      for (let i = 0; i < msgs.length; i++) {
        let p = Promise.reject<string>(new Error(msgs[i]))
          .catch<string|undefined>(() => { processedCount++; return undefined })
        promises.push(p)
      }
      await Promise.all(promises)
      expect(processedCount).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest4500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_4500
     * @tc.desc   Verify catch callbacks increment shared counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseCatchSecondTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let count = 0
      let promises: Promise<string|undefined>[] = []
      for (let i = 0; i < 100; i++) {
        let p = Promise.reject<string>(new Error("error" + i.toString()))
          .catch<string|undefined>(() => { count++; return undefined })
        promises.push(p)
      }
      await Promise.all(promises)
      expect(count).assertEqual(100)
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest4600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_4600
     * @tc.desc   Verify EAWorker.run callback catch error recovery
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseCatchSecondTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("handler error"))
      let result = promise.catch((error: Error) => {
        return "recovered"
      })
      let value = await result
      expect(value).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest4700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_4700
     * @tc.desc   Verify EAWorker.run callback catch then chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseCatchSecondTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<number>(new Error("error"))
      let result = await promise
        .catch<number>(() => 5)
        .then(v => v * 10)
        .then(v => "result: " + v.toString())
      expect(result).assertEqual("result: 50")
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest4800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_4800
     * @tc.desc   Verify catch callbacks set shared branch variable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseCatchSecondTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let branch = ""
      let p1 = Promise.reject<string>(new Error("e1")).catch(() => {
        branch = "first"
        return "done1"
      })
      let p2 = Promise.reject<string>(new Error("e2")).catch(() => {
        branch = "second"
        return "done2"
      })
      await Promise.all([p1, p2])
      expect(branch === "first" || branch === "second").assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest4900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_4900
     * @tc.desc   Verify catch timeout with AtomicBoolean wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseCatchSecondTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let slowReject = new Promise<string>((_, reject) => {
        setTimeout(() => reject(new Error("slow")), 200)
      })
      let result = await Promise.race([
        slowReject.catch<string>(() => "caught"),
        new Promise<string>(resolve => {
          setTimeout(() => resolve("timeout"), 100)
        })
      ])
      expect(result).assertEqual("timeout")
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest5000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_5000
     * @tc.desc   Verify count wait replaces Timer wait for catch completion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchSecondTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let completedCount = 0
      let totalTasks = 5
      let results: string[] = []
      let promises: Promise<string|undefined>[] = []
      for (let i = 0; i < totalTasks; i++) {
        let p = Promise.reject<string>(new Error("e" + i.toString()))
          .catch<string|undefined>(() => {
            results.push("recovered" + i.toString())
            completedCount++
            return undefined
          })
        promises.push(p)
      }
      await Promise.all(promises)
      expect(completedCount).assertEqual(totalTasks)
      expect(results.length).assertEqual(5)
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest5100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_5100
     * @tc.desc   Verify catch returns object with string-keyed properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseCatchSecondTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let obj: Record<string, string> = {}
      obj["symkey"] = "symbol value"
      obj["normal"] = "normal value"
      let result = promise.catch<Record<string, string>>(() => obj)
      let value = await result
      expect((value as Record<string, string>)["normal"]).assertEqual("normal value")
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest5200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_5200
     * @tc.desc   Verify catch returns object with circular reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseCatchSecondTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let obj: Record<string, Object> = {}
      obj["name"] = "obj"
      obj["self"] = obj
      let result = promise.catch<Record<string, Object>>(() => obj)
      let value = await result
      expect((value as Record<string, Object>)["name"]).assertEqual("obj")
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest5300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_5300
     * @tc.desc   EAWorker.run callback catch recovery v2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseCatchSecondTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('catch2Worker')
      eaWorker.start()

      let job = eaWorker.run<string>(() => {
        return "EAWorker recovered"
      })
      let workerResult = job.Await()

      let result = await Promise.reject<string>(new Error("eaWorker catch test"))
        .catch<string>((error: Error) => {
          return workerResult
        })
      expect(result).assertEqual("EAWorker recovered")
      await eaWorker.join()
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest5400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_5400
     * @tc.desc   EAWorker.run callback catch then chain v2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseCatchSecondTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('chainCatch2Worker')
      eaWorker.start()

      let job = eaWorker.run<int>(() => {
        return 50
      })
      let baseValue = job.Await()

      let result = await Promise.reject<number>(new Error("fail"))
        .catch<number>((e: Error) => baseValue)
        .then<number>((v: number) => v * 2)
        .then<string>((v: number) => "result: " + v.toString())
      expect(result).assertEqual("result: 100")
      await eaWorker.join()
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest5500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_5500
     * @tc.desc   EAWorker.run callback catch finally full chain v2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseCatchSecondTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('fullCatchWorker')
      eaWorker.start()
      let cleanupExecuted = false

      let job = eaWorker.run<string>(() => {
        return "recovered"
      })
      let workerResult = job.Await()

      let result = await Promise.reject<string>(new Error("test"))
        .catch<string>((e: Error) => workerResult)
        .then<string>((v: string) => { cleanupExecuted = true; return v })
      expect(result).assertEqual("recovered")
      expect(cleanupExecuted).assertTrue()
      await eaWorker.join()
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest5600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_5600
     * @tc.desc   EAWorker.run callback catch recovery v2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseCatchSecondTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('msgCatch2Worker')
      eaWorker.start()

      let job = eaWorker.run<string>((msg: string): string => {
        return "msg recovered: " + msg
      }, "hello")
      let workerResult = job.Await()

      let result = await Promise.reject<string>(new Error("msg error"))
        .catch<string>((error: Error) => workerResult)
      expect(result).assertEqual("msg recovered: hello")
      await eaWorker.join()
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest5700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_5700
     * @tc.desc   EAWorker.run callback catch then chain v2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseCatchSecondTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('msgChainCatchWorker')
      eaWorker.start()

      let job = eaWorker.run<int>((data: int): int => {
        return data
      }, 5)
      let baseValue = job.Await()

      let result = await Promise.reject<number>(new Error("error"))
        .catch<number>((e: Error) => baseValue)
        .then<number>((v: number) => v * 100)
        .then<string>((v: number) => "final: " + v.toString())
      expect(result).assertEqual("final: 500")
      await eaWorker.join()
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest5800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_5800
     * @tc.desc   EAWorker.run callback nested catch equivalence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseCatchSecondTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('catchEquivWorker')
      eaWorker.start()

      let job = eaWorker.run<string>(() => {
        return "worker-catch-recovered"
      })
      let workerResult = job.Await()

      let result = await Promise.reject<string>(new Error("worker error"))
        .catch<string>((error: Error) => workerResult)
      expect(result).assertEqual("worker-catch-recovered")

      await eaWorker.join()
      Done();
    })

    /**
     * @tc.name   PromiseCatchSecondTest5900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_SECOND_TEST_5900
     * @tc.desc   EAWorker.run callback nested catch equivalence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseCatchSecondTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let processedCount = new AtomicInt(0)
      let eaWorker = new EAWorker('msgCatchEquivWorker')
      eaWorker.start()

      let job = eaWorker.run<int>((m1: string, m2: string, m3: string): int => {
        return 3
      }, "error1", "error2", "error3")
      let workerResult = job.Await()

      let p1 = Promise.reject<void>(new Error("error1")).catch<void>(() => { processedCount.fetchAdd(1) })
      let p2 = Promise.reject<void>(new Error("error2")).catch<void>(() => { processedCount.fetchAdd(1) })
      let p3 = Promise.reject<void>(new Error("error3")).catch<void>(() => { processedCount.fetchAdd(1) })
      await Promise.all<void>([p1, p2, p3])
      expect(processedCount.load()).assertEqual(3)

      await eaWorker.join()
      Done();
    })
  })
}
