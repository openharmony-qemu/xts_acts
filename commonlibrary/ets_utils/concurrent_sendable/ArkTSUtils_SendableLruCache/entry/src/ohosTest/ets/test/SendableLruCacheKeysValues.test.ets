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

export default function SendableLruCacheKeysValuesTest() {
  describe('SendableLruCacheKeysValuesTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   testSendableLRUCacheKeys001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_KEYS_VALUES_0001
     * @tc.desc   Obtains a list of keys for the values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheKeys001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheKeys001";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put('string', 'abc')
        let result = that.keys()
        expect(result[0]).assertEqual('string')
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheKeys002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_KEYS_VALUES_0002
     * @tc.desc   Obtains a list of keys for the values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheKeys002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheKeys002";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(3, 10)
        that.put(5, 15)
        that.put('abc', 20)
        let result = that.keys()
        expect(result[0]).assertEqual(1)
        expect(result[1]).assertEqual(3)
        expect(result[2]).assertEqual(5)
        expect(result[3]).assertEqual('abc')
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheKeys003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_KEYS_VALUES_0003
     * @tc.desc   Obtains a list of keys for the values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheKeys003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheKeys003";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(3, 10)
        that.put(5, 15)
        that.put('abc', 20)
        that.get(3)
        let result = that.keys()
        expect(result[0]).assertEqual(1)
        expect(result[1]).assertEqual(5)
        expect(result[2]).assertEqual('abc')
        expect(result[3]).assertEqual(3)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheKeys004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_KEYS_VALUES_0004
     * @tc.desc   Obtains a list of keys for the values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheKeys004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheKeys004";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(3, 10)
        that.put(5, 15)
        that.put('abc', 20)
        that.get(3)
        that.contains(1)
        let result = that.keys()
        expect(result[0]).assertEqual(5)
        expect(result[1]).assertEqual('abc')
        expect(result[2]).assertEqual(3)
        expect(result[3]).assertEqual(1)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheKeys005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_KEYS_VALUES_0005
     * @tc.desc   Obtains a list of keys for the values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheKeys005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheKeys005";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(3, 10)
        that.put(5, 15)
        that.put('abc', 20)
        that.get(3)
        that.remove(5)
        that.contains(3)
        that.get(1)
        that.contains('abc')
        let result = that.keys()
        expect(result[0]).assertEqual(3)
        expect(result[1]).assertEqual(1)
        expect(result[2]).assertEqual('abc')
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheValues001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_KEYS_VALUES_0006
     * @tc.desc   Obtains a list of all values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheValues001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheValues001";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put('string', 'abc')
        let result = that.values()
        expect(result[0]).assertEqual('abc')
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheValues002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_KEYS_VALUES_0007
     * @tc.desc   Obtains a list of all values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheValues002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheValues002";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(3, 10)
        that.put(5, 15)
        that.put('abc', 20)
        let result = that.values()
        expect(result[0]).assertEqual(2)
        expect(result[1]).assertEqual(10)
        expect(result[2]).assertEqual(15)
        expect(result[3]).assertEqual(20)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheValues003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_KEYS_VALUES_0008
     * @tc.desc   Obtains a list of all values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheValues003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheValues003";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(3, 10)
        that.put(5, 15)
        that.put('abc', 20)
        that.get(3)
        let result = that.values()
        expect(result[0]).assertEqual(2)
        expect(result[1]).assertEqual(15)
        expect(result[2]).assertEqual(20)
        expect(result[3]).assertEqual(10)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheValues004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_KEYS_VALUES_0009
     * @tc.desc   Obtains a list of all values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheValues004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheValues004";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(3, 10)
        that.put(5, 15)
        that.put('abc', 20)
        that.get(3)
        that.contains(1)
        let result = that.values()
        expect(result[0]).assertEqual(15)
        expect(result[1]).assertEqual(20)
        expect(result[2]).assertEqual(10)
        expect(result[3]).assertEqual(2)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheValues005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_KEYS_VALUES_0010
     * @tc.desc   Obtains a list of all values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheValues005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheValues005";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(3, 10)
        that.put(5, 15)
        that.put('abc', 20)
        that.get(3)
        that.remove(5)
        that.contains(3)
        that.get(1)
        that.contains('abc')
        let result = that.values()
        expect(result[0]).assertEqual(10)
        expect(result[1]).assertEqual(2)
        expect(result[2]).assertEqual(20)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

  })
}
