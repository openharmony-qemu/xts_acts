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

interface Data { id: number; name: string }
interface DataObj { key: string; count: number }

class CustomError extends Error {
  escode: number
  constructor(message: string, code: number) {
    super(message)
    this.name = "CustomError"
    this.escode = code
  }
}

export default function BuiltinsPromiseSettledResultTest(): void {
  describe('BuiltinsPromiseSettledResultTest', (): void => {
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
     * @tc.name   PromiseSettledResultTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_0100
     * @tc.desc   Verify PromiseFulfilledResult value from allSettled with resolved string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseSettledResultTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([Promise.resolve<string>("success")])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("fulfilled")
        let fulfilled = results[i] as PromiseFulfilledResult<string>
        expect(fulfilled.value).assertEqual("success")
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_0200
     * @tc.desc   Verify PromiseRejectedResult reason from allSettled with rejected Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseSettledResultTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([Promise.reject<string>(new Error("failed"))])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("rejected")
        let rejected = results[i] as PromiseRejectedResult
        expect(rejected.status).assertEqual("rejected")
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_0300
     * @tc.desc   Verify PromiseSettledResult status is fulfilled or rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([Promise.resolve<string>("ok")])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("fulfilled")
        let fulfilled = results[i] as PromiseFulfilledResult<string>
        expect(fulfilled.value).assertEqual("ok")
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_0400
     * @tc.desc   Verify PromiseFulfilledResult with PromiseStatus.fulfilled enum comparison
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseSettledResultTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([Promise.resolve<string>("ok")])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual(PromiseStatus.fulfilled)
        let fulfilled = results[i] as PromiseFulfilledResult<string>
        expect(fulfilled.value).assertEqual("ok")
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_0500
     * @tc.desc   Verify PromiseRejectedResult with PromiseStatus.rejected enum comparison
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseSettledResultTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([Promise.reject<string>(new Error("fail"))])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual(PromiseStatus.rejected)
        let rejected = results[i] as PromiseRejectedResult
        expect(rejected.status).assertEqual(PromiseStatus.rejected)
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_0600
     * @tc.desc   Verify PromiseFulfilledResult with number type value and instanceof check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseSettledResultTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<number>[] = await Promise.allSettled<number>([Promise.resolve<number>(42.0)])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("fulfilled")
        let fulfilled = results[i] as PromiseFulfilledResult<number>
        expect(fulfilled.value instanceof number).assertTrue()
        expect(fulfilled.value).assertEqual(42)
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_0700
     * @tc.desc   Verify PromiseRejectedResult reason is Error instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([Promise.reject<string>(new Error("fail"))])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("rejected")
        let rejected = results[i] as PromiseRejectedResult
        expect(rejected.reason instanceof Error).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_0800
     * @tc.desc   Verify PromiseRejectedResult reason instanceof Error with message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseSettledResultTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([Promise.reject<string>(new Error("error"))])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("rejected")
        let rejected = results[i] as PromiseRejectedResult
        expect(rejected.reason instanceof Error).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_0900
     * @tc.desc   Verify PromiseFulfilledResult value equals resolved string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([Promise.resolve<string>("ok")])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("fulfilled")
        let fulfilled = results[i] as PromiseFulfilledResult<string>
        expect(fulfilled.value).assertEqual("ok")
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_1000
     * @tc.desc   Verify PromiseFulfilledResult value type and value assertion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseSettledResultTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([Promise.resolve<string>("hello")])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("fulfilled")
        let fulfilled = results[i] as PromiseFulfilledResult<string>
        expect(fulfilled.value).assertEqual("hello")
        expect(fulfilled.value instanceof string).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_1100
     * @tc.desc   Verify PromiseFulfilledResult with empty string value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([Promise.resolve<string>("")])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("fulfilled")
        let fulfilled = results[i] as PromiseFulfilledResult<string>
        expect(fulfilled.value).assertEqual("")
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_1200
     * @tc.desc   Verify PromiseFulfilledResult with null value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string | null>[] = await Promise.allSettled<string | null>([Promise.resolve<string | null>(null)])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("fulfilled")
        let fulfilled = results[i] as PromiseFulfilledResult<string | null>
        expect(fulfilled.value).assertNull()
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_1300
     * @tc.desc   Verify PromiseFulfilledResult with undefined value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string | undefined>[] = await Promise.allSettled<string | undefined>([Promise.resolve<string | undefined>(undefined)])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("fulfilled")
        let fulfilled = results[i] as PromiseFulfilledResult<string | undefined>
        expect(fulfilled.value).assertUndefined()
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_1400
     * @tc.desc   Verify PromiseFulfilledResult with interface object value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<Data>[] = await Promise.allSettled<Data>([
        Promise.resolve<Data>({ id: 1, name: "test" })
      ])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("fulfilled")
        let fulfilled = results[i] as PromiseFulfilledResult<Data>
        expect(fulfilled.value.id).assertEqual(1)
        expect(fulfilled.value.name).assertEqual("test")
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_1500
     * @tc.desc   Verify PromiseFulfilledResult with array value and element access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<number[]>[] = await Promise.allSettled<number[]>([
        Promise.resolve<number[]>([1, 2, 3])
      ])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("fulfilled")
        let fulfilled = results[i] as PromiseFulfilledResult<number[]>
        expect(fulfilled.value.length).assertEqual(3)
        expect(fulfilled.value[0]).assertEqual(1)
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_1600
     * @tc.desc   Verify PromiseFulfilledResult with string|number union type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results1: PromiseSettledResult<string | number>[] = await Promise.allSettled<string | number>([Promise.resolve<string | number>("text")])
      let results2: PromiseSettledResult<string | number>[] = await Promise.allSettled<string | number>([Promise.resolve<string | number>(123.0)])
      for (let i = 0; i < results1.length; i++) {
        expect(results1[i].status).assertEqual("fulfilled")
        let fulfilled = results1[i] as PromiseFulfilledResult<string | number>
        expect((fulfilled.value instanceof string)).assertTrue()
      }
      for (let i = 0; i < results2.length; i++) {
        expect(results2[i].status).assertEqual("fulfilled")
        let fulfilled = results2[i] as PromiseFulfilledResult<string | number>
        expect((fulfilled.value instanceof number)).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_1700
     * @tc.desc   Verify PromiseRejectedResult with Error containing detailed message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseSettledResultTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.reject<string>(new Error("operation failed"))
      ])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("rejected")
        let rejected = results[i] as PromiseRejectedResult
        expect(rejected.reason instanceof Error).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_1800
     * @tc.desc   Verify PromiseRejectedResult status and reason is Error instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.reject<string>(new Error("test error"))
      ])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("rejected")
        let rejected = results[i] as PromiseRejectedResult
        expect(rejected.status).assertEqual("rejected")
        expect(rejected.reason instanceof Error).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_1900
     * @tc.desc   Verify PromiseRejectedResult reason is Error instance for rejected input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.reject<string>(new Error("stack test"))
      ])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("rejected")
        let rejected = results[i] as PromiseRejectedResult
        expect(rejected.reason instanceof Error).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_2000
     * @tc.desc   Verify PromiseSettledResult with mixed resolved and rejected results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseSettledResultTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.resolve<string>("success"),
        Promise.reject<string>(new Error("failure"))
      ])
      for (let i = 0; i < results.length; i++) {
        if (results[i].status === "fulfilled") {
          let fulfilled = results[i] as PromiseFulfilledResult<string>
          expect(fulfilled.value instanceof string).assertTrue()
        } else {
          let rejected = results[i] as PromiseRejectedResult
          expect(rejected.reason instanceof Error).assertTrue()
        }
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_2100
     * @tc.desc   Verify PromiseSettledResult with number resolved and rejected mixed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseSettledResultTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<number>[] = await Promise.allSettled<number>([
        Promise.resolve<number>(123.0),
        Promise.reject<number>(new Error("error"))
      ])
      expect(results[0].status).assertEqual("fulfilled")
      let fulfilled = results[0] as PromiseFulfilledResult<number>
      expect(fulfilled.value instanceof number).assertTrue()
      expect(fulfilled.value).assertEqual(123)
      expect(results[1].status).assertEqual("rejected")
      let rejected = results[1] as PromiseRejectedResult
      expect(rejected.reason instanceof Error).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_2200
     * @tc.desc   Verify PromiseFulfilledResult with boolean values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<boolean>[] = await Promise.allSettled<boolean>([
        Promise.resolve<boolean>(true),
        Promise.resolve<boolean>(false)
      ])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("fulfilled")
        let fulfilled = results[i] as PromiseFulfilledResult<boolean>
        expect(fulfilled.value instanceof boolean).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_2300
     * @tc.desc   Verify PromiseFulfilledResult with void type value undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<void>[] = await Promise.allSettled<void>([
        Promise.resolve<void>(undefined)
      ])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("fulfilled")
        let fulfilled = results[i] as PromiseFulfilledResult<void>
        expect(fulfilled.value).assertUndefined()
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_2400
     * @tc.desc   Verify PromiseFulfilledResult with object reference not null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {

      let obj: DataObj = { key: "value", count: 10 }
      let results: PromiseSettledResult<DataObj>[] = await Promise.allSettled<DataObj>([
        Promise.resolve<DataObj>(obj)
      ])
      expect(results.length).assertEqual(1)
      expect(results[0].status).assertEqual("fulfilled")
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("fulfilled")
        let fulfilled = results[i] as PromiseFulfilledResult<DataObj>
        expect(fulfilled.value.key).assertEqual("value")
        expect(fulfilled.value.count).assertEqual(10)
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_2500
     * @tc.desc   Verify PromiseFulfilledResult with array values including empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<number[]>[] = await Promise.allSettled<number[]>([
        Promise.resolve<number[]>([1, 2, 3]),
        Promise.resolve<number[]>([])
      ])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("fulfilled")
        let fulfilled = results[i] as PromiseFulfilledResult<number[]>
        expect(Array.isArray(fulfilled.value)).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_2600
     * @tc.desc   Verify PromiseFulfilledResult with Map instance type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let map = new Map<string, number>()
      map.set("a", 1)
      let results: PromiseSettledResult<Map<string, number>>[] = await Promise.allSettled<Map<string, number>>([
        Promise.resolve<Map<string, number>>(map)
      ])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("fulfilled")
        let fulfilled = results[i] as PromiseFulfilledResult<Map<string, number>>
        expect(fulfilled.value instanceof Map).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_2700
     * @tc.desc   Verify PromiseFulfilledResult with Set instance type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set = new Set<string>()
      set.add("item")
      let results: PromiseSettledResult<Set<string>>[] = await Promise.allSettled<Set<string>>([
        Promise.resolve<Set<string>>(set)
      ])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("fulfilled")
        let fulfilled = results[i] as PromiseFulfilledResult<Set<string>>
        expect(fulfilled.value instanceof Set).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest2800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_2800
     * @tc.desc   Verify PromiseFulfilledResult with explicit null type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<null>[] = await Promise.allSettled<null>([
        Promise.resolve<null>(null)
      ])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("fulfilled")
        let fulfilled = results[i] as PromiseFulfilledResult<null>
        expect(fulfilled.value).assertNull()
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest2900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_2900
     * @tc.desc   Verify PromiseFulfilledResult with explicit undefined type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<undefined>[] = await Promise.allSettled<undefined>([
        Promise.resolve<undefined>(undefined)
      ])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("fulfilled")
        let fulfilled = results[i] as PromiseFulfilledResult<undefined>
        expect(fulfilled.value).assertUndefined()
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest3000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_3000
     * @tc.desc   Verify PromiseFulfilledResult with string|number|boolean union type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string | number | boolean>[] = await Promise.allSettled<string | number | boolean>([
        Promise.resolve<string | number | boolean>("text"),
        Promise.resolve<string | number | boolean>(100.0),
        Promise.resolve<string | number | boolean>(true)
      ])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("fulfilled")
        let fulfilled = results[i] as PromiseFulfilledResult<string | number | boolean>
        let value = fulfilled.value
        if (i === 0) {
          expect(value instanceof string).assertTrue()
          expect(value).assertEqual("text")
        } else if (i === 1) {
          expect(value instanceof number).assertTrue()
          expect(value).assertEqual(100.0)
        } else {
          expect(value instanceof boolean).assertTrue()
          expect(value).assertTrue()
        }
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest3100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_3100
     * @tc.desc   Verify PromiseSettledResult single fulfilled direct index access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseSettledResultTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([Promise.resolve<string>("ok")])
      expect(results.length).assertEqual(1)
      expect(results[0].status).assertEqual("fulfilled")
      let fulfilled = results[0] as PromiseFulfilledResult<string>
      expect(fulfilled.value).assertEqual("ok")
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest3200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_3200
     * @tc.desc   Verify PromiseSettledResult single rejected direct index access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseSettledResultTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.reject<string>(new Error("failed"))
      ])
      expect(results.length).assertEqual(1)
      expect(results[0].status).assertEqual("rejected")
      let rejected = results[0] as PromiseRejectedResult
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest3300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_3300
     * @tc.desc   Verify PromiseSettledResult with 3 resolved number values in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseSettledResultTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<number>[] = await Promise.allSettled<number>([
        Promise.resolve<number>(1.0),
        Promise.resolve<number>(2.0),
        Promise.resolve<number>(3.0)
      ])
      expect(results.length).assertEqual(3)
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("fulfilled")
        let fulfilled = results[i] as PromiseFulfilledResult<number>
        expect(fulfilled.value).assertEqual(i + 1)
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest3400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_3400
     * @tc.desc   Verify PromiseSettledResult with 3 rejected results all Error instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.reject<string>(new Error("error1")),
        Promise.reject<string>(new Error("error2")),
        Promise.reject<string>(new Error("error3"))
      ])
      expect(results.length).assertEqual(3)
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("rejected")
        let rejected = results[i] as PromiseRejectedResult
        expect(rejected.reason instanceof Error).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest3500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_3500
     * @tc.desc   Verify PromiseSettledResult preserves order with mixed resolved and rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseSettledResultTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.resolve<string>("success1"),
        Promise.reject<string>(new Error("fail")),
        Promise.resolve<string>("success2")
      ])
      expect(results.length).assertEqual(3)
      expect(results[0].status).assertEqual("fulfilled")
      expect(results[1].status).assertEqual("rejected")
      expect(results[2].status).assertEqual("fulfilled")
      let fulfilled0 = results[0] as PromiseFulfilledResult<string>
      let rejected1 = results[1] as PromiseRejectedResult
      let fulfilled2 = results[2] as PromiseFulfilledResult<string>
      expect(fulfilled0.value).assertEqual("success1")
      expect(fulfilled2.value).assertEqual("success2")
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest3600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_3600
     * @tc.desc   Verify PromiseSettledResult with empty input array returns empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([])
      expect(results.length).assertEqual(0)
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest3700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_3700
     * @tc.desc   Verify PromiseSettledResult with undefined cast as string type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.resolve("valid"),
        Promise.resolve('undefined')
      ])
      expect(results.length).assertEqual(2)
      expect(results[0].status).assertEqual("fulfilled")
      expect((results[0] as PromiseFulfilledResult<string>).value).assertEqual("valid")
      expect(results[1].status).assertEqual("fulfilled")
      expect((results[1] as PromiseFulfilledResult<string>).value).assertEqual("undefined")
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest3800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_3800
     * @tc.desc   Verify PromiseSettledResult with delayed resolve via setTimeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        new Promise<string>((resolve) => {
          setTimeout(() => resolve("delayed"), 100)
        })
      ])
      expect(results.length).assertEqual(1)
      expect(results[0].status).assertEqual("fulfilled")
      let fulfilled = results[0] as PromiseFulfilledResult<string>
      expect(fulfilled.value).assertEqual("delayed")
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest3900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_3900
     * @tc.desc   Verify PromiseSettledResult with delayed reject via setTimeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        new Promise<string>((_, reject) => {
          setTimeout(() => reject(new Error("delayed error")), 100)
        })
      ])
      expect(results.length).assertEqual(1)
      expect(results[0].status).assertEqual("rejected")
      let rejected = results[0] as PromiseRejectedResult
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest4000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_4000
     * @tc.desc   Verify PromiseSettledResult with immediate and delayed resolve
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.resolve<string>("immediate"),
        new Promise<string>((resolve) => {
          setTimeout(() => resolve("delayed"), 100)
        })
      ])
      expect(results.length).assertEqual(2)
      expect(results[0].status).assertEqual("fulfilled")
      expect(results[1].status).assertEqual("fulfilled")
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest4100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_4100
     * @tc.desc   Verify nested Promise.allSettled calls returning batched results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let nestedAllSettled: () => Promise<PromiseSettledResult<string>[][]> =
        async (): Promise<PromiseSettledResult<string>[][]> => {
          let batch1 = await Promise.allSettled<string>([Promise.resolve<string>("a1"), Promise.resolve<string>("a2")]);
          let batch2 = await Promise.allSettled<string>([Promise.resolve<string>("b1"), Promise.reject<string>(new Error("b2 error"))]);
          return [batch1, batch2];
        };
      let batches = await nestedAllSettled()
      expect(batches.length).assertEqual(2)
      expect(batches[0].length).assertEqual(2)
      expect(batches[1].length).assertEqual(2)
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest4200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_4200
     * @tc.desc   Verify PromiseFulfilledResult with empty object value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<object>[] = await Promise.allSettled<object>([
        Promise.resolve<object>({})
      ])
      expect(results.length).assertEqual(1)
      expect(results[0].status).assertEqual("fulfilled")
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("fulfilled")
        let fulfilled = results[i] as PromiseFulfilledResult<object>
        expect((fulfilled.value instanceof Object)).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest4300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_4300
     * @tc.desc   Verify PromiseFulfilledResult with empty array value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<number[]>[] = await Promise.allSettled<number[]>([
        Promise.resolve<number[]>([])
      ])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("fulfilled")
        let fulfilled = results[i] as PromiseFulfilledResult<number[]>
        expect(Array.isArray(fulfilled.value)).assertTrue()
        expect(fulfilled.value.length).assertEqual(0)
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest4400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_4400
     * @tc.desc   Verify PromiseFulfilledResult with Number.MAX_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<number>[] = await Promise.allSettled<number>([
        Promise.resolve<number>(Number.MAX_VALUE)
      ])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("fulfilled")
        let fulfilled = results[i] as PromiseFulfilledResult<number>
        expect(fulfilled.value).assertEqual(Number.MAX_VALUE)
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest4500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_4500
     * @tc.desc   Verify PromiseFulfilledResult with Number.MIN_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<number>[] = await Promise.allSettled<number>([
        Promise.resolve<number>(Number.MIN_VALUE)
      ])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("fulfilled")
        let fulfilled = results[i] as PromiseFulfilledResult<number>
        expect(fulfilled.value).assertEqual(Number.MIN_VALUE)
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest4600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_4600
     * @tc.desc   Verify PromiseFulfilledResult with zero value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<number>[] = await Promise.allSettled<number>([
        Promise.resolve<number>(0.0)
      ])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("fulfilled")
        let fulfilled = results[i] as PromiseFulfilledResult<number>
        expect(fulfilled.value).assertEqual(0)
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest4700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_4700
     * @tc.desc   Verify PromiseFulfilledResult with negative number value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<number>[] = await Promise.allSettled<number>([
        Promise.resolve<number>(-100.0)
      ])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("fulfilled")
        let fulfilled = results[i] as PromiseFulfilledResult<number>
        expect(fulfilled.value).assertEqual(-100)
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest4800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_4800
     * @tc.desc   Verify PromiseFulfilledResult with long string 10000 characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let longString = "a".repeat(10000)
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.resolve<string>(longString)
      ])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("fulfilled")
        let fulfilled = results[i] as PromiseFulfilledResult<string>
        expect(fulfilled.value.length).assertEqual(10000)
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest4900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_4900
     * @tc.desc   Verify PromiseFulfilledResult with Unicode string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let unicodeString = "中文测试 日本語"
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.resolve<string>(unicodeString)
      ])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("fulfilled")
        let fulfilled = results[i] as PromiseFulfilledResult<string>
        expect(fulfilled.value).assertEqual(unicodeString)
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest5000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_5000
     * @tc.desc   Verify PromiseFulfilledResult with special characters newline and tab
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let specialString = "line1\nline2\ttab"
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.resolve<string>(specialString)
      ])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("fulfilled")
        let fulfilled = results[i] as PromiseFulfilledResult<string>
        expect(fulfilled.value).assertContain("\n")
        expect(fulfilled.value).assertContain("\t")
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest5100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_5100
     * @tc.desc   Verify PromiseRejectedResult with Error without message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.reject<string>(new Error())
      ])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("rejected")
        let rejected = results[i] as PromiseRejectedResult
        expect(rejected.reason instanceof Error).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest5200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_5200
     * @tc.desc   Verify PromiseRejectedResult with long error message 5000 characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let longMessage = "error".repeat(1000)
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.reject<string>(new Error(longMessage))
      ])
      let sawRejected: boolean = false
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("rejected")
        let rejected = results[i] as PromiseRejectedResult
        sawRejected = true
        expect(rejected.reason instanceof Error).assertTrue()
      }
      expect(sawRejected).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest5300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_5300
     * @tc.desc   Verify PromiseRejectedResult with nested error message reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let innerError = new Error("inner error")
      let outerError = new Error(`outer error caused by: ${innerError.message}`)
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.reject<string>(outerError)
      ])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("rejected")
        let rejected = results[i] as PromiseRejectedResult
        expect(rejected.status).assertEqual("rejected")
        expect(rejected.reason instanceof Error).assertTrue()
        expect(rejected.reason === outerError).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest5400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_5400
     * @tc.desc   Verify PromiseSettledResult status field is string type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.resolve<string>("ok")
      ])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status instanceof string).assertTrue()
        expect(results[i].status).assertEqual("fulfilled")
        expect((results[i] as PromiseFulfilledResult<string>).value).assertEqual("ok")
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest5500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_5500
     * @tc.desc   Verify PromiseFulfilledResult value type equals number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<number>[] = await Promise.allSettled<number>([
        Promise.resolve<number>(42.0)
      ])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("fulfilled")
        let fulfilled = results[i] as PromiseFulfilledResult<number>
        expect(fulfilled.value instanceof number).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest5600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_5600
     * @tc.desc   Verify PromiseRejectedResult reason instanceof Error check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.reject<string>(new Error("error"))
      ])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("rejected")
        let rejected = results[i] as PromiseRejectedResult
        expect(rejected.reason instanceof Error).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest5700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_5700
     * @tc.desc   Verify PromiseRejectedResult with TypeError instanceof checks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.reject<string>(new TypeError("type error"))
      ])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual("rejected")
        let rejected = results[i] as PromiseRejectedResult
        expect(rejected.reason instanceof Error).assertTrue()
        expect(rejected.reason instanceof TypeError).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest5800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_5800
     * @tc.desc   Verify PromiseSettledResult mixed results status validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.resolve<string>("resolved"),
        Promise.reject<string>(new Error("rejected"))
      ])
      expect(results[0].status).assertEqual("fulfilled")
      expect((results[0] as PromiseFulfilledResult<string>).value).assertEqual("resolved")
      expect(results[1].status).assertEqual("rejected")
      expect((results[1] as PromiseRejectedResult).reason instanceof Error).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest5900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_5900
     * @tc.desc   Verify Promise.allSettled in then chain returning formatted result string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve("outer")
        .then<string>(() => {
          return Promise.allSettled<string>([
            Promise.resolve("inner-success"),
            Promise.reject(new Error("inner-error"))
          ])
            .then<string>((results: PromiseSettledResult<string>[]) => {
              return `${results.length}-settled`
            })
        })
      expect(result).assertEqual("2-settled")
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest6000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_6000
     * @tc.desc   Verify Promise.allSettled with 3 concurrent then handlers using AtomicInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = new AtomicInt(0)
      let promises: Promise<void>[] = []
      for (let i = 0; i < 3; i++) {
        promises.push(
          Promise.allSettled<number>([Promise.resolve<number>(1.0)])
            .then<void>((results: PromiseSettledResult<number>[]) => {
              counter.fetchAdd(results.length)
            })
        )
      }
      await Promise.all(promises)
      expect(counter.load()).assertEqual(3)
      Done()
    })

    /**
     * @tc.name   PromiseSettledResultTest6100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_6100
     * @tc.desc   Verify Promise.allSettled with 5 concurrent then handlers using AtomicInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = new AtomicInt(0)
      let promises: Promise<void>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(
          Promise.allSettled<number>([Promise.resolve(1.0)])
            .then<void>((results: PromiseSettledResult<number>[]) => {
              counter.fetchAdd(1)
            })
        )
      }
      await Promise.all(promises)
      expect(counter.load()).assertEqual(5)
      Done()
    })

    /**
     * @tc.name   PromiseSettledResultTest6200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_6200
     * @tc.desc   Verify Promise.allSettled with 10 concurrent then handlers using AtomicInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = new AtomicInt(0)
      let promises: Promise<void>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(
          Promise.allSettled<number>([Promise.resolve(1.0)])
            .then<void>((results: PromiseSettledResult<number>[]) => {
              counter.fetchAdd(1)
            })
        )
      }
      await Promise.all(promises)
      expect(counter.load()).assertEqual(10)
      Done()
    })

    /**
     * @tc.name   PromiseSettledResultTest6300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_6300
     * @tc.desc   Verify PromiseSettledResult with 5 resolved values counting fulfilled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.resolve<string>("a"),
        Promise.resolve<string>("b"),
        Promise.resolve<string>("c"),
        Promise.resolve<string>("d"),
        Promise.resolve<string>("e")
      ])
      let fulfilledCount = 0
      for (let i = 0; i < results.length; i++) {
        if (results[i].status === "fulfilled") {
          fulfilledCount++
        }
      }
      expect(fulfilledCount).assertEqual(5)
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest6400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_6400
     * @tc.desc   Verify PromiseSettledResult with 5 rejected values counting rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.reject<string>(new Error("1")),
        Promise.reject<string>(new Error("2")),
        Promise.reject<string>(new Error("3")),
        Promise.reject<string>(new Error("4")),
        Promise.reject<string>(new Error("5"))
      ])
      let rejectedCount = 0
      for (let i = 0; i < results.length; i++) {
        if (results[i].status === "rejected") {
          rejectedCount++
        }
      }
      expect(rejectedCount).assertEqual(5)
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest6500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_6500
     * @tc.desc   Verify PromiseSettledResult with mixed 5 results counting fulfilled and rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.resolve<string>("ok1"),
        Promise.reject<string>(new Error("err1")),
        Promise.resolve<string>("ok2"),
        Promise.reject<string>(new Error("err2")),
        Promise.resolve<string>("ok3")
      ])
      let fulfilledCount = 0
      let rejectedCount = 0
      for (let i = 0; i < results.length; i++) {
        if (results[i].status === "fulfilled") fulfilledCount++
        else rejectedCount++
      }
      expect(fulfilledCount).assertEqual(3)
      expect(rejectedCount).assertEqual(2)
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest6600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_6600
     * @tc.desc   Verify PromiseSettledResult mapping fulfilled values to uppercase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.resolve<string>("data1"),
        Promise.resolve<string>("data2")
      ])
      let processed: string[] = []
      for (let i = 0; i < results.length; i++) {
        if (results[i].status === "fulfilled") {
          let fulfilled = results[i] as PromiseFulfilledResult<string>
          processed.push(fulfilled.value.toUpperCase())
        }
      }
      expect(processed.length).assertEqual(2)
      expect(processed[0]).assertEqual("DATA1")
      expect(processed[1]).assertEqual("DATA2")
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest6700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_6700
     * @tc.desc   Verify PromiseSettledResult separating values and errors into arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.resolve<string>("a"),
        Promise.reject<string>(new Error("b"))
      ])
      let values: string[] = []
      let errors: Error[] = []
      for (let i = 0; i < results.length; i++) {
        if (results[i].status === "fulfilled") {
          values.push((results[i] as PromiseFulfilledResult<string>).value)
        } else {
          errors.push((results[i] as PromiseRejectedResult).reason)
        }
      }
      expect(values.length).assertEqual(1)
      expect(errors.length).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest6800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_6800
     * @tc.desc   Verify PromiseSettledResult has exactly 2 keys status and value or reason
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.resolve<string>("test")
      ])
      for (let i = 0; i < results.length; i++) {
        let keys = Object.keys(results[i])
        expect(keys.length).assertEqual(2)
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest6900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_6900
     * @tc.desc   Verify PromiseSettledResult JSON serialization contains fulfilled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.resolve<string>("test")
      ])
      let json = JSON.stringify(results)
      expect(json).assertContain("fulfilled")
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest7000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_7000
     * @tc.desc   Verify PromiseSettledResult summing fulfilled number values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<number>[] = await Promise.allSettled<number>([
        Promise.resolve<number>(1.0),
        Promise.reject<number>(new Error("2")),
        Promise.resolve<number>(3.0)
      ])
      let sum = 0
      for (let i = 0; i < results.length; i++) {
        if (results[i].status === "fulfilled") {
          sum += (results[i] as PromiseFulfilledResult<number>).value
        }
      }
      expect(sum).assertEqual(4)
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest7100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_7100
     * @tc.desc   Verify PromiseSettledResult preserves order of resolved values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.resolve<string>("first"),
        Promise.resolve<string>("second")
      ])
      expect(results[0].status).assertEqual("fulfilled")
      expect(results[1].status).assertEqual("fulfilled")
      let f0 = results[0] as PromiseFulfilledResult<string>
      let f1 = results[1] as PromiseFulfilledResult<string>
      expect(f0.value).assertEqual("first")
      expect(f1.value).assertEqual("second")
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest7200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_7200
     * @tc.desc   Verify PromiseSettledResult tracking fulfilled and rejected indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.resolve<string>("a"),
        Promise.reject<string>(new Error("b")),
        Promise.resolve<string>("c"),
        Promise.reject<string>(new Error("d"))
      ])
      expect(results.length).assertEqual(4)
      let fulfilledIndices: number[] = []
      let rejectedIndices: number[] = []
      for (let i = 0; i < results.length; i++) {
        if (results[i].status === "fulfilled") fulfilledIndices.push(i)
        else rejectedIndices.push(i)
      }
      expect(fulfilledIndices.length).assertEqual(2)
      expect(rejectedIndices.length).assertEqual(2)
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest7300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_7300
     * @tc.desc   Verify PromiseSettledResult single fulfilled direct status and value check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.resolve<string>("ok")
      ])
      expect(results[0].status).assertEqual("fulfilled")
      let fulfilled = results[0] as PromiseFulfilledResult<string>
      expect(fulfilled.value).assertEqual("ok")
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest7400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_7400
     * @tc.desc   Verify PromiseSettledResult single rejected direct status and reason check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.reject<string>(new Error("err"))
      ])
      expect(results[0].status).assertEqual("rejected")
      expect(results[0].status).assertEqual("rejected")
      let rejected = results[0] as PromiseRejectedResult
      expect(rejected.reason instanceof Error).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest7500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_7500
     * @tc.desc   Verify PromiseSettledResult results cloned to new array preserve status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.resolve<string>("a"),
        Promise.reject<string>(new Error("b"))
      ])
      let cloned: PromiseSettledResult<string>[] = []
      for (let i = 0; i < results.length; i++) {
        cloned.push(results[i])
      }
      expect(cloned.length).assertEqual(2)
      expect(cloned[0].status).assertEqual("fulfilled")
      expect(cloned[1].status).assertEqual("rejected")
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest7600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_7600
     * @tc.desc   Verify PromiseSettledResult combining results from two allSettled calls with spread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results1: PromiseSettledResult<string>[] = await Promise.allSettled<string>([Promise.resolve<string>("a")])
      let results2: PromiseSettledResult<string>[] = await Promise.allSettled<string>([Promise.resolve<string>("b")])
      let combined = [...results1, ...results2]
      expect(combined.length).assertEqual(2)
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest7700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_7700
     * @tc.desc   Verify PromiseSettledResult result is Array instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.resolve<string>("ok")
      ])
      expect(Array.isArray(results)).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest7800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_7800
     * @tc.desc   Verify PromiseSettledResult with 50 mixed resolved and rejected results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<string>[] = []
      for (let i = 0; i < 50; i++) {
        if (i % 2 === 0) {
          promises.push(Promise.resolve(`item_${i}`))
        } else {
          promises.push(Promise.reject(new Error(`error_${i}`)))
        }
      }
      let results: PromiseSettledResult<string>[] = await Promise.allSettled(promises)
      expect(results.length).assertEqual(50)
      let fulfilledCount = 0
      let rejectedCount = 0
      for (let i = 0; i < results.length; i++) {
        if (results[i].status === "fulfilled") fulfilledCount++
        else rejectedCount++
      }
      expect(fulfilledCount).assertEqual(25)
      expect(rejectedCount).assertEqual(25)
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest7900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_7900
     * @tc.desc   Verify PromiseSettledResult preserves order with mixed types direct access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.resolve<string>("first"),
        Promise.reject<string>(new Error("second")),
        Promise.resolve<string>("third")
      ])
      let first = results[0] as PromiseFulfilledResult<string>
      expect(first.value).assertEqual("first")
      let second = results[1] as PromiseRejectedResult
      let third = results[2] as PromiseFulfilledResult<string>
      expect(third.value).assertEqual("third")
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest8000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_8000
     * @tc.desc   Verify PromiseSettledResult all fulfilled boolean check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.resolve<string>("a"),
        Promise.resolve<string>("b")
      ])
      let allFulfilled = true
      for (let i = 0; i < results.length; i++) {
        if (results[i].status !== "fulfilled") {
          allFulfilled = false
        }
      }
      expect(allFulfilled).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest8100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_8100
     * @tc.desc   Verify PromiseSettledResult all rejected boolean check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.reject<string>(new Error("a")),
        Promise.reject<string>(new Error("b"))
      ])
      let allRejected = true
      for (let i = 0; i < results.length; i++) {
        if (results[i].status !== "rejected") {
          allRejected = false
        }
      }
      expect(allRejected).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest8200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_8200
     * @tc.desc   Verify PromiseSettledResult single result status is fulfilled or rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.resolve<string>("ok")
      ])
      let result = results[0]
      expect(result.status).assertEqual("fulfilled")
      expect((result as PromiseFulfilledResult<string>).value).assertEqual("ok")
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest8300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_8300
     * @tc.desc   Verify PromiseSettledResult mixed results value type and reason checks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.resolve<string>("a"),
        Promise.reject<string>(new Error("b"))
      ])
      for (let i = 0; i < results.length; i++) {
        if (results[i].status === "fulfilled") {
          let fulfilled = results[i] as PromiseFulfilledResult<string>
          expect(fulfilled.value instanceof string).assertTrue()
        } else {
          let rejected = results[i] as PromiseRejectedResult
          expect(rejected.reason instanceof Error).assertTrue()
        }
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest8400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_8400
     * @tc.desc   Verify PromiseSettledResult single fulfilled length and status assertion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.resolve<string>("test")
      ])
      expect(results.length).assertEqual(1)
      expect(results[0].status).assertEqual("fulfilled")
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest8500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_8500
     * @tc.desc   Verify PromiseSettledResult single rejected length and status assertion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSettledResultTest8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([
        Promise.reject<string>(new Error("test"))
      ])
      expect(results.length).assertEqual(1)
      expect(results[0].status).assertEqual("rejected")
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest8600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_8600
     * @tc.desc   Verify EAWorker.run callback nested PromiseSettledResult
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseSettledResultTest8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('settledResultWorker')
      eaWorker.start()
      try {
        let job = eaWorker.run<string>(() => {
          return "2-worker"
        })
        let workerResult = job.Await()
        let results = await Promise.allSettled<string>([
          Promise.resolve("success"),
          Promise.reject<string>(new Error("error"))
        ])
        expect(workerResult).assertEqual("2-worker")
        expect(results.length).assertEqual(2)
        expect(results[0].status).assertEqual("fulfilled")
        expect((results[0] as PromiseFulfilledResult<string>).value).assertEqual("success")
        expect(results[1].status).assertEqual("rejected")
        expect((results[1] as PromiseRejectedResult).reason instanceof Error).assertTrue()
      } finally {
        eaWorker.join().Await()
      }
      Done();
    })

    /**
     * @tc.name   PromiseSettledResultTest8700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_SETTLED_RESULT_TEST_8700
     * @tc.desc   Verify MessageHandler callback nested PromiseSettledResult
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseSettledResultTest8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let processedCount = new AtomicInt(0)
      let eaWorker = new EAWorker('msgSettledResultWorker')
      eaWorker.start()
      try {
        let job1 = eaWorker.run<string>((s: string): string => { return s }, "a")
        let job2 = eaWorker.run<string>((s: string): string => { return s }, "b")
        let job3 = eaWorker.run<string>((s: string): string => { return s }, "c")
        let jr1 = job1.Await();
        let jr2 = job2.Await();
        let jr3 = job3.Await();
        let results = await Promise.allSettled<string>([
          Promise.resolve(jr1),
          Promise.resolve(jr2),
          Promise.resolve(jr3)
        ])
        processedCount.fetchAdd(results.length)
        expect(processedCount.load()).assertEqual(3)
        expect(results[0].status).assertEqual("fulfilled")
        expect((results[0] as PromiseFulfilledResult<string>).value).assertEqual("a")
        expect(results[1].status).assertEqual("fulfilled")
        expect((results[1] as PromiseFulfilledResult<string>).value).assertEqual("b")
        expect(results[2].status).assertEqual("fulfilled")
        expect((results[2] as PromiseFulfilledResult<string>).value).assertEqual("c")
      } finally {
        eaWorker.join().Await()
      }
      Done();
    })

  })
}
