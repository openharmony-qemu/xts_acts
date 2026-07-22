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
class TokenBucket {
  public tokens_: number = 0
  public maxTokens_: number = 0
  public refillRate_: number = 0
  public lastRefill_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock


  constructor(maxTokens: number, refillRate: number, lock_: ArkTSUtils.locks.AsyncLock) {
    this.lock_ = lock_

    this.maxTokens_ = maxTokens
    this.refillRate_ = refillRate
    this.tokens_ = maxTokens
    this.lastRefill_ = Date.now()
  }

  private refill(): void {
    const now: number = Date.now()
    const elapsed: number = now - this.lastRefill_
    const tokensToAdd: number = Math.floor(elapsed / 1000) * this.refillRate_
    if (tokensToAdd > 0) {
      this.tokens_ = Math.min(this.maxTokens_, this.tokens_ + tokensToAdd)
      this.lastRefill_ = now
    }
  }

  async acquire(): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => {
      this.refill()
      if (this.tokens_ > 0) {
        this.tokens_--
        return true
      }
      return false
    })
  }

  getAvailableTokens(): number {
    return this.tokens_
  }

  getMaxTokens(): number {
    return this.maxTokens_
  }

  getRefillRate(): number {
    return this.refillRate_
  }
}

@Sendable
class RateLimiterManager {
  public limiters_: collections.Map<string, TokenBucket>

  public lock_: ArkTSUtils.locks.AsyncLock

  public requestCount_: collections.Map<string, number>

  public rejectedCount_: collections.Map<string, number>

  constructor(limiters_: collections.Map<string, TokenBucket>, lock_: ArkTSUtils.locks.AsyncLock, requestCount_: collections.Map<string, number>, rejectedCount_: collections.Map<string, number>) {
    this.limiters_ = limiters_
    this.lock_ = lock_
    this.requestCount_ = requestCount_
    this.rejectedCount_ = rejectedCount_
  }


  async createLimiter(name: string, maxTokens: number, refillRate: number): Promise<TokenBucket> {
    return await this.lock_.lockAsync((): TokenBucket => {
      if (!this.limiters_.has(name)) {
        const bucket: TokenBucket = new TokenBucket(maxTokens, refillRate, this.lock_)
        this.limiters_.set(name, bucket)
        this.requestCount_.set(name, 0)
        this.rejectedCount_.set(name, 0)
      }
      return this.limiters_.get(name)!
    })
  }

  async tryAcquire(name: string): Promise<boolean> {
    const limiter: TokenBucket | undefined = this.limiters_.get(name)
    if (limiter === undefined) {
      return false
    }

    await this.lock_.lockAsync((): void => {
      const count: number = this.requestCount_.get(name) ?? 0
      this.requestCount_.set(name, count + 1)
    })

    const acquired: boolean = await limiter.acquire()
    if (!acquired) {
      await this.lock_.lockAsync((): void => {
        const rejected: number = this.rejectedCount_.get(name) ?? 0
        this.rejectedCount_.set(name, rejected + 1)
      })
    }
    return acquired
  }

  getLimiter(name: string): TokenBucket | undefined {
    return this.limiters_.get(name)
  }

  getRequestCount(name: string): number {
    return this.requestCount_.get(name) ?? 0
  }

  getRejectedCount(name: string): number {
    return this.rejectedCount_.get(name) ?? 0
  }
}

@Sendable
class ConcurrentRateLimiter {
  public activeCount_: number = 0
  public maxConcurrent_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock


  constructor(maxConcurrent: number, lock_: ArkTSUtils.locks.AsyncLock) {
    this.lock_ = lock_

    this.maxConcurrent_ = maxConcurrent
  }

  async acquire(): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => {
      if (this.activeCount_ < this.maxConcurrent_) {
        this.activeCount_++
        return true
      }
      return false
    })
  }

  async release(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      if (this.activeCount_ > 0) {
        this.activeCount_--
      }
    })
  }

  getActiveCount(): number {
    return this.activeCount_
  }

  getMaxConcurrent(): number {
    return this.maxConcurrent_
  }
}

@Concurrent
async function acquireTokenTask(manager: RateLimiterManager, name: string): Promise<void> {
  await manager.tryAcquire(name)
}

function executeTasksGetObjects(tasks: taskpool.Task[]): Promise<Object[]> {
  const promises: Promise<Object>[] = []
  for (let i: number = 0; i < tasks.length; i++) {
    promises.push(taskpool.execute(tasks[i]))
  }
  return Promise.all(promises)
}

