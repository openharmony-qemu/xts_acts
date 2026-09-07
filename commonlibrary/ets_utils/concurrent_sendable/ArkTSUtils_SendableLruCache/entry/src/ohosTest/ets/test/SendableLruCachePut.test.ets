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

export default function SendableLruCachePutTest() {
  describe('SendableLruCachePutTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   testSendableLRUCachePut001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_PUT_0001
     * @tc.desc   Adds a key-value pair to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCachePut001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCachePut001";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        let temp = that.put('1111', 'bcjdshc')
        expect(temp).assertEqual('bcjdshc')
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCachePut002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_PUT_0002
     * @tc.desc   Adds a key-value pair to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCachePut002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCachePut002";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        let temp1 = that.put('1111', 'bcjdshc')
        let temp2 = that.put('1111', 13)
        expect(temp2).assertEqual(13)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCachePut003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_PUT_0003
     * @tc.desc   Adds a key-value pair to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCachePut003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCachePut003";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        let temp = that.put('1111', 'bcjdshc')
        let temp1 = that.put(1, 12)
        let temp2 = that.put(2, 5)
        let temp3 = that.put(2, 'adasfdad')
        let temp4 = that.put('abc', 10)
        expect(temp1).assertEqual(12)
        expect(temp2).assertEqual(5)
        expect(temp3).assertEqual('adasfdad')
        expect(temp4).assertEqual(10)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCachePut004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_PUT_0004
     * @tc.desc   Adds a key-value pair to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCachePut004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCachePut004";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        let temp = that.put('1111', 'bcjdshc')
        let temp1 = that.put(1, 12)
        let temp2 = that.put(2, 5)
        that.updateCapacity(2)
        let temp3 = that.put(2, 'adasfdad')
        let temp4 = that.put('1111', 10)
        expect(temp).assertEqual('bcjdshc')
        expect(temp1).assertEqual(12)
        expect(temp2).assertEqual(5)
        expect(temp3).assertEqual('adasfdad')
        expect(temp4).assertEqual(10)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCachePut005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_PUT_0005
     * @tc.desc   Adds a key-value pair to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCachePut005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCachePut005";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        let temp = that.put('1111', 'bcjdshc')
        let temp1 = that.put(1, 12)
        let temp2 = that.put(2, 5)
        let temp3 = that.put(1, 10)
        let temp4 = that.put(2, 22)
        let temp5 = that.put(2, 30)
        expect(temp).assertEqual('bcjdshc')
        expect(temp1).assertEqual(12)
        expect(temp2).assertEqual(5)
        expect(temp3).assertEqual(10)
        expect(temp4).assertEqual(22)
        expect(temp5).assertEqual(30)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCachePut006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_PUT_0006
     * @tc.desc   Adds a key-value pair to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCachePut006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCachePut006";
      let that = new ArkTSUtils.SendableLruCache<number | string | undefined, number | string>()
      let un = undefined;
      try {
        that.put(un, 'bcjdshc')
      } catch (e) {
        try {
          expect(e.message).assertEqual("Parameter error. The type of undefined must be Object");
          done();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testSendableLRUCachePut007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_PUT_0007
     * @tc.desc   Adds a key-value pair to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCachePut007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCachePut007";
      let that = new ArkTSUtils.SendableLruCache<number | string | null, number | string>()
      try {
        that.put(null, 'bcjdshc')
      } catch (e) {
        try {
          expect(e.message).assertEqual("Parameter error. The type of key and value must be Object");
          done();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testSendableLRUCachePut008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_PUT_0008
     * @tc.desc   Adds a key-value pair to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCachePut008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCachePut008";
      let that = new ArkTSUtils.SendableLruCache<number | string, number | string | null>()
      try {
        that.put(123, null)
      } catch (e) {
        try {
          expect(e.message).assertEqual("Parameter error. The type of key and value must be Object");
          done();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testSendableLRUCachePutUpdateOrder001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_PUT_0009
     * @tc.desc   put(same key, new value) refreshes LRU position so the other key is evicted next.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCachePutUpdateOrder001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCachePutUpdateOrder001";
      let cache = new ArkTSUtils.SendableLruCache<number, number>(2)
      cache.put(1, 10)
      cache.put(2, 20)
      cache.put(1, 100)
      cache.put(3, 30)
      let contains1 = cache.contains(1)
      expect(contains1).assertEqual(true)
      let contains2 = cache.contains(2)
      expect(contains2).assertEqual(false)
      let contains3 = cache.contains(3)
      expect(contains3).assertEqual(true)
      let val1 = cache.get(1)
      expect(val1).assertEqual(100)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheValueBoundary001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_PUT_0010
     * @tc.desc   put/get with value 0 (boundary value).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheValueBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheValueBoundary001";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      let ret = cache.put(1, 0)
      expect(ret).assertEqual(0)
      let val = cache.get(1)
      expect(val).assertEqual(0)
      let contains = cache.contains(1)
      expect(contains).assertEqual(true)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheValueBoundary002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_PUT_0011
     * @tc.desc   put/get with value Number.MAX_SAFE_INTEGER (boundary value).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheValueBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheValueBoundary002";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      let maxVal = Number.MAX_SAFE_INTEGER
      let ret = cache.put(1, maxVal)
      expect(ret).assertEqual(maxVal)
      let val = cache.get(1)
      expect(val).assertEqual(maxVal)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheValueBoundary003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_PUT_0012
     * @tc.desc   put/get with value Number.MIN_SAFE_INTEGER (boundary value).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheValueBoundary003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheValueBoundary003";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      let minVal = Number.MIN_SAFE_INTEGER
      let ret = cache.put(1, minVal)
      expect(ret).assertEqual(minVal)
      let val = cache.get(1)
      expect(val).assertEqual(minVal)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheValueBoundary004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_PUT_0013
     * @tc.desc   put/get with value -0 (negative zero boundary value).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheValueBoundary004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheValueBoundary004";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      let negZero = -0
      let ret = cache.put(1, negZero)
      expect(ret).assertEqual(0)
      let val = cache.get(1)
      expect(val).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheSameValue001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_PUT_0014
     * @tc.desc   put different keys with the same value, values() contains duplicates.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheSameValue001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheSameValue001";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      cache.put(1, 100)
      cache.put(2, 100)
      cache.put(3, 100)
      let val1 = cache.get(1)
      let val2 = cache.get(2)
      let val3 = cache.get(3)
      expect(val1).assertEqual(100)
      expect(val2).assertEqual(100)
      expect(val3).assertEqual(100)
      let values = cache.values()
      expect(values.length).assertEqual(3)
      expect(values[0]).assertEqual(100)
      expect(values[1]).assertEqual(100)
      expect(values[2]).assertEqual(100)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheSameValue002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_PUT_0015
     * @tc.desc   put same key with the same value repeatedly, length stays unchanged and putCount accumulates.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheSameValue002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheSameValue002";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      cache.put(1, 100)
      cache.put(1, 100)
      cache.put(1, 100)
      let len = cache.length
      expect(len).assertEqual(1)
      let putCount = cache.getPutCount()
      expect(putCount).assertEqual(3)
      let val = cache.get(1)
      expect(val).assertEqual(100)
      done();
    })

  })
}
