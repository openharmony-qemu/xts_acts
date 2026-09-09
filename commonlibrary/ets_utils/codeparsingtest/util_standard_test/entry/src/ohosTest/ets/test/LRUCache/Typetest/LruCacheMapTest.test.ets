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

const MAP_KEY_A: Array<string> = ['a1', 'a2'];
const MAP_KEY_B: Array<string> = ['b1', 'b2'];
const MAP_VALUE_X: Array<number> = [10, 20];
const MAP_VALUE_Y: Array<number> = [30, 40];

const MAP_LRU_KEYS: Array<Map<string, string>> = [
  new Map<string, string>([['k1', 'v1'], ['k2', 'v2']]),
  new Map<string, string>([['k1', 'v1']]),
  new Map<string, string>(),
];

const MAP_LRU_VALUES: Array<Map<string, string>> = [
  new Map<string, string>([['x1', 'y1']]),
  new Map<string, string>([['x2', 'y2'], ['x3', 'y3']]),
  new Map<string, string>(),
];

export default function lruCacheMapTest() {
  describe('LruCacheMapTest', () => {
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
     * @tc.name testLruCacheMapTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_MAP_TEST_0100
     * @tc.desc Verify constructor and getCapacity with Map keys and values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheMapTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyCache: util.LRUCache<Map<string, string>, Map<string, string>> =
        new util.LRUCache<Map<string, string>, Map<string, string>>();
      expect(emptyCache.isEmpty()).assertTrue();
      expect(emptyCache.getCapacity()).assertEqual(64);

      const cache: util.LRUCache<Map<string, string>, Map<string, string>> =
        new util.LRUCache<Map<string, string>, Map<string, string>>(8);
      cache.put(MAP_LRU_KEYS[0], MAP_LRU_VALUES[0]);
      expect(cache.isEmpty()).assertFalse();
      expect(cache.getCapacity()).assertEqual(8);
    });

    /**
     * @tc.name testLruCacheMapTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_MAP_TEST_0200
     * @tc.desc Verify put, get and contains with Map reference identity keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheMapTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<Map<string, string>, Map<string, string>> =
        new util.LRUCache<Map<string, string>, Map<string, string>>(8);

      const putResult: Map<string, string> = cache.put(MAP_LRU_KEYS[0], MAP_LRU_VALUES[0]);
      expect(putResult === MAP_LRU_VALUES[0]).assertTrue();

      const getResult: Map<string, string> | undefined = cache.get(MAP_LRU_KEYS[0]);
      expect(getResult === MAP_LRU_VALUES[0]).assertTrue();
      expect(getResult!.get('x1')).assertEqual('y1');

      const sameContentKey: Map<string, string> =
        new Map<string, string>([['k1', 'v1'], ['k2', 'v2']]);
      expect(cache.contains(sameContentKey)).assertFalse();
      expect(cache.get(MAP_LRU_KEYS[1])).assertUndefined();
    });

    /**
     * @tc.name testLruCacheMapTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_MAP_TEST_0300
     * @tc.desc Verify removed Map value stays usable and empty Map key is valid
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheMapTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<Map<string, string>, Map<string, string>> =
        new util.LRUCache<Map<string, string>, Map<string, string>>(8);
      cache.put(MAP_LRU_KEYS[1], MAP_LRU_VALUES[1]);
      cache.put(MAP_LRU_KEYS[2], MAP_LRU_VALUES[2]);

      const emptyMapResult: Map<string, string> | undefined = cache.get(MAP_LRU_KEYS[2]);
      expect(emptyMapResult === MAP_LRU_VALUES[2]).assertTrue();
      expect(cache.get(MAP_LRU_KEYS[2])!.size).assertEqual(0);

      const removed: Map<string, string> | undefined = cache.remove(MAP_LRU_KEYS[1]);
      expect(removed === MAP_LRU_VALUES[1]).assertTrue();
      expect(removed!.get('x2')).assertEqual('y2');
      expect(cache.length).assertEqual(1);
      expect(cache.remove(MAP_LRU_KEYS[0])).assertUndefined();
    });

    /**
     * @tc.name testLruCacheMapTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_MAP_TEST_0400
     * @tc.desc Verify eviction and updateCapacity shrink with Map entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheMapTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<Map<string, string>, Map<string, string>> =
        new util.LRUCache<Map<string, string>, Map<string, string>>(2);
      cache.put(MAP_LRU_KEYS[0], MAP_LRU_VALUES[0]);
      cache.put(MAP_LRU_KEYS[1], MAP_LRU_VALUES[1]);
      cache.put(MAP_LRU_KEYS[2], MAP_LRU_VALUES[2]);

      expect(cache.contains(MAP_LRU_KEYS[0])).assertFalse();
      expect(cache.get(MAP_LRU_KEYS[1]) === MAP_LRU_VALUES[1]).assertTrue();
      expect(cache.length).assertEqual(2);

      cache.updateCapacity(1);
      expect(cache.get(MAP_LRU_KEYS[1]) === MAP_LRU_VALUES[1]).assertTrue();
      expect(cache.contains(MAP_LRU_KEYS[2])).assertFalse();
    });

    /**
     * @tc.name testLruCacheMapTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_MAP_TEST_0500
     * @tc.desc Verify keys, values and entries preserve Map references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheMapTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<Map<string, string>, Map<string, string>> =
        new util.LRUCache<Map<string, string>, Map<string, string>>(8);
      cache.put(MAP_LRU_KEYS[0], MAP_LRU_VALUES[0]);
      cache.put(MAP_LRU_KEYS[1], MAP_LRU_VALUES[1]);
      cache.put(MAP_LRU_KEYS[2], MAP_LRU_VALUES[2]);

      const keys: Array<Map<string, string>> = cache.keys();
      expect(keys[0] === MAP_LRU_KEYS[0]).assertTrue();
      expect(keys[2] === MAP_LRU_KEYS[2]).assertTrue();

      const values: Array<Map<string, string>> = cache.values();
      expect(values[1] === MAP_LRU_VALUES[1]).assertTrue();

      const pairIterator = cache.entries();
      const firstPair = pairIterator.next();
      expect(firstPair.value[0] === MAP_LRU_KEYS[0]).assertTrue();
      expect(firstPair.value[1] === MAP_LRU_VALUES[0]).assertTrue();
    });

    /**
     * @tc.name testLruCacheMapTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_MAP_TEST_0600
     * @tc.desc Verify statistics, createDefault and clear with Map types
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheMapTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<Map<string, string>, Map<string, string>> =
        new util.LRUCache<Map<string, string>, Map<string, string>>(8);
      expect(cache.createDefault(MAP_LRU_KEYS[0])).assertUndefined();

      cache.put(MAP_LRU_KEYS[0], MAP_LRU_VALUES[0]);
      cache.get(MAP_LRU_KEYS[0]);
      cache.get(MAP_LRU_KEYS[1]);
      expect(cache.getMatchCount()).assertEqual(1);
      expect(cache.getMissCount()).assertEqual(1);
      expect(cache.getPutCount()).assertEqual(1);

      cache.clear();
      expect(cache.isEmpty()).assertTrue();
      expect(cache.keys().length).assertEqual(0);
    });
  });
}
