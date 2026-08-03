/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { collections, ArkTSUtils } from '@kit.ArkTS'
import Utils from '../utils'

export default function BuiltinsSendableCollectionsTest(): void {
  describe('BuiltinsSendableCollectionsTest', (): void => {
    /**
     * @tc.name   testSendableCollections0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_COLLECTIONS_TEST_0100
     * @tc.desc   Verify collections.Array creates empty array with length 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableCollections0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const arr = new collections.Array<number>()
      expect(arr.length).assertEqual(0)
    })

    /**
     * @tc.name   testSendableCollections0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_COLLECTIONS_TEST_0200
     * @tc.desc   Verify collections.Array push adds elements correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableCollections0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const arr = new collections.Array<number>()
      arr.push(10)
      arr.push(20)
      expect(arr.length).assertEqual(2)
      expect(arr[0]).assertEqual(10)
    })

    /**
     * @tc.name   testSendableCollections0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_COLLECTIONS_TEST_0300
     * @tc.desc   Verify collections.Array index read and write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableCollections0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const arr = new collections.Array<number>()
      arr.push(100)
      arr.push(200)
      expect(arr[0]).assertEqual(100)
      expect(arr[1]).assertEqual(200)
      arr[0] = 999
      expect(arr[0]).assertEqual(999)
    })

    /**
     * @tc.name   testSendableCollections0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_COLLECTIONS_TEST_0400
     * @tc.desc   Verify collections.Map creates empty map and has returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableCollections0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const map = new collections.Map<string, number>()
      expect(map.has('key')).assertFalse()
    })

    /**
     * @tc.name   testSendableCollections0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_COLLECTIONS_TEST_0500
     * @tc.desc   Verify collections.Map set and get operations work correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableCollections0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const map = new collections.Map<string, number>()
      map.set('key1', 100)
      map.set('key2', 200)
      expect(map.get('key1')).assertEqual(100)
      expect(map.get('key2')).assertEqual(200)
    })

    /**
     * @tc.name   testSendableCollections0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_COLLECTIONS_TEST_0600
     * @tc.desc   Verify collections.Map delete removes key correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableCollections0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const map = new collections.Map<string, number>()
      map.set('key1', 100)
      expect(map.has('key1')).assertTrue()
      map.delete('key1')
      expect(map.has('key1')).assertFalse()
    })

    /**
     * @tc.name   testSendableCollections0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_COLLECTIONS_TEST_0700
     * @tc.desc   Verify collections.Set creates empty set and has returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableCollections0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const set = new collections.Set<number>()
      expect(set.has(1)).assertFalse()
    })

    /**
     * @tc.name   testSendableCollections0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_COLLECTIONS_TEST_0800
     * @tc.desc   Verify collections.Set add/has/delete operations work correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableCollections0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const set = new collections.Set<number>()
      set.add(10)
      expect(set.has(10)).assertTrue()
      set.delete(10)
      expect(set.has(10)).assertFalse()
    })

    /**
     * @tc.name   testSendableCollections0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_COLLECTIONS_TEST_0900
     * @tc.desc   Verify collections.Int32Array creates and reads/writes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableCollections0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const typedArr = new collections.Int32Array(100)
      typedArr[0] = 100
      typedArr[50] = 200
      expect(typedArr[0]).assertEqual(100)
      expect(typedArr[50]).assertEqual(200)
    })

    /**
     * @tc.name   testSendableCollections1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_COLLECTIONS_TEST_1000
     * @tc.desc   Verify collections.Int32Array default values are 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableCollections1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const typedArr = new collections.Int32Array(10)
      expect(typedArr[0]).assertEqual(0)
      expect(typedArr[5]).assertEqual(0)
    })

    /**
     * @tc.name   testSendableCollections1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_COLLECTIONS_TEST_1100
     * @tc.desc   Verify collections.Array sequential push operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSendableCollections1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr = new collections.Array<number>()
      const iterations: number = 10
      for (let i = 0; i < iterations; i++) {
        arr.push(i)
      }
      expect(arr.length).assertEqual(iterations)
      expect(arr[0]).assertEqual(0)
      expect(arr[9]).assertEqual(9)
    })

    /**
     * @tc.name   testSendableCollections1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_COLLECTIONS_TEST_1200
     * @tc.desc   Verify collections.Map sequential set operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSendableCollections1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map = new collections.Map<string, number>()
      const iterations: number = 10
      for (let i = 0; i < iterations; i++) {
        map.set(`key_${i}`, i)
      }
      expect(map.has('key_0')).assertTrue()
      expect(map.has('key_9')).assertTrue()
      expect(map.get('key_5')).assertEqual(5)
    })

    /**
     * @tc.name   testSendableCollections1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_COLLECTIONS_TEST_1300
     * @tc.desc   Verify SendableLruCache creates with capacity and default values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableCollections1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const lruCache = new ArkTSUtils.SendableLruCache<number, string>(5)
      expect(lruCache.length).assertEqual(0)
    })

    /**
     * @tc.name   testSendableCollections1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_COLLECTIONS_TEST_1400
     * @tc.desc   Verify SendableLruCache put and get operations work correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableCollections1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const lruCache = new ArkTSUtils.SendableLruCache<number, string>(5)
      lruCache.put(1, 'value1')
      lruCache.put(2, 'value2')
      expect(lruCache.get(1)).assertEqual('value1')
      expect(lruCache.get(2)).assertEqual('value2')
      expect(lruCache.length).assertEqual(2)
    })

    /**
     * @tc.name   testSendableCollections1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_COLLECTIONS_TEST_1500
     * @tc.desc   Verify SendableLruCache contains checks key existence correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableCollections1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const lruCache = new ArkTSUtils.SendableLruCache<number, string>(5)
      lruCache.put(1, 'value1')
      expect(lruCache.contains(1)).assertTrue()
      expect(lruCache.contains(2)).assertFalse()
    })

    /**
     * @tc.name   testSendableCollections1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_COLLECTIONS_TEST_1600
     * @tc.desc   Verify SendableLruCache remove removes key correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableCollections1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const lruCache = new ArkTSUtils.SendableLruCache<number, string>(5)
      lruCache.put(1, 'value1')
      expect(lruCache.contains(1)).assertTrue()
      lruCache.remove(1)
      expect(lruCache.contains(1)).assertFalse()
      expect(lruCache.length).assertEqual(0)
    })

    /**
     * @tc.name   testSendableCollections1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_COLLECTIONS_TEST_1700
     * @tc.desc   Verify SendableLruCache evicts least recently used entry when capacity exceeded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableCollections1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const lruCache = new ArkTSUtils.SendableLruCache<number, string>(3)
      lruCache.put(1, 'value1')
      lruCache.put(2, 'value2')
      lruCache.put(3, 'value3')
      lruCache.put(4, 'value4')
      expect(lruCache.contains(1)).assertFalse()
      expect(lruCache.contains(2)).assertTrue()
      expect(lruCache.contains(3)).assertTrue()
      expect(lruCache.contains(4)).assertTrue()
      expect(lruCache.length).assertEqual(3)
    })

    /**
     * @tc.name   testSendableCollections1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_COLLECTIONS_TEST_1800
     * @tc.desc   Verify SendableLruCache get updates access order for LRU eviction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSendableCollections1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const lruCache = new ArkTSUtils.SendableLruCache<number, string>(3)
      lruCache.put(1, 'value1')
      lruCache.put(2, 'value2')
      lruCache.put(3, 'value3')
      const _ = lruCache.get(1)
      lruCache.put(4, 'value4')
      expect(lruCache.contains(1)).assertTrue()
      expect(lruCache.contains(2)).assertFalse()
      expect(lruCache.contains(3)).assertTrue()
      expect(lruCache.contains(4)).assertTrue()
    })

    /**
     * @tc.name   testSendableCollections1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_COLLECTIONS_TEST_1900
     * @tc.desc   Verify SendableLruCache sequential put operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSendableCollections1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const lruCache = new ArkTSUtils.SendableLruCache<number, string>(10)
      for (let i = 0; i < 10; i++) {
        lruCache.put(i, `value_${i}`)
      }
      expect(lruCache.length).assertEqual(10)
      expect(lruCache.get(0)).assertEqual('value_0')
      expect(lruCache.get(9)).assertEqual('value_9')
    })
  })
}
