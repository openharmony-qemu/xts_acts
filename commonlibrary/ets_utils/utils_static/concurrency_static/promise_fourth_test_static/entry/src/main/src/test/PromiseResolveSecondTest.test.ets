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
  constructor(value: T) { this.value = value }
  then<U, E>(onFulfilled: ((value: T) => U | PromiseLike<U>), onRejected?: ((reason: Error) => E | PromiseLike<E>)): PromiseLike<Awaited<U> | Awaited<E>> {
    if (onFulfilled) { onFulfilled(this.value) }
    return Promise.resolve<T>(this.value) as PromiseLike<Awaited<U> | Awaited<E>>
  }
}

class AsyncPromiseLike<T> implements PromiseLike<T> {
  value: T
  delay: int
  constructor(value: T, delay: int) { this.value = value; this.delay = delay }
  then<U, E>(onFulfilled: ((value: T) => U | PromiseLike<U>), onRejected?: ((reason: Error) => E | PromiseLike<E>)): PromiseLike<Awaited<U> | Awaited<E>> {
    if (onFulfilled) {
      setTimeout(() => { onFulfilled(this.value) }, this.delay)
    }
    return Promise.resolve<T>(this.value) as PromiseLike<Awaited<U> | Awaited<E>>
  }
}

class ThrowingPromiseLike<T> implements PromiseLike<T> {
  errorMsg: string
  constructor(errorMsg: string) { this.errorMsg = errorMsg }
  then<U, E>(onFulfilled: ((value: T) => U | PromiseLike<U>), onRejected?: ((reason: Error) => E | PromiseLike<E>)): PromiseLike<Awaited<U> | Awaited<E>> {
    throw new Error(this.errorMsg)
  }
}

interface User {
  id?: number
  name: string
  age: number
}

interface Data {
  id: number | null
  name: string | null
}

interface Config {
  value?: string
  count?: number
}

interface Address {
  city: string
  zip: string
}

interface Person {
  name: string
  address: Address
}

interface Handler {
  name: string
  action: () => string
}

interface Item {
  id: number
  name: string
}

interface DataObj {
  id: number
}

interface DataXss {
  script: string
}

interface ConfigResult {
  db: string
  api: string
  cache: string
}

