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

interface User {
  name: string
  age: number
}

interface NestedData {
  user: User
  items: string[]
}

class SyncStringPromiseLike implements PromiseLike<string> {
  value: string
  constructor(value: string) {
    this.value = value
  }
  then<U, E>(onFulfilled?: (value: string) => U | PromiseLike<U>, onRejected?: (error: Error) => E | PromiseLike<E>): PromiseLike<Awaited<U> | Awaited<E>> {
    if (onFulfilled) {
      const result = onFulfilled(this.value)
      return result as PromiseLike<Awaited<U> | Awaited<E>>
    }
    return this as PromiseLike<Awaited<U> | Awaited<E>>
  }
}

class ErrorStringPromiseLike implements PromiseLike<string> {
  error: Error
  constructor(error: Error) {
    this.error = error
  }
  then<U, E>(onFulfilled?: (value: string) => U | PromiseLike<U>, onRejected?: (error: Error) => E | PromiseLike<E>): PromiseLike<Awaited<U> | Awaited<E>> {
    if (onRejected) {
      const result = onRejected(this.error)
      return result as PromiseLike<Awaited<U> | Awaited<E>>
    }
    return this as PromiseLike<Awaited<U> | Awaited<E>>
  }
}

class SyncNumberPromiseLike implements PromiseLike<number> {
  value: number
  constructor(value: number) {
    this.value = value
  }
  then<U, E>(onFulfilled?: (value: number) => U | PromiseLike<U>, onRejected?: (error: Error) => E | PromiseLike<E>): PromiseLike<Awaited<U> | Awaited<E>> {
    if (onFulfilled) {
      const result = onFulfilled(this.value)
      return result as PromiseLike<Awaited<U> | Awaited<E>>
    }
    return this as PromiseLike<Awaited<U> | Awaited<E>>
  }
}

