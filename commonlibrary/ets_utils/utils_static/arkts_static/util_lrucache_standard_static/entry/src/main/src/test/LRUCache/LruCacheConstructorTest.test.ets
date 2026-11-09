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

class EvictCountLRUCache<K, V> extends util.LRUCache<K, V> {
  constructor(capacity?: int) {
    super(capacity);
  }
  evictCount: int = 0;
  afterRemoval(isEvict: boolean, key: K, value: V, newValue: V): void {
    if (isEvict) {
      this.evictCount = this.evictCount + 1;
    }
  }
}

class ThrowingCreateCache extends util.LRUCache<int, int> {
  constructor(capacity?: int) {
    super(capacity);
  }
  createDefault(key: int): int {
    throw new Error('create boom');
  }
}

class ConstCreateCache extends util.LRUCache<int, int> {
  constructor(capacity?: int) {
    super(capacity);
  }
  createDefault(key: int): int {
    return 999;
  }
}

class ThrowingRemovalCache extends util.LRUCache<int, int> {
  constructor(capacity?: int) {
    super(capacity);
  }
  afterRemoval(isEvict: boolean, key: int, value: int, newValue: int): void {
    if (isEvict === true) {
      throw new Error('removal boom');
    }
  }
}

class EvictProbeCache extends util.LRUCache<int, int> {
  constructor(capacity?: int) {
    super(capacity);
  }
  evicted: int = 0;
  afterRemoval(isEvict: boolean, key: int, value: int, newValue: int): void {
    if (isEvict === true) {
      this.evicted = this.evicted + 1;
    }
  }
}

class CapacityHolder {
  size: int = 12;
}

enum CapSize {
  Small = 3,
  Large = 9
}

enum SlotGrade {
  Low = 0,
  High = 1
}

