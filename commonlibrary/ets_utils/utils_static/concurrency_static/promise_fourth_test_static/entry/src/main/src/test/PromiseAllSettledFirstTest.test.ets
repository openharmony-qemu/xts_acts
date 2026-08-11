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

interface User {
  name: string
  age: number
}

interface Level3 {
  value: string
}

interface Level2 {
  level3: Level3
}

interface Level1 {
  level2: Level2
}

interface DeepData {
  level1: Level1
}

function getFulfilledValue<T>(result: PromiseSettledResult<T>): T {
  if (result instanceof PromiseFulfilledResult) {
    return result.value
  }
  throw new Error("Expected fulfilled Promise result")
}

class StringPromiseLike implements PromiseLike<string> {
  private promise: Promise<string>
  constructor(value: string) {
    this.promise = Promise.resolve<string>(value)
  }
  then<U = string, E = never>(onFulfilled: (value: string) => PromiseLike<U> | U, onRejected?: (error: Error) => PromiseLike<E> | E): PromiseLike<Awaited<U | E>> {
    return this.promise.then<U, E>(onFulfilled, onRejected)
  }
}

class NumberPromiseLike implements PromiseLike<number> {
  private promise: Promise<number>
  constructor(value: number) {
    this.promise = Promise.resolve<number>(value)
  }
  then<U = number, E = never>(onFulfilled: (value: number) => PromiseLike<U> | U, onRejected?: (error: Error) => PromiseLike<E> | E): PromiseLike<Awaited<U | E>> {
    return this.promise.then<U, E>(onFulfilled, onRejected)
  }
}

class CustomError extends Error {
  constructor(message: string) {
    super(message)
    this.name = "CustomError"
  }
}

class SimpleLock {
  locked: boolean = false
  async lockAsync(fn: () => void): Promise<number> {
    while (this.locked) {
      await new Promise<number>((resolve: (value: number) => void) => {
        setTimeout(() => resolve(1.0), 100)
      })
    }
    this.locked = true
    try {
      fn()
    } finally {
      this.locked = false
    }
    return 1.0
  }
}

