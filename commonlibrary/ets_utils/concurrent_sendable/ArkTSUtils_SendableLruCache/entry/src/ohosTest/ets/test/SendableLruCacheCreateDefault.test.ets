/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium'
import { ArkTSUtils } from '@kit.ArkTS'
import { CreateDefaultLruCache, CreateDefaultUndefinedLruCache } from './SendableLruCacheHelpers'

export default function SendableLruCacheCreateDefaultTest() {
  describe('SendableLruCacheCreateDefaultTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   testSendableLRUCacheCreateDefault001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CREATE_DEFAULT_0001
     * @tc.desc   Override createDefault to return non-undefined, get(missing key) returns default and adds entry.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheCreateDefault001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheCreateDefault001";
      let cache = new CreateDefaultLruCache()
      cache.put(1, 10)
      let result = cache.get(5)
      expect(result).assertEqual(105)
      let createCount = cache.getCreateCount()
      expect(createCount).assertEqual(1)
      let len = cache.length
      expect(len).assertEqual(2)
      let contains = cache.contains(5)
      expect(contains).assertEqual(true)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheCreateDefault002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CREATE_DEFAULT_0002
     * @tc.desc   Override createDefault to return undefined, get(missing key) returns undefined without adding entry.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheCreateDefault002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheCreateDefault002";
      let cache = new CreateDefaultUndefinedLruCache()
      cache.put(1, 10)
      let result = cache.get(5)
      expect(result).assertEqual(undefined)
      let createCount = cache.getCreateCount()
      expect(createCount).assertEqual(0)
      let len = cache.length
      expect(len).assertEqual(1)
      let contains = cache.contains(5)
      expect(contains).assertEqual(false)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheCreateDefault003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CREATE_DEFAULT_0003
     * @tc.desc   Multiple get(missing key) calls accumulate getCreateCount correctly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheCreateDefault003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheCreateDefault003";
      let cache = new CreateDefaultLruCache()
      cache.put(1, 10)
      cache.get(5)
      cache.get(7)
      cache.get(9)
      let createCount = cache.getCreateCount()
      expect(createCount).assertEqual(3)
      let len = cache.length
      expect(len).assertEqual(4)
      let r5 = cache.get(5)
      expect(r5).assertEqual(105)
      let createCountAfterHit = cache.getCreateCount()
      expect(createCountAfterHit).assertEqual(3)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheCreateDefault004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CREATE_DEFAULT_0004
     * @tc.desc   get(existing key) does not invoke createDefault.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheCreateDefault004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheCreateDefault004";
      let cache = new CreateDefaultLruCache()
      cache.put(1, 10)
      let result = cache.get(1)
      expect(result).assertEqual(10)
      let createCount = cache.getCreateCount()
      expect(createCount).assertEqual(0)
      let len = cache.length
      expect(len).assertEqual(1)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheCreateDefault005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CREATE_DEFAULT_0005
     * @tc.desc   createDefault triggered entry addition causes LRU eviction when capacity exceeded.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheCreateDefault005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheCreateDefault005";
      let cache = new CreateDefaultLruCache()
      cache.updateCapacity(2)
      cache.put(1, 10)
      cache.put(2, 20)
      let result = cache.get(3)
      expect(result).assertEqual(103)
      let removeCount = cache.getRemoveCount()
      expect(removeCount).assertEqual(1)
      let len = cache.length
      expect(len).assertEqual(2)
      let contains1 = cache.contains(1)
      expect(contains1).assertEqual(false)
      let contains3 = cache.contains(3)
      expect(contains3).assertEqual(true)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheEvictOrder001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CREATE_DEFAULT_0006
     * @tc.desc   When capacity exceeded by put, the least recently used key is evicted.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheEvictOrder001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheEvictOrder001";
      let cache = new ArkTSUtils.SendableLruCache<number, number>(2)
      cache.put(1, 10)
      cache.put(2, 20)
      cache.put(3, 30)
      let contains1 = cache.contains(1)
      expect(contains1).assertEqual(false)
      let contains2 = cache.contains(2)
      expect(contains2).assertEqual(true)
      let contains3 = cache.contains(3)
      expect(contains3).assertEqual(true)
      let removeCount = cache.getRemoveCount()
      expect(removeCount).assertEqual(1)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheEvictOrder002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CREATE_DEFAULT_0007
     * @tc.desc   get(LRU key) refreshes its position so it is not evicted on next put.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheEvictOrder002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheEvictOrder002";
      let cache = new ArkTSUtils.SendableLruCache<number, number>(2)
      cache.put(1, 10)
      cache.put(2, 20)
      cache.get(1)
      cache.put(3, 30)
      let contains1 = cache.contains(1)
      expect(contains1).assertEqual(true)
      let contains2 = cache.contains(2)
      expect(contains2).assertEqual(false)
      let contains3 = cache.contains(3)
      expect(contains3).assertEqual(true)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheEvictOrder003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CREATE_DEFAULT_0008
     * @tc.desc   contains(key) refreshes LRU position so the other key is evicted.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheEvictOrder003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheEvictOrder003";
      let cache = new ArkTSUtils.SendableLruCache<number, number>(2)
      cache.put(1, 10)
      cache.put(2, 20)
      cache.contains(1)
      cache.put(3, 30)
      let contains1 = cache.contains(1)
      expect(contains1).assertEqual(true)
      let contains2 = cache.contains(2)
      expect(contains2).assertEqual(false)
      let contains3 = cache.contains(3)
      expect(contains3).assertEqual(true)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheEvictOrder004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CREATE_DEFAULT_0009
     * @tc.desc   updateCapacity shrink evicts least recently used keys in order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheEvictOrder004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheEvictOrder004";
      let cache = new ArkTSUtils.SendableLruCache<number, number>(4)
      cache.put(1, 10)
      cache.put(2, 20)
      cache.put(3, 30)
      cache.put(4, 40)
      cache.updateCapacity(2)
      let contains1 = cache.contains(1)
      expect(contains1).assertEqual(false)
      let contains2 = cache.contains(2)
      expect(contains2).assertEqual(false)
      let contains3 = cache.contains(3)
      expect(contains3).assertEqual(true)
      let contains4 = cache.contains(4)
      expect(contains4).assertEqual(true)
      let removeCount = cache.getRemoveCount()
      expect(removeCount).assertEqual(2)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheStress001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CREATE_DEFAULT_0010
     * @tc.desc   Stress test with 1000 put operations on capacity-100 cache.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheStress001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheStress001";
      let cache = new ArkTSUtils.SendableLruCache<number, number>(100)
      for (let i = 0; i < 1000; i++) {
        cache.put(i, i * 2)
      }
      let len = cache.length
      expect(len).assertEqual(100)
      let putCount = cache.getPutCount()
      expect(putCount).assertEqual(1000)
      let removeCount = cache.getRemoveCount()
      expect(removeCount).assertEqual(900)
      let lastKey = cache.get(999)
      expect(lastKey).assertEqual(1998)
      let firstEvictedKey = cache.get(0)
      expect(firstEvictedKey === undefined || firstEvictedKey === 100).assertTrue()
      done();
    })

  })
}
