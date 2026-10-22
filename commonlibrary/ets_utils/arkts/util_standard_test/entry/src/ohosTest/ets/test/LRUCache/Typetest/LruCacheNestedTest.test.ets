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

const NESTED_LRU_KEYS: Array<Array<Array<number>>> = [
  [[1, 2], [3, 4]],
  [[0]],
  [],
];

const NESTED_LRU_VALUES: Array<Array<Array<string>>> = [
  [['a'], ['b', 'c']],
  [['']],
  [],
];

export default function lruCacheNestedTest() {
  describe('LruCacheNestedTest', () => {
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
     * @tc.name testLruCacheNestedTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_NESTED_TEST_0100
     * @tc.desc Verify constructor and getCapacity with nested array keys and values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheNestedTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyCache: util.LRUCache<Array<Array<number>>, Array<Array<string>>> =
        new util.LRUCache<Array<Array<number>>, Array<Array<string>>>();
      expect(emptyCache.isEmpty()).assertTrue();
      expect(emptyCache.getCapacity()).assertEqual(64);

      const cache: util.LRUCache<Array<Array<number>>, Array<Array<string>>> =
        new util.LRUCache<Array<Array<number>>, Array<Array<string>>>(4);
      cache.put(NESTED_LRU_KEYS[0], NESTED_LRU_VALUES[0]);
      expect(cache.isEmpty()).assertFalse();
      expect(cache.getCapacity()).assertEqual(4);
    });

    /**
     * @tc.name testLruCacheNestedTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_NESTED_TEST_0200
     * @tc.desc Verify put, get and contains with nested array reference identity keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheNestedTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<Array<Array<number>>, Array<Array<string>>> =
        new util.LRUCache<Array<Array<number>>, Array<Array<string>>>(8);

      const putResult: Array<Array<string>> = cache.put(NESTED_LRU_KEYS[0], NESTED_LRU_VALUES[0]);
      expect(putResult === NESTED_LRU_VALUES[0]).assertTrue();

      const getResult: Array<Array<string>> | undefined = cache.get(NESTED_LRU_KEYS[0]);
      expect(getResult === NESTED_LRU_VALUES[0]).assertTrue();
      expect(getResult![1][1]).assertEqual('c');

      const sameContentKey: Array<Array<number>> = [[1, 2], [3, 4]];
      expect(cache.contains(sameContentKey)).assertFalse();
      expect(cache.get(NESTED_LRU_KEYS[1])).assertUndefined();
    });

    /**
     * @tc.name testLruCacheNestedTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_NESTED_TEST_0300
     * @tc.desc Verify empty nested container as key and value with removal semantics
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheNestedTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<Array<Array<number>>, Array<Array<string>>> =
        new util.LRUCache<Array<Array<number>>, Array<Array<string>>>(8);
      cache.put(NESTED_LRU_KEYS[2], NESTED_LRU_VALUES[2]);
      cache.put(NESTED_LRU_KEYS[1], NESTED_LRU_VALUES[1]);

      const emptyValue: Array<Array<string>> | undefined = cache.get(NESTED_LRU_KEYS[2]);
      expect(emptyValue === NESTED_LRU_VALUES[2]).assertTrue();
      expect(cache.get(NESTED_LRU_KEYS[1])![0][0]).assertEqual('');

      const removed: Array<Array<string>> | undefined = cache.remove(NESTED_LRU_KEYS[1]);
      expect(removed === NESTED_LRU_VALUES[1]).assertTrue();
      expect(cache.length).assertEqual(1);
      expect(cache.remove(NESTED_LRU_KEYS[0])).assertUndefined();
    });

    /**
     * @tc.name testLruCacheNestedTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_NESTED_TEST_0400
     * @tc.desc Verify eviction and updateCapacity shrink with nested array entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheNestedTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<Array<Array<number>>, Array<Array<string>>> =
        new util.LRUCache<Array<Array<number>>, Array<Array<string>>>(2);
      cache.put(NESTED_LRU_KEYS[0], NESTED_LRU_VALUES[0]);
      cache.put(NESTED_LRU_KEYS[1], NESTED_LRU_VALUES[1]);
      cache.put(NESTED_LRU_KEYS[2], NESTED_LRU_VALUES[2]);

      expect(cache.contains(NESTED_LRU_KEYS[0])).assertFalse();
      expect(cache.get(NESTED_LRU_KEYS[1]) === NESTED_LRU_VALUES[1]).assertTrue();
      expect(cache.length).assertEqual(2);

      cache.updateCapacity(1);
      expect(cache.get(NESTED_LRU_KEYS[1]) === NESTED_LRU_VALUES[1]).assertTrue();
      expect(cache.contains(NESTED_LRU_KEYS[2])).assertFalse();
    });

    /**
     * @tc.name testLruCacheNestedTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_NESTED_TEST_0500
     * @tc.desc Verify keys, values and entries preserve nested array references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheNestedTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<Array<Array<number>>, Array<Array<string>>> =
        new util.LRUCache<Array<Array<number>>, Array<Array<string>>>(8);
      cache.put(NESTED_LRU_KEYS[0], NESTED_LRU_VALUES[0]);
      cache.put(NESTED_LRU_KEYS[1], NESTED_LRU_VALUES[1]);
      cache.put(NESTED_LRU_KEYS[2], NESTED_LRU_VALUES[2]);

      const keys: Array<Array<Array<number>>> = cache.keys();
      expect(keys[0] === NESTED_LRU_KEYS[0]).assertTrue();
      expect(keys[0][0][1]).assertEqual(2);

      const values: Array<Array<Array<string>>> = cache.values();
      expect(values[1] === NESTED_LRU_VALUES[1]).assertTrue();

      const pairIterator = cache.entries();
      const firstPair = pairIterator.next();
      expect(firstPair.value[0] === NESTED_LRU_KEYS[0]).assertTrue();
      expect(firstPair.value[1] === NESTED_LRU_VALUES[0]).assertTrue();
    });

    /**
     * @tc.name testLruCacheNestedTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_NESTED_TEST_0600
     * @tc.desc Verify statistics, createDefault and clear with nested array types
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheNestedTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<Array<Array<number>>, Array<Array<string>>> =
        new util.LRUCache<Array<Array<number>>, Array<Array<string>>>(8);
      expect(cache.createDefault(NESTED_LRU_KEYS[0])).assertUndefined();

      cache.put(NESTED_LRU_KEYS[0], NESTED_LRU_VALUES[0]);
      cache.get(NESTED_LRU_KEYS[0]);
      cache.get(NESTED_LRU_KEYS[1]);
      expect(cache.getMatchCount()).assertEqual(1);
      expect(cache.getMissCount()).assertEqual(1);
      expect(cache.getPutCount()).assertEqual(1);

      cache.clear();
      expect(cache.isEmpty()).assertTrue();
      expect(cache.entries().next().done).assertTrue();
    });
  });
}
