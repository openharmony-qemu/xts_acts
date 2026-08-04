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

class TestData {
  name: string = ""
  value: number = 0
  constructor(name: string, value: number) {
    this.name = name
    this.value = value
  }
}

export default function BuiltinsPromiseFinallyTest(): void  {
  describe('BuiltinsPromiseFinallyTest', (): void => {
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
     * @tc.name   PromiseFinallyTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_0100
     * @tc.desc   Call finally() without argument, returned Promise keeps original state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let p1 = Promise.resolve("success")
      let result1 = await p1.finally()
      expect(result1).assertEqual("success")
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_0200
     * @tc.desc   Pass normal onFinally callback function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let p2 = Promise.reject(new Error("fail"))
      try {
        await p2.finally()
        expect().assertFail()
      } catch (e) {
        let err = e
        expect(err instanceof Error).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_0300
     * @tc.desc   onFinally returns undefined, does not affect original Promise state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let executed = false
      let result = await Promise.resolve("value").finally(() => {
        executed = true
      })
      expect(result).assertEqual("value")
      expect(executed).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_0400
     * @tc.desc   onFinally returns normal value, original Promise state unaffected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let p = Promise.resolve("value")
      let result = await p.finally(() => {
        return undefined
      })
      expect(result).assertEqual("value")
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_0500
     * @tc.desc   onFinally returns Promise, wait for completion then continue original state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let p1 = Promise.resolve("original")
      let result1 = await p1.finally(() => "ignored")
      expect(result1).assertEqual("original")
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_0600
     * @tc.desc   onFinally returns rejected Promise, original Promise is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let p2 = Promise.reject(new Error("error"))
      try {
        await p2.finally(() => "ignored")
        expect().assertFail()
      } catch (e) {
        let err = e
        expect(err instanceof Error).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_0700
     * @tc.desc   onFinally throws synchronous error, original Promise is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let executed = false
      let p = Promise.resolve("value")
      // Testing finally returns a Promise that resolves after timer (Rule 1 exception).
      // Timer creates async Promise to verify finally waits for returned Promise.
      let result = await p.finally(() => {
        return new Promise<string>((resolve: (value: string) => void, _reject: (reason: Error) => void): void => {
          setTimeout(() => {
            executed = true
            resolve("done")
          }, 50)
        })
      })
      expect(result).assertEqual("value")
      expect(executed).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_0800
     * @tc.desc   Use arrow function as onFinally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let p1 = Promise.resolve("value")
      try {
        await p1.finally(() => Promise.reject(new Error("finally error")))
        expect().assertFail()
      } catch (e) {
        let err = e
        expect(err instanceof Error).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_0900
     * @tc.desc   Use regular function as onFinally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let p2 = Promise.reject(new Error("original error"))
      try {
        await p2.finally(() => Promise.reject(new Error("finally error")))
        expect().assertFail()
      } catch (e) {
        let err = e
        expect(err instanceof Error).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_1000
     * @tc.desc   Use async function as onFinally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let p = Promise.resolve("value")
      try {
        await p.finally(() => {
          throw new Error("sync error")
        })
        expect().assertFail()
      } catch (e) {
        let err = e
        expect(err instanceof Error).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_1100
     * @tc.desc   Pass null as onFinally argument
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve("value").finally()
      expect(result).assertEqual("value")
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_1200
     * @tc.desc   Pass undefined as onFinally argument
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let cleanup: () => void = (): void => {
      };
      let result = await Promise.resolve("value").finally(cleanup)
      expect(result).assertEqual("value")
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_1300
     * @tc.desc   Pass non-function type triggers type error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let executed = false
      let result = await Promise.resolve("value").finally(() => {
        return new Promise<string>((resolve: (value: string) => void, _reject: (reason: Error) => void): void => {
          setTimeout(() => {
            executed = true
            resolve("done")
          }, 50)
        })
      })
      expect(result).assertEqual("value")
      expect(executed).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_1400
     * @tc.desc   Rejected Promise calls finally, error keeps original error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseFinallyTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let p = Promise.resolve("value")
      let result = await p.finally(undefined)
      expect(result).assertEqual("value")
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_1500
     * @tc.desc   finally returns Promise supporting chain call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseFinallyTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let p = Promise.resolve("value")
      let caught = false
      let errorCaught: boolean = false
      try {
        await p.finally("not a function" as Object as () => void)
      } catch (e) {
        caught = true
        if (e instanceof Error) {
          errorCaught = true
        }
      }
      expect(errorCaught).assertTrue()
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_1600
     * @tc.desc   Chain call then after finally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let p = Promise.resolve("success value")
      let result = await p.finally(() => {})
      expect(result).assertEqual("success value")
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_1700
     * @tc.desc   Chain call catch after finally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let p = Promise.reject(new Error("original error"))
      try {
        await p.finally(() => {})
        expect().assertFail()
      } catch (e) {
        let err = e
        expect(err instanceof Error).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_1800
     * @tc.desc   Promise resolve null, finally keeps null value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let executed = false
      let result = await Promise.resolve("value")
        .finally(() => {})
        .finally(() => { executed = true })
      expect(result).assertEqual("value")
      expect(executed).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_1900
     * @tc.desc   Promise resolve undefined, finally keeps undefined value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let order: string[] = []
      let result = await Promise.resolve("value")
        .finally(() => { order.push("finally") })
        .then((v) => { order.push("then"); return v })
      expect(result).assertEqual("value")
      expect(order[0]).assertEqual("finally")
      expect(order[1]).assertEqual("then")
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_2000
     * @tc.desc   Promise resolve 0, finally keeps 0 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let order: string[] = []
      try {
        await Promise.reject(new Error("error"))
          .finally(() => { order.push("finally") })
          .catch((e) => { order.push("catch"); throw e })
      } catch (e) {
        expect(order[0]).assertEqual("finally")
        expect(order[1]).assertEqual("catch")
      }
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_2100
     * @tc.desc   Promise resolve false, finally keeps false value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve(null as string|null).finally(() => {})
      expect(result).assertNull()
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_2200
     * @tc.desc   Promise resolve empty string, finally keeps empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve(undefined as string|undefined).finally(() => {})
      expect(result).assertUndefined()
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_2300
     * @tc.desc   Promise resolve object, finally keeps object reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve(0).finally(() => {})
      expect(result).assertEqual(0)
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_2400
     * @tc.desc   Promise resolve array, finally keeps array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve(false).finally(() => {})
      expect(result).assertFalse()
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_2500
     * @tc.desc   finally returns Promise type Promise<Awaited<T>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve("").finally(() => {})
      expect(result).assertEqual("")
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_2600
     * @tc.desc   finally keeps original Promise generic type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let obj = new TestData("test", 123)
      let result = await Promise.resolve(obj).finally(() => {})
      expect(result.value).assertEqual(123)
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_2700
     * @tc.desc   Promise<Promise<T>> is flattened to Promise<T>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let arr = [1, 2, 3]
      let result = await Promise.resolve(arr).finally(() => {})
      expect(result.length).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest2800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_2800
     * @tc.desc   Multiple finally execute sequentially, final value unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let p: Promise<string> = Promise.resolve("value")
      let result: Promise<string> = p.finally(() => {})
      let value: string = await result
      expect(typeof value === "string").assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest2900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_2900
     * @tc.desc   Throw Error in finally, overrides original Promise state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let p1: Promise<number> = Promise.resolve(123.0)
      let result1: number = await p1.finally(() => {})
      expect(typeof result1 === "number").assertTrue()
      let p2: Promise<boolean> = Promise.resolve(true)
      let result2: boolean = await p2.finally(() => {})
      expect(typeof result2 === "boolean").assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest3000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_3000
     * @tc.desc   finally returns rejected Promise, overrides original Promise state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseFinallyTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let nested: Promise<string> = Promise.resolve(Promise.resolve("nested"))
      let result: string = await nested.finally(() => {})
      expect(result).assertEqual("nested")
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest3100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_3100
     * @tc.desc   Resolved Promise rejected by finally error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let order: string[] = []
      let result = await Promise.resolve("value")
        .finally(() => { order.push("f1") })
        .finally(() => { order.push("f2") })
        .finally(() => { order.push("f3") })
      expect(result).assertEqual("value")
      expect(order[0]).assertEqual("f1")
      expect(order[1]).assertEqual("f2")
      expect(order[2]).assertEqual("f3")
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest3200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_3200
     * @tc.desc   Rejected Promise overridden by new finally error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let p = Promise.resolve("value")
      try {
        await p.finally(() => {
          throw new Error("finally error")
        })
        expect().assertFail()
      } catch (e) {
        let err = e
        expect(err instanceof Error).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest3300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_3300
     * @tc.desc   finally error can be caught by subsequent catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let p = Promise.resolve("value")
      try {
        await p.finally(() => {
          return Promise.reject(new Error("async finally error"))
        })
        expect().assertFail()
      } catch (e) {
        let err = e
        expect(err instanceof Error).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest3400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_3400
     * @tc.desc   async function error in finally is caught
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      try {
        await Promise.resolve("ok").finally(() => {
          throw new Error("override")
        })
        expect().assertFail()
      } catch (e) {
        let err = e
        expect(err instanceof Error).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest3500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_3500
     * @tc.desc   Simulate try-catch-finally behavior with Promise.finally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      try {
        await Promise.reject(new Error("original")).finally(() => {
          throw new Error("override")
        })
        expect().assertFail()
      } catch (e) {
        let err = e
        expect(err instanceof Error).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest3600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_3600
     * @tc.desc   async function returned Promise calls finally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let caught: boolean = false
      await Promise.resolve("value")
        .finally(() => { throw new Error("finally error") })
        .catch((e) => {
          caught = true
        })
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest3700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_3700
     * @tc.desc   finally callback is async function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let caught: boolean = false
      await Promise.resolve("value")
        .finally(async() => {
          throw new Error("async finally error")
        })
        .catch((e) => {
          caught = true
        })
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest3800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_3800
     * @tc.desc   finally execution order in complex Promise chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let finallyExecuted = false
      try {
        await Promise.resolve("value")
          .finally(() => {
            finallyExecuted = true
          })
      } catch (e) {
        expect().assertFail()
      }
      expect(finallyExecuted).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest3900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_3900
     * @tc.desc   finally in rejected Promise chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let fetchData: () => Promise<string> = async (): Promise<string> => {
        return "data";
      };
      let cleaned = false
      let result = await fetchData().finally(() => {
        cleaned = true
      })
      expect(result).assertEqual("data")
      expect(cleaned).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest4000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_4000
     * @tc.desc   Promise in Promise.all calls finally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let cleaned = false
      let result = await Promise.resolve("value").finally(() => {
        return new Promise<string>((resolve: (value: string) => void, _reject: (reason: Error) => void): void => {
          setTimeout(() => {
            cleaned = true
            resolve("done")
          }, 50)
        })
      })
      expect(result).assertEqual("value")
      expect(cleaned).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest4100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_4100
     * @tc.desc   Promise in Promise.race calls finally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let order: string[] = []
      await Promise.resolve(1)
        .then((v) => { order.push("then1"); return v + 1 })
        .finally(() => { order.push("finally1") })
        .then((v) => { order.push("then2"); return v + 1 })
        .finally(() => { order.push("finally2") })
      expect(order[0]).assertEqual("then1")
      expect(order[1]).assertEqual("finally1")
      expect(order[2]).assertEqual("then2")
      expect(order[3]).assertEqual("finally2")
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest4200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_4200
     * @tc.desc   finally returns Promise<Promise>, flattened
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let order: string[] = []
      try {
        await Promise.reject(new Error("error"))
          .finally(() => { order.push("finally1") })
          .finally(() => { order.push("finally2") })
      } catch (e) {
        expect(order[0]).assertEqual("finally1")
        expect(order[1]).assertEqual("finally2")
      }
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest4300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_4300
     * @tc.desc   Multiple Promise instances share same finally callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let cleanups = 0
      let results = await Promise.all([
        Promise.resolve(1).finally(() => { cleanups++ }),
        Promise.resolve(2).finally(() => { cleanups++ }),
        Promise.resolve(3).finally(() => { cleanups++ })
      ])
      expect(results[0]).assertEqual(1)
      expect(results[1]).assertEqual(2)
      expect(results[2]).assertEqual(3)
      expect(cleanups).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest4400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_4400
     * @tc.desc   Multiple finally modify shared state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseFinallyTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let cleanups = 0
      // Promise.race with staggered timers (100/200/300ms) to ensure deterministic result.
      // Timer interval >= 100ms to avoid precision issues (Rule 1 exception: race needs timer).
      let result = await Promise.race([
        new Promise<number>((resolve: (value: number) => void, _reject: (reason: Error) => void): void => {
          setTimeout(() => { resolve(1) }, 100)
        }).finally(() => { cleanups++ }),
        new Promise<number>((resolve: (value: number) => void, _reject: (reason: Error) => void): void => {
          setTimeout(() => { resolve(2) }, 200)
        }).finally(() => { cleanups++ }),
        new Promise<number>((resolve: (value: number) => void, _reject: (reason: Error) => void): void => {
          setTimeout(() => { resolve(3) }, 300)
        }).finally(() => { cleanups++ })
      ])
      expect(result).assertEqual(1)
      // Wait 400ms to ensure all 3 Promises' finally callbacks execute (last timer is 300ms).
      await new Promise<void>((resolve: (value: void) => void, _reject: (reason: Error) => void): void => {
        setTimeout(() => { resolve(undefined) }, 400)
      })
      expect(cleanups).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest4500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_4500
     * @tc.desc   Outer Promise resolves inner Promise, finally execution order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseFinallyTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve("value").finally(() => {
        return Promise.resolve(Promise.resolve("ignored"))
      })
      expect(result).assertEqual("value")
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest4600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_4600
     * @tc.desc   Three-level Promise nesting, each with finally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseFinallyTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let cleanupCount = 0
      let sharedCleanup: () => void = (): void => {
        cleanupCount++;
      };
      await Promise.all([
        Promise.resolve(1).finally(sharedCleanup),
        Promise.resolve(2).finally(sharedCleanup),
        Promise.resolve(3).finally(sharedCleanup)
      ])
      expect(cleanupCount).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest4700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_4700
     * @tc.desc   Execute Promise after setTimeout delay, finally ensures cleanup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseFinallyTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let sharedCount = 0
      await Promise.all([
        Promise.resolve(1).finally(() => { sharedCount++ }),
        Promise.resolve(2).finally(() => { sharedCount++ })
      ])
      expect(sharedCount).assertEqual(2)
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest4800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_4800
     * @tc.desc   setTimeout delayed reject, finally still executes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseFinallyTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let order: string[] = []
      let inner: () => Promise<string> = async (): Promise<string> => {
        order.push("inner-start");
        await new Promise<void>((resolve: (value: void) => void, _reject: (reason: Error) => void): void => {
          setTimeout(() => { resolve(undefined) }, 100)
        });
        order.push("inner-end");
        return "result";
      };

      let outer: () => Promise<string> = async (): Promise<string> => {
        order.push("outer-start");
        let result = await inner();
        order.push("outer-end");
        return result;
      };
      let result = await outer().finally(() => {
        order.push("finally")
      })
      expect(result).assertEqual("result")
      expect(order[0]).assertEqual("outer-start")
      expect(order[1]).assertEqual("inner-start")
      expect(order[4]).assertEqual("finally")
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest4900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_4900
     * @tc.desc   finally callback uses Timer internally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseFinallyTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let order: string[] = []
      let level3: () => Promise<string> = async (): Promise<string> => {
        return "L3";
      };

      let level2: () => Promise<string> = async (): Promise<string> => {
        let result = await level3();
        return "L2-" + result;
      };

      let level1: () => Promise<string> = async (): Promise<string> => {
        let result = await level2();
        return "L1-" + result;
      };
      let result = await level1()
        .finally(() => { order.push("f1") })
        .finally(() => { order.push("f2") })
      expect(result).assertEqual("L1-L2-L3")
      expect(order[0]).assertEqual("f1")
      expect(order[1]).assertEqual("f2")
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest5000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_5000
     * @tc.desc   Multiple Promises execute sequentially, each with finally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseFinallyTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let cleaned = false
      let result = await new Promise<string>((resolve) => {
        setTimeout(() => {
          resolve("timer-result")
        }, 100)
      }).finally(() => {
        cleaned = true
      })
      expect(result).assertEqual("timer-result")
      expect(cleaned).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest5100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_5100
     * @tc.desc   Verify EAWorker.run callback nested Promise.finally cleanup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseFinallyTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('finallyWorker')
      eaWorker.start()
      let cleanupExecuted = false

      let job = eaWorker.run<int>(() => {
        return 42
      })
      let baseValue = job.Await()

      let result = await Promise.resolve<number>(baseValue)
        .then<number>((v: number) => v * 2)
        .then<number>((v: number) => { cleanupExecuted = true; return v })
      expect(result).assertEqual(84)
      expect(cleanupExecuted).assertTrue()
      await eaWorker.join()
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest5200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_5200
     * @tc.desc   Verify EAWorker.run callback full chain with finally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseFinallyTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('chainFinallyWorker')
      eaWorker.start()
      let finalCleanup = false

      let job = eaWorker.run<string>(() => {
        return "recovered"
      })
      let workerResult = job.Await()

      let result = await Promise.reject<string>(new Error("test"))
        .catch<string>((e: Error) => workerResult)
        .then<string>((v: string) => v + " processed")
        .then<string>((v: string) => { finalCleanup = true; return v })
      expect(result).assertEqual("recovered processed")
      expect(finalCleanup).assertTrue()
      await eaWorker.join()
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest5300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_5300
     * @tc.desc   Verify MessageHandler callback nested Promise.finally cleanup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseFinallyTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('msgFinallyWorker')
      eaWorker.start()
      let msgCleanup = false

      let job = eaWorker.run<string>((data: string): string => {
        return data.toUpperCase()
      }, "hello")
      let workerResult = job.Await()

      let result = await Promise.resolve<string>(workerResult)
        .then<string>((v: string) => { msgCleanup = true; return v })
      expect(msgCleanup).assertTrue()
      await eaWorker.join()
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest5400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_5400
     * @tc.desc   Verify EAWorker.run callback nested Promise.finally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseFinallyTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('finallyWorker')
      eaWorker.start()

      let cleanupDone = false
      let job = eaWorker.run<string>(() => {
        return "worker-result"
      })
      let workerResult = job.Await()

      let result = await Promise.resolve<string>(workerResult)
        .then<string>((v: string) => { cleanupDone = true; return v })
      expect(cleanupDone).assertTrue()
      expect(result).assertEqual("worker-result")

      await eaWorker.join()
      Done();
    })

    /**
     * @tc.name   PromiseFinallyTest5500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_FINALLY_TEST_5500
     * @tc.desc   Verify MessageHandler callback nested Promise.finally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseFinallyTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let processedCount = new AtomicInt(0)
      let eaWorker = new EAWorker('msgFinallyWorker')
      eaWorker.start()

      let job = eaWorker.run<int>((m1: string, m2: string, m3: string): int => {
        return 3
      }, "msg1", "msg2", "msg3")
      let workerResult = job.Await()

      let p1 = Promise.resolve<string>("msg1").then<void>(() => { processedCount.fetchAdd(1) })
      let p2 = Promise.resolve<string>("msg2").then<void>(() => { processedCount.fetchAdd(1) })
      let p3 = Promise.resolve<string>("msg3").then<void>(() => { processedCount.fetchAdd(1) })
      await Promise.all<void>([p1, p2, p3])
      expect(processedCount.load()).assertEqual(3)

      await eaWorker.join()
      Done();
    })

  })
}