export default function BuiltinsPromiseRaceFirstTest(): void {
  describe('BuiltinsPromiseRaceFirstTest', (): void => {
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
     * @tc.name   PromiseRaceFirstTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_0100
     * @tc.desc   Verify Promise.race with single resolved Promise returns value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceFirstTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result = await Promise.race<string>([Promise.resolve("value")])
      expect(result).assertEqual("value")
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_0200
     * @tc.desc   Verify Promise.race ignores extra arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceFirstTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result = await Promise.race<string>([Promise.resolve("value"), Promise.resolve("extra1"), Promise.resolve("extra2")])
      expect(result).assertEqual("value")
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_0300
     * @tc.desc   Verify Promise.race with number array returns first element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceFirstTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result1 = await Promise.race<number>([1, 2, 3])
      expect(result1).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_0400
     * @tc.desc   Verify Promise.race with string array returns first element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceFirstTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result2 = await Promise.race<string>(["first", "second"])
      expect(result2).assertEqual("first")
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_0500
     * @tc.desc   Verify Promise.race with boolean array returns first element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceFirstTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result3 = await Promise.race<boolean>([true, false])
      expect(result3).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_0600
     * @tc.desc   Verify Promise.race with multiple resolved Promises returns first
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceFirstTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result1 = await Promise.race<string>([
        Promise.resolve("first"),
        Promise.resolve("second")
      ])
      expect(result1).assertEqual("first")
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_0700
     * @tc.desc   Verify Promise.race with delayed Promises, fastest resolves first
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceFirstTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result2 = await Promise.race<string>([
        new Promise<string>(resolve => { setTimeout(() => resolve("fast"), 100) }),
        new Promise<string>(resolve => { setTimeout(() => resolve("slow"), 200) })
      ])
      expect(result2).assertEqual("fast")
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_0800
     * @tc.desc   Verify Promise.race with PromiseLike resolves correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceFirstTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike = new SyncStringPromiseLike("promiseLike value")
      let result = await Promise.race<string>([promiseLike])
      expect(result).assertEqual("promiseLike value")
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_0900
     * @tc.desc   Verify Promise.race with multiple PromiseLikes, first resolves
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceFirstTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike1 = new SyncNumberPromiseLike(1)
      let promiseLike2 = new SyncNumberPromiseLike(2)
      let result = await Promise.race<number>([promiseLike1, promiseLike2])
      expect(result).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_1000
     * @tc.desc   Verify Promise.race with undefined mixed in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceFirstTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result1 = await Promise.race<number|undefined>([1, undefined, 3])
      expect(result1).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_1100
     * @tc.desc   Verify Promise.race with all undefined values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceFirstTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result2 = await Promise.race<undefined>([undefined, undefined])
      expect(result2).assertEqual(undefined)
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_1200
     * @tc.desc   Verify Promise.race with undefined before resolved Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceFirstTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result3 = await Promise.race<string|undefined>([undefined, Promise.resolve("value")])
      expect(result3).assertEqual(undefined)
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_1300
     * @tc.desc   Verify Promise.race with mixed direct values, Promise, and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceFirstTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result = await Promise.race<string|undefined>([
        "direct",
        Promise.resolve("promise"),
        undefined,
        new Promise<string>(resolve => { setTimeout(() => resolve("delayed"), 200) })
      ])
      expect(result).assertEqual("direct")
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_1400
     * @tc.desc   Verify Promise.race with empty array never resolves within timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceFirstTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let emptyRace = Promise.race<never>([])
      let timeoutPromise = new Promise<string>((_, reject) => {
        setTimeout(() => reject(new Error("timeout")), 500)
      })
      let caught: boolean = false
      try {
        await Promise.race<string>([emptyRace as Promise<string>, timeoutPromise])
        expect().assertFail()
      } catch (error) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_1500
     * @tc.desc   Verify Promise.race with single number value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceFirstTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result1 = await Promise.race<number>([42])
      expect(result1).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_1600
     * @tc.desc   Verify Promise.race with single resolved Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceFirstTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result2 = await Promise.race<string>([Promise.resolve("single")])
      expect(result2).assertEqual("single")
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_1700
     * @tc.desc   Verify Promise.race with single rejected Promise throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceFirstTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let caught: boolean = false
      try {
        await Promise.race<string>([Promise.reject(new Error("single error"))])
        expect().assertFail()
      } catch (error) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_1800
     * @tc.desc   Verify Promise.race with single undefined value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceFirstTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result4 = await Promise.race<undefined>([undefined])
      expect(result4).assertEqual(undefined)
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_1900
     * @tc.desc   Verify Promise.race with large number of Promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceFirstTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<number>[] = []
      for (let i = 0; i < 100; i++) {
        promises.push(Promise.resolve<number>(i))
      }
      let result = await Promise.race<number>(promises)
      expect(result).assertEqual(0)
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_2000
     * @tc.desc   Verify Promise.race with null iterable throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceFirstTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let caught: boolean = false
      try {
        await Promise.race<string>(null as Object as PromiseLike<string>[])
        expect().assertFail()
      } catch (error) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_2100
     * @tc.desc   Verify Promise.race with non-array iterable throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceFirstTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let caught: boolean = false
      try {
        await Promise.race<string>("not an array" as Object as PromiseLike<string>[])
        expect().assertFail()
      } catch (error) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_2200
     * @tc.desc   Verify Promise.race with mixed number and Promise returns number type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceFirstTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result1 = await Promise.race<number>([1.0, 2.0, Promise.resolve(3.0)])
      expect(typeof result1 === "number").assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_2300
     * @tc.desc   Verify Promise.race with mixed string and Promise returns string type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceFirstTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result2 = await Promise.race<string>(["a", Promise.resolve("b")])
      expect(typeof result2 === "string").assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_2400
     * @tc.desc   Verify Promise.race with union type string|number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceFirstTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result6 = await Promise.race<string|number>([Promise.resolve("str"), 123])
      expect(result6).assertEqual("str")
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_2500
     * @tc.desc   Verify Promise.race with three delayed Promises, fastest wins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceFirstTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result = await Promise.race<string>([
        new Promise<string>(resolve => { setTimeout(() => resolve("first"), 100) }),
        new Promise<string>(resolve => { setTimeout(() => resolve("second"), 200) }),
        new Promise<string>(resolve => { setTimeout(() => resolve("third"), 300) })
      ])
      expect(result).assertEqual("first")
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_2600
     * @tc.desc   Verify Promise.race with resolved vs delayed Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceFirstTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result2 = await Promise.race<number>([
        Promise.resolve(1.0),
        new Promise<number>(resolve => { setTimeout(() => resolve(2.0), 100) })
      ])
      expect(result2).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_2700
     * @tc.desc   Verify Promise.race with delayed reject before resolve
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceFirstTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let caught: boolean = false
      try {
        await Promise.race<string>([
          new Promise<string>((_, reject) => { setTimeout(() => reject(new Error("error1")), 100) }),
          new Promise<string>(resolve => { setTimeout(() => resolve("success"), 200) })
        ])
        expect().assertFail()
      } catch (error) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest2800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_2800
     * @tc.desc   Verify Promise.race with immediate reject before delayed resolve
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceFirstTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let caught: boolean = false
      try {
        await Promise.race<number>([
          Promise.reject(new Error("immediate error")),
          new Promise<number>(resolve => { setTimeout(() => resolve(42), 100) })
        ])
        expect().assertFail()
      } catch (error) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest2900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_2900
     * @tc.desc   Verify Promise.race with resolved before rejected returns value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceFirstTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result1 = await Promise.race<string>([
        Promise.resolve("resolved"),
        Promise.reject(new Error("rejected"))
      ])
      expect(result1).assertEqual("resolved")
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest3000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_3000
     * @tc.desc   Verify Promise.race with undefined values from resolved Promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceFirstTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result1 = await Promise.race<undefined>([
        Promise.resolve(undefined),
        Promise.resolve(undefined)
      ])
      expect(result1).assertEqual(undefined)
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest3100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_3100
     * @tc.desc   Verify Promise.race with falsy number 0 returns first
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceFirstTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result1 = await Promise.race<number>([0, 1, 2])
      expect(result1).assertEqual(0)
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest3200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_3200
     * @tc.desc   Verify Promise.race with falsy boolean false returns first
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceFirstTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result2 = await Promise.race<boolean>([false, true])
      expect(result2).assertFalse()
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest3300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_3300
     * @tc.desc   Verify Promise.race with empty string returns first
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceFirstTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result3 = await Promise.race<string>(["", "value"])
      expect(result3).assertEqual("")
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest3400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_3400
     * @tc.desc   Verify Promise.race with NaN returns first
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceFirstTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result4 = await Promise.race<number>([NaN, 1])
      expect(Number.isNaN(result4)).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest3500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_3500
     * @tc.desc   Verify Promise.race returns Promise instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceFirstTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let racePromise = Promise.race<string>([Promise.resolve("value")])
      let result = await racePromise
      expect(result).assertEqual("value")
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest3600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_3600
     * @tc.desc   Verify Promise.race with nested Promise unwraps correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceFirstTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let nestedPromise = Promise.resolve(Promise.resolve("nested"))
      let result = await Promise.race<string>([nestedPromise])
      expect(result).assertEqual("nested")
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest3700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_3700
     * @tc.desc   Verify Promise.race with User interface object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceFirstTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let user: User = { name: "test", age: 25 }
      let result = await Promise.race<User>([Promise.resolve(user)])
      expect(result.age).assertEqual(25)
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest3800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_3800
     * @tc.desc   Verify Promise.race with array type result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceFirstTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let arr: number[] = [1, 2, 3]
      let result2 = await Promise.race<number[]>([Promise.resolve(arr)])
      expect(result2.length).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest3900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_3900
     * @tc.desc   Verify Promise.race with nested data structure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceFirstTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let nested: NestedData = {
        user: { name: "test", age: 25 },
        items: ["a", "b", "c"]
      }
      let result3 = await Promise.race<NestedData>([Promise.resolve(nested)])
      expect(result3.items.length).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest4000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_4000
     * @tc.desc   Verify Promise.race with Number.MAX_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceFirstTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result1 = await Promise.race<number>([Promise.resolve(Number.MAX_VALUE)])
      expect(result1).assertEqual(Number.MAX_VALUE)
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest4100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_4100
     * @tc.desc   Verify Promise.race with Number.MIN_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceFirstTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result2 = await Promise.race<number>([Promise.resolve(Number.MIN_VALUE)])
      expect(result2).assertEqual(Number.MIN_VALUE)
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest4200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_4200
     * @tc.desc   Verify Promise.race with Infinity value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceFirstTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result4 = await Promise.race<number>([Promise.resolve(Infinity)])
      expect(result4).assertEqual(Infinity)
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest4300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_4300
     * @tc.desc   Verify Promise.race with -Infinity value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceFirstTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result5 = await Promise.race<number>([Promise.resolve(-Infinity)])
      expect(result5).assertEqual(-Infinity)
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest4400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_4400
     * @tc.desc   Verify Promise.race with long string value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceFirstTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let longString = "a".repeat(10000)
      let result = await Promise.race<string>([Promise.resolve(longString)])
      expect(result.length).assertEqual(10000)
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest4500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_4500
     * @tc.desc   Verify Promise.race with reject before resolve, Error instance check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceFirstTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let caught: boolean = false
      try {
        await Promise.race<string>([
          Promise.reject(new Error("standard error")),
          Promise.resolve("success")
        ])
        expect().assertFail()
      } catch (error) {
        caught = true
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest4600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_4600
     * @tc.desc   Verify Promise.race with CustomError rejection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceFirstTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let caught: boolean = false
      try {
        await Promise.race<string>([
          Promise.reject(new CustomError("custom error")),
          new Promise<string>(resolve => { setTimeout(() => resolve("delayed"), 200) })
        ])
        expect().assertFail()
      } catch (error) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest4700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_4700
     * @tc.desc   Verify Promise.race with non-Error reject reason
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('PromiseRaceFirstTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let caught: boolean = false
      try {
        await Promise.race<string>([
          Promise.reject(new Error("error string")),
          new Promise<string>(resolve => { setTimeout(() => resolve("delayed"), 200) })
        ])
        expect().assertFail()
      } catch (error) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest4800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_4800
     * @tc.desc   Verify Promise.race with reject and resolve, catch error message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceFirstTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let caught: boolean = false
      try {
        let result = await Promise.race<string>([
          Promise.reject(new Error("error")),
          Promise.resolve("success")
        ])
        expect().assertFail()
      } catch (error) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest4900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_4900
     * @tc.desc   Verify Promise.race with try-catch-finally, finally executes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceFirstTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let finallyExecuted = false
      let caught: boolean = false
      try {
        await Promise.race<string>([
          Promise.reject(new Error("error")),
          Promise.resolve("success")
        ])
      } catch (error) {
      caught = true
} finally {
      expect(caught).assertTrue()
        finallyExecuted = true
      }
      expect(finallyExecuted).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest5000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_5000
     * @tc.desc   Verify Promise.race with instanceof Error check in catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceFirstTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let caught: boolean = false
      try {
        await Promise.race<string>([
          Promise.reject(new Error("test error")),
          Promise.resolve("success")
        ])
        expect().assertFail()
      } catch (error) {
        caught = true
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest5100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_5100
     * @tc.desc   Verify Promise.race with then chain transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceFirstTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result = await Promise.race<number>([Promise.resolve(1.0), Promise.resolve(2.0)])
        .then(value => value * 2)
        .then(value => value + 10)
      expect(result).assertEqual(12)
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest5200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_5200
     * @tc.desc   Verify Promise.race with then returning Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceFirstTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result2 = await Promise.race<string>([Promise.resolve("hello")])
        .then(value => Promise.resolve(value.toUpperCase()))
      expect(result2).assertEqual("HELLO")
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest5300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_5300
     * @tc.desc   Verify Promise.race with catch recovery
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceFirstTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result = await Promise.race<string>([
        Promise.reject(new Error("race error"))
      ]).catch((error) => {
        return "recovered"
      })
      expect(result).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest5400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_5400
     * @tc.desc   Verify Promise.race with finally handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceFirstTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let finallyCalled = false
      let result = await Promise.race<string>([Promise.resolve("value")])
        .finally(() => { finallyCalled = true })
      expect(result).assertEqual("value")
      expect(finallyCalled).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest5500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_5500
     * @tc.desc   Verify Promise.race with then-catch-finally chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceFirstTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result = await Promise.race<string>([Promise.resolve("value")])
        .then(v => v.toUpperCase())
        .catch(() => "error")
        .finally(() => {})
      expect(result).assertEqual("VALUE")
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest5600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_5600
     * @tc.desc   Verify Promise.race with timeout pattern, slow Promise times out
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceFirstTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let caught: boolean = false
      try {
        let result = await Promise.race([
          new Promise<string>(resolve => { setTimeout(() => resolve("slow"), 2000) }),
          new Promise<string>((_, reject) => { setTimeout(() => reject(new Error("Timeout after 500ms")), 500) })
        ])
        expect().assertFail()
      } catch (error) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest5700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_5700
     * @tc.desc   Verify Promise.race with timeout pattern, fast Promise resolves
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceFirstTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result = await Promise.race([
        new Promise<string>(resolve => { setTimeout(() => resolve("fast"), 100) }),
        new Promise<string>((_, reject) => { setTimeout(() => reject(new Error("Timeout")), 500) })
      ])
      expect(result).assertEqual("fast")
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest5800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_5800
     * @tc.desc   Verify Promise.race with fallback pattern, slow Promise falls back
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceFirstTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result = await Promise.race([
        new Promise<string>(resolve => { setTimeout(() => resolve("slow"), 2000) }),
        new Promise<string>(resolve => { setTimeout(() => resolve("fallback value"), 500) })
      ])
      expect(result).assertEqual("fallback value")
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest5900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_5900
     * @tc.desc   Verify Promise.race with fallback pattern, fast Promise resolves
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceFirstTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result2 = await Promise.race([
        new Promise<string>(resolve => { setTimeout(() => resolve("fast"), 100) }),
        new Promise<string>(resolve => { setTimeout(() => resolve("fallback value"), 500) })
      ])
      expect(result2).assertEqual("fast")
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest6000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_6000
     * @tc.desc   Verify Promise.race with resolved and delayed Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceFirstTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises = [
        Promise.resolve("fast"),
        new Promise<string>(resolve => { setTimeout(() => resolve("slow"), 100) })
      ]
      let result = await Promise.race<string>(promises)
      expect(result).assertEqual("fast")
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest6100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_6100
     * @tc.desc   Verify Promise.all with multiple delayed tasks completes all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceFirstTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results: string[] = []
      let promises = [
        new Promise<void>(resolve => { setTimeout(() => { results.push("task1"); resolve(undefined) }, 100) }),
        new Promise<void>(resolve => { setTimeout(() => { results.push("task2"); resolve(undefined) }, 150) }),
        new Promise<void>(resolve => { setTimeout(() => { results.push("task3"); resolve(undefined) }, 200) })
      ]
      await Promise.all(promises)
      expect(results.length).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest6200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_6200
     * @tc.desc   Verify Promise.race with forever pending Promise, resolved wins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceFirstTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let foreverPending = new Promise<string>(() => {})
      let result = await Promise.race<string>([
        foreverPending,
        Promise.resolve("completed")
      ])
      expect(result).assertEqual("completed")
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest6300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_6300
     * @tc.desc   Verify Promise.race with all pending Promises times out
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceFirstTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let allPending = [
        new Promise<string>(() => {}),
        new Promise<string>(() => {})
      ]
      let timeoutPromise = new Promise<string>((_, reject) => {
        setTimeout(() => reject(new Error("timeout")), 500)
      })
      let caught: boolean = false
      try {
        await Promise.race<string>([allPending[0], allPending[1], timeoutPromise])
        expect().assertFail()
      } catch (error) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest6400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_6400
     * @tc.desc   Verify Promise.race with already resolved Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceFirstTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let resolvedPromise = Promise.resolve("already resolved")
      let result1 = await Promise.race<string>([resolvedPromise])
      expect(result1).assertEqual("already resolved")
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest6500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_6500
     * @tc.desc   Verify Promise.race with pending and resolved Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRaceFirstTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let pendingPromise = new Promise<string>(() => {})
      let result2 = await Promise.race<string>([
        pendingPromise,
        Promise.resolve("settled")
      ])
      expect(result2).assertEqual("settled")
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest6600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_6600
     * @tc.desc   Verify Promise.race with sync thenable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceFirstTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let syncThenable = new SyncStringPromiseLike("sync thenable")
      let result1 = await Promise.race<string>([syncThenable])
      expect(result1).assertEqual("sync thenable")
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest6700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_6700
     * @tc.desc   Verify Promise.race with error thenable rejects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceFirstTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let errorThenable = new ErrorStringPromiseLike(new Error("thenable error"))
      let caught: boolean = false
      try {
        await Promise.race<string>([errorThenable])
        expect().assertFail()
      } catch (error) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest6800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_6800
     * @tc.desc   Verify Promise.race with void type resolves undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceFirstTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result1 = await Promise.race<void>([
        Promise.resolve(),
        Promise.resolve()
      ])
      expect(result1).assertEqual(undefined)
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest6900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_6900
     * @tc.desc   Verify Promise.race with single resolved Promise returning string value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceFirstTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result1 = await Promise.race<string>([
        Promise.resolve("string value")
      ])
      expect(result1).assertEqual("string value")
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest7000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_7000
     * @tc.desc   Verify Promise.race with union type string|number|boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceFirstTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result3 = await Promise.race<string>([
        Promise.resolve("str")
      ])
      expect(typeof result3 === "string").assertTrue()
      expect(result3).assertEqual("str")
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest7100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_7100
     * @tc.desc   Verify Promise.race with deeply nested Promise unwraps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceFirstTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let nestedPromise = Promise.resolve(
        Promise.resolve(
          Promise.resolve("deeply nested")
        )
      )
      let result = await Promise.race<string>([nestedPromise])
      expect(result).assertEqual("deeply nested")
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest7200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_7200
     * @tc.desc   Verify Promise.race in loop 1000 times without error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceFirstTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let count = 0
      for (let i = 0; i < 1000; i++) {
        let promise = Promise.race<number>([
          Promise.resolve<number>(i),
          Promise.resolve<number>(i + 1)
        ])
        await promise
        count++
      }
      expect(count).assertEqual(1000)
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest7300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_7300
     * @tc.desc   Verify Promise.race with fallback on all rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceFirstTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let caught: boolean = false
      try {
        let result = await Promise.race<string>([
          Promise.reject(new Error("error1")),
          Promise.reject(new Error("error2"))
        ])
        expect().assertFail()
      } catch (error) {
      caught = true
}
      expect(caught).assertTrue()
      let result = await Promise.race<string>([
        Promise.reject(new Error("error3")),
        Promise.resolve("fallback value")
      ]).catch(() => "fallback value")
      expect(result).assertEqual("fallback value")
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest7400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_7400
     * @tc.desc   Verify Promise.race with fallback, mixed reject and resolve
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRaceFirstTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let caught: boolean = false
      try {
        let result2 = await Promise.race<string>([
          Promise.reject(new Error("error")),
          Promise.resolve("success")
        ]);
        expect(result2).assertEqual("success");
      } catch (err) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest7500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_7500
     * @tc.desc   Verify Promise.race with delayed Promises, fastest wins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRaceFirstTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.race<string>([
        new Promise<string>(resolve => { setTimeout(() => resolve("fast"), 100) }),
        new Promise<string>(resolve => { setTimeout(() => resolve("slow"), 200) })
      ])
      expect(result).assertEqual("fast")
      Done();
    })

    /**
     * @tc.name   PromiseRaceFirstTest7600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RACE_FIRST_TEST_7600
     * @tc.desc   Verify Promise.race with three resolved Promises returns first
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRaceFirstTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.race<string>([
        Promise.resolve("a"),
        Promise.resolve("b"),
        Promise.resolve("c")
      ])
      expect(result).assertEqual("a")
      Done();
    })
  })
}
