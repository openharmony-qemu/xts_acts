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
import { collections, ArkTSUtils } from '@kit.ArkTS'
import Utils from '../utils'

@Sendable
class DatabaseQueryCache {
  public cache_: ArkTSUtils.SendableLruCache<string, string>
  public capacity_: number = 100
  public hitCount_: number = 0
  public missCount_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(lock_: ArkTSUtils.locks.AsyncLock, cache_: ArkTSUtils.SendableLruCache<string, string>) {
    this.cache_ = cache_
    this.lock_ = lock_
  }


  async set(key: string, value: string): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.cache_.put(key, value)
    })
  }

  async get(key: string): Promise<string | undefined> {
    let value: string | undefined = undefined
    await this.lock_.lockAsync((): void => {
      value = this.cache_.get(key)
      if (value !== undefined) {
        this.hitCount_++
      } else {
        this.missCount_++
      }
    })
    return value
  }

  has(key: string): boolean {
    return this.cache_.contains(key)
  }

  delete(key: string): void {
    this.cache_.remove(key)
  }

  clear(): void {
    this.cache_.clear()
    this.hitCount_ = 0
    this.missCount_ = 0
  }

  length(): number {
    return this.cache_.length
  }

  capacity(): number {
    return this.capacity_
  }

  getHitCount(): number {
    return this.hitCount_
  }

  getMissCount(): number {
    return this.missCount_
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
function concurrentGetFromCache(key: string): string {
  return key
}

@Concurrent
function concurrentSetToCache(key: string, value: string): string {
  return `${key}=${value}`
}

export default function BuiltinsDbQueryCacheTest(): void {
  describe('BuiltinsDbQueryCacheTest', (): void => {
    let cache: DatabaseQueryCache

    beforeEach((): void => {
      const lockArg: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
      const cacheArg: ArkTSUtils.SendableLruCache<string, string> = new ArkTSUtils.SendableLruCache<string, string>(100)
      cache = new DatabaseQueryCache(lockArg, cacheArg)
    })
    /**
     * @tc.name   testDbQueryCache0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DBQUERYCACHE_TEST_0100
     * @tc.desc   Verify testDbQueryCache0100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDbQueryCache0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await cache.set('query_1', 'result_1')
      expect(cache.length()).assertEqual(1)
    })

    /**
     * @tc.name   testDbQueryCache0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DBQUERYCACHE_TEST_0200
     * @tc.desc   Verify testDbQueryCache0200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDbQueryCache0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await cache.set('query_1', 'result_1')
      let value: string | undefined = await cache.get('query_1')
      expect(value).assertEqual('result_1')
    })

    /**
     * @tc.name   testDbQueryCache0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DBQUERYCACHE_TEST_0300
     * @tc.desc   Verify testDbQueryCache0300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDbQueryCache0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await cache.set('query_1', 'result_1')
      expect(cache.has('query_1')).assertTrue()
      expect(cache.has('query_2')).assertFalse()
    })

    /**
     * @tc.name   testDbQueryCache0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DBQUERYCACHE_TEST_0400
     * @tc.desc   Verify testDbQueryCache0400 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDbQueryCache0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await cache.set('query_1', 'result_1')
      expect(cache.length()).assertEqual(1)
      cache.delete('query_1')
      expect(cache.length()).assertEqual(0)
      expect(cache.has('query_1')).assertFalse()
    })

    /**
     * @tc.name   testDbQueryCache0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DBQUERYCACHE_TEST_0500
     * @tc.desc   Verify testDbQueryCache0500 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDbQueryCache0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await cache.set('query_1', 'result_1')
      await cache.get('query_1')
      await cache.get('query_1')
      expect(cache.getHitCount()).assertEqual(2)
    })

    /**
     * @tc.name   testDbQueryCache0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DBQUERYCACHE_TEST_0600
     * @tc.desc   Verify testDbQueryCache0600 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDbQueryCache0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await cache.get('nonexistent')
      await cache.get('nonexistent2')
      expect(cache.getMissCount()).assertEqual(2)
    })

    /**
     * @tc.name   testDbQueryCache0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DBQUERYCACHE_TEST_0700
     * @tc.desc   Verify testDbQueryCache0700 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDbQueryCache0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await cache.set('query_1', 'result_1')
      await cache.get('query_1')
      await cache.get('query_1')
      await cache.get('nonexistent')
      expect(cache.getHitRate() > 0).assertTrue()
    })

    /**
     * @tc.name   testDbQueryCache0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DBQUERYCACHE_TEST_0800
     * @tc.desc   Verify testDbQueryCache0800 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDbQueryCache0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(cache.capacity()).assertEqual(100)
    })

    /**
     * @tc.name   testDbQueryCache0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DBQUERYCACHE_TEST_0900
     * @tc.desc   Verify testDbQueryCache0900 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDbQueryCache0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const smallLru: ArkTSUtils.SendableLruCache<string, string> = new ArkTSUtils.SendableLruCache<string, string>(3)
      smallLru.put('key1', 'value1')
      smallLru.put('key2', 'value2')
      smallLru.put('key3', 'value3')
      smallLru.put('key4', 'value4')
      expect(smallLru.contains('key1')).assertFalse()
      expect(smallLru.contains('key2')).assertTrue()
      expect(smallLru.contains('key3')).assertTrue()
      expect(smallLru.contains('key4')).assertTrue()
      expect(smallLru.length).assertEqual(3)
    })

    /**
     * @tc.name   testDbQueryCache1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DBQUERYCACHE_TEST_1000
     * @tc.desc   Verify testDbQueryCache1000 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDbQueryCache1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const lru: ArkTSUtils.SendableLruCache<string, string> = new ArkTSUtils.SendableLruCache<string, string>(3)
      lru.put('key1', 'value1')
      lru.put('key2', 'value2')
      lru.put('key3', 'value3')
      const _val: string | undefined = lru.get('key1')
      lru.put('key4', 'value4')
      expect(lru.contains('key1')).assertTrue()
      expect(lru.contains('key2')).assertFalse()
      expect(lru.contains('key3')).assertTrue()
      expect(lru.contains('key4')).assertTrue()
    })

    /**
     * @tc.name   testDbQueryCache1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DBQUERYCACHE_TEST_1100
     * @tc.desc   Verify testDbQueryCache1100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDbQueryCache1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await cache.set('shared_key', 'shared_value')
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(concurrentGetFromCache, 'shared_key'))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i] as string).assertEqual('shared_key')
      }
    })

    /**
     * @tc.name   testDbQueryCache1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DBQUERYCACHE_TEST_1200
     * @tc.desc   Verify testDbQueryCache1200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDbQueryCache1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(concurrentSetToCache, `key_${i}`, `value_${i}`))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        const parts: string[] = (results[i] as string).split('=')
        await cache.set(parts[0], parts[1])
      }
      expect(cache.length()).assertEqual(5)
    })

    /**
     * @tc.name   testDbQueryCache1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DBQUERYCACHE_TEST_1300
     * @tc.desc   Verify testDbQueryCache1300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDbQueryCache1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let i = 0; i < 20; i++) {
        await cache.set(`warmup_${i}`, `data_${i}`)
      }
      expect(cache.length()).assertEqual(20)
      for (let i = 0; i < 20; i++) {
        expect(cache.has(`warmup_${i}`)).assertTrue()
      }
    })
  })
}
