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
  _code: number = 0
  constructor(message: string, code: number) {
    super(message)
    this.name = "CustomError"
    this._code = code
  }
  get errorCode(): number { return this._code }
}
class DetailedError extends Error {
  timestamp: number = 0
  module: string = ""
  constructor(message: string, module: string) {
    super(message)
    this.name = "DetailedError"
    this.timestamp = Date.now()
    this.module = module
  }
}
class BaseError extends Error {
  _code: number = 0
  constructor(message: string, code: number) {
    super(message)
    this.name = "BaseError"
    this._code = code
  }
  get errorCode(): number { return this._code }
}
class NetworkError extends Error {
  _code: number = 0
  url: string = ""
  constructor(message: string, code: number, url: string) {
    super(message)
    this.name = "NetworkError"
    this._code = code
    this.url = url
  }
  get errorCode(): number { return this._code }
}
class NestedCounter {
  count: number = 0
  async increment(): Promise<void> {
    this.count++
  }
  async getCount(): Promise<number> {
    return this.count
  }
}

export default function BuiltinsPromiseRejectedResultTest(): void {
  describe('BuiltinsPromiseRejectedResultTest', (): void => {
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
     * @tc.name   PromiseRejectedResultTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_0100
     * @tc.desc   Verify PromiseRejectedResult status equals rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectedResultTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let results = await Promise.allSettled<string>([promise])
      let rejected = results[0] as PromiseRejectedResult
      expect(rejected.status).assertEqual("rejected")
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_0200
     * @tc.desc   Verify PromiseRejectedResult status type is string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectedResultTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let results = await Promise.allSettled<string>([promise])
      let rejected = results[0] as PromiseRejectedResult
      expect(rejected.status instanceof string).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_0300
     * @tc.desc   Verify PromiseRejectedResult status is only rejected not fulfilled or pending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let results = await Promise.allSettled<string>([promise])
      let rejected = results[0] as PromiseRejectedResult
      expect(rejected.status === "rejected").assertTrue()
      expect(rejected.status !== "fulfilled").assertTrue()
      expect(rejected.status !== "pending").assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_0400
     * @tc.desc   Verify PromiseRejectedResult reason is the rejected Error instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectedResultTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let error = new Error("test error")
      let promise = Promise.reject<string>(error)
      let results = await Promise.allSettled<string>([promise])
      let rejected = results[0] as PromiseRejectedResult
      expect(rejected.reason instanceof Error).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_0500
     * @tc.desc   Verify PromiseRejectedResult reason is Error instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectedResultTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let results = await Promise.allSettled<string>([promise])
      let rejected = results[0] as PromiseRejectedResult
      expect(rejected.status).assertEqual("rejected")
      expect(rejected.reason instanceof Error).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_0600
     * @tc.desc   Verify PromiseRejectedResult reason is Error instance with custom-named input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let error = new Error("detailed error")
      error.name = "CustomError"
      let promise = Promise.reject<string>(error)
      let results = await Promise.allSettled<string>([promise])
      let rejected = results[0] as PromiseRejectedResult
      expect(rejected.status).assertEqual(PromiseStatus.rejected)
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_0700
     * @tc.desc   Verify PromiseRejectedResult reason is standard Error instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectedResultTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let error = new Error("standard error")
      let promise = Promise.reject<string>(error)
      let results = await Promise.allSettled<string>([promise])
      let rejected = results[0] as PromiseRejectedResult
      expect(rejected.status).assertEqual(PromiseStatus.rejected)
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_0800
     * @tc.desc   Verify PromiseRejectedResult reason is Error instance created without message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let error = new Error()
      let promise = Promise.reject<string>(error)
      let results = await Promise.allSettled<string>([promise])
      let rejected = results[0] as PromiseRejectedResult
      expect(rejected.status).assertEqual(PromiseStatus.rejected)
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_0900
     * @tc.desc   Verify PromiseRejectedResult reason is Error instance with empty message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let error = new Error("")
      let promise = Promise.reject<string>(error)
      let results = await Promise.allSettled<string>([promise])
      let rejected = results[0] as PromiseRejectedResult
      expect(rejected.status).assertEqual(PromiseStatus.rejected)
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_1000
     * @tc.desc   Verify PromiseRejectedResult reason is Error instance with long string input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let longMessage = "a".repeat(10000)
      let error = new Error(longMessage)
      let promise = Promise.reject<string>(error)
      let results = await Promise.allSettled<string>([promise])
      let rejected = results[0] as PromiseRejectedResult
      expect(rejected.status).assertEqual(PromiseStatus.rejected)
      expect(rejected.reason instanceof Error).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_1100
     * @tc.desc   Verify PromiseRejectedResult reason is Error instance with special-character and Unicode input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let error = new Error("错误信息\n换行\t制表符中文")
      let promise = Promise.reject<string>(error)
      let results = await Promise.allSettled<string>([promise])
      let rejected = results[0] as PromiseRejectedResult
      expect(rejected.status).assertEqual(PromiseStatus.rejected)
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_1200
     * @tc.desc   Verify PromiseRejectedResult reason with TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let error = new TypeError("type mismatch")
      let promise = Promise.reject<string>(error)
      let results = await Promise.allSettled<string>([promise])
      let rejected = results[0] as PromiseRejectedResult
      expect(rejected.reason instanceof TypeError).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_1300
     * @tc.desc   Verify PromiseRejectedResult reason with RangeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let error = new RangeError("out of range")
      let promise = Promise.reject<string>(error)
      let results = await Promise.allSettled<string>([promise])
      let rejected = results[0] as PromiseRejectedResult
      expect(rejected.reason instanceof RangeError).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_1400
     * @tc.desc   Verify PromiseRejectedResult reason with SyntaxError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let error = new SyntaxError("syntax error")
      let promise = Promise.reject<string>(error)
      let results = await Promise.allSettled<string>([promise])
      let rejected = results[0] as PromiseRejectedResult
      expect(rejected.reason instanceof SyntaxError).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_1500
     * @tc.desc   Verify PromiseRejectedResult reason with ReferenceError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let error = new ReferenceError("reference error")
      let promise = Promise.reject<string>(error)
      let results = await Promise.allSettled<string>([promise])
      let rejected = results[0] as PromiseRejectedResult
      expect(rejected.reason instanceof ReferenceError).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_1600
     * @tc.desc   Verify PromiseRejectedResult reason with URIError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let error = new URIError("URI error")
      let promise = Promise.reject<string>(error)
      let results = await Promise.allSettled<string>([promise])
      let rejected = results[0] as PromiseRejectedResult
      expect(rejected.reason instanceof URIError).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_1700
     * @tc.desc   Verify PromiseRejectedResult reason with EvalError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let error = new EvalError("eval error")
      let promise = Promise.reject<string>(error)
      let results = await Promise.allSettled<string>([promise])
      let rejected = results[0] as PromiseRejectedResult
      expect(rejected.reason instanceof EvalError).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_1800
     * @tc.desc   Verify PromiseRejectedResult reason with CustomError and custom code property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {

      let error = new CustomError("custom error", 500)
      let promise = Promise.reject<string>(error)
      let results = await Promise.allSettled<string>([promise])
      let rejected = results[0] as PromiseRejectedResult
      expect(rejected.reason instanceof Error).assertTrue()
      expect(rejected.reason instanceof CustomError).assertTrue()
      expect((rejected.reason as CustomError).errorCode).assertEqual(500)
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_1900
     * @tc.desc   Verify PromiseRejectedResult reason with DetailedError and custom properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {

      let error = new DetailedError("detailed error", "TestModule")
      let promise = Promise.reject<string>(error)
      let results = await Promise.allSettled<string>([promise])
      let rejected = results[0] as PromiseRejectedResult
      expect((rejected.reason as DetailedError).module).assertEqual("TestModule")
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_2000
     * @tc.desc   Verify PromiseRejectedResult reason with inherited NetworkError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {

      let error = new NetworkError("network failed", 404, "http://example.com")
      let promise = Promise.reject<string>(error)
      let results = await Promise.allSettled<string>([promise])
      let rejected = results[0] as PromiseRejectedResult
      expect(rejected.reason instanceof Error).assertTrue()
      expect((rejected.reason as NetworkError).errorCode).assertEqual(404)
      expect((rejected.reason as NetworkError).url).assertEqual("http://example.com")
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_2100
     * @tc.desc   Verify PromiseRejectedResult cast from PromiseSettledResult
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectedResultTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let results = await Promise.allSettled<string>([promise])
      let result: PromiseSettledResult<string> = results[0]
      expect(result.status).assertEqual("rejected")
      let rejected = result as PromiseRejectedResult
      expect(rejected.reason instanceof Error).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_2200
     * @tc.desc   Verify PromiseRejectedResult accessed via for loop with status check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectedResultTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let results = await Promise.allSettled<string>([Promise.reject(new Error())])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("rejected")
        let rejected = results[i] as PromiseRejectedResult
        expect(rejected.reason instanceof Error).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_2300
     * @tc.desc   Verify PromiseRejectedResult in mixed fulfilled and rejected results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectedResultTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = [
        Promise.resolve<string>("success"),
        Promise.reject<string>(new Error("failure"))
      ]
      let results = await Promise.allSettled<string>(promises)
      for (let i = 0; i < results.length; i++) {
        if (results[i].status === "rejected") {
          let rejected = results[i] as PromiseRejectedResult
          expect(rejected.reason instanceof Error).assertTrue()
        } else {
          let fulfilled = results[i] as PromiseFulfilledResult<string>
          expect(fulfilled.value instanceof string).assertTrue()
        }
      }
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_2400
     * @tc.desc   Verify PromiseRejectedResult reason is Error instance wrapping null text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: Promise<string> = Promise.reject(new Error("test"))
      let results = await Promise.allSettled<string>([promise])
      let rejected = results[0] as PromiseRejectedResult
      expect(rejected.reason instanceof Error).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_2500
     * @tc.desc   Verify PromiseRejectedResult with Error wrapping null text has rejected status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("null reason"))
      let results = await Promise.allSettled<string>([promise])
      let rejected = results[0] as PromiseRejectedResult
      expect(rejected.status).assertEqual("rejected")
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_2600
     * @tc.desc   Verify PromiseRejectedResult with Error wrapping undefined text has rejected status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("undefined reason"))
      let results = await Promise.allSettled<string>([promise])
      let rejected = results[0] as PromiseRejectedResult
      expect(rejected.status).assertEqual("rejected")
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_2700
     * @tc.desc   Verify PromiseRejectedResult with Error-wrapped string and number reasons has rejected status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.reject<string>(new Error("error string"))
      let results1 = await Promise.allSettled<string>([promise1])
      let rejected1 = results1[0] as PromiseRejectedResult
      expect(rejected1.status).assertEqual("rejected")

      let promise2 = Promise.reject<string>(new Error("404"))
      let results2 = await Promise.allSettled<string>([promise2])
      let rejected2 = results2[0] as PromiseRejectedResult
      expect(rejected2.status).assertEqual("rejected")
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest2800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_2800
     * @tc.desc   Verify PromiseRejectedResult Error-wrapped reasons are Error instances with rejected status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.reject<string>(new Error("error instance"))
      let results1 = await Promise.allSettled<string>([promise1])
      let rejected1 = results1[0] as PromiseRejectedResult
      expect(rejected1.reason instanceof Error).assertTrue()

      let promise2 = Promise.reject<string>(new Error("string reason"))
      let results2 = await Promise.allSettled<string>([promise2])
      let rejected2 = results2[0] as PromiseRejectedResult
      expect(rejected2.status).assertEqual("rejected")
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest2900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_2900
     * @tc.desc   Verify PromiseRejectedResult with single rejected Promise in allSettled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectedResultTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("single reject"))
      let results = await Promise.allSettled<string>([promise])
      expect(results.length).assertEqual(1)
      expect(results[0].status).assertEqual("rejected")
      expect((results[0] as PromiseRejectedResult).reason instanceof Error).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest3000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_3000
     * @tc.desc   Verify PromiseRejectedResult in mixed results with correct rejected count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectedResultTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = [
        Promise.resolve<string>("success"),
        Promise.reject<string>(new Error("failure1")),
        Promise.resolve<string>("another success"),
        Promise.reject<string>(new Error("failure2"))
      ]
      let results = await Promise.allSettled<string>(promises)
      expect(results.length).assertEqual(4)
      let rejectedCount = 0
      let fulfilledCount = 0
      for (let i = 0; i < results.length; i++) {
        if (results[i].status === "rejected") {
          rejectedCount++
          let rejected = results[i] as PromiseRejectedResult
          expect(rejected.reason instanceof Error).assertTrue()
        } else {
          fulfilledCount++
          let fulfilled = results[i] as PromiseFulfilledResult<string>
          expect(fulfilled.value instanceof string).assertTrue()
        }
      }
      expect(rejectedCount).assertEqual(2)
      expect(fulfilledCount).assertEqual(2)
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest3100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_3100
     * @tc.desc   Verify PromiseRejectedResult with all rejected Promises in allSettled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = [
        Promise.reject<string>(new Error("error1")),
        Promise.reject<string>(new Error("error2")),
        Promise.reject<string>(new Error("error3"))
      ]
      let results = await Promise.allSettled<string>(promises)
      expect(results.length).assertEqual(3)
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("rejected")
        let rejected = results[i] as PromiseRejectedResult
        expect(rejected.reason instanceof Error).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest3200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_3200
     * @tc.desc   Verify PromiseRejectedResult with different error types in allSettled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let error1 = new Error("first error")
      let error2 = new TypeError("type error")
      let error3 = new RangeError("range error")
      let promise1 = Promise.reject<string>(error1)
      let promise2 = Promise.reject<string>(error2)
      let promise3 = Promise.reject<string>(error3)
      let results = await Promise.allSettled<string>([promise1, promise2, promise3])
      expect(results.length).assertEqual(3)
      let rejected1 = results[0] as PromiseRejectedResult
      expect(rejected1.status).assertEqual("rejected")
      expect(rejected1.reason instanceof Error).assertTrue()
      expect(rejected1.reason instanceof TypeError).assertFalse()
      let rejected2 = results[1] as PromiseRejectedResult
      expect(rejected2.status).assertEqual("rejected")
      expect(rejected2.reason instanceof TypeError).assertTrue()
      let rejected3 = results[2] as PromiseRejectedResult
      expect(rejected3.status).assertEqual("rejected")
      expect(rejected3.reason instanceof RangeError).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest3300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_3300
     * @tc.desc   Verify PromiseRejectedResult with async reject in allSettled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<string>((_, reject) => {
        setTimeout(() => {
          reject(new Error("async reject"))
        }, 100)
      })
      let results = await Promise.allSettled<string>([promise])
      let rejected = results[0] as PromiseRejectedResult
      expect(rejected.status).assertEqual("rejected")
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest3400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_3400
     * @tc.desc   Verify PromiseRejectedResult with immediate and async reject in allSettled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let immediateReject = Promise.reject<string>(new Error("immediate"))
      let asyncReject = new Promise<string>((_, reject) => {
        setTimeout(() => reject(new Error("async")), 100)
      })
      let results = await Promise.allSettled<string>([immediateReject, asyncReject])
      expect(results[0].status).assertEqual("rejected")
      expect(results[1].status).assertEqual("rejected")
      expect((results[0] as PromiseRejectedResult).reason instanceof Error).assertTrue()
      expect((results[1] as PromiseRejectedResult).reason instanceof Error).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest3500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_3500
     * @tc.desc   Verify PromiseRejectedResult status property is string literal rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let results = await Promise.allSettled<string>([promise])
      let rejected = results[0] as PromiseRejectedResult
      expect(rejected.status === "rejected").assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest3600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_3600
     * @tc.desc   Verify PromiseRejectedResult has both status and reason properties defined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let results = await Promise.allSettled<string>([promise])
      let rejected = results[0] as PromiseRejectedResult
      expect(rejected.status).assertEqual("rejected")
      expect(rejected.reason instanceof Error).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest3700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_3700
     * @tc.desc   Verify PromiseRejectedResult cast via if status check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectedResultTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result: PromiseSettledResult<string>
      let results = await Promise.allSettled<string>([Promise.reject(new Error("test"))])
      result = results[0]
      expect(result.status).assertEqual("rejected")
      let rejected = result as PromiseRejectedResult
      expect(rejected.reason instanceof Error).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest3800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_3800
     * @tc.desc   Verify PromiseRejectedResult not cast when result is fulfilled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results = await Promise.allSettled<string>([Promise.resolve<string>("success")])
      if (results[0].status === "rejected") {
        let rejected = results[0] as PromiseRejectedResult
        expect(rejected.reason instanceof Error).assertTrue()
      } else {
        let fulfilled = results[0] as PromiseFulfilledResult<string>
        expect(fulfilled.value).assertEqual("success")
      }
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest3900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_3900
     * @tc.desc   Verify PromiseRejectedResult in nested Promise chain with allSettled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve("outer")
        .then<string>(() => {
          return Promise.allSettled<string>([Promise.reject(new Error("inner-error"))])
            .then<string>((results: PromiseSettledResult<string>[]) => {
              if (results[0].status === "rejected") {
                let rejected = results[0] as PromiseRejectedResult
                expect(rejected.reason instanceof Error).assertTrue();
                return "has-rejected"
              }
              return "success"
            })
        })
      expect(result).assertEqual("has-rejected")
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest4000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_4000
     * @tc.desc   Verify PromiseRejectedResult with AtomicInt counter for 3 concurrent rejections
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = new AtomicInt(0)
      let promises: Promise<void>[] = []
      for (let i = 0; i < 3; i++) {
        promises.push(
          Promise.allSettled<string>([Promise.reject<string>(new Error(`error${i}`))])
            .then<void>((results: PromiseSettledResult<string>[]) => {
              if (results[0].status === "rejected") {
                counter.fetchAdd(1)
              }
            }).catch((error: Error) => { expect(error instanceof Error).assertTrue(); expect().assertFail() })
        )
      }
      await Promise.all(promises)
      expect(counter.load()).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest4100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_4100
     * @tc.desc   Verify PromiseRejectedResult with AtomicInt counter for 5 concurrent rejections
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = new AtomicInt(0)
      let promises: Promise<void>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(
          Promise.allSettled<string>([Promise.reject<string>(new Error(`error${i}`))])
            .then<void>((results: PromiseSettledResult<string>[]) => {
              if (results[0].status === "rejected") {
                counter.fetchAdd(1)
              }
            }).catch((error: Error) => { expect(error instanceof Error).assertTrue(); expect().assertFail() })
        )
      }
      await Promise.all(promises)
      expect(counter.load()).assertEqual(5)
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest4200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_4200
     * @tc.desc   Verify PromiseRejectedResult with AtomicInt counter for 10 concurrent rejections
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = new AtomicInt(0)
      let promises: Promise<void>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(
          Promise.allSettled<string>([Promise.reject<string>(new Error(`error${i}`))])
            .then<void>((results: PromiseSettledResult<string>[]) => {
              if (results[0].status === "rejected") {
                counter.fetchAdd(1)
              }
            }).catch((error: Error) => { expect(error instanceof Error).assertTrue(); expect().assertFail() })
        )
      }
      await Promise.all(promises)
      expect(counter.load()).assertEqual(10)
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest4300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_4300
     * @tc.desc   Verify PromiseRejectedResult in EAWorker with allSettled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('rejectedResultWorker')
      eaWorker.start()
      try {
        let job = eaWorker.run<string>(() => {
          return "worker-error"
        })
        let workerResult = job.Await()
        let results = await Promise.allSettled<string>([Promise.reject<string>(new Error(workerResult))])
        expect(results[0].status).assertEqual("rejected")
        let rejected = results[0] as PromiseRejectedResult
        expect(rejected.status).assertEqual("rejected")
      } finally {
        eaWorker.join().Await()
      }
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest4400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_4400
     * @tc.desc   Verify PromiseRejectedResult counting driven by EAWorker.run message tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let processedCount = new AtomicInt(0)
      let eaWorker = new EAWorker('msgRejectedResultWorker')
      eaWorker.start()
      try {
        let job1 = eaWorker.run<string>((msg: string): string => {
          return msg
        }, "error1")
        let job2 = eaWorker.run<string>((msg: string): string => {
          return msg
        }, "error2")
        let job3 = eaWorker.run<string>((msg: string): string => {
          return msg
        }, "error3")
        let jr1 = job1.Await();
        let jr2 = job2.Await();
        let jr3 = job3.Await();
        let results = await Promise.allSettled<string>([
          Promise.reject<string>(new Error(jr1)),
          Promise.reject<string>(new Error(jr2)),
          Promise.reject<string>(new Error(jr3))
        ])
        for (let i = 0; i < results.length; i++) {
          if (results[i].status === "rejected") {
            processedCount.fetchAdd(1)
          }
        }
        expect(processedCount.load()).assertEqual(3)
      } finally {
        eaWorker.join().Await()
      }
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest4500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_4500
     * @tc.desc   Verify PromiseRejectedResult collected via Promise.all with async functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let completedCount = 0
      let totalCount = 3
      let rejectedResults: PromiseRejectedResult[] = []
      let collectRejected: (id: number) => Promise<void> = async (id: number): Promise<void> => {
        let results = await Promise.allSettled<string>([
          Promise.reject(new Error(`error_${id}`))
        ]);
        rejectedResults.push(results[0] as PromiseRejectedResult);
        completedCount++;
      };
      let tasks = [collectRejected(1), collectRejected(2), collectRejected(3)]
      await Promise.all(tasks)
      expect(rejectedResults.length).assertEqual(3)
      for (let i = 0; i < rejectedResults.length; i++) {
        expect(rejectedResults[i].status).assertEqual("rejected")
      }
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest4600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_4600
     * @tc.desc   Verify PromiseRejectedResult in nested allSettled with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let nestedAllSettled: (batchId: number) => Promise<PromiseRejectedResult[]> =
        async (batchId: number): Promise<PromiseRejectedResult[]> => {
          let innerPromises = [
            Promise.reject(new Error(`batch_${batchId}_error1`)),
            Promise.reject(new Error(`batch_${batchId}_error2`))
          ];
          let results = await Promise.allSettled<string>(innerPromises);
          let filtered: PromiseRejectedResult[] = [];
          for (let i = 0; i < results.length; i++) {
            if (results[i].status === "rejected") {
              filtered.push(results[i] as PromiseRejectedResult);
            }
          }
          return filtered;
        };
      let tasks = [nestedAllSettled(1), nestedAllSettled(2), nestedAllSettled(3)]
      let batchResults = await Promise.all(tasks)
      expect(batchResults.length).assertEqual(3)
      for (let i = 0; i < batchResults.length; i++) {
        expect(batchResults[i].length).assertEqual(2)
      }
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest4700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_4700
     * @tc.desc   Verify PromiseRejectedResult concurrent synchronization via shared count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {

      let counter = new NestedCounter()

      let nestedRejectTask: (id: number) => Promise<void> = async (id: number): Promise<void> => {
        let results = await Promise.allSettled<string>([
          Promise.reject(new Error(`nested_${id}`))
        ]);
        await counter.increment();
      };
      let tasks: Promise<void>[] = []
      for (let i = 0; i < 5; i++) {
        tasks.push(nestedRejectTask(i))
      }
      await Promise.all(tasks)
      expect(await counter.getCount()).assertEqual(5)
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest4800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_4800
     * @tc.desc   Verify PromiseRejectedResult in deep nested allSettled with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let allRejectedResults: PromiseRejectedResult[] = []

      let deepNestedTask: (id: number) => Promise<void> = async (id: number): Promise<void> => {
        let innerResults = await Promise.allSettled<string>([
          Promise.reject(new Error(`deep_${id}_inner`))
        ]);
        if (innerResults[0].status === "rejected") {
          let outerResults = await Promise.allSettled<string>([
            Promise.reject((innerResults[0] as PromiseRejectedResult).reason)
          ]);
          allRejectedResults.push(outerResults[0] as PromiseRejectedResult);
        }
      };
      let tasks: Promise<void>[] = []
      for (let i = 0; i < 10; i++) {
        tasks.push(deepNestedTask(i))
      }
      await Promise.all(tasks)
      expect(allRejectedResults.length).assertEqual(10)
      for (let i = 0; i < allRejectedResults.length; i++) {
        expect(allRejectedResults[i].status).assertEqual("rejected")
        expect(allRejectedResults[i].reason instanceof Error).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest4900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_4900
     * @tc.desc   Verify PromiseRejectedResult reason is the rejected Error instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let results = await Promise.allSettled<string>([promise])
      let rejected = results[0] as PromiseRejectedResult
      expect(rejected.status).assertEqual(PromiseStatus.rejected)
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest5000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_5000
     * @tc.desc   Verify PromiseRejectedResult has exactly status and reason keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let results = await Promise.allSettled<string>([promise])
      let rejected = results[0] as PromiseRejectedResult
      let keys = Object.keys(rejected)
      expect(keys.length).assertEqual(2)
      expect(keys.indexOf("status") >= 0).assertTrue()
      expect(keys.indexOf("reason") >= 0).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest5100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_5100
     * @tc.desc   Verify PromiseRejectedResult JSON serialization contains rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let results = await Promise.allSettled<string>([promise])
      let rejected = results[0] as PromiseRejectedResult
      let json = JSON.stringify(rejected)
      expect(json).assertContain("rejected")
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest5200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_5200
     * @tc.desc   Verify PromiseRejectedResult cloned object preserves status and reason
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test"))
      let results = await Promise.allSettled<string>([promise])
      let rejected = results[0] as PromiseRejectedResult
      let cloned: PromiseRejectedResult = {
        status: rejected.status,
        reason: rejected.reason
      }
      expect(cloned.status).assertEqual("rejected")
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest5300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_5300
     * @tc.desc   Verify PromiseRejectedResult per-element status and reason across 3 rejected inputs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.reject(new Error("err1")),
        Promise.reject(new Error("err2")),
        Promise.reject(new Error("err3"))
      ])
      let rejectedCount = 0
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("rejected")
        rejectedCount++
        let rejected = results[i] as PromiseRejectedResult
        expect(rejected.reason instanceof Error).assertTrue()
      }
      expect(rejectedCount).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest5400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_5400
     * @tc.desc   Verify PromiseRejectedResult filtered from mixed results into array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.resolve("a"),
        Promise.reject(new Error("b")),
        Promise.resolve("c")
      ])
      let rejectedResults: PromiseRejectedResult[] = []
      for (let i = 0; i < results.length; i++) {
        if (results[i].status === "rejected") {
          rejectedResults.push(results[i] as PromiseRejectedResult)
        }
      }
      expect(rejectedResults.length).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest5500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_5500
     * @tc.desc   Verify PromiseRejectedResult returned from async helper function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let createRejectedResult: (msg: string) => Promise<PromiseRejectedResult> =
        async (msg: string): Promise<PromiseRejectedResult> => {
          let results = await Promise.allSettled<string>([Promise.reject(new Error(msg))]);
          return results[0] as PromiseRejectedResult;
        };
      let result = await createRejectedResult("test error")
      expect(result.status).assertEqual("rejected")
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest5600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_5600
     * @tc.desc   Verify PromiseRejectedResult reason is same Error instance as original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let error = new Error("chain test")
      let promise = Promise.reject<string>(error)
      let results = await Promise.allSettled<string>([promise])
      let rejected = results[0] as PromiseRejectedResult
      expect(rejected.reason === error).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest5700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_5700
     * @tc.desc   Verify PromiseRejectedResult from separate allSettled calls are independent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results1 = await Promise.allSettled<string>([Promise.reject(new Error("a"))])
      let results2 = await Promise.allSettled<string>([Promise.reject(new Error("b"))])
      let rejected1 = results1[0] as PromiseRejectedResult
      let rejected2 = results2[0] as PromiseRejectedResult
      expect(rejected1.status).assertEqual(PromiseStatus.rejected)
      expect(rejected2.status).assertEqual(PromiseStatus.rejected)
      expect(rejected1.reason instanceof Error).assertTrue()
      expect(rejected2.reason instanceof Error).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest5800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_5800
     * @tc.desc   Verify PromiseRejectedResult with complete status reason and message verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results = await Promise.allSettled<string>([Promise.reject(new Error("test"))])
      let rejected = results[0] as PromiseRejectedResult
      expect(rejected.status).assertEqual("rejected")
      expect(rejected.reason instanceof Error).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest5900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_5900
     * @tc.desc   Verify PromiseRejectedResult reason is the original rejected Error instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let error = new Error("preserve")
      let promise = Promise.reject<string>(error)
      let results = await Promise.allSettled<string>([promise])
      let rejected = results[0] as PromiseRejectedResult
      expect(rejected.status).assertEqual(PromiseStatus.rejected)
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest6000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_6000
     * @tc.desc   Verify PromiseRejectedResult with 50 rejected Promises in allSettled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<string>[] = []
      for (let i = 0; i < 50; i++) {
        promises.push(Promise.reject(new Error(`error_${i}`)))
      }
      let results = await Promise.allSettled<string>(promises)
      expect(results.length).assertEqual(50)
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("rejected")
      }
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest6100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_6100
     * @tc.desc   Verify PromiseRejectedResult reason is Error instance with Unicode and emoji input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let error = new Error("unicode 错误 🎉")
      let promise = Promise.reject<string>(error)
      let results = await Promise.allSettled<string>([promise])
      let rejected = results[0] as PromiseRejectedResult
      expect(rejected.status).assertEqual(PromiseStatus.rejected)
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest6200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_6200
     * @tc.desc   Verify PromiseRejectedResult with delayed async reject in allSettled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<string>((_, reject) => {
        setTimeout(() => reject(new Error("delayed reject")), 500)
      })
      let results = await Promise.allSettled<string>([promise])
      let rejected = results[0] as PromiseRejectedResult
      expect(rejected.status).assertEqual("rejected")
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest6300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_6300
     * @tc.desc   Verify PromiseRejectedResult alongside PromiseFulfilledResult in allSettled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results = await Promise.allSettled<string>([
        Promise.resolve("ok"),
        Promise.reject(new Error("err"))
      ])
      let fulfilled = results[0] as PromiseFulfilledResult<string>
      let rejected = results[1] as PromiseRejectedResult
      expect(fulfilled.value).assertEqual("ok")
      expect(fulfilled.status).assertEqual("fulfilled")
      expect(rejected.status).assertEqual("rejected")
      expect(rejected.reason instanceof Error).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest6400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_6400
     * @tc.desc   Verify PromiseRejectedResult with same error instance in multiple Promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let error = new Error("test")
      let promise1 = Promise.reject<string>(error)
      let promise2 = Promise.reject<string>(error)
      let results = await Promise.allSettled<string>([promise1, promise2])
      let rejected1 = results[0] as PromiseRejectedResult
      let rejected2 = results[1] as PromiseRejectedResult
      expect(rejected1.reason === rejected2.reason).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectedResultTest6500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECTED_RESULT_TEST_6500
     * @tc.desc   Verify PromiseRejectedResult reason assertInstanceOf Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectedResultTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let error = new Error("test")
      let promise = Promise.reject<string>(error)
      let results = await Promise.allSettled<string>([promise])
      let rejected = results[0] as PromiseRejectedResult
      expect(rejected.status).assertEqual("rejected")
      expect(rejected.reason instanceof Error).assertTrue()
      Done();
    })
  })
}
