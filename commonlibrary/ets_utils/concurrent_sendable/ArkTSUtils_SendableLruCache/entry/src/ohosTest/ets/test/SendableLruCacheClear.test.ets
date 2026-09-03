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
import { CreateDefaultLruCache } from './SendableLruCacheHelpers'

export default function SendableLruCacheClearTest() {
  describe('SendableLruCacheClearTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   testSendableLRUCacheClear001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CLEAR_0001
     * @tc.desc   Clears key-value pairs from the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheClear001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheClear001";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        let result1 = that.length
        that.clear()
        let result2 = that.length
        expect(result1).assertEqual(1)
        expect(result2).assertEqual(0)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheClear002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CLEAR_0002
     * @tc.desc   Clears key-value pairs from the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheClear002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheClear002";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.put(5, 33);
        that.put(25, 35);
        let result1 = that.length
        that.clear()
        let result2 = that.length
        expect(result1).assertEqual(4)
        expect(result2).assertEqual(0)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheClear003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CLEAR_0003
     * @tc.desc   Clears key-value pairs from the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheClear003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheClear003";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put('abc', 2)
        that.put(2, 'abc')
        that.put('ancd', 'abcd')
        that.put(10, 35)
        let result1 = that.length
        that.clear()
        let result2 = that.length
        expect(result1).assertEqual(4)
        expect(result2).assertEqual(0)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheClear004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CLEAR_0004
     * @tc.desc   Clears key-value pairs from the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheClear004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheClear004";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.put(5, 33);
        that.updateCapacity(3);
        let result1 = that.length
        that.clear()
        let result2 = that.length
        expect(result1).assertEqual(3)
        expect(result2).assertEqual(0)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheClear005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CLEAR_0005
     * @tc.desc   Clears key-value pairs from the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheClear005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheClear005";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.put(5, 33);
        that.put('abcd', 'string');
        that.updateCapacity(2);
        let result1 = that.length
        that.clear()
        let result2 = that.length
        expect(result1).assertEqual(2)
        expect(result2).assertEqual(0)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheClearStats001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CLEAR_0006
     * @tc.desc   Verify stats counters are retained (not reset) after clear(); only cache entries are cleared.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheClearStats001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheClearStats001";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      cache.put(1, 10)
      cache.put(2, 20)
      cache.get(1)
      cache.get(3)
      let beforeLength = cache.length
      expect(beforeLength).assertEqual(2)
      let beforeMatch = cache.getMatchCount()
      let beforeMiss = cache.getMissCount()
      let beforePut = cache.getPutCount()
      let beforeRemove = cache.getRemoveCount()
      expect(beforeMatch).assertEqual(1)
      expect(beforeMiss).assertEqual(1)
      expect(beforePut).assertEqual(2)
      expect(beforeRemove).assertEqual(0)
      cache.clear()
      let afterLength = cache.length
      expect(afterLength).assertEqual(0)
      expect(cache.isEmpty()).assertEqual(true)
      let afterMatch = cache.getMatchCount()
      let afterMiss = cache.getMissCount()
      let afterPut = cache.getPutCount()
      let afterRemove = cache.getRemoveCount()
      console.info(`${TAG} after clear: match=${afterMatch}, miss=${afterMiss}, put=${afterPut}, remove=${afterRemove}`);
      expect(afterMatch).assertEqual(beforeMatch)
      expect(afterMiss).assertEqual(beforeMiss)
      expect(afterPut).assertEqual(beforePut)
      expect(afterRemove).assertEqual(beforeRemove)
      cache.put(1, 10)
      cache.get(1)
      expect(cache.getPutCount()).assertEqual(beforePut + 1)
      expect(cache.getMatchCount()).assertEqual(beforeMatch + 1)
      expect(cache.length).assertEqual(1)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheClearStats002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CLEAR_0007
     * @tc.desc   After clear(), non-zero putCount/matchCount/missCount/removeCount are retained and accumulate on subsequent operations.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheClearStats002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheClearStats002";
      let cache = new ArkTSUtils.SendableLruCache<number, number>(2)
      cache.put(1, 10)
      cache.put(2, 20)
      cache.put(3, 30)   // exceeds capacity 2, evicts key 1 -> removeCount=1
      cache.get(2)       // hit -> matchCount=1
      cache.get(99)      // miss (base createDefault returns undefined) -> missCount=1
      let beforeCap = cache.getCapacity()
      let beforePut = cache.getPutCount()
      let beforeMatch = cache.getMatchCount()
      let beforeMiss = cache.getMissCount()
      let beforeRemove = cache.getRemoveCount()
      let beforeCreate = cache.getCreateCount()
      expect(beforeCap).assertEqual(2)
      expect(beforePut).assertEqual(3)
      expect(beforeMatch).assertEqual(1)
      expect(beforeMiss).assertEqual(1)
      expect(beforeRemove).assertEqual(1)
      expect(beforeCreate).assertEqual(0)
      cache.clear()
      expect(cache.length).assertEqual(0)
      expect(cache.isEmpty()).assertEqual(true)
      // capacity is a configuration value, not entries -> unchanged by clear
      expect(cache.getCapacity()).assertEqual(beforeCap)
      // all stat counters retained (clear only removes entries, not counters)
      expect(cache.getPutCount()).assertEqual(beforePut)
      expect(cache.getMatchCount()).assertEqual(beforeMatch)
      expect(cache.getMissCount()).assertEqual(beforeMiss)
      expect(cache.getRemoveCount()).assertEqual(beforeRemove)
      expect(cache.getCreateCount()).assertEqual(beforeCreate)
      // subsequent operations accumulate on top of retained values
      cache.put(10, 100)   // putCount = beforePut + 1
      cache.put(20, 200)   // fill capacity 2
      cache.put(30, 300)   // exceeds capacity, evicts LRU(key 10) -> removeCount = beforeRemove + 1
      let keysAfter = cache.keys()
      expect(keysAfter.indexOf(10)).assertEqual(-1)
      cache.get(20)         // hit -> matchCount = beforeMatch + 1
      cache.get(88)         // miss -> missCount = beforeMiss + 1
      expect(cache.getPutCount()).assertEqual(beforePut + 3)
      expect(cache.getMatchCount()).assertEqual(beforeMatch + 1)
      expect(cache.getMissCount()).assertEqual(beforeMiss + 1)
      expect(cache.getRemoveCount()).assertEqual(beforeRemove + 1)
      // capacity unaffected by put/get/eviction (only updateCapacity changes it)
      expect(cache.getCapacity()).assertEqual(beforeCap)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheClearStats003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CLEAR_0008
     * @tc.desc   After clear(), non-zero createCount (from createDefault) is retained and accumulates on subsequent get(missing key).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheClearStats003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheClearStats003";
      let cache = new CreateDefaultLruCache()   // createDefault returns key + 100
      cache.put(1, 10)
      let r5 = cache.get(5)   // missing -> createDefault(5)=105, createCount=1
      expect(r5).assertEqual(105)
      let r7 = cache.get(7)   // missing -> createDefault(7)=107, createCount=2
      expect(r7).assertEqual(107)
      let beforeCreate = cache.getCreateCount()
      let beforePut = cache.getPutCount()
      expect(beforeCreate).assertEqual(2)
      cache.clear()
      expect(cache.length).assertEqual(0)
      // createCount retained (not reset by clear)
      expect(cache.getCreateCount()).assertEqual(beforeCreate)
      expect(cache.getPutCount()).assertEqual(beforePut)
      // get(missing) after clear triggers createDefault again, accumulates on retained value
      let r9 = cache.get(9)   // missing -> createDefault(9)=109, createCount = beforeCreate + 1
      expect(r9).assertEqual(109)
      expect(cache.getCreateCount()).assertEqual(beforeCreate + 1)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheClearStats004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CLEAR_0009
     * @tc.desc   After clear(), toString() stays identical because counters (hits/misses/hitRate) are retained, not reset.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheClearStats004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheClearStats004";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      cache.put(1, 10)
      cache.get(1)    // hit -> hits=1
      cache.get(2)    // miss -> misses=1
      let strBefore = cache.toString()
      expect(strBefore).assertEqual('SendableLruCache[ maxSize = 64, hits = 1, misses = 1, hitRate = 50% ]')
      cache.clear()
      expect(cache.length).assertEqual(0)
      // counters retained -> toString output unchanged
      let strAfter = cache.toString()
      expect(strAfter).assertEqual(strBefore)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheClearStats005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CLEAR_0010
     * @tc.desc   Manual remove(key) does not increment getRemoveCount (eviction counter); only capacity-exceeded eviction increments it.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheClearStats005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheClearStats005";
      let cache = new ArkTSUtils.SendableLruCache<number, number>(3)
      cache.put(1, 10)
      cache.put(2, 20)
      cache.put(3, 30)
      let removeCount0 = cache.getRemoveCount()
      expect(removeCount0).assertEqual(0)   // no eviction yet
      // manual remove (within capacity) is NOT an eviction -> removeCount unchanged
      cache.remove(2)
      expect(cache.getRemoveCount()).assertEqual(removeCount0)
      expect(cache.length).assertEqual(2)
      // capacity-exceeded put triggers eviction -> removeCount increments
      cache.put(4, 40)   // length=3, at capacity, no eviction
      cache.put(5, 50)   // length=4 > capacity 3, evicts LRU -> removeCount=1
      expect(cache.getRemoveCount()).assertEqual(removeCount0 + 1)
      done();
    })

  })
}
