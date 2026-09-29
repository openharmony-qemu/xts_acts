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

export default function SendableLruCacheCapacityTest() {
  describe('SendableLruCacheCapacityTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   testSendableLRUCacheUpdateGetCapacity001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CAPACITY_0001
     * @tc.desc   Updates the buffer capacity to a specified capacity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheUpdateGetCapacity001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheUpdateGetCapacity001";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.updateCapacity(10)
        let result = that.getCapacity()
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(10);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheUpdateGetCapacity002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CAPACITY_0002
     * @tc.desc   Updates the buffer capacity to a specified capacity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheUpdateGetCapacity002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheUpdateGetCapacity002";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.updateCapacity(2147483646)
        let result = that.getCapacity()
        expect(result).assertEqual(2147483646)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheUpdateGetCapacity003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CAPACITY_0003
     * @tc.desc   Updates the buffer capacity to a specified capacity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheUpdateGetCapacity003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheUpdateGetCapacity003";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>(100)
        that.updateCapacity(20)
        let result = that.getCapacity()
        expect(result).assertEqual(20)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheUpdateGetCapacity004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CAPACITY_0004
     * @tc.desc   Updates the buffer capacity to a specified capacity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheUpdateGetCapacity004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheUpdateGetCapacity004";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>(50)
        that.updateCapacity(2)
        let result = that.getCapacity()
        expect(result).assertEqual(2)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheUpdateGetCapacity005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CAPACITY_0005
     * @tc.desc   Updates the buffer capacity to a specified capacity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLRUCacheUpdateGetCapacity005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testSendableLRUCacheUpdateGetCapacity005";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>(200)
        that.updateCapacity(100)
        let result = that.getCapacity()
        expect(result).assertEqual(100)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheGetCapacity001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CAPACITY_0006
     * @tc.desc   Obtains the capacity of the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheGetCapacity001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetCapacity001";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        let result = that.getCapacity()
        expect(result).assertEqual(64)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheGetCapacity002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CAPACITY_0007
     * @tc.desc   Obtains the capacity of the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheGetCapacity002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetCapacity002";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>(2)
        let result = that.getCapacity()
        expect(result).assertEqual(2)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheGetCapacity003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CAPACITY_0008
     * @tc.desc   Obtains the capacity of the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheGetCapacity003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetCapacity003";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>(100)
        let result = that.getCapacity()
        expect(result).assertEqual(100)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheGetCapacity004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CAPACITY_0009
     * @tc.desc   Obtains the capacity of the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheGetCapacity004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetCapacity004";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.updateCapacity(50)
        let result = that.getCapacity()
        expect(result).assertEqual(50)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheGetCapacity005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CAPACITY_0010
     * @tc.desc   Obtains the capacity of the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheGetCapacity005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheGetCapacity005";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>(100)
        that.updateCapacity(10)
        let result = that.getCapacity()
        expect(result).assertEqual(10)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheUpdateGetCapacity007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CAPACITY_0011
     * @tc.desc   Updates the buffer capacity to a specified capacity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheUpdateGetCapacity007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheUpdateGetCapacity007";
      let that = new ArkTSUtils.SendableLruCache<number | string, number | string>(200)
      try {
        that.updateCapacity(-20);
      } catch (e) {
        try {
          expect(e.message).assertEqual("Parameter error. The type of -20 must be small integer");
          done();
        } catch (error) {
          console.log(`${TAG} catchError ${JSON.stringify(error)}}`);
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testSendableLRUCacheUpdateGetCapacity008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CAPACITY_0012
     * @tc.desc   Updates the buffer capacity to a specified capacity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheUpdateGetCapacity008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheUpdateGetCapacity007";
      let that = new ArkTSUtils.SendableLruCache<number | string, number | string>(200)
      try {
        that.updateCapacity(50.5);
      } catch (e) {
        try {
          expect(e.message).assertEqual("Parameter error. The type of 50.5 must be small integer");
          done();
        } catch (error) {
          console.log(`${TAG} catchError ${JSON.stringify(error)}}`);
          expect().assertFail();
          done();
        }
      }
    })

  })
}
