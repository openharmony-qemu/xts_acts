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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import { ArkTSUtils, collections } from '@kit.ArkTS'
import Utils from '../utils'

@Sendable
class SlidingWindowRecord {
  public timestamp: number = 0
  public success: boolean = false
}

@Sendable
class SlidingWindowLimiter {
  public windowSize_: number = 1000
  public maxRequests_: number = 0
  public records_: collections.Array<SlidingWindowRecord>

  public lock_: ArkTSUtils.locks.AsyncLock


  constructor(windowSize: number, maxRequests: number, records_: collections.Array<SlidingWindowRecord>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.records_ = records_
    this.lock_ = lock_

    this.windowSize_ = windowSize
    this.maxRequests_ = maxRequests
  }

  private cleanExpiredRecords(): void {
    const now: number = Date.now()
    const windowStart: number = now - this.windowSize_
    let i: number = 0
    while (i < this.records_.length) {
      if (this.records_[i].timestamp < windowStart) {
        this.records_.splice(i, 1)
      } else {
        i++
      }
    }
  }

  async tryAcquire(): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => {
      this.cleanExpiredRecords()
      if (this.records_.length < this.maxRequests_) {
        const record: SlidingWindowRecord = new SlidingWindowRecord()
        record.timestamp = Date.now()
        record.success = true
        this.records_.push(record)
        return true
      }
      const record: SlidingWindowRecord = new SlidingWindowRecord()
      record.timestamp = Date.now()
      record.success = false
      this.records_.push(record)
      return false
    })
  }

  getRecordCount(): number {
    return this.records_.length
  }

  getSuccessCount(): number {
    let count: number = 0
    for (let i = 0; i < this.records_.length; i++) {
      if (this.records_[i].success) {
        count++
      }
    }
    return count
  }

  getWindowSize(): number {
    return this.windowSize_
  }

  getMaxRequests(): number {
    return this.maxRequests_
  }

  getLastRecord(): SlidingWindowRecord | undefined {
    if (this.records_.length === 0) return undefined
    return this.records_[this.records_.length - 1]
  }
}

@Sendable
class SlidingWindowManager {
  public limiters_: collections.Map<string, SlidingWindowLimiter>

  public lock_: ArkTSUtils.locks.AsyncLock

  public totalRequests_: collections.Map<string, number>

  public totalSuccess_: collections.Map<string, number>

  public emptyRecordsPool_: collections.Array<collections.Array<SlidingWindowRecord>>

  constructor(limiters_: collections.Map<string, SlidingWindowLimiter>, lock_: ArkTSUtils.locks.AsyncLock, totalRequests_: collections.Map<string, number>, totalSuccess_: collections.Map<string, number>, emptyRecordsPool_: collections.Array<collections.Array<SlidingWindowRecord>>) {
    this.limiters_ = limiters_
    this.lock_ = lock_
    this.totalRequests_ = totalRequests_
    this.totalSuccess_ = totalSuccess_
    this.emptyRecordsPool_ = emptyRecordsPool_
  }


  async createLimiter(name: string, windowSize: number, maxRequests: number): Promise<SlidingWindowLimiter> {
    return await this.lock_.lockAsync((): SlidingWindowLimiter => {
      if (!this.limiters_.has(name)) {
        const emptyRecords: collections.Array<SlidingWindowRecord> = this.emptyRecordsPool_.pop()!
        const limiter: SlidingWindowLimiter = new SlidingWindowLimiter(windowSize, maxRequests, emptyRecords, this.lock_)
        this.limiters_.set(name, limiter)
        this.totalRequests_.set(name, 0)
        this.totalSuccess_.set(name, 0)
      }
      return this.limiters_.get(name)!
    })
  }

  async request(name: string): Promise<boolean> {
    const limiter: SlidingWindowLimiter | undefined = this.limiters_.get(name)
    if (limiter === undefined) {
      return false
    }

    await this.lock_.lockAsync((): void => {
      const reqCount: number = this.totalRequests_.get(name) ?? 0
      this.totalRequests_.set(name, reqCount + 1)
    })

    const result: boolean = await limiter.tryAcquire()

    if (result) {
      await this.lock_.lockAsync((): void => {
        const successCount: number = this.totalSuccess_.get(name) ?? 0
        this.totalSuccess_.set(name, successCount + 1)
      })
    }
    return result
  }

