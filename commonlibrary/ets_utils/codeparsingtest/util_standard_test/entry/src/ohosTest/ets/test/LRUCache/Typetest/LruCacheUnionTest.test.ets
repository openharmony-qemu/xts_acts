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

type UnionKey = number | string | null | undefined;
type UnionValue = number | string | null | undefined;

function coerceKey(input: number | string | null | undefined): number | string {
  return input as number | string;
}

export default function lruCacheUnionTest() {
  describe('LruCacheUnionTest', () => {
    beforeAll(() => {});

    beforeEach(async () => {
      await sleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.name testLruCacheUnionTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_UNION_TEST_0100
     * @tc.desc Verify constructor, put and length with real mixed union type keys and values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheUnionTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<UnionKey, UnionValue> = new util.LRUCache<UnionKey, UnionValue>(16);
      expect(cache.isEmpty()).assertTrue();
      expect(cache.getCapacity()).assertEqual(16);
      expect(cache.getPutCount()).assertEqual(0);

      const putResult: UnionValue = cache.put(1, 'num1');
      expect(putResult).assertEqual('num1');
      cache.put('str2', 2);
      cache.put(3, 'three');
      expect(cache.length).assertEqual(3);
      expect(cache.isEmpty()).assertFalse();
      expect(cache.getCapacity()).assertEqual(16);
      expect(cache.getPutCount()).assertEqual(3);
    });

    /**
     * @tc.name testLruCacheUnionTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_UNION_TEST_0200
     * @tc.desc Verify get, contains with mixed number and string union keys and count statistics
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheUnionTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<UnionKey, UnionValue> = new util.LRUCache<UnionKey, UnionValue>(16);
      cache.put(1, 'num1');
      cache.put('str2', 2);
      cache.put(3, 'three');

      expect(cache.get(1)).assertEqual('num1');
      expect(cache.get('str2')).assertEqual(2);
      expect(cache.get(3)).assertEqual('three');
      expect(cache.get(99)).assertUndefined();
      expect(cache.get('absent')).assertUndefined();

      expect(cache.contains(1)).assertTrue();
      expect(cache.contains('str2')).assertTrue();
      expect(cache.contains(99)).assertFalse();
      expect(cache.getMatchCount()).assertEqual(5);
      expect(cache.getMissCount()).assertEqual(3);
    });

    /**
     * @tc.name testLruCacheUnionTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_UNION_TEST_0300
     * @tc.desc Verify put and get with null and undefined union values are rejected as non-object parameters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheUnionTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<UnionKey, UnionValue> = new util.LRUCache<UnionKey, UnionValue>(16);
      cache.put(1, 'num1');

      let thrownNull: boolean = false;
      try {
        cache.put(2, null);
      } catch (e) {
        thrownNull = true;
        expect((e as Error).message.includes('must be Object')).assertTrue();
      }
      expect(thrownNull).assertTrue();

      let thrownUndefined: boolean = false;
      try {
        cache.put(3, undefined);
      } catch (e) {
        thrownUndefined = true;
        expect((e as Error).message.includes('must be Object')).assertTrue();
      }
      expect(thrownUndefined).assertTrue();

      let thrownNullKey: boolean = false;
      try {
        const nullKey: number | null | undefined = null;
        cache.put(coerceKey(nullKey), 'val');
      } catch (e) {
        thrownNullKey = true;
        expect((e as Error).message.includes('must be Object')).assertTrue();
      }
      expect(thrownNullKey).assertTrue();

      expect(cache.length).assertEqual(1);
      expect(cache.get(1)).assertEqual('num1');
    });

    /**
     * @tc.name testLruCacheUnionTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_UNION_TEST_0400
     * @tc.desc Verify overwrite duplicate union key and eviction with mixed union types
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheUnionTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<UnionKey, UnionValue> = new util.LRUCache<UnionKey, UnionValue>(4);
      cache.put(1, 'first');
      cache.put(1, 'second');
      expect(cache.length).assertEqual(1);
      expect(cache.get(1)).assertEqual('second');

      cache.put('k2', 2);
      cache.put(3, 'three');
      cache.put(4, 4);
      expect(cache.length).assertEqual(4);

      cache.put('k5', 5);
      expect(cache.length).assertEqual(4);
      expect(cache.contains(1)).assertFalse();
      expect(cache.contains('k5')).assertTrue();
      expect(cache.getRemovalCount()).assertEqual(1);
    });

    /**
     * @tc.name testLruCacheUnionTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_UNION_TEST_0500
     * @tc.desc Verify keys and values return mixed union lists ordered from least to most recently used
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheUnionTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<UnionKey, UnionValue> = new util.LRUCache<UnionKey, UnionValue>(8);
      cache.put(1, 'num1');
      cache.put('str2', 2);
      cache.put(3, 'three');
      cache.put(4, 4);

      cache.get(1);
      const keys: Array<UnionKey> = cache.keys();
      expect(keys.length).assertEqual(4);
      expect(keys[0]).assertEqual('str2');
      expect(keys[3]).assertEqual(1);

      const values: Array<UnionValue> = cache.values();
      expect(values.length).assertEqual(4);
      expect(values[3]).assertEqual('num1');
      expect(values[1]).assertEqual('three');
    });

    /**
     * @tc.name testLruCacheUnionTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_UNION_TEST_0600
     * @tc.desc Verify entries and for-of iteration with mixed union type key-value pairs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheUnionTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<UnionKey, UnionValue> = new util.LRUCache<UnionKey, UnionValue>(8);
      cache.put(1, 'num1');
      cache.put('str2', 2);

      const pairIterator = cache.entries();
      const firstPair = pairIterator.next();
      expect(firstPair.value[0]).assertEqual(1);
      expect(firstPair.value[1]).assertEqual('num1');

      let iteratedCount: number = 0;
      let lastKey: UnionKey = null;
      for (const pair of cache) {
        iteratedCount++;
        lastKey = pair[0];
      }
      expect(iteratedCount).assertEqual(2);
      expect(lastKey).assertEqual('str2');
    });

    /**
     * @tc.name testLruCacheUnionTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_UNION_TEST_0700
     * @tc.desc Verify updateCapacity shrink evicts union entries in LRU order and clear empties cache
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheUnionTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<UnionKey, UnionValue> = new util.LRUCache<UnionKey, UnionValue>(8);
      cache.put(1, 'num1');
      cache.put('str2', 2);
      cache.put(3, 'three');

      cache.updateCapacity(1);
      expect(cache.getCapacity()).assertEqual(1);
      expect(cache.length).assertEqual(1);
      expect(cache.contains(3)).assertTrue();
      expect(cache.contains(1)).assertFalse();

      cache.clear();
      expect(cache.isEmpty()).assertTrue();
      expect(cache.keys().length).assertEqual(0);
      expect(cache.values().length).assertEqual(0);
    });

    /**
     * @tc.name testLruCacheUnionTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRU_CACHE_UNION_TEST_0800
     * @tc.desc Verify count statistics and toString with mixed union type entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testLruCacheUnionTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cache: util.LRUCache<UnionKey, UnionValue> = new util.LRUCache<UnionKey, UnionValue>(16);
      cache.put(1, 'num1');
      cache.put('str2', 2);
      cache.get(1);
      cache.get(99);
      expect(cache.getPutCount()).assertEqual(2);
      expect(cache.getMatchCount()).assertEqual(1);
      expect(cache.getMissCount()).assertEqual(1);

      const text: string = cache.toString();
      expect(text.includes('maxSize = 16')).assertTrue();
      expect(text.includes('hits = 1')).assertTrue();
      expect(text.includes('misses = 1')).assertTrue();
    });
  });
}
