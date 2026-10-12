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

export default function BuiltinsPromiseResolveFirstTest(): void {
  describe('BuiltinsPromiseResolveFirstTest', (): void => {
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
     * @tc.name   PromiseResolveFirstTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_0100
     * @tc.desc   Verify Promise.resolve() resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveFirstTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve()
      let result = await promise
      expect(result).assertEqual(undefined)
Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_0200
     * @tc.desc   Verify Promise.resolve() resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveFirstTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve()
      let value = await promise
      expect(value).assertEqual(undefined)
Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_0300
     * @tc.desc   Verify Promise.resolve() then handler executes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveFirstTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve()
      let executed = false
      promise.then(() => {
        executed = true
      }).catch((error: Error) => { expect(error instanceof Error).assertTrue(); expect().assertFail() })
      await new Promise<void>((resolve: (value: void) => void, _reject: (reason: Error) => void): void => {
              setTimeout(() => { resolve(undefined) }, 100)
            })
      expect(executed).assertTrue()
      Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_0400
     * @tc.desc   Verify Promise.resolve() resolves to undefined not null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveFirstTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve()
      let value = await promise
      expect(value === null).assertFalse()
      Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_0500
     * @tc.desc   Verify Promise.resolve() resolves to undefined without throwing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveFirstTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve()
      let result = await promise
      expect(result).assertEqual(undefined)
Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_0600
     * @tc.desc   Verify Promise.resolve() creates new Promise each call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveFirstTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve()
      let promise2 = Promise.resolve()
      expect(promise1 === promise2).assertFalse()
      Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_0700
     * @tc.desc   Verify Promise.resolve() with Promise.all for 10 promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveFirstTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<void>[] = []
      let resolvedCount = new AtomicInt(0)
      for (let i = 0; i < 10; i++) {
        promises.push(Promise.resolve())
      }
      expect(promises.length).assertEqual(10)
      await Promise.all(promises.map(p => p.then(() => { resolvedCount.fetchAdd(1) })))
      expect(resolvedCount.load()).assertEqual(10)
      Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_0800
     * @tc.desc   Verify Promise.resolve() does not throw in try-catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveFirstTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise: Promise<void> | undefined
      try {
        promise = Promise.resolve()
      } catch (error) {
        expect().assertFail()
      }
      if (promise !== undefined) {
        expect(await promise).assertEqual(undefined)
      } else {
        expect().assertFail()
      }
      Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_0900
     * @tc.desc   Verify Promise.resolve() catch handler not called for resolved Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveFirstTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve()
      let catchExecuted = false
      promise.catch(() => {
        catchExecuted = true
      })
      await new Promise<void>((resolve: (value: void) => void, _reject: (reason: Error) => void): void => {
              setTimeout(() => { resolve(undefined) }, 100)
            })
      expect(catchExecuted).assertFalse()
      Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_1000
     * @tc.desc   Verify Promise.resolve() then throwing error caught by catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveFirstTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve()
      let caught = false
      promise.then(() => {
        throw new Error("then error")
      }).catch(() => {
        caught = true
      })
      await new Promise<void>((resolve: (value: void) => void, _reject: (reason: Error) => void): void => {
              setTimeout(() => { resolve(undefined) }, 100)
            })
      expect(caught).assertTrue()
      Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_1100
     * @tc.desc   Verify Promise.resolve() then returning rejected Promise caught by catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveFirstTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve()
      let caught = false
      promise.then(() => {
        return Promise.reject(new Error("chain error"))
      }).catch(() => {
        caught = true
      })
      await new Promise<void>((resolve: (value: void) => void, _reject: (reason: Error) => void): void => {
              setTimeout(() => { resolve(undefined) }, 100)
            })
      expect(caught).assertTrue()
      Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_1200
     * @tc.desc   Verify Promise.resolve() finally handler executes after then
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveFirstTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve()
      let finallyExecuted = false
      promise.then(() => {}).finally(() => {
        finallyExecuted = true
      })
      await new Promise<void>((resolve: (value: void) => void, _reject: (reason: Error) => void): void => {
              setTimeout(() => { resolve(undefined) }, 100)
            })
      expect(finallyExecuted).assertTrue()
      Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_1300
     * @tc.desc   Verify Promise.resolve() resolves to undefined for void generic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveFirstTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve()
      let result = await promise1
      expect(result).assertEqual(undefined)
Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_1400
     * @tc.desc   Verify Promise.resolve() with explicit type annotation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveFirstTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise: Promise<void> = Promise.resolve()
      let value = await promise
      expect(value).assertEqual(undefined)
Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_1500
     * @tc.desc   Verify Promise.resolve() assignable to Promise<void> type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveFirstTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1: Promise<void> = Promise.resolve()
      let promise2 = Promise.resolve()
      let promise3: Promise<void> = promise2
      let result = await promise2
      expect(result).assertEqual(undefined)
Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_1600
     * @tc.desc   Verify Promise.resolve() with await inside async function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveFirstTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let testAwait: () => Promise<void> = async (): Promise<void> => {
        let value = await Promise.resolve();
        expect(value).assertEqual(undefined)
      };
      await testAwait()
      Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_1700
     * @tc.desc   Verify Promise.resolve() returned from async function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveFirstTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let getPromise: () => Promise<void> = async (): Promise<void> => {
        return Promise.resolve();
      };
      await getPromise()
      let value = await getPromise()
      expect(value).assertEqual(undefined)
Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_1800
     * @tc.desc   Verify Promise.resolve() then chain executes in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveFirstTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let order: number[] = []
      await Promise.resolve()
        .then(() => { order.push(1) })
        .then(() => { order.push(2) })
        .then(() => { order.push(3) })
      expect(order[0]).assertEqual(1)
      expect(order[1]).assertEqual(2)
      expect(order[2]).assertEqual(3)
      Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_1900
     * @tc.desc   Verify Promise.resolve() then chain with string transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveFirstTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result = ""
      await Promise.resolve()
        .then(() => "A")
        .then((value) => value + "B")
        .then((value) => {
          result = value + "C"
        })
      expect(result).assertEqual("ABC")
      Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_2000
     * @tc.desc   Verify Promise.resolve() then returning Promise unwraps value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveFirstTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result = ""
      await Promise.resolve()
        .then(() => Promise.resolve("inner"))
        .then((value) => {
          result = value
        })
      expect(result).assertEqual("inner")
      Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_2100
     * @tc.desc   Verify Promise.resolve() with Promise.all resolves all to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveFirstTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let results = await Promise.all([
        Promise.resolve(),
        Promise.resolve(),
        Promise.resolve()
      ])
      expect(results.length).assertEqual(3)
      expect(results[0] === undefined).assertTrue()
      expect(results[1] === undefined).assertTrue()
      expect(results[2] === undefined).assertTrue()
      Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_2200
     * @tc.desc   Verify Promise.resolve() with Promise.race wins over delayed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveFirstTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result = await Promise.race([
        Promise.resolve(),
        new Promise<void>((resolve: (value: void) => void, _reject: (reason: Error) => void): void => {
          setTimeout(() => { resolve(undefined) }, 1000)
        })
      ])
      expect(result).assertEqual(undefined)
Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_2300
     * @tc.desc   Verify Promise.resolve() with Promise.all for 100 promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveFirstTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<void>[] = []
      for (let i = 0; i < 100; i++) {
        promises.push(Promise.resolve())
      }
      let results = await Promise.all(promises)
      expect(results.length).assertEqual(100)
      Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_2400
     * @tc.desc   Verify Promise.resolve() with Promise.all and counter increment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveFirstTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let count = 0
      let promises: Promise<void>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(Promise.resolve().then(() => { count++ }).catch((error: Error) => { expect(error instanceof Error).assertTrue(); expect().assertFail() }))
      }
      await Promise.all(promises)
      expect(count).assertEqual(10)
      Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_2500
     * @tc.desc   Verify Promise.resolve() in nested async function calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveFirstTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let level3: () => Promise<void> = async (): Promise<void> => {
        return Promise.resolve();
      };

      let level2: () => Promise<void> = async (): Promise<void> => {
        return await level3();
      };

      let level1: () => Promise<void> = async (): Promise<void> => {
        return await level2();
      };
      await level1()
      let value = await level1()
      expect(value).assertEqual(undefined)
Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_2600
     * @tc.desc   Verify Promise.resolve() in nested async functions with value return
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveFirstTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let inner: () => Promise<string> = async (): Promise<string> => {
        await Promise.resolve();
        return "done";
      };

      let middle: () => Promise<string> = async (): Promise<string> => {
        await Promise.resolve();
        return await inner();
      };

      let outer: () => Promise<string> = async (): Promise<string> => {
        await Promise.resolve();
        return await middle();
      };
      let result = await outer()
      expect(result).assertEqual("done")
      Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_2700
     * @tc.desc   Verify Promise.resolve() inside setTimeout async callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveFirstTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result: string | undefined
      setTimeout(async () => {
        await Promise.resolve()
        result = "timer done"
      }, 500)
      await new Promise<void>((resolve: (value: void) => void, _reject: (reason: Error) => void): void => {
        setTimeout(() => { resolve(undefined) }, 600)
      })
      expect(result).assertEqual("timer done")
      Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest2800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_2800
     * @tc.desc   Verify Promise.resolve() inside new Promise constructor with setTimeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveFirstTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<string>((resolve) => {
        setTimeout(async () => {
          await Promise.resolve()
          resolve("resolved")
        }, 500)
      })
      let result = await promise
      expect(result).assertEqual("resolved")
      Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest2900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_2900
     * @tc.desc   Verify Promise.resolve() multiple then handlers with completion counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveFirstTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let completedCount = 0
      let total = 5
      let results: number[] = []
      let waitPromise = new Promise<void>((resolve: (value: void) => void, _reject: (reason: Error) => void): void => {
        let checkComplete = () => {
          if (completedCount === total) resolve(undefined)
        }
        for (let i = 0; i < total; i++) {
          Promise.resolve().then(() => {
            results.push(i)
            completedCount++
            checkComplete()
          }).catch((error: Error) => { expect(error instanceof Error).assertTrue(); expect().assertFail() })
        }
      })
      await waitPromise
      expect(results.length).assertEqual(5)
      Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest3000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_3000
     * @tc.desc   Verify Promise.resolve() resolves to undefined strictly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveFirstTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let value = await Promise.resolve()
      expect(value === null).assertFalse()
      expect(value === 0).assertFalse()
      expect(value === "").assertFalse()
      Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest3100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_3100
     * @tc.desc   Verify Promise.resolve() with void type variable assignment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveFirstTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise: Promise<void> = Promise.resolve()
      let value = await promise
      let v: void = undefined
      expect(value).assertEqual(undefined)
Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest3200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_3200
     * @tc.desc   Verify Promise.resolve() void vs Promise.resolve with number value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseResolveFirstTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promiseVoid = Promise.resolve()
      let promiseValue = Promise.resolve<number>(42)
      let value1 = await promiseVoid
      let value2 = await promiseValue
      expect(value2).assertEqual(42)
      Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest3300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_3300
     * @tc.desc   Verify Promise.resolve<void>() resolves to undefined like Promise.resolve()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveFirstTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1: Promise<void> = Promise.resolve()
      let promise2 = Promise.resolve()
      let v1 = await promise1
      let v2 = await promise2
      expect(v2).assertEqual(undefined)
Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest3400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_3400
     * @tc.desc   Verify Promise.resolve() with 1000 sequential awaits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveFirstTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let count = 0
      for (let i = 0; i < 1000; i++) {
        await Promise.resolve()
        count++
      }
      expect(count).assertEqual(1000)
      Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest3500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_3500
     * @tc.desc   Verify Promise.resolve() then chain with string concatenation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveFirstTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve()
        .then(() => "step1")
        .then((v) => v + " step2")
        .then((v) => v + " done")
      expect(result).assertEqual("step1 step2 done")
      Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest3600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_3600
     * @tc.desc   Verify Promise.resolve() then/catch/finally chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveFirstTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let finallyCalled = false
      let result = await Promise.resolve()
        .then(() => "value")
        .catch(() => "recovered")
        .finally(() => { finallyCalled = true })
      expect(result).assertEqual("value")
      expect(finallyCalled).assertTrue()
      Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest3700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_3700
     * @tc.desc   Verify Promise.resolve() then returning inner Promise unwraps value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveFirstTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve()
        .then(() => Promise.resolve("inner value"))
      expect(result).assertEqual("inner value")
      Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest3800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_3800
     * @tc.desc   Verify Promise.resolve() then throwing error is caught, reason is Error instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveFirstTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let caught: boolean = false
      await Promise.resolve()
        .then(() => { throw new Error("error in then") })
        .catch((error) => {
          caught = true
          expect(error instanceof Error).assertTrue()
        })
      expect(caught).assertTrue()
      Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest3900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_3900
     * @tc.desc   Verify Promise.resolve() then returning rejected Promise is caught and catch returns recovery
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveFirstTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let caught: boolean = false
      await Promise.resolve()
        .then(() => Promise.reject(new Error("reject in then")))
        .catch((error) => {
          caught = true
          expect(error instanceof Error).assertTrue()
        })
      expect(caught).assertTrue()
      Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest4000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_4000
     * @tc.desc   Verify Promise.resolve() then chain with finally preserves value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveFirstTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve()
        .then(() => "A")
        .then((v) => v + "B")
        .finally(() => {})
      expect(result).assertEqual("AB")
      Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest4100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_4100
     * @tc.desc   Verify Promise.resolve() with Promise.all and then transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveFirstTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results = await Promise.all([
        Promise.resolve().then(() => 1),
        Promise.resolve().then(() => 2),
        Promise.resolve().then(() => 3)
      ])
      expect(results[0]).assertEqual(1)
      expect(results[1]).assertEqual(2)
      expect(results[2]).assertEqual(3)
      Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest4200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_4200
     * @tc.desc   Verify Promise.resolve() with Promise.race and then transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseResolveFirstTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result = await Promise.race([
        Promise.resolve().then(() => "fast"),
        new Promise<string>((resolve: (value: string) => void, _reject: (reason: Error) => void): void => {
          setTimeout(() => { resolve("slow") }, 200)
        })
      ])
      expect(result).assertEqual("fast")
      Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest4300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_4300
     * @tc.desc   Verify Promise.resolve() long then chain with finally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveFirstTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve()
        .then(() => "first")
        .then((v) => v + " second")
        .then((v) => v + " third")
        .finally(() => {})
      expect(result).assertEqual("first second third")
      Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest4400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_4400
     * @tc.desc   Verify Promise.resolve() with Promise.allSettled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveFirstTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let results = await Promise.allSettled([
        Promise.resolve(),
        Promise.resolve().then(() => { throw new Error("e") }),
        Promise.resolve()
      ])
      expect(results.length).assertEqual(3)
      expect(results[0].status).assertEqual("fulfilled")
      expect(results[1].status).assertEqual("rejected")
      expect(results[2].status).assertEqual("fulfilled")
      Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest4500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_4500
     * @tc.desc   Verify Promise.resolve() with Promise.any
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveFirstTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.any([
        Promise.resolve(),
        Promise.resolve()
      ])
      expect(result).assertEqual(undefined)
Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest4600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_4600
     * @tc.desc   Verify Promise.resolve() with Promise.all for 50 promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveFirstTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promises: Promise<void>[] = []
      let resolvedCount = new AtomicInt(0)
      for (let i = 0; i < 50; i++) {
        promises.push(Promise.resolve())
      }
      await Promise.all(promises.map(p => p.then(() => { resolvedCount.fetchAdd(1) })))
      expect(promises.length).assertEqual(50)
      expect(resolvedCount.load()).assertEqual(50)
      Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest4700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_4700
     * @tc.desc   Verify Promise.resolve() then returning zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveFirstTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve()
        .then(() => 0)
      expect(result).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest4800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_4800
     * @tc.desc   Verify Promise.resolve() then returning false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveFirstTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve()
        .then(() => false)
      expect(result).assertFalse()
      Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest4900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_4900
     * @tc.desc   Verify Promise.resolve() then returning empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveFirstTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve()
        .then(() => "")
      expect(result).assertEqual("")
      Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest5000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_5000
     * @tc.desc   Verify Promise.resolve() then returning null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveFirstTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve()
        .then(() => null)
      expect(result).assertEqual(null)
      Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest5100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_5100
     * @tc.desc   Verify Promise.resolve() then returning object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveFirstTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve()
        .then<Record<string, string>>((): Record<string, string> => {
          let obj: Record<string, string> = {}
          obj["name"] = "test"
          return obj
        })
      expect(result["name"]).assertEqual("test")
      Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest5200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_5200
     * @tc.desc   Verify Promise.resolve() then returning array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveFirstTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve()
        .then(() => [1, 2, 3])
      expect(result.length).assertEqual(3)
      Done()
    })

    /**
     * @tc.name   PromiseResolveFirstTest5300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_RESOLVE_FIRST_TEST_5300
     * @tc.desc   Verify Promise.resolve() then returns new Promise instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseResolveFirstTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve()
      let promise2 = promise1.then(() => {})
      expect(promise1 === promise2).assertFalse()
      Done()
    })
  })
}
