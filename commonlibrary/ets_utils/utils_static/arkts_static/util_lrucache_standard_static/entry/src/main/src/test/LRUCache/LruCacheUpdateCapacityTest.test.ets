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
} from '@ohos/hypium-static/src/main/indexStatic';
import util from '@ohos.util';
import Utils from './../Util.test';

let removedTotal: int = 0;

class ProbeCache<K, V> extends util.LRUCache<K, V> {
  hook: (cache: util.LRUCache<K, V>, isEvict: boolean, key: K, value: V,
         newValue: V | undefined) => void =
    (cache: util.LRUCache<K, V>, isEvict: boolean, key: K, value: V, newValue: V | undefined) => {};
  make: (key: K) => V | undefined = (key: K) => undefined;

  constructor(hook?: (cache: util.LRUCache<K, V>, isEvict: boolean, key: K, value: V,
                              newValue: V | undefined) => void,
              make?: (key: K) => V | undefined, capacity?: int) {
    super(capacity);
    if (hook !== undefined) {
      this.hook = hook;
    }
    if (make !== undefined) {
      this.make = make;
    }
  }

  createDefault(key: K): V | undefined {
    return this.make(key);
  }

  afterRemoval(isEvict: boolean, key: K, value: V, newValue: V | undefined): void {
    this.hook(this, isEvict, key, value, newValue);
  }
}

class EvictCountCache extends util.LRUCache<int, int> {
  constructor(capacity?: int) {
    super(capacity);
  }
  evictCount: int = 0;
  lastIsEvict: boolean = false;
  afterRemoval(isEvict: boolean, key: int, value: int, newValue: int | undefined): void {
    if (isEvict) {
      this.evictCount = this.evictCount + 1;
      this.lastIsEvict = isEvict;
    }
  }
}

class ThrowRemovalUC3P extends util.LRUCache<int, int> {
  constructor(capacity?: int) {
    super(capacity);
  }
  afterRemoval(isEvict: boolean, key: int, value: int, newValue: int): void {
    throw new Error('removal boom');
  }
}

enum UcSlot {
  First = 0,
  Second = 1
}