export default function lruCacheConstructorTest(): void {
  describe('LruCacheConstructorTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CONSTRUCTOR_0010
     * @tc.name testLruCacheConstructor001
     * @tc.desc Merged batch (5 tests): [1] Verify parameterless constructor yields default capacity 64 with zero length | [2] Verify parameterless constructor empty cache does not contain any key | [3] Verify par...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheConstructor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify parameterless constructor yields default capacity 64 with zero length ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        expect(lru.getCapacity()).assertEqual(64);
        expect(lru.length).assertEqual(0);
      }

      // --- [2] Verify parameterless constructor empty cache does not contain any key ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        expect(cache.contains(0)).assertFalse();
        expect(cache.contains(1)).assertFalse();
        expect(cache.contains(42)).assertFalse();
        expect(cache.contains(63)).assertFalse();
      }

      // --- [3] Verify parameterless constructor stores to full capacity without eviction; each key retrieves its correct value ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 0; i < 64; i++) {
          lru.put(i, i * 10);
        }

        expect(lru.length).assertEqual(64);
        expect(lru.get(0)).assertEqual(0);
        expect(lru.get(63)).assertEqual(630);
      }

      // --- [4] Verify inserting beyond capacity evicts the least-recently-used key and fires afterRemoval once, newest keys readable ---
      {
        let lru: EvictCountLRUCache<int, int> = new EvictCountLRUCache<int, int>();
        for (let i: int = 0; i < 65; i++) {
          lru.put(i, i * 10);
        }

        expect(lru.length).assertEqual(64);
        expect(lru.get(0)).assertEqual(undefined);
        expect(lru.get(64)).assertEqual(640);
        expect(lru.evictCount).assertEqual(1);
      }

      // --- [5] Verify overwriting an existing key in a full cache updates its stored value and read-back returns the updated value ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 0; i < 64; i++) {
          lru.put(i, i * 10);
        }
        expect(lru.get(0)).assertEqual(0);

        lru.put(0, 999);
        expect(lru.get(0)).assertEqual(999);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CONSTRUCTOR_0020
     * @tc.name testLruCacheConstructor002
     * @tc.desc Merged batch (5 tests): [1] Verify single-parameter constructor applies the given capacity and getCapacity returns it exactly | [2] Verify single-parameter cache starts empty, then put fills it to ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheConstructor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify single-parameter constructor applies the given capacity and getCapacity returns it exactly ---
      {
        let firstCache: util.LRUCache<int, int> = new util.LRUCache<int, int>(32);
        expect(firstCache.getCapacity()).assertEqual(32);

        let secondCache: util.LRUCache<int, int> = new util.LRUCache<int, int>(64);
        expect(secondCache.getCapacity()).assertEqual(64);
      }

      // --- [2] Verify single-parameter cache starts empty, then put fills it to capacity with length tracking entry count ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(32);
        expect(lru.length).assertEqual(0);

        for (let i: int = 0; i < 32; i++) {
          lru.put(i, i * 10);
        }
        expect(lru.length).assertEqual(32);
      }

      // --- [3] Verify inserting beyond the given capacity evicts the least-recently-used key and length stays capped at capacity ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(32);
        for (let i: int = 0; i < 33; i++) {
          lru.put(i, i * 10);
        }
        expect(lru.length).assertEqual(32);

        expect(lru.contains(0)).assertFalse();
        expect(lru.get(0)).assertEqual(undefined);
      }

      // --- [4] Verify an overflow insert beyond capacity fires afterRemoval exactly once for the evicted entry ---
      {
        let lru: EvictCountLRUCache<int, int> = new EvictCountLRUCache<int, int>(32);
        for (let i: int = 0; i < 33; i++) {
          lru.put(i, i * 10);
        }
        expect(lru.evictCount).assertEqual(1);
      }

      // --- [5] Verify capacity 0 constructor is rejected and throws BusinessError ---
      {
        let zeroCapacity: int = 0;
        try {
          new util.LRUCache<int, int>(zeroCapacity);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CONSTRUCTOR_0030
     * @tc.name testLruCacheConstructor003
     * @tc.desc Merged batch (5 tests): [1] Verify capacity 1 constructor reads back capacity 1 | [2] Verify inserting a second key into a capacity-1 cache evicts the oldest key and only the newest remains accessi...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheConstructor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify capacity 1 constructor reads back capacity 1 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        expect(lru.getCapacity()).assertEqual(1);

        lru.put(1, 100);
        expect(lru.length).assertEqual(1);
        expect(lru.get(1)).assertEqual(100);
      }

      // --- [2] Verify inserting a second key into a capacity-1 cache evicts the oldest key and only the newest remains accessible ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        lru.put(1, 100);
        lru.put(2, 200);
        expect(lru.length).assertEqual(1);
        expect(lru.contains(1)).assertFalse();
        expect(lru.get(1)).assertEqual(undefined);
        expect(lru.get(2)).assertEqual(200);
        expect(lru.remove(1)).assertEqual(undefined);
      }

      // --- [3] Verify capacity 1 triggers afterRemoval once after inserting two keys ---
      {
        let lru: EvictCountLRUCache<int, int> = new EvictCountLRUCache<int, int>(1);
        lru.put(1, 100);
        lru.put(2, 200);
        expect(lru.evictCount).assertEqual(1);
      }

      // --- [4] Verify capacity 1 overwriting same key updates value and keeps count at 1 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        lru.put(1, 100);
        lru.put(1, 999);
        expect(lru.length).assertEqual(1);
        expect(lru.get(1)).assertEqual(999);
      }

      // --- [5] Verify capacity 2 cache holds two keys after two inserts ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        lru.put(1, 100);
        lru.put(2, 200);
        expect(lru.length).assertEqual(2);
        expect(lru.keys().join(',')).assertEqual('1,2');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CONSTRUCTOR_0040
     * @tc.name testLruCacheConstructor004
     * @tc.desc Merged batch (5 tests): [1] Verify reading a key refreshes recency so a later overflow insert evicts the other key and retains the accessed key | [2] Verify overwriting a key refreshes recency so a...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheConstructor004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify reading a key refreshes recency so a later overflow insert evicts the other key and retains the accessed key ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        lru.put(1, 100);
        lru.put(2, 200);
        lru.get(1);
        lru.put(3, 300);
        expect(lru.contains(2)).assertFalse();
        expect(lru.contains(1)).assertTrue();
      }

      // --- [2] Verify overwriting a key refreshes recency so an overflow insert evicts the other key and keeps the new value ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        lru.put(1, 100);
        lru.put(2, 200);
        lru.put(1, 150);
        lru.put(3, 300);
        expect(lru.contains(2)).assertFalse();
        expect(lru.get(1)).assertEqual(150);
      }

      // --- [3] Verify capacity upper boundary 2147483647 reads back unchanged ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(2147483647);
        expect(lru.getCapacity()).assertEqual(2147483647);
      }

      // --- [4] Verify maximum capacity keys preserve insertion order ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(2147483647);
        lru.put(10, 1);
        lru.put(20, 2);
        lru.put(30, 3);
        let ks: int[] = lru.keys();
        expect(ks[0]).assertEqual(10);
      }

      // --- [5] Verify maximum capacity triggers no eviction callbacks ---
      {
        let lru: EvictCountLRUCache<int, int> = new EvictCountLRUCache<int, int>(2147483647);
        lru.put(1, 100);
        lru.put(2, 200);
        lru.put(3, 300);
        expect(lru.evictCount).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CONSTRUCTOR_0050
     * @tc.name testLruCacheConstructor005
     * @tc.desc Merged batch (5 tests): [1] Verify negative capacity rejects construction | [2] Verify two no-argument instances are different objects | [3] Verify capacity 128 cache holds all 65 entries without e...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheConstructor005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify negative capacity rejects construction ---
      {
        let existing: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        existing.put(1, 10);
        try {
          new util.LRUCache<int, int>(-1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
        expect(existing.length).assertEqual(1);
        expect(existing.contains(1)).assertTrue();
      }

      // --- [2] Verify two no-argument instances are different objects ---
      {
        let cacheA: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let cacheB: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        expect(cacheA).not().assertEqual(cacheB);
      }

      // --- [3] Verify capacity 128 cache holds all 65 entries without eviction ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(128);
        for (let i: int = 0; i < 65; i++) {
          cache.put(i, i * 10);
        }
        expect(cache.length).assertEqual(65);
        expect(cache.contains(0)).assertTrue();
        expect(cache.contains(64)).assertTrue();
      }

      // --- [4] Verify puts into one instance do not affect another instance length ---
      {
        let cacheA: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let cacheB: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cacheA.put(1, 10);
        expect(cacheB.length).assertEqual(0);
      }

      // --- [5] Verify updateCapacity on one instance does not change another default capacity ---
      {
        let cacheA: util.LRUCache<int, int> = new util.LRUCache<int, int>(100);
        let cacheB: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cacheA.updateCapacity(200);
        expect(cacheB.getCapacity()).assertEqual(64);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CONSTRUCTOR_0060
     * @tc.name testLruCacheConstructor006
     * @tc.desc Merged batch (5 tests): [1] Verify mutating the external capacity variable does not change adopted capacity | [2] Verify reference-typed (RegExp/Error/Map/Set/Record) cache reads back the same valu...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheConstructor006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify mutating the external capacity variable does not change adopted capacity ---
      {
        let cap: int = 100;
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(cap);
        cap = 200;
        expect(cache.getCapacity()).assertEqual(100);
      }

      // --- [2] Verify reference-typed (RegExp/Error/Map/Set/Record) cache reads back the same value reference by key ---
      {
        // RegExp
        let firstRegex: RegExp = new RegExp('abc');
        let secondRegex: RegExp = new RegExp('abc');
        let regexCache: util.LRUCache<RegExp, RegExp> = new util.LRUCache<RegExp, RegExp>();
        regexCache.put(firstRegex, secondRegex);
        expect(regexCache.get(firstRegex)).assertEqual(secondRegex);

        // Error
        let firstError: Error = new Error('msg1');
        let secondError: Error = new Error('msg2');
        let errorCache: util.LRUCache<Error, Error> = new util.LRUCache<Error, Error>();
        errorCache.put(firstError, secondError);
        expect(errorCache.get(firstError)).assertEqual(secondError);

        // Map
        let firstMap: Map<string, int> = new Map<string, int>();
        let secondMap: Map<string, int> = new Map<string, int>();
        let mapCache: util.LRUCache<Map<string, int>, Map<string, int>> =
          new util.LRUCache<Map<string, int>, Map<string, int>>();
        mapCache.put(firstMap, secondMap);
        expect(mapCache.get(firstMap)).assertEqual(secondMap);

        // Set
        let firstSet: Set<string> = new Set<string>();
        let secondSet: Set<string> = new Set<string>();
        let setCache: util.LRUCache<Set<string>, Set<string>> = new util.LRUCache<Set<string>, Set<string>>();
        setCache.put(firstSet, secondSet);
        expect(setCache.get(firstSet)).assertEqual(secondSet);

        // Record
        let firstRec: Record<string, int> = { 'a': 1 };
        let secondRec: Record<string, int> = { 'b': 2 };
        let recCache: util.LRUCache<Record<string, int>, Record<string, int>> =
          new util.LRUCache<Record<string, int>, Record<string, int>>();
        recCache.put(firstRec, secondRec);
        expect(recCache.get(firstRec)).assertEqual(secondRec);
      }

      // --- [3] Verify put flips isEmpty to false and clear restores it to true ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        expect(cache.isEmpty()).assertFalse();
        cache.clear();
        expect(cache.isEmpty()).assertTrue();
      }

      // --- [4] Verify capacity 1 overwrite of same key never invokes eviction callback ---
      {
        let lru: EvictProbeCache = new EvictProbeCache(1);
        lru.put(7, 10);
        lru.put(7, 20);
        lru.put(7, 30);
        expect(lru.evicted).assertEqual(0);
      }

      // --- [5] Verify repeatedly overwriting one key keeps a single entry storing the latest written value ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(64);
        for (let i: int = 0; i < 100; i++) {
          lru.put(9, i);
        }
        expect(lru.length).assertEqual(1);
        expect(lru.get(9)).assertEqual(99);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CONSTRUCTOR_0070
     * @tc.name testLruCacheConstructor007
     * @tc.desc Merged batch (5 tests): [1] Verify capacity 64 same key puts never invoke eviction callback | [2] Verify throwing createDefault throws again for repeated miss get | [3] Verify throwing createDefaul...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheConstructor007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify capacity 64 same key puts never invoke eviction callback ---
      {
        let lru: EvictProbeCache = new EvictProbeCache(64);
        for (let i: int = 0; i < 100; i++) {
          lru.put(9, i);
        }
        expect(lru.evicted).assertEqual(0);
      }

      // --- [2] Verify throwing createDefault throws again for repeated miss get ---
      {
        let lru: ThrowingCreateCache = new ThrowingCreateCache(64);
        let first: int = 0;
        try {
          lru.get(5);
          expect().assertFail();
        } catch (e) {
          first = 1;
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        let second: int = 0;
        try {
          lru.get(5);
          expect().assertFail();
        } catch (e) {
          second = 1;
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        expect(first).assertEqual(1);
        expect(second).assertEqual(1);
      }

      // --- [3] Verify throwing createDefault skipped on hit returning stored value ---
      {
        let lru: ThrowingCreateCache = new ThrowingCreateCache(64);
        lru.put(1, 10);
        expect(lru.get(1)).assertEqual(10);
      }

      // --- [4] Verify entry count stays 1 after createDefault throws on miss ---
      {
        let lru: ThrowingCreateCache = new ThrowingCreateCache(64);
        lru.put(1, 10);
        try {
          lru.get(5);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        expect(lru.length).assertEqual(1);
      }

      // --- [5] Verify new put succeeds after createDefault threw on miss ---
      {
        let lru: ThrowingCreateCache = new ThrowingCreateCache(64);
        try {
          lru.get(5);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        lru.put(2, 20);
        expect(lru.get(2)).assertEqual(20);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CONSTRUCTOR_0080
     * @tc.name testLruCacheConstructor008
     * @tc.desc Merged batch (5 tests): [1] Verify explicitly undefined createDefault miss get returns undefined | [2] Verify throwing afterRemoval propagates when capacity 1 put evicts | [3] Verify the key that w...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheConstructor008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify explicitly undefined createDefault miss get returns undefined ---
      {
        let lru: util.LRUCache<int, int | undefined> = new util.LRUCache<int, int | undefined>(64);
        expect(lru.get(5)).assertEqual(undefined);
      }

      // --- [2] Verify throwing afterRemoval propagates when capacity 1 put evicts ---
      {
        let lru: ThrowingRemovalCache = new ThrowingRemovalCache(1);
        lru.put(1, 100);
        try {
          lru.put(2, 200);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }
      }

      // --- [3] Verify the key that was about to be evicted remains stored when afterRemoval throws during eviction ---
      {
        let lru: ThrowingRemovalCache = new ThrowingRemovalCache(1);
        lru.put(1, 100);
        try {
          lru.put(2, 200);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }
        expect(lru.get(1)).assertEqual(100);
      }

      // --- [4] Verify throwing afterRemoval not triggered while capacity 64 has room ---
      {
        let lru: ThrowingRemovalCache = new ThrowingRemovalCache();
        lru.put(1, 10);
        lru.put(2, 20);
        expect(lru.getCapacity()).assertEqual(64);
        expect(lru.get(1)).assertEqual(10);
        expect(lru.get(2)).assertEqual(20);
      }

      // --- [5] Verify overwrite of existing key does not trigger throwing afterRemoval ---
      {
        let lru: ThrowingRemovalCache = new ThrowingRemovalCache(2);
        lru.put(1, 100);
        lru.put(2, 200);
        lru.put(1, 300);
        expect(lru.length).assertEqual(2);
        expect(lru.get(1)).assertEqual(300);
        expect(lru.get(2)).assertEqual(200);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CONSTRUCTOR_0090
     * @tc.name testLruCacheConstructor009
     * @tc.desc Merged batch (5 tests): [1] Verify constant createDefault at capacity 1 returns 999 on miss and stores the created entry | [2] Verify constructing with equivalent binary, octal, hexadecimal and dec...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheConstructor009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify constant createDefault at capacity 1 returns 999 on miss and stores the created entry ---
      {
        let lru: ConstCreateCache = new ConstCreateCache(1);
        expect(lru.get(5)).assertEqual(999);
        expect(lru.length).assertEqual(1);
      }

      // --- [2] Verify constructing with equivalent binary, octal, hexadecimal and decimal capacity literals all succeed and report the same capacity ---
      {
        let cacheBin: util.LRUCache<int, string> = new util.LRUCache<int, string>(0b10000);
        let cacheOct: util.LRUCache<int, string> = new util.LRUCache<int, string>(0o20);
        let cacheHex: util.LRUCache<int, string> = new util.LRUCache<int, string>(0x10);
        let cacheDec: util.LRUCache<int, string> = new util.LRUCache<int, string>(16);
        expect(cacheBin.getCapacity()).assertEqual(16);
        expect(cacheOct.getCapacity()).assertEqual(16);
        expect(cacheHex.getCapacity()).assertEqual(16);
        expect(cacheDec.getCapacity()).assertEqual(16);
      }

      // --- [3] Verify arithmetic expression capacities are accepted by the constructor and getCapacity reports the computed value ---
      {
        let cacheAdd: util.LRUCache<int, string> = new util.LRUCache<int, string>(8 + 4);
        let cacheMinus: util.LRUCache<int, string> = new util.LRUCache<int, string>(20 - 4);
        let cacheMultiple: util.LRUCache<int, string> = new util.LRUCache<int, string>(4 * 5);
        let cacheDivide: util.LRUCache<int, string> = new util.LRUCache<int, string>(32 / 8);
        expect(cacheAdd.getCapacity()).assertEqual(12);
        expect(cacheMinus.getCapacity()).assertEqual(16);
        expect(cacheMultiple.getCapacity()).assertEqual(20);
        expect(cacheDivide.getCapacity()).assertEqual(4);
      }

      // --- [4] Verify numeric conversion results passed as the capacity are accepted and getCapacity reports the converted value ---
      {
        let cacheDouble: util.LRUCache<int, string> = new util.LRUCache<int, string>(Double.toInt(10.5));
        let cacheShort: util.LRUCache<int, string> = new util.LRUCache<int, string>(Short.toInt(3));
        let cacheFloat: util.LRUCache<int, string> = new util.LRUCache<int, string>(Float.toInt(5.7f));
        expect(cacheDouble.getCapacity()).assertEqual(10);
        expect(cacheShort.getCapacity()).assertEqual(3);
        expect(cacheFloat.getCapacity()).assertEqual(5);
      }

      // --- [5] Verify string and char to int conversions supply the capacity and getCapacity reports the parsed and code values ---
      {
        let cacheStr: util.LRUCache<int, string> = new util.LRUCache<int, string>(Int.parseInt('24', 10));
        let cacheChar: util.LRUCache<int, string> = new util.LRUCache<int, string>('A'.charCodeAt(0));
        expect(cacheStr.getCapacity()).assertEqual(24);
        expect(cacheChar.getCapacity()).assertEqual(65);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CONSTRUCTOR_0100
     * @tc.name testLruCacheConstructor010
     * @tc.desc Merged batch (5 tests): [1] Verify a capacity value that exceeds the int maximum is rejected and the constructor throws BusinessError | [2] Verify capacity taken from a string literal length is app...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheConstructor010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a capacity value that exceeds the int maximum is rejected and the constructor throws BusinessError ---
      {
        let maxCapacity: int = 2147483647;
        try {
          new util.LRUCache<int, int>(maxCapacity + 1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
      }

      // --- [2] Verify capacity taken from a string literal length is applied by the constructor ---
      {
        let cap: int = 'abcdefgh'.length;
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(cap);
        expect(cache.getCapacity()).assertEqual(8);
        expect(cache.length).assertEqual(0);
      }

      // --- [3] Verify capacity taken from an array literal length is applied by the constructor ---
      {
        let cap: int = [1, 2, 3, 4, 5].length;
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(cap);
        expect(cache.getCapacity()).assertEqual(5);
      }

      // --- [4] Verify capacities parsed from hexadecimal and binary strings are applied by the constructor ---
      {
        let hexCache: util.LRUCache<int, int> = new util.LRUCache<int, int>(Int.parseInt('ff', 16));
        let binCache: util.LRUCache<int, int> = new util.LRUCache<int, int>(Int.parseInt('1000', 2));
        expect(hexCache.getCapacity()).assertEqual(255);
        expect(binCache.getCapacity()).assertEqual(8);
      }

      // --- [5] Verify capacity accumulated in a loop is applied by the constructor ---
      {
        let cap: int = 0;
        for (let i: int = 0; i < 4; i++) {
          cap = cap + 2;
        }
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(cap);
        expect(cache.getCapacity()).assertEqual(8);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CONSTRUCTOR_0110
     * @tc.name testLruCacheConstructor011
     * @tc.desc Merged batch (5 tests): [1] Verify capacity read from an instance field is applied by the constructor | [2] Verify capacity read from an array element is applied by the constructor | [3] Verify the...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheConstructor011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify capacity read from an instance field is applied by the constructor ---
      {
        let holder: CapacityHolder = new CapacityHolder();
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(holder.size);
        expect(cache.getCapacity()).assertEqual(12);
      }

      // --- [2] Verify capacity read from an array element is applied by the constructor ---
      {
        let caps: int[] = [3, 9];
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(caps[1]);
        expect(cache.getCapacity()).assertEqual(9);
      }

      // --- [3] Verify the capacity chosen by a conditional expression is applied by the constructor ---
      {
        let small: boolean = false;
        let cap: int = small ? 3 : 9;
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(cap);
        expect(cache.getCapacity()).assertEqual(9);
      }

      // --- [4] Verify an enum member used as the capacity is applied by the constructor ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(CapSize.Large);
        expect(cache.getCapacity()).assertEqual(9);
      }

      // --- [5] Verify a capacity 2 cache typed with an enum key and value reports the constructed capacity and entry count ---
      {
        let cache: util.LRUCache<SlotGrade, SlotGrade> = new util.LRUCache<SlotGrade, SlotGrade>(2);
        cache.put(SlotGrade.Low, SlotGrade.High);
        cache.put(SlotGrade.High, SlotGrade.Low);
        expect(cache.getCapacity()).assertEqual(2);
        expect(cache.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CONSTRUCTOR_0120
     * @tc.name testLruCacheConstructor012
     * @tc.desc Merged batch (5 tests): [1] Verify an explicitly passed undefined capacity falls back to the default 64 | [2] Verify a Uint8Array value roundtrips by reference through a constructor built cache | [...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheConstructor012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an explicitly passed undefined capacity falls back to the default 64 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(undefined);
        expect(cache.getCapacity()).assertEqual(64);
      }

      // --- [2] Verify a Uint8Array value roundtrips by reference through a constructor built cache ---
      {
        let bytes: Uint8Array = new Uint8Array(3);
        bytes[0] = 1;
        let cache: util.LRUCache<string, Uint8Array> = new util.LRUCache<string, Uint8Array>(2);
        cache.put('b', bytes);
        expect(cache.get('b')).assertEqual(bytes);
      }

      // --- [3] Verify an emoji key and an emoji value roundtrip through a constructor built cache ---
      {
        let cache: util.LRUCache<string, string> = new util.LRUCache<string, string>(2);
        cache.put('😀', '👍');
        expect(cache.get('😀')).assertEqual('👍');
      }

      // --- [4] Verify a positive Infinity key roundtrips through a constructor built cache ---
      {
        let key: double = Double.POSITIVE_INFINITY;
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>(2);
        cache.put(key, 7);
        expect(cache.get(key)).assertEqual(7);
      }

      // --- [5] Verify a negative Infinity key roundtrips through a constructor built cache ---
      {
        let key: double = Double.NEGATIVE_INFINITY;
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>(2);
        cache.put(key, 8);
        expect(cache.get(key)).assertEqual(8);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CONSTRUCTOR_0130
     * @tc.name testLruCacheConstructor013
     * @tc.desc Merged batch (5 tests): [1] Verify two NaN key puts into a capacity 2 cache occupy one slot only | [2] Verify negative zero and zero keys share one slot in a constructor built cache | [3] Verify th...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheConstructor013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify two NaN key puts into a capacity 2 cache occupy one slot only ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>(2);
        cache.put(Double.NaN, 1);
        cache.put(Double.NaN, 2);
        expect(cache.length).assertEqual(1);
      }

      // --- [2] Verify negative zero and zero keys share one slot in a constructor built cache ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>(2);
        cache.put(-0.0, 1);
        cache.put(0.0, 2);
        cache.put(3.0, 3);
        expect(cache.length).assertEqual(2);
      }

      // --- [3] Verify the int minimum key roundtrips through a capacity 2 constructor built cache ---
      {
        let key: int = -2147483648;
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(key, 7);
        expect(cache.getCapacity()).assertEqual(2);
        expect(cache.get(key)).assertEqual(7);
      }

      // --- [4] Verify the long minimum key roundtrips through a constructor built cache ---
      {
        let key: long = -9223372036854775807 - 1;
        let cache: util.LRUCache<long, int> = new util.LRUCache<long, int>(2);
        cache.put(key, 7);
        expect(cache.get(key)).assertEqual(7);
      }

      // --- [5] Verify the bigint maximum value roundtrips through a constructor built cache ---
      {
        let value: bigint = 9223372036854775807n;
        let cache: util.LRUCache<int, bigint> = new util.LRUCache<int, bigint>(2);
        cache.put(1, value);
        expect(cache.get(1)).assertEqual(value);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CONSTRUCTOR_0140
     * @tc.name testLruCacheConstructor014
     * @tc.desc Merged batch (2 tests): [1] Verify capacity derived from a floored double conversion is applied by the constructor | [2] Verify an LRUCache instance serves as key or value of another LRUCache
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheConstructor014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify capacity derived from a floored double conversion is applied by the constructor ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(Double.toInt(Math.floor(63.999)));
        expect(cache.getCapacity()).assertEqual(63);
      }

      // --- [2] Verify an LRUCache instance serves as key or value of another LRUCache ---
      {
        let outer1: util.LRUCache<util.LRUCache<int, int>, int> =
          new util.LRUCache<util.LRUCache<int, int>, int>(4);
        let outer2: util.LRUCache<int, util.LRUCache<int, int>> =
          new util.LRUCache<int, util.LRUCache<int, int>>(10);

        expect(outer1.getCapacity()).assertEqual(4);
        expect(outer2.getCapacity()).assertEqual(10);
      }
    });

  });
}