export default function BuiltinsPromiseResolveSecondTest(): void {
  describe('BuiltinsPromiseResolveSecondTest', (): void => {
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
     * @tc.name   PromiseResolveSecondTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_0100
     * @tc.desc   Verify Promise.resolve with string type resolves to hello
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveSecondTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("hello")
      let result = await promise
      expect(result).assertEqual("hello")
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_0200
     * @tc.desc   Verify Promise.resolve with number type resolves to 42
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveSecondTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<number>(42)
      let result = await promise
      expect(result).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_0300
     * @tc.desc   Verify Promise.resolve with Number.MAX_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveSecondTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<number>(Number.MAX_VALUE)
      let result = await promise
      expect(result).assertEqual(Number.MAX_VALUE)
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_0400
     * @tc.desc   Verify Promise.resolve with Number.MIN_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveSecondTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<number>(Number.MIN_VALUE)
      let result = await promise
      expect(result).assertEqual(Number.MIN_VALUE)
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_0500
     * @tc.desc   Verify Promise.resolve with NaN value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveSecondTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<number>(Number.NaN)
      let result = await promise
      expect(Number.isNaN(result)).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_0600
     * @tc.desc   Verify Promise.resolve with Number.POSITIVE_INFINITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveSecondTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<number>(Number.POSITIVE_INFINITY)
      let result = await promise
      expect(result).assertEqual(Number.POSITIVE_INFINITY)
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_0700
     * @tc.desc   Verify Promise.resolve with Number.NEGATIVE_INFINITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveSecondTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<number>(Number.NEGATIVE_INFINITY)
      let result = await promise
      expect(result).assertEqual(Number.NEGATIVE_INFINITY)
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_0800
     * @tc.desc   Verify Promise.resolve with scientific notation 1.0e6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveSecondTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<number>(1.0e6)
      let result = await promise
      expect(result).assertEqual(1000000)
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_0900
     * @tc.desc   Verify Promise.resolve with hexadecimal number 0x1234
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveSecondTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<number>(0x1234)
      let result = await promise
      expect(result).assertEqual(4660)
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_1000
     * @tc.desc   Verify Promise.resolve with zero and negative zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveSecondTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<number>(0)
      let result1 = await promise1
      expect(result1).assertEqual(0)
      let promise2 = Promise.resolve<number>(-0)
      let result2 = await promise2
      expect(result2).assertEqual(0)
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_1100
     * @tc.desc   Verify Promise.resolve with boolean true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveSecondTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<boolean>(true)
      let result = await promise
      expect(result).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_1200
     * @tc.desc   Verify Promise.resolve with boolean false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveSecondTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<boolean>(false)
      let result = await promise
      expect(result).assertFalse()
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_1300
     * @tc.desc   Verify Promise.resolve with null value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveSecondTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<null>(null)
      let result = await promise
      expect(result).assertNull()
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_1400
     * @tc.desc   Verify Promise.resolve with undefined value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveSecondTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<undefined>(undefined)
      let result = await promise
      expect(result).assertUndefined()
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_1500
     * @tc.desc   Verify Promise.resolve with empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveSecondTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("")
      let result = await promise
      expect(result).assertEqual("")
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_1600
     * @tc.desc   Verify Promise.resolve with Chinese string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveSecondTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("\u4e2d\u6587")
      let result = await promise
      expect(result).assertEqual("中文")
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_1700
     * @tc.desc   Verify Promise.resolve with emoji string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveSecondTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("😀测试🔥")
      let result = await promise
      expect(result).assertEqual("😀测试🔥")
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_1800
     * @tc.desc   Verify Promise.resolve with long string 10000 characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveSecondTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let longStr = "a".repeat(10000)
      let promise = Promise.resolve<string>(longStr)
      let result = await promise
      expect(result.length).assertEqual(10000)
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_1900
     * @tc.desc   Verify Promise.resolve with special characters string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveSecondTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("!@#$%^&*()")
      let result = await promise
      expect(result).assertEqual("!@#$%^&*()")
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_2000
     * @tc.desc   Verify Promise.resolve with XSS-like string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveSecondTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("<script>alert(1)</script>")
      let result = await promise
      expect(result).assertEqual("<script>alert(1)</script>")
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_2100
     * @tc.desc   Verify Promise.resolve with zero-width space string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveSecondTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("\u200B")
      let result = await promise
      expect(result).assertEqual("\u200B")
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_2200
     * @tc.desc   Verify Promise.resolve with multilingual string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveSecondTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("测试テスト테스트Test")
      let result = await promise
      expect(result).assertEqual("测试テスト테스트Test")
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_2300
     * @tc.desc   Verify Promise.resolve with User interface type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveSecondTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let user: User = { name: "张三", age: 25 }
      let promise = Promise.resolve<User>(user)
      let result = await promise
      expect(result.age).assertEqual(25)
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_2400
     * @tc.desc   Verify Promise.resolve with Data interface with null fields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveSecondTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let data: Data = { id: null, name: null }
      let promise = Promise.resolve<Data>(data)
      let result = await promise
      expect(result.id).assertNull()
      expect(result.name).assertNull()
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_2500
     * @tc.desc   Verify Promise.resolve with Config interface with optional fields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveSecondTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let config: Config = {}
      let promise = Promise.resolve<Config>(config)
      let result = await promise
      expect(result.value).assertUndefined()
      expect(result.count).assertUndefined()
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_2600
     * @tc.desc   Verify Promise.resolve with Person interface with nested Address
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveSecondTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let person: Person = {
        name: "李四",
        address: { city: "北京", zip: "100000" }
      }
      let promise = Promise.resolve<Person>(person)
      let result = await promise
      expect(result.address.city).assertEqual("北京")
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_2700
     * @tc.desc   Verify Promise.resolve with empty object type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveSecondTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<object>({})
      let result = await promise
      expect(Object.keys(result).length).assertEqual(0)
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest2800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_2800
     * @tc.desc   Verify Promise.resolve with Handler interface with method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveSecondTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let handler: Handler = {
        name: "test",
        action: () => "executed"
      }
      let promise = Promise.resolve<Handler>(handler)
      let result = await promise
      expect(result.action()).assertEqual("executed")
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest2900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_2900
     * @tc.desc   Verify Promise.resolve with DataXss interface with script content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveSecondTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let data: DataXss = { script: "<script>alert(1)</script>" }
      let promise = Promise.resolve<DataXss>(data)
      let result = await promise
      expect(result.script).assertEqual("<script>alert(1)</script>")
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest3000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_3000
     * @tc.desc   Verify Promise.resolve with number array type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveSecondTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<number[]>([1, 2, 3])
      let result = await promise
      expect(result.length).assertEqual(3)
      expect(result[0]).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest3100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_3100
     * @tc.desc   Verify Promise.resolve with string array type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveSecondTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string[]>(["a", "b", "c"])
      let result = await promise
      expect(result.length).assertEqual(3)
      expect(result[0]).assertEqual("a")
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest3200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_3200
     * @tc.desc   Verify Promise.resolve with empty array type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveSecondTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<number[]>([])
      let result = await promise
      expect(result.length).assertEqual(0)
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest3300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_3300
     * @tc.desc   Verify Promise.resolve with array containing null elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveSecondTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<(number | null)[]>([1, null, 3])
      let result = await promise
      expect(result[1]).assertNull()
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest3400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_3400
     * @tc.desc   Verify Promise.resolve with array containing undefined elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveSecondTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<(number | undefined)[]>([1, undefined, 3])
      let result = await promise
      expect(result[1]).assertUndefined()
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest3500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_3500
     * @tc.desc   Verify Promise.resolve with nested number array type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveSecondTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<number[][]>([[1, 2], [3, 4]])
      let result = await promise
      expect(result[0][0]).assertEqual(1)
      expect(result[1][1]).assertEqual(4)
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest3600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_3600
     * @tc.desc   Verify Promise.resolve with Item interface array type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveSecondTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let items: Item[] = [
        { id: 1, name: "item1" },
        { id: 2, name: "item2" }
      ]
      let promise = Promise.resolve<Item[]>(items)
      let result = await promise
      expect(result.length).assertEqual(2)
      expect(result[0].name).assertEqual("item1")
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest3700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_3700
     * @tc.desc   Verify Promise.resolve with large array 10000 elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveSecondTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let bigArray: number[] = []
      for (let i = 0; i < 10000; i++) {
        bigArray.push(i)
      }
      let promise = Promise.resolve<number[]>(bigArray)
      let result = await promise
      expect(result.length).assertEqual(10000)
      expect(result[9999]).assertEqual(9999)
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest3800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_3800
     * @tc.desc   Verify Promise.resolve with PromiseLike string thenable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveSecondTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let thenable = new CustomPromiseLike<string>("thenable value")
      let promise = Promise.resolve<string>(thenable)
      let result = await promise
      expect(result).assertEqual("thenable value")
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest3900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_3900
     * @tc.desc   Verify Promise.resolve with PromiseLike number thenable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveSecondTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let thenable = new CustomPromiseLike<number>(42)
      let promise = Promise.resolve<number>(thenable)
      let result = await promise
      expect(result).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest4000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_4000
     * @tc.desc   Verify Promise.resolve with async PromiseLike thenable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveSecondTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let thenable = new AsyncPromiseLike<string>("async result", 100)
      let promise = Promise.resolve<string>(thenable)
      let result = await promise
      expect(result).assertEqual("async result")
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest4100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_4100
     * @tc.desc   Verify Promise.resolve with thenable throwing error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveSecondTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let thenable = new ThrowingPromiseLike<string>("thenable error")
      try {
        let promise = Promise.resolve<string>(thenable)
        await promise
        expect().assertFail()
      } catch (error) {
        let e = error
        expect(e instanceof Error).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest4200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_4200
     * @tc.desc   Verify Promise.resolve with Promise input returns same instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveSecondTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let originalPromise = Promise.resolve<number>(100)
      let returnedPromise = Promise.resolve<number>(originalPromise)
      expect(returnedPromise === originalPromise).assertTrue()
      let result = await returnedPromise
      expect(result).assertEqual(100)
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest4300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_4300
     * @tc.desc   Verify Promise.resolve with rejected Promise input returns same instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveSecondTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let originalPromise = Promise.reject<number>(new Error("reject error"))
      let returnedPromise = Promise.resolve<number>(originalPromise)
      expect(returnedPromise === originalPromise).assertTrue()
      try {
        await returnedPromise
        expect().assertFail()
      } catch (error) {
        let e = error
        expect(e instanceof Error).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest4400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_4400
     * @tc.desc   Verify Promise.resolve with new Promise input returns same instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveSecondTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let originalPromise = new Promise<number>((resolve) => {
        setTimeout(() => resolve(200), 100)
      })
      let returnedPromise = Promise.resolve<number>(originalPromise)
      expect(returnedPromise === originalPromise).assertTrue()
      let result = await returnedPromise
      expect(result).assertEqual(200)
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest4500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_4500
     * @tc.desc   Verify Promise.resolve with chained Promise input unwraps value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveSecondTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let chainPromise = Promise.resolve<number>(10)
        .then(x => x * 2)
        .then(x => x + 5)
      let returnedPromise = Promise.resolve<number>(chainPromise)
      let result = await returnedPromise
      expect(result).assertEqual(25)
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest4600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_4600
     * @tc.desc   Verify Promise.resolve with string|number union type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveSecondTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<string | number>("text")
      let result1 = await promise1
      expect(result1).assertEqual("text")
      let promise2 = Promise.resolve<string | number>(123)
      let result2 = await promise2
      expect(result2).assertEqual(123)
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest4700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_4700
     * @tc.desc   Verify Promise.resolve with string|null union type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveSecondTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<string | null>("value")
      let result1 = await promise1
      expect(result1).assertEqual("value")
      let promise2 = Promise.resolve<string | null>(null)
      let result2 = await promise2
      expect(result2).assertNull()
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest4800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_4800
     * @tc.desc   Verify Promise.resolve with number|undefined union type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveSecondTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<number | undefined>(42)
      let result1 = await promise1
      expect(result1).assertEqual(42)
      let promise2 = Promise.resolve<number | undefined>(undefined)
      let result2 = await promise2
      expect(result2).assertUndefined()
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest4900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_4900
     * @tc.desc   Verify Promise.resolve with string|number|null union type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveSecondTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<string | number | null>("test")
      let result1 = await promise1
      expect(result1 instanceof string).assertTrue()
      let promise2 = Promise.resolve<string | number | null>(100)
      let result2 = await promise2
      expect(result2 instanceof number).assertTrue()
      let promise3 = Promise.resolve<string | number | null>(null)
      let result3 = await promise3
      expect(result3).assertNull()
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest5000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_5000
     * @tc.desc   Verify Promise.resolve with DataObj|null union type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveSecondTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<DataObj | null>({ id: 1 })
      let result1 = await promise1
      expect(result1!.id).assertEqual(1)
      let promise2 = Promise.resolve<DataObj | null>(null)
      let result2 = await promise2
      expect(result2).assertNull()
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest5100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_5100
     * @tc.desc   Verify Promise.resolve with number array|null|undefined union type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveSecondTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<number[] | null | undefined>([1, 2, 3])
      let result1 = await promise1
      expect(result1!.length).assertEqual(3)
      let promise2 = Promise.resolve<number[] | null | undefined>(null)
      let result2 = await promise2
      expect(result2).assertNull()
      let promise3 = Promise.resolve<number[] | null | undefined>(undefined)
      let result3 = await promise3
      expect(result3).assertUndefined()
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest5200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_5200
     * @tc.desc   Verify Promise.resolve with explicit string generic type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveSecondTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("generic string")
      let result = await promise
      expect(result).assertEqual("generic string")
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest5300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_5300
     * @tc.desc   Verify Promise.resolve with explicit number generic type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveSecondTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<number>(100)
      let result = await promise
      expect(result).assertEqual(100)
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest5400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_5400
     * @tc.desc   Verify Promise.resolve with User generic type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveSecondTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let user: User = { id: 1, name: "张三", age: 25 }
      let promise = Promise.resolve<User>(user)
      let result = await promise
      expect(result.id).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest5500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_5500
     * @tc.desc   Verify Promise.resolve with number array generic type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveSecondTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<number[]>([1, 2, 3, 4, 5])
      let result = await promise
      expect(result.length).assertEqual(5)
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest5600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_5600
     * @tc.desc   Verify Promise.resolve with nested Promise unwraps value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveSecondTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let innerPromise = Promise.resolve<string>("nested")
      let promise = Promise.resolve<Promise<string>>(innerPromise)
      let result = await promise
      expect(result).assertEqual("nested")
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest5700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_5700
     * @tc.desc   Verify Promise.resolve with number resolves to the value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveSecondTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<number>(42)
      let result = await promise
      expect(result).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest5800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_5800
     * @tc.desc   Verify Promise.resolve with typed Promise variable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveSecondTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise: Promise<number> = Promise.resolve<number>(100)
      let result = await promise
      expect(result).assertEqual(100)
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest5900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_5900
     * @tc.desc   Verify Promise.resolve with double nested Promise unwraps deeply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveSecondTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let nestedPromise = Promise.resolve<Promise<string>>(Promise.resolve<string>("nested"))
      let result = await nestedPromise
      expect(result).assertEqual("nested")
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest6000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_6000
     * @tc.desc   Verify Promise.resolve then handler updates external state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveSecondTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("test")
      let state = "pending"
      promise.then(() => { state = "resolved" }).catch((error: Error) => { expect(error instanceof Error).assertTrue(); expect().assertFail() })
      await promise
      expect(state).assertEqual("resolved")
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest6100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_6100
     * @tc.desc   Verify Promise.resolve with Promise input returns same reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveSecondTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let original = Promise.resolve<number>(10)
      let returned = Promise.resolve<number>(original)
      expect(returned === original).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest6200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_6200
     * @tc.desc   Verify Promise.resolve with PromiseLike thenable returns Promise instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveSecondTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let thenable = new CustomPromiseLike<number>(20)
      let promise = Promise.resolve<number>(thenable)
      let result = await promise
      expect(result).assertEqual(20)
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest6300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_6300
     * @tc.desc   Verify EAWorker.run result transforms through Promise.resolve chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveSecondTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('resolveWorker')
      eaWorker.start()
      try {
        let job = eaWorker.run<int>(() => {
          return 42
        })
        let baseValue = job.Await()
        let result = await Promise.resolve<int>(baseValue)
          .then<int>((value: int) => value + 8)
          .then<int>((value: int) => value * 2)
        expect(result).assertEqual(100)
      } finally {
        eaWorker.join().Await()
      }
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest6400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_6400
     * @tc.desc   Verify EAWorker.run typed result resolves through Promise.resolve
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveSecondTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('typedResolveWorker')
      eaWorker.start()
      try {
        let job = eaWorker.run<int>((data: int): int => {
          return data * 2
        }, 10)
        let workerResult = job.Await()
        let result = await Promise.resolve<int>(workerResult)
        expect(result).assertEqual(20)
      } finally {
        eaWorker.join().Await()
      }
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest6500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_6500
     * @tc.desc   Verify EAWorker.run message result resolves with prefix through Promise.resolve
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveSecondTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('msgResolveWorker')
      eaWorker.start()
      try {
        let job = eaWorker.run<string>((msg: string): string => {
          return msg.toUpperCase()
        }, "hello")
        let workerResult = job.Await()
        let result = await Promise.resolve<string>(workerResult)
          .then<string>((value: string) => "processed: " + value)
        expect(result).assertEqual("processed: HELLO")
      } finally {
        eaWorker.join().Await()
      }
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest6600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_6600
     * @tc.desc   Verify EAWorker.run typed result converts to string with prefix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveSecondTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('typedMsgResolveWorker')
      eaWorker.start()
      try {
        let job = eaWorker.run<int>((num: int): int => {
          return num * 10
        }, 5)
        let workerResult = job.Await()
        let result = "result: " + workerResult.toString()
        expect(result).assertEqual("result: 50")
      } finally {
        eaWorker.join().Await()
      }
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest6700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_6700
     * @tc.desc   Verify EAWorker.run chained string result resolves through Promise.resolve
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveSecondTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('chainResolveWorker')
      eaWorker.start()
      try {
        let job = eaWorker.run<string>(() => {
          return "start-step1-step2-done"
        })
        let workerResult = job.Await()
        let result = await Promise.resolve<string>(workerResult)
        expect(result).assertEqual("start-step1-step2-done")
      } finally {
        eaWorker.join().Await()
      }
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest6800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_6800
     * @tc.desc   Verify EAWorker.run doubled message result resolves through Promise.resolve
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveSecondTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('msgChainResolveWorker')
      eaWorker.start()
      try {
        let job = eaWorker.run<string>((input: string): string => {
          return "[" + input.toUpperCase() + "]" + "[" + input.toUpperCase() + "]"
        }, "test")
        let workerResult = job.Await()
        let result = await Promise.resolve<string>(workerResult)
        expect(result).assertEqual("[TEST][TEST]")
      } finally {
        eaWorker.join().Await()
      }
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest6900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_6900
     * @tc.desc   Verify EAWorker.run value resolves through Promise.resolve
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveSecondTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('resolveValueWorker')
      eaWorker.start()
      try {
        let job = eaWorker.run<string>(() => {
          return "worker-value"
        })
        let workerResult = job.Await()
        let result = await Promise.resolve<string>(workerResult)
        expect(result).assertEqual("worker-value")
      } finally {
        eaWorker.join().Await()
      }
      Done();
    })

    /**
     * @tc.name   PromiseResolveSecondTest7000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_SECOND_TEST_7000
     * @tc.desc   Verify EAWorker.run message resolves with prefix through Promise.resolve
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveSecondTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('msgResolveValueWorker')
      eaWorker.start()
      try {
        let job = eaWorker.run<string>((msg: string): string => {
          return "resolved: " + msg
        }, "hello")
        let workerResult = job.Await()
        let result = await Promise.resolve<string>(workerResult)
        expect(result).assertEqual("resolved: hello")
      } finally {
        eaWorker.join().Await()
      }
      Done();
    })

  })
}
