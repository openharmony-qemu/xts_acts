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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { collections, ArkTSUtils } from '@kit.ArkTS'
import Utils from '../utils'

export default function BuiltinsSendableCollectionsTest(): void {
  describe('BuiltinsSendableCollectionsTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {})

    /**
     * @tc.name   BuiltinsSendableCollectionsTest0100
     * @tc.number SUB_BUILTINS_SENDABLE_COLLECTIONS_TEST_0100
     * @tc.desc   Verify collections.Array creates empty array with length 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsSendableCollectionsTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const arr = new collections.Array<number>()
      expect(arr.length).assertEqual(0)
    })

    /**
     * @tc.name   BuiltinsSendableCollectionsTest0200
     * @tc.number SUB_BUILTINS_SENDABLE_COLLECTIONS_TEST_0200
     * @tc.desc   Verify collections.Array push adds elements correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsSendableCollectionsTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const arr = new collections.Array<number>()
      arr.push(10)
      arr.push(20)
      expect(arr.length).assertEqual(2)
      expect(arr[0]).assertEqual(10)
    })

    /**
     * @tc.name   BuiltinsSendableCollectionsTest0300
     * @tc.number SUB_BUILTINS_SENDABLE_COLLECTIONS_TEST_0300
     * @tc.desc   Verify collections.Array index read and write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsSendableCollectionsTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const arr = new collections.Array<number>()
      arr.push(100)
      arr.push(200)
      expect(arr[0]).assertEqual(100)
      expect(arr[1]).assertEqual(200)
      arr[0] = 999
      expect(arr[0]).assertEqual(999)
    })

    /**
     * @tc.name   BuiltinsSendableCollectionsTest0400
     * @tc.number SUB_BUILTINS_SENDABLE_COLLECTIONS_TEST_0400
     * @tc.desc   Verify collections.Map creates empty map and has returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsSendableCollectionsTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const map = new collections.Map<string, number>()
      expect(map.has('key')).assertFalse()
    })

    /**
     * @tc.name   BuiltinsSendableCollectionsTest0500
     * @tc.number SUB_BUILTINS_SENDABLE_COLLECTIONS_TEST_0500
     * @tc.desc   Verify collections.Map set and get operations work correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsSendableCollectionsTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const map = new collections.Map<string, number>()
      map.set('key1', 100)
      map.set('key2', 200)
      expect(map.get('key1')).assertEqual(100)
      expect(map.get('key2')).assertEqual(200)
    })

    /**
     * @tc.name   BuiltinsSendableCollectionsTest0600
     * @tc.number SUB_BUILTINS_SENDABLE_COLLECTIONS_TEST_0600
     * @tc.desc   Verify collections.Map delete removes key correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsSendableCollectionsTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const map = new collections.Map<string, number>()
      map.set('key1', 100)
      expect(map.has('key1')).assertTrue()
      map.delete('key1')
      expect(map.has('key1')).assertFalse()
    })

    /**
     * @tc.name   BuiltinsSendableCollectionsTest0700
     * @tc.number SUB_BUILTINS_SENDABLE_COLLECTIONS_TEST_0700
     * @tc.desc   Verify collections.Set creates empty set and has returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsSendableCollectionsTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const set = new collections.Set<number>()
      expect(set.has(1)).assertFalse()
    })

    /**
     * @tc.name   BuiltinsSendableCollectionsTest0800
     * @tc.number SUB_BUILTINS_SENDABLE_COLLECTIONS_TEST_0800
     * @tc.desc   Verify collections.Set add/has/delete operations work correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsSendableCollectionsTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const set = new collections.Set<number>()
      set.add(10)
      expect(set.has(10)).assertTrue()
      set.delete(10)
      expect(set.has(10)).assertFalse()
    })

    /**
     * @tc.name   BuiltinsSendableCollectionsTest0900
     * @tc.number SUB_BUILTINS_SENDABLE_COLLECTIONS_TEST_0900
     * @tc.desc   Verify collections.Int32Array creates and reads/writes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsSendableCollectionsTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const typedArr = new collections.Int32Array(100)
      typedArr[0] = 100
      typedArr[50] = 200
      expect(typedArr[0]).assertEqual(100)
      expect(typedArr[50]).assertEqual(200)
    })

    /**
     * @tc.name   BuiltinsSendableCollectionsTest1000
     * @tc.number SUB_BUILTINS_SENDABLE_COLLECTIONS_TEST_1000
     * @tc.desc   Verify collections.Int32Array default values are 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsSendableCollectionsTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const typedArr = new collections.Int32Array(10)
      expect(typedArr[0]).assertEqual(0)
      expect(typedArr[5]).assertEqual(0)
    })

    /**
     * @tc.name   BuiltinsSendableCollectionsTest1100
     * @tc.number SUB_BUILTINS_SENDABLE_COLLECTIONS_TEST_1100
     * @tc.desc   Verify collections.Array sequential push operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsSendableCollectionsTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   BuiltinsSendableCollectionsTest1200
     * @tc.number SUB_BUILTINS_SENDABLE_COLLECTIONS_TEST_1200
     * @tc.desc   Verify collections.Map sequential set operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsSendableCollectionsTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   BuiltinsSendableCollectionsTest1300
     * @tc.number SUB_BUILTINS_SENDABLE_COLLECTIONS_TEST_1300
     * @tc.desc   Verify SendableLruCache creates with capacity and default values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsSendableCollectionsTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const lruCache = new ArkTSUtils.SendableLruCache<number, string>(5)
      expect(lruCache.length).assertEqual(0)
    })

    /**
     * @tc.name   BuiltinsSendableCollectionsTest1400
     * @tc.number SUB_BUILTINS_SENDABLE_COLLECTIONS_TEST_1400
     * @tc.desc   Verify SendableLruCache put and get operations work correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsSendableCollectionsTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const lruCache = new ArkTSUtils.SendableLruCache<number, string>(5)
      lruCache.put(1, 'value1')
      lruCache.put(2, 'value2')
      expect(lruCache.get(1)).assertEqual('value1')
      expect(lruCache.get(2)).assertEqual('value2')
      expect(lruCache.length).assertEqual(2)
    })

    /**
     * @tc.name   BuiltinsSendableCollectionsTest1500
     * @tc.number SUB_BUILTINS_SENDABLE_COLLECTIONS_TEST_1500
     * @tc.desc   Verify SendableLruCache contains checks key existence correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsSendableCollectionsTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const lruCache = new ArkTSUtils.SendableLruCache<number, string>(5)
      lruCache.put(1, 'value1')
      expect(lruCache.contains(1)).assertTrue()
      expect(lruCache.contains(2)).assertFalse()
    })

    /**
     * @tc.name   BuiltinsSendableCollectionsTest1600
     * @tc.number SUB_BUILTINS_SENDABLE_COLLECTIONS_TEST_1600
     * @tc.desc   Verify SendableLruCache remove removes key correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsSendableCollectionsTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const lruCache = new ArkTSUtils.SendableLruCache<number, string>(5)
      lruCache.put(1, 'value1')
      expect(lruCache.contains(1)).assertTrue()
      lruCache.remove(1)
      expect(lruCache.contains(1)).assertFalse()
      expect(lruCache.length).assertEqual(0)
    })

    /**
     * @tc.name   BuiltinsSendableCollectionsTest1700
     * @tc.number SUB_BUILTINS_SENDABLE_COLLECTIONS_TEST_1700
     * @tc.desc   Verify SendableLruCache evicts least recently used entry when capacity exceeded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsSendableCollectionsTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
     * @tc.name   BuiltinsSendableCollectionsTest1800
     * @tc.number SUB_BUILTINS_SENDABLE_COLLECTIONS_TEST_1800
     * @tc.desc   Verify SendableLruCache get updates access order for LRU eviction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsSendableCollectionsTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
     * @tc.name   BuiltinsSendableCollectionsTest1900
     * @tc.number SUB_BUILTINS_SENDABLE_COLLECTIONS_TEST_1900
     * @tc.desc   Verify SendableLruCache sequential put operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsSendableCollectionsTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
