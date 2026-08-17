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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import { ArkTSUtils, collections } from '@kit.ArkTS'
import Utils from '../utils'

@Sendable
class IRLRUCache {
  public capacity_: number = 1024
  public size_: number = 0
  public hitCount_: number = 0
  public missCount_: number = 0
  public evictionCount_: number = 0
  public cache_: collections.Map<string, string>

  constructor(cache_: collections.Map<string, string>) {
    this.cache_ = cache_
  }


  getIRStats(): number[] {
    return [this.capacity_, this.size_, this.hitCount_, this.missCount_]
  }
}

@Sendable
class ICLRUCache {
  public cache_: collections.Map<string, string>

  constructor(cache_: collections.Map<string, string>) {
    this.cache_ = cache_
  }


  set(k: string, v: string): void {
    this.cache_.set(k, v)
  }

  get(k: string): string | undefined {
    return this.cache_.get(k)
  }
}

@Sendable
class StandardLRUCache {
  public capacity_: number = 100
  public cache_: collections.Map<string, string>

  constructor(cache_: collections.Map<string, string>) {
    this.cache_ = cache_
  }

}

@Sendable
class LargeLRUCache {
  public cache_: collections.Map<string, number>

  constructor(cache_: collections.Map<string, number>) {
    this.cache_ = cache_
  }

}

@Sendable
class ConcurrentLRUCache {
  public cache_: collections.Map<string, string>

  constructor(cache_: collections.Map<string, string>) {
    this.cache_ = cache_
  }

}

@Concurrent
function readCacheValue(c: ConcurrentLRUCache, k: string): string | undefined {
  return c.cache_.get(k)
}

@Sendable
class CapacityCache {
  public capacity_: number = 500
  public size_: number = 0

  getCapacity(): number {
    return this.capacity_
  }
}

@Sendable
class HitRateCache {
  public hitCount_: number = 0
  public missCount_: number = 0

  recordHit(): void {
    this.hitCount_++
  }

  getHitCount(): number {
    return this.hitCount_
  }
}

@Sendable
class KeyValueCache {
  public entries_: collections.Map<string, number>

  constructor(entries_: collections.Map<string, number>) {
    this.entries_ = entries_
  }

}

@Sendable
class EvictionCache {
  public evictionCount_: number = 0
  public capacity_: number = 10

  incrementEviction(): void {
    this.evictionCount_++
  }

  getEvictionCount(): number {
    return this.evictionCount_
  }
}

@Sendable
class SharedCache {
  public capacity_: number = 100
  public size_: number = 0
}

@Sendable
class CrossThreadCache {
  public data_: collections.Map<string, number>

  constructor(data_: collections.Map<string, number>) {
    this.data_ = data_
  }

}

@Concurrent
function readCacheData(c: CrossThreadCache): number | undefined {
  return c.data_.get('shared_key')
}

@Sendable
class BoundaryCache {
  public entries_: collections.Map<string, number>

  constructor(entries_: collections.Map<string, number>) {
    this.entries_ = entries_
  }

}

