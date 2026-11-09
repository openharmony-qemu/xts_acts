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

const SET_LRU_KEYS: Array<Set<string>> = [
  new Set<string>(['a', 'b']),
  new Set<string>(['a']),
  new Set<string>(),
];

const SET_LRU_VALUES: Array<Set<number>> = [
  new Set<number>([1, 2, 2, 1]),
  new Set<number>([NaN, Infinity]),
  new Set<number>(),
];

export default function lruCacheSetTest() {
  describe('LruCacheSetTest', () => {
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
     * @tc.name testLruCacheSetTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_SET_TEST_0100
     * @tc.desc Verify constructor and getCapacity with Set keys and values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheSetTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyCache: util.LRUCache<Set<string>, Set<number>> =
        new util.LRUCache<Set<string>, Set<number>>();
      expect(emptyCache.isEmpty()).assertTrue();
      expect(emptyCache.getCapacity()).assertEqual(64);

      const cache: util.LRUCache<Set<string>, Set<number>> =
        new util.LRUCache<Set<string>, Set<number>>(4);
      cache.put(SET_LRU_KEYS[0], SET_LRU_VALUES[0]);
      expect(cache.isEmpty()).assertFalse();
      expect(cache.getCapacity()).assertEqual(4);
    });

    /**
     * @tc.name testLruCacheSetTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_SET_TEST_0200
     * @tc.desc Verify put, get and contains with Set reference identity keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheSetTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<Set<string>, Set<number>> =
        new util.LRUCache<Set<string>, Set<number>>(8);

      const putResult: Set<number> = cache.put(SET_LRU_KEYS[0], SET_LRU_VALUES[0]);
      expect(putResult === SET_LRU_VALUES[0]).assertTrue();

      const getResult: Set<number> | undefined = cache.get(SET_LRU_KEYS[0]);
      expect(getResult === SET_LRU_VALUES[0]).assertTrue();
      expect(getResult!.has(1)).assertTrue();
      expect(getResult!.size).assertEqual(2);

      const sameContentKey: Set<string> = new Set<string>(['a', 'b']);
      expect(cache.contains(sameContentKey)).assertFalse();
      expect(cache.get(SET_LRU_KEYS[1])).assertUndefined();
    });

    /**
     * @tc.name testLruCacheSetTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_SET_TEST_0300
     * @tc.desc Verify special-number Set values and removed Set stays usable
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheSetTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<Set<string>, Set<number>> =
        new util.LRUCache<Set<string>, Set<number>>(8);
      cache.put(SET_LRU_KEYS[1], SET_LRU_VALUES[1]);
      cache.put(SET_LRU_KEYS[2], SET_LRU_VALUES[2]);

      const specialValues: Set<number> | undefined = cache.get(SET_LRU_KEYS[1]);
      expect(specialValues === SET_LRU_VALUES[1]).assertTrue();
      expect(specialValues!.has(NaN)).assertTrue();
      expect(specialValues!.has(Infinity)).assertTrue();

      const removed: Set<number> | undefined = cache.remove(SET_LRU_KEYS[1]);
      expect(removed === SET_LRU_VALUES[1]).assertTrue();
      expect(cache.length).assertEqual(1);
      expect(cache.remove(SET_LRU_KEYS[0])).assertUndefined();
    });

    /**
     * @tc.name testLruCacheSetTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_SET_TEST_0400
     * @tc.desc Verify eviction and updateCapacity shrink with Set entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheSetTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<Set<string>, Set<number>> =
        new util.LRUCache<Set<string>, Set<number>>(2);
      cache.put(SET_LRU_KEYS[0], SET_LRU_VALUES[0]);
      cache.put(SET_LRU_KEYS[1], SET_LRU_VALUES[1]);
      cache.put(SET_LRU_KEYS[2], SET_LRU_VALUES[2]);

      expect(cache.contains(SET_LRU_KEYS[0])).assertFalse();
      expect(cache.get(SET_LRU_KEYS[1]) === SET_LRU_VALUES[1]).assertTrue();
      expect(cache.length).assertEqual(2);

      cache.updateCapacity(1);
      expect(cache.get(SET_LRU_KEYS[1]) === SET_LRU_VALUES[1]).assertTrue();
      expect(cache.contains(SET_LRU_KEYS[2])).assertFalse();
    });

    /**
     * @tc.name testLruCacheSetTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_SET_TEST_0500
     * @tc.desc Verify keys, values and entries preserve Set references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheSetTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<Set<string>, Set<number>> =
        new util.LRUCache<Set<string>, Set<number>>(8);
      cache.put(SET_LRU_KEYS[0], SET_LRU_VALUES[0]);
      cache.put(SET_LRU_KEYS[1], SET_LRU_VALUES[1]);
      cache.put(SET_LRU_KEYS[2], SET_LRU_VALUES[2]);

      const keys: Array<Set<string>> = cache.keys();
      expect(keys[0] === SET_LRU_KEYS[0]).assertTrue();
      expect(keys[2] === SET_LRU_KEYS[2]).assertTrue();

      const values: Array<Set<number>> = cache.values();
      expect(values[1] === SET_LRU_VALUES[1]).assertTrue();

      const pairIterator = cache.entries();
      const firstPair = pairIterator.next();
      expect(firstPair.value[0] === SET_LRU_KEYS[0]).assertTrue();
      expect(firstPair.value[1] === SET_LRU_VALUES[0]).assertTrue();
    });

    /**
     * @tc.name testLruCacheSetTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_SET_TEST_0600
     * @tc.desc Verify statistics, createDefault and clear with Set types
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheSetTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<Set<string>, Set<number>> =
        new util.LRUCache<Set<string>, Set<number>>(8);
      expect(cache.createDefault(SET_LRU_KEYS[0])).assertUndefined();

      cache.put(SET_LRU_KEYS[0], SET_LRU_VALUES[0]);
      cache.get(SET_LRU_KEYS[0]);
      cache.get(SET_LRU_KEYS[2]);
      expect(cache.getMatchCount()).assertEqual(1);
      expect(cache.getMissCount()).assertEqual(1);
      expect(cache.getPutCount()).assertEqual(1);

      cache.clear();
      expect(cache.isEmpty()).assertTrue();
      expect(cache.values().length).assertEqual(0);
    });
  });
}
