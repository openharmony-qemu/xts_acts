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

class TsDefaultCache<K, V> extends util.LRUCache<K, V> {
  make: (key: K) => V | undefined = (key: K) => undefined;

  constructor(make?: (key: K) => V | undefined, capacity?: int) {
    super(capacity);
    if (make !== undefined) {
      this.make = make;
    }
  }

  createDefault(key: K): V | undefined {
    return this.make(key);
  }
}

export default function lruCacheToStringTest(): void {
  describe('LruCacheToStringTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_TO_STRING_0010
     * @tc.name testLruCacheToString001
     * @tc.desc Merged batch (5 tests): [1] Verify toString zero-argument call header offset and total length on default instance | [2] Verify toString zero-argument call does not change cache length | [3] Verify ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheToString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify toString zero-argument call header offset and total length on default instance ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let s: string = lru.toString();
        expect(s.indexOf('maxSize = 64')).assertEqual(10);
        expect(s.length).assertEqual(60);
      }

      // --- [2] Verify toString zero-argument call does not change cache length ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 10);
        let lenBefore: int = lru.length;
        lru.toString();
        expect(lru.length).assertEqual(lenBefore);
      }

      // --- [3] Verify toString is side-effect free and two consecutive calls output the same string ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 10);
        lru.get(1);
        let first: string = lru.toString();
        let second: string = lru.toString();
        expect(first).assertEqual(second);
      }

      // --- [4] Verify default empty cache full format exact match ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let s: string = lru.toString();
        expect(s).assertEqual('LRUCache[ maxSize = 64, hits = 0, misses = 0, hitRate = 0% ]');
      }

      // --- [5] Verify one hit one miss full format exact match ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(2, 10);
        lru.get(2);
        lru.get(3);
        let s: string = lru.toString();
        expect(s).assertEqual('LRUCache[ maxSize = 64, hits = 1, misses = 1, hitRate = 50% ]');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_TO_STRING_0020
     * @tc.name testLruCacheToString002
     * @tc.desc Merged batch (5 tests): [1] Verify return value starts with LRUCache[ prefix | [2] Verify return value ends with space plus right square bracket | [3] Verify return value contains left square brack...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheToString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify return value starts with LRUCache[ prefix ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 10);
        let s: string = lru.toString();
        expect(s.indexOf('LRUCache[')).assertEqual(0);
      }

      // --- [2] Verify return value ends with space plus right square bracket ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let text: string = lru.toString();
        expect(text.lastIndexOf(' ]')).assertEqual(text.length - 2);
      }

      // --- [3] Verify return value contains left square bracket separator ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 10);
        let text: string = lru.toString();
        expect(text.startsWith('LRUCache[')).assertTrue();
      }

      // --- [4] Verify return value contains comma separating multiple stat fields ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 10);
        let text: string = lru.toString();
        expect(text.split(',').length).assertEqual(4);
      }

      // --- [5] Verify empty cache maxSize field shows default 64 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let text: string = lru.toString();
        expect(text.split(',')[0]).assertEqual('LRUCache[ maxSize = 64');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_TO_STRING_0030
     * @tc.name testLruCacheToString003
     * @tc.desc Merged batch (5 tests): [1] Verify empty cache hits field shows zero | [2] Verify empty cache hitRate field shows 0 percent | [3] Verify custom capacity five empty cache all fields zero exact match...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheToString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify empty cache hits field shows zero ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let text: string = lru.toString();
        expect(text.split(',')[1]).assertEqual(' hits = 0');
        expect(text.split(',')[2]).assertEqual(' misses = 0');
      }

      // --- [2] Verify empty cache hitRate field shows 0 percent ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let text: string = lru.toString();
        let parts: string[] = text.split(',');
        expect(parts[3]).assertEqual(' hitRate = 0% ]');
      }

      // --- [3] Verify custom capacity five empty cache all fields zero exact match ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(5);
        let s: string = lru.toString();
        expect(s).assertEqual('LRUCache[ maxSize = 5, hits = 0, misses = 0, hitRate = 0% ]');
      }

      // --- [4] Verify capacity one put one key maxSize remains one ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        lru.put(1, 10);
        let s: string = lru.toString();
        expect(s).assertEqual('LRUCache[ maxSize = 1, hits = 0, misses = 0, hitRate = 0% ]');
      }

      // --- [5] Verify capacity one hundred hit once maxSize remains one hundred ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(100);
        lru.put(1, 10);
        lru.get(1);
        let s: string = lru.toString();
        expect(s).assertEqual('LRUCache[ maxSize = 100, hits = 1, misses = 0, hitRate = 100% ]');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_TO_STRING_0040
     * @tc.name testLruCacheToString004
     * @tc.desc Merged batch (5 tests): [1] Verify maximum capacity put key maxSize shows 2147483647 | [2] Verify updateCapacity 256 then put maxSize shows 256 | [3] Verify maxSize field agrees with getCapacity re...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheToString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify maximum capacity put key maxSize shows 2147483647 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(2147483647);
        lru.put(1, 10);
        let s: string = lru.toString();
        expect(s).assertEqual('LRUCache[ maxSize = 2147483647, hits = 0, misses = 0, hitRate = 0% ]');
      }

      // --- [2] Verify updateCapacity 256 then put maxSize shows 256 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.updateCapacity(256);
        lru.put(1, 10);
        let s: string = lru.toString();
        expect(s).assertEqual('LRUCache[ maxSize = 256, hits = 0, misses = 0, hitRate = 0% ]');
      }

      // --- [3] Verify maxSize field agrees with getCapacity return value ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 10);
        expect(lru.getCapacity()).assertEqual(64);
        expect(lru.toString().split(',')[0]).assertEqual('LRUCache[ maxSize = 64');
      }

      // --- [4] Verify putting two different keys only produces no query stats ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 10);
        lru.put(2, 20);
        let s: string = lru.toString();
        expect(s.split(',')[1]).assertEqual(' hits = 0');
      }

      // --- [5] Verify overwriting existing key produces no miss stat ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 10);
        lru.put(1, 20);
        let s: string = lru.toString();
        expect(s.split(',')[2]).assertEqual(' misses = 0');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_TO_STRING_0050
     * @tc.name testLruCacheToString005
     * @tc.desc Merged batch (5 tests): [1] Verify single get hit makes hits field one | [2] Verify single get miss makes misses field one | [3] Verify two consecutive hits make hits field two | [4] Verify two con...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheToString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify single get hit makes hits field one ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 10);
        lru.get(1);
        let text: string = lru.toString();
        expect(text.split(',')[1]).assertEqual(' hits = 1');
        expect(text.split(',')[2]).assertEqual(' misses = 0');
      }

      // --- [2] Verify single get miss makes misses field one ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 10);
        lru.get(2);
        let text: string = lru.toString();
        let parts: string[] = text.split(',');
        expect(parts[2]).assertEqual(' misses = 1');
        expect(parts[1]).assertEqual(' hits = 0');
      }

      // --- [3] Verify two consecutive hits make hits field two ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 10);
        lru.put(2, 20);
        lru.get(1);
        lru.get(2);
        let s: string = lru.toString();
        expect(s.split(',')[1]).assertEqual(' hits = 2');
      }

      // --- [4] Verify two consecutive misses make misses field two ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 10);
        lru.get(2);
        lru.get(3);
        let s: string = lru.toString();
        expect(s.split(',')[2]).assertEqual(' misses = 2');
      }

      // --- [5] Verify overwrite existing key then get hit gives hits one misses zero ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 10);
        lru.put(1, 20);
        lru.get(1);
        let s: string = lru.toString();
        expect(s.split(',')[1]).assertEqual(' hits = 1');
        expect(s.split(',')[2]).assertEqual(' misses = 0');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_TO_STRING_0060
     * @tc.name testLruCacheToString006
     * @tc.desc Merged batch (5 tests): [1] Verify empty cache first get miss makes misses field one | [2] Verify single hit makes hitRate field 100 percent | [3] Verify toString outputs differ as state evolves fr...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheToString006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify empty cache first get miss makes misses field one ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.get(1);
        let s: string = lru.toString();
        expect(s.split(',')[2]).assertEqual(' misses = 1');
      }

      // --- [2] Verify single hit makes hitRate field 100 percent ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 10);
        lru.get(1);
        let text: string = lru.toString();
        expect(text.split(',')[3]).assertEqual(' hitRate = 100% ]');
      }

      // --- [3] Verify toString outputs differ as state evolves from hit to miss ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 10);
        lru.get(1);
        let a: string = lru.toString();
        lru.get(2);
        let b: string = lru.toString();
        expect(a.split(',')[2]).assertEqual(' misses = 0');
        expect(b.split(',')[2]).assertEqual(' misses = 1');
      }

      // --- [4] Verify three different keys each hit once makes hits field three ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 0; i < 3; i++) {
          lru.put(i, i);
          lru.get(i);
        }
        let s: string = lru.toString();
        expect(s.split(',')[1]).assertEqual(' hits = 3');
      }

      // --- [5] Verify interleaved hits and misses accumulate to hits two misses one ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 10);
        lru.get(1);
        lru.get(2);
        lru.get(1);
        let s: string = lru.toString();
        expect(s.split(',')[1]).assertEqual(' hits = 2');
        expect(s.split(',')[2]).assertEqual(' misses = 1');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_TO_STRING_0070
     * @tc.name testLruCacheToString007
     * @tc.desc Merged batch (5 tests): [1] Verify one hit zero miss hitRate exact 100 percent | [2] Verify zero hit one miss hitRate exact 0 percent | [3] Verify one hit two miss hitRate exact 33 percent | [4] Ve...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheToString007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify one hit zero miss hitRate exact 100 percent ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 10);
        lru.get(1);
        expect(lru.toString()).assertEqual('LRUCache[ maxSize = 64, hits = 1, misses = 0, hitRate = 100% ]');
      }

      // --- [2] Verify zero hit one miss hitRate exact 0 percent ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 10);
        lru.get(2);
        expect(lru.toString()).assertEqual('LRUCache[ maxSize = 64, hits = 0, misses = 1, hitRate = 0% ]');
      }

      // --- [3] Verify one hit two miss hitRate exact 33 percent ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 10);
        lru.get(1);
        lru.get(2);
        lru.get(3);
        expect(lru.toString()).assertEqual('LRUCache[ maxSize = 64, hits = 1, misses = 2, hitRate = 33% ]');
      }

      // --- [4] Verify one hit and three misses after an eviction hitRate exact 25 percent ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        lru.put(1, 10);
        lru.get(1);
        lru.put(2, 20);
        let evicted: int | undefined = lru.get(1);
        expect(evicted).assertEqual(undefined);
        lru.get(3);
        lru.get(4);
        expect(lru.toString()).assertEqual('LRUCache[ maxSize = 1, hits = 1, misses = 3, hitRate = 25% ]');
      }

      // --- [5] Verify one hit four miss hitRate exact 20 percent ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 10);
        for (let i: int = 2; i < 6; i++) {
          lru.get(i);
        }
        lru.get(1);
        expect(lru.toString()).assertEqual('LRUCache[ maxSize = 64, hits = 1, misses = 4, hitRate = 20% ]');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_TO_STRING_0080
     * @tc.name testLruCacheToString008
     * @tc.desc Merged batch (5 tests): [1] Verify a capacity shrink below the entry count evicts entries while hits and misses stay unchanged | [2] Verify one hit six miss hitRate exact 14 percent truncation prob...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheToString008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a capacity shrink below the entry count evicts entries while hits and misses stay unchanged ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(6);
        lru.put(1, 10);
        lru.put(2, 20);
        lru.put(3, 30);
        lru.put(4, 40);
        lru.put(5, 50);
        lru.put(6, 60);
        lru.get(1);
        lru.get(99);
        lru.updateCapacity(2);
        expect(lru.length).assertEqual(2);
        expect(lru.toString()).assertEqual('LRUCache[ maxSize = 2, hits = 1, misses = 1, hitRate = 50% ]');
      }

      // --- [2] Verify one hit six miss hitRate exact 14 percent truncation probe ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 10);
        lru.get(1);
        let i: int = 2;
        while (i < 8) {
          lru.get(i);
          i++;
        }
        expect(lru.toString()).assertEqual('LRUCache[ maxSize = 64, hits = 1, misses = 6, hitRate = 14% ]');
      }

      // --- [3] Verify one hit seven miss hitRate exact 12 percent truncation probe ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 10);
        lru.get(1);
        let probes: int[] = [2, 3, 4, 5, 6, 7, 8];
        for (const k of probes) {
          lru.get(k);
        }
        expect(lru.toString()).assertEqual('LRUCache[ maxSize = 64, hits = 1, misses = 7, hitRate = 12% ]');
      }

      // --- [4] Verify the key promoted by a hit survives the following eviction so both gets count as hits ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        lru.put(1, 10);
        lru.put(2, 20);
        lru.get(1);
        lru.put(3, 30);
        lru.get(1);
        expect(lru.toString()).assertEqual('LRUCache[ maxSize = 2, hits = 2, misses = 0, hitRate = 100% ]');
      }

      // --- [5] Verify one hit nine miss hitRate exact 10 percent ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 10);
        lru.get(1);
        for (let i: int = 10; i < 19; i++) {
          lru.get(i);
        }
        expect(lru.toString()).assertEqual('LRUCache[ maxSize = 64, hits = 1, misses = 9, hitRate = 10% ]');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_TO_STRING_0090
     * @tc.name testLruCacheToString009
     * @tc.desc Merged batch (5 tests): [1] Verify one hit eleven miss hitRate exact 8 percent | [2] Verify one hit ninety nine miss hitRate exact 1 percent | [3] Verify one hit nine hundred ninety nine miss hitRa...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheToString009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify one hit eleven miss hitRate exact 8 percent ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 10);
        lru.get(1);
        for (let i: int = 12; i > 1; i--) {
          lru.get(i);
        }
        expect(lru.toString()).assertEqual('LRUCache[ maxSize = 64, hits = 1, misses = 11, hitRate = 8% ]');
      }

      // --- [2] Verify one hit ninety nine miss hitRate exact 1 percent ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 10);
        lru.get(1);
        for (let i: int = 2; i <= 100; i++) {
          lru.get(i);
        }
        let text: string = lru.toString();
        expect(text).assertEqual('LRUCache[ maxSize = 64, hits = 1, misses = 99, hitRate = 1% ]');
      }

      // --- [3] Verify one hit nine hundred ninety nine miss hitRate truncated to 0 percent ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 10);
        lru.get(1);
        let missCount: int = 0;
        for (let i: int = 2; i < 1001; i++) {
          lru.get(i);
          missCount = missCount + 1;
        }
        expect(missCount).assertEqual(999);
        expect(lru.toString()).assertEqual('LRUCache[ maxSize = 64, hits = 1, misses = 999, hitRate = 0% ]');
      }

      // --- [4] Verify the get that creates a default value counts one miss and the next get on that key counts one hit ---
      {
        let lru: TsDefaultCache<int, int> = new TsDefaultCache<int, int>((key: int) => key + 5, 5);
        expect(lru.get(4)).assertEqual(9);
        expect(lru.get(4)).assertEqual(9);
        expect(lru.toString()).assertEqual('LRUCache[ maxSize = 5, hits = 1, misses = 1, hitRate = 50% ]');
      }

      // --- [5] Verify three hit one miss hitRate exact 75 percent ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 10);
        lru.put(2, 20);
        lru.put(3, 30);
        lru.get(1);
        lru.get(2);
        lru.get(3);
        lru.get(9);
        expect(lru.toString()).assertEqual('LRUCache[ maxSize = 64, hits = 3, misses = 1, hitRate = 75% ]');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_TO_STRING_0100
     * @tc.name testLruCacheToString010
     * @tc.desc Merged batch (5 tests): [1] Verify two hit one miss hitRate exact 66 percent two thirds truncation probe | [2] Verify three hits and two misses with the evicted key re-read hitRate exact 60 percent...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheToString010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify two hit one miss hitRate exact 66 percent two thirds truncation probe ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 10);
        lru.put(2, 20);
        lru.get(1);
        lru.get(2);
        lru.get(9);
        expect(lru.toString()).assertEqual('LRUCache[ maxSize = 64, hits = 2, misses = 1, hitRate = 66% ]');
      }

      // --- [2] Verify three hits and two misses with the evicted key re-read hitRate exact 60 percent ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        lru.put(1, 10);
        lru.put(2, 20);
        lru.get(1);
        lru.get(2);
        lru.put(3, 30);
        lru.get(3);
        let lost: int | undefined = lru.get(1);
        expect(lost).assertEqual(undefined);
        lru.get(4);
        expect(lru.toString()).assertEqual('LRUCache[ maxSize = 2, hits = 3, misses = 2, hitRate = 60% ]');
      }

      // --- [3] Verify two hits and three misses when both hit keys are removed hitRate exact 40 percent ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 10);
        lru.put(2, 20);
        lru.get(1);
        lru.get(2);
        lru.remove(1);
        lru.remove(2);
        lru.get(1);
        lru.get(2);
        lru.get(3);
        expect(lru.toString()).assertEqual('LRUCache[ maxSize = 64, hits = 2, misses = 3, hitRate = 40% ]');
      }

      // --- [4] Verify two hit five miss hitRate exact 28 percent ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 10);
        lru.put(2, 20);
        lru.get(1);
        lru.get(2);
        for (let i: int = 3; i < 8; i++) {
          lru.get(i);
        }
        let text: string = lru.toString();
        expect(text).assertEqual('LRUCache[ maxSize = 64, hits = 2, misses = 5, hitRate = 28% ]');
      }

      // --- [5] Verify three hits and seven misses after a shrink to capacity 1 hitRate exact 30 percent ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        lru.put(1, 10);
        lru.put(2, 20);
        lru.put(3, 30);
        lru.get(1);
        lru.get(2);
        lru.get(3);
        lru.updateCapacity(1);
        lru.get(1);
        lru.get(2);
        lru.get(4);
        lru.get(5);
        lru.get(6);
        lru.get(7);
        lru.get(8);
        expect(lru.toString()).assertEqual('LRUCache[ maxSize = 1, hits = 3, misses = 7, hitRate = 30% ]');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_TO_STRING_0110
     * @tc.name testLruCacheToString011
     * @tc.desc Merged batch (5 tests): [1] Verify statistics keep accumulating after a clear empties the cache | [2] Verify two hit six miss same ratio different counts hitRate still 25 percent | [3] Verify five ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheToString011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify statistics keep accumulating after a clear empties the cache ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(4);
        lru.put(1, 10);
        lru.get(1);
        lru.clear();
        expect(lru.get(1)).assertEqual(undefined);
        lru.put(1, 10);
        lru.get(1);
        expect(lru.toString()).assertEqual('LRUCache[ maxSize = 4, hits = 2, misses = 1, hitRate = 66% ]');
      }

      // --- [2] Verify two hit six miss same ratio different counts hitRate still 25 percent ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 10);
        lru.put(2, 20);
        lru.get(1);
        lru.get(2);
        let missKey: int = 3;
        while (missKey < 9) {
          lru.get(missKey);
          missKey = missKey + 1;
        }
        let text: string = lru.toString();
        expect(text).assertEqual('LRUCache[ maxSize = 64, hits = 2, misses = 6, hitRate = 25% ]');
      }

      // --- [3] Verify five hundred hit five hundred miss large base same ratio hitRate 50 percent ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 0; i < 500; i++) {
          lru.put(i, i);
          lru.get(i);
        }
        for (let i: int = 500; i < 1000; i++) {
          lru.get(i);
        }
        expect(lru.toString()).assertEqual('LRUCache[ maxSize = 64, hits = 500, misses = 500, hitRate = 50% ]');
      }

      // --- [4] Verify maximum capacity hit once combined stats exact match ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(2147483647);
        lru.put(1, 10);
        lru.get(1);
        expect(lru.toString()).assertEqual('LRUCache[ maxSize = 2147483647, hits = 1, misses = 0, hitRate = 100% ]');
      }

      // --- [5] Verify capacity one put two keys triggers eviction maxSize one stats zero ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        lru.put(1, 10);
        lru.put(2, 20);
        expect(lru.length).assertEqual(1);
        expect(lru.toString()).assertEqual('LRUCache[ maxSize = 1, hits = 0, misses = 0, hitRate = 0% ]');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_TO_STRING_0120
     * @tc.name testLruCacheToString012
     * @tc.desc Merged batch (5 tests): [1] Verify a hit then a shrink to a capacity equal to the entry count keeps hits and hit rate in toString | [2] Verify miss then updateCapacity shrink misses stat preserved ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheToString012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a hit then a shrink to a capacity equal to the entry count keeps hits and hit rate in toString ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        lru.put(1, 10);
        lru.get(1);
        lru.updateCapacity(1);
        expect(lru.toString()).assertEqual('LRUCache[ maxSize = 1, hits = 1, misses = 0, hitRate = 100% ]');
      }

      // --- [2] Verify miss then updateCapacity shrink misses stat preserved ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        lru.put(1, 10);
        lru.get(2);
        lru.updateCapacity(1);
        expect(lru.toString()).assertEqual('LRUCache[ maxSize = 1, hits = 0, misses = 1, hitRate = 0% ]');
      }

      // --- [3] Verify return value first character is capital L ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 10);
        let s: string = lru.toString();
        expect(s.substring(0, 1)).assertEqual('L');
      }

      // --- [4] Verify empty cache and hit cache output strings differ ---
      {
        let firstCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let a: string = firstCache.toString();
        let secondCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        secondCache.put(1, 10);
        secondCache.get(1);
        let b: string = secondCache.toString();
        expect(a.split(',')[1]).assertEqual(' hits = 0');
        expect(b.split(',')[1]).assertEqual(' hits = 1');
      }

      // --- [5] Verify all hit cache and all miss cache output strings differ ---
      {
        let firstCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        firstCache.put(1, 10);
        firstCache.get(1);
        let a: string = firstCache.toString();
        let secondCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        secondCache.put(1, 10);
        secondCache.get(2);
        let b: string = secondCache.toString();
        expect(a.split(',')[1]).assertEqual(' hits = 1');
        expect(b.split(',')[2]).assertEqual(' misses = 1');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_TO_STRING_0130
     * @tc.name testLruCacheToString013
     * @tc.desc Merged batch (5 tests): [1] Verify toString after many evictions does not throw and format is complete | [2] Verify nine hits and one miss filling nine keys then hitting each exact match hitRate 90...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheToString013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify toString after many evictions does not throw and format is complete ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        for (let i: int = 0; i < 10; i++) {
          lru.put(i, i);
        }
        lru.get(0);
        lru.get(9);
        let s: string = lru.toString();
        expect(s.indexOf('LRUCache[')).assertEqual(0);
        expect(s.split(',')[0]).assertEqual('LRUCache[ maxSize = 3');
      }

      // --- [2] Verify nine hits and one miss filling nine keys then hitting each exact match hitRate 90 percent ---
      {
        let lruCache: util.LRUCache<int, int> = new util.LRUCache<int, int>(16);
        for (let i: int = 0; i < 9; i++) {
          lruCache.put(i, i * 10);
        }
        for (let i: int = 0; i < 9; i++) {
          lruCache.get(i);
        }
        lruCache.get(999);
        expect(lruCache.toString()).assertEqual('LRUCache[ maxSize = 16, hits = 9, misses = 1, hitRate = 90% ]');
      }

      // --- [3] Verify seven hit three miss exact match hitRate 70 percent ---
      {
        let lruCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 0; i < 7; i++) {
          lruCache.put(i, i * 10);
          lruCache.get(i);
        }
        for (let j: int = 7; j < 10; j++) {
          lruCache.get(j);
        }
        let text: string = lruCache.toString();
        expect(text).assertEqual('LRUCache[ maxSize = 64, hits = 7, misses = 3, hitRate = 70% ]');
      }

      // --- [4] Verify eleven hit nine miss exact match hitRate 55 percent ---
      {
        let lruCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 0; i < 11; i++) {
          lruCache.put(i, i * 10);
          lruCache.get(i);
        }
        let missKeys: int[] = [11, 12, 13, 14, 15, 16, 17, 18, 19];
        for (const k of missKeys) {
          lruCache.get(k);
        }
        expect(lruCache.toString()).assertEqual('LRUCache[ maxSize = 64, hits = 11, misses = 9, hitRate = 55% ]');
      }

      // --- [5] Verify thirteen hit seven miss exact match hitRate 65 percent ---
      {
        let lruCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 0; i < 13; i++) {
          lruCache.put(i, i * 10);
          lruCache.get(i);
        }
        let missKey: int = 13;
        while (missKey < 20) {
          lruCache.get(missKey);
          missKey = missKey + 1;
        }
        let text: string = lruCache.toString();
        expect(text).assertEqual('LRUCache[ maxSize = 64, hits = 13, misses = 7, hitRate = 65% ]');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_TO_STRING_0140
     * @tc.name testLruCacheToString014
     * @tc.desc Merged batch (5 tests): [1] Verify nine hit eleven miss exact match hitRate 45 percent | [2] Verify one hit nineteen miss exact match hitRate 5 percent | [3] Verify seven hit one miss exact match h...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheToString014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify nine hit eleven miss exact match hitRate 45 percent ---
      {
        let lruCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 9; i < 20; i++) {
          lruCache.get(i);
        }
        for (let i: int = 0; i < 9; i++) {
          lruCache.put(i, i * 10);
          lruCache.get(i);
        }
        expect(lruCache.toString()).assertEqual('LRUCache[ maxSize = 64, hits = 9, misses = 11, hitRate = 45% ]');
      }

      // --- [2] Verify one hit nineteen miss exact match hitRate 5 percent ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.get(1);
        for (let i: int = 2; i < 21; i += 1) {
          cache.get(i);
        }
        let text: string = cache.toString();
        expect(text).assertEqual('LRUCache[ maxSize = 64, hits = 1, misses = 19, hitRate = 5% ]');
      }

      // --- [3] Verify seven hit one miss exact match hitRate 87 percent seven eighths truncation probe ---
      {
        let lruCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 0; i < 7; i++) {
          lruCache.put(i, i * 10);
          lruCache.get(i);
        }
        lruCache.get(999);
        expect(lruCache.toString()).assertEqual('LRUCache[ maxSize = 64, hits = 7, misses = 1, hitRate = 87% ]');
      }

      // --- [4] Verify two hit seven miss exact match hitRate 22 percent two ninths truncation probe ---
      {
        let lruCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lruCache.put(1, 10);
        lruCache.put(2, 20);
        lruCache.get(1);
        lruCache.get(2);
        for (let i: int = 3; i <= 9; i++) {
          lruCache.get(i);
        }
        expect(lruCache.toString()).assertEqual('LRUCache[ maxSize = 64, hits = 2, misses = 7, hitRate = 22% ]');
      }

      // --- [5] Verify split by comma splits return value into four stat segments ---
      {
        let lruCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lruCache.put(1, 10);
        lruCache.get(1);
        lruCache.get(2);
        let s: string = lruCache.toString();
        let parts: string[] = s.split(',');
        expect(parts.length).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_TO_STRING_0150
     * @tc.name testLruCacheToString015
     * @tc.desc Merged batch (5 tests): [1] Verify first split segment contains maxSize 64 | [2] Verify second split segment contains hits 1 | [3] Verify third split segment contains misses 1 | [4] Verify fourth s...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheToString015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify first split segment contains maxSize 64 ---
      {
        let lruCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lruCache.put(1, 10);
        lruCache.get(1);
        lruCache.get(2);
        let text: string = lruCache.toString();
        let head: string = text.split(',')[0];
        expect(head).assertEqual('LRUCache[ maxSize = 64');
      }

      // --- [2] Verify second split segment contains hits 1 ---
      {
        let lruCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lruCache.put(1, 10);
        lruCache.get(1);
        lruCache.get(2);
        let parts: string[] = lruCache.toString().split(',');
        let hitsField: string = parts[1];
        expect(hitsField).assertEqual(' hits = 1');
      }

      // --- [3] Verify third split segment contains misses 1 ---
      {
        let lruCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lruCache.put(1, 10);
        lruCache.get(1);
        lruCache.get(2);
        let parts: string[] = lruCache.toString().split(',');
        expect(parts[2]).assertEqual(' misses = 1');
      }

      // --- [4] Verify fourth split segment contains hitRate 50 percent ---
      {
        let lruCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lruCache.put(1, 10);
        lruCache.get(1);
        lruCache.get(2);
        let parts: string[] = lruCache.toString().split(',');
        let rateField: string = parts[3].trim();
        expect(rateField).assertEqual('hitRate = 50% ]');
      }

      // --- [5] Verify substring extracts maxSize numeric value 64 from field token ---
      {
        let lruCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let s: string = lruCache.toString();
        let token: string = 'maxSize = ';
        let startPos: int = s.indexOf(token) + token.length;
        let endPos: int = s.indexOf(',', startPos);
        expect(s.substring(startPos, endPos)).assertEqual('64');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_TO_STRING_0160
     * @tc.name testLruCacheToString016
     * @tc.desc Merged batch (5 tests): [1] Verify comma split and trim of toString yields the hits field token hits = 1 | [2] Verify substring extracts misses numeric value 1 from field token | [3] Verify substri...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheToString016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify comma split and trim of toString yields the hits field token hits = 1 ---
      {
        let lruCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lruCache.put(1, 10);
        lruCache.get(1);
        lruCache.get(2);
        let s: string = lruCache.toString();
        let parts: string[] = s.split(',');
        let hitsField: string = parts[1].trim();
        expect(hitsField).assertEqual('hits = 1');
      }

      // --- [2] Verify substring extracts misses numeric value 1 from field token ---
      {
        let lruCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lruCache.put(1, 10);
        lruCache.get(1);
        lruCache.get(2);
        let s: string = lruCache.toString();
        let token: string = 'misses = ';
        let startPos: int = s.indexOf(token) + token.length;
        let endPos: int = s.indexOf(',', startPos);
        expect(s.substring(startPos, endPos)).assertEqual('1');
      }

      // --- [3] Verify substring extracts hitRate numeric value 50 from field token ---
      {
        let lruCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lruCache.put(1, 10);
        lruCache.get(1);
        lruCache.get(2);
        let s: string = lruCache.toString();
        let rateToken: string = 'hitRate = ';
        let begin: int = s.indexOf(rateToken) + rateToken.length;
        let finish: int = s.indexOf('%', begin);
        let rate: string = s.substring(begin, finish);
        expect(rate).assertEqual('50');
      }

      // --- [4] Verify return value startsWith LRUCache prefix ---
      {
        let lruCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let s: string = lruCache.toString();
        expect(s.startsWith('LRUCache[')).assertTrue();
      }

      // --- [5] Verify return value endsWith space right bracket ---
      {
        let lruCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let s: string = lruCache.toString();
        expect(s.endsWith(' ]')).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_TO_STRING_0170
     * @tc.name testLruCacheToString017
     * @tc.desc Merged batch (5 tests): [1] Verify regex test matches full LRUCache stat template | [2] Verify regex exec capture group extracts hitRate value 50 | [3] Verify cache with stats return value length l...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheToString017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify regex test matches full LRUCache stat template ---
      {
        let lruCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let s: string = lruCache.toString();
        let re: RegExp = new RegExp('^LRUCache\\[ maxSize = \\d+, hits = \\d+, misses = \\d+, hitRate = \\d+% \\]$');
        expect(re.test(s)).assertTrue();
      }

      // --- [2] Verify regex exec capture group extracts hitRate value 50 ---
      {
        let lruCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lruCache.put(1, 10);
        lruCache.get(1);
        lruCache.get(2);
        let s: string = lruCache.toString();
        let re: RegExp = new RegExp('hitRate = (\\d+)%');
        let m: RegExpExecArray | null = re.exec(s);
        expect(m![1]).assertEqual('50');
      }

      // --- [3] Verify cache with stats return value length larger than empty cache ---
      {
        let emptyCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let statCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        statCache.put(1, 10);
        statCache.get(1);
        expect(emptyCache.toString().length < statCache.toString().length).assertTrue();
        expect(emptyCache.toString().length).assertEqual(60);
        expect(statCache.toString().length).assertEqual(62);
      }

      // --- [4] Verify same state two toString returns have equal length ---
      {
        let lruCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lruCache.put(1, 10);
        lruCache.get(1);
        let firstText: string = lruCache.toString();
        let secondText: string = lruCache.toString();
        expect(firstText.length).assertEqual(secondText.length);
      }

      // --- [5] Verify hits ten return length larger than hits one ---
      {
        let singleHit: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        singleHit.put(1, 10);
        singleHit.get(1);
        let tenHits: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 0; i < 10; i++) {
          tenHits.put(i, i);
          tenHits.get(i);
        }
        expect(singleHit.toString().length < tenHits.toString().length).assertTrue();
        expect(singleHit.toString().length).assertEqual(62);
        expect(tenHits.toString().length).assertEqual(63);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_TO_STRING_0180
     * @tc.name testLruCacheToString018
     * @tc.desc Merged batch (5 tests): [1] Verify misses ten return length larger than misses one | [2] Verify maxSize 2147483647 return length larger than default 64 | [3] Verify maxSize segment length grows wit...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheToString018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify misses ten return length larger than misses one ---
      {
        let oneMiss: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        oneMiss.put(1, 10);
        oneMiss.get(2);
        let tenMiss: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        tenMiss.put(1, 10);
        for (let i: int = 2; i < 12; i++) {
          tenMiss.get(i);
        }
        expect(oneMiss.toString().length < tenMiss.toString().length).assertTrue();
        expect(oneMiss.toString().length).assertEqual(60);
        expect(tenMiss.toString().length).assertEqual(61);
      }

      // --- [2] Verify maxSize 2147483647 return length larger than default 64 ---
      {
        let bigCache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2147483647);
        let smallCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        expect(smallCache.toString().length < bigCache.toString().length).assertTrue();
        expect(smallCache.toString().length).assertEqual(60);
        expect(bigCache.toString().length).assertEqual(68);
      }

      // --- [3] Verify maxSize segment length grows with capacity digit count ---
      {
        let bigCache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2147483647);
        let smallCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let bigStr: string = bigCache.toString();
        let smallStr: string = smallCache.toString();
        let bStart: int = bigStr.indexOf('maxSize = ');
        let sStart: int = smallStr.indexOf('maxSize = ');
        let bEnd: int = bigStr.indexOf(',', bStart);
        let sEnd: int = smallStr.indexOf(',', sStart);
        expect(smallStr.substring(sStart, sEnd).length < bigStr.substring(bStart, bEnd).length).assertTrue();
        expect(smallStr.substring(sStart, sEnd).length).assertEqual(12);
        expect(bigStr.substring(bStart, bEnd).length).assertEqual(20);
      }

      // --- [4] Verify toString call does not add misses stat ---
      {
        let lruCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lruCache.put(1, 10);
        lruCache.get(2);
        let before: string[] = lruCache.toString().split(',');
        lruCache.toString();
        let after: string[] = lruCache.toString().split(',');
        expect(before[2]).assertEqual(' misses = 1');
        expect(after[2]).assertEqual(' misses = 1');
      }

      // --- [5] Verify toString after existing key get still hits returning original value ---
      {
        let lruCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lruCache.put(1, 10);
        lruCache.toString();
        expect(lruCache.get(1)).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_TO_STRING_0190
     * @tc.name testLruCacheToString019
     * @tc.desc Merged batch (5 tests): [1] Verify toString does not trigger afterRemoval callback | [2] Verify toString does not trigger createDefault callback | [3] Verify capacity one toString does not trigger ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheToString019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify toString does not trigger afterRemoval callback ---
      {
        let removalCount: int = 0;
        let lruCache: ProbeCache<int, int> = new ProbeCache<int, int>(
          (self: util.LRUCache<int, int>, isEvict: boolean, key: int, value: int, newValue: int | undefined) => {
            removalCount = removalCount + 1;
          });
        lruCache.put(1, 10);
        lruCache.get(1);
        lruCache.toString();
        expect(removalCount).assertEqual(0);
      }

      // --- [2] Verify toString does not trigger createDefault callback ---
      {
        let lruCache: ProbeCache<int, int> = new ProbeCache<int, int>(
          undefined,
          (key: int) => {
            throw new Error('createDefault must not be triggered by toString');
          });
        lruCache.put(1, 10);
        lruCache.get(1);
        let s: string = lruCache.toString();
        expect(s.split(',')[1]).assertEqual(' hits = 1');
      }

      // --- [3] Verify capacity one toString does not trigger eviction length stays one ---
      {
        let lruCache: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        lruCache.put(1, 10);
        let lenBefore: int = lruCache.length;
        lruCache.toString();
        expect(lruCache.length).assertEqual(lenBefore);
        expect(lruCache.length).assertEqual(1);
      }

      // --- [4] Verify getCapacity unchanged before and after toString ---
      {
        let lruCache: util.LRUCache<int, int> = new util.LRUCache<int, int>(7);
        let cap: int = lruCache.getCapacity();
        lruCache.toString();
        expect(lruCache.getCapacity()).assertEqual(cap);
      }

      // --- [5] Verify toString does not change LRU eviction order leaving keys not marked recently used ---
      {
        let lruCache: ProbeCache<int, int> = new ProbeCache<int, int>(
          undefined,
          (key: int) => key,
          2);
        lruCache.put(1, 10);
        lruCache.put(2, 20);
        lruCache.toString();
        lruCache.put(3, 30);

        expect(lruCache.get(2)).assertEqual(20);
        expect(lruCache.get(1)).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_TO_STRING_0200
     * @tc.name testLruCacheToString020
     * @tc.desc Merged batch (5 tests): [1] Verify stats keep accumulating after toString and are reflected in output | [2] Verify return value chains toUpperCase and contains uppercase field name | [3] Verify ret...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheToString020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify stats keep accumulating after toString and are reflected in output ---
      {
        let lruCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lruCache.put(1, 10);
        lruCache.get(1);
        lruCache.toString();
        lruCache.get(2);
        expect(lruCache.toString()).assertEqual('LRUCache[ maxSize = 64, hits = 1, misses = 1, hitRate = 50% ]');
      }

      // --- [2] Verify return value chains toUpperCase and contains uppercase field name ---
      {
        let lruCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lruCache.put(1, 10);
        let s: string = lruCache.toString().toUpperCase();
        expect(s.split(',')[0]).assertEqual('LRUCACHE[ MAXSIZE = 64');
      }

      // --- [3] Verify return value chains trim and still starts with LRUCache prefix ---
      {
        let lruCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lruCache.put(1, 10);
        let s: string = lruCache.toString().trim();
        expect(s.indexOf('LRUCache[')).assertEqual(0);
      }

      // --- [4] Verify return value concatenated with string keeps full prefix ---
      {
        let lruCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lruCache.put(1, 10);
        let combined: string = 'stats: ' + lruCache.toString();
        expect(combined.indexOf('stats: LRUCache[')).assertEqual(0);
      }

      // --- [5] Verify return value char index access yields square bracket separator ---
      {
        let lruCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lruCache.put(1, 10);
        let s: string = lruCache.toString();
        expect(s.substring(8, 9)).assertEqual('[');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_TO_STRING_0210
     * @tc.name testLruCacheToString021
     * @tc.desc Merged batch (5 tests): [1] Verify return value split by space yields fourteen word segments | [2] Verify maxSize numeric value in toString equals getCapacity string | [3] Verify each get hit incre...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheToString021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify return value split by space yields fourteen word segments ---
      {
        let lruCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lruCache.put(1, 10);
        let words: string[] = lruCache.toString().split(' ');
        expect(words.length).assertEqual(14);
      }

      // --- [2] Verify maxSize numeric value in toString equals getCapacity string ---
      {
        let lruCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let cap: int = lruCache.getCapacity();
        let s: string = lruCache.toString();
        let token: string = 'maxSize = ';
        let startPos: int = s.indexOf(token) + token.length;
        let endPos: int = s.indexOf(',', startPos);
        expect(s.substring(startPos, endPos)).assertEqual(cap.toString());
      }

      // --- [3] Verify each get hit increments hits field reflecting latest state ---
      {
        let lruCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lruCache.put(1, 10);
        lruCache.get(1);
        let firstText: string = lruCache.toString();
        lruCache.get(1);
        let secondText: string = lruCache.toString();
        expect(firstText.split(',')[1]).assertEqual(' hits = 1');
        expect(secondText.split(',')[1]).assertEqual(' hits = 2');
      }

      // --- [4] Verify each get miss increments misses field reflecting latest state ---
      {
        let lruCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lruCache.put(1, 10);
        lruCache.get(2);
        let firstText: string = lruCache.toString();
        lruCache.get(3);
        let secondText: string = lruCache.toString();
        expect(firstText.split(',')[2]).assertEqual(' misses = 1');
        expect(secondText.split(',')[2]).assertEqual(' misses = 2');
      }

      // --- [5] Verify toString output does not contain cached key value content ---
      {
        let lruCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lruCache.put(12345, 67890);
        lruCache.get(12345);
        let s: string = lruCache.toString();
        expect(s.indexOf('12345')).assertEqual(-1);
        expect(s.indexOf('67890')).assertEqual(-1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_TO_STRING_0220
     * @tc.name testLruCacheToString022
     * @tc.desc Merged batch (5 tests): [1] Verify different value same stats state toString outputs equal | [2] Verify toString then clear works length zero and toString still normal | [3] Verify string string ty...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheToString022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify different value same stats state toString outputs equal ---
      {
        let lruA: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lruA.put(1, 100);
        lruA.get(1);
        let lruB: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lruB.put(1, 999);
        lruB.get(1);
        expect(lruA.toString()).assertEqual(lruB.toString());
      }

      // --- [2] Verify toString then clear works length zero and toString still normal ---
      {
        let lruCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lruCache.put(1, 10);
        lruCache.get(1);
        lruCache.toString();
        lruCache.clear();
        expect(lruCache.length).assertEqual(0);
        let s: string = lruCache.toString();
        expect(s.indexOf('LRUCache[')).assertEqual(0);
      }

      // --- [3] Verify string string type parameter instance stat format consistent ---
      {
        let lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        lruCache.put('a', 'x');
        lruCache.get('a');
        let s: string = lruCache.toString();
        expect(s.split(',')[1]).assertEqual(' hits = 1');
      }

      // --- [4] Verify double string type parameter double key instance stat format consistent ---
      {
        let lruCache: util.LRUCache<double, string> = new util.LRUCache<double, string>();
        lruCache.put(1.5, 'v');
        lruCache.get(1.5);
        let s: string = lruCache.toString();
        expect(s.split(',')[0]).assertEqual('LRUCache[ maxSize = 64');
      }

      // --- [5] Verify boolean int type parameter boolean key instance stat format consistent ---
      {
        let lruCache: util.LRUCache<boolean, int> = new util.LRUCache<boolean, int>();
        lruCache.put(true, 1);
        lruCache.get(true);
        let s: string = lruCache.toString();
        expect(s.split(',')[3]).assertEqual(' hitRate = 100% ]');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_TO_STRING_0230
     * @tc.name testLruCacheToString023
     * @tc.desc Merged batch (5 tests): [1] Verify Date int type parameter reference key instance stat format consistent | [2] Verify int bigint type parameter instance stat format consistent | [3] Verify long int...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheToString023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify Date int type parameter reference key instance stat format consistent ---
      {
        let lruCache: util.LRUCache<Date, int> = new util.LRUCache<Date, int>();
        let d: Date = new Date(0);
        lruCache.put(d, 1);
        lruCache.get(d);
        let s: string = lruCache.toString();
        expect(s.split(',')[1]).assertEqual(' hits = 1');
      }

      // --- [2] Verify int bigint type parameter instance stat format consistent ---
      {
        let lruCache: util.LRUCache<int, bigint> = new util.LRUCache<int, bigint>();
        lruCache.put(1, BigInt(12345));
        lruCache.get(1);
        let s: string = lruCache.toString();
        expect(s.split(',')[1]).assertEqual(' hits = 1');
      }

      // --- [3] Verify long int type parameter long key instance stat format consistent ---
      {
        let lruCache: util.LRUCache<long, int> = new util.LRUCache<long, int>();
        let bigKey: long = 1234567890123;
        lruCache.put(bigKey, 1);
        lruCache.get(bigKey);
        let s: string = lruCache.toString();
        expect(s.split(',')[0]).assertEqual('LRUCache[ maxSize = 64');
      }

      // --- [4] Verify return value contains maxSize field name ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 10);
        let text: string = lru.toString();
        expect(text.indexOf('maxSize = ')).assertEqual(10);
      }

      // --- [5] Verify return value contains hits field name ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 10);
        lru.get(1);
        let s: string = lru.toString();
        expect(s.indexOf('hits = ')).assertEqual(24);
        expect(s.indexOf('hits = 1')).assertEqual(24);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_TO_STRING_0240
     * @tc.name testLruCacheToString024
     * @tc.desc Merged batch (5 tests): [1] Verify return value contains misses field name | [2] Verify return value contains hitRate field name | [3] Verify return value contains percent sign for hitRate unit | [...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheToString024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify return value contains misses field name ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 10);
        lru.get(2);
        expect(lru.toString().indexOf('misses = ')).assertEqual(34);
      }

      // --- [2] Verify return value contains hitRate field name ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 10);
        lru.get(1);
        let text: string = lru.toString();
        expect(text.indexOf('hitRate = ')).assertEqual(46);
        expect(text.indexOf('hitRate = 100%')).assertEqual(46);
      }

      // --- [3] Verify return value contains percent sign for hitRate unit ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        expect(lru.toString().indexOf('%')).assertEqual(57);
      }

      // --- [4] Verify clear keeps the accumulated hits and misses in the toString statistics ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(4);
        lru.put(1, 10);
        lru.get(1);
        lru.get(2);
        lru.clear();
        let text: string = lru.toString();
        expect(text).assertEqual('LRUCache[ maxSize = 4, hits = 1, misses = 1, hitRate = 50% ]');
      }

      // --- [5] Verify remove does not add a hit or a miss to the toString statistics ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        lru.put(1, 10);
        lru.get(1);
        lru.remove(1);
        lru.get(1);
        let text: string = lru.toString();
        expect(text).assertEqual('LRUCache[ maxSize = 3, hits = 1, misses = 1, hitRate = 50% ]');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_TO_STRING_0250
     * @tc.name testLruCacheToString025
     * @tc.desc Merged batch (2 tests): [1] Verify a capacity grow updates the maxSize field while hits and hit rate stay in toString | [2] Verify a get miss that creates a default value is counted as one miss in ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheToString025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a capacity grow updates the maxSize field while hits and hit rate stay in toString ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        lru.put(1, 10);
        lru.get(1);
        lru.updateCapacity(8);
        let text: string = lru.toString();
        expect(text).assertEqual('LRUCache[ maxSize = 8, hits = 1, misses = 0, hitRate = 100% ]');
      }

      // --- [2] Verify a get miss that creates a default value is counted as one miss in toString ---
      {
        let lru: TsDefaultCache<int, int> = new TsDefaultCache<int, int>((key: int) => key + 5, 3);
        expect(lru.get(4)).assertEqual(9);
        let text: string = lru.toString();
        expect(text).assertEqual('LRUCache[ maxSize = 3, hits = 0, misses = 1, hitRate = 0% ]');
      }
    });

  });
}
