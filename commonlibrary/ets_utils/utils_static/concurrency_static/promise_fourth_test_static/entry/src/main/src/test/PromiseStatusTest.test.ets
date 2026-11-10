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

export default function BuiltinsPromiseStatusTest(): void {
  describe('BuiltinsPromiseStatusTest', (): void => {
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
     * @tc.name   PromiseStatusTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_STATUS_TEST_0100
     * @tc.desc   Verify PromiseStatus.fulfilled equals string fulfilled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseStatusTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      expect(PromiseStatus.fulfilled).assertEqual("fulfilled")
      Done();
    })

    /**
     * @tc.name   PromiseStatusTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_STATUS_TEST_0200
     * @tc.desc   Verify PromiseStatus.fulfilled is string type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseStatusTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let status: string = PromiseStatus.fulfilled
      expect(status instanceof string).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseStatusTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_STATUS_TEST_0300
     * @tc.desc   Verify PromiseStatus.rejected equals string rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseStatusTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      expect(PromiseStatus.rejected).assertEqual("rejected")
      Done();
    })

    /**
     * @tc.name   PromiseStatusTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_STATUS_TEST_0400
     * @tc.desc   Verify PromiseStatus.rejected is string type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseStatusTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let status: string = PromiseStatus.rejected
      expect(status instanceof string).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseStatusTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_STATUS_TEST_0500
     * @tc.desc   Verify PromiseStatus.fulfilled and rejected are distinct values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseStatusTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      expect(PromiseStatus.fulfilled !== PromiseStatus.rejected).assertTrue()
      expect(!(PromiseStatus.fulfilled === PromiseStatus.rejected)).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseStatusTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_STATUS_TEST_0600
     * @tc.desc   Verify PromiseStatus values strict equal string literals
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseStatusTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      expect(PromiseStatus.fulfilled === "fulfilled").assertTrue()
      expect(PromiseStatus.rejected === "rejected").assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseStatusTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_STATUS_TEST_0700
     * @tc.desc   Verify allSettled result status equals PromiseStatus.fulfilled for resolved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseStatusTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<string>("success")
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([promise1])
      expect(results[0].status).assertEqual(PromiseStatus.fulfilled)
      Done();
    })

    /**
     * @tc.name   PromiseStatusTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_STATUS_TEST_0800
     * @tc.desc   Verify allSettled result status equals PromiseStatus.rejected for rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseStatusTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise2 = Promise.reject<string>(new Error("failed"))
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([promise2])
      expect(results[0].status).assertEqual(PromiseStatus.rejected)
      Done();
    })

    /**
     * @tc.name   PromiseStatusTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_STATUS_TEST_0900
     * @tc.desc   Verify allSettled with mixed resolved and rejected status matching
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseStatusTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<string>("success")
      let promise2 = Promise.reject<string>(new Error("failed"))
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([promise1, promise2])
      expect(results[0].status).assertEqual(PromiseStatus.fulfilled)
      expect(results[1].status).assertEqual(PromiseStatus.rejected)
      Done();
    })

    /**
     * @tc.name   PromiseStatusTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_STATUS_TEST_1000
     * @tc.desc   Verify allSettled with 3 resolved number results all PromiseStatus.fulfilled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseStatusTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = [
        Promise.resolve<number>(1),
        Promise.resolve<number>(2),
        Promise.resolve<number>(3)
      ]
      let results: PromiseSettledResult<number>[] = await Promise.allSettled<number>(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual(PromiseStatus.fulfilled)
      }
      Done();
    })

    /**
     * @tc.name   PromiseStatusTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_STATUS_TEST_1100
     * @tc.desc   Verify allSettled with 2 rejected results all PromiseStatus.rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseStatusTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = [
        Promise.reject<number>(new Error("error1")),
        Promise.reject<number>(new Error("error2"))
      ]
      let results: PromiseSettledResult<number>[] = await Promise.allSettled<number>(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual(PromiseStatus.rejected)
      }
      Done();
    })

    /**
     * @tc.name   PromiseStatusTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_STATUS_TEST_1200
     * @tc.desc   Verify allSettled fulfilled status equals string fulfilled via PromiseStatus
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseStatusTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("success")
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([promise])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual(PromiseStatus.fulfilled)
        expect(results[i].status).assertEqual("fulfilled")
      }
      Done();
    })

    /**
     * @tc.name   PromiseStatusTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_STATUS_TEST_1300
     * @tc.desc   Verify allSettled rejected status equals string rejected via PromiseStatus
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseStatusTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("failed"))
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([promise])
      for (let i = 0; i < results.length; i++) {
        expect(results[i].status).assertEqual(PromiseStatus.rejected)
        expect(results[i].status).assertEqual("rejected")
      }
      Done();
    })

    /**
     * @tc.name   PromiseStatusTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_STATUS_TEST_1400
     * @tc.desc   Verify allSettled mixed results status equals corresponding string values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseStatusTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.resolve<string>("success")
      let promise2 = Promise.reject<string>(new Error("failed"))
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([promise1, promise2])
      for (let i = 0; i < results.length; i++) {
        if (results[i].status === PromiseStatus.fulfilled) {
          expect(results[i].status).assertEqual("fulfilled")
        } else if (results[i].status === PromiseStatus.rejected) {
          expect(results[i].status).assertEqual("rejected")
        }
      }
      Done();
    })

    /**
     * @tc.name   PromiseStatusTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_STATUS_TEST_1500
     * @tc.desc   Verify PromiseStatus in ternary conditional expression returns Success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseStatusTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<number>(42)
      let results: PromiseSettledResult<number>[] = await Promise.allSettled<number>([promise])
      let message = results[0].status === PromiseStatus.fulfilled ? "Success" : "Failure"
      expect(message).assertEqual("Success")
      Done();
    })

    /**
     * @tc.name   PromiseStatusTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_STATUS_TEST_1600
     * @tc.desc   Verify allSettled collecting rejected results into array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseStatusTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = [
        Promise.resolve<number>(1),
        Promise.reject<number>(new Error("error1")),
        Promise.resolve<number>(2),
        Promise.reject<number>(new Error("error2"))
      ]
      let results: PromiseSettledResult<number>[] = await Promise.allSettled<number>(promises)
      let rejectedResults: PromiseRejectedResult[] = []
      for (let i = 0; i < results.length; i++) {
        if (results[i].status === PromiseStatus.rejected) {
          rejectedResults.push(results[i] as PromiseRejectedResult)
        }
      }
      expect(rejectedResults.length).assertEqual(2)
      Done();
    })

    /**
     * @tc.name   PromiseStatusTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_STATUS_TEST_1700
     * @tc.desc   Verify allSettled with retry logic until PromiseStatus.fulfilled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseStatusTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let retryCount = 0
      let retryablePromise: () => Promise<number> = (): Promise<number> => {
        retryCount++;
        if (retryCount < 3) {
          return Promise.reject<number>(new Error("retry needed"));
        }
        return Promise.resolve<number>(42);
      };
      let maxRetries = 3
      let lastResult: PromiseSettledResult<number> | null = null
      for (let i = 0; i < maxRetries; i++) {
        let allSettled = await Promise.allSettled<number>([retryablePromise()])
        lastResult = allSettled[0]
        if (lastResult.status === PromiseStatus.fulfilled) {
          break
        }
      }
      if (lastResult === null) {
        expect().assertFail()
      } else {
        expect(lastResult.status).assertEqual(PromiseStatus.fulfilled)
      }
      expect(retryCount).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseStatusTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_STATUS_TEST_1800
     * @tc.desc   Verify PromiseStatus in function returning status-based message string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseStatusTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let handleStatus: (status: string) => string = (status: string): string => {
        if (status === PromiseStatus.fulfilled) {
          return "Success";
        } else if (status === PromiseStatus.rejected) {
          return "Failure";
        }
        return "Unknown";
      };
      expect(handleStatus(PromiseStatus.fulfilled)).assertEqual("Success")
      expect(handleStatus(PromiseStatus.rejected)).assertEqual("Failure")
      Done();
    })

    /**
     * @tc.name   PromiseStatusTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_STATUS_TEST_1900
     * @tc.desc   Verify allSettled result status boolean check with PromiseStatus.fulfilled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseStatusTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.resolve<string>("success")
      let results: PromiseSettledResult<string>[] = await Promise.allSettled<string>([promise])
      expect(results[0].status === PromiseStatus.fulfilled).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseStatusTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_STATUS_TEST_2000
     * @tc.desc   Verify PromiseStatus counting fulfilled and rejected concurrently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseStatusTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let fulfilledCount = 0
      let rejectedCount = 0
      let countStatus: (result: PromiseSettledResult<string>) => void =
        (result: PromiseSettledResult<string>): void => {
          if (result.status === PromiseStatus.fulfilled) {
            fulfilledCount++;
          } else if (result.status === PromiseStatus.rejected) {
            rejectedCount++;
          }
        };
      let promises: Promise<void>[] = []
      for (let i = 0; i < 10; i++) {
        let p = i % 2 === 0
          ? Promise.resolve<string>(`item_${i}`)
          : Promise.reject<string>(new Error(`error_${i}`))
        let allSettled = Promise.allSettled<string>([p])
        promises.push(allSettled.then<void>((results: PromiseSettledResult<string>[]) => {
          countStatus(results[0])
        }).catch((error: Error) => { expect(error instanceof Error).assertTrue(); expect().assertFail() }))
      }
      await Promise.all(promises)
      expect(fulfilledCount + rejectedCount).assertEqual(10)
      expect(fulfilledCount).assertEqual(5)
      expect(rejectedCount).assertEqual(5)
      Done();
    })

    /**
     * @tc.name   PromiseStatusTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_STATUS_TEST_2100
     * @tc.desc   Verify PromiseStatus with Promise.all for 5 concurrent status check tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseStatusTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let completedCount = 0
      let totalCount = 5
      let statusResults: string[] = []
      let checkStatusTask: (id: number) => Promise<void> = async (id: number): Promise<void> => {
        let results = await Promise.allSettled<string>([
          Promise.resolve(`task_${id}`)
        ]);
        if (results[0].status === PromiseStatus.fulfilled) {
          statusResults.push("fulfilled");
        } else {
          statusResults.push("rejected");
        }
        completedCount++;
      };
      let tasks: Promise<void>[] = []
      for (let i = 0; i < totalCount; i++) {
        tasks.push(checkStatusTask(i))
      }
      await Promise.all(tasks)
      expect(completedCount).assertEqual(totalCount)
      expect(statusResults.length).assertEqual(5)
      Done();
    })

    /**
     * @tc.name   PromiseStatusTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_STATUS_TEST_2200
     * @tc.desc   Verify PromiseStatus with nested allSettled returning status string arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseStatusTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let nestedStatusCheck: (batchId: number) => Promise<string[]> = async (batchId: number): Promise<string[]> => {
        let innerResults = await Promise.allSettled<string>([
          Promise.resolve(`inner_${batchId}`),
          Promise.reject<string>(new Error(`error_${batchId}`))
        ]);
        let statuses: string[] = [];
        for (let i = 0; i < innerResults.length; i++) {
          if (innerResults[i].status === PromiseStatus.fulfilled) {
            statuses.push("fulfilled");
          } else if (innerResults[i].status === PromiseStatus.rejected) {
            statuses.push("rejected");
          }
        }
        return statuses;
      };
      let tasks: Promise<string[]>[] = [nestedStatusCheck(1), nestedStatusCheck(2), nestedStatusCheck(3)]
      let batchStatuses = await Promise.all(tasks)
      expect(batchStatuses.length).assertEqual(3)
      for (let i = 0; i < batchStatuses.length; i++) {
        expect(batchStatuses[i].length).assertEqual(2)
        expect(batchStatuses[i][0]).assertEqual("fulfilled")
        expect(batchStatuses[i][1]).assertEqual("rejected")
      }
      Done();
    })

    /**
     * @tc.name   PromiseStatusTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_STATUS_TEST_2300
     * @tc.desc   Verify PromiseStatus with AsyncLock and nested allSettled counting 5 tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseStatusTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let lock = new AsyncLock()
      let count = 0  // Shared counter protected by AsyncLock (Rule 6)
      let nestedStatusTask: (_id: number) => Promise<void> = async (_id: number): Promise<void> => {
        let results = await Promise.allSettled<string>([
          Promise.resolve("nested")
        ]);
        if (results[0].status === PromiseStatus.fulfilled) {
          // AsyncLock protects concurrent count++ from race condition
          await lock.lockAsync(() => {
            count++;
          });
        }
      };
      let tasks: Promise<void>[] = []
      for (let i = 0; i < 5; i++) {
        tasks.push(nestedStatusTask(i))
      }
      await Promise.all(tasks)
      expect(count).assertEqual(5)
      Done();
    })

    /**
     * @tc.name   PromiseStatusTest2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_STATUS_TEST_2400
     * @tc.desc   Verify PromiseStatus with deep nested allSettled 10 concurrent tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseStatusTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let allStatuses: string[] = []
      let deepNestedStatusTask: (id: number) => Promise<void> = async (id: number): Promise<void> => {
        let level1Results = await Promise.allSettled<string>([
          Promise.resolve(`level1_${id}`)
        ]);
        if (level1Results[0].status === PromiseStatus.fulfilled) {
          let level2Results = await Promise.allSettled<string>([
            Promise.resolve(`level2_${id}`)
          ]);
          if (level2Results[0].status === PromiseStatus.fulfilled) {
            allStatuses.push("nested_fulfilled");
          }
        }
      };
      let tasks: Promise<void>[] = []
      for (let i = 0; i < 10; i++) {
        tasks.push(deepNestedStatusTask(i))
      }
      await Promise.all(tasks)
      expect(allStatuses.length).assertEqual(10)
      Done();
    })

    /**
     * @tc.name   PromiseStatusTest2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_STATUS_TEST_2500
     * @tc.desc   Verify PromiseStatus in then chain with allSettled returning inner value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseStatusTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve("outer")
        .then<string>(() => {
          return Promise.allSettled<string>([Promise.resolve("inner")])
            .then<string>((results: PromiseSettledResult<string>[]) => {
              if (results[0].status === PromiseStatus.fulfilled) {
                return (results[0] as PromiseFulfilledResult<string>).value
              }
              return "error"
            })
        })
      expect(result).assertEqual("inner")
      Done();
    })


    /**
     * @tc.name   PromiseStatusTest2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_STATUS_TEST_2600
     * @tc.desc   Verify PromiseStatus with 3 concurrent allSettled then handlers using AtomicInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseStatusTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = new AtomicInt(0)
      let promises: Promise<void>[] = []
      for (let i = 0; i < 3; i++) {
        promises.push(
          Promise.allSettled<number>([Promise.resolve<number>(i * 1.0)])
            .then<void>((results: PromiseSettledResult<number>[]) => {
              if (results[0].status === PromiseStatus.fulfilled) {
                counter.fetchAdd(1)
              }
            }).catch((error: Error) => { expect(error instanceof Error).assertTrue(); expect().assertFail() })
        )
      }
      await Promise.all<void>(promises)
      expect(counter.load()).assertEqual(3)
      Done();
    })


    /**
     * @tc.name   PromiseStatusTest2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_STATUS_TEST_2700
     * @tc.desc   Verify PromiseStatus with 5 concurrent allSettled then handlers using AtomicInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseStatusTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = new AtomicInt(0)
      let promises: Promise<void>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(
          Promise.allSettled<number>([Promise.resolve<number>(i * 1.0)])
            .then<void>((results: PromiseSettledResult<number>[]) => {
              if (results[0].status === PromiseStatus.fulfilled) {
                counter.fetchAdd(1)
              }
            }).catch((error: Error) => { expect(error instanceof Error).assertTrue(); expect().assertFail() })
        )
      }
      await Promise.all<void>(promises)
      expect(counter.load()).assertEqual(5)
      Done();
    })


    /**
     * @tc.name   PromiseStatusTest2800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_STATUS_TEST_2800
     * @tc.desc   Verify PromiseStatus with 10 concurrent allSettled then handlers using AtomicInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseStatusTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = new AtomicInt(0)
      let promises: Promise<void>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(
          Promise.allSettled<number>([Promise.resolve<number>(i * 1.0)])
            .then<void>((results: PromiseSettledResult<number>[]) => {
              if (results[0].status === PromiseStatus.fulfilled) {
                counter.fetchAdd(1)
              }
            }).catch((error: Error) => { expect(error instanceof Error).assertTrue(); expect().assertFail() })
        )
      }
      await Promise.all<void>(promises)
      expect(counter.load()).assertEqual(10)
      Done();
    })


    /**
     * @tc.name   PromiseStatusTest2900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_STATUS_TEST_2900
     * @tc.desc   Verify PromiseStatus rejected with error message containing substring
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseStatusTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<string>(new Error("Error: Connection timeout"))
      let results = await Promise.allSettled<string>([promise])
      expect(results[0].status).assertEqual(PromiseStatus.rejected)
      let rejected = results[0] as PromiseRejectedResult
      expect(rejected.status).assertEqual("rejected")
      expect(rejected.reason instanceof Error).assertTrue()
      expect(rejected.reason.message).assertContain("Connection timeout")
      Done();
    })

    /**
     * @tc.name   PromiseStatusTest3000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_STATUS_TEST_3000
     * @tc.desc   Verify PromiseStatus with mixed 3 results counting fulfilled and rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseStatusTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = [
        Promise.resolve<string>("a"),
        Promise.reject<string>(new Error("b")),
        Promise.resolve<string>("c")
      ]
      let results = await Promise.allSettled<string>(promises)
      let fulfilledCount = 0
      let rejectedCount = 0
      for (let i = 0; i < results.length; i++) {
        if (results[i].status === PromiseStatus.fulfilled) fulfilledCount++
        else rejectedCount++
      }
      expect(fulfilledCount).assertEqual(2)
      expect(rejectedCount).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseStatusTest3100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_STATUS_TEST_3100
     * @tc.desc   Verify PromiseStatus with sequential allSettled calls both fulfilled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseStatusTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let level1Results = await Promise.allSettled<string>([
        Promise.resolve("level1")
      ])
      let level2Results = await Promise.allSettled<string>([
        Promise.resolve("level2")
      ])
      expect(level1Results[0].status).assertEqual(PromiseStatus.fulfilled)
      expect(level2Results[0].status).assertEqual(PromiseStatus.fulfilled)
      Done();
    })

    /**
     * @tc.name   PromiseStatusTest3200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_STATUS_TEST_3200
     * @tc.desc   Verify EAWorker.run job result resolves as fulfilled settled status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseStatusTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('statusWorker')
      eaWorker.start()
      try {
        let job = eaWorker.run<string>(() => {
          return "worker"
        })
        let result = job.Await()
        expect(result).assertEqual("worker")
        let results = await Promise.allSettled<string>([Promise.resolve<string>(result)])
        expect(results[0].status).assertEqual("fulfilled")
        expect((results[0] as PromiseFulfilledResult<string>).value).assertEqual("worker")
      } finally {
        eaWorker.join().Await()
      }
      Done();
    })


    /**
     * @tc.name   PromiseStatusTest3300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_STATUS_TEST_3300
     * @tc.desc   Verify EAWorker.run message tasks drive PromiseStatus counting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseStatusTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let processedCount = new AtomicInt(0)
      let eaWorker = new EAWorker('msgStatusWorker')
      eaWorker.start()
      try {
        let job1 = eaWorker.run<string>((msg: string): string => { return msg }, "msg1")
        let job2 = eaWorker.run<string>((msg: string): string => { return msg }, "msg2")
        let job3 = eaWorker.run<string>((msg: string): string => { return msg }, "msg3")
        let jr1 = job1.Await();
        let jr2 = job2.Await();
        let jr3 = job3.Await();
        let results = await Promise.allSettled<string>([
          Promise.resolve(jr1),
          Promise.resolve(jr2),
          Promise.resolve(jr3)
        ])
        for (let i = 0; i < results.length; i++) {
          if (results[i].status === PromiseStatus.fulfilled) {
            processedCount.fetchAdd(1)
          }
        }
        expect(processedCount.load()).assertEqual(3)
      } finally {
        eaWorker.join().Await()
      }
      Done();
    })

  })
}
