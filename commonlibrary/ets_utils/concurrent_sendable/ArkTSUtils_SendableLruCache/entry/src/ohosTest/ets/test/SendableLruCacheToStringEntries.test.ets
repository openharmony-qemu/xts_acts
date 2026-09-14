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

export default function SendableLruCacheToStringEntriesTest() {
  describe('SendableLruCacheToStringEntriesTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   testSendableLRUCacheToString001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_TO_STRING_ENTRIES_0001
     * @tc.desc   Returns a string representation of the object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheToString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheToString001";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put('1111', 'bcjdshc')
        that.put(1, 2)
        let result = that.toString()
        expect(result).assertEqual('SendableLruCache[ maxSize = 64, hits = 0, misses = 0, hitRate = 0% ]')
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheToString002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_TO_STRING_ENTRIES_0002
     * @tc.desc   Returns a string representation of the object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheToString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheToString002";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put('1111', 'bcjdshc')
        that.put(1, 2)
        that.get(1)
        that.get('1111')
        let result = that.toString()
        expect(result).assertEqual('SendableLruCache[ maxSize = 64, hits = 2, misses = 0, hitRate = 100% ]')
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheToString003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_TO_STRING_ENTRIES_0003
     * @tc.desc   Returns a string representation of the object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheToString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheToString003";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>(100)
        that.put(1, 2)
        that.put(3, 10)
        that.put(5, 15)
        that.put('abc', 20)
        that.get(3)
        let result = that.toString()
        expect(result).assertEqual('SendableLruCache[ maxSize = 100, hits = 1, misses = 0, hitRate = 100% ]')
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheToString004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_TO_STRING_ENTRIES_0004
     * @tc.desc   Returns a string representation of the object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheToString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheToString004";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>(100)
        that.put(1, 2)
        that.put(3, 10)
        that.put(5, 15)
        that.put('abc', 20)
        that.get(3)
        that.get(2)
        let result = that.toString()
        expect(result).assertEqual('SendableLruCache[ maxSize = 100, hits = 1, misses = 1, hitRate = 50% ]')
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheToString005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_TO_STRING_ENTRIES_0005
     * @tc.desc   Returns a string representation of the object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheToString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheToString005";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>(100)
        that.put(1, 2)
        that.put(3, 10)
        that.put(5, 15)
        that.put('abc', 20)
        that.get(3)
        that.get(2)
        that.get(1)
        that.contains(5)
        let result = that.toString()
        expect(result).assertEqual('SendableLruCache[ maxSize = 100, hits = 3, misses = 1, hitRate = 75% ]')
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheEntries001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_TO_STRING_ENTRIES_0006
     * @tc.desc   Returns an array of key-value pairs of enumeratable properties of a given object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheEntries001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheEntries001";
      try {
        let that = new ArkTSUtils.SendableLruCache<string, string>()
        that.put('string', 'abc')
        let key: string = '';
        let value: string = '';
        for (let entry of that.entries()) {
          key = entry[0];
          value = entry[1];
        }
        expect(value).assertEqual('abc');
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheEntries002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_TO_STRING_ENTRIES_0007
     * @tc.desc   Returns an array of key-value pairs of enumeratable properties of a given object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheEntries002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheEntries002";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(3, 10)
        that.put(5, 15)
        that.put('abc', 20)
        let i = 0;
        let arr = new Array<number | string>();
        for (let entry of that.entries()) {
          arr[i] = entry[0];
          i++;
          arr[i] = entry[1];
          i++;
        }
        expect(arr[1]).assertEqual(2);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheEntries003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_TO_STRING_ENTRIES_0008
     * @tc.desc   Returns an array of key-value pairs of enumeratable properties of a given object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheEntries003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheEntries003";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(3, 10)
        that.put(5, 15)
        that.put('abc', 20)
        that.get(3)
        let i = 0;
        let arr = new Array<number | string>();
        for (let entry of that.entries()) {
          arr[i] = entry[0];
          i++;
          arr[i] = entry[1];
          i++;
        }
        expect(arr[0]).assertEqual(1);
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheEntries004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_TO_STRING_ENTRIES_0009
     * @tc.desc   Returns an array of key-value pairs of enumeratable properties of a given object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheEntries004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testSendableLRUCacheEntries004";
      try {
        let that = new ArkTSUtils.SendableLruCache<number | string, number | string>()
        that.put(1, 2)
        that.put(3, 10)
        that.put(5, 15)
        that.put('abc', 20)
        that.get(3)
        that.contains(1)
        let i = 0;
        let arr = new Array<number | string>();
        for (let entry of that.entries()) {
          arr[i] = entry[0];
          i++;
          arr[i] = entry[1];
          i++;
        }
        expect(arr[1]).assertEqual(15)
        expect(arr[3]).assertEqual(20)
        done();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSendableLRUCacheEntries005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_LRU_CACHE_TO_STRING_ENTRIES_0010
     * @tc.desc   Returns an array of key-value pairs of enumeratable properties of a given object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableLRUCacheEntries005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testSendableLRUCacheEntries005';
      console.log(`${caseName} test start `);
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
        let i = 0;
        let arr = new Array<number | string>();
        for (let entry of that.entries()) {
          arr[i] = entry[0];
          i++;
          arr[i] = entry[1];
          i++;
        }
        expect(arr[1]).assertEqual(10)
        expect(arr[3]).assertEqual(2)
        expect(arr[5]).assertEqual(20)
        done();
      } catch (error) {
        console.log(`${caseName} catchError ${JSON.stringify(error)}}`);
        expect().assertFail();
        done();
      }
    })

  })
}
