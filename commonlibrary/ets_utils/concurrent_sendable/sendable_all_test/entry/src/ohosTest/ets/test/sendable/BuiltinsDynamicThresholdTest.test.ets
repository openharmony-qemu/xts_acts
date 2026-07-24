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

import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import { ArkTSUtils, collections } from '@kit.ArkTS'
import Utils from '../utils'

@Sendable
class DynamicThreshold {
  public currentThreshold_: number = 0
  public minThreshold_: number = 0
  public maxThreshold_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  public adjustmentHistory_: collections.Array<number>

  public adjustmentCount_: number = 0

  constructor(initial: number, min: number, max: number, lock_: ArkTSUtils.locks.AsyncLock, adjustmentHistory_: collections.Array<number>) {
    this.lock_ = lock_
    this.adjustmentHistory_ = adjustmentHistory_

    this.currentThreshold_ = initial
    this.minThreshold_ = min
    this.maxThreshold_ = max
  }

  async adjust(newThreshold: number): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => {
      if (newThreshold >= this.minThreshold_ && newThreshold <= this.maxThreshold_) {
        this.currentThreshold_ = newThreshold
        this.adjustmentHistory_.push(newThreshold)
        this.adjustmentCount_++
        return true
      }
      return false
    })
  }

  async increase(delta: number): Promise<boolean> {
    return this.adjust(this.currentThreshold_ + delta)
  }

  async decrease(delta: number): Promise<boolean> {
    return this.adjust(this.currentThreshold_ - delta)
  }

  getCurrentThreshold(): number {
    return this.currentThreshold_
  }

  getMinThreshold(): number {
    return this.minThreshold_
  }

  getMaxThreshold(): number {
    return this.maxThreshold_
  }

  getAdjustmentCount(): number {
    return this.adjustmentCount_
  }

  getAdjustmentHistory(): collections.Array<number> {
    return this.adjustmentHistory_
  }

  async resetToDefault(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.currentThreshold_ = this.minThreshold_
      while (this.adjustmentHistory_.length > 0) { this.adjustmentHistory_.pop() }
      this.adjustmentCount_ = 0
    })
  }
}

@Sendable
class DynamicThresholdManager {
  public thresholds_: collections.Map<string, DynamicThreshold>

  public lock_: ArkTSUtils.locks.AsyncLock

  public emptyHistoryPool_: collections.Array<collections.Array<number>>

  constructor(thresholds_: collections.Map<string, DynamicThreshold>, lock_: ArkTSUtils.locks.AsyncLock, emptyHistoryPool_: collections.Array<collections.Array<number>>) {
    this.thresholds_ = thresholds_
    this.lock_ = lock_
    this.emptyHistoryPool_ = emptyHistoryPool_
  }


  async createThreshold(name: string, initial: number, min: number, max: number): Promise<DynamicThreshold> {
    return await this.lock_.lockAsync((): DynamicThreshold => {
      if (!this.thresholds_.has(name)) {
        const emptyHistory: collections.Array<number> = this.emptyHistoryPool_.pop()!
        const threshold: DynamicThreshold = new DynamicThreshold(initial, min, max, this.lock_, emptyHistory)
        this.thresholds_.set(name, threshold)
      }
      return this.thresholds_.get(name)!
    })
  }

  getThreshold(name: string): DynamicThreshold | undefined {
    return this.thresholds_.get(name)
  }
}

@Concurrent
async function adjustThresholdTask(threshold: DynamicThreshold, newValue: number): Promise<void> {
  await threshold.adjust(newValue)
}

@Concurrent
async function increaseThresholdTask(threshold: DynamicThreshold, delta: number): Promise<void> {
  await threshold.increase(delta)
}

