/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';

export default function AsyncConcurrencyTest(): void {
  describe('AsyncConcurrencyTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Promise.resolve()
    })

    /**
     * @tc.name   AsyncConcurrencyTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASYNC_CONCURRENCY_TEST_0100
     * @tc.desc   Verify Promise constructor creates a valid Promise object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncConcurrencyTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let promise: Promise<string> = new Promise<string>((resolve: (value: string) => void) => {
        resolve('created')
      })
      expect(promise instanceof Promise).assertTrue()
      let result: string = await promise
      expect(result).assertEqual('created')
    })

    /**
     * @tc.name   AsyncConcurrencyTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASYNC_CONCURRENCY_TEST_0200
     * @tc.desc   Verify Promise is in pending state after creation without resolve/reject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncConcurrencyTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let pendingPromise: Promise<void> = new Promise<void>(() => {})
      expect(pendingPromise instanceof Promise).assertTrue()
    })

    /**
     * @tc.name   AsyncConcurrencyTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASYNC_CONCURRENCY_TEST_0300
     * @tc.desc   Verify Promise transitions to fulfilled state after resolve
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncConcurrencyTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let fulfilledPromise: Promise<string> = new Promise<string>((resolve: (value: string) => void) => {
        resolve('fulfilled')
      })
      let result: string = await fulfilledPromise
      expect(result).assertEqual('fulfilled')
    })

    /**
     * @tc.name   AsyncConcurrencyTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASYNC_CONCURRENCY_TEST_0400
     * @tc.desc   Verify Promise transitions to rejected state after reject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncConcurrencyTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let rejectedPromise: Promise<void> = new Promise<void>((resolve: () => void, reject: (reason: Error) => void) => {
        reject(new Error('rejected'))
      })
      let caughtError1: boolean = false
      try {
        await rejectedPromise
        expect().assertFail()
      } catch (e) {
        caughtError1 = true
        
      }
      expect(caughtError1).assertTrue()
    })

    /**
     * @tc.name   AsyncConcurrencyTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASYNC_CONCURRENCY_TEST_0500
     * @tc.desc   Verify Promise.then with single parameter handles fulfilled state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncConcurrencyTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let promise: Promise<string> = Promise.resolve('value')
      let result: string = await promise.then((value: string): string => {
        return 'processed-' + value
      })
      expect(result).assertEqual('processed-value')
    })

    /**
     * @tc.name   AsyncConcurrencyTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASYNC_CONCURRENCY_TEST_0600
     * @tc.desc   Verify Promise.then with dual parameters handles fulfilled and rejected states
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncConcurrencyTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let successPromise: Promise<string> = Promise.resolve('success')
      let result1: string = await successPromise.then(
        (value: string): string => 'ok-' + value,
        (error: Error): string => 'err-' + error.message
      )
      expect(result1).assertEqual('ok-success')

      let failPromise: Promise<string> = Promise.reject(new Error('fail'))
      let result2: string = await failPromise.then(
        (value: string): string => 'ok-' + value,
        (error: Error): string => 'err-' + error.message
      )
      expect(result2).assertEqual('err-fail')
    })

    /**
     * @tc.name   AsyncConcurrencyTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASYNC_CONCURRENCY_TEST_0700
     * @tc.desc   Verify Promise.catch captures rejected state exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncConcurrencyTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let promise: Promise<string> = Promise.reject(new Error('catch error'))
      let result: string = await promise.catch((error: Error): string => {
        return 'caught-' + error.message
      })
      expect(result).assertEqual('caught-catch error')
    })

    /**
     * @tc.name   AsyncConcurrencyTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASYNC_CONCURRENCY_TEST_0800
     * @tc.desc   Verify Promise.finally executes regardless of success or failure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncConcurrencyTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let finallyExecuted: boolean = false

      let successPromise: Promise<string> = Promise.resolve('success')
      await successPromise.finally((): void => {
        finallyExecuted = true
      })
      expect(finallyExecuted).assertTrue()

      finallyExecuted = false
      let failPromise: Promise<string> = Promise.reject(new Error('fail'))
      try {
        await failPromise.finally((): void => {
          finallyExecuted = true
        })
      } catch (e) {
        // expected rejection
      }
      expect(finallyExecuted).assertTrue()
    })

    /**
     * @tc.name   AsyncConcurrencyTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASYNC_CONCURRENCY_TEST_0900
     * @tc.desc   Verify async function declaration returns a Promise object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncConcurrencyTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let asyncFunction = async (): Promise<string> => {
        return 'async result'
      }
      let promise: Promise<string> = asyncFunction()
      expect(promise instanceof Promise).assertTrue()
      let result: string = await promise
      expect(result).assertEqual('async result')
    })

    /**
     * @tc.name   AsyncConcurrencyTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASYNC_CONCURRENCY_TEST_1000
     * @tc.desc   Verify await pauses execution until Promise resolves
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncConcurrencyTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let asyncFunction = async (): Promise<string> => {
        await Promise.resolve()
        return 'awaited result'
      }
      let result: string = await asyncFunction()
      expect(result).assertEqual('awaited result')
    })

    /**
     * @tc.name   AsyncConcurrencyTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASYNC_CONCURRENCY_TEST_1100
     * @tc.desc   Verify async function exception triggers Promise rejected state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncConcurrencyTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let throwingAsync = async (): Promise<void> => {
        throw new Error('async throw')
      }
      let caughtError2: boolean = false
      try {
        await throwingAsync()
        expect().assertFail()
      } catch (e) {
        caughtError2 = true
        
      }
      expect(caughtError2).assertTrue()
    })

    /**
     * @tc.name   AsyncConcurrencyTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASYNC_CONCURRENCY_TEST_1200
     * @tc.desc   Verify try/catch captures await exception inside async function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncConcurrencyTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let caughtError: boolean = false
      try {
        await Promise.reject(new Error('await error'))
        expect().assertFail()
      } catch (e) {
        caughtError = true
        
      }
      expect(caughtError).assertTrue()
    })

    /**
     * @tc.name   AsyncConcurrencyTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASYNC_CONCURRENCY_TEST_1300
     * @tc.desc   Verify multiple await statements execute sequentially
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncConcurrencyTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let executionOrder: number[] = []
      let sequentialAsync = async (): Promise<number[]> => {
        executionOrder.push(1)
        await Promise.resolve()
        executionOrder.push(2)
        await Promise.resolve()
        executionOrder.push(3)
        return executionOrder
      }
      let result: number[] = await sequentialAsync()
      expect(result.length).assertEqual(3)
      expect(result[0]).assertEqual(1)
      expect(result[1]).assertEqual(2)
      expect(result[2]).assertEqual(3)
    })
  })
}