  getTotalRequests(name: string): number {
    return this.totalRequests_.get(name) ?? 0
  }

  getTotalSuccess(name: string): number {
    return this.totalSuccess_.get(name) ?? 0
  }

  getLimiter(name: string): SlidingWindowLimiter | undefined {
    return this.limiters_.get(name)
  }
}

@Concurrent
async function slidingWindowRequestTask(manager: SlidingWindowManager, name: string): Promise<void> {
  await manager.request(name)
}

function executeTasksGetObjects(tasks: taskpool.Task[]): Promise<Object[]> {
  const promises: Promise<Object>[] = []
  for (let i: number = 0; i < tasks.length; i++) {
    promises.push(taskpool.execute(tasks[i]))
  }
  return Promise.all(promises)
}

export default function BuiltinsSlidingWindowLimiterTest(): void {
  describe('BuiltinsSlidingWindowLimiterTest', (): void => {
    const emptyRecordsPool: collections.Array<collections.Array<SlidingWindowRecord>> = new collections.Array<collections.Array<SlidingWindowRecord>>()
    for (let i = 0; i < 30; i++) {
      emptyRecordsPool.push(new collections.Array<SlidingWindowRecord>())
    }
    const manager: SlidingWindowManager = new SlidingWindowManager(new collections.Map<string, SlidingWindowLimiter>(), new ArkTSUtils.locks.AsyncLock(), new collections.Map<string, number>(), new collections.Map<string, number>(), emptyRecordsPool)

    beforeEach(async (): Promise<void> => {
      await manager.lock_.lockAsync((): void => {
        manager.limiters_.clear()
        manager.totalRequests_.clear()
        manager.totalSuccess_.clear()
      })
    })

    /**
     * @tc.name   testSlidingWindowLimiter0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SLIDINGWINDOWLIMITER_TEST_0100
     * @tc.desc   Verify testSlidingWindowLimiter0100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSlidingWindowLimiter0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const limiter: SlidingWindowLimiter = await manager.createLimiter('test_window', 1000, 5)
      expect(limiter.getWindowSize()).assertEqual(1000)
      expect(limiter.getMaxRequests()).assertEqual(5)
    })

    /**
     * @tc.name   testSlidingWindowLimiter0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SLIDINGWINDOWLIMITER_TEST_0200
     * @tc.desc   Verify testSlidingWindowLimiter0200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSlidingWindowLimiter0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      await manager.createLimiter('basic_window', 1000, 3)

      const r1: boolean = await manager.request('basic_window')
      const r2: boolean = await manager.request('basic_window')

      expect(r1).assertTrue()
      expect(r2).assertTrue()
    })

    /**
     * @tc.name   testSlidingWindowLimiter0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SLIDINGWINDOWLIMITER_TEST_0300
     * @tc.desc   Verify testSlidingWindowLimiter0300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSlidingWindowLimiter0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      await manager.createLimiter('reject_window', 1000, 2)

      await manager.request('reject_window')
      await manager.request('reject_window')
      const r3: boolean = await manager.request('reject_window')

      expect(r3).assertFalse()
    })

    /**
     * @tc.name   testSlidingWindowLimiter0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SLIDINGWINDOWLIMITER_TEST_0400
     * @tc.desc   Verify testSlidingWindowLimiter0400 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSlidingWindowLimiter0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      await manager.createLimiter('count_window', 1000, 2)

      await manager.request('count_window')
      await manager.request('count_window')
      await manager.request('count_window')

      expect(manager.getTotalRequests('count_window')).assertEqual(3)
      expect(manager.getTotalSuccess('count_window')).assertEqual(2)
    })

    /**
     * @tc.name   testSlidingWindowLimiter0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SLIDINGWINDOWLIMITER_TEST_0500
     * @tc.desc   Verify testSlidingWindowLimiter0500 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlidingWindowLimiter0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await manager.createLimiter('concurrent_window', 1000, 5)

      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(slidingWindowRequestTask, manager, 'concurrent_window'))
      }
      await executeTasksGetObjects(tasks)

      expect(manager.getTotalRequests('concurrent_window')).assertEqual(10)
      expect(manager.getTotalSuccess('concurrent_window')).assertEqual(5)
    })

    /**
     * @tc.name   testSlidingWindowLimiter0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SLIDINGWINDOWLIMITER_TEST_0600
     * @tc.desc   Verify testSlidingWindowLimiter0600 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSlidingWindowLimiter0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const result: boolean = await manager.request('nonexistent')
      expect(result).assertFalse()
    })

    /**
     * @tc.name   testSlidingWindowLimiter0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SLIDINGWINDOWLIMITER_TEST_0700
     * @tc.desc   Verify testSlidingWindowLimiter0700 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlidingWindowLimiter0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await manager.createLimiter('batch3_window', 1000, 3)

      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 3; i++) {
        tasks.push(new taskpool.Task(slidingWindowRequestTask, manager, 'batch3_window'))
      }
      await executeTasksGetObjects(tasks)

      expect(manager.getTotalRequests('batch3_window')).assertEqual(3)
    })

    /**
     * @tc.name   testSlidingWindowLimiter0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SLIDINGWINDOWLIMITER_TEST_0800
     * @tc.desc   Verify testSlidingWindowLimiter0800 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlidingWindowLimiter0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await manager.createLimiter('batch5_window', 1000, 5)

      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(slidingWindowRequestTask, manager, 'batch5_window'))
      }
      await executeTasksGetObjects(tasks)

      expect(manager.getTotalRequests('batch5_window')).assertEqual(5)
    })

    /**
     * @tc.name   testSlidingWindowLimiter0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SLIDINGWINDOWLIMITER_TEST_0900
     * @tc.desc   Verify testSlidingWindowLimiter0900 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSlidingWindowLimiter0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await manager.createLimiter('batch10_window', 1000, 5)

      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(slidingWindowRequestTask, manager, 'batch10_window'))
      }
      await executeTasksGetObjects(tasks)

      expect(manager.getTotalRequests('batch10_window')).assertEqual(10)
      expect(manager.getTotalSuccess('batch10_window')).assertEqual(5)
    })

    /**
     * @tc.name   testSlidingWindowLimiter1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SLIDINGWINDOWLIMITER_TEST_1000
     * @tc.desc   Verify testSlidingWindowLimiter1000 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSlidingWindowLimiter1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const limiter1: SlidingWindowLimiter = await manager.createLimiter('idempotent', 1000, 10)
      const limiter2: SlidingWindowLimiter = await manager.createLimiter('idempotent', 2000, 20)

      expect(limiter1 === limiter2).assertTrue()
      expect(limiter1.getMaxRequests()).assertEqual(10)
    })

    /**
     * @tc.name   testSlidingWindowLimiter1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SLIDING_WINDOW_LIMITER_TEST_1100
     * @tc.desc   Verify multiple sliding window limiters coexist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSlidingWindowLimiter1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      await manager.createLimiter('window1', 500, 10)
      await manager.createLimiter('window2', 1000, 20)
      await manager.createLimiter('window3', 2000, 30)

      const limiter1: SlidingWindowLimiter | undefined = manager.getLimiter('window1')
      const limiter2: SlidingWindowLimiter | undefined = manager.getLimiter('window2')

      expect(limiter1!.getWindowSize()).assertEqual(500)
      expect(limiter2!.getWindowSize()).assertEqual(1000)
    })

    /**
     * @tc.name   testSlidingWindowLimiter1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SLIDING_WINDOW_LIMITER_TEST_1200
     * @tc.desc   Verify sliding window time boundary with key information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSlidingWindowLimiter1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const limiter: SlidingWindowLimiter = await manager.createLimiter('time_boundary', 1000, 100)
      const beforeTime: number = Date.now()

      await limiter.tryAcquire()

      const record: SlidingWindowRecord | undefined = limiter.getLastRecord()
      expect(record !== undefined).assertTrue()
      expect(record!.timestamp >= beforeTime).assertTrue()
    })
  })
}
