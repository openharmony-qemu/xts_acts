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

export default function SendableLruCacheGetTest() {
  describe('SendableLruCacheGetTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   testSendableLRUCacheGet001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_GET_0001
     * @tc.desc   Obtains the value associated with a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheGet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheUpdateGetCapacity005";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>(100)
        that.put(1, 2)
        let result = that.get(1)
        expect(result).assertEqual(2)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheGet002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_GET_0002
     * @tc.desc   Obtains the value associated with a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheGet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGet002";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>(100)
        that.put(1, 2)
        let result = that.get(5)
        expect(result).assertEqual(undefined)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheGet003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_GET_0003
     * @tc.desc   Obtains the value associated with a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheGet003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGet003";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>(100)
        that.put(1, 2)
        that.put(2, 10)
        that.put('abcd', 15)
        let result1 = that.get(20)
        let result2 = that.get('abcd')
        let result3 = that.get(2)
        expect(result1).assertEqual(undefined)
        expect(result2).assertEqual(15)
        expect(result3).assertEqual(10)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheGet004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_GET_0004
     * @tc.desc   Obtains the value associated with a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheGet004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGet004";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put('1111', 'bcjdshc')
        that.put(20, 'cdjcaxb')
        that.put('abcd', 15)
        let result1 = that.get('1111')
        let result2 = that.get(20)
        let result3 = that.get('abcd')
        let result4 = that.get(25)
        expect(result1).assertEqual('bcjdshc')
        expect(result2).assertEqual('cdjcaxb')
        expect(result3).assertEqual(15)
        expect(result4).assertEqual(undefined)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheGet005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_GET_0005
     * @tc.desc   Obtains the value associated with a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheGet005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGet005";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put('1111', 'bcjdshc')
        that.put(20, 'cdjcaxb')
        that.updateCapacity(2)
        that.put('abcd', 15)
        let result1 = that.get('1111')
        let result2 = that.get(20)
        let result3 = that.get('abcd')
        let result4 = that.get(25)
        expect(result1).assertEqual(undefined)
        expect(result2).assertEqual('cdjcaxb')
        expect(result3).assertEqual(15)
        expect(result4).assertEqual(undefined)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheGet006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_GET_0006
     * @tc.desc   Obtains the value associated with a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheGet006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGet006";
      let that = new ArkTSUtils.SendableLruCache<number | string | undefined, number | string>()
      let un = undefined;
      that.put(20, 'cdjcaxb')
      try {
        let result1 = that.get(un);
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
     * @tc.name   testSendableLRUCacheGet007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_GET_0007
     * @tc.desc   Obtains the value associated with a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheGet007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheGet007";
      let that = new ArkTSUtils.SendableLruCache<number | string | null, number | string>()
      that.put(20, 'cdjcaxb')
      try {
        let result1 = that.get(null);
      } catch (e) {
        try {
          expect(e.message).assertEqual("Parameter error. The type of null must be Object");
          done();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
          done();
        }
      }
    })

  })
}