export default function lruCacheUpdateCapacityTest(): void {
  describe('LruCacheUpdateCapacityTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_UPDATE_CAPACITY_0010
     * @tc.name testLruCacheUpdateCapacity001
     * @tc.desc Merged batch (5 tests): [1] Verify single-argument updateCapacity literal 7 reflects the new capacity via getCapacity | [2] Verify updateCapacity called with a variable capacity reflects the new ca...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheUpdateCapacity001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify single-argument updateCapacity literal 7 reflects the new capacity via getCapacity ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.updateCapacity(7);
        expect(lru.getCapacity()).assertEqual(7);
        expect(lru.length).assertEqual(0);
      }

      // --- [2] Verify updateCapacity called with a variable capacity reflects the new capacity via getCapacity ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let cap: int = 9;
        lru.updateCapacity(cap);
        expect(lru.getCapacity()).assertEqual(cap);
        expect(lru.length).assertEqual(0);
      }

      // --- [3] Verify updateCapacity called with a const capacity reflects the new capacity via getCapacity ---
      {
        const CAP: int = 11;
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.updateCapacity(CAP);
        expect(lru.getCapacity()).assertEqual(11);
      }

      // --- [4] Verify updateCapacity called with an arithmetic expression capacity reflects the new capacity via getCapacity ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.updateCapacity(4 + 8);
        expect(lru.getCapacity()).assertEqual(12);
      }

      // --- [5] Verify the cache is still writable and readable after the updateCapacity call returns ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.updateCapacity(7);
        lru.put(5, 55);
        expect(lru.get(5)).assertEqual(55);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_UPDATE_CAPACITY_0020
     * @tc.name testLruCacheUpdateCapacity002
     * @tc.desc Merged batch (5 tests): [1] Verify updateCapacity accepts a short typed capacity and reflects it via getCapacity | [2] Verify updateCapacity accepts a long value cast to int and reflects it via get...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheUpdateCapacity002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify updateCapacity accepts a short typed capacity and reflects it via getCapacity ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let cap: short = 12;
        lru.updateCapacity(cap);
        let now: int = lru.getCapacity();
        expect(now).assertEqual(12);
      }

      // --- [2] Verify updateCapacity accepts a long value cast to int and reflects it via getCapacity ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let l: long = 6;
        lru.updateCapacity(Long.toInt(l));
        expect(lru.getCapacity()).assertEqual(6);
      }

      // --- [3] Verify updateCapacity passed the int upper boundary 0x7FFFFFFF via a variable is not truncated ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let cap: int = 2147483647;
        lru.updateCapacity(cap);
        expect(lru.getCapacity()).assertEqual(2147483647);
        expect(lru.isEmpty()).assertTrue();
      }

      // --- [4] Verify updateCapacity to the hex upper boundary keeps the existing entry readable ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(64);
        lru.put(3, 300);
        lru.updateCapacity(2147483647);
        expect(lru.get(3)).assertEqual(300);
      }

      // --- [5] Verify updateCapacity with newCapacity 0 held in a variable throws an exception ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let z: int = 0;
        try {
          lru.updateCapacity(z);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_UPDATE_CAPACITY_0030
     * @tc.name testLruCacheUpdateCapacity003
     * @tc.desc Merged batch (5 tests): [1] Verify updateCapacity with a negative value held in a variable throws an exception | [2] Verify updateCapacity to the minimum positive capacity 1 is reflected by getCapa...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheUpdateCapacity003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify updateCapacity with a negative value held in a variable throws an exception ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let n: int = -5;
        try {
          lru.updateCapacity(n);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
      }

      // --- [2] Verify updateCapacity to the minimum positive capacity 1 is reflected by getCapacity ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.updateCapacity(1);
        let cap: int = lru.getCapacity();
        expect(cap).assertEqual(1);
      }

      // --- [3] Verify shrinking a three-entry cache to capacity 1 leaves length 1 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.put(2, 200);
        lru.put(3, 300);
        lru.updateCapacity(1);
        expect(lru.length).assertEqual(1);
      }

      // --- [4] Verify shrinking to capacity 1 after accessing the middle key keeps the most recently accessed key ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.put(2, 200);
        lru.put(3, 300);
        lru.get(2);
        lru.updateCapacity(1);
        expect(lru.get(2)).assertEqual(200);
      }

      // --- [5] Verify enlarging a capacity 64 cache to int maximum returns capacity 2147483647 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(64);
        lru.updateCapacity(2147483647);
        let cap: int = lru.getCapacity();
        expect(cap).assertEqual(2147483647);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_UPDATE_CAPACITY_0040
     * @tc.name testLruCacheUpdateCapacity004
     * @tc.desc Merged batch (5 tests): [1] Verify all three keys inserted after enlarging to a huge capacity are retained | [2] Verify an equal-capacity updateCapacity keeps the existing entries | [3] Verify inse...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheUpdateCapacity004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify all three keys inserted after enlarging to a huge capacity are retained ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.updateCapacity(100000);
        lru.put(1, 100);
        lru.put(2, 200);
        lru.put(3, 300);
        expect(lru.length).assertEqual(3);
        expect(lru.values().join(',')).assertEqual('100,200,300');
      }

      // --- [2] Verify an equal-capacity updateCapacity keeps the existing entries ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(7);
        lru.put(1, 100);
        lru.updateCapacity(7);
        expect(lru.length).assertEqual(1);
        expect(lru.get(1)).assertEqual(100);
      }

      // --- [3] Verify inserting exactly 12 keys after shrinking to capacity 12 triggers no eviction ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.updateCapacity(12);
        for (let i: int = 0; i < 12; i++) {
          lru.put(i, i * 5);
        }
        expect(lru.length).assertEqual(12);
        expect(lru.values()[0]).assertEqual(0);
        expect(lru.values()[11]).assertEqual(55);
      }

      // --- [4] Verify shrinking a six-entry cache to capacity 3 leaves length 3 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 0; i < 6; i++) {
          lru.put(i, i * 5);
        }
        lru.updateCapacity(3);
        expect(lru.length).assertEqual(3);
      }

      // --- [5] Verify shrinking a not-full cache does not delete its entries ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(3, 33);
        lru.put(4, 44);
        lru.updateCapacity(6);
        expect(lru.length).assertEqual(2);
        expect(lru.values()[0]).assertEqual(33);
        expect(lru.values()[1]).assertEqual(44);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_UPDATE_CAPACITY_0050
     * @tc.name testLruCacheUpdateCapacity005
     * @tc.desc Merged batch (5 tests): [1] Verify shrinking a three-entry cache to capacity 1 triggers afterRemoval twice | [2] Verify after shrinking to 1 keys contains only the newest key | [3] Verify after shr...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheUpdateCapacity005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify shrinking a three-entry cache to capacity 1 triggers afterRemoval twice ---
      {
        let lru: EvictCountCache = new EvictCountCache();
        lru.put(1, 100);
        lru.put(2, 200);
        lru.put(3, 300);
        lru.updateCapacity(1);
        expect(lru.evictCount).assertEqual(2);
      }

      // --- [2] Verify after shrinking to 1 keys contains only the newest key ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.put(2, 200);
        lru.put(3, 300);
        lru.updateCapacity(1);
        let ks: int[] = lru.keys();
        expect(ks[0]).assertEqual(3);
      }

      // --- [3] Verify after shrinking to 1 the values array length is 1 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.put(2, 200);
        lru.put(3, 300);
        lru.updateCapacity(1);
        let vs: int[] = lru.values();
        expect(vs.length).assertEqual(1);
      }

      // --- [4] Verify shrinking a six-entry cache to capacity 2 recycles 4 entries ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 0; i < 6; i++) {
          lru.put(i, i * 5);
        }
        lru.updateCapacity(2);
        expect(lru.getRemovalCount()).assertEqual(4);
      }

      // --- [5] Verify key 1 is gone after the cache is shrunk to capacity two and a fourth key is inserted ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.put(2, 200);
        lru.put(3, 300);
        lru.updateCapacity(2);
        lru.put(4, 444);
        expect(lru.contains(1)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_UPDATE_CAPACITY_0060
     * @tc.name testLruCacheUpdateCapacity006
     * @tc.desc Merged batch (5 tests): [1] Verify a key inserted after the shrink is accessible and the removals add up (1 + 1 = 2) | [2] Verify enlarging does not trigger the afterRemoval eviction callback | [3]...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheUpdateCapacity006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a key inserted after the shrink is accessible and the removals add up (1 + 1 = 2) ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.put(2, 200);
        lru.put(3, 300);
        lru.put(4, 400);
        lru.updateCapacity(3);
        lru.put(5, 555);
        expect(lru.get(5)).assertEqual(555);
        expect(lru.getRemovalCount()).assertEqual(2);
      }

      // --- [2] Verify enlarging does not trigger the afterRemoval eviction callback ---
      {
        let lru: EvictCountCache = new EvictCountCache();
        lru.put(1, 100);
        lru.put(2, 200);
        lru.updateCapacity(128);
        expect(lru.evictCount).assertEqual(0);
      }

      // --- [3] Verify an equal-capacity updateCapacity does not trigger the afterRemoval eviction callback ---
      {
        let lru: EvictCountCache = new EvictCountCache(7);
        lru.put(1, 100);
        lru.updateCapacity(7);
        expect(lru.evictCount).assertEqual(0);
      }

      // --- [4] Verify a retained key is still present (contains true) after shrinking three entries to 2 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.put(2, 200);
        lru.put(3, 300);
        lru.updateCapacity(2);
        expect(lru.contains(3)).assertTrue();
      }

      // --- [5] Verify key-value pairs written after updating to the hex upper boundary store without truncation ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.updateCapacity(2147483647);
        lru.put(9, 9);
        expect(lru.get(9)).assertEqual(9);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_UPDATE_CAPACITY_0070
     * @tc.name testLruCacheUpdateCapacity007
     * @tc.desc Merged batch (5 tests): [1] Verify after shrinking to 1 the oldest entry is absent (contains false) | [2] Verify inserting 300 keys into a capacity 256 cache recycles 44 entries | [3] Verify the ne...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheUpdateCapacity007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify after shrinking to 1 the oldest entry is absent (contains false) ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.put(2, 200);
        lru.updateCapacity(1);
        expect(lru.contains(1)).assertFalse();
      }

      // --- [2] Verify inserting 300 keys into a capacity 256 cache recycles 44 entries ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.updateCapacity(256);
        for (let i: int = 0; i < 300; i++) {
          lru.put(i, i * 100);
        }
        expect(lru.getRemovalCount()).assertEqual(44);
      }

      // --- [3] Verify the newest key stays accessible after inserting 300 keys into a capacity 256 cache ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.updateCapacity(256);
        for (let i: int = 0; i < 300; i++) {
          lru.put(i, i * 100);
        }
        expect(lru.get(299)).assertEqual(29900);
      }

      // --- [4] Verify inserting 200 keys after enlarging a 64-cache to 128 evicts the oldest key ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(64);
        lru.updateCapacity(128);
        for (let i: int = 0; i < 200; i++) {
          lru.put(i, i * 100);
        }
        expect(lru.contains(0)).assertFalse();
      }

      // --- [5] Verify inserting a new key after shrinking to 1 keeps length 1 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.updateCapacity(1);
        lru.put(2, 200);
        expect(lru.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_UPDATE_CAPACITY_0080
     * @tc.name testLruCacheUpdateCapacity008
     * @tc.desc Merged batch (5 tests): [1] Verify inserting a new key after shrinking to 1 evicts the old key and its get returns undefined | [2] Verify a new key inserted after shrinking to 1 remains accessible ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheUpdateCapacity008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify inserting a new key after shrinking to 1 evicts the old key and its get returns undefined ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.updateCapacity(1);
        lru.put(2, 200);
        expect(lru.get(1)).assertEqual(undefined);
      }

      // --- [2] Verify a new key inserted after shrinking to 1 remains accessible ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.updateCapacity(1);
        lru.put(2, 200);
        expect(lru.get(2)).assertEqual(200);
      }

      // --- [3] Verify an int maximum capacity update keeps the existing entry count unchanged ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.put(2, 200);
        lru.updateCapacity(2147483647);
        expect(lru.length).assertEqual(2);
        expect(lru.values()[0]).assertEqual(100);
        expect(lru.values()[1]).assertEqual(200);
      }

      // --- [4] Verify an int maximum capacity update keeps the keys in insertion order ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.put(2, 200);
        lru.updateCapacity(2147483647);
        let ks: int[] = lru.keys();
        expect(ks[0]).assertEqual(1);
      }

      // --- [5] Verify values keep their original order and content after an enlarging updateCapacity ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.put(2, 200);
        lru.updateCapacity(128);
        let vs: int[] = lru.values();
        expect(vs[1]).assertEqual(200);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_UPDATE_CAPACITY_0090
     * @tc.name testLruCacheUpdateCapacity009
     * @tc.desc Merged batch (5 tests): [1] Verify after shrinking three entries to 1 values contains only the retained value | [2] Verify the newest entry is the only survivor of a shrink to capacity 1 | [3] Veri...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheUpdateCapacity009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify after shrinking three entries to 1 values contains only the retained value ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.put(2, 200);
        lru.put(3, 300);
        lru.updateCapacity(1);
        let vs: int[] = lru.values();
        expect(vs[0]).assertEqual(300);
      }

      // --- [2] Verify the newest entry is the only survivor of a shrink to capacity 1 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.put(2, 200);
        lru.updateCapacity(1);
        expect(lru.length).assertEqual(1);
        expect(lru.get(2)).assertEqual(200);
      }

      // --- [3] Verify shrinking a three-entry cache to capacity 1 recycles 2 entries ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.put(2, 200);
        lru.put(3, 300);
        lru.updateCapacity(1);
        expect(lru.getRemovalCount()).assertEqual(2);
      }

      // --- [4] Verify after shrinking to 1 the keys array length is 1 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.put(2, 200);
        lru.updateCapacity(1);
        let ks: int[] = lru.keys();
        expect(ks.length).assertEqual(1);
      }

      // --- [5] Verify after accessing an old key, shrink leaves the recently accessed value at the last position ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.put(2, 200);
        lru.put(3, 300);
        lru.get(1);
        lru.updateCapacity(2);
        let vs: int[] = lru.values();
        expect(vs[1]).assertEqual(100);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_UPDATE_CAPACITY_0100
     * @tc.name testLruCacheUpdateCapacity010
     * @tc.desc Merged batch (5 tests): [1] Verify a normal updateCapacity keeps the removal count at 0 | [2] Verify shrinking a five-entry cache to capacity 2 triggers afterRemoval three times | [3] Verify a huge...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheUpdateCapacity010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a normal updateCapacity keeps the removal count at 0 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.updateCapacity(9);
        expect(lru.getRemovalCount()).assertEqual(0);
      }

      // --- [2] Verify shrinking a five-entry cache to capacity 2 triggers afterRemoval three times ---
      {
        let lru: EvictCountCache = new EvictCountCache();
        for (let i: int = 0; i < 5; i++) {
          lru.put(i, i * 100);
        }
        lru.updateCapacity(2);
        expect(lru.evictCount).assertEqual(3);
      }

      // --- [3] Verify a huge capacity enlargement keeps the keys in insertion order ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.updateCapacity(100000);
        lru.put(10, 1);
        lru.put(20, 2);
        let ks: int[] = lru.keys();
        expect(ks[1]).assertEqual(20);
      }

      // --- [4] Verify overwriting the retained key after shrinking to 1 triggers no eviction ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.updateCapacity(1);
        lru.put(1, 999);
        expect(lru.get(1)).assertEqual(999);
      }

      // --- [5] Verify a huge capacity update on an empty cache leaves isEmpty true ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.updateCapacity(100000);
        expect(lru.isEmpty()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_UPDATE_CAPACITY_0110
     * @tc.name testLruCacheUpdateCapacity011
     * @tc.desc Merged batch (5 tests): [1] Verify inserting 13 keys after shrinking to capacity 12 evicts the oldest and keeps length 12 | [2] Verify several consecutive updateCapacity calls reflect the last capa...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheUpdateCapacity011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify inserting 13 keys after shrinking to capacity 12 evicts the oldest and keeps length 12 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.updateCapacity(12);
        for (let i: int = 0; i < 13; i++) {
          lru.put(i, i * 5);
        }
        expect(lru.length).assertEqual(12);
      }

      // --- [2] Verify several consecutive updateCapacity calls reflect the last capacity ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.updateCapacity(100);
        lru.updateCapacity(200);
        expect(lru.getCapacity()).assertEqual(200);
      }

      // --- [3] Verify enlarging a default cache to the upper boundary returns capacity 2147483647 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        expect(lru.isEmpty()).assertTrue();
        lru.updateCapacity(2147483647);
        expect(lru.getCapacity()).assertEqual(2147483647);
      }

      // --- [4] Verify shrinking a constructed huge capacity cache to 64 returns capacity 64 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(2147483647);
        lru.updateCapacity(64);
        expect(lru.getCapacity()).assertEqual(64);
        expect(lru.length).assertEqual(0);
      }

      // --- [5] Verify keys returns an array whose static element type is int and can be iterated ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.updateCapacity(64);
        let ks: int[] = lru.keys();
        expect(ks.length).assertEqual(0);
        expect(ks.join(',')).assertEqual('');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_UPDATE_CAPACITY_0120
     * @tc.name testLruCacheUpdateCapacity012
     * @tc.desc Merged batch (5 tests): [1] Verify an existing key get returns the original value after enlarging | [2] Verify an existing key is still present (contains true) after enlarging | [3] Verify a retain...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheUpdateCapacity012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an existing key get returns the original value after enlarging ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.updateCapacity(128);
        expect(lru.get(1)).assertEqual(100);
      }

      // --- [2] Verify an existing key is still present (contains true) after enlarging ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.updateCapacity(128);
        expect(lru.contains(1)).assertTrue();
      }

      // --- [3] Verify a retained key get returns the original value after shrinking ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 1; i <= 5; i++) {
          lru.put(i, i * 10);
        }
        lru.updateCapacity(3);
        expect(lru.get(3)).assertEqual(30);
      }

      // --- [4] Verify the oldest key get returns undefined after shrinking ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 1; i <= 5; i++) {
          lru.put(i, i * 10);
        }
        lru.updateCapacity(3);
        expect(lru.get(1)).assertEqual(undefined);
      }

      // --- [5] Verify a removed key is absent (contains false) after shrinking ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 1; i <= 5; i++) {
          lru.put(i, i * 10);
        }
        lru.updateCapacity(3);
        expect(lru.contains(1)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_UPDATE_CAPACITY_0130
     * @tc.name testLruCacheUpdateCapacity013
     * @tc.desc Merged batch (5 tests): [1] Verify a retained key is still present (contains true) after shrinking | [2] Verify the values array length equals the new capacity after shrinking | [3] Verify values c...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheUpdateCapacity013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a retained key is still present (contains true) after shrinking ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 1; i <= 5; i++) {
          lru.put(i, i * 10);
        }
        lru.updateCapacity(3);
        expect(lru.contains(5)).assertTrue();
      }

      // --- [2] Verify the values array length equals the new capacity after shrinking ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 1; i <= 5; i++) {
          lru.put(i, i * 10);
        }
        lru.updateCapacity(3);
        let vs: int[] = lru.values();
        expect(vs.length).assertEqual(3);
      }

      // --- [3] Verify values contain only the retained values after shrinking ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 1; i <= 5; i++) {
          lru.put(i, i * 10);
        }
        lru.updateCapacity(3);
        let vs: int[] = lru.values();
        expect(vs[0]).assertEqual(30);
      }

      // --- [4] Verify the keys array contains only the retained keys after shrinking ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 1; i <= 5; i++) {
          lru.put(i, i * 10);
        }
        lru.updateCapacity(3);
        let ks: int[] = lru.keys();
        expect(ks[0]).assertEqual(3);
      }

      // --- [5] Verify shrink after accessing an old key retains keys by most recent access ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.put(2, 200);
        lru.put(3, 300);
        lru.get(1);
        lru.updateCapacity(2);
        expect(lru.contains(2)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_UPDATE_CAPACITY_0140
     * @tc.name testLruCacheUpdateCapacity014
     * @tc.desc Merged batch (5 tests): [1] Verify enlarging an empty cache keeps length 0 | [2] Verify enlarging does not grow length together with capacity | [3] Verify getPutCount stays unreset after updateCapa...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheUpdateCapacity014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify enlarging an empty cache keeps length 0 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.updateCapacity(128);
        expect(lru.length).assertEqual(0);
      }

      // --- [2] Verify enlarging does not grow length together with capacity ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 0; i < 7; i++) {
          lru.put(i, i * 10);
        }
        lru.updateCapacity(100);
        expect(lru.length).assertEqual(7);
      }

      // --- [3] Verify getPutCount stays unreset after updateCapacity ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.updateCapacity(128);
        expect(lru.getPutCount()).assertEqual(1);
      }

      // --- [4] Verify getMatchCount stays unreset after updateCapacity ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.get(1);
        lru.updateCapacity(128);
        expect(lru.getMatchCount()).assertEqual(1);
      }

      // --- [5] Verify getMissCount stays unreset after updateCapacity ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.get(999);
        lru.updateCapacity(128);
        expect(lru.getMissCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_UPDATE_CAPACITY_0150
     * @tc.name testLruCacheUpdateCapacity015
     * @tc.desc Merged batch (5 tests): [1] Verify getCreateCount stays unreset after updateCapacity | [2] Verify the maxSize field of toString reflects the new capacity after updateCapacity | [3] Verify the hits ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheUpdateCapacity015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify getCreateCount stays unreset after updateCapacity ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.get(999);
        lru.updateCapacity(128);
        expect(lru.getCreateCount()).assertEqual(0);
      }

      // --- [2] Verify the maxSize field of toString reflects the new capacity after updateCapacity ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.updateCapacity(48);
        expect(lru.toString().includes('maxSize = 48')).assertTrue();
      }

      // --- [3] Verify the hits counter of toString stays unchanged after updateCapacity ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.get(1);
        lru.updateCapacity(64);
        expect(lru.toString().includes('hits = 1')).assertTrue();
      }

      // --- [4] Verify the misses counter of toString stays unchanged after updateCapacity ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.get(5);
        lru.updateCapacity(64);
        expect(lru.toString().includes('misses = 1')).assertTrue();
      }

      // --- [5] Verify overwriting an existing key after updateCapacity returns the original value ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.updateCapacity(64);
        expect(lru.put(1, 200)).assertEqual(100);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_UPDATE_CAPACITY_0160
     * @tc.name testLruCacheUpdateCapacity016
     * @tc.desc Merged batch (5 tests): [1] Verify putting a new key after updateCapacity returns undefined | [2] Verify a non-empty cache reports isEmpty false after updateCapacity | [3] Verify getRemovalCount re...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheUpdateCapacity016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify putting a new key after updateCapacity returns undefined ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.updateCapacity(64);
        expect(lru.put(2, 200)).assertEqual(undefined);
      }

      // --- [2] Verify a non-empty cache reports isEmpty false after updateCapacity ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.updateCapacity(128);
        expect(lru.isEmpty()).assertFalse();
      }

      // --- [3] Verify getRemovalCount reflects the number of deleted entries after shrinking ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 1; i <= 5; i++) {
          lru.put(i, i * 10);
        }
        lru.updateCapacity(3);
        expect(lru.getRemovalCount()).assertEqual(2);
      }

      // --- [4] Verify getRemovalCount stays 0 after enlarging ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.put(2, 200);
        lru.updateCapacity(128);
        expect(lru.getRemovalCount()).assertEqual(0);
      }

      // --- [5] Verify remove still takes effect on an existing key after updateCapacity ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.updateCapacity(64);
        lru.remove(1);
        expect(lru.contains(1)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_UPDATE_CAPACITY_0170
     * @tc.name testLruCacheUpdateCapacity017
     * @tc.desc Merged batch (5 tests): [1] Verify clear still empties the cache after updateCapacity | [2] Verify values can be traversed and returns an empty array after updateCapacity on an empty cache | [3] Ve...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheUpdateCapacity017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify clear still empties the cache after updateCapacity ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.updateCapacity(64);
        lru.clear();
        expect(lru.length).assertEqual(0);
        expect(lru.isEmpty()).assertTrue();
      }

      // --- [2] Verify values can be traversed and returns an empty array after updateCapacity on an empty cache ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.updateCapacity(64);
        let vs: int[] = lru.values();
        expect(vs.length).assertEqual(0);
        let total: int = 0;
        for (let v of vs) {
          total = total + v;
        }
        expect(total).assertEqual(0);
      }

      // --- [3] Verify contains returns false for a missing key after updateCapacity ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.updateCapacity(64);
        expect(lru.contains(1)).assertFalse();
      }

      // --- [4] Verify updateCapacity to 0 throws an exception and keys still return the original entries ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.put(2, 200);
        try {
          lru.updateCapacity(0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
        let ks: int[] = lru.keys();
        expect(ks.length).assertEqual(2);
        expect(ks[0]).assertEqual(1);
        expect(ks[1]).assertEqual(2);
      }

      // --- [5] Verify updateCapacity to 0 throws an exception and values still return the original entries ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.put(2, 200);
        try {
          lru.updateCapacity(0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
        let vs: int[] = lru.values();
        expect(vs.length).assertEqual(2);
        expect(vs[0]).assertEqual(100);
        expect(vs[1]).assertEqual(200);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_UPDATE_CAPACITY_0180
     * @tc.name testLruCacheUpdateCapacity018
     * @tc.desc Merged batch (5 tests): [1] Verify toString reflects the new maxSize 16 after updateCapacity(16) | [2] Verify the cache can still put a new key after updateCapacity 0 throws (recoverable) | [3] Ver...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheUpdateCapacity018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify toString reflects the new maxSize 16 after updateCapacity(16) ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.updateCapacity(16);
        expect(pro.toString()).assertEqual('LRUCache[ maxSize = 16, hits = 0, misses = 0, hitRate = 0% ]');
      }

      // --- [2] Verify the cache can still put a new key after updateCapacity 0 throws (recoverable) ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 10);
        try {
          pro.updateCapacity(0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
        pro.put(2, 20);
        expect(pro.length).assertEqual(2);
      }

      // --- [3] Verify retrying the legal capacity 10 succeeds after updateCapacity -1 throws ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        try {
          pro.updateCapacity(-1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
        pro.updateCapacity(10);
        expect(pro.getCapacity()).assertEqual(10);
      }

      // --- [4] Verify updateCapacity -1 throws an exception and keys returns an empty array ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        try {
          pro.updateCapacity(-1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
        let ks: int[] = pro.keys();
        expect(ks.length).assertEqual(0);
      }

      // --- [5] Verify the legal updateCapacity 1 on an empty cache keeps length 0 ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.updateCapacity(1);
        expect(pro.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_UPDATE_CAPACITY_0190
     * @tc.name testLruCacheUpdateCapacity019
     * @tc.desc Merged batch (5 tests): [1] Verify shrinking a three-capacity cache holding one entry to 1 evicts nothing and reports capacity 1 | [2] Verify enlarging a single-entry cache to 2 keeps length 1 | [3...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheUpdateCapacity019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify shrinking a three-capacity cache holding one entry to 1 evicts nothing and reports capacity 1 ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        pro.put(1, 10);
        pro.updateCapacity(1);
        expect(pro.getCapacity()).assertEqual(1);
        expect(pro.length).assertEqual(1);
        expect(pro.getRemovalCount()).assertEqual(0);
      }

      // --- [2] Verify enlarging a single-entry cache to 2 keeps length 1 ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        pro.put(1, 10);
        pro.updateCapacity(2);
        let cap: int = pro.getCapacity();
        expect(cap).assertEqual(2);
        expect(pro.length).assertEqual(1);
      }

      // --- [3] Verify updateCapacity -5 on a single-entry cache throws an exception and length stays 1 ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        pro.put(1, 10);
        try {
          pro.updateCapacity(-5);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
        expect(pro.length).assertEqual(1);
      }

      // --- [4] Verify shrinking an all-same-value five-key cache to 2 leaves length 2 ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>(5);
        for (let i: int = 1; i <= 5; i++) {
          pro.put(i, 99);
        }
        pro.updateCapacity(2);
        expect(pro.length).assertEqual(2);
      }

      // --- [5] Verify shrinking an all-same-value five-key cache to 2 recycles 3 entries ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>(5);
        for (let i: int = 1; i <= 5; i++) {
          pro.put(i, 99);
        }
        pro.updateCapacity(2);
        expect(pro.getRemovalCount()).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_UPDATE_CAPACITY_0200
     * @tc.name testLruCacheUpdateCapacity020
     * @tc.desc Merged batch (5 tests): [1] Verify the equal-capacity updateCapacity 5 on an all-same-value cache deletes nothing and keeps length 5 | [2] Verify the oldest key is deleted when an all-same-value ca...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheUpdateCapacity020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the equal-capacity updateCapacity 5 on an all-same-value cache deletes nothing and keeps length 5 ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>(5);
        for (let i: int = 1; i <= 5; i++) {
          pro.put(i, 99);
        }
        pro.updateCapacity(5);
        expect(pro.length).assertEqual(5);
      }

      // --- [2] Verify the oldest key is deleted when an all-same-value cache is shrunk ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>(5);
        for (let i: int = 1; i <= 5; i++) {
          pro.put(i, 99);
        }
        pro.updateCapacity(2);
        expect(pro.contains(1)).assertFalse();
      }

      // --- [3] Verify the retained values stay 99 after shrinking an all-same-value cache ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>(5);
        for (let i: int = 1; i <= 5; i++) {
          pro.put(i, 99);
        }
        pro.updateCapacity(2);
        expect(pro.get(5)).assertEqual(99);
      }

      // --- [4] Verify updateCapacity shrink propagates the exception thrown by afterRemoval ---
      {
        let c: ThrowRemovalUC3P = new ThrowRemovalUC3P(5);
        c.put(1, 10);
        c.put(2, 20);
        c.put(3, 30);
        try {
          c.updateCapacity(2);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }
      }

      // --- [5] Verify an equal-capacity updateCapacity does not invoke a throwing afterRemoval and raises no error ---
      {
        let c: ThrowRemovalUC3P = new ThrowRemovalUC3P(5);
        c.put(1, 10);
        c.put(2, 20);
        c.updateCapacity(5);
        expect(c.length).assertEqual(2);
        expect(c.values()[0]).assertEqual(10);
        expect(c.values()[1]).assertEqual(20);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_UPDATE_CAPACITY_0210
     * @tc.name testLruCacheUpdateCapacity021
     * @tc.desc Merged batch (5 tests): [1] Verify an afterRemoval callback returning undefined does not interrupt shrink completion | [2] Verify the afterRemoval call count equals the deleted entry count on shrin...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheUpdateCapacity021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an afterRemoval callback returning undefined does not interrupt shrink completion ---
      {
        let c: ProbeCache<int, int> = new ProbeCache<int, int>(
          (self: util.LRUCache<int, int>, isEvict: boolean, key: int, value: int, newValue: int | undefined) => {
            return;
          },
          undefined,
          4);
        c.put(1, 10);
        c.put(2, 20);
        c.put(3, 30);
        c.updateCapacity(2);
        expect(c.length).assertEqual(2);
        expect(c.values()[0]).assertEqual(20);
        expect(c.values()[1]).assertEqual(30);
      }

      // --- [2] Verify the afterRemoval call count equals the deleted entry count on shrink (5 to 2 calls 3 times) ---
      {
        let callsRec: int = 0;
        let c: ProbeCache<int, int> = new ProbeCache<int, int>(
          (self: util.LRUCache<int, int>, isEvict: boolean, key: int, value: int, newValue: int | undefined) => {
            callsRec = callsRec + 1;
          },
          undefined,
          5);
        for (let i: int = 1; i <= 5; i++) {
          c.put(i, i * 10);
        }
        c.updateCapacity(2);
        expect(callsRec).assertEqual(3);
      }

      // --- [3] Verify the isEvict parameter is true when shrink triggers afterRemoval ---
      {
        let evict: boolean = false;
        let c: ProbeCache<int, int> = new ProbeCache<int, int>(
          (self: util.LRUCache<int, int>, isEvict: boolean, key: int, value: int, newValue: int | undefined) => {
            evict = isEvict;
          },
          undefined,
          4);
        c.put(1, 10);
        c.put(2, 20);
        c.updateCapacity(1);
        expect(evict).assertTrue();
      }

      // --- [4] Verify the key parameter equals the deleted oldest key when shrink triggers afterRemoval ---
      {
        let firstKey: int = -1;
        let c: ProbeCache<int, int> = new ProbeCache<int, int>(
          (self: util.LRUCache<int, int>, isEvict: boolean, key: int, value: int, newValue: int | undefined) => {
            if (firstKey === -1) {
              firstKey = key;
            }
          },
          undefined,
          4);
        c.put(1, 10);
        c.put(2, 20);
        c.put(3, 30);
        c.updateCapacity(2);
        expect(firstKey).assertEqual(1);
      }

      // --- [5] Verify the value parameter equals the deleted oldest value when shrink triggers afterRemoval ---
      {
        let firstValue: int = -1;
        let c: ProbeCache<int, int> = new ProbeCache<int, int>(
          (self: util.LRUCache<int, int>, isEvict: boolean, key: int, value: int, newValue: int | undefined) => {
            if (firstValue === -1) {
              firstValue = value;
            }
          },
          undefined,
          4);
        c.put(1, 10);
        c.put(2, 20);
        c.put(3, 30);
        c.updateCapacity(2);
        expect(firstValue).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_UPDATE_CAPACITY_0220
     * @tc.name testLruCacheUpdateCapacity022
     * @tc.desc Merged batch (5 tests): [1] Verify the newValue parameter is empty when shrink triggers afterRemoval | [2] Verify an afterRemoval callback mutating an outer counter takes effect on shrink | [3] Ver...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheUpdateCapacity022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the newValue parameter is empty when shrink triggers afterRemoval ---
      {
        let newValueEmpty: boolean = false;
        let c: ProbeCache<int, int> = new ProbeCache<int, int>(
          (self: util.LRUCache<int, int>, isEvict: boolean, key: int, value: int, newValue: int | undefined) => {
            let s: string = String(newValue);
            if (s === 'null' || s === 'undefined') {
              newValueEmpty = true;
            }
          },
          undefined,
          4);
        c.put(1, 10);
        c.put(2, 20);
        c.updateCapacity(1);
        expect(newValueEmpty).assertTrue();
      }

      // --- [2] Verify an afterRemoval callback mutating an outer counter takes effect on shrink ---
      {
        let c: ProbeCache<int, int> = new ProbeCache<int, int>(
          (self: util.LRUCache<int, int>, isEvict: boolean, key: int, value: int, newValue: int | undefined) => {
            removedTotal = removedTotal + 1;
          },
          undefined,
          4);
        c.put(1, 10);
        c.put(2, 20);
        c.put(3, 30);
        c.updateCapacity(1);
        expect(removedTotal).assertEqual(2);
      }

      // --- [3] Verify the cache remains usable for put and get after afterRemoval throws during shrink ---
      {
        let c: ThrowRemovalUC3P = new ThrowRemovalUC3P(5);
        c.put(1, 10);
        c.put(2, 20);
        c.put(3, 30);
        try {
          c.updateCapacity(1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }
        c.updateCapacity(8);
        c.put(9, 90);
        expect(c.get(9)).assertEqual(90);
      }

      // --- [4] Verify shrinking a 64-entry cache to 1 clamps length to 1 and recycles 63 entries ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 0; i < 64; i++) {
          pro.put(i, i * 10);
        }
        pro.updateCapacity(1);
        expect(pro.length).assertEqual(1);
        expect(pro.getRemovalCount()).assertEqual(63);
      }

      // --- [5] Verify a cache shrunk to 1 can grow to 2 and accept a new key-value pair ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>(4);
        pro.put(1, 10);
        pro.put(2, 20);
        pro.updateCapacity(1);
        pro.updateCapacity(2);
        pro.put(3, 30);
        expect(pro.get(3)).assertEqual(30);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_UPDATE_CAPACITY_0230
     * @tc.name testLruCacheUpdateCapacity023
     * @tc.desc Merged batch (5 tests): [1] Verify remove still works after shrink deletion and clears a retained entry | [2] Verify shrinking a 100-entry cache to capacity 4 clamps length to 4 | [3] Verify values...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheUpdateCapacity023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify remove still works after shrink deletion and clears a retained entry ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>(5);
        for (let i: int = 1; i <= 5; i++) {
          pro.put(i, i * 10);
        }
        pro.updateCapacity(2);
        expect(pro.contains(5)).assertTrue();
        pro.remove(5);
        expect(pro.contains(5)).assertFalse();
        expect(pro.length).assertEqual(1);
      }

      // --- [2] Verify shrinking a 100-entry cache to capacity 4 clamps length to 4 ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>(100);
        for (let i: int = 0; i < 100; i++) {
          pro.put(i, i * 10);
        }
        pro.updateCapacity(4);
        expect(pro.length).assertEqual(4);
      }

      // --- [3] Verify values keep only the two most recent values after shrinking to 2 ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>(5);
        pro.put(1, 100);
        pro.put(2, 200);
        pro.put(3, 300);
        pro.put(4, 400);
        pro.updateCapacity(2);
        let vs: int[] = pro.values();
        expect(vs[0]).assertEqual(300);
        expect(vs[1]).assertEqual(400);
      }

      // --- [4] Verify shrinking a capacity 5 cache to 2 retains exactly the two newest keys in order ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>(5);
        pro.put(1, 100);
        pro.put(2, 200);
        pro.put(3, 300);
        pro.updateCapacity(2);
        expect(pro.getCapacity()).assertEqual(2);
        let ks: int[] = pro.keys();
        expect(ks.length).assertEqual(2);
        expect(ks[0]).assertEqual(2);
        expect(ks[1]).assertEqual(3);
      }

      // --- [5] Verify enlarging to int maximum 2147483647 keeps the existing length unchanged ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        pro.put(1, 10);
        pro.put(2, 20);
        pro.updateCapacity(2147483647);
        expect(pro.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_UPDATE_CAPACITY_0240
     * @tc.name testLruCacheUpdateCapacity024
     * @tc.desc Merged batch (5 tests): [1] Verify refilling the new capacity after shrink triggers further eviction with a cumulative removal count | [2] Verify updateCapacity accepts a capacity produced by 32-bi...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheUpdateCapacity024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify refilling the new capacity after shrink triggers further eviction with a cumulative removal count ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>(5);
        pro.put(1, 10);
        pro.put(2, 20);
        pro.put(3, 30);
        pro.updateCapacity(2);
        pro.put(4, 40);
        pro.put(5, 50);
        expect(pro.length).assertEqual(2);
        expect(pro.getRemovalCount()).assertEqual(3);
      }

      // --- [2] Verify updateCapacity accepts a capacity produced by 32-bit overflow (INT_MIN - 1) and lands on the same capacity as the literal INT_MAX argument ---
      {
        let mn: int = -2147483648;
        let wrappedDown: int = mn - 1;
        let literal: util.LRUCache<int, int> = new util.LRUCache<int, int>(5);
        let wrapped: util.LRUCache<int, int> = new util.LRUCache<int, int>(5);
        literal.updateCapacity(2147483647);
        wrapped.updateCapacity(wrappedDown);
        expect(wrapped.getCapacity()).assertEqual(literal.getCapacity());
        expect(wrapped.getCapacity()).assertEqual(2147483647);
      }

      // --- [3] Verify while loop driven by getCapacity shrinks capacity step by step from eight to one ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>(8);
        for (let i: int = 0; i < 8; i++) {
          pro.put(i, i * 10);
        }
        let steps: int = 0;
        while (pro.getCapacity() > 1) {
          pro.updateCapacity(pro.getCapacity() - 1);
          steps++;
        }
        expect(steps).assertEqual(7);
        expect(pro.getCapacity()).assertEqual(1);
        expect(pro.length).assertEqual(1);
        expect(pro.getRemovalCount()).assertEqual(7);
      }

      // --- [4] Verify shrinking evicts entries that createDefault inserted and counts each in getRemovalCount ---
      {
        let cache: ProbeCache<int, int> = new ProbeCache<int, int>(undefined, (key: int) => key * 10);
        cache.get(1);
        cache.get(2);
        cache.get(3);
        expect(cache.getCreateCount()).assertEqual(3);
        cache.updateCapacity(1);
        expect(cache.length).assertEqual(1);
        let ks: int[] = cache.keys();
        expect(ks[0]).assertEqual(3);
        expect(cache.getRemovalCount()).assertEqual(2);
      }

      // --- [5] Verify shrinking a cache keyed by NaN, positive Infinity and negative Infinity evicts the NaN entry first ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>(3);
        cache.put(Double.NaN, 1);
        cache.put(Double.POSITIVE_INFINITY, 2);
        cache.put(Double.NEGATIVE_INFINITY, 3);
        cache.updateCapacity(2);
        expect(cache.length).assertEqual(2);
        expect(cache.get(Double.POSITIVE_INFINITY)).assertEqual(2);
        expect(cache.get(Double.NEGATIVE_INFINITY)).assertEqual(3);
        expect(cache.getRemovalCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_UPDATE_CAPACITY_0250
     * @tc.name testLruCacheUpdateCapacity025
     * @tc.desc Merged batch (5 tests): [1] Verify the negative zero -0.0 and zero keys collapse to one entry that is evicted before the newest key when shrinking to 1 | [2] Verify shrinking to 1 keeps the maximum...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheUpdateCapacity025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the negative zero -0.0 and zero keys collapse to one entry that is evicted before the newest key when shrinking to 1 ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>(3);
        cache.put(-0.0, 1);
        cache.put(0.0, 2);
        cache.put(3.0, 3);
        expect(cache.length).assertEqual(2);
        cache.updateCapacity(1);
        expect(cache.length).assertEqual(1);
        expect(cache.get(3.0)).assertEqual(3);
      }

      // --- [2] Verify shrinking to 1 keeps the maximum BMP character 0xFFFF key and evicts the NUL character 0x0000 key ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>(2);
        cache.put('\u0000', 0);
        cache.put('\uFFFF', 65535);
        cache.updateCapacity(1);
        expect(cache.length).assertEqual(1);
        expect(cache.get('\uFFFF')).assertEqual(65535);
      }

      // --- [3] Verify shrinking to 1 evicts the oldest emoji surrogate-pair key and keeps the newer plain string key ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>(2);
        cache.put('😀', 7);
        cache.put('plain', 8);
        cache.updateCapacity(1);
        expect(cache.contains('😀')).assertFalse();
        expect(cache.get('plain')).assertEqual(8);
      }

      // --- [4] Verify a key promoted by contains survives a shrink while the unpromoted oldest key is evicted ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        expect(cache.contains(1)).assertTrue();
        cache.updateCapacity(2);
        let ks: int[] = cache.keys();
        expect(ks.length).assertEqual(2);
        expect(ks[0]).assertEqual(3);
        expect(ks[1]).assertEqual(1);
      }

      // --- [5] Verify growing a capacity 2 cache to 5 then shrinking back to 2 evicts the oldest pair and counts both removals ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.updateCapacity(5);
        cache.put(3, 30);
        cache.put(4, 40);
        expect(cache.length).assertEqual(4);
        cache.updateCapacity(2);
        expect(cache.length).assertEqual(2);
        let ks: int[] = cache.keys();
        expect(ks[0]).assertEqual(3);
        expect(ks[1]).assertEqual(4);
        expect(cache.getRemovalCount()).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_UPDATE_CAPACITY_0260
     * @tc.name testLruCacheUpdateCapacity026
     * @tc.desc Merged batch (5 tests): [1] Verify two NaN keys collapse to one entry so shrinking to 1 with same capacity evicts nothing | [2] Verify after a shrink evicts key 1 the re-put of key 1 returns undefi...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheUpdateCapacity026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify two NaN keys collapse to one entry so shrinking to 1 with same capacity evicts nothing ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>(2);
        cache.put(Double.NaN, 1);
        cache.put(Double.NaN, 2);
        cache.updateCapacity(1);
        expect(cache.length).assertEqual(1);
        expect(cache.getRemovalCount()).assertEqual(0);
      }

      // --- [2] Verify after a shrink evicts key 1 the re-put of key 1 returns undefined while re-put of retained key 3 returns its old value ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        cache.updateCapacity(2);
        expect(cache.put(1, 11)).assertEqual(undefined);
        expect(cache.put(3, 33)).assertEqual(30);
        expect(cache.length).assertEqual(2);
      }

      // --- [3] Verify shrinking keeps the retained Map value by reference and drops the evicted one ---
      {
        let first: Map<string, int> = new Map<string, int>();
        first.set('k', 1);
        let second: Map<string, int> = new Map<string, int>();
        second.set('k', 2);
        let cache: util.LRUCache<int, Map<string, int>> = new util.LRUCache<int, Map<string, int>>(2);
        cache.put(1, first);
        cache.put(2, second);
        cache.updateCapacity(1);
        expect(cache.get(2)).assertEqual(second);
        expect(cache.contains(1)).assertFalse();
      }

      // --- [4] Verify shrinking to 1 keeps the newest enum member key and evicts the oldest enum member key ---
      {
        let cache: util.LRUCache<UcSlot, int> = new util.LRUCache<UcSlot, int>(2);
        cache.put(UcSlot.First, 1);
        cache.put(UcSlot.Second, 2);
        cache.updateCapacity(1);
        expect(cache.length).assertEqual(1);
        expect(cache.get(UcSlot.Second)).assertEqual(2);
      }

      // --- [5] Verify a shrink to another cache getCapacity value clamps length and counts the recycled entries ---
      {
        let source: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        let target: util.LRUCache<int, int> = new util.LRUCache<int, int>(6);
        for (let i: int = 0; i < 6; i++) {
          target.put(i, i);
        }
        target.updateCapacity(source.getCapacity());
        expect(target.length).assertEqual(3);
        expect(target.getRemovalCount()).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_UPDATE_CAPACITY_0270
     * @tc.name testLruCacheUpdateCapacity027
     * @tc.desc Merged batch (1 tests): [1] Verify outer updateCapacity leaves the nested cache value capacity untouched
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheUpdateCapacity027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify outer updateCapacity leaves the nested cache value capacity untouched ---
      {
        let vault: util.LRUCache<int, int> = new util.LRUCache<int, int>(4);
        vault.put(1, 10);
        let wrapper: util.LRUCache<string, util.LRUCache<int, int>> =
          new util.LRUCache<string, util.LRUCache<int, int>>(3);
        wrapper.put('v', vault);
        wrapper.updateCapacity(9);
        expect(wrapper.getCapacity()).assertEqual(9);
        expect(wrapper.get('v')!.getCapacity()).assertEqual(4);
      }
    });

  });
}
