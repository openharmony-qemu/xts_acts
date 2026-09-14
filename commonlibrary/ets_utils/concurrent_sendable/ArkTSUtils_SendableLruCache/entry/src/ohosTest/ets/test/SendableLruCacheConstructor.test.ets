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

export default function SendableLruCacheConstructorTest() {
  describe('SendableLruCacheConstructorTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   testSendableLRUCacheConstrcutor001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONSTRUCTOR_0001
     * @tc.desc   The default constructor is used to create a new SendableLRUCache instance with a default capacity of 64.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheConstrcutor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheConstrcutor001";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>(0.1)
      } catch (e) {
        try {
          expect(e.message).assertEqual("Parameter error. The type of 0.1 must be small integer");
          done();
        } catch (error) {
          console.log(`${TAG} catchError ${JSON.stringify(error)}}`);
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testSendableLRUCacheConstrcutor002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONSTRUCTOR_0002
     * @tc.desc   The default constructor is used to create a new SendableLRUCache instance with a default capacity of 64.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheConstrcutor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheConstrcutor002";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>(-0.1)
      } catch (e) {
        try {
          expect(e.message).assertEqual("Parameter error. The type of -0.1 must be small integer");
          done();
        } catch (error) {
          console.log(`${TAG} catchError ${JSON.stringify(error)}}`);
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testSendableLRUCacheCapacityBoundary001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONSTRUCTOR_0003
     * @tc.desc   Constructor with capacity 2147483647 (max boundary) succeeds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheCapacityBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheCapacityBoundary001";
      let cache = new ArkTSUtils.SendableLruCache<number, number>(2147483647)
      let capacity = cache.getCapacity()
      expect(capacity).assertEqual(2147483647)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheCapacityBoundary002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONSTRUCTOR_0004
     * @tc.desc   Constructor with capacity 0 throws exception.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheCapacityBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheCapacityBoundary002";
      try {
        let cache = new ArkTSUtils.SendableLruCache<number, number>(0)
        console.error(`${TAG} expected exception not thrown`);
        expect().assertFail();
        done();
      } catch (e) {
        // No error code defined in API doc, only verify exception is thrown
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheCapacityBoundary003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONSTRUCTOR_0005
     * @tc.desc   Constructor with negative integer capacity throws exception.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheCapacityBoundary003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheCapacityBoundary003";
      try {
        let cache = new ArkTSUtils.SendableLruCache<number, number>(-5)
        console.error(`${TAG} expected exception not thrown`);
        expect().assertFail();
        done();
      } catch (e) {
        // No error code defined in API doc, only verify exception is thrown
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheCapacityBoundary004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONSTRUCTOR_0006
     * @tc.desc   Constructor with NaN capacity throws exception.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheCapacityBoundary004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheCapacityBoundary004";
      try {
        let cache = new ArkTSUtils.SendableLruCache<number, number>(NaN)
        console.error(`${TAG} expected exception not thrown`);
        expect().assertFail();
        done();
      } catch (e) {
        // No error code defined in API doc, only verify exception is thrown
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheCapacityBoundary005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONSTRUCTOR_0007
     * @tc.desc   Constructor with Infinity capacity throws exception.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheCapacityBoundary005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheCapacityBoundary005";
      try {
        let cache = new ArkTSUtils.SendableLruCache<number, number>(Infinity)
        console.error(`${TAG} expected exception not thrown`);
        expect().assertFail();
        done();
      } catch (e) {
        // No error code defined in API doc, only verify exception is thrown
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheCapacityBoundary006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONSTRUCTOR_0008
     * @tc.desc   updateCapacity(0) throws exception.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheCapacityBoundary006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheCapacityBoundary006";
      let cache = new ArkTSUtils.SendableLruCache<number, number>(100)
      try {
        cache.updateCapacity(0)
        console.error(`${TAG} expected exception not thrown`);
        expect().assertFail();
        done();
      } catch (e) {
        // No error code defined in API doc, only verify exception is thrown
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheCapacityBoundary007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONSTRUCTOR_0009
     * @tc.desc   updateCapacity(2147483647) succeeds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheCapacityBoundary007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheCapacityBoundary007";
      let cache = new ArkTSUtils.SendableLruCache<number, number>()
      cache.updateCapacity(2147483647)
      let capacity = cache.getCapacity()
      expect(capacity).assertEqual(2147483647)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheCapacityBoundary008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONSTRUCTOR_0010
     * @tc.desc   updateCapacity(NaN) throws exception.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheCapacityBoundary008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheCapacityBoundary008";
      let cache = new ArkTSUtils.SendableLruCache<number, number>(100)
      try {
        cache.updateCapacity(NaN)
        console.error(`${TAG} expected exception not thrown`);
        expect().assertFail();
        done();
      } catch (e) {
        // No error code defined in API doc, only verify exception is thrown
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheCapacityBoundary009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONSTRUCTOR_0011
     * @tc.desc   Constructor with capacity 1 (minimum valid value) succeeds and only retains one entry.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheCapacityBoundary009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheCapacityBoundary009";
      let cache = new ArkTSUtils.SendableLruCache<number, number>(1)
      let capacity = cache.getCapacity()
      expect(capacity).assertEqual(1)
      cache.put(1, 10)
      cache.put(2, 20)
      let len = cache.length
      expect(len).assertEqual(1)
      let contains1 = cache.contains(1)
      expect(contains1).assertEqual(false)
      let contains2 = cache.contains(2)
      expect(contains2).assertEqual(true)
      done();
    })

    /**
     * @tc.name   testSendableLRUCacheCapacityBoundary010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_CONSTRUCTOR_0012
     * @tc.desc   updateCapacity(1) shrinks to minimum capacity and retains only the most recent entry.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheCapacityBoundary010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheCapacityBoundary010";
      let cache = new ArkTSUtils.SendableLruCache<number, number>(10)
      cache.put(1, 10)
      cache.put(2, 20)
      cache.put(3, 30)
      cache.updateCapacity(1)
      let capacity = cache.getCapacity()
      expect(capacity).assertEqual(1)
      let len = cache.length
      expect(len).assertEqual(1)
      let contains3 = cache.contains(3)
      expect(contains3).assertEqual(true)
      let contains1 = cache.contains(1)
      expect(contains1).assertEqual(false)
      done();
    })

  })
}
