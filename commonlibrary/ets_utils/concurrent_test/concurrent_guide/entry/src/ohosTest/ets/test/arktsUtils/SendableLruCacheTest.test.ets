/*
 * Copyright (c) 2026 RKH Corp.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { ArkTSUtils } from '@kit.ArkTS';

export default function SendableLruCacheTest(): void {
  describe('SendableLruCacheTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Promise.resolve()
    })

    /**
     * @tc.name   SendableLruCacheTest0100
     * @tc.number SUB_ARKTS_UTILS_SENDABLELRUCACHE_TEST_0100
     * @tc.desc   Verify SendableLruCache constructor creates empty cache with specified capacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableLruCacheTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let cache: ArkTSUtils.SendableLruCache<string, number> =
        new ArkTSUtils.SendableLruCache<string, number>(5)
      expect(cache.length).assertEqual(0)
    })

    /**
     * @tc.name   SendableLruCacheTest0200
     * @tc.number SUB_ARKTS_UTILS_SENDABLELRUCACHE_TEST_0200
     * @tc.desc   Verify SendableLruCache put and get operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableLruCacheTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let cache: ArkTSUtils.SendableLruCache<string, number> =
        new ArkTSUtils.SendableLruCache<string, number>(3)
      cache.put('one', 1)
      cache.put('two', 2)
      expect(cache.get('one')).assertEqual(1)
      expect(cache.get('two')).assertEqual(2)
      expect(cache.length).assertEqual(2)
    })

    /**
     * @tc.name   SendableLruCacheTest0300
     * @tc.number SUB_ARKTS_UTILS_SENDABLELRUCACHE_TEST_0300
     * @tc.desc   Verify SendableLruCache keys returns all keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableLruCacheTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let cache: ArkTSUtils.SendableLruCache<string, number> =
        new ArkTSUtils.SendableLruCache<string, number>(3)
      cache.put('one', 1)
      cache.put('two', 2)
      cache.put('three', 3)
      let keys: string[] = cache.keys()
      expect(keys.length).assertEqual(3)
    })

    /**
     * @tc.name   SendableLruCacheTest0400
     * @tc.number SUB_ARKTS_UTILS_SENDABLELRUCACHE_TEST_0400
     * @tc.desc   Verify SendableLruCache remove and clear operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableLruCacheTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let cache: ArkTSUtils.SendableLruCache<string, number> =
        new ArkTSUtils.SendableLruCache<string, number>(3)
      cache.put('one', 1)
      cache.put('two', 2)

      cache.remove('one')
      expect(cache.contains('one')).assertFalse()
      expect(cache.length).assertEqual(1)

      cache.clear()
      expect(cache.length).assertEqual(0)
    })

    /**
     * @tc.name   SendableLruCacheTest0500
     * @tc.number SUB_ARKTS_UTILS_SENDABLELRUCACHE_TEST_0500
     * @tc.desc   Verify SendableLruCache LRU eviction when exceeding capacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableLruCacheTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let cache: ArkTSUtils.SendableLruCache<string, number> =
        new ArkTSUtils.SendableLruCache<string, number>(3)
      cache.put('one', 1)
      cache.put('two', 2)
      cache.put('three', 3)

      // Access 'one' to make it recently used
      cache.get('one')

      // Add 'four', should evict 'two' (least recently used)
      cache.put('four', 4)

      expect(cache.contains('one')).assertTrue()
      expect(cache.contains('two')).assertFalse()
      expect(cache.contains('three')).assertTrue()
      expect(cache.contains('four')).assertTrue()
      expect(cache.length).assertEqual(3)
    })

    /**
     * @tc.name   SendableLruCacheTest0600
     * @tc.number SUB_ARKTS_UTILS_SENDABLELRUCACHE_TEST_0600
     * @tc.desc   Verify SendableLruCache get updates access order for LRU eviction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendableLruCacheTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let cache: ArkTSUtils.SendableLruCache<string, number> =
        new ArkTSUtils.SendableLruCache<string, number>(3)
      cache.put('one', 1)
      cache.put('two', 2)
      cache.put('three', 3)

      // Before access: check initial keys order
      let keys1: string[] = cache.keys()
      expect(keys1.length).assertEqual(3)

      // Access 'one' to move it to most recent
      cache.get('one')

      let keys2: string[] = cache.keys()
      // After accessing 'one', verify order changed: 'one' should not be at the same position
      let oneIndex1: number = keys1.indexOf('one')
      let oneIndex2: number = keys2.indexOf('one')
      expect(oneIndex1 !== oneIndex2).assertTrue()
    })

    /**
     * @tc.name   SendableLruCacheTest0700
     * @tc.number SUB_ARKTS_UTILS_SENDABLELRUCACHE_TEST_0700
     * @tc.desc   Verify SendableLruCache contains returns false for non-existent keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendableLruCacheTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let cache: ArkTSUtils.SendableLruCache<string, number> =
        new ArkTSUtils.SendableLruCache<string, number>(3)
      cache.put('existing', 42)
      expect(cache.contains('existing')).assertTrue()
      expect(cache.contains('nonexistent')).assertFalse()
    })

    /**
     * @tc.name   SendableLruCacheTest0800
     * @tc.number SUB_ARKTS_UTILS_SENDABLELRUCACHE_TEST_0800
     * @tc.desc   Verify SendableLruCache put overwrites existing key value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendableLruCacheTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let cache: ArkTSUtils.SendableLruCache<string, number> =
        new ArkTSUtils.SendableLruCache<string, number>(3)
      cache.put('key', 1)
      expect(cache.get('key')).assertEqual(1)

      cache.put('key', 2)
      expect(cache.get('key')).assertEqual(2)
      expect(cache.length).assertEqual(1)
    })
  })
}