export default function BuiltinsDynamicThresholdTest(): void {
  describe('BuiltinsDynamicThresholdTest', (): void => {
    const emptyHistoryPool: collections.Array<collections.Array<number>> = new collections.Array<collections.Array<number>>()
    for (let i = 0; i < 30; i++) {
      emptyHistoryPool.push(new collections.Array<number>())
    }
    const dynamicThresholdManager: DynamicThresholdManager = new DynamicThresholdManager(new collections.Map<string, DynamicThreshold>(), new ArkTSUtils.locks.AsyncLock(), emptyHistoryPool)

    beforeEach(async (): Promise<void> => {
      await dynamicThresholdManager.lock_.lockAsync((): void => {
        dynamicThresholdManager.thresholds_.clear()
      })
    })

    afterEach(async (): Promise<void> => {
      await Utils.sleep(500)
    })

    /**
     * @tc.name   testDynamicThreshold0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DYNAMIC_THRESHOLD_TEST_0100
     * @tc.desc   Verify dynamic threshold creation with parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDynamicThreshold0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const threshold: DynamicThreshold = await dynamicThresholdManager.createThreshold('test_threshold', 10, 1, 100)
      expect(threshold.getCurrentThreshold()).assertEqual(10)
      expect(threshold.getMinThreshold()).assertEqual(1)
      expect(threshold.getMaxThreshold()).assertEqual(100)
    })

    /**
     * @tc.name   testDynamicThreshold0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DYNAMIC_THRESHOLD_TEST_0200
     * @tc.desc   Verify threshold adjustment within range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDynamicThreshold0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const threshold: DynamicThreshold = await dynamicThresholdManager.createThreshold('adjust_test', 50, 10, 100)

      const result: boolean = await threshold.adjust(75)
      expect(result).assertTrue()
      expect(threshold.getCurrentThreshold()).assertEqual(75)
    })

    /**
     * @tc.name   testDynamicThreshold0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DYNAMIC_THRESHOLD_TEST_0300
     * @tc.desc   Verify threshold adjustment beyond max returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicThreshold0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const threshold: DynamicThreshold = await dynamicThresholdManager.createThreshold('range_test', 50, 10, 100)

      const result: boolean = await threshold.adjust(150)
      expect(result).assertFalse()
      expect(threshold.getCurrentThreshold()).assertEqual(50)
    })

    /**
     * @tc.name   testDynamicThreshold0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DYNAMIC_THRESHOLD_TEST_0400
     * @tc.desc   Verify threshold adjustment below min returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicThreshold0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const threshold: DynamicThreshold = await dynamicThresholdManager.createThreshold('min_test', 50, 10, 100)

      const result: boolean = await threshold.adjust(5)
      expect(result).assertFalse()
      expect(threshold.getCurrentThreshold()).assertEqual(50)
    })

    /**
     * @tc.name   testDynamicThreshold0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DYNAMIC_THRESHOLD_TEST_0500
     * @tc.desc   Verify threshold increase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDynamicThreshold0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const threshold: DynamicThreshold = await dynamicThresholdManager.createThreshold('increase_test', 50, 10, 100)

      const result: boolean = await threshold.increase(20)
      expect(result).assertTrue()
      expect(threshold.getCurrentThreshold()).assertEqual(70)
    })

    /**
     * @tc.name   testDynamicThreshold0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DYNAMIC_THRESHOLD_TEST_0600
     * @tc.desc   Verify threshold decrease
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDynamicThreshold0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const threshold: DynamicThreshold = await dynamicThresholdManager.createThreshold('decrease_test', 50, 10, 100)

      const result: boolean = await threshold.decrease(20)
      expect(result).assertTrue()
      expect(threshold.getCurrentThreshold()).assertEqual(30)
    })

    /**
     * @tc.name   testDynamicThreshold0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DYNAMIC_THRESHOLD_TEST_0700
     * @tc.desc   Verify adjustment count tracking
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDynamicThreshold0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const threshold: DynamicThreshold = await dynamicThresholdManager.createThreshold('count_test', 50, 10, 100)

      await threshold.adjust(60)
      await threshold.adjust(70)
      await threshold.adjust(80)

      expect(threshold.getAdjustmentCount()).assertEqual(3)
    })

    /**
     * @tc.name   testDynamicThreshold0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DYNAMIC_THRESHOLD_TEST_0800
     * @tc.desc   Verify adjustment history with collections.Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDynamicThreshold0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const threshold: DynamicThreshold = await dynamicThresholdManager.createThreshold('history_test', 50, 10, 100)

      await threshold.adjust(60)
      await threshold.adjust(70)

      const history: collections.Array<number> = threshold.getAdjustmentHistory()
      expect(history.length).assertEqual(2)
      expect(history[0]).assertEqual(60)
      expect(history[1]).assertEqual(70)
    })

    /**
     * @tc.name   testDynamicThreshold0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DYNAMIC_THRESHOLD_TEST_0900
     * @tc.desc   Verify concurrent threshold adjustment with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDynamicThreshold0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const threshold: DynamicThreshold = await dynamicThresholdManager.createThreshold('concurrent_test', 50, 10, 100)

      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(adjustThresholdTask, threshold, 50 + i * 10))
      }
      const promises: Promise<Object>[] = tasks.map((t: taskpool.Task): Promise<Object> => taskpool.execute(t))
      await Promise.all(promises)

      expect(threshold.getAdjustmentCount()).assertEqual(5)
    })

    /**
     * @tc.name   testDynamicThreshold1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DYNAMIC_THRESHOLD_TEST_1000
     * @tc.desc   Verify concurrent threshold increase with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDynamicThreshold1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const threshold: DynamicThreshold = await dynamicThresholdManager.createThreshold('increase_concurrent', 50, 10, 100)

      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 3; i++) {
        tasks.push(new taskpool.Task(increaseThresholdTask, threshold, 10))
      }
      const promises: Promise<Object>[] = tasks.map((t: taskpool.Task): Promise<Object> => taskpool.execute(t))
      await Promise.all(promises)

      expect(threshold.getAdjustmentCount()).assertEqual(3)
    })

    /**
     * @tc.name   testDynamicThreshold1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DYNAMIC_THRESHOLD_TEST_1100
     * @tc.desc   Verify threshold creation is idempotent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicThreshold1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const t1: DynamicThreshold = await dynamicThresholdManager.createThreshold('idempotent', 50, 10, 100)
      const t2: DynamicThreshold = await dynamicThresholdManager.createThreshold('idempotent', 60, 20, 200)

      expect(t1 === t2).assertTrue()
      expect(t1.getCurrentThreshold()).assertEqual(50)
    })

    /**
     * @tc.name   testDynamicThreshold1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DYNAMIC_THRESHOLD_TEST_1200
     * @tc.desc   Verify threshold reset to default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDynamicThreshold1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const threshold: DynamicThreshold = await dynamicThresholdManager.createThreshold('reset_test', 50, 10, 100)

      await threshold.adjust(60)
      await threshold.adjust(70)
      await threshold.resetToDefault()

      expect(threshold.getAdjustmentHistory().length).assertEqual(0)
      expect(threshold.getAdjustmentCount()).assertEqual(0)
    })

    /**
     * @tc.name   testDynamicThreshold1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DYNAMIC_THRESHOLD_TEST_1300
     * @tc.desc   Verify multiple thresholds coexist in collections.Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDynamicThreshold1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      await dynamicThresholdManager.createThreshold('threshold1', 10, 1, 100)
      await dynamicThresholdManager.createThreshold('threshold2', 20, 5, 50)
      await dynamicThresholdManager.createThreshold('threshold3', 30, 10, 60)

      const t1: DynamicThreshold | undefined = dynamicThresholdManager.getThreshold('threshold1')
      const t2: DynamicThreshold | undefined = dynamicThresholdManager.getThreshold('threshold2')

      expect(t1 !== undefined).assertTrue()
      expect(t2 !== undefined).assertTrue()
      expect(t1!.getCurrentThreshold()).assertEqual(10)
      expect(t2!.getCurrentThreshold()).assertEqual(20)
    })
  })

  BuiltinsRateLimitMonitorTestInner()
}

@Sendable
class RateLimitStats {
  public totalRequests: number = 0
  public successfulRequests: number = 0
  public rejectedRequests: number = 0
  public avgWaitTime: number = 0
  public peakWaitTime: number = 0
}

@Sendable
class RateLimitMonitor {
  public stats_: collections.Map<string, RateLimitStats>

  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(stats_: collections.Map<string, RateLimitStats>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.stats_ = stats_
    this.lock_ = lock_
  }


  async recordRequest(name: string, success: boolean, waitTime: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      if (!this.stats_.has(name)) {
        this.stats_.set(name, new RateLimitStats())
      }

      const stats: RateLimitStats = this.stats_.get(name)!
      stats.totalRequests++

      if (success) {
        stats.successfulRequests++
      } else {
        stats.rejectedRequests++
      }

      if (waitTime > stats.peakWaitTime) {
        stats.peakWaitTime = waitTime
      }

      const totalWait: number = stats.avgWaitTime * (stats.totalRequests - 1) + waitTime
      stats.avgWaitTime = totalWait / stats.totalRequests
    })
  }

  getStats(name: string): RateLimitStats | undefined {
    return this.stats_.get(name)
  }

  async resetStats(name: string): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.stats_.delete(name)
    })
  }
}

@Concurrent
async function recordRequestTask(monitor: RateLimitMonitor, name: string, success: boolean, waitTime: number): Promise<void> {
  await monitor.recordRequest(name, success, waitTime)
}

function BuiltinsRateLimitMonitorTestInner(): void {
  describe('BuiltinsRateLimitMonitorTest', (): void => {
    const rateLimitMonitor: RateLimitMonitor = new RateLimitMonitor(new collections.Map<string, RateLimitStats>(), new ArkTSUtils.locks.AsyncLock())

    beforeEach(async (): Promise<void> => {
      await rateLimitMonitor.lock_.lockAsync((): void => {
        rateLimitMonitor.stats_.clear()
      })
    })

    afterEach(async (): Promise<void> => {
      await Utils.sleep(500)
    })

    /**
     * @tc.name   testRateLimitMonitor0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_RATE_LIMIT_MONITOR_TEST_0100
     * @tc.desc   Verify small concurrency 10 stats recording
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRateLimitMonitor0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const promises: Promise<void>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(rateLimitMonitor.recordRequest('batch_monitor_10', i % 3 === 0, i * 2))
      }
      await Promise.all(promises)

      const stats: RateLimitStats | undefined = rateLimitMonitor.getStats('batch_monitor_10')
      expect(stats !== undefined).assertTrue()
      expect(stats!.totalRequests).assertEqual(10)
    })

    /**
     * @tc.name   testRateLimitMonitor0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_RATE_LIMIT_MONITOR_TEST_0200
     * @tc.desc   Verify stats reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRateLimitMonitor0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      await rateLimitMonitor.recordRequest('reset_monitor', true, 0)
      await rateLimitMonitor.recordRequest('reset_monitor', false, 50)

      await rateLimitMonitor.resetStats('reset_monitor')

      const stats: RateLimitStats | undefined = rateLimitMonitor.getStats('reset_monitor')
      expect(stats === undefined).assertTrue()
    })

    /**
     * @tc.name   testRateLimitMonitor0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_RATE_LIMIT_MONITOR_TEST_0300
     * @tc.desc   Verify multiple rate limit monitors coexist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRateLimitMonitor0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      await rateLimitMonitor.recordRequest('monitor1', true, 0)
      await rateLimitMonitor.recordRequest('monitor2', true, 0)
      await rateLimitMonitor.recordRequest('monitor3', true, 0)

      const stats1: RateLimitStats | undefined = rateLimitMonitor.getStats('monitor1')
      const stats2: RateLimitStats | undefined = rateLimitMonitor.getStats('monitor2')

      expect(stats1 !== undefined).assertTrue()
      expect(stats2 !== undefined).assertTrue()
      expect(stats1!.totalRequests).assertEqual(1)
      expect(stats2!.totalRequests).assertEqual(1)
    })
  })
}