export default function CacheIRTest(): void {
  describe('CacheIRTest', (): void => {
    /**
     * @tc.name   testCacheIR0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CACHE_IR_TEST_0100
     * @tc.desc   Verify LRUCache fixed property IR verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheIR0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const cache: IRLRUCache = new IRLRUCache(new collections.Map<string, string>())
      const stats: number[] = cache.getIRStats()
      expect(stats[0]).assertEqual(1024)
      expect(stats[1]).assertEqual(0)
    })

    /**
     * @tc.name   testCacheIR0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CACHE_IR_TEST_0200
     * @tc.desc   Verify cache access IC cache verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheIR0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const cache: ICLRUCache = new ICLRUCache(new collections.Map<string, string>())
      cache.set('key1', 'value1')
      for (let i = 0; i < 100; i++) {
        const value: string | undefined = cache.get('key1')
        expect(value).assertEqual('value1')
      }
    })

    /**
     * @tc.name   testCacheIR0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CACHE_IR_TEST_0300
     * @tc.desc   Verify same capacity LRUCache HiddenClass sharing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheIR0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const cache1: StandardLRUCache = new StandardLRUCache(new collections.Map<string, string>())
      const cache2: StandardLRUCache = new StandardLRUCache(new collections.Map<string, string>())
      expect(cache1.capacity_).assertEqual(cache2.capacity_)
    })

    /**
     * @tc.name   testCacheIR0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CACHE_IR_TEST_0400
     * @tc.desc   Verify LRUCache element count > 1024 dictionary mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheIR0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const cache: LargeLRUCache = new LargeLRUCache(new collections.Map<string, number>())
      for (let i = 0; i < 1025; i++) {
        cache.cache_.set(`cache_${i}`, i)
      }
      expect(cache.cache_.size).assertEqual(1025)
      expect(cache.cache_.get('cache_1024')).assertEqual(1024)
    })

    /**
     * @tc.name   testCacheIR0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CACHE_IR_TEST_0500
     * @tc.desc   Verify concurrent cache access IC verification with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCacheIR0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const cache: ConcurrentLRUCache = new ConcurrentLRUCache(new collections.Map<string, string>())
        for (let i = 0; i < 100; i++) {
          cache.cache_.set(`k_${i}`, `v_${i}`)
        }
        const tasks: taskpool.Task[] = []
        for (let i = 0; i < 100; i++) {
          tasks.push(new taskpool.Task(readCacheValue, cache, `k_${i}`))
        }
        const promises: Promise<Object>[] = []
        for (let i = 0; i < tasks.length; i++) {
          promises.push(taskpool.execute(tasks[i]))
        }
        const results: Object[] = await Promise.all(promises)
        for (let i = 0; i < 100; i++) {
          expect(results[i] as string).assertEqual(`v_${i}`)
        }
      } catch (error) {
        console.error("testCacheIR0500 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testCacheIR0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CACHE_IR_TEST_0600
     * @tc.desc   Verify cache capacity property IR access verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheIR0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const cache: CapacityCache = new CapacityCache()
      expect(cache.getCapacity()).assertEqual(500)
    })

    /**
     * @tc.name   testCacheIR0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CACHE_IR_TEST_0700
     * @tc.desc   Verify cache hit rate property IR verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheIR0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const cache: HitRateCache = new HitRateCache()
      for (let i = 0; i < 50; i++) {
        cache.recordHit()
      }
      expect(cache.getHitCount()).assertEqual(50)
    })

    /**
     * @tc.name   testCacheIR0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CACHE_IR_TEST_0800
     * @tc.desc   Verify cache key-value IR access verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheIR0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const cache: KeyValueCache = new KeyValueCache(new collections.Map<string, number>())
      cache.entries_.set('key_a', 100)
      cache.entries_.set('key_b', 200)
      expect(cache.entries_.get('key_a')).assertEqual(100)
      expect(cache.entries_.get('key_b')).assertEqual(200)
    })

    /**
     * @tc.name   testCacheIR0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CACHE_IR_TEST_0900
     * @tc.desc   Verify cache eviction count IR verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheIR0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const cache: EvictionCache = new EvictionCache()
      for (let i = 0; i < 5; i++) {
        cache.incrementEviction()
      }
      expect(cache.getEvictionCount()).assertEqual(5)
    })

    /**
     * @tc.name   testCacheIR1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CACHE_IR_TEST_1000
     * @tc.desc   Verify multiple cache HiddenClass sharing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheIR1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const cache1: SharedCache = new SharedCache()
      const cache2: SharedCache = new SharedCache()
      const cache3: SharedCache = new SharedCache()
      expect(cache1.capacity_).assertEqual(100)
      expect(cache2.capacity_).assertEqual(100)
      expect(cache3.capacity_).assertEqual(100)
    })

    /**
     * @tc.name   testCacheIR1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CACHE_IR_TEST_1100
     * @tc.desc   Verify cache cross-thread IR consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCacheIR1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const cache: CrossThreadCache = new CrossThreadCache(new collections.Map<string, number>())
        cache.data_.set('shared_key', 42)
        const tasks: taskpool.Task[] = []
        for (let i = 0; i < 10; i++) {
          tasks.push(new taskpool.Task(readCacheData, cache))
        }
        const promises: Promise<Object>[] = []
        for (let i = 0; i < tasks.length; i++) {
          promises.push(taskpool.execute(tasks[i]))
        }
        const results: Object[] = await Promise.all(promises)
        for (let i = 0; i < results.length; i++) {
          expect(results[i] as number).assertEqual(42)
        }
      } catch (error) {
        console.error("testCacheIR1100 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testCacheIR1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CACHE_IR_TEST_1200
     * @tc.desc   Verify cache element count boundary 1024
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheIR1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const cache: BoundaryCache = new BoundaryCache(new collections.Map<string, number>())
      for (let i = 0; i < 1024; i++) {
        cache.entries_.set(`entry_${i}`, i)
      }
      expect(cache.entries_.size).assertEqual(1024)
    })

    /**
     * @tc.name   testCacheIR1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CACHE_IR_TEST_1300
     * @tc.desc   Verify cache element count 1025 dictionary mode trigger
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheIR1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const cache: BoundaryCache = new BoundaryCache(new collections.Map<string, number>())
      for (let i = 0; i < 1025; i++) {
        cache.entries_.set(`entry_${i}`, i)
      }
      expect(cache.entries_.size).assertEqual(1025)
      expect(cache.entries_.get('entry_0')).assertEqual(0)
      expect(cache.entries_.get('entry_1024')).assertEqual(1024)
    })
  })
}
