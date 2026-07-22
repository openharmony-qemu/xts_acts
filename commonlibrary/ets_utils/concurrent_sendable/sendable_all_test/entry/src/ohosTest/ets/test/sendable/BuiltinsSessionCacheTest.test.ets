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
import { collections } from '@kit.ArkTS'
import { ArkTSUtils } from '@kit.ArkTS'
import Utils from '../utils'

@Sendable
class SessionCacheManager {
  public cache_: ArkTSUtils.SendableLruCache<string, string>
  public timestamps_: collections.Map<string, number>

  constructor(timestamps_: collections.Map<string, number>, cache_: ArkTSUtils.SendableLruCache<string, string>) {
    this.cache_ = cache_
    this.timestamps_ = timestamps_
  }

  public ttlMs_: number = 30000
  public createdCount_: number = 0
  public expiredCount_: number = 0

  createSession(sessionId: string, userData: string): void {
    this.cache_.put(sessionId, userData)
    this.timestamps_.set(sessionId, Date.now())
    this.createdCount_++
  }

  getSession(sessionId: string): string | undefined {
    return this.cache_.get(sessionId)
  }

  deleteSession(sessionId: string): void {
    this.cache_.remove(sessionId)
    this.timestamps_.delete(sessionId)
  }

  renewSession(sessionId: string): void {
    if (this.cache_.contains(sessionId)) {
      this.timestamps_.set(sessionId, Date.now())
    }
  }

  isExpired(sessionId: string): boolean {
    const timestamp: number | undefined = this.timestamps_.get(sessionId)
    if (timestamp === undefined) {
      return true
    }
    return (Date.now() - timestamp) > this.ttlMs_
  }

  clear(): void {
    this.cache_.clear()
    this.timestamps_.clear()
  }

  length(): number {
    return this.cache_.length
  }

  getCreatedCount(): number {
    return this.createdCount_
  }

  getExpiredCount(): number {
    return this.expiredCount_
  }

  incrementExpired(): void {
    this.expiredCount_++
  }
}

@Concurrent
function concurrentCreateSession(sessionId: string, data: string): string {
  return `${sessionId}=${data}`
}

