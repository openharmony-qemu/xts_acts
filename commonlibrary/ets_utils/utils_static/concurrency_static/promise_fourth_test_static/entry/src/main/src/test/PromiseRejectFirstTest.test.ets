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

export default function BuiltinsPromiseRejectFirstTest(): void {
  describe('BuiltinsPromiseRejectFirstTest', (): void => {
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
     * @tc.name   PromiseRejectFirstTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_0100
     * @tc.desc   Verify Promise.reject without argument returns Promise instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectFirstTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject()
      let caught: boolean = false
      try {
        await promise
        expect().assertFail()
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_0200
     * @tc.desc   Verify Promise.reject with void argument returns Promise instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectFirstTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject<void>(new Error())
      let caught: boolean = false
      try {
        await promise
        expect().assertFail()
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_0300
     * @tc.desc   Verify Promise.reject returns Promise with then and catch methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectFirstTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject()
      let thenResult = promise.catch<void>(() => {}).then<void>(() => {})
      let catchResult = promise.catch<void>(() => {})
      let caught: boolean = false
      try {
        await promise
        expect().assertFail()
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_0400
     * @tc.desc   Verify Promise.reject triggers catch handler asynchronously
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectFirstTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject()
      let rejected = false
      promise.catch(() => {
        rejected = true
      })
      await new Promise<void>(resolve => { setTimeout(() => resolve(undefined), 100) })
      expect(rejected).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_0500
     * @tc.desc   Verify Promise.reject error is Error instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectFirstTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let caught: boolean = false
      try {
        await Promise.reject()
        expect().assertFail()
      } catch (error) {
        caught = true
        expect(error instanceof Error).assertTrue()
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_0600
     * @tc.desc   Verify Promise.reject rejection is catchable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectFirstTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let caught: boolean = false
      try {
        await Promise.reject()
        expect().assertFail()
      } catch (error) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_0700
     * @tc.desc   Verify Promise.reject rejection is catchable for Error reason
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectFirstTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let caught: boolean = false
      try {
        await Promise.reject()
        expect().assertFail()
      } catch (error) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_0800
     * @tc.desc   Verify Promise.reject rejection is catchable with Error instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectFirstTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      try {
        await Promise.reject()
        expect().assertFail()
      } catch (error) {
        expect(error instanceof Error).assertTrue()
      }
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_0900
     * @tc.desc   Verify Promise.reject rejection is catchable via await
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectFirstTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise: Promise<void> = Promise.reject()
      let caught: boolean = false
      try {
        await promise
        expect().assertFail()
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_1000
     * @tc.desc   Verify Promise.reject rejection is caught with error delivered
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectFirstTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let caught: boolean = false
      try {
        await Promise.reject()
        expect().assertFail()
      } catch (error) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_1100
     * @tc.desc   Verify Promise.reject catch handler receives Error instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectFirstTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let caught = false
      let caughtError: Error | null = null
      let promise = Promise.reject()
      promise.catch((error) => {
        caught = true
        caughtError = error
      })
      while (!caught) {
        await new Promise<void>(r => { setTimeout(() => r(undefined), 100) })
      }
      expect(caught).assertTrue()
      expect(caughtError instanceof Error).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_1200
     * @tc.desc   Verify Promise.reject then onRejected handler receives Error instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectFirstTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let rejected = false
      let promise = Promise.reject()
      promise.then(
        () => {},
        (error) => {
          rejected = true
          expect(error instanceof Error).assertTrue()
        }
      )
      while (!rejected) {
        await new Promise<void>(r => { setTimeout(() => r(undefined), 100) })
      }
      expect(rejected).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_1300
     * @tc.desc   Verify Promise.reject caught error is Error instance with caught flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectFirstTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let caught = false
      let errorCaught: boolean = false
      try {
        await Promise.reject()
        expect().assertFail()
      } catch (error) {
        caught = true
        errorCaught = true
        expect(error instanceof Error).assertTrue()
      }
      expect(errorCaught).assertTrue()
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_1400
     * @tc.desc   Verify Promise.reject Error rejection is catchable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectFirstTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject(new Error('err'))
      let caught: boolean = false
      try {
        await promise
        expect().assertFail()
      } catch (error) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_1500
     * @tc.desc   Verify Promise.reject in async function returns Error with empty message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectFirstTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let testReject: () => Promise<void> = async (): Promise<void> => {
        let caught: boolean = false
        try {
          await Promise.reject();
          expect().assertFail();
        } catch (error) {
          caught = true
        }
        expect(caught).assertTrue()
      };
      await testReject()
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_1600
     * @tc.desc   Verify Promise.reject vs thrown Error both have empty message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectFirstTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let throwEmptyError: () => Promise<void> = async (): Promise<void> => {
        throw new Error();
      };
      let promise1 = Promise.reject()
      let promise2 = throwEmptyError()
      let caught: boolean = false
      try {
        await promise1
        expect().assertFail()
      } catch (e1) {
      caught = true
}
      expect(caught).assertTrue()
      caught = false
      try {
        await promise2
        expect().assertFail()
      } catch (e2) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_1700
     * @tc.desc   Verify Promise.reject with catch and then chain recovers value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectFirstTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let caught: boolean = false
      let promise = Promise.reject()
      let result = await promise
        .catch((error) => {
          expect(error instanceof Error).assertTrue()
          caught = true
          return "recovered"
        })
        .then((value) => {
          return value + " success"
        })
      expect(caught).assertTrue()
      expect(result).assertEqual("recovered success")
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_1800
     * @tc.desc   Verify Promise.reject first catch handles error and second catch is skipped
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectFirstTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject()
      let firstCatch = false
      let secondCatch = false
      await promise
        .catch((error) => {
          expect(error instanceof Error).assertTrue()
          firstCatch = true
          return "handled"
        })
        .catch(() => {
          secondCatch = true
        })
      expect(firstCatch).assertTrue()
      expect(secondCatch).assertFalse()
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_1900
     * @tc.desc   Verify Promise.reject with finally executes callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectFirstTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject()
      let finallyExecuted = false
      let caught: boolean = false
      try {
        await promise.finally(() => {
          finallyExecuted = true
        })
      } catch (error) {
        caught = true
      }
      expect(caught).assertTrue()
      expect(finallyExecuted).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_2000
     * @tc.desc   Verify Promise.reject with Promise.all rejects on first rejection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectFirstTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let caught: boolean = false
      try {
        await Promise.all([
          Promise.resolve(1),
          Promise.reject(),
          Promise.resolve(3)
        ])
        expect().assertFail()
      } catch (error) {
        caught = true
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_2100
     * @tc.desc   Verify Promise.reject with Promise.allSettled returns mixed results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectFirstTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let results = await Promise.allSettled([
        Promise.resolve(1),
        Promise.reject(),
        Promise.resolve(3)
      ])
      expect(results.length).assertEqual(3)
      expect(results[0].status).assertEqual("fulfilled")
      expect((results[0] as PromiseFulfilledResult<int>).value).assertEqual(1)
      expect(results[1].status).assertEqual("rejected")
      expect((results[1] as PromiseRejectedResult).reason instanceof Error).assertTrue()
      expect(results[2].status).assertEqual("fulfilled")
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_2200
     * @tc.desc   Verify Promise.reject with Promise.race rejects immediately
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectFirstTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let caught: boolean = false
      try {
        await Promise.race([
          new Promise<string>(resolve => { setTimeout(() => resolve("slow"), 200) }),
          Promise.reject(),
        ])
        expect().assertFail()
      } catch (error) {
        caught = true
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_2300
     * @tc.desc   Verify Promise.reject with Promise.any returns first resolved value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectFirstTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result = await Promise.any([
        Promise.reject(),
        Promise.resolve("success"),
        Promise.reject()
      ])
      expect(result).assertEqual("success")
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_2400
     * @tc.desc   Verify Promise.reject with Promise.any all rejected throws AggregateError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectFirstTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      try {
        await Promise.any([
          Promise.reject(),
          Promise.reject(),
          Promise.reject()
        ])
        expect().assertFail()
      } catch (error) {
        expect(error instanceof AggregateError).assertTrue()
        if (error instanceof AggregateError) {
          expect(error.errors.length).assertEqual(3)
        }
      }
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_2500
     * @tc.desc   Verify Promise.reject catch handler executes as microtask after sync code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectFirstTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let order: string[] = []
      let count = 0
      order.push("sync1")
      Promise.reject().catch(() => {
        order.push("microtask")
        count++
      })
      order.push("sync2")
      while (count < 1) {
        await new Promise<void>(r => { setTimeout(() => r(undefined), 100) })
      }
      expect(order[0]).assertEqual("sync1")
      expect(order[1]).assertEqual("sync2")
      expect(order[2]).assertEqual("microtask")
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_2600
     * @tc.desc   Verify Promise.reject multiple catch handlers execute in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectFirstTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let order: number[] = []
      let count = 0
      Promise.reject().catch(() => { order.push(1); count++ })
      Promise.reject().catch(() => { order.push(2); count++ })
      Promise.reject().catch(() => { order.push(3); count++ })
      while (count < 3) {
        await new Promise<void>(r => { setTimeout(() => r(undefined), 100) })
      }
      expect(order[0]).assertEqual(1)
      expect(order[1]).assertEqual(2)
      expect(order[2]).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_2700
     * @tc.desc   Verify Promise.reject with Promise.allSettled catches all rejections
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectFirstTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises = [
        Promise.reject(),
        Promise.reject(),
        Promise.reject()
      ]
      let caughtCount = 0
      await Promise.allSettled(promises.map(p =>
        p.catch((error) => {
          expect(error instanceof Error).assertTrue()
          caughtCount++
        })
      ))
      expect(caughtCount).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest2800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_2800
     * @tc.desc   Verify Promise.reject void rejection is catchable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectFirstTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let voidPromise: Promise<void> = Promise.reject()
      let caught: boolean = false
      try {
        await voidPromise
        expect().assertFail()
      } catch (error) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest2900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_2900
     * @tc.desc   Verify Promise.reject handled by generic async wrapper returns Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectFirstTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let handlePromise: (promise: Promise<void>) => Promise<Error> =
        async (promise: Promise<void>): Promise<Error> => {
          try {
            await promise;
            return new Error("no error");
          } catch (error) {
            return error;
          }
        };
      let result = await handlePromise(Promise.reject())
      expect(result instanceof Error).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest3000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_3000
     * @tc.desc   Verify Promise.reject inferred type matches explicit void type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectFirstTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let explicit: Promise<void> = Promise.reject()
      explicit.catch((): void => {})
      let inferred = Promise.reject()
      let check: Promise<void> = inferred
      let caught: boolean = false
      try {
        await inferred
        expect().assertFail()
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest3100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_3100
     * @tc.desc   Verify Promise.reject rejection is catchable for empty-message reason
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectFirstTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let caught: boolean = false
      try {
        await Promise.reject()
        expect().assertFail()
      } catch (error) {
      caught = true
}
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest3200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_3200
     * @tc.desc   Verify Promise.reject error properties can be modified after catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectFirstTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let caught: boolean = false
      try {
        await Promise.reject()
        expect().assertFail()
      } catch (error) {
        error.message = "custom message"
        error.name = "CustomError"
        caught = true
        expect(error instanceof Error).assertTrue()
        expect(error.message).assertEqual("custom message")
        expect(error.name).assertEqual("CustomError")
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest3300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_3300
     * @tc.desc   Verify Promise.reject multiple catch handlers on same Promise all execute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectFirstTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject()
      let count = 0
      promise.catch((error) => {
        expect(error instanceof Error).assertTrue()
        count++
      })
      promise.catch((error) => {
        expect(error instanceof Error).assertTrue()
        count++
      })
      while (count < 2) {
        await new Promise<void>(r => { setTimeout(() => r(undefined), 100) })
      }
      expect(count).assertEqual(2)
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest3400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_3400
     * @tc.desc   Verify two Promise.reject calls create distinct rejected Promise instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectFirstTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.reject()
      let promise2 = Promise.reject()
      expect(promise1 !== promise2).assertTrue()
      let reason1 = await promise1.then(
        (): number => 1,
        (): number => -1
      )
      let reason2 = await promise2.then(
        (): number => 1,
        (): number => -2
      )
      expect(reason1).assertEqual(-1)
      expect(reason2).assertEqual(-2)
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest3500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_3500
     * @tc.desc   Verify Promise.reject catch throwing new error propagates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectFirstTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject()
      let caught: boolean = false
      try {
        await promise.catch((error) => {
          expect(error instanceof Error).assertTrue()
          throw new Error("new error from catch")
        })
        expect().assertFail()
      } catch (error) {
        caught = true
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest3600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_3600
     * @tc.desc   Verify Promise.reject then onRejected throwing new error propagates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectFirstTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = Promise.reject()
      let caught: boolean = false
      try {
        await promise.then(
          () => {},
          (error) => {
            expect(error instanceof Error).assertTrue()
            throw new Error("error from onRejected")
          }
        )
        expect().assertFail()
      } catch (error) {
        caught = true
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest3700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_3700
     * @tc.desc   Verify Promise.reject then returns new Promise instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectFirstTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.reject()
      let promise2 = promise1.then(() => {}, () => {})
      expect(promise1 === promise2).assertFalse()
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest3800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_3800
     * @tc.desc   Verify Promise.reject catch returns new Promise instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseRejectFirstTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise1 = Promise.reject()
      let promise2 = promise1.catch(() => {})
      expect(promise1 === promise2).assertFalse()
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest3900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_3900
     * @tc.desc   Verify Promise.reject catch recovers with string value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectFirstTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result = await Promise.reject()
        .catch(() => "recovered")
      expect(result).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest4000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_4000
     * @tc.desc   Verify Promise.reject catch chaining with re-thrown error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectFirstTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result = await Promise.reject()
        .catch(() => { throw new Error("chained error") })
        .catch((error) => {
          expect(error instanceof Error).assertTrue();
          return "caught"
        })
      expect(result).assertEqual("caught")
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest4100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_4100
     * @tc.desc   Verify Promise.reject catch with finally executes callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectFirstTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let finallyCalled = false
      let result = await Promise.reject()
        .catch(() => "value")
        .finally(() => { finallyCalled = true })
      expect(result).assertEqual("value")
      expect(finallyCalled).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest4200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_4200
     * @tc.desc   Verify Promise.reject with Promise.allSettled returns all rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectFirstTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let results = await Promise.allSettled([
        Promise.reject(),
        Promise.reject(),
        Promise.reject()
      ])
      expect(results.length).assertEqual(3)
      expect(results[0].status).assertEqual("rejected")
      expect(results[1].status).assertEqual("rejected")
      expect(results[2].status).assertEqual("rejected")
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest4300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_4300
     * @tc.desc   Verify Promise.reject with Promise.any returns resolved value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectFirstTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result = await Promise.any([
        Promise.reject(),
        Promise.resolve("only success")
      ])
      expect(result).assertEqual("only success")
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest4400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_4400
     * @tc.desc   Verify Promise.reject with Promise.race and catch returns caught value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectFirstTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result = await Promise.race([
        Promise.reject().catch(() => "caught"),
        new Promise<string>(resolve => { setTimeout(() => resolve("delayed"), 200) })
      ])
      expect(result).assertEqual("caught")
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest4500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_4500
     * @tc.desc   Verify Promise.reject with Promise.all and catch handles 10 rejections
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectFirstTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promises: Promise<void>[] = []
      let handledCount = new AtomicInt(0)
      for (let i = 0; i < 10; i++) {
        promises.push(Promise.reject().catch(() => { handledCount.fetchAdd(1) }))
      }
      await Promise.all(promises)
      expect(promises.length).assertEqual(10)
      expect(handledCount.load()).assertEqual(10)
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest4600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_4600
     * @tc.desc   Verify Promise.reject catch-then chain concatenates string values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectFirstTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result = await Promise.reject()
        .catch(() => "first")
        .then((v) => v + " second")
        .then((v) => v + " third")
      expect(result).assertEqual("first second third")
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest4700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_4700
     * @tc.desc   Verify Promise.reject catch returns async recovered value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectFirstTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result = await Promise.reject()
        .catch(() => { return Promise.resolve("async recovered") })
      expect(result).assertEqual("async recovered")
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest4800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_4800
     * @tc.desc   Verify Promise.reject catch re-rejects and second catch handles it
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectFirstTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result = await Promise.reject()
        .catch(() => { return Promise.reject(new Error("re-reject")) })
        .catch((error) => {
          expect(error instanceof Error).assertTrue();
          return "caught"
        })
      expect(result).assertEqual("caught")
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest4900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_4900
     * @tc.desc   Verify Promise.reject with finally propagates rejection after callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectFirstTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let finallyCalled = false
      let caught: boolean = false
      try {
        await Promise.reject().finally(() => { finallyCalled = true })
      } catch (error) {
        caught = true
      }
      expect(caught).assertTrue()
      expect(finallyCalled).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest5000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_5000
     * @tc.desc   Verify Promise.reject catch-then-finally chain transforms value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectFirstTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.reject<string>(new Error("test"))
        .catch<string>(() => "recovered")
        .then<string>((v: string) => v.toUpperCase())
        .finally(() => {})
      expect(result).assertEqual("RECOVERED")
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest5100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_5100
     * @tc.desc   Verify Promise.reject with Promise.allSettled returns mixed resolved and rejected results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectFirstTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let results = await Promise.allSettled([
        Promise.reject(),
        Promise.resolve(1),
        Promise.reject(),
        Promise.resolve(2)
      ])
      expect(results.length).assertEqual(4)
      expect(results[0].status).assertEqual("rejected")
      expect(results[1].status).assertEqual("fulfilled")
      expect(results[2].status).assertEqual("rejected")
      expect(results[3].status).assertEqual("fulfilled")
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest5200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_5200
     * @tc.desc   Verify Promise.reject with Promise.any returns last resolved value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectFirstTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.any([
        Promise.reject(),
        Promise.reject(),
        Promise.resolve("last success")
      ])
      expect(result).assertEqual("last success")
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest5300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_5300
     * @tc.desc   Verify Promise.reject in loop with 100 iterations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectFirstTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let count = 0
      for (let i = 0; i < 100; i++) {
        await Promise.reject().catch(() => {})
        count++
      }
      expect(count).assertEqual(100)
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest5400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_5400
     * @tc.desc   Verify Promise.reject catch recovers with number 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectFirstTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.reject()
        .catch(() => 0)
      expect(result).assertEqual(0)
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest5500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_5500
     * @tc.desc   Verify Promise.reject catch recovers with boolean false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectFirstTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.reject()
        .catch(() => false)
      expect(result).assertFalse()
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest5600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_5600
     * @tc.desc   Verify Promise.reject catch recovers with empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectFirstTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.reject()
        .catch(() => "")
      expect(result).assertEqual("")
      Done();
    })

    /**
     * @tc.name   PromiseRejectFirstTest5700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_REJECT_FIRST_TEST_5700
     * @tc.desc   Verify Promise.reject catch recovers with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRejectFirstTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.reject()
        .catch(() => null)
      expect(result).assertEqual(null)
      Done();
    })
  })
}