export default function BuiltinsRateLimiterTest(): void {
  describe('BuiltinsRateLimiterTest', (): void => {
    const rateLimiterManager: RateLimiterManager = new RateLimiterManager(new collections.Map<string, TokenBucket>(), new ArkTSUtils.locks.AsyncLock(), new collections.Map<string, number>(), new collections.Map<string, number>())

    beforeEach(async (): Promise<void> => {
      await rateLimiterManager.lock_.lockAsync((): void => {
        rateLimiterManager.limiters_.clear()
        rateLimiterManager.requestCount_.clear()
        rateLimiterManager.rejectedCount_.clear()
      })
    })

    afterEach(async (): Promise<void> => {
      await Utils.sleep(500)
    })

    it('testRateLimiter0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const bucket: TokenBucket = await rateLimiterManager.createLimiter('test_bucket', 10, 2)
      expect(bucket.getMaxTokens()).assertEqual(10)
      expect(bucket.getRefillRate()).assertEqual(2)
      expect(bucket.getAvailableTokens()).assertEqual(10)
    })

    it('testRateLimiter0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const bucket: TokenBucket = await rateLimiterManager.createLimiter('acquire_test', 5, 1)

      const result1: boolean = await bucket.acquire()
      expect(result1).assertTrue()
      expect(bucket.getAvailableTokens()).assertEqual(4)

      const result2: boolean = await bucket.acquire()
      expect(result2).assertTrue()
      expect(bucket.getAvailableTokens()).assertEqual(3)
    })

    it('testRateLimiter0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const bucket: TokenBucket = await rateLimiterManager.createLimiter('empty_bucket', 2, 0)

      await bucket.acquire()
      await bucket.acquire()

      const result: boolean = await bucket.acquire()
      expect(result).assertFalse()
    })

    it('testRateLimiter0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      await rateLimiterManager.createLimiter('integrated_test', 3, 0)

      const r1: boolean = await rateLimiterManager.tryAcquire('integrated_test')
      const r2: boolean = await rateLimiterManager.tryAcquire('integrated_test')
      const r3: boolean = await rateLimiterManager.tryAcquire('integrated_test')
      const r4: boolean = await rateLimiterManager.tryAcquire('integrated_test')

      expect(r1).assertTrue()
      expect(r2).assertTrue()
      expect(r3).assertTrue()
      expect(r4).assertFalse()
    })

    it('testRateLimiter0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await rateLimiterManager.createLimiter('concurrent_limit', 5, 0)

      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(acquireTokenTask, rateLimiterManager, 'concurrent_limit'))
      }
      await executeTasksGetObjects(tasks)

      expect(rateLimiterManager.getRequestCount('concurrent_limit')).assertEqual(10)
      expect(rateLimiterManager.getRejectedCount('concurrent_limit')).assertEqual(5)
    })

    it('testRateLimiter0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      await rateLimiterManager.createLimiter('count_test', 2, 0)

      await rateLimiterManager.tryAcquire('count_test')
      await rateLimiterManager.tryAcquire('count_test')
      await rateLimiterManager.tryAcquire('count_test')

      expect(rateLimiterManager.getRequestCount('count_test')).assertEqual(3)
      expect(rateLimiterManager.getRejectedCount('count_test')).assertEqual(1)
    })

    it('testRateLimiter0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const result: boolean = await rateLimiterManager.tryAcquire('nonexistent')
      expect(result).assertFalse()
    })

    it('testRateLimiter0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await rateLimiterManager.createLimiter('concurrent3', 3, 0)

      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 3; i++) {
        tasks.push(new taskpool.Task(acquireTokenTask, rateLimiterManager, 'concurrent3'))
      }
      await executeTasksGetObjects(tasks)

      expect(rateLimiterManager.getRequestCount('concurrent3')).assertEqual(3)
    })

    it('testRateLimiter0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await rateLimiterManager.createLimiter('concurrent5', 5, 0)

      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(acquireTokenTask, rateLimiterManager, 'concurrent5'))
      }
      await executeTasksGetObjects(tasks)

      expect(rateLimiterManager.getRequestCount('concurrent5')).assertEqual(5)
    })

    it('testRateLimiter1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await rateLimiterManager.createLimiter('concurrent10', 5, 0)

      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(acquireTokenTask, rateLimiterManager, 'concurrent10'))
      }
      await executeTasksGetObjects(tasks)

      expect(rateLimiterManager.getRequestCount('concurrent10')).assertEqual(10)
      expect(rateLimiterManager.getRejectedCount('concurrent10')).assertEqual(5)
    })

    it('testRateLimiter1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const bucket1: TokenBucket = await rateLimiterManager.createLimiter('limiter1', 2, 0)
      const bucket2: TokenBucket = await rateLimiterManager.createLimiter('limiter2', 5, 0)

      await bucket1.acquire()
      await bucket1.acquire()
      const r1: boolean = await bucket1.acquire()

      const r2: boolean = await bucket2.acquire()

      expect(r1).assertFalse()
      expect(r2).assertTrue()
    })

    it('testRateLimiter1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const bucket1: TokenBucket = await rateLimiterManager.createLimiter('idempotent', 10, 1)
      const bucket2: TokenBucket = await rateLimiterManager.createLimiter('idempotent', 20, 2)

      expect(bucket1 === bucket2).assertTrue()
      expect(bucket1.getMaxTokens()).assertEqual(10)
    })

    /**
     * @tc.name   testRateLimiter1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_RATE_LIMITER_TEST_1300
     * @tc.desc   Verify concurrent limiter AsyncLock protection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRateLimiter1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const concurrentLimiter: ConcurrentRateLimiter = new ConcurrentRateLimiter(100, new ArkTSUtils.locks.AsyncLock())
      const promises: Promise<boolean>[] = []
      for (let i = 0; i < 50; i++) {
        promises.push(concurrentLimiter.acquire())
      }
      const results: boolean[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        if (results[i]) {
          await concurrentLimiter.release()
        }
      }
      expect(concurrentLimiter.getActiveCount()).assertEqual(0)
    })
  })
}
