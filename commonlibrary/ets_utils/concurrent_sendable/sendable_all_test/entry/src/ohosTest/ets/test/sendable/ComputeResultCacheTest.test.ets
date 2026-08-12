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
class ComputeResultCache {
  public cache_: ArkTSUtils.SendableLruCache<string, number>
  public hitCount_: number = 0
  public missCount_: number = 0
  public computeCount_: number = 0

  constructor(cache_: ArkTSUtils.SendableLruCache<string, number>) {
    this.cache_ = cache_
  }

  set(key: string, value: number): void {
    this.cache_.put(key, value)
  }

  get(key: string): number | undefined {
    const value: number | undefined = this.cache_.get(key)
    if (value !== undefined) {
      this.hitCount_++
    } else {
      this.missCount_++
    }
    return value
  }

  getOrCompute(key: string, computeFn: (k: string) => number): number {
    const value: number | undefined = this.cache_.get(key)
    if (value !== undefined) {
      this.hitCount_++
      return value
    }
    this.missCount_++
    this.computeCount_++
    const result: number = computeFn(key)
    this.cache_.put(key, result)
    return result
  }

  has(key: string): boolean {
    return this.cache_.contains(key)
  }

  clear(): void {
    this.cache_.clear()
    this.hitCount_ = 0
    this.missCount_ = 0
    this.computeCount_ = 0
  }

  length(): number {
    return this.cache_.length
  }

  getHitCount(): number {
    return this.hitCount_
  }

  getMissCount(): number {
    return this.missCount_
  }

  getComputeCount(): number {
    return this.computeCount_
  }

  getHitRate(): number {
    const total: number = this.hitCount_ + this.missCount_
    if (total === 0) {
      return 0
    }
    return this.hitCount_ / total
  }
}

@Concurrent
function concurrentCompute(key: string, value: number): string {
  return `${key}=${value}`
}

function fibonacci(n: number): number {
  if (n <= 1) return n
  let a: number = 0
  let b: number = 1
  for (let i = 2; i <= n; i++) {
    const temp: number = a + b
    a = b
    b = temp
  }
  return b
}

export default function ComputeResultCacheTest(): void {
  describe('ComputeResultCacheTest', (): void => {
    let cache: ComputeResultCache

    beforeEach((): void => {
      const cacheArg: ArkTSUtils.SendableLruCache<string, number> = new ArkTSUtils.SendableLruCache<string, number>(100)
      cache = new ComputeResultCache(cacheArg)
    })
    /**
     * @tc.name   testComputeResultCache0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_COMPUTE_RESULT_CACHE_TEST_0100
     * @tc.desc   Verify computation parameter as cache key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testComputeResultCache0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      cache.set('fib_10', fibonacci(10))
      expect(cache.get('fib_10')).assertEqual(55)
    })

    /**
     * @tc.name   testComputeResultCache0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_COMPUTE_RESULT_CACHE_TEST_0200
     * @tc.desc   Verify computation result storage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testComputeResultCache0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      cache.set('sum_1_100', 5050)
      cache.set('factorial_5', 120)
      expect(cache.get('sum_1_100')).assertEqual(5050)
      expect(cache.get('factorial_5')).assertEqual(120)
    })

    /**
     * @tc.name   testComputeResultCache0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_COMPUTE_RESULT_CACHE_TEST_0300
     * @tc.desc   Verify cache hit reuse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testComputeResultCache0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      cache.set('fib_10', 55)
      const result1: number | undefined = cache.get('fib_10')
      const result2: number | undefined = cache.get('fib_10')
      expect(result1).assertEqual(55)
      expect(result2).assertEqual(55)
      expect(cache.getHitCount()).assertEqual(2)
    })

    /**
     * @tc.name   testComputeResultCache0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_COMPUTE_RESULT_CACHE_TEST_0400
     * @tc.desc   Verify cache miss triggers computation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComputeResultCache0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const computeFn: (k: string) => number = (_k: string): number => {
        return fibonacci(10)
      }
      const result: number = cache.getOrCompute('fib_10', computeFn)
      expect(result).assertEqual(55)
      expect(cache.getMissCount()).assertEqual(1)
      expect(cache.getComputeCount()).assertEqual(1)
    })

    /**
     * @tc.name   testComputeResultCache0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_COMPUTE_RESULT_CACHE_TEST_0500
     * @tc.desc   Verify cache capacity limit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testComputeResultCache0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const smallCacheArg: ArkTSUtils.SendableLruCache<string, number> = new ArkTSUtils.SendableLruCache<string, number>(100)
      const smallCache: ComputeResultCache = new ComputeResultCache(smallCacheArg)
      const smallLru: ArkTSUtils.SendableLruCache<string, number> = new ArkTSUtils.SendableLruCache<string, number>(3)
      smallLru.put('c1', 1)
      smallLru.put('c2', 2)
      smallLru.put('c3', 3)
      smallLru.put('c4', 4)
      expect(smallLru.length).assertEqual(3)
      expect(smallLru.contains('c1')).assertFalse()
    })

    /**
     * @tc.name   testComputeResultCache0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_COMPUTE_RESULT_CACHE_TEST_0600
     * @tc.desc   Verify TaskPool concurrent compute cache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testComputeResultCache0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(concurrentCompute, `compute_${i}`, i * i))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        const parts: string[] = (results[i] as string).split('=')
        cache.set(parts[0], parseInt(parts[1]))
      }
      expect(cache.length()).assertEqual(5)
    })

    /**
     * @tc.name   testComputeResultCache0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_COMPUTE_RESULT_CACHE_TEST_0700
     * @tc.desc   Verify cache reuse verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComputeResultCache0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const computeFn: (k: string) => number = (_k: string): number => {
        return 42
      }
      cache.getOrCompute('key_1', computeFn)
      const computeCount1: number = cache.getComputeCount()
      cache.getOrCompute('key_1', computeFn)
      const computeCount2: number = cache.getComputeCount()
      expect(computeCount2).assertEqual(computeCount1)
    })

    /**
     * @tc.name   testComputeResultCache0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_COMPUTE_RESULT_CACHE_TEST_0800
     * @tc.desc   Verify compute cache hit rate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComputeResultCache0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      cache.set('key_1', 100)
      cache.get('key_1')
      cache.get('key_1')
      cache.get('key_1')
      cache.get('nonexistent')
      expect(cache.getHitRate() > 0).assertTrue()
    })

    /**
     * @tc.name   testComputeResultCache0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_COMPUTE_RESULT_CACHE_TEST_0900
     * @tc.desc   Verify cache saved computation count statistics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testComputeResultCache0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const computeFn: (k: string) => number = (_k: string): number => {
        return 100
      }
      cache.getOrCompute('key_1', computeFn)
      cache.getOrCompute('key_1', computeFn)
      cache.getOrCompute('key_1', computeFn)
      expect(cache.getComputeCount()).assertEqual(1)
      expect(cache.getHitCount()).assertEqual(2)
    })
  })
}
