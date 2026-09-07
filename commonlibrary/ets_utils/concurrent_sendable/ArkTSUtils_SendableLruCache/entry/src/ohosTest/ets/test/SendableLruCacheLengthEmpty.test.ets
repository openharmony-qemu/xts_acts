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

export default function SendableLruCacheLengthEmptyTest() {
  describe('SendableLruCacheLengthEmptyTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   testSendableLRUCacheLength001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_LENGTH_EMPTY_0001
     * @tc.desc   Obtains the total number of values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheLength001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheLength001";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        let result = that.length
        expect(result).assertEqual(0)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheLength002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_LENGTH_EMPTY_0002
     * @tc.desc   Obtains the total number of values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheLength002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheLength002";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        let result = that.length
        expect(result).assertEqual(1)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheLength003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_LENGTH_EMPTY_0003
     * @tc.desc   Obtains the total number of values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheLength003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheLength003";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put('abc', 2)
        that.put('string', 'string')
        let result = that.length
        expect(result).assertEqual(2)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheLength004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_LENGTH_EMPTY_0004
     * @tc.desc   Obtains the total number of values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheLength004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheLength004";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.put('abcd', 15)
        that.put('abcd', 20)
        let result = that.length
        expect(result).assertEqual(3)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheLength005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_LENGTH_EMPTY_0005
     * @tc.desc   Obtains the total number of values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheLength005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheLength005";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.put('abcd', 15)
        that.put('abcd', 20)
        that.updateCapacity(3);
        that.put(5, 33);
        that.put(25, 35);
        let result = that.length
        expect(result).assertEqual(3)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheIsEmpty001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_LENGTH_EMPTY_0006
     * @tc.desc   Checks whether the current buffer is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheIsEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheIsEmpty001";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        let result = that.isEmpty()
        expect(result).assertEqual(false)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheIsEmpty002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_LENGTH_EMPTY_0007
     * @tc.desc   Checks whether the current buffer is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheIsEmpty002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheIsEmpty002";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        let result = that.isEmpty()
        expect(result).assertEqual(false)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheIsEmpty003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_LENGTH_EMPTY_0008
     * @tc.desc   Checks whether the current buffer is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheIsEmpty003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheIsEmpty003";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.put(5, 33)
        let result = that.isEmpty()
        expect(result).assertEqual(false)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheIsEmpty004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_LENGTH_EMPTY_0009
     * @tc.desc   Checks whether the current buffer is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheIsEmpty004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheIsEmpty004";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put('abc', 2)
        that.put('string', 10)
        that.put('ab', 'abc')
        let result = that.isEmpty()
        expect(result).assertEqual(false)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheIsEmpty005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_LENGTH_EMPTY_0010
     * @tc.desc   Checks whether the current buffer is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheIsEmpty005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheIsEmpty005";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.put(5, 33);
        that.clear()
        let result = that.isEmpty()
        expect(result).assertEqual(true)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheEmpty001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_LENGTH_EMPTY_0011
     * @tc.desc   keys() on empty cache returns empty array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheEmpty001";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      let keys = cache.keys()
      expect(keys.length).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheEmpty002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_LENGTH_EMPTY_0012
     * @tc.desc   values() on empty cache returns empty array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheEmpty002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheEmpty002";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      let values = cache.values()
      expect(values.length).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheEmpty003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_LENGTH_EMPTY_0013
     * @tc.desc   entries() on empty cache produces no iteration items.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheEmpty003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheEmpty003";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      let count = 0
      for (let entry of cache.entries()) {
        count++
      }
      expect(count).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheEmpty004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_LENGTH_EMPTY_0014
     * @tc.desc   toString() on empty cache returns the expected format.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheEmpty004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheEmpty004";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      let str = cache.toString()
      expect(str).assertEqual('SendableLruCache[ maxSize = 64, hits = 0, misses = 0, hitRate = 0% ]')
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheKeyBoundary001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_LENGTH_EMPTY_0015
     * @tc.desc   Use empty string '' as key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheKeyBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheKeyBoundary001";
      let cache = new ArkTSUtils.SendableLruCache<string, number>()
      cache.put('', 10)
      let val = cache.get('')
      expect(val).assertEqual(10)
      let contains = cache.contains('')
      expect(contains).assertEqual(true)
      let keys = cache.keys()
      expect(keys[0]).assertEqual('')
      let removed = cache.remove('')
      expect(removed).assertEqual(10)
      expect(cache.contains('')).assertEqual(false)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheKeyBoundary002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_LENGTH_EMPTY_0016
     * @tc.desc   Use long string as key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheKeyBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheKeyBoundary002";
      let cache = new ArkTSUtils.SendableLruCache<string, number>()
      let longKey = ''
      for (let i = 0; i < 1000; i++) {
        longKey = longKey + 'a'
      }
      cache.put(longKey, 10)
      let val = cache.get(longKey)
      expect(val).assertEqual(10)
      let contains = cache.contains(longKey)
      expect(contains).assertEqual(true)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheKeyBoundary003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_LENGTH_EMPTY_0017
     * @tc.desc   Use 0 as numeric key (boundary value).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheKeyBoundary003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheKeyBoundary003";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      cache.put(0, 100)
      let val = cache.get(0)
      expect(val).assertEqual(100)
      let contains = cache.contains(0)
      expect(contains).assertEqual(true)
      let removed = cache.remove(0)
      expect(removed).assertEqual(100)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheRepeat001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_LENGTH_EMPTY_0018
     * @tc.desc   Repeated get(same key) accumulates getMatchCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheRepeat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheRepeat001";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      cache.put(1, 10)
      cache.get(1)
      cache.get(1)
      cache.get(1)
      let matchCount = cache.getMatchCount()
      expect(matchCount).assertEqual(3)
      let missCount = cache.getMissCount()
      expect(missCount).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheRepeat002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_LENGTH_EMPTY_0019
     * @tc.desc   Repeated contains(same key) accumulates getMatchCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheRepeat002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheRepeat002";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      cache.put(1, 10)
      cache.contains(1)
      cache.contains(1)
      let matchCount = cache.getMatchCount()
      expect(matchCount).assertEqual(2)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheRepeat003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_LENGTH_EMPTY_0020
     * @tc.desc   Repeated remove(same key), the second call returns undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheRepeat003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheRepeat003";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      cache.put(1, 10)
      let first = cache.remove(1)
      expect(first).assertEqual(10)
      let second = cache.remove(1)
      expect(second).assertEqual(undefined)
      let len = cache.length
      expect(len).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheRepeat004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_LENGTH_EMPTY_0021
     * @tc.desc   Repeated clear() keeps length at 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheRepeat004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheRepeat004";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      cache.put(1, 10)
      cache.clear()
      let len1 = cache.length
      expect(len1).assertEqual(0)
      cache.clear()
      let len2 = cache.length
      expect(len2).assertEqual(0)
      let isEmpty = cache.isEmpty()
      expect(isEmpty).assertEqual(true)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheRepeat005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_LENGTH_EMPTY_0022
     * @tc.desc   Repeated updateCapacity with the same value keeps capacity unchanged.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheRepeat005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheRepeat005";
      let cache = new ArkTSUtils.SendableLruCache<number, number>(50)
      cache.updateCapacity(20)
      let cap1 = cache.getCapacity()
      expect(cap1).assertEqual(20)
      cache.updateCapacity(20)
      let cap2 = cache.getCapacity()
      expect(cap2).assertEqual(20)
      cache.put(1, 10)
      cache.put(2, 20)
      let len = cache.length
      expect(len).assertEqual(2)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheEmptyOperation001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_LENGTH_EMPTY_0023
     * @tc.desc   isEmpty() returns true on a fresh empty cache.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheEmptyOperation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheEmptyOperation001";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      let isEmpty = cache.isEmpty()
      expect(isEmpty).assertEqual(true)
      let len = cache.length
      expect(len).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheEmptyOperation002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_LENGTH_EMPTY_0024
     * @tc.desc   get(anyKey) on empty cache returns undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheEmptyOperation002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheEmptyOperation002";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      let val = cache.get(1)
      expect(val).assertEqual(undefined)
      let missCount = cache.getMissCount()
      expect(missCount).assertEqual(1)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheEmptyOperation003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_LENGTH_EMPTY_0025
     * @tc.desc   remove(anyKey) on empty cache returns undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheEmptyOperation003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheEmptyOperation003";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      let removed = cache.remove(1)
      expect(removed).assertEqual(undefined)
      let len = cache.length
      expect(len).assertEqual(0)
      let isEmpty = cache.isEmpty()
      expect(isEmpty).assertEqual(true)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheEmptyOperation004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_LENGTH_EMPTY_0026
     * @tc.desc   contains(anyKey) on empty cache returns false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheEmptyOperation004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheEmptyOperation004";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      let contains = cache.contains(1)
      expect(contains).assertEqual(false)
      let len = cache.length
      expect(len).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheEmptyOperation005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_LENGTH_EMPTY_0027
     * @tc.desc   All stat counters on a fresh empty cache are 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheEmptyOperation005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheEmptyOperation005";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      expect(cache.getMatchCount()).assertEqual(0)
      expect(cache.getMissCount()).assertEqual(0)
      expect(cache.getPutCount()).assertEqual(0)
      expect(cache.getRemoveCount()).assertEqual(0)
      expect(cache.getCreateCount()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   sendableLruCacheEmptyString001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_LENGTH_EMPTY_0028
     * @tc.desc   Test SendableLruCache with empty string key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sendableLruCacheEmptyString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG: string = 'sendableLruCacheEmptyString001';
      try {
        let cache = new ArkTSUtils.SendableLruCache<string, number>();

        // Add a value with empty string key
        cache.put("", 100);
        let getResult = cache.get("");
        expect(getResult).assertEqual(100);

        // Test contains with empty string key
        let containsResult = cache.contains("");
        expect(containsResult).assertTrue();

        // Test remove with empty string key
        let removeResult = cache.remove("");
        expect(removeResult).assertEqual(100);

        // Verify removal
        let afterRemoveResult = cache.get("");
        expect(afterRemoveResult).assertUndefined();
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

  })
}
