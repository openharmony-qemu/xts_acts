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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
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
    await this.lock_.lockAsync((): void => {
      this.count_ = 0
    })
  }
}

@Concurrent
function returnIdentity(value: number): number {
  return value
}

export default function BuiltinsAsyncLockBasicTest(): void {
  describe('BuiltinsAsyncLockBasicTest', (): void => {
    let counter: LockCounter

    beforeAll((): void => {})
    beforeEach((): void => {
      counter = new LockCounter(new ArkTSUtils.locks.AsyncLock())
    })
    afterEach((): void => {})
    afterAll((): void => {})

    /**
     * @tc.name   BuiltinsAsyncLockBasicTest0100
     * @tc.number SUB_BUILTINS_ASYNC_LOCK_BASIC_TEST_0100
     * @tc.desc   Verify AsyncLock single increment returns 1 and count is updated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsAsyncLockBasicTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: number = await counter.increment()
      expect(result).assertEqual(1)
      expect(await counter.getCount()).assertEqual(1)
    })

    /**
     * @tc.name   BuiltinsAsyncLockBasicTest0200
     * @tc.number SUB_BUILTINS_ASYNC_LOCK_BASIC_TEST_0200
     * @tc.desc   Verify AsyncLock sequential increments return cumulative count 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsAsyncLockBasicTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await counter.increment()
      const result: number = await counter.increment()
      expect(result).assertEqual(2)
    })

    /**
     * @tc.name   BuiltinsAsyncLockBasicTest0300
     * @tc.number SUB_BUILTINS_ASYNC_LOCK_BASIC_TEST_0300
     * @tc.desc   Verify AsyncLock two sequential increments return 1 then 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsAsyncLockBasicTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result1: number = await counter.increment()
      const result2: number = await counter.increment()
      expect(result1).assertEqual(1)
      expect(result2).assertEqual(2)
    })

    /**
     * @tc.name   BuiltinsAsyncLockBasicTest0400
     * @tc.number SUB_BUILTINS_ASYNC_LOCK_BASIC_TEST_0400
     * @tc.desc   Verify AsyncLock two concurrent increments reach count 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsyncLockBasicTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promises: Promise<number>[] = []
      promises.push(counter.increment())
      promises.push(counter.increment())
      await Promise.all(promises)
      expect(await counter.getCount()).assertEqual(2)
    })

    /**
     * @tc.name   BuiltinsAsyncLockBasicTest0500
     * @tc.number SUB_BUILTINS_ASYNC_LOCK_BASIC_TEST_0500
     * @tc.desc   Verify AsyncLock five concurrent increments reach count 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsyncLockBasicTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promises: Promise<number>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(counter.increment())
      }
      await Promise.all(promises)
      expect(await counter.getCount()).assertEqual(5)
    })

    /**
     * @tc.name   BuiltinsAsyncLockBasicTest0600
     * @tc.number SUB_BUILTINS_ASYNC_LOCK_BASIC_TEST_0600
     * @tc.desc   Verify AsyncLock ten concurrent increments reach count 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsAsyncLockBasicTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const promises: Promise<number>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(counter.increment())
      }
      await Promise.all(promises)
      expect(await counter.getCount()).assertEqual(10)
    })

    /**
     * @tc.name   BuiltinsAsyncLockBasicTest0700
     * @tc.number SUB_BUILTINS_ASYNC_LOCK_BASIC_TEST_0700
     * @tc.desc   Verify AsyncLock works after taskpool execute and ten increments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsAsyncLockBasicTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
    })

    /**
     * @tc.name   BuiltinsAsyncLockBasicTest0800
     * @tc.number SUB_BUILTINS_ASYNC_LOCK_BASIC_TEST_0800
     * @tc.desc   Verify AsyncLock remains usable after exception thrown inside lockAsync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsyncLockBasicTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await counter.increment()
      let caught: boolean = false
      try {
        await counter.lock_.lockAsync((): void => {
          throw new Error('Test exception in lock')
        })
        expect().assertFail()
      } catch (e) {
        caught = true
        expect(e !== null && e !== undefined).assertTrue()
        const err: Error = e as Error
        expect(err.message).assertEqual('Test exception in lock')
      }
      expect(caught).assertTrue()
      const result: number = await counter.increment()
      expect(result).assertEqual(2)
    })

    /**
     * @tc.name   BuiltinsAsyncLockBasicTest0900
     * @tc.number SUB_BUILTINS_ASYNC_LOCK_BASIC_TEST_0900
     * @tc.desc   Verify nested AsyncLock lockAsync callbacks execute correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsAsyncLockBasicTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let nestedCount: number = 0
      const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
      const innerLock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
      await lock.lockAsync(async (): Promise<void> => {
        nestedCount++
        await innerLock.lockAsync((): void => {
          nestedCount++
        })
      })
      expect(nestedCount).assertEqual(2)
    })

    /**
     * @tc.name   BuiltinsAsyncLockBasicTest1000
     * @tc.number SUB_BUILTINS_ASYNC_LOCK_BASIC_TEST_1000
     * @tc.desc   Verify AsyncLock lockAsync returns callback result and acquires lock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsAsyncLockBasicTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
      let acquired: boolean = false
      const result: boolean = await lock.lockAsync((): boolean => {
        acquired = true
        return true
      })
      expect(result).assertTrue()
      expect(acquired).assertTrue()
    })
  })
}
