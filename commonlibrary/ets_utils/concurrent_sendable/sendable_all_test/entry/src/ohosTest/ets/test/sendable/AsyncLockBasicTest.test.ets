/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { BusinessError } from '@ohos.base';
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import { ArkTSUtils } from '@kit.ArkTS'
import Utils from '../utils'

@Sendable
class LockCounter {
  public count_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(lock_: ArkTSUtils.locks.AsyncLock) {
    this.lock_ = lock_
  }


  async increment(): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      this.count_++
      return this.count_
    })
  }

  async getCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.count_)
  }

  async reset(): Promise<void> {
    await this.lock_.lockAsync((error?: BusinessError): void => {
          if (error !== undefined) {
            console.info(`lock callback error: ${JSON.stringify(error)}`)
            return
          }

      this.count_ = 0
    })
  }
}

@Concurrent
function returnIdentity(value: number): number {
  return value
}

export default function AsyncLockBasicTest(): void {
  describe('AsyncLockBasicTest', (): void => {
    let counter: LockCounter

    beforeEach((): void => {
      counter = new LockCounter(new ArkTSUtils.locks.AsyncLock())
    })
    /**
     * @tc.name   testAsyncLockBasic0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASYNC_LOCK_BASIC_TEST_0100
     * @tc.desc   Verify AsyncLock single increment returns 1 and count is updated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncLockBasic0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const result: number = await counter.increment()
        expect(result).assertEqual(1)
        expect(await counter.getCount()).assertEqual(1)
      } catch (error) {
        console.error("testAsyncLockBasic0100 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testAsyncLockBasic0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASYNC_LOCK_BASIC_TEST_0200
     * @tc.desc   Verify AsyncLock sequential increments return cumulative count 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncLockBasic0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await counter.increment()
        const result: number = await counter.increment()
        expect(result).assertEqual(2)
      } catch (error) {
        console.error("testAsyncLockBasic0200 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testAsyncLockBasic0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASYNC_LOCK_BASIC_TEST_0300
     * @tc.desc   Verify AsyncLock two sequential increments return 1 then 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncLockBasic0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const result1: number = await counter.increment()
        const result2: number = await counter.increment()
        expect(result1).assertEqual(1)
        expect(result2).assertEqual(2)
      } catch (error) {
        console.error("testAsyncLockBasic0300 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testAsyncLockBasic0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASYNC_LOCK_BASIC_TEST_0400
     * @tc.desc   Verify AsyncLock two concurrent increments reach count 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAsyncLockBasic0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const promises: Promise<number>[] = []
        promises.push(counter.increment())
        promises.push(counter.increment())
        await Promise.all(promises)
        expect(await counter.getCount()).assertEqual(2)
      } catch (error) {
        console.error("testAsyncLockBasic0400 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testAsyncLockBasic0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASYNC_LOCK_BASIC_TEST_0500
     * @tc.desc   Verify AsyncLock five concurrent increments reach count 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAsyncLockBasic0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const promises: Promise<number>[] = []
        for (let i = 0; i < 5; i++) {
          promises.push(counter.increment())
        }
        await Promise.all(promises)
        expect(await counter.getCount()).assertEqual(5)
      } catch (error) {
        console.error("testAsyncLockBasic0500 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testAsyncLockBasic0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASYNC_LOCK_BASIC_TEST_0600
     * @tc.desc   Verify AsyncLock ten concurrent increments reach count 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAsyncLockBasic0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const promises: Promise<number>[] = []
        for (let i = 0; i < 10; i++) {
          promises.push(counter.increment())
        }
        await Promise.all(promises)
        expect(await counter.getCount()).assertEqual(10)
      } catch (error) {
        console.error("testAsyncLockBasic0600 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testAsyncLockBasic0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASYNC_LOCK_BASIC_TEST_0700
     * @tc.desc   Verify AsyncLock works after taskpool execute and ten increments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAsyncLockBasic0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const tasks: taskpool.Task[] = []
        for (let i = 0; i < 10; i++) {
          tasks.push(new taskpool.Task(returnIdentity, i))
        }
        const promises: Promise<Object>[] = []
        for (let i = 0; i < tasks.length; i++) {
          promises.push(taskpool.execute(tasks[i]))
        }
        await Promise.all(promises)
        for (let i = 0; i < 10; i++) {
          await counter.increment()
        }
        expect(await counter.getCount()).assertEqual(10)
      } catch (error) {
        console.error("testAsyncLockBasic0700 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testAsyncLockBasic0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASYNC_LOCK_BASIC_TEST_0800
     * @tc.desc   Verify AsyncLock remains usable after exception thrown inside lockAsync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAsyncLockBasic0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await counter.increment()
        let caught: boolean = false
        try {
          await counter.lock_.lockAsync((error?: BusinessError): void => {
            if (error !== undefined) {
              console.info(`lock callback error: ${JSON.stringify(error)}`)
              return
            }
            throw new Error('Test exception in lock')
          })
          expect().assertFail()
        } catch (e) {
          caught = true
          expect(e !== null && e !== undefined).assertTrue()
          if (e instanceof Error) {
            expect(e.message).assertEqual('Test exception in lock')
          } else {
            expect(false).assertFail()
          }
        }
        expect(caught).assertTrue()
        const result: number = await counter.increment()
        expect(result).assertEqual(2)
      } catch (error) {
        console.error("testAsyncLockBasic0800 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testAsyncLockBasic0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASYNC_LOCK_BASIC_TEST_0900
     * @tc.desc   Verify nested AsyncLock lockAsync callbacks execute correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAsyncLockBasic0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let nestedCount: number = 0
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
        const innerLock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
        await lock.lockAsync(async (error?: BusinessError): Promise<void> => {
          if (error !== undefined) {
            console.info(`lock callback error: ${JSON.stringify(error)}`)
            return
          }
          nestedCount++
          try {
            await innerLock.lockAsync((error?: BusinessError): void => {
              if (error !== undefined) {
                console.info(`lock callback error: ${JSON.stringify(error)}`)
                return
              }
              nestedCount++
            })
          } catch (error) {
            console.error(`testAsyncLockBasic0900 inner lock failed: ${JSON.stringify(error)}`)
            expect(false).assertFail()
          }
        })
        expect(nestedCount).assertEqual(2)
      } catch (error) {
        console.error("testAsyncLockBasic0900 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testAsyncLockBasic1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASYNC_LOCK_BASIC_TEST_1000
     * @tc.desc   Verify AsyncLock lockAsync returns callback result and acquires lock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAsyncLockBasic1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
        let acquired: boolean = false
        const result: boolean = await lock.lockAsync((error?: BusinessError): boolean => {
          if (error !== undefined) {
            console.info(`lock callback error: ${JSON.stringify(error)}`)
            return false
          }
          acquired = true
          return true
        })
        expect(result).assertTrue()
        expect(acquired).assertTrue()
      } catch (error) {
        console.error("testAsyncLockBasic1000 failed");
        expect(false).assertFail();
      }
      done();
    })
  })
}
