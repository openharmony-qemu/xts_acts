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

class StrHolderAlpha {
  str: string = '';
  constructor(input: string) {
    this.str = input;
  }
}

interface IdKeyObjA {
  id: int;
}

enum PropSlot {
  First = 0,
  Second = 1
}

export default function lruCachePropertiesTest(): void {
  describe('LruCachePropertiesTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PROPERTIES_0010
     * @tc.name testLruCacheProperties001
     * @tc.desc Merged batch (5 tests): [1] Verify length can be used as int in arithmetic expression after a put | [2] Verify two consecutive length reads return same value without side effect | [3] Verify each i...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheProperties001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify length can be used as int in arithmetic expression after a put ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 10);
        let sum: int = pro.length + 1;
        expect(sum).assertEqual(2);
      }

      // --- [2] Verify two consecutive length reads return same value without side effect ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 10);
        let firstRead: int = pro.length;
        let secondRead: int = pro.length;
        expect(firstRead).assertEqual(secondRead);
      }

      // --- [3] Verify each instance keeps independent length counter ---
      {
        let firstCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let secondCache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        firstCache.put(1, 10);
        secondCache.put(2, 20);
        secondCache.put(3, 30);
        expect(firstCache.length).assertEqual(1);
        expect(secondCache.length).assertEqual(2);
      }

      // --- [4] Verify length reaches default capacity 64 after filling sixty four entries ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 0; i < 64; i++) {
          pro.put(i, i);
        }
        expect(pro.length).assertEqual(64);
      }

      // --- [5] Verify the length property still reports default capacity 64 after 65 entries are inserted ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 0; i < 65; i++) {
          pro.put(i, i);
        }
        let entryCount: int = pro.length;
        expect(entryCount).assertEqual(64);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PROPERTIES_0020
     * @tc.name testLruCacheProperties002
     * @tc.desc Merged batch (5 tests): [1] Verify length stays one when overwriting same key with different value | [2] Verify length stays one when overwriting same key with same value | [3] Verify length stays ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheProperties002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify length stays one when overwriting same key with different value ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 10);
        pro.put(1, 99);
        expect(pro.length).assertEqual(1);
        expect(pro.get(1)).assertEqual(99);
      }

      // --- [2] Verify length stays one when overwriting same key with same value ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 10);
        let before: int = pro.length;
        pro.put(1, 10);
        let after: int = pro.length;
        expect(after).assertEqual(before);
      }

      // --- [3] Verify length stays one after repeated overwrites of same key ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 10);
        pro.put(1, 20);
        pro.put(1, 30);
        expect(pro.length).assertEqual(1);
      }

      // --- [4] Verify length decreases to zero after removing existing key ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let removedKey: int = 1;
        pro.put(removedKey, 10);
        pro.remove(removedKey);
        expect(pro.length).assertEqual(0);
      }

      // --- [5] Verify length unchanged when removing non existing key ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let absentKey: int = 99;
        pro.put(1, 10);
        pro.remove(absentKey);
        expect(pro.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PROPERTIES_0030
     * @tc.name testLruCacheProperties003
     * @tc.desc Merged batch (5 tests): [1] Verify length decreases to two after removing two of four records | [2] Verify length resets to zero after removing all keys | [3] Verify length resets to zero after cle...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheProperties003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify length decreases to two after removing two of four records ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 10);
        pro.put(2, 20);
        pro.put(3, 30);
        pro.put(4, 40);
        pro.remove(1);
        pro.remove(2);
        expect(pro.length).assertEqual(2);
      }

      // --- [2] Verify length resets to zero after removing all keys ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 10);
        pro.put(2, 20);
        pro.put(3, 30);
        pro.remove(1);
        pro.remove(2);
        pro.remove(3);
        expect(pro.length).assertEqual(0);
      }

      // --- [3] Verify length resets to zero after clearing populated cache ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 10);
        pro.put(2, 20);
        pro.clear();
        expect(pro.length).assertEqual(0);
      }

      // --- [4] Verify length restarts from zero after clear followed by put ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 10);
        pro.clear();
        pro.put(2, 20);
        expect(pro.length).assertEqual(1);
      }

      // --- [5] Verify length unchanged after expanding capacity ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 10);
        pro.updateCapacity(128);
        expect(pro.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PROPERTIES_0040
     * @tc.name testLruCacheProperties004
     * @tc.desc Merged batch (5 tests): [1] Verify length unchanged when shrinking exactly to current length | [2] Verify length stays at new capacity when put after shrink | [3] Verify length stays three for capa...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheProperties004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify length unchanged when shrinking exactly to current length ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        pro.put(1, 10);
        pro.put(2, 20);
        pro.updateCapacity(2);
        expect(pro.length).assertEqual(2);
      }

      // --- [2] Verify length stays at new capacity when put after shrink ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 10);
        pro.put(2, 20);
        pro.put(3, 30);
        pro.updateCapacity(2);
        pro.put(4, 40);
        expect(pro.length).assertEqual(2);
      }

      // --- [3] Verify length stays three for capacity three cache after five puts ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        pro.put(1, 10);
        pro.put(2, 20);
        pro.put(3, 30);
        pro.put(4, 40);
        pro.put(5, 50);
        expect(pro.length).assertEqual(3);
      }

      // --- [4] Verify get miss inserting createDefault value increases length by one ---
      {
        let pro: ProbeCache<int, int> = new ProbeCache<int, int>(
          undefined,
          (key: int) => key);
        pro.put(1, 10);
        pro.get(5);
        expect(pro.length).assertEqual(2);
      }

      // --- [5] Verify get miss with default undefined createDefault keeps length unchanged ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 10);
        pro.get(5);
        expect(pro.getMissCount()).assertEqual(1);
        expect(pro.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PROPERTIES_0050
     * @tc.name testLruCacheProperties005
     * @tc.desc Merged batch (5 tests): [1] Verify get hit leaves length unchanged | [2] Verify remove one then put one on full cache keeps length at capacity | [3] Verify length consistent with contains after rem...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheProperties005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify get hit leaves length unchanged ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 10);
        pro.get(1);
        expect(pro.getMatchCount()).assertEqual(1);
        expect(pro.length).assertEqual(1);
      }

      // --- [2] Verify remove one then put one on full cache keeps length at capacity ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        pro.put(1, 10);
        pro.put(2, 20);
        pro.remove(1);
        pro.put(3, 30);
        expect(pro.length).assertEqual(2);
      }

      // --- [3] Verify length consistent with contains after removing key ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 10);
        pro.put(2, 20);
        pro.remove(1);
        expect(pro.contains(1)).assertFalse();
        expect(pro.contains(2)).assertTrue();
        expect(pro.length).assertEqual(1);
      }

      // --- [4] Verify length equals capacity after eviction in full cache ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        pro.put(1, 10);
        pro.put(2, 20);
        pro.put(3, 30);
        pro.put(4, 40);
        pro.put(5, 50);
        expect(pro.length).assertEqual(pro.getCapacity());
      }

      // --- [5] Verify remove null key throws and length stays unchanged ---
      {
        let pro: util.LRUCache<int | null, int> = new util.LRUCache<int | null, int>();
        pro.put(1, 10);
        try {
          pro.remove(null);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
        expect(pro.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PROPERTIES_0060
     * @tc.name testLruCacheProperties006
     * @tc.desc Merged batch (5 tests): [1] Verify updateCapacity zero throws and length stays unchanged | [2] Verify length two for floating double instance after two puts | [3] Verify length two for same-typed i...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheProperties006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify updateCapacity zero throws and length stays unchanged ---
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
        expect(pro.length).assertEqual(1);
      }

      // --- [2] Verify length two for floating double instance after two puts ---
      {
        let pro: util.LRUCache<double, double> = new util.LRUCache<double, double>();
        pro.put(1.5, 10.5);
        pro.put(2.5, 20.5);
        let vs: Array<double> = pro.values();
        expect(vs.length).assertEqual(2);
        expect(pro.length).assertEqual(2);
      }

      // --- [3] Verify length two for same-typed instance after two puts ---
      {
        // boolean boolean
        let proBool: util.LRUCache<boolean, boolean> = new util.LRUCache<boolean, boolean>();
        proBool.put(true, false);
        proBool.put(false, true);
        expect(proBool.length).assertEqual(2);

        // long long
        let proLong: util.LRUCache<long, long> = new util.LRUCache<long, long>();
        let firstKeyLong: long = 1;
        let firstValueLong: long = 10;
        let secondKeyLong: long = 2;
        let secondValueLong: long = 20;
        proLong.put(firstKeyLong, firstValueLong);
        proLong.put(secondKeyLong, secondValueLong);
        expect(proLong.length).assertEqual(2);
        expect(proLong.get(firstKeyLong)).assertEqual(firstValueLong);

        // double double
        let proDouble: util.LRUCache<double, double> = new util.LRUCache<double, double>();
        proDouble.put(1.0, 10.0);
        proDouble.put(2.0, 20.0);
        let ksDouble: Array<double> = proDouble.keys();
        expect(ksDouble.length).assertEqual(2);
        expect(proDouble.length).assertEqual(2);

        // byte byte
        let proByte: util.LRUCache<byte, byte> = new util.LRUCache<byte, byte>();
        let firstKeyByte: byte = 1;
        let firstValueByte: byte = 10;
        let secondKeyByte: byte = 2;
        let secondValueByte: byte = 20;
        proByte.put(firstKeyByte, firstValueByte);
        proByte.put(secondKeyByte, secondValueByte);
        let ksByte: Array<byte> = proByte.keys();
        expect(ksByte.length).assertEqual(2);
        expect(proByte.length).assertEqual(2);

        // short short
        let proShort: util.LRUCache<short, short> = new util.LRUCache<short, short>();
        let firstKeyShort: short = 1;
        let firstValueShort: short = 10;
        let secondKeyShort: short = 2;
        let secondValueShort: short = 20;
        proShort.put(firstKeyShort, firstValueShort);
        proShort.put(secondKeyShort, secondValueShort);
        let vsShort: Array<short> = proShort.values();
        expect(vsShort.length).assertEqual(2);
        expect(proShort.length).assertEqual(2);
      }

      // --- [4] Verify length two for float float instance after two typed puts ---
      {
        let pro: util.LRUCache<float, float> = new util.LRUCache<float, float>();
        let firstKey: float = 1.0 as float;
        let secondKey: float = 2.0 as float;
        pro.put(firstKey, 1.0 as float);
        pro.put(secondKey, 2.0 as float);
        expect(pro.length).assertEqual(2);
      }

      // --- [5] Verify length two for bigint bigint instance after two typed puts ---
      {
        let pro: util.LRUCache<bigint, bigint> = new util.LRUCache<bigint, bigint>();
        let firstKey: bigint = 1n;
        let secondKey: bigint = 2n;
        pro.put(firstKey, 10n);
        pro.put(secondKey, 20n);
        expect(pro.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PROPERTIES_0070
     * @tc.name testLruCacheProperties007
     * @tc.desc Merged batch (5 tests): [1] Verify length two for Date Date instance with different millis | [2] Verify length two for RegExp RegExp instance with different patterns | [3] Verify length two for cla...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheProperties007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify length two for Date Date instance with different millis ---
      {
        let pro: util.LRUCache<Date, Date> = new util.LRUCache<Date, Date>();
        let firstDate: Date = new Date(0);
        let secondDate: Date = new Date(86400000);
        pro.put(firstDate, firstDate);
        pro.put(secondDate, secondDate);
        expect(pro.length).assertEqual(2);
      }

      // --- [2] Verify length two for RegExp RegExp instance with different patterns ---
      {
        let pro: util.LRUCache<RegExp, RegExp> = new util.LRUCache<RegExp, RegExp>();
        let firstRegex: RegExp = new RegExp('abc', 'g');
        let secondRegex: RegExp = new RegExp('def', 'g');
        pro.put(firstRegex, firstRegex);
        pro.put(secondRegex, secondRegex);
        expect(pro.length).assertEqual(2);
      }

      // --- [3] Verify length two for class key instance with different properties ---
      {
        let pro: util.LRUCache<StrHolderAlpha, StrHolderAlpha> = new util.LRUCache<StrHolderAlpha, StrHolderAlpha>();
        let firstHolder: StrHolderAlpha = new StrHolderAlpha('a');
        let secondHolder: StrHolderAlpha = new StrHolderAlpha('b');
        pro.put(firstHolder, firstHolder);
        pro.put(secondHolder, secondHolder);
        expect(pro.length).assertEqual(2);
      }

      // --- [4] Verify length two for int array keys with different references ---
      {
        let pro: util.LRUCache<int[], int[]> = new util.LRUCache<int[], int[]>();
        let firstArray: int[] = [1, 2];
        let secondArray: int[] = [3, 4];
        pro.put(firstArray, firstArray);
        pro.put(secondArray, secondArray);
        expect(pro.length).assertEqual(2);
      }

      // --- [5] Verify length two for Map keys with different references ---
      {
        let pro: util.LRUCache<Map<string, int>, Map<string, int>> = new util.LRUCache<Map<string, int>, Map<string, int>>();
        let firstMap: Map<string, int> = new Map<string, int>();
        let secondMap: Map<string, int> = new Map<string, int>();
        firstMap.set('a', 1);
        secondMap.set('b', 2);
        pro.put(firstMap, firstMap);
        pro.put(secondMap, secondMap);
        expect(pro.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PROPERTIES_0080
     * @tc.name testLruCacheProperties008
     * @tc.desc Merged batch (5 tests): [1] Verify length two for Set keys with different references | [2] Verify length two for object literal keys with different properties | [3] Verify length two for various mi...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheProperties008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify length two for Set keys with different references ---
      {
        let pro: util.LRUCache<Set<int>, Set<int>> = new util.LRUCache<Set<int>, Set<int>>();
        let firstSet: Set<int> = new Set<int>();
        let secondSet: Set<int> = new Set<int>();
        firstSet.add(1);
        secondSet.add(2);
        pro.put(firstSet, firstSet);
        pro.put(secondSet, secondSet);
        expect(pro.length).assertEqual(2);
      }

      // --- [2] Verify length two for object literal keys with different properties ---
      {
        let pro: util.LRUCache<IdKeyObjA, IdKeyObjA> = new util.LRUCache<IdKeyObjA, IdKeyObjA>();
        let firstKey: IdKeyObjA = { id: 1 };
        let secondKey: IdKeyObjA = { id: 2 };
        pro.put(firstKey, firstKey);
        pro.put(secondKey, secondKey);
        expect(pro.length).assertEqual(2);
      }

      // --- [3] Verify length two for various mixed-typed instances ---
      {
        // string StrHolderAlpha
        let proStrHolder: util.LRUCache<string, StrHolderAlpha> = new util.LRUCache<string, StrHolderAlpha>();
        proStrHolder.put('aa', new StrHolderAlpha('a'));
        proStrHolder.put('bb', new StrHolderAlpha('b'));
        expect(proStrHolder.length).assertEqual(2);

        // int Date
        let proIntDate: util.LRUCache<int, Date> = new util.LRUCache<int, Date>();
        proIntDate.put(1, new Date(0));
        proIntDate.put(2, new Date(86400000));
        expect(proIntDate.length).assertEqual(2);

        // Date string
        let proDateStr: util.LRUCache<Date, string> = new util.LRUCache<Date, string>();
        proDateStr.put(new Date(0), 'a');
        proDateStr.put(new Date(86400000), 'b');
        expect(proDateStr.length).assertEqual(2);

        // bigint int
        let proBigIntInt: util.LRUCache<bigint, int> = new util.LRUCache<bigint, int>();
        let firstKeyBigInt: bigint = 1n;
        let secondKeyBigInt: bigint = 2n;
        proBigIntInt.put(firstKeyBigInt, 10);
        proBigIntInt.put(secondKeyBigInt, 20);
        expect(proBigIntInt.length).assertEqual(2);

        // string Date
        let proStrDate: util.LRUCache<string, Date> = new util.LRUCache<string, Date>(4);
        proStrDate.put('a', new Date(1700000000000));
        proStrDate.put('b', new Date(1800000000000));
        expect(proStrDate.length).assertEqual(2);

        // bigint string
        let proBigIntStr: util.LRUCache<bigint, string> = new util.LRUCache<bigint, string>(4);
        proBigIntStr.put(1n, 'a');
        proBigIntStr.put(2n, 'b');
        expect(proBigIntStr.length).assertEqual(2);

        // string double
        let proStrDouble: util.LRUCache<string, double> = new util.LRUCache<string, double>(4);
        proStrDouble.put('a', 3.14);
        proStrDouble.put('b', 2.718);
        expect(proStrDouble.length).assertEqual(2);
      }

      // --- [4] Verify capacity stays sixteen after putting three records ---
      {
        let lru: util.LRUCache<string, string> = new util.LRUCache<string, string>(16);
        lru.put('a', '1');
        lru.put('b', '2');
        lru.put('c', '3');
        expect(lru.length).assertEqual(3);
        expect(lru.getCapacity()).assertEqual(16);
      }

      // --- [5] Verify overwriting keys in a full capacity five cache keeps length at five without eviction ---
      {
        let lru: util.LRUCache<string, string> = new util.LRUCache<string, string>(5);
        lru.put('a', '1');
        lru.put('b', '2');
        lru.put('c', '3');
        lru.put('d', '4');
        lru.put('e', '5');
        lru.put('a', '10');
        lru.put('e', '50');
        expect(lru.length).assertEqual(5);
        expect(lru.values().length).assertEqual(5);
        expect(lru.get('a')).assertEqual('10');
        expect(lru.get('e')).assertEqual('50');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PROPERTIES_0090
     * @tc.name testLruCacheProperties009
     * @tc.desc Merged batch (5 tests): [1] Verify removing then re-adding the same key keeps length three after an intermediate drop to two | [2] Verify capacity seven cache pins length at seven after eight puts ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheProperties009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify removing then re-adding the same key keeps length three after an intermediate drop to two ---
      {
        let lru: util.LRUCache<string, string> = new util.LRUCache<string, string>(5);
        lru.put('a', '1');
        lru.put('b', '2');
        lru.put('c', '3');
        expect(lru.length).assertEqual(3);

        lru.remove('b');
        expect(lru.length).assertEqual(2);

        lru.put('b', '2');
        expect(lru.length).assertEqual(3);
        expect(lru.keys().length).assertEqual(3);
      }

      // --- [2] Verify capacity seven cache pins length at seven after eight puts and evicts only the oldest key ---
      {
        let lru: util.LRUCache<string, string> = new util.LRUCache<string, string>(7);
        lru.put('slotA', '1');
        lru.put('slotB', '2');
        lru.put('slotC', '3');
        lru.put('slotD', '4');
        lru.put('slotE', '5');
        lru.put('slotF', '6');
        lru.put('slotG', '7');
        lru.put('slotH', '8');
        expect(lru.length).assertEqual(7);
        expect(lru.contains('slotH')).assertTrue();
        expect(lru.contains('slotA')).assertFalse();
      }

      // --- [3] Verify length one hundred after looping one hundred puts ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(200);
        for (let i: int = 0; i < 100; i++) {
          lru.put(i, i);
        }
        expect(lru.length).assertEqual(100);
      }

      // --- [4] Verify length equals distinct key count after overwriting multiple keys ---
      {
        let lru: util.LRUCache<string, int> = new util.LRUCache<string, int>(4);
        lru.put('a', 1);
        lru.put('b', 2);
        lru.put('a', 10);
        lru.put('b', 20);
        expect(lru.length).assertEqual(2);
      }

      // --- [5] Verify length counts five distinct keys across eight put calls that overwrite existing keys ---
      {
        let c: util.LRUCache<string, string> = new util.LRUCache<string, string>(8);
        c.put('a', '1');
        c.put('b', '2');
        c.put('c', '3');
        c.put('d', '4');
        c.put('e', '5');
        c.put('a', '10');
        c.put('c', '30');
        c.put('e', '50');
        expect(c.length).assertEqual(5);
        expect(c.keys().length).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PROPERTIES_0100
     * @tc.name testLruCacheProperties010
     * @tc.desc Merged batch (5 tests): [1] Verify length becomes nine after removing two of six then adding five distinct keys | [2] Verify length stays two after get reorder and new put in capacity 2 | [3] Verif...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheProperties010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify length becomes nine after removing two of six then adding five distinct keys ---
      {
        let c: util.LRUCache<string, string> = new util.LRUCache<string, string>(12);
        c.put('a', '1');
        c.put('b', '2');
        c.put('c', '3');
        c.put('d', '4');
        c.put('e', '5');
        c.put('f', '6');
        c.remove('b');
        c.remove('d');
        c.put('g', '7');
        c.put('h', '8');
        c.put('i', '9');
        c.put('j', '10');
        c.put('k', '11');
        expect(c.length).assertEqual(9);
        expect(c.values().length).assertEqual(9);
      }

      // --- [2] Verify length stays two after get reorder and new put in capacity 2 ---
      {
        let c: util.LRUCache<string, string> = new util.LRUCache<string, string>(2);
        c.put('a', '1');
        c.put('b', '2');
        c.get('a');
        c.put('c', '3');
        expect(c.length).assertEqual(2);
      }

      // --- [3] Verify length stays five after loop of twenty puts in capacity 5 ---
      {
        let c: util.LRUCache<int, int> = new util.LRUCache<int, int>(5);
        for (let i: int = 0; i < 20; i++) {
          c.put(i, i);
        }
        expect(c.length).assertEqual(5);
      }

      // --- [4] Verify length steps down by one on each remove and only surviving keys remain ---
      {
        let c: util.LRUCache<string, string> = new util.LRUCache<string, string>(8);
        c.put('a', '1');
        c.put('b', '2');
        c.put('c', '3');
        c.put('d', '4');
        c.put('e', '5');
        c.remove('a');
        expect(c.length).assertEqual(4);
        c.remove('b');
        expect(c.length).assertEqual(3);
        c.remove('c');
        expect(c.length).assertEqual(2);
        expect(c.contains('d')).assertTrue();
        expect(c.contains('e')).assertTrue();
        expect(c.contains('a')).assertFalse();
        expect(c.length).assertEqual(2);
      }

      // --- [5] Verify shrinking capacity six to three evicts the oldest three and keeps the newest three ---
      {
        let c: util.LRUCache<string, string> = new util.LRUCache<string, string>(6);
        c.put('a', '1');
        c.put('b', '2');
        c.put('c', '3');
        c.put('d', '4');
        c.put('e', '5');
        c.put('f', '6');
        c.updateCapacity(3);
        expect(c.length).assertEqual(3);
        expect(c.contains('d')).assertTrue();
        expect(c.contains('f')).assertTrue();
        expect(c.contains('a')).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PROPERTIES_0110
     * @tc.name testLruCacheProperties011
     * @tc.desc Merged batch (5 tests): [1] Verify clearing a full capacity six cache then refilling to six restores length six | [2] Verify length reflects net survivors after mixed remove and put | [3] Verify le...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheProperties011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify clearing a full capacity six cache then refilling to six restores length six ---
      {
        let c: util.LRUCache<string, string> = new util.LRUCache<string, string>(6);
        c.put('a', '1');
        c.put('b', '2');
        c.put('c', '3');
        c.put('d', '4');
        c.put('e', '5');
        c.put('f', '6');
        c.clear();
        c.put('g', '7');
        c.put('h', '8');
        c.put('i', '9');
        c.put('j', '10');
        c.put('k', '11');
        c.put('l', '12');
        expect(c.length).assertEqual(6);
        expect(c.values().length).assertEqual(6);
      }

      // --- [2] Verify length reflects net survivors after mixed remove and put ---
      {
        let c: util.LRUCache<string, string> = new util.LRUCache<string, string>(8);
        c.put('a', '1');
        c.put('b', '2');
        c.remove('a');
        c.put('c', '3');
        c.put('d', '4');
        expect(c.length).assertEqual(3);
      }

      // --- [3] Verify length unchanged when removing already evicted key ---
      {
        let c: util.LRUCache<string, string> = new util.LRUCache<string, string>(2);
        c.put('a', '1');
        c.put('b', '2');
        c.put('c', '3');
        c.remove('a');
        expect(c.length).assertEqual(2);
      }

      // --- [4] Verify shrinking capacity ten to four with seven entries leaves length four ---
      {
        let c: util.LRUCache<string, string> = new util.LRUCache<string, string>(10);
        c.put('a', '1');
        c.put('b', '2');
        c.put('c', '3');
        c.put('d', '4');
        c.put('e', '5');
        c.put('f', '6');
        c.put('g', '7');
        c.updateCapacity(4);
        expect(c.length).assertEqual(4);
        expect(c.keys().length).assertEqual(4);
      }

      // --- [5] Verify expanding capacity four to twenty keeps three existing entries and their values ---
      {
        let c: util.LRUCache<string, string> = new util.LRUCache<string, string>(4);
        c.put('a', '1');
        c.put('b', '2');
        c.put('c', '3');
        c.updateCapacity(20);
        expect(c.length).assertEqual(3);
        expect(c.get('a')).assertEqual('1');
        expect(c.keys().length).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PROPERTIES_0120
     * @tc.name testLruCacheProperties012
     * @tc.desc Merged batch (5 tests): [1] Verify length grows to eight when continuing puts after expanding capacity to twenty | [2] Verify removing then refilling a full capacity five cache and one extra put ev...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheProperties012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify length grows to eight when continuing puts after expanding capacity to twenty ---
      {
        let c: util.LRUCache<string, string> = new util.LRUCache<string, string>(6);
        c.put('a', '1');
        c.put('b', '2');
        c.put('c', '3');
        c.updateCapacity(20);
        expect(c.length).assertEqual(3);
        c.put('d', '4');
        c.put('e', '5');
        c.put('f', '6');
        c.put('g', '7');
        c.put('h', '8');
        expect(c.length).assertEqual(8);
        expect(c.keys().length).assertEqual(8);
      }

      // --- [2] Verify removing then refilling a full capacity five cache and one extra put evicts the oldest key ---
      {
        let c: util.LRUCache<string, string> = new util.LRUCache<string, string>(5);
        c.put('a', '1');
        c.put('b', '2');
        c.put('c', '3');
        c.put('d', '4');
        c.put('e', '5');
        c.remove('b');
        c.put('f', '6');
        c.put('g', '7');
        expect(c.length).assertEqual(5);
        expect(c.contains('g')).assertTrue();
        expect(c.contains('a')).assertFalse();
      }

      // --- [3] Verify repeated values and keys length reads keep length unchanged at four ---
      {
        let c: util.LRUCache<string, string> = new util.LRUCache<string, string>(6);
        c.put('a', '1');
        c.put('b', '2');
        c.put('c', '3');
        c.put('d', '4');
        let firstValues: int = c.values().length;
        let secondValues: int = c.values().length;
        let firstKeys: int = c.keys().length;
        let secondKeys: int = c.keys().length;
        expect(firstValues).assertEqual(secondValues);
        expect(firstKeys).assertEqual(secondKeys);
        expect(c.length).assertEqual(4);
      }

      // --- [4] Verify length unchanged when shrinking above current length ---
      {
        let c: util.LRUCache<string, string> = new util.LRUCache<string, string>(4);
        c.put('a', '1');
        c.put('b', '2');
        c.updateCapacity(3);
        expect(c.length).assertEqual(2);
      }

      // --- [5] Verify length five after removing five of ten entries and stored values stay intact ---
      {
        let c: util.LRUCache<string, string> = new util.LRUCache<string, string>(10);
        c.put('a', '1');
        c.put('b', '2');
        c.put('c', '3');
        c.put('d', '4');
        c.put('e', '5');
        c.put('f', '6');
        c.put('g', '7');
        c.put('h', '8');
        c.put('i', '9');
        c.put('j', '10');
        c.remove('b');
        c.remove('d');
        c.remove('f');
        c.remove('h');
        c.remove('j');
        expect(c.length).assertEqual(5);
        expect(c.keys().length).assertEqual(5);
        expect(c.get('e')).assertEqual('5');
        expect(c.get('g')).assertEqual('7');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PROPERTIES_0130
     * @tc.name testLruCacheProperties013
     * @tc.desc Merged batch (5 tests): [1] Verify length unchanged after updateCapacity to int max | [2] Verify reading length keeps get returning original value | [3] Verify reading length keeps contains true | ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheProperties013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify length unchanged after updateCapacity to int max ---
      {
        let c: util.LRUCache<string, string> = new util.LRUCache<string, string>(3);
        c.put('a', '1');
        c.updateCapacity(2147483647);
        expect(c.length).assertEqual(1);
      }

      // --- [2] Verify reading length keeps get returning original value ---
      {
        let c: util.LRUCache<string, string> = new util.LRUCache<string, string>(4);
        c.put('a', 'hello');
        expect(c.length).assertEqual(1);
        expect(c.get('a')).assertEqual('hello');
      }

      // --- [3] Verify reading length keeps contains true ---
      {
        let c: util.LRUCache<string, string> = new util.LRUCache<string, string>(4);
        c.put('a', '1');
        expect(c.length).assertEqual(1);
        expect(c.contains('a')).assertTrue();
      }

      // --- [4] Verify reading length leaves removal count at zero ---
      {
        let c: util.LRUCache<string, string> = new util.LRUCache<string, string>(4);
        c.put('a', '1');
        expect(c.length).assertEqual(1);
        expect(c.getRemovalCount()).assertEqual(0);
      }

      // --- [5] Verify reading length leaves match count at zero ---
      {
        let c: util.LRUCache<string, string> = new util.LRUCache<string, string>(4);
        c.put('a', '1');
        expect(c.length).assertEqual(1);
        expect(c.getMatchCount()).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PROPERTIES_0140
     * @tc.name testLruCacheProperties014
     * @tc.desc Merged batch (5 tests): [1] Verify reading length leaves put count at one | [2] Verify reading length leaves miss count at one after absent get | [3] Verify getCapacity follows expand then shrink b...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheProperties014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify reading length leaves put count at one ---
      {
        let c: util.LRUCache<string, string> = new util.LRUCache<string, string>(4);
        c.put('a', '1');
        expect(c.length).assertEqual(1);
        expect(c.getPutCount()).assertEqual(1);
      }

      // --- [2] Verify reading length leaves miss count at one after absent get ---
      {
        let c: util.LRUCache<string, string> = new util.LRUCache<string, string>(4);
        c.get('absent1');
        expect(c.length).assertEqual(0);
        expect(c.getMissCount()).assertEqual(1);
      }

      // --- [3] Verify getCapacity follows expand then shrink back to original while length stays two ---
      {
        let c: util.LRUCache<string, string> = new util.LRUCache<string, string>(10);
        c.put('a', '1');
        c.put('b', '2');
        expect(c.getCapacity()).assertEqual(10);
        c.updateCapacity(30);
        expect(c.getCapacity()).assertEqual(30);
        expect(c.length).assertEqual(2);
        c.updateCapacity(10);
        expect(c.getCapacity()).assertEqual(10);
        expect(c.length).assertEqual(2);
      }

      // --- [4] Verify length equals values array length ---
      {
        let c: util.LRUCache<string, string> = new util.LRUCache<string, string>(4);
        c.put('a', '1');
        c.put('b', '2');
        expect(c.length).assertEqual(c.values().length);
      }

      // --- [5] Verify length equals keys array length ---
      {
        let c: util.LRUCache<string, string> = new util.LRUCache<string, string>(4);
        c.put('a', '1');
        c.put('b', '2');
        expect(c.length).assertEqual(c.keys().length);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PROPERTIES_0150
     * @tc.name testLruCacheProperties015
     * @tc.desc Merged batch (5 tests): [1] Verify length equals number of entries yielded by iterator | [2] Verify after eviction length syncs keys length at capacity | [3] Verify empty cache length and values le...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheProperties015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify length equals number of entries yielded by iterator ---
      {
        let c: util.LRUCache<string, string> = new util.LRUCache<string, string>(4);
        c.put('a', '1');
        c.put('b', '2');
        let count: int = 0;
        let iter: IterableIterator<[string, string]> = c.entries();
        while (!iter.next().done) {
          count++;
        }
        expect(c.length).assertEqual(count);
      }

      // --- [2] Verify after eviction length syncs keys length at capacity ---
      {
        let c: util.LRUCache<string, string> = new util.LRUCache<string, string>(3);
        c.put('a', '1');
        c.put('b', '2');
        c.put('c', '3');
        c.put('d', '4');
        expect(c.length).assertEqual(c.keys().length);
        expect(c.length).assertEqual(3);
      }

      // --- [3] Verify empty cache length and values length both zero ---
      {
        let c: util.LRUCache<string, string> = new util.LRUCache<string, string>(4);
        expect(c.length).assertEqual(0);
        expect(c.values().length).assertEqual(0);
      }

      // --- [4] Verify remove keeps length equal to entries iterator count ---
      {
        let c: util.LRUCache<string, string> = new util.LRUCache<string, string>(4);
        c.put('a', '1');
        c.put('b', '2');
        c.remove('a');
        let count: int = 0;
        let iter: IterableIterator<[string, string]> = c.entries();
        while (!iter.next().done) {
          count++;
        }
        expect(c.length).assertEqual(count);
      }

      // --- [5] Verify length 1 and capacity 4 after one put ---
      {
        let c: util.LRUCache<string, string> = new util.LRUCache<string, string>(4);
        c.put('a', '1');
        expect(c.length).assertEqual(1);
        expect(c.getCapacity()).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PROPERTIES_0160
     * @tc.name testLruCacheProperties016
     * @tc.desc Merged batch (5 tests): [1] Verify length is integer equal to its floor value | [2] Verify full cache length equals capacity | [3] Verify length three for string boolean instance | [4] Verify long ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheProperties016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify length is integer equal to its floor value ---
      {
        let c: util.LRUCache<string, string> = new util.LRUCache<string, string>(4);
        c.put('a', '1');
        expect(c.length).assertEqual(Math.floor(c.length));
      }

      // --- [2] Verify full cache length equals capacity ---
      {
        let c: util.LRUCache<string, string> = new util.LRUCache<string, string>(3);
        c.put('a', '1');
        c.put('b', '2');
        c.put('c', '3');
        expect(c.length).assertEqual(c.getCapacity());
      }

      // --- [3] Verify length three for string boolean instance ---
      {
        let c: util.LRUCache<string, boolean> = new util.LRUCache<string, boolean>(4);
        c.put('a', true);
        c.put('b', false);
        c.put('c', true);
        expect(c.length).assertEqual(3);
      }

      // --- [4] Verify long read write remove sequence keeps length correct ---
      {
        let c: util.LRUCache<string, string> = new util.LRUCache<string, string>(6);
        c.put('a', '1');
        c.get('a');
        c.put('b', '2');
        c.put('c', '3');
        c.remove('b');
        c.put('d', '4');
        expect(c.length).assertEqual(3);
      }

      // --- [5] Verify iterator count equals length five after remove then put on full capacity five cache ---
      {
        let c: util.LRUCache<string, string> = new util.LRUCache<string, string>(5);
        c.put('a', '1');
        c.put('b', '2');
        c.put('c', '3');
        c.put('d', '4');
        c.put('e', '5');
        c.remove('c');
        c.put('f', '6');
        let count: int = 0;
        let iter: IterableIterator<[string, string]> = c.entries();
        while (!iter.next().done) {
          count++;
        }
        expect(count).assertEqual(5);
        expect(c.length).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PROPERTIES_0170
     * @tc.name testLruCacheProperties017
     * @tc.desc Merged batch (5 tests): [1] Verify eviction mixed with manual remove length reflects survivors | [2] Verify get hit reordering leaves full length unchanged | [3] Verify get miss with default undefi...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheProperties017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify eviction mixed with manual remove length reflects survivors ---
      {
        let c: util.LRUCache<string, string> = new util.LRUCache<string, string>(3);
        c.put('a', '1');
        c.put('b', '2');
        c.put('c', '3');
        c.put('d', '4');
        c.remove('b');
        expect(c.length).assertEqual(2);
      }

      // --- [2] Verify get hit reordering leaves full length unchanged ---
      {
        let c: util.LRUCache<string, string> = new util.LRUCache<string, string>(2);
        c.put('a', '1');
        c.put('b', '2');
        c.get('a');
        expect(c.length).assertEqual(2);
      }

      // --- [3] Verify get miss with default undefined createDefault keeps length zero ---
      {
        let c: util.LRUCache<string, string> = new util.LRUCache<string, string>(4);
        c.get('absent1');
        expect(c.length).assertEqual(0);
      }

      // --- [4] Verify createDefault inserts only on miss and a repeated hit keeps length unchanged ---
      {
        let c: ProbeCache<string, string> = new ProbeCache<string, string>(
          undefined, (key: string) => 'fallback', 2
        );
        c.get('absent1');
        expect(c.length).assertEqual(1);
        c.get('absent1');
        expect(c.length).assertEqual(1);
        c.get('absent2');
        expect(c.length).assertEqual(2);
        expect(c.keys().length).assertEqual(2);
      }

      // --- [5] Verify undefined createDefault leaves length at three after repeated absent gets ---
      {
        let c: ProbeCache<string, string> = new ProbeCache<string, string>(
          undefined, (key: string) => undefined, 6
        );
        c.put('a', '1');
        c.put('b', '2');
        c.put('c', '3');
        c.get('ghost1');
        c.get('ghost2');
        c.get('ghost3');
        expect(c.length).assertEqual(3);
        expect(c.values().length).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_PROPERTIES_0180
     * @tc.name testLruCacheProperties018
     * @tc.desc Merged batch (4 tests): [1] Verify length follows a grow then shrink sequence that evicts the oldest entry | [2] Verify length counts enum member keys as distinct slots when one member is overwritt...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheProperties018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify length follows a grow then shrink sequence that evicts the oldest entry ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.updateCapacity(4);
        cache.put(3, 30);
        expect(cache.length).assertEqual(3);
        cache.updateCapacity(2);
        expect(cache.length).assertEqual(2);
      }

      // --- [2] Verify length counts enum member keys as distinct slots when one member is overwritten then removed ---
      {
        let cache: util.LRUCache<PropSlot, int> = new util.LRUCache<PropSlot, int>();
        cache.put(PropSlot.First, 1);
        cache.put(PropSlot.Second, 2);
        cache.put(PropSlot.First, 3);
        expect(cache.length).assertEqual(2);
        expect(cache.remove(PropSlot.Second)).assertEqual(2);
        expect(cache.length).assertEqual(1);
      }

      // --- [3] Verify length decreases by one when the NUL character key is removed leaving the 0xFFFF key ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('\u0000', 0);
        cache.put('\uFFFF', 1);
        expect(cache.length).assertEqual(2);
        expect(cache.remove('\u0000')).assertEqual(0);
        expect(cache.length).assertEqual(1);
      }

      // --- [4] Verify nested LRUCache value length is read through the outer cache and tracks the inner cache ---
      {
        let inner: util.LRUCache<int, int> = new util.LRUCache<int, int>(5);
        inner.put(1, 10);
        inner.put(2, 20);
        let outer: util.LRUCache<string, util.LRUCache<int, int>> = new util.LRUCache<string, util.LRUCache<int, int>>(3);
        outer.put('bag', inner);
        expect(outer.length).assertEqual(1);
        expect(outer.get('bag')!.length).assertEqual(2);
        inner.put(3, 30);
        expect(outer.get('bag')!.length).assertEqual(3);
        expect(outer.length).assertEqual(1);
      }
    });

  });
}
