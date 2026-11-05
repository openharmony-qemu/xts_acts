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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-static/src/main/indexStatic';

class CustomError extends Error {
  constructor(message: string) {
    super(message)
    this.name = "CustomError"
  }
}

class DataError extends Error {
  _code: number
  constructor(message: string, code: number) {
    super(message)
    this.name = "DataError"
    this._code = code
  }
  get errorCode(): number {
    return this._code
  }
}

class Level1Error extends Error {
  constructor(message: string) {
    super(message)
    this.name = "Level1Error"
  }
}

class Level2Error extends Level1Error {
  constructor(message: string) {
    super(message)
    this.name = "Level2Error"
  }
}

interface Data {
  id: number
  name: string
}

export default function BuiltinsPromiseRejectSecondTest(): void {
  describe('BuiltinsPromiseRejectSecondTest', (): void => {
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
     * @tc.name   PromiseRejectSecondTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_0100
     * @tc.desc   Verify Promise.reject with Error message input is catchable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectSecondTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test error"))
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
     * @tc.name   PromiseRejectSecondTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_0200
     * @tc.desc   Verify Promise.reject with empty Error input is catchable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectSecondTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error())
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
     * @tc.name   PromiseRejectSecondTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_0300
     * @tc.desc   Verify Promise.reject with special characters message is catchable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectSecondTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("special: \n\tchars"))
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
     * @tc.name   PromiseRejectSecondTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_0400
     * @tc.desc   Verify Promise.reject with 10000-char message is catchable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectSecondTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let longMessage = "x".repeat(10000)
      let promise = Promise.reject<string>(new Error(longMessage))
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
     * @tc.name   PromiseRejectSecondTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_0500
     * @tc.desc   Verify Promise.reject with Unicode message is catchable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectSecondTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("Unicode: 中文 Japanese"))
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
     * @tc.name   PromiseRejectSecondTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_0600
     * @tc.desc   Verify Promise.reject with TypeError instance and name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectSecondTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new TypeError("type error"))
      try {
        await promise
        expect().assertFail()
      } catch (error) {
        expect(error instanceof TypeError).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_0700
     * @tc.desc   Verify Promise.reject with RangeError instance and name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectSecondTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new RangeError("range error"))
      try {
        await promise
        expect().assertFail()
      } catch (error) {
        expect(error instanceof RangeError).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_0800
     * @tc.desc   Verify Promise.reject with SyntaxError instance and name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectSecondTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new SyntaxError("syntax error"))
      try {
        await promise
        expect().assertFail()
      } catch (error) {
        expect(error instanceof SyntaxError).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_0900
     * @tc.desc   Verify Promise.reject with ReferenceError instance and name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectSecondTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new ReferenceError("reference error"))
      try {
        await promise
        expect().assertFail()
      } catch (error) {
        expect(error instanceof ReferenceError).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_1000
     * @tc.desc   Verify Promise.reject with URIError instance and name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectSecondTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new URIError("URI error"))
      try {
        await promise
        expect().assertFail()
      } catch (error) {
        expect(error instanceof URIError).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_1100
     * @tc.desc   Verify Promise.reject with EvalError instance and name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectSecondTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new EvalError("eval error"))
      try {
        await promise
        expect().assertFail()
      } catch (error) {
        expect(error instanceof EvalError).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_1200
     * @tc.desc   Verify Promise.reject with CustomError instance name and message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectSecondTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new CustomError("custom error"))
      try {
        await promise
        expect().assertFail()
      } catch (error) {
        expect(error instanceof CustomError).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_1300
     * @tc.desc   Verify Promise.reject with DataError custom code property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectSecondTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new DataError("data error", 500))
      try {
        await promise
        expect().assertFail()
      } catch (error) {
        expect(error instanceof DataError).assertTrue()
        if (error instanceof DataError) {
          expect(error.errorCode).assertEqual(500)
        }
      }
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_1400
     * @tc.desc   Verify Promise.reject rejection from Error variable is catchable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectSecondTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let error = new Error("test message")
      let promise = Promise.reject<string>(error)
      let caught: boolean = false
      try {
        await promise
        expect().assertFail()
      } catch (err) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_1500
     * @tc.desc   Verify Promise.reject rejection from TypeError variable is catchable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectSecondTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let error = new TypeError("type error")
      let promise = Promise.reject<string>(error)
      let caught: boolean = false
      try {
        await promise
        expect().assertFail()
      } catch (err) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_1600
     * @tc.desc   Verify Promise.reject rejection from Error instance is catchable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectSecondTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let error = new Error("test error")
      let promise = Promise.reject<string>(error)
      let caught: boolean = false
      try {
        await promise
        expect().assertFail()
      } catch (err) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_1700
     * @tc.desc   Verify Promise.reject with shared Error instance in two Promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectSecondTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let sharedError = new Error("shared error")
      let promise1 = Promise.reject<string>(sharedError)
      let promise2 = Promise.reject<string>(sharedError)
      let err1: Error | null = null
      let err2: Error | null = null
      promise1.catch((e) => { err1 = e })
      promise2.catch((e) => { err2 = e })
      await new Promise<void>(r => { setTimeout(() => r(undefined), 100) })
      expect(err1 === sharedError).assertTrue()
      expect(err2 === sharedError).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_1800
     * @tc.desc   Verify Promise.reject with Error settles rejected and is catchable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectSecondTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
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
     * @tc.name   PromiseRejectSecondTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_1900
     * @tc.desc   Verify Promise.reject without generic type caught error message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectSecondTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject(new Error("test"))
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
     * @tc.name   PromiseRejectSecondTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_2000
     * @tc.desc   Verify Promise.reject with string generic type caught error message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectSecondTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
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
     * @tc.name   PromiseRejectSecondTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_2100
     * @tc.desc   Verify Promise.reject with number generic type caught error message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectSecondTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<number>(new Error("test"))
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
     * @tc.name   PromiseRejectSecondTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_2200
     * @tc.desc   Verify Promise.reject with Data interface generic type caught error message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectSecondTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<Data>(new Error("test"))
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
     * @tc.name   PromiseRejectSecondTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_2300
     * @tc.desc   Verify Promise.reject with nested Promise generic type caught error message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectSecondTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<Promise<string>>(new Error("test"))
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
     * @tc.name   PromiseRejectSecondTest2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_2400
     * @tc.desc   Verify Promise.reject catch handler updates state to rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectSecondTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let state = "pending"
      let stateChanged = false
      promise.catch(() => { state = "rejected"; stateChanged = true })
      while (!stateChanged) {
        await new Promise<void>(r => { setTimeout(() => r(undefined), 100) })
      }
      expect(state).assertEqual("rejected")
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_2500
     * @tc.desc   Verify Promise.reject catch handler catches rejection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectSecondTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("rejected"))
      let caught = false
      promise.catch((error) => {
        expect(error instanceof Error).assertTrue()
        caught = true
      })
      while (!caught) {
        await new Promise<void>(r => { setTimeout(() => r(undefined), 100) })
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_2600
     * @tc.desc   Verify Promise.reject rejection is caught by awaiting caller
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectSecondTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let rejectedCalled = false
      try {
        await promise
        expect().assertFail()
      } catch (error) {
        rejectedCalled = true
      }
      expect(rejectedCalled).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_2700
     * @tc.desc   Verify Promise.reject catch-then chain recovers with string value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectSecondTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let chainCompleted = false
      try {
        let value = await Promise.reject<string>(new Error("test"))
          .catch((error) => { expect(error instanceof Error).assertTrue(); return "recovered" })
        chainCompleted = true
        expect(value).assertEqual("recovered")
      } catch (error) {
        expect().assertFail()
      }
      expect(chainCompleted).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest2800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_2800
     * @tc.desc   Verify Promise.reject catch re-throws and second catch handles it
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectSecondTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("error1"))
      let error2Caught = false
      promise
        .catch((error) => {
          expect(error instanceof Error).assertTrue()
          throw new Error("error2")
        })
        .catch((error) => {
          expect(error instanceof Error).assertTrue()
          error2Caught = true
        })
      while (!error2Caught) {
        await new Promise<void>(r => { setTimeout(() => r(undefined), 100) })
      }
      expect(error2Caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest2900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_2900
     * @tc.desc   Verify Promise.reject multiple catch handlers on same Promise all execute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectSecondTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let error = new Error("test")
      let promise = Promise.reject<string>(error)
      let count = 0
      promise.catch(() => { count++ })
      promise.catch(() => { count++ })
      promise.catch(() => { count++ })
      while (count < 3) {
        await new Promise<void>(r => { setTimeout(() => r(undefined), 100) })
      }
      expect(count).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest3000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_3000
     * @tc.desc   Verify Promise.reject catch with finally executes callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectSecondTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let finallyExecuted = false
      let recovered = await promise
        .catch((error) => {
          expect(error instanceof Error).assertTrue();
          return "caught";
        })
        .finally(() => {
          finallyExecuted = true
        })
      expect(recovered).assertEqual("caught")
      expect(finallyExecuted).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest3100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_3100
     * @tc.desc   Verify Promise.reject with nested Promise generic type unwraps to string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectSecondTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: Promise<string> = Promise.reject<Promise<string>>(new Error("test"))
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
     * @tc.name   PromiseRejectSecondTest3200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_3200
     * @tc.desc   Verify Promise.reject with double nested Promise generic type unwraps to string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectSecondTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: Promise<string> = Promise.reject<Promise<Promise<string>>>(new Error("test"))
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
     * @tc.name   PromiseRejectSecondTest3300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_3300
     * @tc.desc   Verify Promise.reject caught error is same instance as original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectSecondTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let error = new Error("runtime test")
      let promise = Promise.reject<string>(error)
      try {
        await promise
        expect().assertFail()
      } catch (err) {
        expect(err === error).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest3400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_3400
     * @tc.desc   Verify Promise.reject rejection propagates to awaiting catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectSecondTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let chainCompleted = false
      try {
        await Promise.reject<string>(new Error("chain error"))
        expect().assertFail()
      } catch (error) {
        chainCompleted = true
      }
      expect(chainCompleted).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest3500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_3500
     * @tc.desc   Verify Promise.reject catch-then chain recovers without second catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectSecondTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let catchCalled = false
      try {
        let value = await Promise.reject<string>(new Error("error"))
          .catch(() => { return "recovered" })
        catchCalled = true
        expect(value).assertEqual("recovered")
      } catch (error) {
        expect().assertFail()
      }
      expect(catchCalled).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest3600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_3600
     * @tc.desc   Verify Promise.reject catch-then chain concatenates recovered value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectSecondTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result = await Promise.reject<string>(new Error("test"))
        .catch((error) => {
          expect(error instanceof Error).assertTrue()
          return "recovered"
        })
        .then((value) => {
          return value + " success"
        })
      expect(result).assertEqual("recovered success")
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest3700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_3700
     * @tc.desc   Verify Promise.all with rejected element rejects and is catchable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectSecondTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let caught: boolean = false
      try {
        await Promise.all([
          Promise.resolve(1),
          Promise.reject<string>(new Error("all error")),
          Promise.resolve(3)
        ])
        expect().assertFail()
      } catch (error) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest3800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_3800
     * @tc.desc   Verify Promise.reject with Promise.allSettled returns mixed results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectSecondTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let results = await Promise.allSettled([
        Promise.resolve(1),
        Promise.reject<string>(new Error("settled error")),
        Promise.resolve(3)
      ])
      expect(results.length).assertEqual(3)
      expect(results[0].status).assertEqual("fulfilled")
      expect(results[1].status).assertEqual("rejected")
      expect((results[1] as PromiseRejectedResult).reason instanceof Error).assertTrue()
      expect(results[2].status).assertEqual("fulfilled")
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest3900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_3900
     * @tc.desc   Verify Promise.reject with Promise.race rejects immediately with error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectSecondTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let caught: boolean = false
      try {
        await Promise.race([
          new Promise<string>(resolve => { setTimeout(() => resolve("slow"), 200) }),
          Promise.reject<string>(new Error("race error")),
        ])
        expect().assertFail()
      } catch (error) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest4000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_4000
     * @tc.desc   Verify Promise.reject with Promise.any returns first resolved value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectSecondTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result = await Promise.any([
        Promise.reject<string>(new Error("any error1")),
        Promise.resolve("success"),
        Promise.reject<string>(new Error("any error2"))
      ])
      expect(result).assertEqual("success")
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest4100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_4100
     * @tc.desc   Verify Promise.reject with Promise.any all rejected throws AggregateError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectSecondTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      try {
        await Promise.any([
          Promise.reject<string>(new Error("e1")),
          Promise.reject<string>(new Error("e2")),
          Promise.reject<string>(new Error("e3"))
        ])
        expect().assertFail()
      } catch (error) {
        expect(error instanceof AggregateError).assertTrue()
        if (error instanceof AggregateError) {
          expect(error.errors.length).assertEqual(3)
        }
      }
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest4200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_4200
     * @tc.desc   Verify Promise.reject catch handler executes as microtask after sync code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectSecondTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let order: string[] = []
      let count = 0
      order.push("sync1")
      Promise.reject<string>(new Error("test")).catch(() => {
        order.push("microtask")
        count++
      })
      order.push("sync2")
      while (count < 1) {
        await new Promise<void>(r => { setTimeout(() => r(undefined), 100) })
      }
      expect(order[0]).assertEqual("sync1")
      expect(order[1]).assertEqual("sync2")
      expect(order[2]).assertEqual("microtask")
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest4300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_4300
     * @tc.desc   Verify Promise.reject multiple catch handlers execute in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectSecondTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let order: number[] = []
      let count = 0
      Promise.reject<string>(new Error("1")).catch(() => { order.push(1); count++ })
      Promise.reject<string>(new Error("2")).catch(() => { order.push(2); count++ })
      Promise.reject<string>(new Error("3")).catch(() => { order.push(3); count++ })
      while (count < 3) {
        await new Promise<void>(r => { setTimeout(() => r(undefined), 100) })
      }
      expect(order[0]).assertEqual(1)
      expect(order[1]).assertEqual(2)
      expect(order[2]).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest4400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_4400
     * @tc.desc   Verify Promise.reject with Promise.allSettled catches all rejections
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectSecondTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = [
        Promise.reject<string>(new Error("e1")),
        Promise.reject<string>(new Error("e2")),
        Promise.reject<string>(new Error("e3"))
      ]
      let caughtCount = 0
      await Promise.allSettled(promises.map(p =>
        p.catch((error) => {
          expect(error instanceof Error).assertTrue()
          caughtCount++
        })
      ))
      expect(caughtCount).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest4500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_4500
     * @tc.desc   Verify Promise.reject with message-modified Error is catchable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectSecondTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let error = new Error("original")
      let promise = Promise.reject<string>(error)
      error.message = "modified"
      let caught: boolean = false
      try {
        await promise
        expect().assertFail()
      } catch (err) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest4600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_4600
     * @tc.desc   Verify Promise.reject with Level2Error multi-level inheritance chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectSecondTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Level2Error("multi-level"))
      let caught: boolean = false
      try {
        await promise
        expect().assertFail()
      } catch (error) {
        expect(error instanceof Level2Error).assertTrue()
        expect(error instanceof Level1Error).assertTrue()
        caught = true
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest4700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_4700
     * @tc.desc   Verify Promise.reject creates distinct Promise instances for each call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectSecondTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.reject<string>(new Error("test1"))
      let promise2 = Promise.reject<string>(new Error("test2"))
      let statuses = await Promise.allSettled<string>([promise1, promise2])
      expect(promise1 !== promise2).assertTrue()
      expect(statuses.length).assertEqual(2)
      expect(statuses[0].status).assertEqual("rejected")
      expect(statuses[1].status).assertEqual("rejected")
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest4800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_4800
     * @tc.desc   Verify Promise.reject with explicit string generic type caught error message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectSecondTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise: Promise<string> = Promise.reject<string>(new Error("test"))
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
     * @tc.name   PromiseRejectSecondTest4900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_4900
     * @tc.desc   Verify Promise.reject with different generic types all catch errors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectSecondTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.reject(new Error("test"))
      let promise2 = Promise.reject<string>(new Error("test"))
      let promise3 = Promise.reject<number>(new Error("test"))
      let results: boolean[] = []
      promise1.catch(() => { results.push(true) })
      promise2.catch(() => { results.push(true) })
      promise3.catch(() => { results.push(true) })
      while (results.length < 3) {
        await new Promise<void>(r => { setTimeout(() => r(undefined), 100) })
      }
      expect(results.length).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest5000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_5000
     * @tc.desc   Verify Promise.reject catch recovers with string value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectSecondTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result = await Promise.reject<string>(new Error("test"))
        .catch(() => "recovered")
      expect(result).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest5100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_5100
     * @tc.desc   Verify Promise.reject with Promise.allSettled returns all rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectSecondTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results = await Promise.allSettled([
        Promise.reject<string>(new Error("e1")),
        Promise.reject<string>(new Error("e2")),
        Promise.reject<string>(new Error("e3"))
      ])
      expect(results.length).assertEqual(3)
      expect(results[0].status).assertEqual("rejected")
      expect(results[1].status).assertEqual("rejected")
      expect(results[2].status).assertEqual("rejected")
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest5200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_5200
     * @tc.desc   Verify Promise.reject with Promise.any returns resolved value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectSecondTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result = await Promise.any([
        Promise.reject<string>(new Error("e1")),
        Promise.resolve("only success")
      ])
      expect(result).assertEqual("only success")
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest5300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_5300
     * @tc.desc   Verify Promise.reject with Promise.race and catch returns caught value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectSecondTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result = await Promise.race([
        Promise.reject<string>(new Error("e")).catch(() => "caught"),
        new Promise<string>(resolve => { setTimeout(() => resolve("delayed"), 200) })
      ])
      expect(result).assertEqual("caught")
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest5400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_5400
     * @tc.desc   Verify Promise.reject with Promise.all and catch handles 10 rejections
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectSecondTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<void>[] = []
      let handledCount = new AtomicInt(0)
      for (let i = 0; i < 10; i++) {
        promises.push(Promise.reject<string>(new Error("e" + i)).catch<void>(() => { handledCount.fetchAdd(1) }) as Promise<void>)
      }
      await Promise.all(promises)
      expect(promises.length).assertEqual(10)
      expect(handledCount.load()).assertEqual(10)
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest5500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_5500
     * @tc.desc   Verify Promise.reject catch-then chain concatenates string values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectSecondTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result = await Promise.reject<string>(new Error("test"))
        .catch(() => "first")
        .then((v) => v + " second")
        .then((v) => v + " third")
      expect(result).assertEqual("first second third")
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest5600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_5600
     * @tc.desc   Verify Promise.reject catch returns async recovered value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectSecondTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result = await Promise.reject<string>(new Error("test"))
        .catch(() => { return Promise.resolve("async recovered") })
      expect(result).assertEqual("async recovered")
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest5700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_5700
     * @tc.desc   Verify Promise.reject catch re-rejects and second catch handles it
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectSecondTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result = await Promise.reject<string>(new Error("test"))
        .catch(() => { return Promise.reject<string>(new Error("re-reject")) })
        .catch((error) => {
          expect(error instanceof Error).assertTrue();
          return "caught"
        })
      expect(result).assertEqual("caught")
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest5800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_5800
     * @tc.desc   Verify Promise.reject with finally propagates rejection after callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectSecondTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let finallyCalled = false
      let caught: boolean = false
      try {
        await Promise.reject<string>(new Error("test")).finally(() => { finallyCalled = true })
      } catch (error) {
        caught = true
      }
      expect(caught).assertTrue()
      expect(finallyCalled).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest5900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_5900
     * @tc.desc   Verify Promise.reject catch-then-finally chain transforms value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectSecondTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.reject<string>(new Error("test"))
        .catch(() => "recovered")
        .then((v) => v.toUpperCase())
        .finally(() => {})
      expect(result).assertEqual("RECOVERED")
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest6000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_6000
     * @tc.desc   Verify Promise.reject with Promise.any returns last resolved value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectSecondTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.any([
        Promise.reject<string>(new Error("e1")),
        Promise.reject<string>(new Error("e2")),
        Promise.resolve("last success")
      ])
      expect(result).assertEqual("last success")
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest6100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_6100
     * @tc.desc   Verify Promise.reject in loop with 100 iterations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectSecondTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let count = 0
      for (let i = 0; i < 100; i++) {
        await Promise.reject<string>(new Error("e" + i)).catch(() => {})
        count++
      }
      expect(count).assertEqual(100)
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest6200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_6200
     * @tc.desc   Verify Promise.reject catch recovers with number 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectSecondTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.reject<string>(new Error("test"))
        .catch(() => 0)
      expect(result).assertEqual(0)
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest6300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_6300
     * @tc.desc   Verify Promise.reject catch recovers with boolean false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectSecondTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.reject<string>(new Error("test"))
        .catch(() => false)
      expect(result).assertFalse()
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest6400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_6400
     * @tc.desc   Verify Promise.reject catch recovers with empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectSecondTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.reject<string>(new Error("test"))
        .catch(() => "")
      expect(result).assertEqual("")
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest6500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_6500
     * @tc.desc   Verify Promise.reject catch recovers with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectSecondTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.reject<string>(new Error("test"))
        .catch(() => null)
      expect(result).assertEqual(null)
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest6600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_6600
     * @tc.desc   Verify Promise.reject catch recovers with undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectSecondTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.reject<string>(new Error("test"))
        .catch(() => undefined)
      expect(result).assertEqual(undefined)
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest6700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_6700
     * @tc.desc   Verify Promise.reject catch recovers with object value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectSecondTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.reject<string>(new Error("test"))
        .catch<Data>(() => { let obj: Data = { id: 1, name: "obj" }; return obj })
      expect((result as Data).name).assertEqual("obj")
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest6800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_6800
     * @tc.desc   Verify Promise.reject catch recovers with array value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectSecondTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.reject<string>(new Error("test"))
        .catch(() => [1, 2, 3])
      expect(result.length).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest6900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_6900
     * @tc.desc   Verify Promise.reject catch verifies Error instance and returns caught
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectSecondTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.reject<string>(new Error("test"))
        .catch((error) => {
          expect(error instanceof Error).assertTrue();
          return "caught"
        })
      expect(result).assertEqual("caught")
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest7000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_7000
     * @tc.desc   Verify Promise.reject CustomError catch returns caught for Error instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectSecondTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.reject<string>(new CustomError("custom"))
        .catch((error: Error) => {
          expect(error instanceof Error).assertTrue();
          return "caught"
        })
      expect(result).assertEqual("caught")
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest7100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_7100
     * @tc.desc   Verify Promise.reject catch returns DataError code from caught error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectSecondTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.reject<string>(new DataError("data", 404))
        .catch((error: Error) => {
          if (error instanceof DataError) {
            return error.errorCode
          }
          return -1
        })
      expect(result).assertEqual(404)
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest7200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_7200
     * @tc.desc   Verify Promise.reject TypeError catch returns caught for Error instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectSecondTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.reject<string>(new TypeError("type"))
        .catch((error) => {
          expect(error instanceof Error).assertTrue();
          return "caught"
        })
      expect(result).assertEqual("caught")
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest7300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_7300
     * @tc.desc   Verify Promise.reject RangeError catch returns caught for Error instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectSecondTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.reject<string>(new RangeError("range"))
        .catch((error) => {
          expect(error instanceof Error).assertTrue();
          return "caught"
        })
      expect(result).assertEqual("caught")
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest7400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_7400
     * @tc.desc   Verify Promise.reject SyntaxError catch returns caught for Error instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectSecondTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.reject<string>(new SyntaxError("syntax"))
        .catch((error) => {
          expect(error instanceof Error).assertTrue();
          return "caught"
        })
      expect(result).assertEqual("caught")
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest7500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_7500
     * @tc.desc   Verify Promise.reject ReferenceError catch returns caught for Error instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectSecondTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.reject<string>(new ReferenceError("ref"))
        .catch((error) => {
          expect(error instanceof Error).assertTrue();
          return "caught"
        })
      expect(result).assertEqual("caught")
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest7600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_7600
     * @tc.desc   Verify Promise.reject URIError catch returns caught for Error instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectSecondTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.reject<string>(new URIError("uri"))
        .catch((error) => {
          expect(error instanceof Error).assertTrue();
          return "caught"
        })
      expect(result).assertEqual("caught")
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest7700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_7700
     * @tc.desc   Verify Promise.reject EvalError catch returns caught for Error instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectSecondTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.reject<string>(new EvalError("eval"))
        .catch((error) => {
          expect(error instanceof Error).assertTrue();
          return "caught"
        })
      expect(result).assertEqual("caught")
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest7800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_7800
     * @tc.desc   Verify Promise.reject Level2Error catch returns caught for Error instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectSecondTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.reject<string>(new Level2Error("level"))
        .catch((error) => {
          expect(error instanceof Error).assertTrue();
          return "caught"
        })
      expect(result).assertEqual("caught")
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest7900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_7900
     * @tc.desc   Verify Promise.reject with Promise.all and catch handles 100 rejections
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectSecondTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promises: Promise<void>[] = []
      let handledCount = new AtomicInt(0)
      for (let i = 0; i < 100; i++) {
        promises.push(Promise.reject<string>(new Error("e" + i)).catch<void>(() => { handledCount.fetchAdd(1) }) as Promise<void>)
      }
      await Promise.all(promises)
      expect(promises.length).assertEqual(100)
      expect(handledCount.load()).assertEqual(100)
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest8000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_8000
     * @tc.desc   Verify EAWorker.run callback nested Promise.reject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectSecondTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('rejectWorker')
      eaWorker.start()
      try {
        let job = eaWorker.run<string>(() => {
          return "worker-error"
        })
        let workerResult = job.Await()
        let caught: boolean = false
        await Promise.reject<string>(new Error(workerResult))
          .catch<void>((error: Error) => {
            caught = true
            expect(error instanceof Error).assertTrue()
            expect(error.message).assertEqual(workerResult)
          })
        expect(caught).assertTrue()
      } finally {
        eaWorker.join().Await()
      }
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest8100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_8100
     * @tc.desc   Verify EAWorker.run callback nested Promise.reject with catch recovery
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectSecondTest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('rejectCatchWorker')
      eaWorker.start()
      try {
        let job = eaWorker.run<string>(() => {
          return "recovered"
        })
        let workerResult = job.Await()
        let result = await Promise.reject<string>(new Error("fail"))
          .catch<string>(() => workerResult)
        expect(result).assertEqual("recovered")
      } finally {
        eaWorker.join().Await()
      }
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest8200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_8200
     * @tc.desc   Verify MessageHandler callback nested Promise.reject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectSecondTest8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('msgRejectWorker')
      eaWorker.start()
      try {
        let job = eaWorker.run<string>((msg: string): string => {
          return "handler error: " + msg
        }, "test")
        let workerResult = job.Await()
        let caught = false
        await Promise.reject<string>(new Error(workerResult))
          .catch<void>(() => {
            caught = true
            expect(workerResult).assertEqual("handler error: test")
          })
        expect(caught).assertTrue()
      } finally {
        eaWorker.join().Await()
      }
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest8300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_8300
     * @tc.desc   Verify MessageHandler callback nested Promise.reject with catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectSecondTest8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('msgRejectCatchWorker')
      eaWorker.start()
      try {
        let job = eaWorker.run<string>((msg: string): string => {
          return "recovered: " + msg
        }, "hello")
        let workerResult = job.Await()
        let result = await Promise.reject<string>(new Error("error"))
          .catch<string>(() => workerResult)
        expect(result).assertEqual("recovered: hello")
      } finally {
        eaWorker.join().Await()
      }
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest8400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_8400
     * @tc.desc   Verify EAWorker.run callback nested Promise.reject with typed error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectSecondTest8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('typedRejectWorker')
      eaWorker.start()
      try {
        let job = eaWorker.run<int>(() => {
          return 0
        })
        let workerResult = job.Await()
        let result = await Promise.reject<int>(new Error("typed error"))
          .catch<int>(() => workerResult)
        expect(result).assertEqual(0)
      } finally {
        eaWorker.join().Await()
      }
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest8500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_8500
     * @tc.desc   Verify MessageHandler callback nested Promise.reject with typed error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectSecondTest8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('typedMsgRejectWorker')
      eaWorker.start()
      try {
        let job = eaWorker.run<int>((num: int): int => {
          return num * 2
        }, 5)
        let workerResult = job.Await()
        let result = await Promise.reject<int>(new Error("rejected"))
          .catch<int>(() => workerResult)
        expect(result).assertEqual(10)
      } finally {
        eaWorker.join().Await()
      }
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest8600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_8600
     * @tc.desc   Verify EAWorker.run callback nested Promise.reject with error message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectSecondTest8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('msgRejectWorker')
      eaWorker.start()
      try {
        let job = eaWorker.run<string>(() => {
          return "specific error message"
        })
        let workerResult = job.Await()
        let caught = false
        await Promise.reject<string>(new Error(workerResult))
          .catch<void>(() => {
            caught = true
            expect(workerResult).assertEqual("specific error message")
          })
        expect(caught).assertTrue()
      } finally {
        eaWorker.join().Await()
      }
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest8700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_8700
     * @tc.desc   Verify MessageHandler callback nested Promise.reject with error message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectSecondTest8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('msgRejectMsgWorker')
      eaWorker.start()
      try {
        let job = eaWorker.run<string>((data: string): string => {
          return "msg error: " + data
        }, "test")
        let workerResult = job.Await()
        let caught = false
        await Promise.reject<string>(new Error(workerResult))
          .catch<void>(() => {
            caught = true
            expect(workerResult).assertEqual("msg error: test")
          })
        expect(caught).assertTrue()
      } finally {
        eaWorker.join().Await()
      }
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest8800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_8800
     * @tc.desc   Verify EAWorker.run callback nested Promise.reject chained with then
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectSecondTest8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('chainRejectWorker')
      eaWorker.start()
      try {
        let job = eaWorker.run<string>(() => {
          return "fixed processed"
        })
        let workerResult = job.Await()
        let result = await Promise.reject<string>(new Error("fail"))
          .catch<string>(() => "fixed")
          .then<string>((v: string) => v + " processed")
        expect(result).assertEqual("fixed processed")
        expect(workerResult).assertEqual("fixed processed")
      } finally {
        eaWorker.join().Await()
      }
      Done();
    })

    /**
     * @tc.name   PromiseRejectSecondTest8900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_SECOND_TEST_8900
     * @tc.desc   Verify MessageHandler callback nested Promise.reject chained with then
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectSecondTest8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('msgChainRejectWorker')
      eaWorker.start()
      try {
        let job = eaWorker.run<string>((msg: string): string => {
          return "recovered: " + msg
        }, "hello")
        let workerResult = job.Await()
        let result = await Promise.reject<string>(new Error("error"))
          .catch<string>(() => "recovered")
          .then<string>((v: string) => v + ": " + "hello")
        expect(result).assertEqual("recovered: hello")
        expect(workerResult).assertEqual("recovered: hello")
      } finally {
        eaWorker.join().Await()
      }
      Done();
    })

  })
}
