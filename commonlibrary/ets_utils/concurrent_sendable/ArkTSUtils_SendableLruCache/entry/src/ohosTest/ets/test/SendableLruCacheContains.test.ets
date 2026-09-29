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

export default function SendableLruCacheContainsTest() {
  describe('SendableLruCacheContainsTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   testSendableLRUCacheContains001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONTAINS_0001
     * @tc.desc   Checks whether the current buffer contains a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheContains001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheContains001";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        let result = that.contains(1)
        expect(result).assertEqual(true)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheContains002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONTAINS_0002
     * @tc.desc   Checks whether the current buffer contains a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheContains002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheContains002";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(0, 5)
        let result = that.contains(0)
        expect(result).assertEqual(true)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheContains003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONTAINS_0003
     * @tc.desc   Checks whether the current buffer contains a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheContains003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheContains003";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put('abc', 'abc')
        let result = that.contains(1)
        expect(result).assertEqual(false)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheContains004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONTAINS_0004
     * @tc.desc   Checks whether the current buffer contains a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheContains004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheContains004";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put('abcd', 20)
        let result1 = that.contains(1)
        let result2 = that.contains(20)
        expect(result1).assertEqual(true)
        expect(result2).assertEqual(false)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheContains005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONTAINS_0005
     * @tc.desc   Checks whether the current buffer contains a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheContains005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheContains005";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put('string', 'string')
        let result1 = that.contains(1)
        let result2 = that.contains('string')
        let result3 = that.contains(0)
        expect(result1).assertEqual(true)
        expect(result2).assertEqual(true)
        expect(result3).assertEqual(false)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheContains006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONTAINS_0006
     * @tc.desc   Checks whether the current buffer contains a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheContains006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheContains006";
      let that = new ArkTSUtils.SendableLruCache<number | string | undefined, number | string>()
      that.put('abc', 'abc')
      let un = undefined;
      try {
        that.contains(un)
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
     * @tc.name   testSendableLRUCacheContainsAfterRemove001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONTAINS_0007
     * @tc.desc   contains(key) returns false after remove(key).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheContainsAfterRemove001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheContainsAfterRemove001";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      cache.put(1, 10)
      let contains1 = cache.contains(1)
      expect(contains1).assertEqual(true)
      cache.remove(1)
      let contains2 = cache.contains(1)
      expect(contains2).assertEqual(false)
      let len = cache.length
      expect(len).assertEqual(0)
      done();
    })

  })
}
