/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { util } from '@kit.ArkTS';
import { beforeAll, beforeEach, afterEach, afterAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

const BOOLEAN_LRU_KEYS: Array<boolean> = [
  true, false,
];

const BOOLEAN_LRU_VALUES: Array<boolean> = [
  false, true,
];

export default function lruCacheBooleanTest() {
  describe('LruCacheBooleanTest', () => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await sleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.name testLruCacheBooleanTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_BOOLEAN_TEST_0100
     * @tc.desc Verify constructor, getCapacity, length and isEmpty with boolean keys and values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheBooleanTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyCache: util.LRUCache<boolean, boolean> = new util.LRUCache<boolean, boolean>();
      expect(emptyCache.length).assertEqual(0);
      expect(emptyCache.isEmpty()).assertTrue();
      expect(emptyCache.getCapacity()).assertEqual(64);

      const cache: util.LRUCache<boolean, boolean> = new util.LRUCache<boolean, boolean>(2);
      cache.put(BOOLEAN_LRU_KEYS[0], BOOLEAN_LRU_VALUES[0]);
      cache.put(BOOLEAN_LRU_KEYS[1], BOOLEAN_LRU_VALUES[1]);
      expect(cache.length).assertEqual(2);
      expect(cache.isEmpty()).assertFalse();
      expect(cache.getCapacity()).assertEqual(2);
    });

    /**
     * @tc.name testLruCacheBooleanTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_BOOLEAN_TEST_0200
     * @tc.desc Verify put, get, contains and remove with boolean keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheBooleanTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<boolean, boolean> = new util.LRUCache<boolean, boolean>();

      const putResult: boolean = cache.put(BOOLEAN_LRU_KEYS[0], BOOLEAN_LRU_VALUES[0]);
      expect(putResult).assertEqual(BOOLEAN_LRU_VALUES[0]);

      cache.put(BOOLEAN_LRU_KEYS[1], BOOLEAN_LRU_VALUES[1]);
      expect(cache.get(BOOLEAN_LRU_KEYS[0])).assertEqual(BOOLEAN_LRU_VALUES[0]);
      expect(cache.get(BOOLEAN_LRU_KEYS[1])).assertEqual(BOOLEAN_LRU_VALUES[1]);

      expect(cache.contains(BOOLEAN_LRU_KEYS[0])).assertTrue();

      const removed: boolean | undefined = cache.remove(BOOLEAN_LRU_KEYS[1]);
      expect(removed).assertEqual(BOOLEAN_LRU_VALUES[1]);
      expect(cache.contains(BOOLEAN_LRU_KEYS[1])).assertFalse();
    });

    /**
     * @tc.name testLruCacheBooleanTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_BOOLEAN_TEST_0300
     * @tc.desc Verify duplicate key overwrite and eviction with capacity 1 boolean cache
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheBooleanTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<boolean, boolean> = new util.LRUCache<boolean, boolean>(4);
      cache.put(BOOLEAN_LRU_KEYS[0], BOOLEAN_LRU_VALUES[0]);
      cache.put(BOOLEAN_LRU_KEYS[0], BOOLEAN_LRU_KEYS[0]);
      expect(cache.length).assertEqual(1);
      expect(cache.get(BOOLEAN_LRU_KEYS[0])).assertEqual(BOOLEAN_LRU_KEYS[0]);

      const evictCache: util.LRUCache<boolean, boolean> = new util.LRUCache<boolean, boolean>(1);
      evictCache.put(BOOLEAN_LRU_KEYS[0], BOOLEAN_LRU_VALUES[0]);
      evictCache.put(BOOLEAN_LRU_KEYS[1], BOOLEAN_LRU_VALUES[1]);
      expect(evictCache.length).assertEqual(1);
      expect(evictCache.contains(BOOLEAN_LRU_KEYS[0])).assertFalse();
      expect(evictCache.getRemovalCount()).assertEqual(1);
    });

    /**
     * @tc.name testLruCacheBooleanTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_BOOLEAN_TEST_0400
     * @tc.desc Verify updateCapacity, keys and values order with boolean entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheBooleanTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<boolean, boolean> = new util.LRUCache<boolean, boolean>(4);
      cache.put(BOOLEAN_LRU_KEYS[0], BOOLEAN_LRU_VALUES[0]);
      cache.put(BOOLEAN_LRU_KEYS[1], BOOLEAN_LRU_VALUES[1]);

      cache.updateCapacity(1);
      expect(cache.getCapacity()).assertEqual(1);
      expect(cache.length).assertEqual(1);
      expect(cache.keys()[0]).assertEqual(BOOLEAN_LRU_KEYS[1]);
      expect(cache.values()[0]).assertEqual(BOOLEAN_LRU_VALUES[1]);

      cache.updateCapacity(8);
      expect(cache.getCapacity()).assertEqual(8);
      cache.clear();
      expect(cache.keys().length).assertEqual(0);
      expect(cache.values().length).assertEqual(0);
    });

    /**
     * @tc.name testLruCacheBooleanTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_BOOLEAN_TEST_0500
     * @tc.desc Verify entries and for-of iteration with boolean entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheBooleanTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<boolean, boolean> = new util.LRUCache<boolean, boolean>(4);
      cache.put(BOOLEAN_LRU_KEYS[0], BOOLEAN_LRU_VALUES[0]);
      cache.put(BOOLEAN_LRU_KEYS[1], BOOLEAN_LRU_VALUES[1]);

      const pairIterator = cache.entries();
      const firstPair = pairIterator.next();
      expect(firstPair.value[0]).assertEqual(BOOLEAN_LRU_KEYS[0]);
      expect(firstPair.value[1]).assertEqual(BOOLEAN_LRU_VALUES[0]);

      let iteratedCount: number = 0;
      for (const pair of cache) {
        iteratedCount++;
      }
      expect(iteratedCount).assertEqual(2);
    });

    /**
     * @tc.name testLruCacheBooleanTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_BOOLEAN_TEST_0600
     * @tc.desc Verify count statistics, toString and createDefault with boolean keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheBooleanTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<boolean, boolean> = new util.LRUCache<boolean, boolean>(8);
      expect(cache.createDefault(BOOLEAN_LRU_KEYS[0])).assertUndefined();

      cache.put(BOOLEAN_LRU_KEYS[0], BOOLEAN_LRU_VALUES[0]);
      cache.get(BOOLEAN_LRU_KEYS[0]);
      expect(cache.getPutCount()).assertEqual(1);
      expect(cache.getMatchCount()).assertEqual(1);

      cache.get(BOOLEAN_LRU_KEYS[1]);
      expect(cache.getMissCount()).assertEqual(1);

      const text: string = cache.toString();
      expect(text.includes('maxSize = 8')).assertTrue();
      expect(text.includes('hits = 1')).assertTrue();
      expect(text.includes('misses = 1')).assertTrue();
    });
  });
}