export default function BuiltinsSessionCacheTest(): void {
  describe('BuiltinsSessionCacheTest', (): void => {
    let cache: SessionCacheManager

    beforeAll((): void => {})
    beforeEach((): void => {
      const timestampsArg: collections.Map<string, number> = new collections.Map<string, number>()
      const cacheArg: ArkTSUtils.SendableLruCache<string, string> = new ArkTSUtils.SendableLruCache<string, string>(200)
      cache = new SessionCacheManager(timestampsArg, cacheArg)
    })
    afterEach((): void => {})
    afterAll((): void => {})

    /**
     * @tc.name   testSessionCache0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SESSION_CACHE_TEST_0100
     * @tc.desc   Verify Session creation cache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSessionCache0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      cache.createSession('sess_001', '{"userId":1,"name":"user1"}')
      expect(cache.length()).assertEqual(1)
      expect(cache.getCreatedCount()).assertEqual(1)
    })

    /**
     * @tc.name   testSessionCache0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SESSION_CACHE_TEST_0200
     * @tc.desc   Verify Session query
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSessionCache0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      cache.createSession('sess_001', '{"userId":1}')
      const data: string | undefined = cache.getSession('sess_001')
      expect(data).assertEqual('{"userId":1}')
    })

    /**
     * @tc.name   testSessionCache0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SESSION_CACHE_TEST_0300
     * @tc.desc   Verify Session deletion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSessionCache0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      cache.createSession('sess_001', '{"userId":1}')
      expect(cache.length()).assertEqual(1)
      cache.deleteSession('sess_001')
      expect(cache.length()).assertEqual(0)
      expect(cache.getSession('sess_001') === undefined).assertTrue()
    })

    /**
     * @tc.name   testSessionCache0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SESSION_CACHE_TEST_0400
     * @tc.desc   Verify Session expiration detection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSessionCache0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const shortTimestamps: collections.Map<string, number> = new collections.Map<string, number>()
      const shortCacheArg: ArkTSUtils.SendableLruCache<string, string> = new ArkTSUtils.SendableLruCache<string, string>(200)
      const shortCache: SessionCacheManager = new SessionCacheManager(shortTimestamps, shortCacheArg)
      shortCache.ttlMs_ = 100
      shortCache.createSession('sess_short', '{"userId":1}')
      expect(shortCache.isExpired('sess_short')).assertFalse()
      await Utils.sleep(150)
      expect(shortCache.isExpired('sess_short')).assertTrue()
    })

    /**
     * @tc.name   testSessionCache0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SESSION_CACHE_TEST_0500
     * @tc.desc   Verify Session renewal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSessionCache0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const renewTimestamps: collections.Map<string, number> = new collections.Map<string, number>()
      const renewCacheArg: ArkTSUtils.SendableLruCache<string, string> = new ArkTSUtils.SendableLruCache<string, string>(200)
      const shortCache: SessionCacheManager = new SessionCacheManager(renewTimestamps, renewCacheArg)
      shortCache.ttlMs_ = 200
      shortCache.createSession('sess_renew', '{"userId":1}')
      await Utils.sleep(100)
      shortCache.renewSession('sess_renew')
      await Utils.sleep(100)
      expect(shortCache.isExpired('sess_renew')).assertFalse()
    })

    /**
     * @tc.name   testSessionCache0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SESSION_CACHE_TEST_0600
     * @tc.desc   Verify multi-user concurrent Session
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionCache0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(concurrentCreateSession, `sess_${i}`, `{"userId":${i}}`))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        const parts: string[] = (results[i] as string).split('=')
        cache.createSession(parts[0], parts[1])
      }
      expect(cache.length()).assertEqual(5)
    })

    /**
     * @tc.name   testSessionCache0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SESSION_CACHE_TEST_0700
     * @tc.desc   Verify Session no conflict
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionCache0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(concurrentCreateSession, `user_sess_${i}`, `{"name":"user_${i}"}`))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        const parts: string[] = (results[i] as string).split('=')
        cache.createSession(parts[0], parts[1])
      }
      for (let i = 0; i < 10; i++) {
        const data: string | undefined = cache.getSession(`user_sess_${i}`)
        expect(data !== undefined).assertTrue()
      }
    })

    /**
     * @tc.name   testSessionCache0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SESSION_CACHE_TEST_0800
     * @tc.desc   Verify TaskPool concurrent create Session
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSessionCache0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 20; i++) {
        tasks.push(new taskpool.Task(concurrentCreateSession, `tp_sess_${i}`, `{"tpUser":${i}}`))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        const parts: string[] = (results[i] as string).split('=')
        cache.createSession(parts[0], parts[1])
      }
      expect(cache.length()).assertEqual(20)
    })

    /**
     * @tc.name   testSessionCache0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SESSION_CACHE_TEST_0900
     * @tc.desc   Verify Session creation statistics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSessionCache0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      for (let i = 0; i < 5; i++) {
        cache.createSession(`sess_${i}`, `{"id":${i}}`)
      }
      expect(cache.getCreatedCount()).assertEqual(5)
    })

    /**
     * @tc.name   testSessionCache1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SESSION_CACHE_TEST_1000
     * @tc.desc   Verify active Session count monitoring
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSessionCache1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let i = 0; i < 10; i++) {
        cache.createSession(`active_${i}`, `{"id":${i}}`)
      }
      expect(cache.length()).assertEqual(10)
      cache.deleteSession('active_0')
      cache.deleteSession('active_1')
      expect(cache.length()).assertEqual(8)
    })

    /**
     * @tc.name   testSessionCache1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SESSION_CACHE_TEST_1100
     * @tc.desc   Verify Session isolation verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSessionCache1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      cache.createSession('user_A', '{"role":"admin"}')
      cache.createSession('user_B', '{"role":"guest"}')
      expect(cache.getSession('user_A')).assertEqual('{"role":"admin"}')
      expect(cache.getSession('user_B')).assertEqual('{"role":"guest"}')
    })
  })
}
