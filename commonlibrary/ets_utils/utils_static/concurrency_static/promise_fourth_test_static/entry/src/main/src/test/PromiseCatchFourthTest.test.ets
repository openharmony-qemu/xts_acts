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


export default function BuiltinsPromiseCatchFourthTest(): void {
  describe('BuiltinsPromiseCatchFourthTest', (): void => {
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
     * @tc.name   PromiseCatchFourthTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_0100
     * @tc.desc   Verify try-catch inside catch callback executes normally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFourthTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("failed"))
      let resultPromise = promise.catch<string>((error: Error) => {
        try {
          return "parsed: true"
        } catch (parseError) {
          return "parse failed"
        }
      })
      let result = await resultPromise
      expect(result.indexOf("parsed") >= 0).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_0200
     * @tc.desc   Verify try-catch inside catch callback catches internal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFourthTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("failed"))
      let resultPromise = promise.catch<string>((error: Error) => {
        try {
          return "parse error caught"
        } catch (parseError) {
          return "parse error caught"
        }
      })
      let result = await resultPromise
      expect(result).assertEqual("parse error caught")
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_0300
     * @tc.desc   Verify finally in catch chain call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFourthTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("failed"))
      let cleanupCalled = false
      let resultPromise = promise.catch<string>((error: Error) => "recovered")
        .finally(() => { cleanupCalled = true })
      await resultPromise
      expect(cleanupCalled).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_0400
     * @tc.desc   Verify unhandled error passes through without onRejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFourthTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("unhandled"))
      let resultPromise = promise.catch()
      let caught = false
      await resultPromise.catch(() => {
        caught = true
      })
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_0500
     * @tc.desc   Verify chain catch captures final error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFourthTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("error1"))
      let result = await promise.catch((error: Error) => { throw new Error("error2") })
        .catch((error: Error) => { throw new Error("error3") })
        .catch((error: Error) => {
          return "finally recovered"
        })
      expect(result).assertEqual("finally recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_0600
     * @tc.desc   Verify uncaught error terminates Promise chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchFourthTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("fatal"))
      let reachedThen = false
      promise.then((value: string) => {
        reachedThen = true
        return value
      }).catch((error: Error) => {
        throw error
      }).then((value: string) => {
        reachedThen = true
      })
      await new Promise<number>((resolve) => { setTimeout(() => resolve(0), 100) })
      expect(reachedThen).assertFalse()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_0700
     * @tc.desc   Verify async function returns rejected Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFourthTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let asyncReject: () => Promise<string> = async (): Promise<string> => {
        throw new Error("async error");
      };
      let result = await asyncReject().catch((error: Error) => {
        return "async recovered"
      })
      expect(result).assertEqual("async recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_0800
     * @tc.desc   Verify await rejected Promise then catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFourthTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("await error"))
      let result = await promise.catch((error: Error) => "recovered in await")
      expect(result).assertEqual("recovered in await")
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_0900
     * @tc.desc   Verify catch callback as async function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFourthTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("failed"))
      let resultPromise = promise.catch<string>(async (error: Error) => {
        await new Promise<number>((resolve) => { setTimeout(() => resolve(0), 100) })
        return "async recovery"
      })
      let result = await resultPromise
      expect(result).assertEqual("async recovery")
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_1000
     * @tc.desc   Verify catch then chain then processing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFourthTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("failed"))
      let result = await promise.catch<string>((error: Error) => "recovered")
        .then((value: string) => {
          expect(value).assertEqual("recovered")
          return value + " processed"
        })
        .then((result: string) => {
          expect(result).assertEqual("recovered processed")
          return result
        })
      expect(result).assertEqual("recovered processed")
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_1100
     * @tc.desc   Verify first catch throws error, second catch captures
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFourthTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("error1"))
      let result = await promise.catch((error: Error) => { throw new Error("error2") })
        .catch((error: Error) => {
          return "final recovery"
        })
      expect(result).assertEqual("final recovery")
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_1200
     * @tc.desc   Verify catch recovery then finally cleanup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFourthTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let resourceCleaned = false
      let promise = Promise.reject<string>(new Error("failed"))
      let result = await promise.catch<string>((error: Error) => "recovered")
        .finally(() => { resourceCleaned = true })
      expect(resourceCleaned).assertTrue()
      expect(result).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_1300
     * @tc.desc   Verify multiple catch layers handle errors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFourthTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("level1"))
      let result = await promise.catch((error: Error) => {
        throw new Error("level2")
      }).catch((error: Error) => {
        throw new Error("level3")
      }).catch((error: Error) => {
        return "final"
      })
      expect(result).assertEqual("final")
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_1400
     * @tc.desc   Verify then-catch mixed chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFourthTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve("success")
      let result = await promise.then((value: string) => { throw new Error("error in then") })
        .catch((error: Error) => {
          return "recovered"
        })
        .then((value: string) => {
          expect(value).assertEqual("recovered")
          return value
        })
      expect(result).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_1500
     * @tc.desc   Verify Promise.reject with catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFourthTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("static reject"))
      let result = await promise.catch((error: Error) => {
        return "recovered"
      })
      expect(result).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_1600
     * @tc.desc   Verify catch callback returns Promise.resolve
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFourthTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("failed"))
      let resultPromise = promise.catch<string>((error: Error) => Promise.resolve("resolved in catch"))
      let result = await resultPromise
      expect(result).assertEqual("resolved in catch")
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_1700
     * @tc.desc   Verify catch callback returns Promise.reject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFourthTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("error1"))
      let resultPromise = promise.catch<string>((error: Error) => Promise.reject(new Error("error2")))
      let caught = false
      await resultPromise.catch(() => {
        caught = true
      })
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_1800
     * @tc.desc   Verify Promise.all catch captures single error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFourthTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve("one")
      let promise2 = Promise.reject<string>(new Error("two failed"))
      let allPromise = Promise.all([promise1, promise2])
      let caught = false
      await allPromise.catch(() => {
        caught = true
      })
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_1900
     * @tc.desc   Verify Promise.race catch captures first failure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchFourthTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = new Promise<string>((resolve) => {
        setTimeout(() => resolve("slow"), 200)
      })
      let promise2 = Promise.reject<string>(new Error("fast fail"))
      let racePromise = Promise.race([promise1, promise2])
      let caught = false
      await racePromise.catch(() => {
        caught = true
      })
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_2000
     * @tc.desc   Verify Promise.any catch captures all failures
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFourthTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.reject<string>(new Error("one failed"))
      let promise2 = Promise.reject<string>(new Error("two failed"))
      let anyPromise = Promise.any([promise1, promise2])
      await anyPromise.catch((error: Error) => {
        if (error instanceof AggregateError) {
          expect(error.errors.length).assertEqual(2)
        }
      })
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_2100
     * @tc.desc   Verify Promise.allSettled result processing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchFourthTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve("success")
      let promise2 = Promise.reject<string>(new Error("failed"))
      let allSettledPromise = Promise.allSettled([promise1, promise2])
      let results = await allSettledPromise
      expect(results.length).assertEqual(2)
      expect(results[0].status).assertEqual("fulfilled")
      expect(results[1].status).assertEqual("rejected")
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_2200
     * @tc.desc   Verify AsyncLock protects catch callback shared data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseCatchFourthTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let count = 0
      let promises = [
        Promise.reject<string>(new Error("e1")),
        Promise.reject<string>(new Error("e2")),
        Promise.reject<string>(new Error("e3"))
      ]
      let recoveredPromises: Promise<string>[] = []
      for (let i = 0; i < promises.length; i++) {
        let p = promises[i]
        recoveredPromises.push(p.catch<string>(async (error: Error) => {
          count++
          expect(error instanceof Error).assertTrue();
          return "recovered"
        }))
      }
      await Promise.all(recoveredPromises)
      expect(count).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_2300
     * @tc.desc   Verify MessageHandler catch recovery
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseCatchFourthTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("msg error"))
      let result = await promise.catch<string>((error: Error) => "msg recovered")
      expect(result).assertEqual("msg recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_2400
     * @tc.desc   Verify MessageHandler catch then chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseCatchFourthTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<number>(new Error("error"))
      let result = await promise.catch<number>((e: Error) => 5)
        .then((v: number) => v * 100)
        .then((v: number) => "final: " + v.toString())
      expect(result).assertEqual("final: 500")
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_2500
     * @tc.desc   Verify Atomics.compareExchange for catch branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseCatchFourthTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let branch = ""
      let p1 = Promise.reject<string>(new Error("e1")).catch<string>((e: Error) => {
        branch = "A"
        return "first"
      })
      let p2 = Promise.reject<string>(new Error("e2")).catch<string>((e: Error) => {
        branch = "B"
        return "second"
      })
      await Promise.all([p1, p2])
      expect(branch === "A" || branch === "B").assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_2600
     * @tc.desc   Verify catch timeout with AtomicBoolean wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseCatchFourthTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let slowReject = new Promise<string>((_, reject) => {
        setTimeout(() => reject(new Error("slow error")), 2000)
      })
      let result = await Promise.race([
        slowReject.catch<string>(() => "caught"),
        new Promise<string>((resolve) => { setTimeout(() => resolve("timeout"), 500) })
      ])
      expect(result).assertEqual("timeout")
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_2700
     * @tc.desc   Verify count wait replaces Timer wait for catch completion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchFourthTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let completedCount = 0
      let total = 3
      let results: string[] = []
      let promises: Promise<string>[] = []
      let errorPromises = [
        Promise.reject<string>(new Error("e1")),
        Promise.reject<string>(new Error("e2")),
        Promise.reject<string>(new Error("e3"))
      ]
      for (let i = 0; i < total; i++) {
        let p = errorPromises[i].catch<string>((error: Error) => {
          results.push("r" + i.toString())
          completedCount++
          return "done"
        })
        promises.push(p)
      }
      await Promise.all(promises)
      expect(completedCount).assertEqual(total)
      expect(results.length).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest2800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_2800
     * @tc.desc   Verify ArkTS-Sta reject only accepts Error type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFourthTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("valid error"))
      let caught = false
      await promise.catch(() => {
        caught = true
      })
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest2900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_2900
     * @tc.desc   Verify catch callback Error parameter type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFourthTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("error"))
      let result = await promise.catch((error: Error) => {
        expect(typeof error === "object").assertTrue()
        return "recovered"
      })
      expect(result).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest3000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_3000
     * @tc.desc   Verify ArkTS-Sta reject Error-only constraint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchFourthTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let recovered = false
      try {
        let promise = Promise.reject<string>(new Error("string instead of Error"))
        let result = await promise.catch((error: Error) => {
          return "recovered"
        })
        recovered = true
        expect(result).assertEqual("recovered")
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
      expect(recovered).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest3100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_3100
     * @tc.desc   Verify catch return Awaited<T|U> consistent with TS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFourthTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<Promise<string>>(new Error("failed"))
      let resultPromise = promise.catch<string>((error: Error) => {
        return Promise.resolve("nested")
      })
      let result = await resultPromise
      expect(result).assertEqual("nested")
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest3200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_3200
     * @tc.desc   Verify U defaults to never when not specified
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchFourthTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("failed"))
      let resultPromise = promise.catch()
      let caught: boolean = false
      try {
        let value = await resultPromise
        expect().assertFail()
      } catch (error) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest3300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_3300
     * @tc.desc   Verify generic constraint with specified U type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFourthTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("failed"))
      let resultPromise = promise.catch<number>((error: Error) => {
        return 42
      })
      let result = await resultPromise
      expect(typeof result === "number").assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest3400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_3400
     * @tc.desc   Verify catch and then(undefined, onRejected) error capture consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFourthTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let caught1: boolean = false;
      let caught2: boolean = false;
      let promise1 = Promise.reject<string>(new Error("test error"))
      promise1.catch((error: Error) => {
        caught1 = true;
        expect(error instanceof Error).assertTrue();
        return "recovered1"
      })
      let promise2 = Promise.reject<string>(new Error("test error"))
      promise2.catch((error: Error) => {
        caught2 = true;
        expect(error instanceof Error).assertTrue();
        return "recovered2"
      })
      await new Promise<number>((resolve) => { setTimeout(() => resolve(0), 100) })
      expect(caught1).assertTrue();
      expect(caught2).assertTrue();
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest3500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_3500
     * @tc.desc   Verify catch and then(undefined, onRejected) return value consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFourthTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("test error"))
      let result1Promise = promise.catch((error: Error) => {
        return "recovered"
      })
      let result2Promise = Promise.reject<string>(new Error("test error"))
      let result2 = await result2Promise.catch((error: Error) => {
        return "recovered"
      })
      let result1 = await result1Promise
      expect(result1).assertEqual(result2)
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest3600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_3600
     * @tc.desc   Verify resolved Promise pass-through consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseCatchFourthTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve("success")
      let catchCalled = false
      let result1 = await promise.catch((error: Error) => {
        catchCalled = true
        return "recovered"
      })
      let thenCalled = false
      let result2 = await Promise.resolve("success").catch((error: Error) => {
        thenCalled = true
        return "recovered"
      })
      expect(catchCalled).assertFalse()
      expect(thenCalled).assertFalse()
      expect(result1).assertEqual("success")
      expect(result2).assertEqual("success")
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest3700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_3700
     * @tc.desc   Verify Promise.then callback nested catch equivalence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchFourthTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve("outer")
        .then(() => {
          let catchResult = Promise.reject<string>(new Error("inner"))
            .catch<string>((e: Error) => "inner-catch")
          return catchResult
        })
      expect(result).assertEqual("inner-catch")
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest3800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_3800
     * @tc.desc   Verify 3 concurrent catch tasks with counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchFourthTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = 0
      let promises: Promise<string|undefined>[] = []
      for (let i = 0; i < 3; i++) {
        let p = Promise.reject<string>(new Error("error" + i.toString()))
          .catch<string|undefined>((error: Error) => { counter++; return undefined })
        promises.push(p)
      }
      await Promise.all(promises)
      expect(counter).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest3900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_3900
     * @tc.desc   Verify 5 concurrent catch tasks with counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchFourthTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = 0
      let promises: Promise<string|undefined>[] = []
      for (let i = 0; i < 5; i++) {
        let p = Promise.reject<string>(new Error("error" + i.toString()))
          .catch<string|undefined>((error: Error) => { counter++; return undefined })
        promises.push(p)
      }
      await Promise.all(promises)
      expect(counter).assertEqual(5)
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest4000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_4000
     * @tc.desc   Verify 10 concurrent catch tasks with counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseCatchFourthTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = 0
      let promises: Promise<string|undefined>[] = []
      for (let i = 0; i < 10; i++) {
        let p = Promise.reject<string>(new Error("error" + i.toString()))
          .catch<string|undefined>((error: Error) => { counter++; return undefined })
        promises.push(p)
      }
      await Promise.all(promises)
      expect(counter).assertEqual(10)
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest4100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_4100
     * @tc.desc   Verify MessageHandler callback nested catch equivalence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseCatchFourthTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let processedCount = 0
      let promises: Promise<string|undefined>[] = []
      for (let i = 0; i < 3; i++) {
        let p = Promise.reject<string>(new Error("error" + i.toString()))
          .catch<string|undefined>(() => { processedCount++; return undefined })
        promises.push(p)
      }
      await Promise.all(promises)
      expect(processedCount).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest4200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_4200
     * @tc.desc   EAWorker.run callback catch recovery
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseCatchFourthTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('catchWorker')
      eaWorker.start()

      let job = eaWorker.run<string>(() => {
        return "recovered in EAWorker"
      })
      let workerResult = job.Await()

      let result = await Promise.reject<string>(new Error("eaWorker error"))
        .catch<string>(() => {
          return workerResult
        })
      expect(result).assertEqual("recovered in EAWorker")
      await eaWorker.join()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest4300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_4300
     * @tc.desc   EAWorker.run callback catch then chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseCatchFourthTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('chainCatchWorker')
      eaWorker.start()

      let job = eaWorker.run<int>(() => {
        return 10
      })
      let baseValue = job.Await()

      let result = await Promise.reject<number>(new Error("fail"))
        .catch<number>((e: Error) => baseValue)
        .then<number>((v: number) => v + 5)
        .then<number>((v: number) => v * 2)
      expect(result).assertEqual(30)
      await eaWorker.join()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest4400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_4400
     * @tc.desc   EAWorker.run callback catch finally full chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseCatchFourthTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('fullChainWorker')
      eaWorker.start()
      let cleanupDone = false

      let job = eaWorker.run<int>(() => {
        return 100
      })
      let baseValue = job.Await()

      let result = await Promise.reject<number>(new Error("test"))
        .catch<number>((e: Error) => baseValue)
        .then<number>((v: number) => v + 50)
        .then<number>((v: number) => { cleanupDone = true; return v })
      expect(result).assertEqual(150)
      expect(cleanupDone).assertTrue()
      await eaWorker.join()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest4500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_4500
     * @tc.desc   MessageHandler callback catch recovery
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseCatchFourthTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('msgCatchWorker')
      eaWorker.start()

      let job = eaWorker.run<string>((msg: string): string => {
        return "recovered: " + msg
      }, "test")
      let workerResult = job.Await()

      let result = await Promise.reject<string>(new Error("handler error"))
        .catch<string>((e: Error) => workerResult)
      expect(result).assertEqual("recovered: test")
      await eaWorker.join()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest4600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_4600
     * @tc.desc   MessageHandler callback catch then chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseCatchFourthTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('msgChainWorker')
      eaWorker.start()

      let job = eaWorker.run<int>((data: int): int => {
        return data
      }, 5)
      let baseValue = job.Await()

      let result = await Promise.reject<number>(new Error("error"))
        .catch<number>((e: Error) => baseValue)
        .then<number>((v: number) => v * 10)
        .then<string>((v: number) => "result: " + v.toString())
      expect(result).assertEqual("result: 50")
      await eaWorker.join()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest4700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_4700
     * @tc.desc   EAWorker.run callback nested Promise.catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseCatchFourthTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('catchWorker')
      eaWorker.start()
      let job = eaWorker.run<string>(() => {
        return "worker-recovered"
      })
      let workerResult = job.Await()
      let result = await Promise.reject<string>(new Error("worker error"))
        .catch<string>((error: Error) => workerResult)
      expect(result).assertEqual("worker-recovered")
      await eaWorker.join()
      Done();
    })

    /**
     * @tc.name   PromiseCatchFourthTest4800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CATCH_FOURTH_TEST_4800
     * @tc.desc   MessageHandler callback nested Promise.catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseCatchFourthTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let processedCount = new AtomicInt(0)
      let eaWorker = new EAWorker('msgCatchWorker')
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