export default function BuiltinsPromiseAllSettledFirstTest(): void {
  describe('BuiltinsPromiseAllSettledFirstTest', (): void => {
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
     * @tc.name   PromiseAllSettledFirstTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_0100
     * @tc.desc   Verify Promise.allSettled with Promise array all fulfilled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSettledFirstTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let p1 = Promise.resolve<number>(1.0)
      let p2 = Promise.resolve<number>(2.0)
      let p3 = Promise.resolve<number>(3.0)
      let promises: Promise<number>[] = [p1, p2, p3]

      let result = await Promise.allSettled<number>(promises)
      expect(result.length).assertEqual(3)
      expect(result[0].status).assertEqual("fulfilled")
      expect(getFulfilledValue<number>(result[0])).assertEqual(1.0)
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_0200
     * @tc.desc   Verify Promise.allSettled with PromiseLike array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<string> = new StringPromiseLike("hello")
      let promises: (PromiseLike<string> | Promise<string>)[] = [promiseLike, Promise.resolve<string>("world")]
      let result = await Promise.allSettled<string>(promises)
      expect(result.length).assertEqual(2)
      expect(result[0].status).assertEqual("fulfilled")
      expect(getFulfilledValue<string>(result[0])).assertEqual("hello")
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_0300
     * @tc.desc   Verify Promise.allSettled with mixed Promise and PromiseLike
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSettledFirstTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<number> = new NumberPromiseLike(100.0)
      let promises: (PromiseLike<number> | Promise<number>)[] = [promiseLike, Promise.resolve<number>(200.0)]
      let result = await Promise.allSettled<number>(promises)
      expect(result.length).assertEqual(2)
      expect(getFulfilledValue<number>(result[0])).assertEqual(100.0)
      expect(getFulfilledValue<number>(result[1])).assertEqual(200.0)
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_0400
     * @tc.desc   Verify Promise.allSettled with undefined values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<number | undefined>[] = [Promise.resolve<number | undefined>(1.0), Promise.resolve<number | undefined>(undefined), Promise.resolve<number | undefined>(3.0)]
      let result = await Promise.allSettled<number | undefined>(promises)
      expect(result.length).assertEqual(3)
      expect(result[1].status).assertEqual("fulfilled")
      expect(getFulfilledValue<number | undefined>(result[1])).assertEqual(undefined)
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_0500
     * @tc.desc   Verify Promise.allSettled with empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSettledFirstTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises: Promise<number>[] = []
      let result = await Promise.allSettled<number>(promises)
      expect(result.length).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_0600
     * @tc.desc   Verify Promise.allSettled with single element array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSettledFirstTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises: Promise<string>[] = [Promise.resolve("single")]
      let result = await Promise.allSettled<string>(promises)
      expect(result.length).assertEqual(1)
      expect(result[0].status).assertEqual("fulfilled")
      expect(getFulfilledValue<string>(result[0])).assertEqual("single")
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_0700
     * @tc.desc   Verify Promise.allSettled with large array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<number>[] = []
      for (let i = 0; i < 100; i++) {
        promises.push(Promise.resolve<number>(i * 1.0))
      }
      let result = await Promise.allSettled<number>(promises)
      expect(result.length).assertEqual(100)
      for (let i = 0; i < 100; i++) {
        expect(result[i].status).assertEqual("fulfilled")
        expect(getFulfilledValue<number>(result[i])).assertEqual(i * 1.0)
      }
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_0800
     * @tc.desc   Verify Promise.allSettled with mixed fulfilled and rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSettledFirstTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises: Promise<string>[] = [
        Promise.resolve("success1"),
        Promise.reject(new Error("fail")),
        Promise.resolve("success2")
      ]
      let result = await Promise.allSettled<string>(promises)
      expect(result.length).assertEqual(3)
      expect(result[0].status).assertEqual("fulfilled")
      expect(getFulfilledValue<string>(result[0])).assertEqual("success1")
      expect(result[1].status).assertEqual("rejected")
      expect(result[2].status).assertEqual("fulfilled")
      expect(getFulfilledValue<string>(result[2])).assertEqual("success2")
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_0900
     * @tc.desc   Verify Promise.allSettled with all rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<number>[] = [
        Promise.reject(new Error("error1")),
        Promise.reject(new Error("error2")),
        Promise.reject(new Error("error3"))
      ]
      let result = await Promise.allSettled<number>(promises)
      expect(result.length).assertEqual(3)
      expect(result[0].status).assertEqual("rejected")
      expect(result[1].status).assertEqual("rejected")
      expect(result[2].status).assertEqual("rejected")
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_1000
     * @tc.desc   Verify Promise.allSettled with fulfilled/rejected/undefined combination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<string | undefined>[] = [
        Promise.resolve<string | undefined>("ok"),
        Promise.reject<string | undefined>(new Error("error")),
        Promise.resolve<string | undefined>(undefined),
        Promise.resolve<string | undefined>("ok2")
      ]
      let result = await Promise.allSettled<string | undefined>(promises)
      expect(result.length).assertEqual(4)
      expect(result[0].status).assertEqual("fulfilled")
      expect(result[1].status).assertEqual("rejected")
      expect(result[2].status).assertEqual("fulfilled")
      expect(result[3].status).assertEqual("fulfilled")
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_1100
     * @tc.desc   Verify Promise.allSettled with string type U
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSettledFirstTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises: Promise<string>[] = [Promise.resolve("hello"), Promise.resolve("world")]
      let result = await Promise.allSettled<string>(promises)
      expect(getFulfilledValue<string>(result[0])).assertEqual("hello")
      expect(getFulfilledValue<string>(result[1])).assertEqual("world")
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_1200
     * @tc.desc   Verify Promise.allSettled with number type U
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSettledFirstTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises: Promise<number>[] = [Promise.resolve<number>(100.0), Promise.resolve<number>(200.0)]
      let result = await Promise.allSettled<number>(promises)
      expect(getFulfilledValue<number>(result[0])).assertEqual(100.0)
      expect(getFulfilledValue<number>(result[1])).assertEqual(200.0)
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_1300
     * @tc.desc   Verify Promise.allSettled with boolean type U
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<boolean>[] = [Promise.resolve(true), Promise.resolve(false)]
      let result = await Promise.allSettled<boolean>(promises)
      expect(getFulfilledValue<boolean>(result[0])).assertTrue()
      expect(getFulfilledValue<boolean>(result[1])).assertFalse()
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_1400
     * @tc.desc   Verify Promise.allSettled with object type U
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {

      let user1: User = { name: "Alice", age: 30 }
      let user2: User = { name: "Bob", age: 25 }
      let promises: Promise<User>[] = [
        Promise.resolve<User>(user1),
        Promise.resolve<User>(user2)
      ]
      let result = await Promise.allSettled<User>(promises)
      expect(getFulfilledValue<User>(result[0]).name).assertEqual("Alice")
      expect(getFulfilledValue<User>(result[1]).name).assertEqual("Bob")
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_1500
     * @tc.desc   Verify Promise.allSettled with array type U
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<number[]>[] = [Promise.resolve<number[]>([1.0, 2.0, 3.0]), Promise.resolve<number[]>([4.0, 5.0, 6.0])]
      let result = await Promise.allSettled<number[]>(promises)
      expect(getFulfilledValue<number[]>(result[0]).length).assertEqual(3)
      expect(getFulfilledValue<number[]>(result[1]).length).assertEqual(3)
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_1600
     * @tc.desc   Verify Promise.allSettled with union type U
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<string | number>[] = [
        Promise.resolve<string | number>("text"),
        Promise.resolve<string | number>(123.0),
        Promise.reject<string | number>(new Error("error"))
      ]
      let result = await Promise.allSettled<string | number>(promises)
      expect(result[0].status).assertEqual("fulfilled")
      expect(result[1].status).assertEqual("fulfilled")
      expect(result[2].status).assertEqual("rejected")
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_1700
     * @tc.desc   Verify Promise.allSettled with null type U
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<string | null>[] = [Promise.resolve("value"), Promise.resolve(null)]
      let result = await Promise.allSettled<string | null>(promises)
      expect(getFulfilledValue<string | null>(result[0])).assertEqual("value")
      expect(getFulfilledValue<string | null>(result[1])).assertNull()
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_1800
     * @tc.desc   Verify Promise.allSettled with void type U
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<void>[] = [Promise.resolve(undefined), Promise.resolve(undefined)]
      let result = await Promise.allSettled<void>(promises)
      expect(result.length).assertEqual(2)
      expect(result[0].status).assertEqual("fulfilled")
      expect(getFulfilledValue<void>(result[0])).assertEqual(undefined)
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_1900
     * @tc.desc   Verify Promise.allSettled with empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<string>[] = [Promise.resolve(""), Promise.resolve("normal")]
      let result = await Promise.allSettled<string>(promises)
      expect(getFulfilledValue<string>(result[0])).assertEqual("")
      expect(getFulfilledValue<string>(result[1])).assertEqual("normal")
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_2000
     * @tc.desc   Verify Promise.allSettled with zero and negative numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<number>[] = [Promise.resolve<number>(0.0), Promise.resolve<number>(-1.0), Promise.resolve<number>(1.0)]
      let result = await Promise.allSettled<number>(promises)
      expect(getFulfilledValue<number>(result[0])).assertEqual(0.0)
      expect(getFulfilledValue<number>(result[1])).assertEqual(-1.0)
      expect(getFulfilledValue<number>(result[2])).assertEqual(1.0)
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_2100
     * @tc.desc   Verify Promise.allSettled with Error as reject reason
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let customError = new Error("custom error message")
      let promises: Promise<string>[] = [Promise.reject(customError)]
      let result = await Promise.allSettled<string>(promises)
      expect(result[0].status).assertEqual("rejected")
      expect((result[0] as PromiseRejectedResult).reason).assertEqual(customError)
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_2200
     * @tc.desc   Verify Promise.allSettled with all fulfilled returns fulfilled array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSettledFirstTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises: Promise<number>[] = [Promise.resolve<number>(1.0), Promise.resolve<number>(2.0), Promise.resolve<number>(3.0)]
      let result = await Promise.allSettled<number>(promises)
      expect(result.length).assertEqual(3)
      expect(result.every(r => r.status === "fulfilled")).assertTrue()
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_2300
     * @tc.desc   Verify Promise.allSettled always succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSettledFirstTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises: Promise<number>[] = [
        Promise.reject(new Error("error1")),
        Promise.reject(new Error("error2"))
      ]
      let result = await Promise.allSettled<number>(promises)
      expect(result.length).assertEqual(2)
      expect(result.every(r => r.status === "rejected")).assertTrue()
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_2400
     * @tc.desc   Verify Promise.allSettled returns PromiseFulfilledResult instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<string>[] = [Promise.resolve("test")]
      let result = await Promise.allSettled<string>(promises)
      let settledResult = result[0]
      if (settledResult instanceof PromiseFulfilledResult) {
        expect(settledResult.status).assertEqual("fulfilled")
        expect(typeof settledResult.value).assertEqual("string")
        expect(settledResult.value).assertEqual("test")
      } else {
        expect().assertFail()
      }
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_2500
     * @tc.desc   Verify Promise.allSettled returns PromiseRejectedResult instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let reason = new Error("test error")
      let promises: Promise<string>[] = [Promise.reject(reason)]
      let result = await Promise.allSettled<string>(promises)
      let rejected = result[0] as PromiseRejectedResult
      expect(rejected.status).assertEqual("rejected")
      expect(rejected.reason).assertEqual(reason)
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_2600
     * @tc.desc   Verify Promise.allSettled maintains result order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<string>[] = [
        new Promise<string>((resolve) => { setTimeout(() => resolve("third"), 300) }),
        new Promise<string>((resolve) => { setTimeout(() => resolve("first"), 100) }),
        new Promise<string>((resolve) => { setTimeout(() => resolve("second"), 200) })
      ]
      let result = await Promise.allSettled<string>(promises)
      expect(getFulfilledValue<string>(result[0])).assertEqual("third")
      expect(getFulfilledValue<string>(result[1])).assertEqual("first")
      expect(getFulfilledValue<string>(result[2])).assertEqual("second")
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_2700
     * @tc.desc   Verify Promise.allSettled with very large array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<number>[] = []
      for (let i = 0; i < 100; i++) {
        promises.push(Promise.resolve<number>(i * 1.0))
      }
      let result = await Promise.allSettled<number>(promises)
      expect(result.length).assertEqual(100)

      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest2800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_2800
     * @tc.desc   Verify Promise.allSettled with Promise executor throwing error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<number>[] = [
        new Promise<number>(() => {
          throw new Error("internal error")
        })
      ]
      let result = await Promise.allSettled<number>(promises)
      expect(result[0].status).assertEqual("rejected")
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest2900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_2900
     * @tc.desc   Verify Promise.allSettled with reject function call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<string>[] = [
        new Promise<string>((_: (value: string) => void, reject: (reason: Error) => void) => {
          reject(new Error("reject called"))
        })
      ]
      let result = await Promise.allSettled<string>(promises)
      expect(result[0].status).assertEqual("rejected")
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest3000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_3000
     * @tc.desc   Verify Promise.allSettled with different error types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<number>[] = [
        Promise.reject<number>(new Error("standard error")),
        Promise.reject<number>(new CustomError("custom error")),
        Promise.reject<number>(new TypeError("type error"))
      ]
      let result = await Promise.allSettled<number>(promises)
      expect(result[0].status).assertEqual("rejected")
      expect(result[1].status).assertEqual("rejected")
      expect(result[2].status).assertEqual("rejected")
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest3100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_3100
     * @tc.desc   Verify Promise.allSettled with await in async function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSettledFirstTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let testAllSettled = async (): Promise<void> => {
        let promises: Promise<string>[] = [Promise.resolve<string>("a"), Promise.resolve<string>("b")]
        let result = await Promise.allSettled<string>(promises)
        expect(result.length).assertEqual(2)
      }
      await testAllSettled()
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest3200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_3200
     * @tc.desc   Verify Promise.allSettled returned from async function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let getAllSettledResult = async (): Promise<PromiseSettledResult<string>[]> => {
        let promises: Promise<string>[] = [Promise.resolve<string>("a"), Promise.reject<string>(new Error("b"))]
        return await Promise.allSettled<string>(promises)
      }
      let result = await getAllSettledResult()
      expect(result.length).assertEqual(2)
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest3300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_3300
     * @tc.desc   Verify Promise.allSettled with then chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<number>[] = [Promise.resolve<number>(1.0), Promise.resolve<number>(2.0)]
      await Promise.allSettled<number>(promises)
        .then((result) => {
          expect(result.length).assertEqual(2)
          return result.length
        })
        .then((length) => {
          expect(length).assertEqual(2)
          Done()
        })
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest3400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_3400
     * @tc.desc   Verify Promise.allSettled catch is never called
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<number>[] = [Promise.reject(new Error("error"))]
      let catchCalled = false
      await Promise.allSettled<number>(promises)
        .then((result) => {
          expect(result[0].status).assertEqual("rejected")
        })
        .catch(() => {
          catchCalled = true
        })
      expect(catchCalled).assertFalse()
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest3500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_3500
     * @tc.desc   Verify Promise.allSettled finally is always called
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<string>[] = [Promise.resolve("test")]
      let finallyCalled = false
      await Promise.allSettled<string>(promises)
        .finally(() => {
          finallyCalled = true
        })
      expect(finallyCalled).assertTrue()
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest3600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_3600
     * @tc.desc   Verify Promise.allSettled vs Promise.all behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<number>[] = [Promise.resolve<number>(1.0), Promise.reject<number>(new Error("error")), Promise.resolve<number>(3.0)]
      let allFailed = false
      try {
        await Promise.all<number>(promises)
      } catch (e) {
        allFailed = true
      }
      expect(allFailed).assertTrue()
      let allSettledResult = await Promise.allSettled<number>(promises)
      expect(allSettledResult.length).assertEqual(3)
      expect(allSettledResult[0].status).assertEqual("fulfilled")
      expect(allSettledResult[1].status).assertEqual("rejected")
      expect(allSettledResult[2].status).assertEqual("fulfilled")
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest3700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_3700
     * @tc.desc   Verify Promise.allSettled vs Promise.race behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<string>[] = [
        new Promise<string>((resolve) => { setTimeout(() => resolve("slow"), 200) }),
        new Promise<string>((resolve) => { setTimeout(() => resolve("fast"), 100) })
      ]
      let raceResult = await Promise.race<string>(promises)
      expect(raceResult).assertEqual("fast")
      let allSettledResult = await Promise.allSettled<string>([
        new Promise<string>((resolve) => { setTimeout(() => resolve("slow"), 200) }),
        new Promise<string>((resolve) => { setTimeout(() => resolve("fast"), 100) })
      ])
      expect(allSettledResult.length).assertEqual(2)
      expect(getFulfilledValue<string>(allSettledResult[0])).assertEqual("slow")
      expect(getFulfilledValue<string>(allSettledResult[1])).assertEqual("fast")
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest3800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_3800
     * @tc.desc   Verify Promise.allSettled with shared Promise array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let sharedPromise1 = Promise.resolve<number>(1.0)
      let sharedPromise2 = Promise.resolve<number>(2.0)
      let sharedPromises: Promise<number>[] = [sharedPromise1, sharedPromise2]
      let result1 = await Promise.allSettled<number>(sharedPromises)
      let result2 = await Promise.allSettled<number>(sharedPromises)
      expect(result1.length).assertEqual(2)
      expect(result2.length).assertEqual(2)
      expect(getFulfilledValue<number>(result1[0])).assertEqual(1.0)
      expect(getFulfilledValue<number>(result2[0])).assertEqual(1.0)
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest3900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_3900
     * @tc.desc   Verify nested async functions with Promise.allSettled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let level2 = async (): Promise<PromiseSettledResult<string>[]> => {
        let promises: Promise<string>[] = [Promise.resolve<string>("a"), Promise.resolve<string>("b")]
        return await Promise.allSettled<string>(promises)
      }
      let level1 = async (): Promise<PromiseSettledResult<string>[]> => {
        return await level2()
      }
      let result = await level1()
      expect(result.length).assertEqual(2)
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest4000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_4000
     * @tc.desc   Verify Promise.allSettled triggered by Timer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result = await new Promise<PromiseSettledResult<string>[]>((resolve: (value: PromiseSettledResult<string>[]) => void) => {
        setTimeout(() => {
        let promises: Promise<string>[] = [Promise.resolve<string>("a"), Promise.resolve<string>("b")]
        Promise.allSettled<string>(promises).then<void>((r: PromiseSettledResult<string>[]) => {
          resolve(r)
          return
        })
        }, 500)
      })
      expect(result.length).assertEqual(2)
      expect(result[0].status).assertEqual("fulfilled")
      expect(getFulfilledValue<string>(result[0])).assertEqual("a")
      expect(result[1].status).assertEqual("fulfilled")
      expect(getFulfilledValue<string>(result[1])).assertEqual("b")
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest4100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_4100
     * @tc.desc   Verify Promise.allSettled with Timer inside Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<string>[] = [
        new Promise<string>((resolve) => { setTimeout(() => resolve("delayed"), 500) }),
        Promise.resolve<string>("immediate")
      ]
      let result = await Promise.allSettled<string>(promises)
      expect(result.length).assertEqual(2)
      expect(getFulfilledValue<string>(result[0])).assertEqual("delayed")
      expect(getFulfilledValue<string>(result[1])).assertEqual("immediate")
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest4200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_4200
     * @tc.desc   Verify Promise.allSettled chained with other methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<number>[] = [Promise.resolve<number>(1.0), Promise.reject<number>(new Error("error")), Promise.resolve<number>(3.0)]
      let result = await Promise.allSettled<number>(promises)
        .then<PromiseSettledResult<number>[]>((results: PromiseSettledResult<number>[]) => {
          expect(results.length).assertEqual(3)
          expect(results[0].status).assertEqual("fulfilled")
          expect(results[1].status).assertEqual("rejected")
          expect(results[2].status).assertEqual("fulfilled")
          return results.filter((r: PromiseSettledResult<number>) => r.status === "fulfilled")
        })
        .then<number[]>((fulfilledResults: PromiseSettledResult<number>[]) => {
          expect(fulfilledResults.length).assertEqual(2)
          expect(fulfilledResults[0].status).assertEqual("fulfilled")
          expect(fulfilledResults[1].status).assertEqual("fulfilled")
          return fulfilledResults.map((r: PromiseSettledResult<number>) => getFulfilledValue<number>(r))
        })
      expect(result.length).assertEqual(2)
      expect(result[0]).assertEqual(1.0)
      expect(result[1]).assertEqual(3.0)
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest4300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_4300
     * @tc.desc   Verify multiple Promise.allSettled sequential execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let executionOrder: number[] = []
      await Promise.allSettled<number>([Promise.resolve<number>(1.0)])
      executionOrder.push(1.0)
      await Promise.allSettled<number>([Promise.resolve<number>(2.0)])
      executionOrder.push(2.0)
      await Promise.allSettled<number>([Promise.resolve<number>(3.0)])
      executionOrder.push(3.0)
      expect(executionOrder).assertDeepEquals([1.0, 2.0, 3.0])
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest4400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_4400
     * @tc.desc   Verify multiple Promise.allSettled concurrent execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises1: Promise<string>[] = [Promise.resolve<string>("a1"), Promise.resolve<string>("a2")]
      let promises2: Promise<string>[] = [Promise.resolve<string>("b1"), Promise.resolve<string>("b2")]
      let result1 = await Promise.allSettled<string>(promises1)
      let result2 = await Promise.allSettled<string>(promises2)
      expect(result1.length).assertEqual(2)
      expect(result2.length).assertEqual(2)
      expect(getFulfilledValue<string>(result1[0])).assertEqual("a1")
      expect(getFulfilledValue<string>(result2[0])).assertEqual("b1")
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest4500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_4500
     * @tc.desc   Verify Promise.allSettled waits for all Promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<string>[] = [
        new Promise<string>((resolve) => { setTimeout(() => resolve("slow"), 1000) }),
        Promise.resolve<string>("fast")
      ]
      let result = await Promise.allSettled<string>(promises)

      expect(result.length).assertEqual(2)
      expect(getFulfilledValue<string>(result[1])).assertEqual("fast")
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest4600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_4600
     * @tc.desc   Verify Promise.allSettled with event-driven execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let eventTriggered = false
      let results: PromiseSettledResult<string>[] = []
      let onEventTrigger = async (): Promise<void> => {
        eventTriggered = true
        let promises: Promise<string>[] = [Promise.resolve<string>("event1"), Promise.resolve<string>("event2")]
        results = await Promise.allSettled<string>(promises)
      }
      await new Promise<void>((resolve: (value: void) => void) => {
        setTimeout(() => {
          onEventTrigger().then<void>(() => resolve(undefined))
        }, 500)
      })
      expect(eventTriggered).assertTrue()
      expect(results.length).assertEqual(2)
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest4700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_4700
     * @tc.desc   Verify Promise.allSettled natural waiting behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<string>[] = [
        Promise.resolve("success1"),
        Promise.reject(new Error("error")),
        Promise.resolve("success2")
      ]
      let result = await Promise.allSettled<string>(promises)
      expect(result.length).assertEqual(3)
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest4800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_4800
     * @tc.desc   Verify Promise.allSettled with concurrent counting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = 0;
      let totalCount = 5;
      let promises: Promise<number>[] = [];
      for (let i = 0; i < totalCount; i++) {
        if (i % 2 === 0) {
          promises.push(Promise.resolve<number>(i * 1.0));
        } else {
          promises.push(Promise.reject<number>(new Error(`error${i}`)));
        }
      }
      let result = await Promise.allSettled<number>(promises);
      let fulfilledCount = result.filter(r => r.status === "fulfilled").length;
      expect(fulfilledCount).assertEqual(3);
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest4900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_4900
     * @tc.desc   Verify Promise.allSettled preserves a rejected Error object by identity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let reason = new Error("This is a detailed error message with many details")
      let promises: Promise<string>[] = [
        Promise.reject(reason)
      ]
      let result = await Promise.allSettled<string>(promises)
      expect(result[0].status).assertEqual("rejected")
      let rejected = result[0] as PromiseRejectedResult
      expect(rejected.reason).assertEqual(reason)
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest5000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_5000
     * @tc.desc   Verify Promise.allSettled with deterministic Timer intervals of 100ms
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<string>[] = [
        new Promise<string>((resolve: (value: string) => void) => {
          setTimeout(() => resolve("first"), 100)
        }),
        new Promise<string>((resolve: (value: string) => void) => {
          setTimeout(() => resolve("second"), 100)
        })
      ]
      let result = await Promise.allSettled<string>(promises)
      expect(result.length).assertEqual(2)
      expect(result[0].status).assertEqual("fulfilled")
      expect(result[1].status).assertEqual("fulfilled")
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest5100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_5100
     * @tc.desc   Verify multiple Promise.allSettled with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises1: Promise<number>[] = [Promise.resolve<number>(1.0)]
      let promises2: Promise<number>[] = [Promise.resolve<number>(2.0)]
      let promises3: Promise<number>[] = [Promise.resolve<number>(3.0)]
      let result1 = await Promise.allSettled<number>(promises1)
      let result2 = await Promise.allSettled<number>(promises2)
      let result3 = await Promise.allSettled<number>(promises3)
      expect(result1.length).assertEqual(1)
      expect(result2.length).assertEqual(1)
      expect(result3.length).assertEqual(1)
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest5200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_5200
     * @tc.desc   Verify Promise.allSettled with nested async functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let fetchAllSettled1 = async (): Promise<PromiseSettledResult<string>[]> => {
        let promises: Promise<string>[] = [Promise.resolve<string>("level1")]
        return await Promise.allSettled<string>(promises)
      }
      let fetchAllSettled2 = async (): Promise<PromiseSettledResult<string>[]> => {
        let result1 = await fetchAllSettled1()
        let promises: Promise<string>[] = [Promise.resolve<string>("level2")]
        let result2 = await Promise.allSettled<string>(promises)
        return result1.concat(result2)
      }
      let finalResult = await fetchAllSettled2()
      expect(finalResult.length).assertEqual(2)
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest5300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_5300
     * @tc.desc   Verify Promise.allSettled with multiple Timer branches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let branch1 = new Promise<PromiseSettledResult<string>[]>((resolve: (value: PromiseSettledResult<string>[]) => void) => {
        setTimeout(() => {
          let promises: Promise<string>[] = [Promise.resolve<string>("timer1")]
          Promise.allSettled<string>(promises).then<void>((r: PromiseSettledResult<string>[]) => resolve(r))
        }, 100)
      })
      let branch2 = new Promise<PromiseSettledResult<string>[]>((resolve: (value: PromiseSettledResult<string>[]) => void) => {
        setTimeout(() => {
          let promises: Promise<string>[] = [Promise.resolve<string>("timer2")]
          Promise.allSettled<string>(promises).then<void>((r: PromiseSettledResult<string>[]) => resolve(r))
        }, 200)
      })
      let branchResults = await Promise.all<PromiseSettledResult<string>[]>([branch1, branch2])
      let result1 = branchResults[0]
      let result2 = branchResults[1]
      expect(result1.length).assertEqual(1)
      expect(result2.length).assertEqual(1)
      expect(result1[0].status).assertEqual("fulfilled")
      expect(getFulfilledValue<string>(result1[0])).assertEqual("timer1")
      expect(result2[0].status).assertEqual("fulfilled")
      expect(getFulfilledValue<string>(result2[0])).assertEqual("timer2")
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest5400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_5400
     * @tc.desc   Verify Promise.allSettled with Promise.then callback nesting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let outerResult = await Promise.resolve<string>("outer")
      let promises: Promise<string>[] = [
        Promise.resolve<string>("success"),
        Promise.reject<string>(new Error("inner-error"))
      ]
      let result = await Promise.allSettled<string>(promises)
      expect(result.length).assertEqual(2)
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest5500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_5500
     * @tc.desc   Verify Promise.allSettled with small concurrency count 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = 0
      let promises: Promise<number>[] = [
        Promise.resolve<number>(1.0).then<number>(() => { counter++; return 1.0 }),
        Promise.resolve<number>(1.0).then<number>(() => { counter++; return 1.0 }),
        Promise.resolve<number>(1.0).then<number>(() => { counter++; return 1.0 })
      ]

      await Promise.allSettled<number>(promises)
      expect(counter).assertEqual(3)
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest5600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_5600
     * @tc.desc   Verify Promise.allSettled with small concurrency count 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = 0
      let promises: Promise<number>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(Promise.resolve<number>(1.0).then<number>(() => { counter++; return 1.0 }))
      }

      await Promise.allSettled<number>(promises)
      expect(counter).assertEqual(5)
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest5700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_5700
     * @tc.desc   Verify Promise.allSettled with small concurrency count 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = 0
      let promises: Promise<number>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(Promise.resolve<number>(1.0).then<number>(() => { counter++; return 1.0 }))
      }

      await Promise.allSettled<number>(promises)
      expect(counter).assertEqual(10)
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest5800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_5800
     * @tc.desc   Verify Promise.all processes operations protected by an async lock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let lock = new SimpleLock()
      let fulfilled = 0
      let rejected = 0
      let promises: Promise<number>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(i % 2 === 0 ?
          lock.lockAsync(() => { fulfilled++; return }) :
          lock.lockAsync(() => { rejected++; return })
        )
      }
      await Promise.all(promises)
      expect(fulfilled).assertEqual(5)
      expect(rejected).assertEqual(5)
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest5900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_5900
     * @tc.desc   Verify Promise.allSettled with concurrent map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let map: Map<string, PromiseSettledResult<number>> = new Map<string, PromiseSettledResult<number>>();
      let promises: Promise<number>[] = [
        Promise.resolve<number>(1.0),
        Promise.reject<number>(new Error("error")),
        Promise.resolve<number>(3.0)
      ];
      let results = await Promise.allSettled<number>(promises);
      for (let i = 0; i < results.length; i++) {
        map.set(`result${i}`, results[i]);
      }
      expect(map.size).assertEqual(3);
      expect(map.get("result0")?.status).assertEqual("fulfilled");
      Done();
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest6000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_6000
     * @tc.desc   Verify Promise.allSettled with concurrent set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set = new Set<PromiseSettledResult<string>>()
      let promises: Promise<string>[] = [Promise.resolve<string>("a"), Promise.reject<string>(new Error("error"))]
      let results = await Promise.allSettled<string>(promises)
      for (let i = 0; i < results.length; i++) {
        set.add(results[i])
      }
      expect(set.size).assertEqual(2)
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest6100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_6100
     * @tc.desc   Verify Promise.allSettled with mixed boolean values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<boolean>[] = [Promise.resolve(false), Promise.resolve(true)]
      let result = await Promise.allSettled<boolean>(promises)
      expect(getFulfilledValue<boolean>(result[0])).assertFalse()
      expect(getFulfilledValue<boolean>(result[1])).assertTrue()
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest6200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_6200
     * @tc.desc   Verify Promise.allSettled with deep object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {

      let deepData: DeepData = {
        level1: {
          level2: {
            level3: {
              value: "deep"
            }
          }
        }
      }
      let promises: Promise<DeepData>[] = [Promise.resolve<DeepData>(deepData)]
      let result = await Promise.allSettled<DeepData>(promises)
      expect(getFulfilledValue<DeepData>(result[0]).level1.level2.level3.value).assertEqual("deep")
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest6300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_6300
     * @tc.desc   Verify Promise.allSettled waits for a delayed Promise to fulfill
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let executed = false
      let promises: Promise<string>[] = [
        new Promise<string>((resolve: (value: string) => void) => {
          setTimeout(() => {
            executed = true
            resolve("done")
            return
          }, 100)
        })
      ]
      let allSettledPromise = Promise.allSettled<string>(promises)
      let result = await allSettledPromise
      expect(executed).assertTrue()
      expect(result.length).assertEqual(1)
      expect(result[0].status).assertEqual("fulfilled")
      expect(getFulfilledValue<string>(result[0])).assertEqual("done")
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest6400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_6400
     * @tc.desc   Verify Promise.allSettled with Promise resolve triggering events
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let events: string[] = []
      let promises: Promise<string>[] = [
        new Promise<string>((resolve: (value: string) => void) => {
          resolve("data1")
          events.push("resolved1")
        }),
        new Promise<string>((resolve: (value: string) => void) => {
          resolve("data2")
          events.push("resolved2")
        })
      ]
      let result = await Promise.allSettled<string>(promises)
      expect(events.length).assertEqual(2)
      expect(events.includes("resolved1")).assertTrue()
      expect(events.includes("resolved2")).assertTrue()
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest6500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_6500
     * @tc.desc   Verify Promise.allSettled with undefined elements in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<number | undefined>[] = [Promise.resolve<number | undefined>(undefined), Promise.resolve<number | undefined>(undefined)]
      let result = await Promise.allSettled<number | undefined>(promises)
      expect(result.length).assertEqual(2)
      expect(result[0].status).assertEqual("fulfilled")
      expect(result[1].status).assertEqual("fulfilled")
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest6600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_6600
     * @tc.desc   Verify awaiting Promise.allSettled returns the exact single fulfilled result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<string>[] = [Promise.resolve("test")]
      let result = Promise.allSettled<string>(promises)
      let allResult = await result
      expect(allResult.length).assertEqual(1)
      expect(allResult[0].status).assertEqual("fulfilled")
      expect(getFulfilledValue<string>(allResult[0])).assertEqual("test")
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest6700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_6700
     * @tc.desc   Verify Promise.allSettled preserves two fulfilled string values in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<string>[] = [Promise.resolve("a"), Promise.resolve("b")]
      let result = await Promise.allSettled<string>(promises)
      expect(result.length).assertEqual(2)
      expect(result[0].status).assertEqual("fulfilled")
      expect(getFulfilledValue<string>(result[0])).assertEqual("a")
      expect(result[1].status).assertEqual("fulfilled")
      expect(getFulfilledValue<string>(result[1])).assertEqual("b")
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest6800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_6800
     * @tc.desc   Verify Promise.allSettled with PromiseLike unwrapping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: PromiseLike<number>[] = [new NumberPromiseLike(42.0)]
      let result = await Promise.allSettled<number>(promises)
      expect(result[0].status).assertEqual("fulfilled")
      expect(getFulfilledValue<number>(result[0])).assertEqual(42.0)
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest6900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_6900
     * @tc.desc   Verify Promise.allSettled with shared Promise references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let sharedPromise = Promise.resolve<number>(100.0)
      let promises: Promise<number>[] = [sharedPromise, sharedPromise]
      let result = await Promise.allSettled<number>(promises)
      expect(result.length).assertEqual(2)
      expect(getFulfilledValue<number>(result[0])).assertEqual(100.0)
      expect(getFulfilledValue<number>(result[1])).assertEqual(100.0)
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest7000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_7000
     * @tc.desc   Verify Promise.allSettled with mixed success and failure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSettledFirstTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises: Promise<string>[] = [Promise.resolve("ok"), Promise.reject(new Error("fail")), Promise.resolve("ok2")]
      let result = await Promise.allSettled<string>(promises)
      expect(result.length).assertEqual(3)
      expect(result[0].status).assertEqual("fulfilled")
      expect(result[1].status).assertEqual("rejected")
      expect(result[2].status).assertEqual("fulfilled")
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest7100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_7100
     * @tc.desc   Verify Promise.allSettled with single rejected Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<string>[] = [Promise.reject(new Error("single error"))]
      let result = await Promise.allSettled<string>(promises)
      expect(result.length).assertEqual(1)
      expect(result[0].status).assertEqual("rejected")
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest7200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_7200
     * @tc.desc   Verify Promise.allSettled with async/await correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSettledFirstTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises: Promise<string>[] = [Promise.resolve("a"), Promise.resolve("b")]
      let result = await Promise.allSettled<string>(promises)
      expect(result.length).assertEqual(2)
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest7300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_7300
     * @tc.desc   Verify Promise.allSettled with try-catch pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<string>[] = [Promise.reject(new Error("test"))]
      try {
        let result = await Promise.allSettled<string>(promises)
        expect(result[0].status).assertEqual("rejected")
      } catch (error) {
        expect().assertFail()
      }
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest7400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_7400
     * @tc.desc   Verify Promise.allSettled with nested Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let innerPromises: Promise<number>[] = [Promise.resolve<number>(1.0), Promise.resolve<number>(2.0)]
      let outerPromises: Promise<number[]>[] = [Promise.all<number>(innerPromises)]
      let result = await Promise.allSettled<number[]>(outerPromises)
      expect(result.length).assertEqual(1)
      expect(result[0].status).assertEqual("fulfilled")
      expect(getFulfilledValue<number[]>(result[0])).assertDeepEquals([1.0, 2.0])
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest7500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_7500
     * @tc.desc   Verify Promise.allSettled with large number of elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<number>[] = []
      for (let i = 0; i < 100; i++) {
        promises.push(Promise.resolve<number>(i * 1.0))
      }
      let result = await Promise.allSettled<number>(promises)
      expect(result.length).assertEqual(100)
      expect(result[0].status).assertEqual("fulfilled")
      expect(result[99].status).assertEqual("fulfilled")
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest7600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_7600
     * @tc.desc   Verify Promise.allSettled with mixed resolved values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<number | null>[] = [Promise.resolve<number | null>(1.0), Promise.resolve<number | null>(null), Promise.resolve<number | null>(3.0)]
      let result = await Promise.allSettled<number | null>(promises)
      expect(getFulfilledValue<number | null>(result[0])).assertEqual(1.0)
      expect(getFulfilledValue<number | null>(result[1])).assertNull()
      expect(getFulfilledValue<number | null>(result[2])).assertEqual(3.0)
      Done()
    })

    /**
     * @tc.name   PromiseAllSettledFirstTest7700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SETTLED_FIRST_TEST_7700
     * @tc.desc   Verify Promise.allSettled with rejected promises only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledFirstTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<number>[] = [
        Promise.reject(new Error("error1")),
        Promise.reject(new Error("error2")),
        Promise.reject(new Error("error3"))
      ]
      let result = await Promise.allSettled<number>(promises)
      expect(result.length).assertEqual(3)
      expect(result.every(r => r.status === "rejected")).assertTrue()
      Done()
    })

  })
}
