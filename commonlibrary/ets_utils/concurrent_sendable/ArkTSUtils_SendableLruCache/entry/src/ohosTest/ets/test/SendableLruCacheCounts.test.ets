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

export default function SendableLruCacheCountsTest() {
  describe('SendableLruCacheCountsTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   testSendableLRUCacheGetCreateCount001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_COUNTS_0001
     * @tc.desc   Obtains the number of times createDefault(Object) returned a value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheGetCreateCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetCreateCount001";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.put('abcd', 15)
        that.get(3)
        that.get(5)
        that.get(10)
        let result = that.getCreateCount()
        expect(result).assertEqual(0)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheGetCreateCount002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_COUNTS_0002
     * @tc.desc   Obtains the number of times createDefault(Object) returned a value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheGetCreateCount002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetCreateCount002";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.put('abcd', 15)
        that.get(6)
        that.get(8)
        that.get(20)
        let result = that.getCreateCount()
        expect(result).assertEqual(0)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheGetCreateCount003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_COUNTS_0003
     * @tc.desc   Obtains the number of times createDefault(Object) returned a value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheGetCreateCount003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetCreateCount003";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.get('abc')
        that.get('cndk')
        let result = that.getCreateCount()
        expect(result).assertEqual(0)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheGetCreateCount004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_COUNTS_0004
     * @tc.desc   Obtains the number of times createDefault(Object) returned a value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheGetCreateCount004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetCreateCount004";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(5, 2)
        that.put(10, 10)
        that.put('abcd', 'abcd')
        that.get(3)
        that.get(20)
        that.get(12)
        let result = that.getCreateCount()
        expect(result).assertEqual(0)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheGetCreateCount005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_COUNTS_0005
     * @tc.desc   Obtains the number of times createDefault(Object) returned a value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheGetCreateCount005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetCreateCount005";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put('xsjk', 'bcjds')
        that.put('ajc', 10)
        that.put('abcd', 15)
        that.get(2)
        that.get(10)
        that.get(30)
        let result = that.getCreateCount()
        expect(result).assertEqual(0)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheGetMissCount001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_COUNTS_0006
     * @tc.desc   Obtains the number of times that the queried values are not matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheGetMissCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetMissCount001";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.put('abcd', 15)
        that.get(3)
        that.get(5)
        that.get(10)
        let result = that.getMissCount()
        expect(result).assertEqual(3)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheGetMissCount002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_COUNTS_0007
     * @tc.desc   Obtains the number of times that the queried values are not matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheGetMissCount002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetMissCount002";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(5, 2)
        that.put(1, 10)
        that.put('abcd', 'bcjsc')
        that.get(2)
        that.get(10)
        that.get(15)
        let result = that.getMissCount()
        expect(result).assertEqual(3)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheGetMissCount003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_COUNTS_0008
     * @tc.desc   Obtains the number of times that the queried values are not matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheGetMissCount003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetMissCount003";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(10, 10)
        that.put(3, 20)
        that.put(12, 16)
        that.get(1)
        that.get(2)
        that.get(6)
        let result = that.getMissCount()
        expect(result).assertEqual(3)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheGetMissCount004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_COUNTS_0009
     * @tc.desc   Obtains the number of times that the queried values are not matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheGetMissCount004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetMissCount004";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put('acb', 'asdc')
        that.put('vfb', 1)
        that.put('abcd', 'abcd')
        that.get(3)
        that.get(5)
        that.get(10)
        let result = that.getMissCount()
        expect(result).assertEqual(3)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheGetMissCount005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_COUNTS_0010
     * @tc.desc   Obtains the number of times that the queried values are not matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheGetMissCount005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetMissCount005";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.put('abcd', 15)
        that.get(3)
        that.get(5)
        that.get(10)
        that.contains(2)
        that.contains(6)
        let result = that.getMissCount()
        expect(result).assertEqual(4)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheGetMissCount006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_COUNTS_0011
     * @tc.desc   Obtains the number of times that the queried values are not matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheGetMissCount006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetMissCount006";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.put('abcd', 15)
        that.get(1)
        that.get(2)
        that.get('abcd')
        let result = that.getMissCount()
        expect(result).assertEqual(0)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheGetRemoveCount001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_COUNTS_0012
     * @tc.desc   Obtains the number of times that values are evicted from the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheGetRemoveCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetRemoveCount001";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.put('abcd', 15)
        that.put(3, 20)
        that.put(5, 30)
        let result = that.getRemoveCount()
        expect(result).assertEqual(0)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheGetRemoveCount002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_COUNTS_0013
     * @tc.desc   Obtains the number of times that values are evicted from the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheGetRemoveCount002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetRemoveCount002";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(10, 2)
        that.put(3, 2)
        that.put(15, 15)
        that.put(1, 20)
        let result = that.getRemoveCount()
        expect(result).assertEqual(0)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheGetRemoveCount003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_COUNTS_0014
     * @tc.desc   Obtains the number of times that values are evicted from the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheGetRemoveCount003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetRemoveCount003";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put('abc', 2)
        that.put('abcd', 'abcd')
        that.put(3, 2)
        let result = that.getRemoveCount()
        expect(result).assertEqual(0)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheGetRemoveCount004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_COUNTS_0015
     * @tc.desc   Obtains the number of times that values are evicted from the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheGetRemoveCount004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetRemoveCount004";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.put('abcd', 15)
        that.updateCapacity(2)
        that.put(3, 20)
        that.put(5, 30)
        let result = that.getRemoveCount()
        expect(result).assertEqual(3)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheGetRemoveCount005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_COUNTS_0016
     * @tc.desc   Obtains the number of times that values are evicted from the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheGetRemoveCount005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetRemoveCount005";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.put('abcd', 15)
        that.updateCapacity(3)
        that.put('string', 20)
        that.put('abc', 30)
        that.put(10, 20)
        let result = that.getRemoveCount()
        expect(result).assertEqual(3)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheGetMatchCount001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_COUNTS_0017
     * @tc.desc   Obtains the number of times that the queried values are successfully matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheGetMatchCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetMatchCount001";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.put('abcd', 15)
        that.get(1)
        that.get(2)
        that.get('abcd')
        let result = that.getMatchCount()
        expect(result).assertEqual(3)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheGetMatchCount002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_COUNTS_0018
     * @tc.desc   Obtains the number of times that the queried values are successfully matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheGetMatchCount002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetMatchCount002";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(10, 2)
        that.put(2, 1)
        that.put('abcd', 15)
        that.get(10)
        that.get(2)
        that.get('abcd')
        that.get('string')
        let result = that.getMatchCount()
        expect(result).assertEqual(3)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheGetMatchCount003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_COUNTS_0019
     * @tc.desc   Obtains the number of times that the queried values are successfully matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheGetMatchCount003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetMatchCount003";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(0, 1)
        that.put(30, 10)
        that.put('abcd', 15)
        that.get(0)
        that.get(30)
        that.get('abcd')
        let result = that.getMatchCount()
        expect(result).assertEqual(3)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheGetMatchCount004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_COUNTS_0020
     * @tc.desc   Obtains the number of times that the queried values are successfully matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheGetMatchCount004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetMatchCount004";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.put('abcd', 15)
        that.get(1)
        that.get(2)
        that.get('abcd')
        that.contains(2)
        that.contains('abcd')
        that.contains(20)
        let result = that.getMatchCount()
        expect(result).assertEqual(5)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheGetMatchCount005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_COUNTS_0021
     * @tc.desc   Obtains the number of times that the queried values are successfully matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheGetMatchCount005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetMatchCount005";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.put('abcd', 15)
        that.put('string', 'string')
        that.get(1)
        that.get(2)
        that.get('abcd')
        that.get('string')
        that.contains(2)
        that.contains('abcd')
        that.contains('string')
        that.contains(10)
        let result = that.getMatchCount()
        expect(result).assertEqual(7)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheGetMatchCount006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_COUNTS_0022
     * @tc.desc   Obtains the number of times that the queried values are successfully matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheGetMatchCount006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetMatchCount006";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.put('abcd', 15)
        that.get(5)
        let result = that.getMatchCount()
        expect(result).assertEqual(0)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheGetPutCount001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_COUNTS_0023
     * @tc.desc   Obtains the number of times that values are added to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheGetPutCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetPutCount001";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        let result = that.getPutCount()
        expect(result).assertEqual(1)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheGetPutCount002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_COUNTS_0024
     * @tc.desc   Obtains the number of times that values are added to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheGetPutCount002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetPutCount002";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(5, 3)
        that.put(2, 10)
        let result = that.getPutCount()
        expect(result).assertEqual(2)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheGetPutCount003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_COUNTS_0025
     * @tc.desc   Obtains the number of times that values are added to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheGetPutCount003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetPutCount003";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put('string', 2)
        that.put('abcd', 1)
        that.put('ab', 'a')
        let result = that.getPutCount()
        expect(result).assertEqual(3)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheGetPutCount004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_COUNTS_0026
     * @tc.desc   Obtains the number of times that values are added to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheGetPutCount004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetPutCount004";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put('string', 'string')
        that.put('ac', 'abc')
        that.put('abcd', 15)
        let result = that.getPutCount()
        expect(result).assertEqual(3)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheGetPutCount005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_COUNTS_0027
     * @tc.desc   Obtains the number of times that values are added to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheGetPutCount005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetPutCount005";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(2, 10)
        that.updateCapacity(2)
        that.put('abcd', 'abc')
        let result = that.getPutCount()
        expect(result).assertEqual(3)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

  })
}
