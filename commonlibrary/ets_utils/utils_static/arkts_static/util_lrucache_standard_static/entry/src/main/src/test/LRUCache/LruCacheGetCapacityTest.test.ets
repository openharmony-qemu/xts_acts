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

class CountingCapCache<K, V> extends util.LRUCache<K, V> {
  callCount: int = 0;
  getCapacity(): int {
    this.callCount = this.callCount + 1;
    return super.getCapacity();
  }
}

class InheritCapCache<K, V> extends util.LRUCache<K, V> {
  constructor() {
    super();
  }
}

class RefValue {
  tag: string = 'rv';
}

interface LabeledKey {
  id: int;
  label: string;
}

export default function lruCacheGetCapacityTest(): void {
  describe('LruCacheGetCapacityTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CAPACITY_0010
     * @tc.name testLruCacheGetCapacity001
     * @tc.desc Merged batch (5 tests): [1] Verify getCapacity on a default cache returns 64 whether invoked on a declared instance or a fresh object expression | [2] Verify getCapacity on an empty subclass instan...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCapacity001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify getCapacity on a default cache returns 64 whether invoked on a declared instance or a fresh object expression ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        expect(lru.getCapacity()).assertEqual(64);
      }

      // --- [2] Verify getCapacity on an empty subclass instance inherits the default capacity 64 ---
      {
        let sub: util.LRUCache<int, int> = new InheritCapCache<int, int>();
        expect(sub.getCapacity()).assertEqual(64);
        expect(sub.length).assertEqual(0);
      }

      // --- [3] Verify getCapacity on an overriding subclass returns the default capacity 64 and the override call is counted once ---
      {
        let lru: CountingCapCache<int, int> = new CountingCapCache<int, int>();
        expect(lru.getCapacity()).assertEqual(64);
        expect(lru.callCount).assertEqual(1);
      }

      // --- [4] Verify getCapacity after put leaves key set unaffected with key still present ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(7, 700);
        lru.getCapacity();
        expect(lru.length).assertEqual(1);
        expect(lru.contains(7)).assertTrue();
        expect(lru.get(7)).assertEqual(700);
      }

      // --- [5] Verify getCapacity at full capacity returns the original capacity 64 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 0; i < 64; i++) {
          lru.put(i, i * 10);
        }
        expect(lru.getCapacity()).assertEqual(64);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CAPACITY_0020
     * @tc.name testLruCacheGetCapacity002
     * @tc.desc Merged batch (5 tests): [1] Verify getCapacity after eviction triggered by overfill returns the original capacity 64 | [2] Verify getCapacity after clear returns the original capacity 64 | [3] Veri...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCapacity002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify getCapacity after eviction triggered by overfill returns the original capacity 64 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 0; i < 70; i++) {
          lru.put(i, i * 2);
        }
        expect(lru.length).assertEqual(64);
        expect(lru.contains(0)).assertFalse();
        expect(lru.contains(69)).assertTrue();
        expect(lru.getCapacity()).assertEqual(64);
      }

      // --- [2] Verify getCapacity after clear returns the original capacity 64 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.clear();
        expect(lru.getCapacity()).assertEqual(64);
      }

      // --- [3] Verify getCapacity after remove returns the original capacity 64 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.remove(1);
        expect(lru.getCapacity()).assertEqual(64);
      }

      // --- [4] Verify getCapacity on empty cache keeps isEmpty true ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.getCapacity();
        expect(lru.isEmpty()).assertTrue();
      }

      // --- [5] Verify getCapacity return value 64 is arithmetic-capable: 64+1=65, 64-1=63, 64*2=128, 64/4=16 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        expect(lru.getCapacity() + 1).assertEqual(65);
        expect(lru.getCapacity() - 1).assertEqual(63);
        expect(lru.getCapacity() * 2).assertEqual(128);
        expect(lru.getCapacity() / 4).assertEqual(16);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CAPACITY_0030
     * @tc.name testLruCacheGetCapacity003
     * @tc.desc Merged batch (5 tests): [1] Verify getCapacity as loop upper bound runs 64 iterations | [2] Verify getCapacity returns 1 for cache constructed with capacity 1 | [3] Verify getCapacity reads hexadec...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCapacity003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify getCapacity as loop upper bound runs 64 iterations ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let cap: int = lru.getCapacity();
        let cnt: int = 0;
        for (let i: int = 0; i < cap; i++) {
          cnt = cnt + 1;
        }
        expect(cnt).assertEqual(64);
      }

      // --- [2] Verify getCapacity returns 1 for cache constructed with capacity 1 ---
      {
        let lru: util.LRUCache<int, string> = new util.LRUCache<int, string>(1);
        let cap: int = lru.getCapacity();
        expect(cap).assertEqual(1);
      }

      // --- [3] Verify getCapacity reads hexadecimal 0x10 as 16 and decimal 10 as 10 ---
      {
        let lruHex: util.LRUCache<int, int> = new util.LRUCache<int, int>(0x10);
        let lruDec: util.LRUCache<int, int> = new util.LRUCache<int, int>(10);
        expect(lruHex.getCapacity()).assertEqual(16);
        expect(lruDec.getCapacity()).assertEqual(10);
      }

      // --- [4] Verify getCapacity returns 2147483647 for cache constructed at the upper boundary ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(2147483647);
        let cap: int = lru.getCapacity();
        expect(cap).assertEqual(2147483647);
      }

      // --- [5] Verify getCapacity returns 8 for cache constructed with byte value 8 ---
      {
        let b: byte = 8;
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(b);
        let cap: int = lru.getCapacity();
        expect(cap).assertEqual(8);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CAPACITY_0040
     * @tc.name testLruCacheGetCapacity004
     * @tc.desc Merged batch (5 tests): [1] Verify getCapacity returns 22 for cache constructed with short value 22 | [2] Verify getCapacity returns 40 for cache constructed with long value 40 converted to int | [...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCapacity004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify getCapacity returns 22 for cache constructed with short value 22 ---
      {
        let s: short = 22;
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(s);
        let cap: int = lru.getCapacity();
        expect(cap).assertEqual(22);
      }

      // --- [2] Verify getCapacity returns 40 for cache constructed with long value 40 converted to int ---
      {
        let lg: long = Int.toLong(40);
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(Long.toInt(lg));
        let cap: int = lru.getCapacity();
        expect(cap).assertEqual(40);
      }

      // --- [3] Verify getCapacity stays 1 after capacity 1 cache overflows with two keys ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        lru.put(1, 100);
        lru.put(2, 200);
        expect(lru.getCapacity()).assertEqual(1);
      }

      // --- [4] Verify getCapacity returns 30 for cache constructed with int variable 30 ---
      {
        let v: int = 30;
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(v);
        expect(lru.getCapacity()).assertEqual(30);
      }

      // --- [5] Verify getCapacity returns 28 for cache constructed with arithmetic expression 20 + 8 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(20 + 8);
        expect(lru.getCapacity()).assertEqual(28);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CAPACITY_0050
     * @tc.name testLruCacheGetCapacity005
     * @tc.desc Merged batch (5 tests): [1] Verify constructing with negative capacity -3 is rejected and throws BusinessError | [2] Verify getCapacity returns 32 after capacity updated with hexadecimal literal 0x...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCapacity005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify constructing with negative capacity -3 is rejected and throws BusinessError ---
      {
        try {
          new util.LRUCache<int, int>(-3);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
      }

      // --- [2] Verify getCapacity returns 32 after capacity updated with hexadecimal literal 0x20 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.updateCapacity(0x20);
        expect(lru.getCapacity()).assertEqual(32);
      }

      // --- [3] Verify getCapacity returns 24 after a full capacity 16 cache grows while keeping all 16 entries ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(16);
        for (let i: int = 0; i < 16; i++) {
          lru.put(i, i * 10);
        }
        lru.updateCapacity(24);
        expect(lru.getCapacity()).assertEqual(24);
        expect(lru.length).assertEqual(16);
        expect(lru.get(0)).assertEqual(0);
      }

      // --- [4] Verify getCapacity reports each successive capacity change as it is applied ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.updateCapacity(15);
        expect(lru.getCapacity()).assertEqual(15);
        lru.updateCapacity(7);
        expect(lru.getCapacity()).assertEqual(7);
        lru.updateCapacity(21);
        expect(lru.getCapacity()).assertEqual(21);
      }

      // --- [5] Verify getCapacity stays 20 after shrinking the default capacity to 20 and inserting a new key ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.updateCapacity(20);
        lru.put(5, 50);
        expect(lru.getCapacity()).assertEqual(20);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CAPACITY_0060
     * @tc.name testLruCacheGetCapacity006
     * @tc.desc Merged batch (5 tests): [1] Verify getCapacity returns 1 after three-entry cache shrinks to 1 | [2] Verify getCapacity stays 33 after shrinking the default capacity to 33 and inserting keys beyond ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCapacity006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify getCapacity returns 1 after three-entry cache shrinks to 1 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 10);
        lru.put(2, 20);
        lru.put(3, 30);
        lru.updateCapacity(1);
        expect(lru.getCapacity()).assertEqual(1);
      }

      // --- [2] Verify getCapacity stays 33 after shrinking the default capacity to 33 and inserting keys beyond capacity ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.updateCapacity(33);
        for (let i: int = 0; i < 40; i++) {
          lru.put(i, i);
        }
        expect(lru.getCapacity()).assertEqual(33);
      }

      // --- [3] Verify getCapacity returns 14 after capacity updated with byte value 14 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let b: byte = 14;
        lru.updateCapacity(b);
        expect(lru.getCapacity()).assertEqual(14);
      }

      // --- [4] Verify getCapacity returns 26 after capacity updated with short value 26 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let s: short = 26;
        lru.updateCapacity(s);
        expect(lru.getCapacity()).assertEqual(26);
      }

      // --- [5] Verify getCapacity returns 18 after capacity updated with long value 18 converted to int ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let lg: long = Int.toLong(18);
        lru.updateCapacity(Long.toInt(lg));
        expect(lru.getCapacity()).assertEqual(18);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CAPACITY_0070
     * @tc.name testLruCacheGetCapacity007
     * @tc.desc Merged batch (5 tests): [1] Verify getCapacity stays 17 after updating to the equal capacity 17 | [2] Verify negative capacity -2 update throws and getCapacity keeps the original value 11 | [3] Ver...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCapacity007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify getCapacity stays 17 after updating to the equal capacity 17 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(17);
        lru.put(1, 100);
        lru.updateCapacity(17);
        expect(lru.getCapacity()).assertEqual(17);
      }

      // --- [2] Verify negative capacity -2 update throws and getCapacity keeps the original value 11 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(11);
        try {
          lru.updateCapacity(-2);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
        expect(lru.getCapacity()).assertEqual(11);
      }

      // --- [3] Verify getCapacity returns int max after small cache grows to 2147483647 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        lru.updateCapacity(2147483647);
        expect(lru.getCapacity()).assertEqual(2147483647);
      }

      // --- [4] Verify a string string cache fills all 64 default slots and evicts the earliest key only when a 65th distinct key is inserted ---
      {
        let lru: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        let cap: int = lru.getCapacity();
        for (let i: int = 0; i < cap; i++) {
          lru.put('key' + i.toString(), 'value' + i.toString());
        }
        expect(lru.length).assertEqual(cap);
        lru.put('key' + cap.toString(), 'extra');
        expect(lru.length).assertEqual(cap);
        expect(lru.contains('key0')).assertFalse();
        expect(lru.contains('key' + cap.toString())).assertTrue();
      }

      // --- [5] Verify a double string cache matches fractional keys by numeric value so 0.5 and 0.75 occupy distinct slots of the default capacity 64 ---
      {
        let lru: util.LRUCache<double, string> = new util.LRUCache<double, string>();
        let half: double = 0.5;
        lru.put(half, 'half');
        lru.put(half + 0.25, 'three quarters');
        expect(lru.length).assertEqual(2);
        expect(lru.get(0.75)).assertEqual('three quarters');
        expect(lru.get(half)).assertEqual('half');
        expect(lru.getCapacity()).assertEqual(64);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CAPACITY_0080
     * @tc.name testLruCacheGetCapacity008
     * @tc.desc Merged batch (5 tests): [1] Verify a boolean boolean cache holds the keys true and false independently, keeps the overwritten value false, and leaves 62 of the 64 default slots free | [2] Verify a ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCapacity008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a boolean boolean cache holds the keys true and false independently, keeps the overwritten value false, and leaves 62 of the 64 default slots free ---
      {
        let lru: util.LRUCache<boolean, boolean> = new util.LRUCache<boolean, boolean>();
        lru.put(true, false);
        lru.put(false, true);
        expect(lru.length).assertEqual(2);
        expect(lru.get(true)).assertFalse();
        expect(lru.get(false)).assertTrue();

        lru.put(true, true);
        expect(lru.length).assertEqual(2);
        expect(lru.get(true)).assertTrue();

        let remainder: int = lru.getCapacity() - lru.length
        expect(remainder).assertEqual(62);
      }

      // --- [2] Verify a long long cache round-trips the key 2147483648 that exceeds the int upper bound 2147483647 within the default capacity 64 ---
      {
        let lru: util.LRUCache<long, long> = new util.LRUCache<long, long>();
        let beyond: long = Int.toLong(2147483647) + Int.toLong(1);
        lru.put(beyond, beyond);
        expect(lru.get(beyond)).assertEqual(beyond);
        expect(lru.contains(beyond)).assertTrue();
        let cap: int = lru.getCapacity();
        expect(cap).assertEqual(64);
      }

      // --- [3] Verify a double float cache returns the float values 1.5 and -0.25 unchanged and reports the default capacity 64 ---
      {
        let lru: util.LRUCache<double, float> = new util.LRUCache<double, float>();
        let small: float = 1.5 as float;
        let tiny: float = -0.25 as float;
        lru.put(0.5, small);
        lru.put(2.5, tiny);
        expect(lru.get(0.5)).assertEqual(small);
        expect(lru.get(2.5)).assertEqual(tiny);
        expect(lru.isEmpty()).assertFalse();
        expect(lru.getCapacity()).assertEqual(64);
      }

      // --- [4] Verify a bigint bigint cache round-trips the value 9223372036854775807n and returns it as the old value when overwritten by 0n ---
      {
        let lru: util.LRUCache<bigint, bigint> = new util.LRUCache<bigint, bigint>();
        let key: bigint = 7n;
        let huge: bigint = 9223372036854775807n;
        lru.put(key, huge);
        expect(lru.get(key)).assertEqual(huge);
        expect(lru.put(key, 0n)).assertEqual(huge);
        expect(lru.length).assertEqual(1);
        expect(lru.getCapacity()).assertEqual(64);
      }

      // --- [5] Verify a byte short cache stores the minimum byte key -128 with the maximum short value 32767 and remove returns that value ---
      {
        let lru: util.LRUCache<byte, short> = new util.LRUCache<byte, short>();
        let lowKey: byte = Int.toByte(-128);
        let highValue: short = Int.toShort(32767);
        lru.put(lowKey, highValue);
        expect(lru.contains(lowKey)).assertTrue();
        expect(lru.remove(lowKey)).assertEqual(highValue);
        expect(lru.isEmpty()).assertTrue();
        expect(lru.getCapacity()).assertEqual(64);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CAPACITY_0090
     * @tc.name testLruCacheGetCapacity009
     * @tc.desc Merged batch (5 tests): [1] Verify a Date Date cache matches keys by reference while a string Date cache holding the same Date returns the same milliseconds, both at the default capacity 64 | [2] V...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCapacity009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a Date Date cache matches keys by reference while a string Date cache holding the same Date returns the same milliseconds, both at the default capacity 64 ---
      {
        let lru: util.LRUCache<Date, Date> = new util.LRUCache<Date, Date>();
        let created: Date = new Date(1000);
        let updated: Date = new Date(2000);
        lru.put(created, updated);
        let byName: util.LRUCache<string, Date> = new util.LRUCache<string, Date>();
        byName.put('created', updated);
        expect(lru.contains(new Date(1000))).assertFalse();
        expect(lru.get(created)!.getTime()).assertEqual(byName.get('created')!.getTime());
        expect(lru.get(created)!.getTime()).assertEqual(2000);
        expect(lru.getCapacity()).assertEqual(64);
        expect(byName.getCapacity()).assertEqual(64);
      }

      // --- [2] Verify a RegExp Error cache stores a pattern key mapping to an Error with message boom and reports 64 on two consecutive getCapacity calls ---
      {
        let lru: util.LRUCache<RegExp, Error> = new util.LRUCache<RegExp, Error>();
        let pattern: RegExp = new RegExp('ab+c');
        let failure: Error = new Error('boom');
        lru.put(pattern, failure);
        expect(lru.contains(pattern)).assertTrue();
        expect(lru.get(pattern)!.message).assertEqual('boom');
        let first: int = lru.getCapacity();
        let second: int = lru.getCapacity();
        expect(first).assertEqual(64);
        expect(second).assertEqual(64);
      }

      // --- [3] Verify a LabeledKey object used as a key returns the string that also keys a RefValue cache holding the same shared RefValue, both at the default capacity 64 ---
      {
        let tag: LabeledKey = { id: 7, label: 'seven' };
        let shared: RefValue = new RefValue();
        let lru: util.LRUCache<string, RefValue> = new util.LRUCache<string, RefValue>();
        lru.put(tag.label, shared);
        let keyed: util.LRUCache<LabeledKey, string> = new util.LRUCache<LabeledKey, string>();
        keyed.put(tag, tag.label);
        expect(lru.get(tag.label)).assertEqual(shared);
        expect(keyed.get(tag)).assertEqual('seven');
        expect(lru.get(keyed.get(tag)!)).assertEqual(shared);
        expect(lru.getCapacity()).assertEqual(64);
        expect(keyed.getCapacity()).assertEqual(64);
      }

      // --- [4] Verify an int array key built from a Record value round-trips through get and remove while the Record<string,int> key is read back, both at the default capacity 64 ---
      {
        let nums: int[] = [1, 2, 3];
        let meta: Record<string, int> = { 'a': nums.length };
        let lru: util.LRUCache<int[], string> = new util.LRUCache<int[], string>();
        lru.put(nums, 'nums');
        let rec: util.LRUCache<Record<string, int>, string> = new util.LRUCache<Record<string, int>, string>();
        rec.put(meta, 'record');
        expect(lru.get(nums)).assertEqual('nums');
        expect(rec.get(meta)).assertEqual('record');
        expect(lru.remove(nums)).assertEqual('nums');
        expect(lru.getCapacity()).assertEqual(64);
        expect(rec.getCapacity()).assertEqual(64);
      }

      // --- [5] Verify a Set derived from a Map is stored under the Map key and an Int32Array built from both sizes is stored under itself, each cache at the default capacity 64 ---
      {
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        let s: Set<int> = new Set<int>();
        s.add(m.get('a')!);
        let lru: util.LRUCache<Map<string, int>, Set<int>> = new util.LRUCache<Map<string, int>, Set<int>>();
        lru.put(m, s);
        let ia: Int32Array = new Int32Array([s.size, m.size]);
        let typed: util.LRUCache<Int32Array, Int32Array> = new util.LRUCache<Int32Array, Int32Array>();
        typed.put(ia, ia);
        expect(lru.get(m)!.has(1)).assertTrue();
        expect(typed.get(ia)![0]).assertEqual(1);
        expect(lru.getCapacity()).assertEqual(64);
        expect(typed.getCapacity()).assertEqual(64);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CAPACITY_0100
     * @tc.name testLruCacheGetCapacity010
     * @tc.desc Merged batch (5 tests): [1] Verify getCapacity return value floored by Math.floor equals the original value | [2] Verify getCapacity return value divided by 2 follows numeric arithmetic path | [3] ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCapacity010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify getCapacity return value floored by Math.floor equals the original value ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        expect(Math.floor(lru.getCapacity())).assertEqual(64);
      }

      // --- [2] Verify getCapacity return value divided by 2 follows numeric arithmetic path ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        expect(lru.getCapacity() / 2).assertEqual(32);
      }

      // --- [3] Verify getCapacity return value bitwise OR 0 keeps the original value ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        expect(lru.getCapacity() | 0).assertEqual(64);
      }

      // --- [4] Verify String conversion of getCapacity return value yields '64' ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let cap: int = lru.getCapacity();
        expect(String(cap)).assertEqual('64');
      }

      // --- [5] Verify two consecutive getCapacity calls after updateCapacity read the same value ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.updateCapacity(100);
        let first: int = lru.getCapacity();
        let second: int = lru.getCapacity();
        expect(first).assertEqual(second);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CAPACITY_0110
     * @tc.name testLruCacheGetCapacity011
     * @tc.desc Merged batch (5 tests): [1] Verify getCapacity and length stay 4 when an existing key is overwritten at full capacity | [2] Verify length 3 and capacity 8 after capacity 8 cache holds 3 entries | [...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCapacity011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify getCapacity and length stay 4 when an existing key is overwritten at full capacity ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(4);
        for (let i: int = 0; i < 4; i++) {
          lru.put(i, i * 10);
        }
        lru.put(1, 999);
        expect(lru.getCapacity()).assertEqual(4);
        expect(lru.length).assertEqual(4);
        expect(lru.get(1)).assertEqual(999);
      }

      // --- [2] Verify length 3 and capacity 8 after capacity 8 cache holds 3 entries ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(8);
        for (let i: int = 0; i < 3; i++) {
          lru.put(i, i * 10);
        }
        expect(lru.length).assertEqual(3);
        expect(lru.getCapacity()).assertEqual(8);
      }

      // --- [3] Verify getCapacity equals length after default cache is filled with 64 entries ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 0; i < 64; i++) {
          lru.put(i, i * 10);
        }
        expect(lru.getCapacity()).assertEqual(lru.length);
      }

      // --- [4] Verify length equals getCapacity after five entries shrink to capacity 2 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 1; i <= 5; i++) {
          lru.put(i, i * 10);
        }
        lru.updateCapacity(2);
        expect(lru.length).assertEqual(lru.getCapacity());
      }

      // --- [5] Verify length equals getCapacity after 100 entries shrink to capacity 50 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 0; i < 100; i++) {
          lru.put(i, i * 10);
        }
        lru.updateCapacity(50);
        expect(lru.length).assertEqual(lru.getCapacity());
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CAPACITY_0120
     * @tc.name testLruCacheGetCapacity012
     * @tc.desc Merged batch (5 tests): [1] Verify length equals getCapacity after capacity 3 cache overflows with 10 entries | [2] Verify length stays 63 and capacity is 64 after 63 entries | [3] Verify length eq...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCapacity012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify length equals getCapacity after capacity 3 cache overflows with 10 entries ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        for (let i: int = 0; i < 10; i++) {
          lru.put(i, i * 10);
        }
        expect(lru.length).assertEqual(lru.getCapacity());
      }

      // --- [2] Verify length stays 63 and capacity is 64 after 63 entries ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 0; i < 63; i++) {
          lru.put(i, i * 10);
        }
        expect(lru.length).assertEqual(63);
        expect(lru.getCapacity()).assertEqual(64);
      }

      // --- [3] Verify length equals getCapacity after three entries shrink to capacity 1 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.put(2, 200);
        lru.put(3, 300);
        lru.updateCapacity(1);
        expect(lru.length).assertEqual(lru.getCapacity());
      }

      // --- [4] Verify get of an existing key after getCapacity returns the original value ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.getCapacity();
        expect(lru.get(1)).assertEqual(100);
      }

      // --- [5] Verify keys order keeps the first key unchanged after getCapacity call ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(10, 1);
        lru.put(20, 2);
        lru.getCapacity();
        let ks: int[] = lru.keys();
        expect(ks[0]).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CAPACITY_0130
     * @tc.name testLruCacheGetCapacity013
     * @tc.desc Merged batch (5 tests): [1] Verify values content keeps the first value unchanged after getCapacity call | [2] Verify toString hits count stays unchanged after getCapacity call | [3] Verify three c...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCapacity013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify values content keeps the first value unchanged after getCapacity call ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.put(2, 200);
        lru.getCapacity();
        let vs: int[] = lru.values();
        expect(vs[0]).assertEqual(100);
      }

      // --- [2] Verify toString hits count stays unchanged after getCapacity call ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.get(1);
        lru.getCapacity();
        expect(lru.toString().includes('hits = 1')).assertTrue();
      }

      // --- [3] Verify three consecutive getCapacity calls all return 64 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let a: int = lru.getCapacity();
        let b: int = lru.getCapacity();
        let c: int = lru.getCapacity();
        expect(a).assertEqual(64);
        expect(b).assertEqual(64);
        expect(c).assertEqual(64);
      }

      // --- [4] Verify put overwriting an existing key after getCapacity returns the original value ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.getCapacity();
        expect(lru.put(1, 200)).assertEqual(100);
      }

      // --- [5] Verify remove still works after getCapacity call making key absent ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.getCapacity();
        lru.remove(1);
        expect(lru.contains(1)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CAPACITY_0140
     * @tc.name testLruCacheGetCapacity014
     * @tc.desc Merged batch (5 tests): [1] Verify clear still works after getCapacity call making length 0 | [2] Verify isEmpty stays false after getCapacity call on a non-empty cache | [3] Verify updateCapacity ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCapacity014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify clear still works after getCapacity call making length 0 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.getCapacity();
        lru.clear();
        expect(lru.length).assertEqual(0);
      }

      // --- [2] Verify isEmpty stays false after getCapacity call on a non-empty cache ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.getCapacity();
        expect(lru.isEmpty()).assertFalse();
      }

      // --- [3] Verify updateCapacity after getCapacity call reflects the new capacity ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.getCapacity();
        lru.updateCapacity(48);
        expect(lru.getCapacity()).assertEqual(48);
      }

      // --- [4] Verify getPutCount keeps accumulating after getCapacity call ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.getCapacity();
        lru.put(2, 200);
        expect(lru.getPutCount()).assertEqual(2);
      }

      // --- [5] Verify getCapacity returns the same value before and after writing a key ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(16);
        let before: int = lru.getCapacity();
        lru.put(1, 100);
        expect(lru.getCapacity()).assertEqual(before);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CAPACITY_0150
     * @tc.name testLruCacheGetCapacity015
     * @tc.desc Merged batch (5 tests): [1] Verify saved capacity variable is not changed by a later updateCapacity | [2] Verify two same-capacity instances return equal getCapacity values | [3] Verify two differe...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCapacity015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify saved capacity variable is not changed by a later updateCapacity ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let saved: int = lru.getCapacity();
        lru.updateCapacity(128);
        expect(saved).assertEqual(64);
      }

      // --- [2] Verify two same-capacity instances return equal getCapacity values ---
      {
        let a: util.LRUCache<int, int> = new util.LRUCache<int, int>(32);
        let b: util.LRUCache<int, int> = new util.LRUCache<int, int>(32);
        expect(a.getCapacity()).assertEqual(b.getCapacity());
      }

      // --- [3] Verify two different-capacity instances each return their configured capacity ---
      {
        let a: util.LRUCache<int, int> = new util.LRUCache<int, int>(128);
        let b: util.LRUCache<int, int> = new util.LRUCache<int, int>(64);
        expect(a.getCapacity()).assertEqual(128);
        expect(b.getCapacity()).assertEqual(64);
      }

      // --- [4] Verify updating instance A capacity does not affect instance B getCapacity ---
      {
        let a: util.LRUCache<int, int> = new util.LRUCache<int, int>(32);
        let b: util.LRUCache<int, int> = new util.LRUCache<int, int>(32);
        a.updateCapacity(100);
        expect(a.getCapacity()).assertEqual(100);
        expect(b.getCapacity()).assertEqual(32);
      }

      // --- [5] Verify LRUCache with int boolean types and capacity 16 returns 16 ---
      {
        let lru: util.LRUCache<int, boolean> = new util.LRUCache<int, boolean>(16);
        expect(lru.getCapacity()).assertEqual(16);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CAPACITY_0160
     * @tc.name testLruCacheGetCapacity016
     * @tc.desc Merged batch (5 tests): [1] Verify getCapacity as loop upper bound accommodates the equivalent number of entries | [2] Verify toString maxSize matches the getCapacity return value | [3] Verify keys...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCapacity016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify getCapacity as loop upper bound accommodates the equivalent number of entries ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let cap: int = lru.getCapacity();
        for (let i: int = 0; i < cap; i++) {
          lru.put(i, i);
        }
        expect(lru.length).assertEqual(cap);
        expect(lru.get(0)).assertEqual(0);
        expect(lru.get(63)).assertEqual(63);
      }

      // --- [2] Verify toString maxSize matches the getCapacity return value ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(48);
        let cap: int = lru.getCapacity();
        expect(lru.toString().includes('maxSize = ' + cap)).assertTrue();
      }

      // --- [3] Verify keys snapshot taken before getCapacity call is not affected ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        let ks: int[] = lru.keys();
        lru.getCapacity();
        expect(ks.length).assertEqual(1);
        expect(ks.join(',')).assertEqual('1');
      }

      // --- [4] Verify typeof getCapacity and typeof length are identical ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let capType: string = typeof lru.getCapacity();
        let lenType: string = typeof lru.length;
        expect(capType).assertEqual('int');
        expect(lenType).assertEqual('int');
      }

      // --- [5] Verify the getCapacity return value of one cache is usable directly as the constructor capacity of a second cache ---
      {
        let first: util.LRUCache<int, int> = new util.LRUCache<int, int>(200);
        let second: util.LRUCache<int, int> = new util.LRUCache<int, int>(first.getCapacity());
        expect(second.getCapacity()).assertEqual(200);
        expect(second.getCapacity()).assertEqual(first.getCapacity());
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CAPACITY_0170
     * @tc.name testLruCacheGetCapacity017
     * @tc.desc Merged batch (5 tests): [1] Verify lambda getCapacity minus length yields the remaining capacity for empty partial and full caches | [2] Verify lambda getCapacity minus length tracks the configured...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCapacity017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify lambda getCapacity minus length yields the remaining capacity for empty partial and full caches ---
      {
        let remainingOf: (c: util.LRUCache<int, int>) => int = (c: util.LRUCache<int, int>): int => c.getCapacity() - c.length;

        let empty: util.LRUCache<int, int> = new util.LRUCache<int, int>(8);
        expect(remainingOf(empty)).assertEqual(8);
        let partial: util.LRUCache<int, int> = new util.LRUCache<int, int>(8);
        partial.put(1, 10);
        partial.put(2, 20);
        partial.put(3, 30);
        expect(remainingOf(partial)).assertEqual(5);
        let full: util.LRUCache<int, int> = new util.LRUCache<int, int>(4);
        full.put(1, 1);
        full.put(2, 2);
        full.put(3, 3);
        full.put(4, 4);
        expect(remainingOf(full)).assertEqual(0);
      }

      // --- [2] Verify lambda getCapacity minus length tracks the configured capacity minus occupied entries across capacities ---
      {
        let remainingOf: (c: util.LRUCache<int, int>) => int = (c: util.LRUCache<int, int>): int => c.getCapacity() - c.length;

        let capTen: util.LRUCache<int, int> = new util.LRUCache<int, int>(10);
        capTen.put(1, 100);
        expect(remainingOf(capTen)).assertEqual(9);
        let capSix: util.LRUCache<int, int> = new util.LRUCache<int, int>(6);
        capSix.put(1, 100);
        capSix.put(2, 200);
        capSix.put(3, 300);
        capSix.put(4, 400);
        expect(remainingOf(capSix)).assertEqual(2);
        let def: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        expect(remainingOf(def)).assertEqual(64);
      }

      // --- [3] Verify a constructor capacity produced by 32-bit overflow (INT_MIN - 1) yields the same getCapacity() as the literal INT_MAX argument ---
      {
        let mn: int = -2147483648;
        let wrappedDown: int = mn - 1;
        let literal: util.LRUCache<int, int> = new util.LRUCache<int, int>(2147483647);
        let wrapped: util.LRUCache<int, int> = new util.LRUCache<int, int>(wrappedDown);
        expect(wrapped.getCapacity()).assertEqual(literal.getCapacity());
        expect(wrapped.getCapacity()).assertEqual(2147483647);
      }

      // --- [4] Verify getCapacity stays 2 when two NaN double keys collapse into one entry ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>(2);
        cache.put(Double.NaN, 1);
        cache.put(Double.NaN, 2);
        expect(cache.length).assertEqual(1);
        expect(cache.getCapacity()).assertEqual(2);
      }

      // --- [5] Verify getCapacity stays 2 for a cache holding the positive Infinity and negative Infinity keys after one is removed ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>(2);
        cache.put(Double.POSITIVE_INFINITY, 1);
        cache.put(Double.NEGATIVE_INFINITY, 2);
        expect(cache.length).assertEqual(2);
        expect(cache.remove(Double.POSITIVE_INFINITY)).assertEqual(1);
        expect(cache.getCapacity()).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CAPACITY_0180
     * @tc.name testLruCacheGetCapacity018
     * @tc.desc Merged batch (5 tests): [1] Verify getCapacity stays 2 when the negative zero key -0.0 and the zero key collapse, then follows updateCapacity to 5 | [2] Verify getCapacity is unchanged when a put w...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCapacity018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify getCapacity stays 2 when the negative zero key -0.0 and the zero key collapse, then follows updateCapacity to 5 ---
      {
        let cache: util.LRUCache<double, int> = new util.LRUCache<double, int>(2);
        cache.put(-0.0, 1);
        cache.put(0.0, 2);
        expect(cache.length).assertEqual(1);
        cache.updateCapacity(5);
        expect(cache.getCapacity()).assertEqual(5);
      }

      // --- [2] Verify getCapacity is unchanged when a put with a null key throws BusinessError ---
      {
        let cache: util.LRUCache<string | null, int> = new util.LRUCache<string | null, int>(7);
        cache.put('a', 1);
        try {
          cache.put(null, 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
        expect(cache.getCapacity()).assertEqual(7);
      }

      // --- [3] Verify getCapacity is unchanged after a contains hit and a contains miss ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(5);
        cache.put(1, 10);
        expect(cache.contains(1)).assertTrue();
        expect(cache.contains(2)).assertFalse();
        expect(cache.getCapacity()).assertEqual(5);
      }

      // --- [4] Verify getCapacity is unchanged after removing every entry and refilling the cache ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(4);
        for (let i: int = 0; i < 4; i++) {
          cache.put(i, i);
        }
        for (let i: int = 0; i < 4; i++) {
          cache.remove(i);
        }
        expect(cache.isEmpty()).assertTrue();
        cache.put(9, 90);
        expect(cache.getCapacity()).assertEqual(4);
      }

      // --- [5] Verify three caches of capacity 3, 5 and 7 each fill to their own bound and sort into ascending getCapacity order ---
      {
        let three: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        let five: util.LRUCache<int, int> = new util.LRUCache<int, int>(5);
        let seven: util.LRUCache<int, int> = new util.LRUCache<int, int>(7);
        let pools: util.LRUCache<int, int>[] = [seven, three, five];
        for (let i: int = 0; i < pools.length; i++) {
          let bound: int = pools[i].getCapacity();
          for (let k: int = 0; k < bound; k++) {
            pools[i].put(k, k);
          }
        }
        expect(pools[0].length).assertEqual(7);
        expect(pools[1].length).assertEqual(3);
        expect(pools[2].length).assertEqual(5);
        pools.sort((x: util.LRUCache<int, int>, y: util.LRUCache<int, int>): int => x.getCapacity() - y.getCapacity());
        expect(pools[0].getCapacity()).assertEqual(3);
        expect(pools[1].getCapacity()).assertEqual(5);
        expect(pools[2].getCapacity()).assertEqual(7);
        expect(pools[0].length).assertEqual(3);
        expect(pools[2].length).assertEqual(7);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CAPACITY_0190
     * @tc.name testLruCacheGetCapacity019
     * @tc.desc Merged batch (5 tests): [1] Verify a while loop fills the cache until length reaches the getCapacity bound | [2] Verify getCapacity stays 2 for a cache holding an emoji surrogate-pair key | [3] Ver...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCapacity019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a while loop fills the cache until length reaches the getCapacity bound ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(6);
        let i: int = 0;
        while (cache.length < cache.getCapacity()) {
          cache.put(i, i);
          i = i + 1;
        }
        expect(cache.length).assertEqual(6);
        expect(cache.getCapacity()).assertEqual(6);
      }

      // --- [2] Verify getCapacity stays 2 for a cache holding an emoji surrogate-pair key ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>(2);
        cache.put('😀', 7);
        expect(cache.get('😀')).assertEqual(7);
        expect(cache.getCapacity()).assertEqual(2);
      }

      // --- [3] Verify getCapacity stays 2 when the NUL character 0x0000 key and the maximum BMP character 0xFFFF key fill it ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>(2);
        cache.put('\u0000', 0);
        cache.put('\uFFFF', 65535);
        expect(cache.length).assertEqual(2);
        expect(cache.getCapacity()).assertEqual(2);
      }

      // --- [4] Verify getCapacity read inside a keys iteration loop stays at the configured 3 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        cache.put(1, 10);
        cache.put(2, 20);
        let keys: int[] = cache.keys();
        let seen: int = 0;
        for (let i: int = 0; i < keys.length; i++) {
          if (cache.getCapacity() === 3) {
            seen = seen + 1;
          }
        }
        expect(seen).assertEqual(2);
      }

      // --- [5] Verify getCapacity follows updateCapacity to 6 after the cache is cleared ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(8);
        cache.put(1, 10);
        cache.clear();
        cache.updateCapacity(6);
        expect(cache.getCapacity()).assertEqual(6);
        expect(cache.isEmpty()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_GET_CAPACITY_0200
     * @tc.name testLruCacheGetCapacity020
     * @tc.desc Merged batch (2 tests): [1] Verify getCapacity reads the nested LRUCache capacity while the outer cache keeps its own | [2] Verify all read-only operations do not mutate cache state (unified read s...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheGetCapacity020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify getCapacity reads the nested LRUCache capacity while the outer cache keeps its own ---
      {
        let inner: util.LRUCache<long, long> = new util.LRUCache<long, long>(7);
        let outer: util.LRUCache<int, util.LRUCache<long, long>> = new util.LRUCache<int, util.LRUCache<long, long>>(3);
        outer.put(100, inner);
        expect(outer.getCapacity()).assertEqual(3);
        expect(outer.get(100)!.getCapacity()).assertEqual(7);
      }

      // --- [2] Verify all read-only operations do not mutate cache state (unified read safety) ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(8);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        cache.get(1);
        cache.get(9);

        let lenBefore: int = cache.length;
        let capBefore: int = cache.getCapacity();
        let putBefore: long = cache.getPutCount();
        let removalBefore: long = cache.getRemovalCount();
        let missBefore: long = cache.getMissCount();
        let matchBefore: long = cache.getMatchCount();
        let createBefore: long = cache.getCreateCount();
        let emptyBefore: boolean = cache.isEmpty();
        let keysBefore: Array<int> = cache.keys();
        let valsBefore: Array<int> = cache.values();
        let strBefore: string = cache.toString();

        cache.getCapacity();
        cache.getPutCount();
        cache.getRemovalCount();
        cache.getMissCount();
        cache.getMatchCount();
        cache.getCreateCount();
        cache.keys();
        cache.values();
        cache.isEmpty();
        cache.toString();

        expect(cache.length).assertEqual(lenBefore);
        expect(cache.getCapacity()).assertEqual(capBefore);
        expect(cache.getPutCount()).assertEqual(putBefore);
        expect(cache.getRemovalCount()).assertEqual(removalBefore);
        expect(cache.getMissCount()).assertEqual(missBefore);
        expect(cache.getMatchCount()).assertEqual(matchBefore);
        expect(cache.getCreateCount()).assertEqual(createBefore);
        expect(cache.isEmpty()).assertEqual(emptyBefore);
        expect(cache.keys().length).assertEqual(keysBefore.length);
        expect(cache.values().length).assertEqual(valsBefore.length);
        expect(cache.toString()).assertEqual(strBefore);
      }
    });

  });
}
