'use static';

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

import {
  beforeAll, afterEach, beforeEach, afterAll, describe, it, expect, TestType, Size, Level
} from '../../../../hypium/index';
import util from '@ohos.util';
import Utils from './../Util.test';

interface TagNode {
  tag: string;
}

interface IdBox {
  id: int;
}

class PlusOneDefaultLRU extends util.LRUCache<int, int> {
  constructor(capacity: int) {
    super(capacity);
  }
  createDefault(key: int): int {
    return key + 1;
  }
}

enum RemSlot {
  First = 0,
  Second = 1
}

export default function lruCacheGetRemovalCountTest(): void {
  describe('LruCacheGetRemovalCountTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_REMOVAL_COUNT_0010
     * @tc.name testLruCacheGetRemovalCount001
     * @tc.desc Merged batch (5 tests): [1] Verify getRemovalCount with no argument on fresh default cache returns 0 | [2] Verify removal count still accumulates after a prior read of the count | [3] Verify remova...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetRemovalCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify getRemovalCount with no argument on fresh default cache returns 0 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        expect(cache.getRemovalCount()).assertEqual(0);
      }

      // --- [2] Verify removal count still accumulates after a prior read of the count ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.getRemovalCount();
        cache.put(1, 1);
        cache.put(2, 2);
        expect(cache.getRemovalCount()).assertEqual(1);
      }

      // --- [3] Verify removal count equals 1 after one eviction beyond capacity 3 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        cache.put(1, 1);
        cache.put(2, 2);
        cache.put(3, 3);
        expect(cache.getRemovalCount()).assertEqual(0);
        cache.put(4, 4);
        let removals: long = cache.getRemovalCount();
        expect(removals).assertEqual(1);
      }

      // --- [4] Verify removal count return value can participate in addition ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(1, 1);
        cache.put(2, 2);
        let r: long = cache.getRemovalCount() + 1;
        expect(r).assertEqual(2);
      }

      // --- [5] Verify removal count compared after Number conversion ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(1, 1);
        cache.put(2, 2);
        expect(Number(cache.getRemovalCount())).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_REMOVAL_COUNT_0020
     * @tc.name testLruCacheGetRemovalCount002
     * @tc.desc Merged batch (5 tests): [1] Verify reading removal count does not affect put count | [2] Verify two consecutive puts on capacity 1 count one eviction | [3] Verify three puts on capacity 2 count one...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetRemovalCount002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify reading removal count does not affect put count ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 1);
        cache.getRemovalCount();
        expect(cache.getPutCount()).assertEqual(1);
      }

      // --- [2] Verify two consecutive puts on capacity 1 count one eviction ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(1, 1);
        expect(cache.getRemovalCount()).assertEqual(0);
        cache.put(2, 2);
        let removals: long = cache.getRemovalCount();
        expect(removals).assertEqual(1);
      }

      // --- [3] Verify three puts on capacity 2 count one eviction ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 1);
        cache.put(2, 2);
        let before: long = cache.getRemovalCount();
        expect(before).assertEqual(0);
        cache.put(3, 3);
        expect(cache.getRemovalCount()).assertEqual(1);
      }

      // --- [4] Verify four puts on capacity 2 count two evictions ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 1);
        cache.put(2, 2);
        cache.put(3, 3);
        cache.put(4, 4);
        expect(cache.length).assertEqual(2);
        expect(cache.getRemovalCount()).assertEqual(2);
      }

      // --- [5] Verify sixty fifth put beyond default capacity 64 counts one eviction ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 0; i < 65; i++) {
          cache.put(i, i);
        }
        expect(cache.getRemovalCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_REMOVAL_COUNT_0030
     * @tc.name testLruCacheGetRemovalCount003
     * @tc.desc Merged batch (5 tests): [1] Verify few puts on capacity at int max do not count removal | [2] Verify get hit changes order and oldest unused key evicted counts one | [3] Verify put existing key ref...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetRemovalCount003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify few puts on capacity at int max do not count removal ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2147483647);
        cache.put(1, 1);
        cache.put(2, 2);
        expect(cache.getRemovalCount()).assertEqual(0);
        cache.put(3, 3);
        expect(cache.getRemovalCount()).assertEqual(0);
      }

      // --- [2] Verify get hit changes order and oldest unused key evicted counts one ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 1);
        cache.put(2, 2);
        cache.get(1);
        cache.put(3, 3);
        expect(cache.getRemovalCount()).assertEqual(1);
        expect(cache.get(1)).assertEqual(1);
      }

      // --- [3] Verify put existing key refreshes order then other key evicted counts one ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 1);
        cache.put(2, 2);
        cache.put(1, 100);
        cache.put(3, 3);
        expect(cache.getRemovalCount()).assertEqual(1);
        expect(cache.get(1)).assertEqual(100);
      }

      // --- [4] Verify touching entries 1 through 4 while leaving key 0 untouched then evicting key 0 counts one ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(5);
        for (let i: int = 0; i < 5; i++) {
          cache.put(i, i);
        }
        for (let i: int = 1; i < 5; i++) {
          cache.get(i);
        }
        cache.put(5, 5);
        expect(cache.getRemovalCount()).assertEqual(1);
        expect(cache.get(0)).assertEqual(undefined);
      }

      // --- [5] Verify shrink below existing key count counts one removed entry ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(5);
        let key: int = 0;
        while (cache.length < cache.getCapacity()) {
          cache.put(key, key);
          key++;
        }
        let shrinkTarget: int = cache.length - 1;
        cache.updateCapacity(shrinkTarget);
        expect(cache.getRemovalCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_REMOVAL_COUNT_0040
     * @tc.name testLruCacheGetRemovalCount004
     * @tc.desc Merged batch (5 tests): [1] Verify shrink removing two keys counts two removals | [2] Verify put after shrink accumulates total removal count | [3] Verify shrink to current key count does not count...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetRemovalCount004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify shrink removing two keys counts two removals ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(5);
        cache.put(1, 1);
        cache.put(2, 2);
        cache.put(3, 3);
        cache.updateCapacity(1);
        expect(cache.getRemovalCount()).assertEqual(2);
        expect(cache.length).assertEqual(1);
      }

      // --- [2] Verify put after shrink accumulates total removal count ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(5);
        cache.put(1, 1);
        cache.put(2, 2);
        cache.put(3, 3);
        cache.updateCapacity(1);
        cache.put(4, 4);
        expect(cache.getRemovalCount()).assertEqual(3);
      }

      // --- [3] Verify shrink to current key count does not count removal ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(5);
        cache.put(1, 1);
        cache.put(2, 2);
        let keptCount: int = cache.length;
        cache.updateCapacity(keptCount);
        expect(cache.getRemovalCount()).assertEqual(0);
        expect(cache.length).assertEqual(keptCount);
      }

      // --- [4] Verify expanding capacity does not count removal ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 1);
        cache.updateCapacity(100);
        expect(cache.getRemovalCount()).assertEqual(0);
      }

      // --- [5] Verify eviction after expanding then filling counts one ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.updateCapacity(2);
        cache.put(1, 1);
        cache.put(2, 2);
        cache.put(3, 3);
        expect(cache.getRemovalCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_REMOVAL_COUNT_0050
     * @tc.name testLruCacheGetRemovalCount005
     * @tc.desc Merged batch (5 tests): [1] Verify shrink to capacity 1 counts two removals and explicit remove after adds none (total stays 2) | [2] Verify explicit remove of an existing key does not count remova...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetRemovalCount005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify shrink to capacity 1 counts two removals and explicit remove after adds none (total stays 2) ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        cache.put(1, 1);
        cache.put(2, 2);
        cache.put(3, 3);
        cache.updateCapacity(1);
        cache.remove(3);
        expect(cache.getRemovalCount()).assertEqual(2);
      }

      // --- [2] Verify explicit remove of an existing key does not count removal ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 1);
        cache.remove(1);
        expect(cache.getRemovalCount()).assertEqual(0);
      }

      // --- [3] Verify removing a nonexistent key does not count removal ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.remove(99);
        expect(cache.getRemovalCount()).assertEqual(0);
      }

      // --- [4] Verify explicit removes of entries created by createDefault do not count removal ---
      {
        let cache: PlusOneDefaultLRU = new PlusOneDefaultLRU(4);
        cache.get(5);
        cache.get(6);
        cache.remove(5);
        cache.remove(6);
        expect(cache.getRemovalCount()).assertEqual(0);
      }

      // --- [5] Verify evicting a key that holds a live LRUCache value counts one removal while the evicted inner cache stays readable ---
      {
        let innerA: util.LRUCache<int, string> = new util.LRUCache<int, string>(2);
        let innerB: util.LRUCache<int, string> = new util.LRUCache<int, string>(2);
        innerA.put(1, 'one');
        innerB.put(2, 'two');
        let outer: util.LRUCache<int, util.LRUCache<int, string>> =
          new util.LRUCache<int, util.LRUCache<int, string>>(2);
        outer.put(1, innerA);
        outer.put(2, innerB);
        outer.put(3, innerA);
        expect(outer.getRemovalCount()).assertEqual(1);
        expect(outer.length).assertEqual(2);
        expect(innerA.get(1)).assertEqual('one');
        expect(innerB.get(2)).assertEqual('two');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_REMOVAL_COUNT_0060
     * @tc.name testLruCacheGetRemovalCount006
     * @tc.desc Merged batch (5 tests): [1] Verify a rejected updateCapacity zero leaves removal count at zero and a later shrink to one counts two removals | [2] Verify explicit remove after eviction does not add...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetRemovalCount006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a rejected updateCapacity zero leaves removal count at zero and a later shrink to one counts two removals ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        cache.put(1, 1);
        cache.put(2, 2);
        cache.put(3, 3);
        try {
          cache.updateCapacity(0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
        expect(cache.getRemovalCount()).assertEqual(0);
        cache.updateCapacity(1);
        expect(cache.getRemovalCount()).assertEqual(2);
      }

      // --- [2] Verify explicit remove after eviction does not add removal count (total stays 1) ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(1, 1);
        cache.put(2, 2);
        cache.remove(2);
        expect(cache.getRemovalCount()).assertEqual(1);
      }

      // --- [3] Verify mixed explicit remove and eviction count only evictions (total stays 1) ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 1);
        cache.put(2, 2);
        cache.remove(1);
        cache.put(3, 3);
        cache.put(4, 4);
        expect(cache.getRemovalCount()).assertEqual(1);
      }

      // --- [4] Verify repeated put same key interleaved with evictions accumulates total removal count 3 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(1, 1);
        cache.put(2, 2);
        let firstCount: long = cache.getRemovalCount();
        expect(firstCount).assertEqual(1);
        cache.put(1, 10);
        cache.put(3, 3);
        expect(cache.getRemovalCount()).assertEqual(3);
      }

      // --- [5] Verify explicit remove adds none and shrink to capacity 1 counts one removal (total stays 1) ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        cache.put(1, 1);
        cache.put(2, 2);
        cache.put(3, 3);
        cache.remove(1);
        cache.updateCapacity(1);
        expect(cache.getRemovalCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_REMOVAL_COUNT_0070
     * @tc.name testLruCacheGetRemovalCount007
     * @tc.desc Merged batch (5 tests): [1] Verify various-typed key eviction on capacity 1 counts one removal | [2] Verify explicit remove of an existing string key does not count removal | [3] Verify the empty s...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetRemovalCount007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify various-typed key eviction on capacity 1 counts one removal ---
      {
        // string key
        let stringCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(1);
        stringCache.put('a', 'x');
        stringCache.put('b', 'y');
        expect(stringCache.getRemovalCount()).assertEqual(1);

        // boolean key
        let booleanCache: util.LRUCache<boolean, boolean> = new util.LRUCache<boolean, boolean>(1);
        booleanCache.put(true, true);
        booleanCache.put(false, false);
        expect(booleanCache.getRemovalCount()).assertEqual(1);

        // long key
        let longCache: util.LRUCache<long, long> = new util.LRUCache<long, long>(1);
        longCache.put(Int.toLong(1), Int.toLong(1));
        longCache.put(Int.toLong(2), Int.toLong(2));
        expect(longCache.getRemovalCount()).assertEqual(1);

        // byte key
        let byteCache: util.LRUCache<byte, byte> = new util.LRUCache<byte, byte>(1);
        byteCache.put(1 as byte, 10 as byte);
        byteCache.put(2 as byte, 20 as byte);
        expect(byteCache.length).assertEqual(1);
        expect(byteCache.getRemovalCount()).assertEqual(1);

        // short key
        let shortCache: util.LRUCache<short, short> = new util.LRUCache<short, short>(1);
        shortCache.put(1 as short, 10 as short);
        let before: long = shortCache.getRemovalCount();
        shortCache.put(2 as short, 20 as short);
        expect(before).assertEqual(0);
        expect(shortCache.getRemovalCount()).assertEqual(1);

        // float key
        let floatCache: util.LRUCache<float, float> = new util.LRUCache<float, float>(1);
        floatCache.put(1.5 as float, 1.5 as float);
        floatCache.put(2.5 as float, 2.5 as float);
        let removals: long = floatCache.getRemovalCount();
        expect(removals).assertEqual(1);

        // bigint key
        let bigintCache: util.LRUCache<bigint, bigint> = new util.LRUCache<bigint, bigint>(1);
        bigintCache.put(1n, 1n);
        bigintCache.put(2n, 2n);
        expect(bigintCache.getRemovalCount()).assertEqual(1);

        // Date key
        let firstDate: Date = new Date(2020, 0, 1);
        let secondDate: Date = new Date(2021, 0, 1);
        let dateCache: util.LRUCache<Date, Date> = new util.LRUCache<Date, Date>(1);
        dateCache.put(firstDate, firstDate);
        dateCache.put(secondDate, secondDate);
        expect(dateCache.getRemovalCount()).assertEqual(1);

        // Map key
        let firstMap: Map<string, int> = new Map<string, int>();
        firstMap.set('a', 1);
        let secondMap: Map<string, int> = new Map<string, int>();
        secondMap.set('b', 2);
        let mapCache: util.LRUCache<Map<string, int>, Map<string, int>> =
          new util.LRUCache<Map<string, int>, Map<string, int>>(1);
        mapCache.put(firstMap, firstMap);
        mapCache.put(secondMap, secondMap);
        expect(mapCache.getRemovalCount()).assertEqual(1);

        // Set key
        let firstSet: Set<int> = new Set<int>();
        firstSet.add(1);
        let secondSet: Set<int> = new Set<int>();
        secondSet.add(2);
        let setCache: util.LRUCache<Set<int>, Set<int>> = new util.LRUCache<Set<int>, Set<int>>(1);
        setCache.put(firstSet, firstSet);
        setCache.put(secondSet, secondSet);
        expect(setCache.getRemovalCount()).assertEqual(1);
      }

      // --- [2] Verify explicit remove of an existing string key does not count removal ---
      {
        let cache: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        cache.put('a', 'x');
        cache.remove('a');
        expect(cache.getRemovalCount()).assertEqual(0);
      }

      // --- [3] Verify the empty string key is evicted on capacity 1 and counts one removal ---
      {
        let cache: util.LRUCache<string, string> = new util.LRUCache<string, string>(1);
        cache.put('', 'blank');
        let spared: string = 'b';
        cache.put(spared, 'y');
        expect(cache.getRemovalCount()).assertEqual(1);
        expect(cache.contains('')).assertFalse();
        expect(cache.contains(spared)).assertTrue();
      }

      // --- [4] Verify interface object reference key eviction on capacity 1 counts one removal ---
      {
        let firstNode: TagNode = { tag: 'a' };
        let secondNode: TagNode = { tag: 'b' };
        let cache: util.LRUCache<TagNode, TagNode> = new util.LRUCache<TagNode, TagNode>(1);
        cache.put(firstNode, firstNode);
        cache.put(secondNode, secondNode);
        expect(cache.getRemovalCount()).assertEqual(1);
      }

      // --- [5] Verify Array key eviction on capacity 1 counts one removal ---
      {
        let firstArray: int[] = [1, 2];
        let secondArray: int[] = [3, 4];
        let cache: util.LRUCache<int[], int[]> = new util.LRUCache<int[], int[]>(1);
        cache.put(firstArray, firstArray);
        cache.put(secondArray, secondArray);
        expect(cache.getRemovalCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_REMOVAL_COUNT_0080
     * @tc.name testLruCacheGetRemovalCount008
     * @tc.desc Merged batch (5 tests): [1] Verify equal-content distinct-reference keys are different and eviction counts one | [2] Verify clear does not count removal | [3] Verify removal count accumulates acros...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetRemovalCount008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify equal-content distinct-reference keys are different and eviction counts one ---
      {
        let firstKey: IdBox = { id: 1 };
        let secondKey: IdBox = { id: 1 };
        let cache: util.LRUCache<IdBox, IdBox> = new util.LRUCache<IdBox, IdBox>(1);
        cache.put(firstKey, firstKey);
        cache.put(secondKey, secondKey);
        expect(cache.getRemovalCount()).assertEqual(1);
      }

      // --- [2] Verify clear does not count removal ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 1);
        cache.clear();
        expect(cache.getRemovalCount()).assertEqual(0);
      }

      // --- [3] Verify removal count accumulates across clear lifecycle to two ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(1, 1);
        cache.put(2, 2);
        cache.clear();
        cache.put(3, 3);
        cache.put(4, 4);
        expect(cache.getRemovalCount()).assertEqual(2);
      }

      // --- [4] Verify continuous evictions on capacity 1 after 1000 puts accumulate 999 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        for (let i: int = 0; i < 1000; i++) {
          cache.put(i, i);
        }
        expect(cache.getRemovalCount()).assertEqual(999);
      }

      // --- [5] Verify multiple get misses do not increase removal count ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(1, 1);
        cache.put(2, 2);
        cache.get(5);
        cache.get(6);
        cache.get(7);
        expect(cache.getRemovalCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_REMOVAL_COUNT_0090
     * @tc.name testLruCacheGetRemovalCount009
     * @tc.desc Merged batch (5 tests): [1] Verify length stays at capacity while removal count increments | [2] Verify put after remove frees capacity without new eviction | [3] Verify removal counts of two indep...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetRemovalCount009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify length stays at capacity while removal count increments ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(1, 1);
        cache.put(2, 2);
        expect(cache.getRemovalCount()).assertEqual(1);
        expect(cache.length).assertEqual(1);
      }

      // --- [2] Verify put after remove frees capacity without new eviction ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(1, 1);
        cache.remove(1);
        cache.put(2, 2);
        expect(cache.getRemovalCount()).assertEqual(0);
      }

      // --- [3] Verify removal counts of two independent cache instances stay isolated ---
      {
        let a: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        let b: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        a.put(1, 1);
        a.put(2, 2);
        expect(a.getRemovalCount()).assertEqual(1);
        expect(b.getRemovalCount()).assertEqual(0);
      }

      // --- [4] Verify return value assigned to long variable on non-zero scenario equals 2 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 1);
        cache.put(2, 2);
        cache.put(3, 3);
        cache.put(4, 4);
        let r: long = cache.getRemovalCount();
        expect(r).assertEqual(2);
      }

      // --- [5] Verify return value participates in long addition yielding 3 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 1);
        cache.put(2, 2);
        cache.put(3, 3);
        cache.put(4, 4);
        let sum: long = cache.getRemovalCount() + 1;
        expect(sum).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_REMOVAL_COUNT_0100
     * @tc.name testLruCacheGetRemovalCount010
     * @tc.desc Merged batch (5 tests): [1] Verify return value participates in unary negation yielding minus one | [2] Verify toString of return value yields exact string three | [3] Verify return value evaluates...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetRemovalCount010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify return value participates in unary negation yielding minus one ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(1, 1);
        cache.put(2, 2);
        let neg: long = -cache.getRemovalCount();
        expect(neg).assertEqual(-1);
      }

      // --- [2] Verify toString of return value yields exact string three ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(1, 1);
        cache.put(2, 2);
        cache.put(3, 3);
        cache.put(4, 4);
        let s: string = cache.getRemovalCount().toString();
        expect(s).assertEqual('3');
      }

      // --- [3] Verify return value evaluates true in non-zero condition ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(1, 1);
        cache.put(2, 2);
        let positive: boolean = false;
        if (cache.getRemovalCount() > 0) {
          positive = true;
        }
        expect(positive).assertTrue();
      }

      // --- [4] Verify return value modulo one is integer after Number conversion ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 1);
        cache.put(2, 2);
        cache.put(3, 3);
        cache.put(4, 4);
        cache.put(5, 5);
        let d: double = Number(cache.getRemovalCount());
        expect(d % 1).assertEqual(0);
        expect(d).assertEqual(3);
      }

      // --- [5] Verify return value participates in multiplication yielding 10 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(1, 1);
        cache.put(2, 2);
        let mul: long = cache.getRemovalCount() * 10;
        expect(mul).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_REMOVAL_COUNT_0110
     * @tc.name testLruCacheGetRemovalCount011
     * @tc.desc Merged batch (5 tests): [1] Verify six puts on capacity 3 accumulate three removals and evict the oldest key 0 | [2] Verify conservation removal equals put count minus length on capacity 2 | [3] Ve...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetRemovalCount011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify six puts on capacity 3 accumulate three removals and evict the oldest key 0 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        for (let i: int = 0; i < 6; i++) {
          cache.put(i, i);
        }
        expect(cache.getRemovalCount()).assertEqual(3);
        expect(cache.contains(0)).assertFalse();
        expect(cache.length).assertEqual(3);
      }

      // --- [2] Verify conservation removal equals put count minus length on capacity 2 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        for (let i: int = 0; i < 5; i++) {
          cache.put(i, i);
        }
        let removal: long = cache.getRemovalCount();
        let putCount: long = cache.getPutCount();
        let len: int = cache.length;
        expect(removal).assertEqual(putCount - len);
        expect(removal).assertEqual(3);
      }

      // --- [3] Verify removal count equals put count minus length when only evictions occur ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 1);
        cache.put(2, 2);
        cache.put(3, 3);
        let removal: long = cache.getRemovalCount();
        let putCount: long = cache.getPutCount();
        let len: int = cache.length;
        expect(removal).assertEqual(1);
        expect(removal).assertEqual(putCount - len);
      }

      // --- [4] Verify delta of one eviction increments count by one ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(1, 1);
        let beforeCount: long = cache.getRemovalCount();
        cache.put(2, 2);
        let afterCount: long = cache.getRemovalCount();
        expect(afterCount - beforeCount).assertEqual(1);
      }

      // --- [5] Verify explicit remove does not change removal count (delta stays 0) ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 1);
        cache.put(2, 2);
        let beforeCount: long = cache.getRemovalCount();
        cache.remove(1);
        let afterCount: long = cache.getRemovalCount();
        expect(afterCount - beforeCount).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_REMOVAL_COUNT_0120
     * @tc.name testLruCacheGetRemovalCount012
     * @tc.desc Merged batch (5 tests): [1] Verify delta of single entry shrink increments count by one | [2] Verify three consecutive shrinks accumulate four removals | [3] Verify eviction then expand then shrink...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetRemovalCount012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify delta of single entry shrink increments count by one ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(5);
        cache.put(1, 1);
        cache.put(2, 2);
        let beforeCount: long = cache.getRemovalCount();
        cache.updateCapacity(1);
        let afterCount: long = cache.getRemovalCount();
        expect(afterCount - beforeCount).assertEqual(1);
      }

      // --- [2] Verify three consecutive shrinks accumulate four removals ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(5);
        cache.put(1, 1);
        cache.put(2, 2);
        cache.put(3, 3);
        cache.put(4, 4);
        cache.put(5, 5);
        cache.updateCapacity(3);
        cache.updateCapacity(2);
        cache.updateCapacity(1);
        expect(cache.getRemovalCount()).assertEqual(4);
      }

      // --- [3] Verify eviction then expand then shrink accumulates count 2 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(1, 1);
        cache.put(2, 2);
        cache.updateCapacity(3);
        cache.put(3, 3);
        cache.updateCapacity(1);
        expect(cache.getRemovalCount()).assertEqual(2);
      }

      // --- [4] Verify shrink expand then put does not recount shrunken keys ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        cache.put(1, 1);
        cache.put(2, 2);
        cache.put(3, 3);
        cache.updateCapacity(1);
        cache.updateCapacity(3);
        cache.put(4, 4);
        expect(cache.getRemovalCount()).assertEqual(2);
      }

      // --- [5] Verify get of removed key does not count again after remove ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 1);
        cache.put(2, 2);
        cache.remove(1);
        cache.get(1);
        expect(cache.getRemovalCount()).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_REMOVAL_COUNT_0130
     * @tc.name testLruCacheGetRemovalCount013
     * @tc.desc Merged batch (5 tests): [1] Verify get of evicted key does not count again | [2] Verify subclass overriding createDefault get miss does not count removal | [3] Verify subclass overriding createDefa...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetRemovalCount013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify get of evicted key does not count again ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(1, 1);
        cache.put(2, 2);
        cache.get(1);
        expect(cache.getRemovalCount()).assertEqual(1);
      }

      // --- [2] Verify subclass overriding createDefault get miss does not count removal ---
      {
        let cache: PlusOneDefaultLRU = new PlusOneDefaultLRU(1);
        cache.get(5);
        expect(cache.getRemovalCount()).assertEqual(0);
      }

      // --- [3] Verify subclass overriding createDefault keeps eviction count unaffected ---
      {
        let cache: PlusOneDefaultLRU = new PlusOneDefaultLRU(1);
        cache.put(1, 1);
        cache.put(2, 2);
        expect(cache.getRemovalCount()).assertEqual(1);
      }

      // --- [4] Verify step snapshots record counts zero one two across evictions ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(1, 1);
        let beforeCount: long = cache.getRemovalCount();
        cache.put(2, 2);
        let firstCount: long = cache.getRemovalCount();
        cache.put(3, 3);
        let secondCount: long = cache.getRemovalCount();
        expect(beforeCount).assertEqual(0);
        expect(firstCount).assertEqual(1);
        expect(secondCount).assertEqual(2);
      }

      // --- [5] Verify get explicit remove and within-capacity put do not change removal count (snapshots all zero) ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 1);
        cache.put(2, 2);
        let firstSnapshot: long = cache.getRemovalCount();
        cache.get(1);
        let secondSnapshot: long = cache.getRemovalCount();
        cache.remove(2);
        let thirdSnapshot: long = cache.getRemovalCount();
        cache.put(3, 3);
        let fourthSnapshot: long = cache.getRemovalCount();
        expect(firstSnapshot).assertEqual(0);
        expect(secondSnapshot).assertEqual(0);
        expect(thirdSnapshot).assertEqual(0);
        expect(fourthSnapshot).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_REMOVAL_COUNT_0140
     * @tc.name testLruCacheGetRemovalCount014
     * @tc.desc Merged batch (5 tests): [1] Verify overwrite explicit remove and refill evictions accumulate removal count 2 | [2] Verify repeated shrink and expand does not reset count and accumulates four | [3] ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetRemovalCount014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify overwrite explicit remove and refill evictions accumulate removal count 2 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 1);
        cache.put(2, 2);
        cache.put(1, 100);
        cache.remove(2);
        cache.put(3, 3);
        cache.put(4, 4);
        cache.put(5, 5);
        expect(cache.getRemovalCount()).assertEqual(2);
      }

      // --- [2] Verify repeated shrink and expand does not reset count and accumulates four ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        cache.put(1, 1);
        cache.put(2, 2);
        cache.put(3, 3);
        cache.updateCapacity(2);
        cache.updateCapacity(5);
        cache.put(4, 4);
        cache.put(5, 5);
        cache.updateCapacity(1);
        expect(cache.getRemovalCount()).assertEqual(4);
      }

      // --- [3] Verify removal and put counters differ on single put ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 1);
        expect(cache.getRemovalCount()).assertEqual(0);
        expect(cache.getPutCount()).assertEqual(1);
      }

      // --- [4] Verify removal and put count relation after eviction ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(1, 1);
        cache.put(2, 2);
        expect(cache.getRemovalCount()).assertEqual(1);
        expect(cache.getPutCount()).assertEqual(2);
      }

      // --- [5] Verify removal and put count relation after shrink ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(5);
        cache.put(1, 1);
        cache.put(2, 2);
        cache.put(3, 3);
        cache.updateCapacity(1);
        expect(cache.getRemovalCount()).assertEqual(2);
        expect(cache.getPutCount()).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_REMOVAL_COUNT_0150
     * @tc.name testLruCacheGetRemovalCount015
     * @tc.desc Merged batch (5 tests): [1] Verify explicit remove does not count removal and decreases length by one | [2] Verify explicit remove of surviving key after shrink adds no removal count (total stays 2...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetRemovalCount015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify explicit remove does not count removal and decreases length by one ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 1);
        cache.put(2, 2);
        let before: int = cache.length;
        cache.remove(1);
        expect(cache.getRemovalCount()).assertEqual(0);
        expect(cache.length).assertEqual(before - 1);
      }

      // --- [2] Verify explicit remove of surviving key after shrink adds no removal count (total stays 2) ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(5);
        cache.put(1, 1);
        cache.put(2, 2);
        cache.put(3, 3);
        cache.updateCapacity(1);
        let ks: Array<int> = cache.keys();
        let k: int = ks[0];
        cache.remove(k);
        expect(cache.getRemovalCount()).assertEqual(2);
      }

      // --- [3] Verify batch read-only queries on empty cache keep removal count 0 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.getCapacity();
        cache.keys();
        cache.values();
        cache.toString();
        expect(cache.getRemovalCount()).assertEqual(0);
      }

      // --- [4] Verify length equals capacity after one eviction ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 1);
        cache.put(2, 2);
        cache.put(3, 3);
        expect(cache.getRemovalCount()).assertEqual(1);
        expect(cache.length).assertEqual(2);
      }

      // --- [5] Verify length unchanged around getRemovalCount call ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 1);
        cache.put(2, 2);
        cache.put(3, 3);
        let before: int = cache.length;
        cache.getRemovalCount();
        expect(cache.length).assertEqual(before);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_REMOVAL_COUNT_0160
     * @tc.name testLruCacheGetRemovalCount016
     * @tc.desc Merged batch (5 tests): [1] Verify values length equals cache length after one eviction | [2] Verify keys length equals cache length after one eviction | [3] Verify empty cache length zero and remo...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetRemovalCount016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify values length equals cache length after one eviction ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 1);
        cache.put(2, 2);
        cache.put(3, 3);
        let vals: Array<int> = cache.values();
        expect(vals.length).assertEqual(cache.length);
        expect(cache.getRemovalCount()).assertEqual(1);
      }

      // --- [2] Verify keys length equals cache length after one eviction ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 1);
        cache.put(2, 2);
        cache.put(3, 3);
        let ks: Array<int> = cache.keys();
        expect(ks.length).assertEqual(cache.length);
        expect(cache.getRemovalCount()).assertEqual(1);
      }

      // --- [3] Verify empty cache length zero and removal count zero ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        expect(cache.length).assertEqual(0);
        expect(cache.getRemovalCount()).assertEqual(0);
      }

      // --- [4] Verify removal count plus length equals total puts on capacity 2 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 1);
        cache.put(2, 2);
        cache.put(3, 3);
        cache.put(4, 4);
        expect(cache.getRemovalCount() + cache.length).assertEqual(4);
      }

      // --- [5] Verify keys sequence unchanged around getRemovalCount call ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 1);
        cache.put(2, 2);
        cache.put(3, 3);
        let beforeKeys: Array<int> = cache.keys();
        cache.getRemovalCount();
        let afterKeys: Array<int> = cache.keys();
        expect(beforeKeys.length).assertEqual(afterKeys.length);
        expect(beforeKeys[0]).assertEqual(afterKeys[0]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_REMOVAL_COUNT_0170
     * @tc.name testLruCacheGetRemovalCount017
     * @tc.desc Merged batch (5 tests): [1] Verify values sequence unchanged around getRemovalCount call | [2] Verify capacity unchanged around getRemovalCount call | [3] Verify cache remains functional after read...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetRemovalCount017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify values sequence unchanged around getRemovalCount call ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 1);
        cache.put(2, 2);
        cache.put(3, 3);
        let beforeValues: Array<int> = cache.values();
        cache.getRemovalCount();
        let afterValues: Array<int> = cache.values();
        expect(beforeValues.length).assertEqual(afterValues.length);
        expect(beforeValues[0]).assertEqual(afterValues[0]);
      }

      // --- [2] Verify capacity unchanged around getRemovalCount call ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 1);
        cache.put(2, 2);
        let beforeCapacity: int = cache.getCapacity();
        cache.getRemovalCount();
        let afterCapacity: int = cache.getCapacity();
        expect(beforeCapacity).assertEqual(afterCapacity);
      }

      // --- [3] Verify cache remains functional after reading removal count ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(1, 1);
        cache.getRemovalCount();
        cache.put(2, 2);
        expect(cache.get(2)).assertEqual(2);
      }

      // --- [4] Verify LRU access order unchanged around getRemovalCount call ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 1);
        cache.put(2, 2);
        cache.get(1);
        let beforeKeys: Array<int> = cache.keys();
        cache.getRemovalCount();
        let afterKeys: Array<int> = cache.keys();
        expect(beforeKeys.length).assertEqual(afterKeys.length);
        expect(beforeKeys[0]).assertEqual(afterKeys[0]);
        expect(beforeKeys[1]).assertEqual(afterKeys[1]);
      }

      // --- [5] Verify toString unchanged around getRemovalCount call with count retained ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(1, 1);
        cache.put(2, 2);
        let beforeText: string = cache.toString();
        cache.getRemovalCount();
        let afterText: string = cache.toString();
        expect(beforeText).assertEqual(afterText);
        expect(cache.getRemovalCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_REMOVAL_COUNT_0180
     * @tc.name testLruCacheGetRemovalCount018
     * @tc.desc Merged batch (5 tests): [1] Verify multiple getRemovalCount calls on evicted cache return same value | [2] Verify snapshot value unaffected by later eviction while count advances | [3] Verify snaps...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetRemovalCount018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify multiple getRemovalCount calls on evicted cache return same value ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(1, 1);
        cache.put(2, 2);
        let a: long = cache.getRemovalCount();
        let b: long = cache.getRemovalCount();
        expect(a).assertEqual(b);
        expect(a).assertEqual(1);
      }

      // --- [2] Verify snapshot value unaffected by later eviction while count advances ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(1, 1);
        cache.put(2, 2);
        let r: long = cache.getRemovalCount();
        cache.put(3, 3);
        expect(r).assertEqual(1);
        expect(cache.getRemovalCount()).assertEqual(2);
      }

      // --- [3] Verify snapshot decoupled from cache after later explicit remove ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(1, 1);
        cache.put(2, 2);
        let r: long = cache.getRemovalCount();
        cache.remove(2);
        expect(r).assertEqual(1);
        expect(cache.getRemovalCount()).assertEqual(1);
      }

      // --- [4] Verify removal count equals put count minus one after single eviction ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        cache.put(1, 1);
        cache.put(2, 2);
        let r: long = cache.getRemovalCount();
        let putCount: long = cache.getPutCount();
        expect(r).assertEqual(putCount - 1);
      }

      // --- [5] Verify the NaN key evicted by a capacity 1 overflow counts one removal ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>(1);
        cache.put(Double.NaN, 1);
        cache.put(2.5, 2);
        expect(cache.getRemovalCount()).assertEqual(1);
        expect(cache.contains(Double.NaN)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_REMOVAL_COUNT_0190
     * @tc.name testLruCacheGetRemovalCount019
     * @tc.desc Merged batch (4 tests): [1] Verify negative zero and zero collapsing to one key count no removal until an overflow counts one | [2] Verify the NUL character key and maximum BMP 0xFFFF key on capaci...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetRemovalCount019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify negative zero and zero collapsing to one key count no removal until an overflow counts one ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>(1);
        cache.put(-0.0, 1);
        cache.put(0.0, 2);
        expect(cache.getRemovalCount()).assertEqual(0);
        cache.put(3.0, 3);
        expect(cache.getRemovalCount()).assertEqual(1);
      }

      // --- [2] Verify the NUL character key and maximum BMP 0xFFFF key on capacity 2 shrinking to 1 count one removal ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>(2);
        cache.put('\u0000', 0);
        cache.put('\uFFFF', 1);
        cache.updateCapacity(1);
        expect(cache.getRemovalCount()).assertEqual(1);
        expect(cache.contains('\uFFFF')).assertTrue();
      }

      // --- [3] Verify two enum member keys continuously evicted on capacity 1 accumulate removal count 2 ---
      {
        let cache: util.LRUCache<RemSlot, int> = new util.LRUCache<RemSlot, int>(1);
        cache.put(RemSlot.First, 1);
        cache.put(RemSlot.Second, 2);
        expect(cache.getRemovalCount()).assertEqual(1);
        cache.put(RemSlot.First, 3);
        expect(cache.getRemovalCount()).assertEqual(2);
        expect(cache.contains(RemSlot.Second)).assertFalse();
      }

      // --- [4] Verify the removal count drives a while loop that stops once four evictions accumulate ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        let key: int = 0;
        while (cache.getRemovalCount() < 4) {
          cache.put(key, key);
          key++;
        }
        expect(cache.getRemovalCount()).assertEqual(4);
        expect(cache.length).assertEqual(2);
        expect(cache.contains(0)).assertFalse();
      }
    });

  });
}
