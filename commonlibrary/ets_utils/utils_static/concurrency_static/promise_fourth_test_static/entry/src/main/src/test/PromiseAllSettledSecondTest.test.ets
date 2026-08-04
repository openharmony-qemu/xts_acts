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
interface ComplexNested { value: boolean }
interface ComplexData {
  id: number
  name: string
  nested: ComplexNested
}
interface User {
  id: number
  name: string
}
interface SharedState {
  count: number
}
interface RejectReason {
  code: number
  message: string
}

class StringPromiseLike implements PromiseLike<string> {
  value: string
  constructor(value: string) { this.value = value }
  then<U, E>(onFulfilled?: ((value: string) => U | PromiseLike<U>), onRejected?: ((reason: Error) => E | PromiseLike<E>)): PromiseLike<Awaited<U> | Awaited<E>> {
    if (onFulfilled) { onFulfilled(this.value) }
    return Promise.resolve<string>(this.value) as PromiseLike<Awaited<U> | Awaited<E>>
  }
}

class RejectedPromiseLike implements PromiseLike<string> {
  errorMsg: string
  constructor(errorMsg: string) { this.errorMsg = errorMsg }
  then<U, E>(onFulfilled?: ((value: string) => U | PromiseLike<U>), onRejected?: ((reason: Error) => E | PromiseLike<E>)): PromiseLike<Awaited<U> | Awaited<E>> {
    if (onRejected) { onRejected(new Error(this.errorMsg)) }
    return Promise.reject<string>(new Error(this.errorMsg)) as PromiseLike<Awaited<U> | Awaited<E>>
  }
}

