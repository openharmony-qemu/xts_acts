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
import { BusinessError } from '@kit.BasicServicesKit'
import taskpool from '@ohos.taskpool'
import { ArkTSUtils, collections } from '@kit.ArkTS'
import Utils from '../utils'

const API_CACHE_EMPTY_KEY_MSG: string = 'ApiCacheManager key is empty'
const API_CACHE_LOCK_THROW_MSG: string = 'Test exception in ApiCacheManager lock'

@Sendable
class ApiCacheManager {
  private cache_: ArkTSUtils.SendableLruCache<string, string>
  private timestamps_: collections.Map<string, number>
  private lock_: ArkTSUtils.locks.AsyncLock
  private ttlMs_: number = 5000
  private hitCount_: number = 0
  private missCount_: number = 0

  constructor(timestamps_: collections.Map<string, number>, cache_: ArkTSUtils.SendableLruCache<string, string>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.cache_ = cache_
    this.timestamps_ = timestamps_
    this.lock_ = lock_
  }

  private checkKey(key: string): void {
    if (key.length === 0) {
      throw new Error('ApiCacheManager key is empty')
    }
  }

  setTtlForTest(ttlMs: number): void {
    this.ttlMs_ = ttlMs
  }

  async setTimestampForTest(key: string, timestamp: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.timestamps_.set(key, timestamp)
    })
  }

  async throwInsideLockForTest(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      throw new Error('Test exception in ApiCacheManager lock')
    })
  }

  async set(key: string, value: string): Promise<void> {
    this.checkKey(key)
    await this.lock_.lockAsync((): void => {
      this.cache_.put(key, value)
      this.timestamps_.set(key, Date.now())
    })
  }

  async get(key: string): Promise<string | undefined> {
    this.checkKey(key)
    return await this.lock_.lockAsync((): string | undefined => {
      const timestamp: number | undefined = this.timestamps_.get(key)
      if (timestamp !== undefined) {
        const elapsed: number = Date.now() - timestamp
        if (elapsed > this.ttlMs_) {
          this.cache_.remove(key)
          this.timestamps_.delete(key)
          this.missCount_++
          return undefined
        }
      }
      const value: string | undefined = this.cache_.get(key)
      if (value !== undefined) {
        this.hitCount_++
      } else {
        this.missCount_++
      }
      return value
    })
  }

  async has(key: string): Promise<boolean> {
    this.checkKey(key)
    return await this.lock_.lockAsync((): boolean => this.cache_.contains(key))
  }

  async delete(key: string): Promise<void> {
    this.checkKey(key)
    await this.lock_.lockAsync((): void => {
      this.cache_.remove(key)
      this.timestamps_.delete(key)
    })
  }

  async clear(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.cache_.clear()
      this.timestamps_.clear()
      this.hitCount_ = 0
      this.missCount_ = 0
    })
  }

  async length(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.cache_.length)
  }

  async getHitCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.hitCount_)
  }

  async getMissCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.missCount_)
  }

  async isExpired(key: string): Promise<boolean> {
    this.checkKey(key)
    return await this.lock_.lockAsync((): boolean => {
      const timestamp: number | undefined = this.timestamps_.get(key)
      if (timestamp === undefined) {
        return true
      }
      return (Date.now() - timestamp) > this.ttlMs_
    })
  }
}

@Concurrent
async function concurrentCacheApiResponse(manager: ApiCacheManager, key: string, value: string): Promise<void> {
  await manager.set(key, value)
}

export default function ApiResponseCacheTest(): void {
  describe('ApiResponseCacheTest', (): void => {
    let cache: ApiCacheManager

    beforeEach((): void => {
      const timestampsArg: collections.Map<string, number> = new collections.Map<string, number>()
      const cacheArg: ArkTSUtils.SendableLruCache<string, string> = new ArkTSUtils.SendableLruCache<string, string>(100)
      cache = new ApiCacheManager(timestampsArg, cacheArg, new ArkTSUtils.locks.AsyncLock())
    })
    /**
     * @tc.name   testApiResponseCache0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_API_RESPONSE_CACHE_TEST_0100
     * @tc.desc   Verify GET response cache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testApiResponseCache0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await cache.set('GET_/api/users', '{"users":[]}')
      const value: string | undefined = await cache.get('GET_/api/users')
      expect(value).assertEqual('{"users":[]}')
    })

    /**
     * @tc.name   testApiResponseCache0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_API_RESPONSE_CACHE_TEST_0200
     * @tc.desc   Verify POST response cache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testApiResponseCache0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await cache.set('POST_/api/users', '{"id":1}')
      const value: string | undefined = await cache.get('POST_/api/users')
      expect(value).assertEqual('{"id":1}')
    })

    /**
     * @tc.name   testApiResponseCache0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_API_RESPONSE_CACHE_TEST_0300
     * @tc.desc   Verify cache key isolation with different methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testApiResponseCache0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await cache.set('GET_/api/data', 'get_response')
      await cache.set('POST_/api/data', 'post_response')
      expect(await cache.get('GET_/api/data')).assertEqual('get_response')
      expect(await cache.get('POST_/api/data')).assertEqual('post_response')
    })

    /**
     * @tc.name   testApiResponseCache0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_API_RESPONSE_CACHE_TEST_0400
     * @tc.desc   Verify API cache hit statistics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testApiResponseCache0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await cache.set('api_1', 'response_1')
      await cache.get('api_1')
      await cache.get('api_1')
      expect(await cache.getHitCount()).assertEqual(2)
    })

    /**
     * @tc.name   testApiResponseCache0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_API_RESPONSE_CACHE_TEST_0500
     * @tc.desc   Verify API cache miss statistics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testApiResponseCache0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await cache.get('nonexistent_api')
      expect(await cache.getMissCount()).assertEqual(1)
    })

    /**
     * @tc.name   testApiResponseCache0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_API_RESPONSE_CACHE_TEST_0600
     * @tc.desc   Verify expired cache removal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiResponseCache0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const shortTtlTimestamps: collections.Map<string, number> = new collections.Map<string, number>()
      const shortTtlCacheArg: ArkTSUtils.SendableLruCache<string, string> = new ArkTSUtils.SendableLruCache<string, string>(100)
      const shortTtlCache: ApiCacheManager = new ApiCacheManager(shortTtlTimestamps, shortTtlCacheArg, new ArkTSUtils.locks.AsyncLock())
      shortTtlCache.setTtlForTest(100)
      await shortTtlCache.set('expiring_key', 'expiring_value')
      expect(await shortTtlCache.has('expiring_key')).assertTrue()
      await Utils.sleep(150)
      const value: string | undefined = await shortTtlCache.get('expiring_key')
      expect(value === undefined).assertTrue()
    })

    /**
     * @tc.name   testApiResponseCache0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_API_RESPONSE_CACHE_TEST_0700
     * @tc.desc   Verify non-expired cache retention
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testApiResponseCache0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await cache.set('fresh_key', 'fresh_value')
      const value: string | undefined = await cache.get('fresh_key')
      expect(value).assertEqual('fresh_value')
    })

    /**
     * @tc.name   testApiResponseCache0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_API_RESPONSE_CACHE_TEST_0800
     * @tc.desc   Verify cache invalidation manual clear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testApiResponseCache0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await cache.set('key1', 'value1')
      await cache.set('key2', 'value2')
      await cache.delete('key1')
      expect(await cache.has('key1')).assertFalse()
      expect(await cache.has('key2')).assertTrue()
    })

    /**
     * @tc.name   testApiResponseCache0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_API_RESPONSE_CACHE_TEST_0900
     * @tc.desc   Verify TaskPool concurrent cache.set writes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiResponseCache0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(concurrentCacheApiResponse, cache, `api_${i}`, `response_${i}`))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      await Promise.all(promises)
      expect(await cache.length()).assertEqual(5)
      for (let i = 0; i < 5; i++) {
        expect(await cache.get(`api_${i}`)).assertEqual(`response_${i}`)
      }
    })

    /**
     * @tc.name   testApiResponseCache1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_API_RESPONSE_CACHE_TEST_1000
     * @tc.desc   Verify multiple API concurrent cache.set no conflict
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiResponseCache1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(concurrentCacheApiResponse, cache, `endpoint_${i}`, `data_${i}`))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      await Promise.all(promises)
      expect(await cache.length()).assertEqual(10)
      for (let i = 0; i < 10; i++) {
        expect(await cache.has(`endpoint_${i}`)).assertTrue()
        expect(await cache.get(`endpoint_${i}`)).assertEqual(`data_${i}`)
      }
    })

    /**
     * @tc.name   testApiResponseCache1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_API_RESPONSE_CACHE_TEST_1100
     * @tc.desc   Verify cache size monitoring
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiResponseCache1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await cache.length()).assertEqual(0)
      for (let i = 0; i < 10; i++) {
        await cache.set(`key_${i}`, `value_${i}`)
      }
      expect(await cache.length()).assertEqual(10)
      await cache.clear()
      expect(await cache.length()).assertEqual(0)
    })

    /**
     * @tc.name   testApiResponseCache1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_API_RESPONSE_CACHE_TEST_1200
     * @tc.desc   Verify URL as cache key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testApiResponseCache1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await cache.set('https://api.example.com/users', 'users_data')
      expect(await cache.get('https://api.example.com/users')).assertEqual('users_data')
    })

    /**
     * @tc.name   testApiResponseCache1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_API_RESPONSE_CACHE_TEST_1300
     * @tc.desc   Verify set throws Error when key is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiResponseCache1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let caught: boolean = false
      try {
        await cache.set('', 'value')
        expect().assertFail()
      } catch (e) {
        caught = true
        const err: Error = e as Error
        expect(err.message).assertEqual(API_CACHE_EMPTY_KEY_MSG)
      }
      expect(caught).assertTrue()
    })

    /**
     * @tc.name   testApiResponseCache1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_API_RESPONSE_CACHE_TEST_1400
     * @tc.desc   Verify get throws Error when key is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiResponseCache1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let caught: boolean = false
      try {
        await cache.get('')
        expect().assertFail()
      } catch (e) {
        caught = true
        const err: Error = e as Error
        expect(err.message).assertEqual(API_CACHE_EMPTY_KEY_MSG)
      }
      expect(caught).assertTrue()
    })

    /**
     * @tc.name   testApiResponseCache1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_API_RESPONSE_CACHE_TEST_1500
     * @tc.desc   Verify has throws Error when key is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiResponseCache1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let caught: boolean = false
      try {
        await cache.has('')
        expect().assertFail()
      } catch (e) {
        caught = true
        const err: Error = e as Error
        expect(err.message).assertEqual(API_CACHE_EMPTY_KEY_MSG)
      }
      expect(caught).assertTrue()
    })

    /**
     * @tc.name   testApiResponseCache1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_API_RESPONSE_CACHE_TEST_1600
     * @tc.desc   Verify delete throws Error when key is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiResponseCache1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let caught: boolean = false
      try {
        await cache.delete('')
        expect().assertFail()
      } catch (e) {
        caught = true
        const err: Error = e as Error
        expect(err.message).assertEqual(API_CACHE_EMPTY_KEY_MSG)
      }
      expect(caught).assertTrue()
    })

    /**
     * @tc.name   testApiResponseCache1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_API_RESPONSE_CACHE_TEST_1700
     * @tc.desc   Verify isExpired throws Error when key is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiResponseCache1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let caught: boolean = false
      try {
        await cache.isExpired('')
        expect().assertFail()
      } catch (e) {
        caught = true
        const err: Error = e as Error
        expect(err.message).assertEqual(API_CACHE_EMPTY_KEY_MSG)
      }
      expect(caught).assertTrue()
    })

    /**
     * @tc.name   testApiResponseCache1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_API_RESPONSE_CACHE_TEST_1800
     * @tc.desc   Verify exception thrown inside lockAsync is propagated and lock remains usable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiResponseCache1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await cache.set('before_throw', 'v1')
      let caught: boolean = false
      try {
        await cache.throwInsideLockForTest()
        expect().assertFail()
      } catch (e) {
        caught = true
        const err: Error = e as Error
        expect(err.message).assertEqual(API_CACHE_LOCK_THROW_MSG)
      }
      expect(caught).assertTrue()
      await cache.set('after_throw', 'v2')
      expect(await cache.get('before_throw')).assertEqual('v1')
      expect(await cache.get('after_throw')).assertEqual('v2')
    })

    /**
     * @tc.name   testApiResponseCache1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_API_RESPONSE_CACHE_TEST_1900
     * @tc.desc   Verify LRU eviction when cache capacity is exceeded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiResponseCache1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const smallTimestamps: collections.Map<string, number> = new collections.Map<string, number>()
      const smallCacheArg: ArkTSUtils.SendableLruCache<string, string> = new ArkTSUtils.SendableLruCache<string, string>(2)
      const smallCache: ApiCacheManager = new ApiCacheManager(smallTimestamps, smallCacheArg, new ArkTSUtils.locks.AsyncLock())
      await smallCache.set('k1', 'v1')
      await smallCache.set('k2', 'v2')
      await smallCache.set('k3', 'v3')
      expect(await smallCache.length()).assertEqual(2)
      expect(await smallCache.has('k1')).assertFalse()
      expect(await smallCache.has('k2')).assertTrue()
      expect(await smallCache.has('k3')).assertTrue()
      expect(await smallCache.get('k3')).assertEqual('v3')
    })

    /**
     * @tc.name   testApiResponseCache2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_API_RESPONSE_CACHE_TEST_2000
     * @tc.desc   Verify special-character and unicode URL keys are stored and retrieved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiResponseCache2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const specialKey: string = 'GET_/api/用户?q=a&b=1#frag%20x'
      await cache.set(specialKey, '{"ok":true}')
      expect(await cache.has(specialKey)).assertTrue()
      expect(await cache.get(specialKey)).assertEqual('{"ok":true}')
    })

    /**
     * @tc.name   testApiResponseCache2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_API_RESPONSE_CACHE_TEST_2100
     * @tc.desc   Verify very long URL key boundary (length >= 2048)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiResponseCache2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let longKey: string = 'https://api.example.com/v1/'
      for (let i = 0; i < 256; i++) {
        longKey = `${longKey}path_segment_padding_${i}/`
      }
      expect(longKey.length > 2048).assertTrue()
      await cache.set(longKey, 'long_key_value')
      expect(await cache.get(longKey)).assertEqual('long_key_value')
      expect(await cache.has(longKey)).assertTrue()
    })

    /**
     * @tc.name   testApiResponseCache2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_API_RESPONSE_CACHE_TEST_2200
     * @tc.desc   Verify cache capacity boundary of 1 triggers LRU on second write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiResponseCache2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const timestamps: collections.Map<string, number> = new collections.Map<string, number>()
      const cacheArg: ArkTSUtils.SendableLruCache<string, string> = new ArkTSUtils.SendableLruCache<string, string>(1)
      const unitCache: ApiCacheManager = new ApiCacheManager(timestamps, cacheArg, new ArkTSUtils.locks.AsyncLock())
      await unitCache.set('only_old', 'old_value')
      expect(await unitCache.length()).assertEqual(1)
      await unitCache.set('only_new', 'new_value')
      expect(await unitCache.length()).assertEqual(1)
      expect(await unitCache.has('only_old')).assertFalse()
      expect(await unitCache.get('only_new')).assertEqual('new_value')
    })

    /**
     * @tc.name   testApiResponseCache2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_API_RESPONSE_CACHE_TEST_2300
     * @tc.desc   Verify SendableLruCache rejects capacity boundary of 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiResponseCache2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let caught: boolean = false
      let err: BusinessError | null = null
      try {
        // Must throw for capacity 0; do not put assertFail inside try (it would be caught too).
        new ArkTSUtils.SendableLruCache<string, string>(0)
      } catch (e) {
        caught = true
        err = e as BusinessError
        expect(err instanceof Error).assertTrue()
        expect(err.code).assertEqual(401)
        expect(err.message).assertContain('Parameter error')
      }
      expect(caught).assertTrue()
      expect(err !== null).assertTrue()
    })

    /**
     * @tc.name   testApiResponseCache2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_API_RESPONSE_CACHE_TEST_2400
     * @tc.desc   Verify entry remains valid when elapsed is still within TTL boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiResponseCache2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const timestamps: collections.Map<string, number> = new collections.Map<string, number>()
      const cacheArg: ArkTSUtils.SendableLruCache<string, string> = new ArkTSUtils.SendableLruCache<string, string>(100)
      const ttlCache: ApiCacheManager = new ApiCacheManager(timestamps, cacheArg, new ArkTSUtils.locks.AsyncLock())
      const ttlMs: number = 1000
      ttlCache.setTtlForTest(ttlMs)
      await ttlCache.set('exact_ttl', 'still_valid')
      // Keep a stable margin under TTL so wall-clock drift cannot cross the '>' boundary.
      await ttlCache.setTimestampForTest('exact_ttl', Date.now() - ttlMs + 200)
      expect(await ttlCache.isExpired('exact_ttl')).assertFalse()
      expect(await ttlCache.get('exact_ttl')).assertEqual('still_valid')
    })

    /**
     * @tc.name   testApiResponseCache2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_API_RESPONSE_CACHE_TEST_2500
     * @tc.desc   Verify entry expires when elapsed is greater than TTL by one millisecond
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiResponseCache2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const timestamps: collections.Map<string, number> = new collections.Map<string, number>()
      const cacheArg: ArkTSUtils.SendableLruCache<string, string> = new ArkTSUtils.SendableLruCache<string, string>(100)
      const ttlCache: ApiCacheManager = new ApiCacheManager(timestamps, cacheArg, new ArkTSUtils.locks.AsyncLock())
      const ttlMs: number = 1000
      ttlCache.setTtlForTest(ttlMs)
      await ttlCache.set('over_ttl', 'will_expire')
      await ttlCache.setTimestampForTest('over_ttl', Date.now() - ttlMs - 1)
      expect(await ttlCache.isExpired('over_ttl')).assertTrue()
      const value: string | undefined = await ttlCache.get('over_ttl')
      expect(value === undefined).assertTrue()
    })

    /**
     * @tc.name   testApiResponseCache2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_API_RESPONSE_CACHE_TEST_2600
     * @tc.desc   Verify TTL boundary of 0 expires after any positive elapsed time
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testApiResponseCache2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const timestamps: collections.Map<string, number> = new collections.Map<string, number>()
      const cacheArg: ArkTSUtils.SendableLruCache<string, string> = new ArkTSUtils.SendableLruCache<string, string>(100)
      const ttlCache: ApiCacheManager = new ApiCacheManager(timestamps, cacheArg, new ArkTSUtils.locks.AsyncLock())
      ttlCache.setTtlForTest(0)
      await ttlCache.set('ttl_zero', 'zero_ttl_value')
      await Utils.sleep(10)
      expect(await ttlCache.isExpired('ttl_zero')).assertTrue()
      const value: string | undefined = await ttlCache.get('ttl_zero')
      expect(value === undefined).assertTrue()
    })

    /**
     * @tc.name   testApiResponseCache2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_API_RESPONSE_CACHE_TEST_2700
     * @tc.desc   Verify high-contention concurrent writes beyond lock contention scale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiResponseCache2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const writeCount: number = 50
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < writeCount; i++) {
        tasks.push(new taskpool.Task(concurrentCacheApiResponse, cache, `contention_${i}`, `payload_${i}`))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      await Promise.all(promises)
      expect(await cache.length()).assertEqual(writeCount)
      for (let i = 0; i < writeCount; i++) {
        expect(await cache.get(`contention_${i}`)).assertEqual(`payload_${i}`)
      }
    })

    /**
     * @tc.name   testApiResponseCache2800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_API_RESPONSE_CACHE_TEST_2800
     * @tc.desc   Verify concurrent writes that exceed capacity keep length at capacity via LRU
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testApiResponseCache2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const capacity: number = 10
      const writeCount: number = 30
      const timestamps: collections.Map<string, number> = new collections.Map<string, number>()
      const cacheArg: ArkTSUtils.SendableLruCache<string, string> = new ArkTSUtils.SendableLruCache<string, string>(capacity)
      const limitedCache: ApiCacheManager = new ApiCacheManager(timestamps, cacheArg, new ArkTSUtils.locks.AsyncLock())
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < writeCount; i++) {
        tasks.push(new taskpool.Task(concurrentCacheApiResponse, limitedCache, `overflow_${i}`, `data_${i}`))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      await Promise.all(promises)
      expect(await limitedCache.length()).assertEqual(capacity)
    })
  })
}