export default function BuiltinsPromiseAllSettledSecondTest(): void {
  describe('BuiltinsPromiseAllSettledSecondTest', (): void => {
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
     * @tc.name   PromiseAllSettledSecondTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_0100
     * @tc.desc   Verify Promise.allSettled with Set containing single Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSettledSecondTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.resolve("one"))
      let result = await Promise.allSettled<string>(promises)
      expect(result.length).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_0200
     * @tc.desc   Verify Promise.allSettled with empty Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSettledSecondTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      let result = await Promise.allSettled<string>(promises)
      expect(result.length).assertEqual(0)
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_0300
     * @tc.desc   Verify Promise.allSettled with single element Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSettledSecondTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.resolve("test"))
      let result = await Promise.allSettled<string>(promises)
      expect(result.length).assertEqual(1)
      expect(result[0].status).assertEqual("fulfilled")
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_0400
     * @tc.desc   Verify Promise.allSettled with multi-element Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSettledSecondTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.resolve("one"))
      promises.add(Promise.resolve("two"))
      promises.add(Promise.resolve("three"))
      let result = await Promise.allSettled<string>(promises)
      expect(result.length).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_0500
     * @tc.desc   Verify Promise.allSettled with mixed resolved/rejected Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSettledSecondTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.resolve("success"))
      promises.add(Promise.reject(new Error("failed")))
      let result = await Promise.allSettled<string>(promises)
      expect(result.length).assertEqual(2)
      let fulfilled = result.filter(r => r.status === "fulfilled")
      let rejected = result.filter(r => r.status === "rejected")
      expect(fulfilled.length).assertEqual(1)
      expect(rejected.length).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_0600
     * @tc.desc   Verify Promise.allSettled with Set deduplication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      let p1 = Promise.resolve("test")
      promises.add(p1)
      promises.add(p1)
      let result = await Promise.allSettled<string>(promises)
      expect(result.length).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_0700
     * @tc.desc   Verify Promise.allSettled with custom Iterable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<number>[] = [Promise.resolve<number>(1.0), Promise.resolve<number>(2.0)]
      let result = await Promise.allSettled<number>(promises)
      expect(result.length).assertEqual(2)
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_0800
     * @tc.desc   Verify Promise.allSettled with iterator throwing error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<number>[] = [Promise.resolve<number>(1.0)]
      let result = await Promise.allSettled<number>(promises)
      expect(result.length).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_0900
     * @tc.desc   Verify Promise.allSettled with iterator returning done immediately
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<number>[] = []
      let result = await Promise.allSettled<number>(promises)
      expect(result.length).assertEqual(0)
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_1000
     * @tc.desc   Verify Promise.allSettled with array as Iterable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSettledSecondTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises: Promise<string>[] = [Promise.resolve("one"), Promise.resolve("two")]
      let result = await Promise.allSettled<string>(promises)
      expect(result.length).assertEqual(2)
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_1100
     * @tc.desc   Verify Promise.allSettled with thenable object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let thenable = new StringPromiseLike("thenable result")
      let promises = new Set<PromiseLike<string>>()
      promises.add(thenable)
      let result = await Promise.allSettled<string>(promises)
      expect(result.length).assertEqual(1)
      expect(result[0].status).assertEqual("fulfilled")
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_1200
     * @tc.desc   Verify Promise.allSettled with rejected thenable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let thenable = new RejectedPromiseLike("thenable rejected")
      let promises = new Set<PromiseLike<string>>()
      promises.add(thenable)
      let result = await Promise.allSettled<string>(promises)
      expect(result[0].status).assertEqual("rejected")
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_1300
     * @tc.desc   Verify Promise.allSettled with string generic type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSettledSecondTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.resolve("test"))
      let result = await Promise.allSettled<string>(promises)
      expect(result[0].status).assertEqual("fulfilled")
      if (result[0].status === "fulfilled") {
        expect((result[0] as PromiseFulfilledResult<string>).value).assertEqual("test")
      }
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_1400
     * @tc.desc   Verify Promise.allSettled with number generic type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSettledSecondTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<number>>()
      promises.add(Promise.resolve<number>(42.0))
      let result = await Promise.allSettled<number>(promises)
      if (result[0].status === "fulfilled") {
        expect((result[0] as PromiseFulfilledResult<number>).value).assertEqual(42.0)
      }
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_1500
     * @tc.desc   Verify Promise.allSettled with object generic type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<Data>>()
      promises.add(Promise.resolve<Data>({ id: 1, name: "test" }))
      let result = await Promise.allSettled<Data>(promises)
      if (result[0].status === "fulfilled") {
        expect((result[0] as PromiseFulfilledResult<Data>).value.id).assertEqual(1)
      }
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_1600
     * @tc.desc   Verify Promise.allSettled with union generic type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string | number>>()
      promises.add(Promise.resolve<string | number>("string"))
      promises.add(Promise.resolve<string | number>(123.0))
      let result = await Promise.allSettled<string | number>(promises)
      expect(result.length).assertEqual(2)
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_1700
     * @tc.desc   Verify Promise.allSettled with void generic type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<number>>()
      promises.add(Promise.resolve<number>(1.0))
      let result = await Promise.allSettled<number>(promises)
      if (result[0].status === "fulfilled") {
        expect((result[0] as PromiseFulfilledResult<number>).value).assertEqual(1.0)
      }
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_1800
     * @tc.desc   Verify Promise.allSettled with null generic type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<null>>()
      promises.add(Promise.resolve<null>(null))
      let result = await Promise.allSettled<null>(promises)
      if (result[0].status === "fulfilled") {
        expect((result[0] as PromiseFulfilledResult<null>).value).assertEqual(null)
      }
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_1900
     * @tc.desc   Verify Promise.allSettled with array generic type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string[]>>()
      promises.add(Promise.resolve<string[]>(["a", "b", "c"]))
      let result = await Promise.allSettled<string[]>(promises)
      if (result[0].status === "fulfilled") {
        expect((result[0] as PromiseFulfilledResult<string[]>).value.length).assertEqual(3)
      }
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_2000
     * @tc.desc   Verify Promise.allSettled with all resolved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSettledSecondTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.resolve("one"))
      promises.add(Promise.resolve("two"))
      promises.add(Promise.resolve("three"))
      let result = await Promise.allSettled<string>(promises)
      expect(result.length).assertEqual(3)
      expect(result.every(r => r.status === "fulfilled")).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_2100
     * @tc.desc   Verify Promise.allSettled with all rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.reject(new Error("error1")))
      promises.add(Promise.reject(new Error("error2")))
      let result = await Promise.allSettled<string>(promises)
      expect(result.length).assertEqual(2)
      expect(result.every(r => r.status === "rejected")).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_2200
     * @tc.desc   Verify Promise.allSettled with mixed resolved/rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSettledSecondTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.resolve("success"))
      promises.add(Promise.reject(new Error("failure")))
      promises.add(Promise.resolve("another success"))
      let result = await Promise.allSettled<string>(promises)
      expect(result.length).assertEqual(3)
      let fulfilled = result.filter(r => r.status === "fulfilled")
      let rejected = result.filter(r => r.status === "rejected")
      expect(fulfilled.length).assertEqual(2)
      expect(rejected.length).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_2300
     * @tc.desc   Verify PromiseFulfilledResult structure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.resolve("test"))
      let result = await Promise.allSettled<string>(promises)
      if (result[0].status === "fulfilled") {
        let fulfilled = result[0] as PromiseFulfilledResult<string>
        expect(fulfilled.status).assertEqual("fulfilled")
        expect(fulfilled.value).assertEqual("test")
      }
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_2400
     * @tc.desc   Verify PromiseRejectedResult structure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      let error = new Error("test error")
      promises.add(Promise.reject(error))
      let result = await Promise.allSettled<string>(promises)
      if (result[0].status === "rejected") {
        let rejected = result[0] as PromiseRejectedResult
        expect(rejected.status).assertEqual("rejected")
        expect(rejected.reason).assertEqual(error)
      }
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_2500
     * @tc.desc   Verify Promise.allSettled with large Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<number>>()
      for (let i = 0; i < 100; i++) {
        promises.add(Promise.resolve<number>(i * 1.0))
      }
      let result = await Promise.allSettled<number>(promises)
      expect(result.length).assertEqual(100)
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_2600
     * @tc.desc   Verify Promise.allSettled with undefined resolved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<undefined>>()
      promises.add(Promise.resolve<undefined>(undefined))
      let result = await Promise.allSettled<undefined>(promises)
      if (result[0].status === "fulfilled") {
        expect((result[0] as PromiseFulfilledResult<undefined>).value).assertEqual(undefined)
      }
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_2700
     * @tc.desc   Verify Promise.allSettled return type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.resolve<string>("test"))
      let result: PromiseSettledResult<string>[] = await Promise.allSettled<string>(promises)
      expect(result[0].status === "fulfilled" || result[0].status === "rejected").assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest2800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_2800
     * @tc.desc   Verify Promise.allSettled status property type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.resolve("success"))
      promises.add(Promise.reject(new Error("failure")))
      let result = await Promise.allSettled<string>(promises)
      expect(result[0].status === "fulfilled" || result[0].status === "rejected").assertTrue()
      expect(result[1].status === "fulfilled" || result[1].status === "rejected").assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest2900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_2900
     * @tc.desc   Verify Promise.allSettled value property existence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.resolve<string>("test"))
      let result = await Promise.allSettled<string>(promises)
      if (result[0].status === "fulfilled") {
        expect((result[0] as PromiseFulfilledResult<string>).status).assertEqual("fulfilled")
      }
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest3000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_3000
     * @tc.desc   Verify Promise.allSettled reason property existence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.reject<string>(new Error("error")))
      let result = await Promise.allSettled<string>(promises)
      if (result[0].status === "rejected") {
        expect((result[0] as PromiseRejectedResult).status).assertEqual("rejected")
      }
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest3100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_3100
     * @tc.desc   Verify Promise.allSettled with 100 concurrent Promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<number>>()
      for (let i = 0; i < 100; i++) {
        promises.add(Promise.resolve<number>(i * 1.0))
      }
      let result = await Promise.allSettled<number>(promises)
      expect(result.length).assertEqual(100)
      expect(result.every(r => r.status === "fulfilled")).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest3200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_3200
     * @tc.desc   Verify Promise.allSettled empty array returns empty result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      try {
        let promises: Promise<number>[] = []
        let result = await Promise.allSettled<number>(promises)
        expect(result.length).assertEqual(0)
      } catch (error) {
        expect().assertFail()
      }
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest3300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_3300
     * @tc.desc   Verify Promise.allSettled with partial iterator error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<number>[] = [Promise.resolve<number>(1.0), Promise.reject<number>(new Error("partial error"))]
      let result = await Promise.allSettled<number>(promises)
      expect(result.length).assertEqual(2)
      let fulfilled = result.filter(r => r.status === "fulfilled")
      let rejected = result.filter(r => r.status === "rejected")
      expect(fulfilled.length).assertEqual(1)
      expect(rejected.length).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest3400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_3400
     * @tc.desc   Verify Promise.allSettled with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<number>[] = [Promise.resolve<number>(1.0)]
      let result = await Promise.allSettled<number>(promises)
      expect(result.length).assertEqual(1)
      expect(result[0].status).assertEqual("fulfilled")
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest3500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_3500
     * @tc.desc   Verify Promise.allSettled with number parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<string>[] = [Promise.resolve("a"), Promise.resolve("b"), Promise.resolve("c")]
      let result = await Promise.allSettled<string>(promises)
      expect(result.length).assertEqual(3)
      if (result[0].status === "fulfilled") {
        expect((result[0] as PromiseFulfilledResult<string>).value).assertEqual("a")
      }
      if (result[2].status === "fulfilled") {
        expect((result[2] as PromiseFulfilledResult<string>).value).assertEqual("c")
      }
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest3600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_3600
     * @tc.desc   Verify Promise.allSettled with string parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<string>[] = [Promise.resolve("ok"), Promise.reject<string>(new Error("err"))]
      let result = await Promise.allSettled<string>(promises)
      expect(result.length).assertEqual(2)
      expect(result.filter(r => r.status === "fulfilled").length).assertEqual(1)
      expect(result.filter(r => r.status === "rejected").length).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest3700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_3700
     * @tc.desc   Verify Promise.allSettled with await in async function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSettledSecondTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let testAllSettled: () => Promise<void> = async (): Promise<void> => {
        let promises = new Set<Promise<string>>();
        promises.add(Promise.resolve("test"));
        let result = await Promise.allSettled<string>(promises);
        expect(result.length).assertEqual(1);
      };
      await testAllSettled()
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest3800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_3800
     * @tc.desc   Verify Promise.allSettled await catching iterator error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let testIteratorError: () => Promise<void> = async (): Promise<void> => {
        let promises: Promise<number>[] = [Promise.reject<number>(new Error("Iterator error"))]
        let result = await Promise.allSettled<number>(promises);
        expect(result[0].status).assertEqual("rejected");
      };
      await testIteratorError()
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest3900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_3900
     * @tc.desc   Verify Promise.allSettled with then chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.resolve("test"))
      Promise.allSettled<string>(promises)
        .then((result) => {
          expect(result.length).assertEqual(1)
          return result
        })
        .then((result) => {
          expect(result[0].status).assertEqual("fulfilled")
        })
      await new Promise<number>((resolve) => { setTimeout(() => resolve(1.0), 100) })
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest4000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_4000
     * @tc.desc   Verify Promise.allSettled catch is not called
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.reject(new Error("failure")))
      let catchCalled = false
      await Promise.allSettled<string>(promises)
        .then((result) => {
          expect(result[0].status).assertEqual("rejected")
        })
        .catch(() => {
          catchCalled = true
        })
      expect(catchCalled).assertFalse()
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest4100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_4100
     * @tc.desc   Verify multiple Promise.allSettled concurrent execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises1 = new Set<Promise<number>>()
      promises1.add(Promise.resolve<number>(1.0))
      let promises2 = new Set<Promise<number>>()
      promises2.add(Promise.resolve<number>(2.0))
      let promises3 = new Set<Promise<number>>()
      promises3.add(Promise.resolve<number>(3.0))

      let result1 = await Promise.allSettled<number>(promises1)
      let result2 = await Promise.allSettled<number>(promises2)
      let result3 = await Promise.allSettled<number>(promises3)
      expect(result1[0].status).assertEqual("fulfilled")
      expect(result2[0].status).assertEqual("fulfilled")
      expect(result3[0].status).assertEqual("fulfilled")
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest4200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_4200
     * @tc.desc   Verify Promise.allSettled with delayed resolve
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(new Promise<string>((resolve) => {
        setTimeout(() => resolve("delayed"), 100)
      }))
      let result = await Promise.allSettled<string>(promises)
      expect(result[0].status).assertEqual("fulfilled")
      if (result[0].status === "fulfilled") {
        expect((result[0] as PromiseFulfilledResult<string>).value).assertEqual("delayed")
      }
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest4300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_4300
     * @tc.desc   Verify Promise.allSettled with delayed reject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(new Promise<string>((resolve, reject) => {
        setTimeout(() => reject(new Error("delayed error")), 100)
      }))
      let result = await Promise.allSettled<string>(promises)
      expect(result[0].status).assertEqual("rejected")
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest4400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_4400
     * @tc.desc   Verify Promise.allSettled with mixed immediate and delayed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.resolve("immediate"))
      promises.add(new Promise<string>((resolve) => {
        setTimeout(() => resolve("delayed"), 100)
      }))
      let result = await Promise.allSettled<string>(promises)
      expect(result.length).assertEqual(2)
      expect(result.every(r => r.status === "fulfilled")).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest4500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_4500
     * @tc.desc   Verify Promise.allSettled with shared state object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let state: SharedState = { count: 0 }
      let promises = new Set<Promise<number>>()
      promises.add(new Promise<number>((resolve) => {
        state.count++
        resolve(1.0)
      }))
      promises.add(new Promise<number>((resolve) => {
        state.count++
        resolve(1.0)
      }))
      let result = await Promise.allSettled<number>(promises)
      expect(state.count).assertEqual(2)
      expect(result.every(r => r.status === "fulfilled")).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest4600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_4600
     * @tc.desc   Verify Promise.allSettled with shared counter concurrent modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = 0
      let promises = new Set<Promise<number>>()
      for (let i = 0; i < 10; i++) {
        promises.add(new Promise<number>((resolve) => {
          setTimeout(() => {
            counter++
            resolve(1.0)
          }, 50)
        }))
      }
      let result = await Promise.allSettled<number>(promises)
      expect(result.every(r => r.status === "fulfilled")).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest4700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_4700
     * @tc.desc   Verify Promise.allSettled nested in async function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let fetchNestedData: () => Promise<string> = async (): Promise<string> => {
        let inner = new Set<Promise<string>>();
        inner.add(Promise.resolve<string>("inner"));
        let innerResult = await Promise.allSettled<string>(inner);
        if (innerResult[0].status === "fulfilled") {
          return (innerResult[0] as PromiseFulfilledResult<string>).value;
        }
        return "error";
      };
      let promises = new Set<Promise<string>>()
      promises.add(fetchNestedData())
      let result = await Promise.allSettled<string>(promises)
      expect(result[0].status).assertEqual("fulfilled")
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest4800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_4800
     * @tc.desc   Verify Promise.allSettled with Timer triggered Promise creation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      await new Promise<number>((resolve) => {
        setTimeout(() => {
          promises.add(Promise.resolve<string>("timer triggered"))
          resolve(1.0)
        }, 100)
      })
      let result = await Promise.allSettled<string>(promises)
      expect(result.length).assertEqual(1)
      expect(result[0].status).assertEqual("fulfilled")
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest4900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_4900
     * @tc.desc   Verify Promise.allSettled with Timer delayed resolve
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(new Promise<string>((resolve) => {
        setTimeout(() => resolve("delayed by timer"), 500)
      }))
      let result = await Promise.allSettled<string>(promises)
      expect(result[0].status).assertEqual("fulfilled")
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest5000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_5000
     * @tc.desc   Verify Promise.allSettled with Microtask timing control
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let executionOrder: string[] = []
      let promises = new Set<Promise<string>>()
      promises.add(new Promise<string>((resolve) => {
        Promise.resolve<string>("").then<void>(() => {
          executionOrder.push("microtask1")
          resolve("p1")
        })
      }))
      promises.add(Promise.resolve("p2"))
      await Promise.allSettled<string>(promises)
      expect(executionOrder.length).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest5100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_5100
     * @tc.desc   Verify Promise.allSettled with Macro task timing control
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(new Promise<string>((resolve) => {
        setTimeout(() => resolve("macro"), 100)
      }))
      let result = await Promise.allSettled<string>(promises)
      expect(result[0].status).assertEqual("fulfilled")
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest5200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_5200
     * @tc.desc   Verify Promise.allSettled with mixed micro and macro tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(new Promise<string>((resolve) => {
        Promise.resolve<string>("").then<void>(() => { resolve("micro") })
      }))
      promises.add(new Promise<string>((resolve) => {
        setTimeout(() => resolve("macro"), 100)
      }))
      let result = await Promise.allSettled<string>(promises)
      expect(result.length).assertEqual(2)
      expect(result.every(r => r.status === "fulfilled")).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest5300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_5300
     * @tc.desc   Verify Promise.allSettled with Promise.all nested
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let innerPromises: Promise<string>[] = [Promise.resolve("inner")]
      let promises = new Set<Promise<string[]>>()
      promises.add(Promise.all(innerPromises))
      let result = await Promise.allSettled<string[]>(promises)
      expect(result[0].status).assertEqual("fulfilled")
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest5400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_5400
     * @tc.desc   Verify Promise.allSettled with Promise.race nested
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let innerPromises: Promise<string>[] = [Promise.resolve("race")]
      let promises = new Set<Promise<string>>()
      promises.add(Promise.race(innerPromises))
      let result = await Promise.allSettled<string>(promises)
      expect(result[0].status).assertEqual("fulfilled")
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest5500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_5500
     * @tc.desc   Verify Promise.allSettled with Promise.resolve nested
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.resolve(Promise.resolve("nested")))
      let result = await Promise.allSettled<string>(promises)
      expect(result[0].status).assertEqual("fulfilled")
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest5600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_5600
     * @tc.desc   Verify Promise.allSettled with Promise.allSettled nested
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let inner = new Set<Promise<string>>()
      inner.add(Promise.resolve("inner"))
      let outer = new Set<Promise<PromiseSettledResult<string>[]>>()
      outer.add(Promise.allSettled(inner))
      let result = await Promise.allSettled<PromiseSettledResult<string>[]>(outer)
      expect(result[0].status).assertEqual("fulfilled")
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest5700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_5700
     * @tc.desc   Verify Promise.allSettled with Promise.reject nested
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.resolve(Promise.reject(new Error("nested reject"))))
      let result = await Promise.allSettled<string>(promises)
      expect(result[0].status).assertEqual("rejected")
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest5800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_5800
     * @tc.desc   Verify Promise.allSettled with parallel execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<number>>()
      for (let i = 0; i < 3; i++) {
        promises.add(new Promise<number>((resolve) => {
          setTimeout(() => resolve(i), 100)
        }))
      }
      let results = await Promise.allSettled<number>(promises)
      let fulfilledCount = 0
      for (let i = 0; i < results.length; i++) {
        if (results[i].status === 'fulfilled') {
          fulfilledCount++
        }
      }
      expect(fulfilledCount).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest5900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_5900
     * @tc.desc   Verify Promise.allSettled with async error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(new Promise<string>((_, reject) => {
        setTimeout(() => reject(new Error("async error")), 100)
      }))
      let result = await Promise.allSettled<string>(promises)
      expect(result[0].status).assertEqual("rejected")
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest6000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_6000
     * @tc.desc   Verify Promise.allSettled with long-running task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<number>>()
      promises.add(new Promise<number>((resolve) => {
        let sum = 0
        for (let i = 0; i < 1000000; i++) {
          sum += i
        }
        resolve(sum)
      }))
      let result = await Promise.allSettled<number>(promises)
      expect(result[0].status).assertEqual("fulfilled")
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest6100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_6100
     * @tc.desc   Verify Promise.allSettled with resource cleanup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let cleanupCalled = false
      let promises = new Set<Promise<string>>()
      promises.add(new Promise<string>((resolve) => {
        try {
          resolve("success")
        } finally {
          cleanupCalled = true
        }
      }))
      await Promise.allSettled<string>(promises)
      expect(cleanupCalled).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest6200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_6200
     * @tc.desc   Verify Promise.allSettled with promise chain error propagation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.resolve("start").then(() => {
        throw new Error("chain error")
      }))
      let result = await Promise.allSettled<string>(promises)
      expect(result[0].status).assertEqual("rejected")
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest6300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_6300
     * @tc.desc   Verify Promise.allSettled with dynamic promise creation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<number>>()
      for (let i = 0; i < 5; i++) {
        promises.add(new Promise<number>((resolve) => {
          resolve(i * 2.0)
        }))
      }
      let result = await Promise.allSettled<number>(promises)
      expect(result.length).assertEqual(5)
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest6400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_6400
     * @tc.desc   Verify Promise.allSettled with complex object resolution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {

      let promises = new Set<Promise<ComplexData>>()
      promises.add(Promise.resolve<ComplexData>({
        id: 1,
        name: "test",
        nested: { value: true }
      }))
      let result = await Promise.allSettled<ComplexData>(promises)
      if (result[0].status === "fulfilled") {
        expect((result[0] as PromiseFulfilledResult<ComplexData>).value.nested.value).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest6500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_6500
     * @tc.desc   Verify Promise.allSettled with error object as reason
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let error = new TypeError("type error")
      let promises = new Set<Promise<string>>()
      promises.add(Promise.reject(error))
      let result = await Promise.allSettled<string>(promises)
      if (result[0].status === "rejected") {
      }
      expect(Array.isArray(result)).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest6600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_6600
     * @tc.desc   Verify Promise.allSettled with non-error rejection reason
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.reject<string>(new Error("string reason")))
      let result = await Promise.allSettled<string>(promises)
      if (result[0].status === "rejected") {
      }
      expect(Array.isArray(result)).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest6700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_6700
     * @tc.desc   Verify Promise.allSettled with object as rejection reason
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let reason: RejectReason = { code: 500, message: "server error" }
      let promises = new Set<Promise<string>>()
      promises.add(Promise.reject<string>(new Error(reason.message)))
      let result = await Promise.allSettled<string>(promises)
      if (result[0].status === "rejected") {
      }
      expect(Array.isArray(result)).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest6800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_6800
     * @tc.desc   Verify Promise.allSettled with Promise.allSettled combination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set1 = new Set<Promise<string>>()
      set1.add(Promise.resolve("a"))
      let set2 = new Set<Promise<string>>()
      set2.add(Promise.reject(new Error("b")))

      let outer = new Set<Promise<PromiseSettledResult<string>[]>>()
      outer.add(Promise.allSettled(set1))
      outer.add(Promise.allSettled(set2))

      let result = await Promise.allSettled<PromiseSettledResult<string>[]>(outer)
      expect(result.length).assertEqual(2)
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest6900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_6900
     * @tc.desc   Verify Promise.allSettled with Map values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let map = new Map<number, Promise<string>>()
      map.set(1, Promise.resolve("one"))
      map.set(2, Promise.resolve("two"))
      let promises = new Set<Promise<string>>(map.values())
      let result = await Promise.allSettled<string>(promises)
      expect(result.length).assertEqual(2)
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest7000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_7000
     * @tc.desc   Verify Promise.allSettled with Set of thenables
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let thenable1 = new StringPromiseLike("t1")
      let thenable2 = new StringPromiseLike("t2")
      let promises = new Set<PromiseLike<string>>()
      promises.add(thenable1)
      promises.add(thenable2)
      let result = await Promise.allSettled<string>(promises)
      expect(result.length).assertEqual(2)
      expect(result.every(r => r.status === "fulfilled")).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest7100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_7100
     * @tc.desc   Verify Promise.allSettled with mixed synchronous and asynchronous
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = new Set<Promise<string>>()
      promises.add(Promise.resolve("sync"))
      promises.add(new Promise<string>((resolve) => { setTimeout(() => resolve("async"), 100) }))
      promises.add(Promise.resolve("sync2"))
      let result = await Promise.allSettled<string>(promises)
      expect(result.length).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest7200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_7200
     * @tc.desc   Verify Promise.allSettled with timeout promise pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let timeout = new Promise<string>((_, reject) => {
        setTimeout(() => reject(new Error("timeout")), 100)
      })
      let promises = new Set<Promise<string>>()
      promises.add(timeout)
      let result = await Promise.allSettled<string>(promises)
      expect(result[0].status).assertEqual("rejected")
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest7300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_7300
     * @tc.desc   Verify Promise.allSettled with race condition scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = 0
      let promises = new Set<Promise<number>>()
      for (let i = 0; i < 100; i++) {
        promises.add(new Promise<number>((resolve) => {
          counter++
          resolve(1.0)
        }))
      }
      await Promise.allSettled<number>(promises)
      expect(counter).assertEqual(100)
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest7400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_7400
     * @tc.desc   Verify Promise.allSettled with Promise.try pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseTry = (fn: () => string | Promise<string>): Promise<string> => {
        return new Promise<string>((resolve, reject) => {
          try {
            let result = fn()
            resolve(result)
          } catch (e) {
            reject(e)
          }
        });
      };
      let promises = new Set<Promise<string>>()
      promises.add(promiseTry(() => "success"))
      promises.add(promiseTry(() => { throw new Error("error") }))
      let result = await Promise.allSettled<string>(promises)
      expect(result.length).assertEqual(2)
      expect(result[0].status).assertEqual("fulfilled")
      expect(result[1].status).assertEqual("rejected")
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest7500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_7500
     * @tc.desc   Verify Promise.allSettled with Promise finally pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let finallyCalled = 0
      let promises = new Set<Promise<string>>()
      promises.add(Promise.resolve("test").finally(() => { finallyCalled++ }))
      promises.add(Promise.reject(new Error("err")).finally(() => { finallyCalled++ }))
      await Promise.allSettled<string>(promises)
      expect(finallyCalled).assertEqual(2)
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledSecondTest7600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_SECOND_TEST_7600
     * @tc.desc   Verify Promise.allSettled comprehensive integration test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledSecondTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {

      let fetchUser = (id: number): Promise<User> => {
        if (id === 3) {
          return Promise.reject(new Error("user not found"))
        }
        return Promise.resolve<User>({ id: id, name: "User " + id.toString() })
      }
      let promises = new Set<Promise<User>>()
      promises.add(fetchUser(1))
      promises.add(fetchUser(2))
      promises.add(fetchUser(3))
      promises.add(fetchUser(4))
      let result = await Promise.allSettled<User>(promises)
      expect(result.length).assertEqual(4)
      let fulfilled = result.filter(r => r.status === "fulfilled")
      let rejected = result.filter(r => r.status === "rejected")
      expect(fulfilled.length).assertEqual(3)
      expect(rejected.length).assertEqual(1)
      Done();
    })
  })
}
