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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

class ObjTest {
  value: number = 0;
  id: number = 0;
  constructor(value: number = 0) {
    this.value = value;
    this.id = value;
  }
}

export default function SetClear_2Test(): void {
  describe('SetClearPart1Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    /**
     * @tc.name testClear001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_0100
     * @tc.desc Verify clear sequential multi-operations
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([0, 1, 2, 3, 4]);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testClear002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_0200
     * @tc.desc Verify clear with large Set 1000 elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>();
      for (let i: int = 0; i < 1000; i++) { set.add(i); }
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testClear003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_0300
     * @tc.desc Verify byte values with binary literals and as-byte narrowing
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<byte> = new Set<byte>();
      set.add(0b1010 as byte);
      set.add(-1 as byte);
      set.add(-1 as byte);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testClear004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_0400
     * @tc.desc Verify clear with boundary double literal values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<double> = new Set<double>();
      set.add(1.0);
      set.add(3.0);
      set.add(0.5);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testClear005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_0500
     * @tc.desc Verify keys returns empty iterator after clear
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      set.clear();
      const keys = set.keys();
      let count = 0;
      for (let key of keys) {
        count++;
      }
      expect(count).assertEqual(0);
      expect(keys.next().done).assertTrue();
    });

    /**
     * @tc.name testClear006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_0600
     * @tc.desc Verify values returns empty iterator after clear
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([10, 20, 30]);
      set.clear();
      const values = set.values();
      let count = 0;
      for (let val of values) {
        count++;
      }
      expect(count).assertEqual(0);
      expect(values.next().done).assertTrue();
    });

    /**
     * @tc.name testClear007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_0700
     * @tc.desc Verify entries returns empty iterator after clear
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["x", "y", "z"]);
      set.clear();
      const entries = set.entries();
      let count = 0;
      for (let entry of entries) {
        count++;
      }
      expect(count).assertEqual(0);
      expect(entries.next().done).assertTrue();
    });

    /**
     * @tc.name testClear008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_0800
     * @tc.desc Verify calling clear 100 times, validate stability
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      for (let i: int = 0; i < 100; i++) {
        set.clear();
      }
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testClear009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_0900
     * @tc.desc Verify iterator obtained before clear reflects cleared state
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3, 4, 5]);
      const iter = set.values();
      set.clear();
      let count = 0;
      for (let val of iter) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testClear010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_1000
     * @tc.desc Verify clear on union type Set<string | int>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string | int> = new Set<string | int>(["hello", 42, "world"]);
      expect(set.size).assertEqual(3);
      set.clear();
      expect(set.size).assertEqual(0);
      expect(set.has("hello")).assertFalse();
      expect(set.has(42)).assertFalse();
    });

    /**
     * @tc.name testClear011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_1100
     * @tc.desc Verify deduplication still works after clear when re-adding duplicate elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2]);
      set.clear();
      set.add(100);
      set.add(100);
      expect(set.size).assertEqual(1);
      expect(set.has(100)).assertTrue();
    });

    /**
     * @tc.name testClear012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_1200
     * @tc.desc Verify Set<char> clear with Unicode characters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<char> = new Set<char>();
      set.add(c'A');
      set.add(c'中');
      set.add(c'\n');
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testClear013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_1300
     * @tc.desc Verify Set<short> clear with 32767
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<short> = new Set<short>([32767 as short]);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testClear014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_1400
     * @tc.desc Verify Set<short> clear with -32768
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<short> = new Set<short>([-32768 as short]);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testClear015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_1500
     * @tc.desc Verify Set<short> clear with 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<short> = new Set<short>([0 as short]);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testClear016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_1600
     * @tc.desc Verify Set<long> clear with Long.MAX_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<long> = new Set<long>([Long.MAX_VALUE]);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testClear017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_1700
     * @tc.desc Verify Set<long> clear with Long.MIN_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<long> = new Set<long>([Long.MIN_VALUE]);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testClear018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_1800
     * @tc.desc Verify Set<long> clear with 0 as long
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<long> = new Set<long>([0 as long]);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testClear019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_1900
     * @tc.desc Verify Set<boolean> clear with true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<boolean> = new Set<boolean>([true]);
      set.clear();
      expect(set.size).assertEqual(0);
      expect(set.has(true)).assertFalse();
    });

    /**
     * @tc.name testClear020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_2000
     * @tc.desc Verify Set<boolean> clear with false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<boolean> = new Set<boolean>([false]);
      set.clear();
      expect(set.size).assertEqual(0);
      expect(set.has(false)).assertFalse();
    });

    /**
     * @tc.name testClear021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_2100
     * @tc.desc Verify Set<Date> clear removes all Date refs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1 = new Date(2025, 0, 1);
      const d2 = new Date(2025, 6, 1);
      const set: Set<Date> = new Set<Date>([d1, d2]);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testClear022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_2200
     * @tc.desc Verify Set<object> clear POJOs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o1 = new ObjTest(1);
      const o2 = new ObjTest(1);
      const set: Set<object> = new Set<object>([o1, o2]);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testClear023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_2300
     * @tc.desc Verify Set<number[]> clear array refs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1: number[] = [1, 2];
      const a2: number[] = [3, 4];
      const set: Set<number[]> = new Set<number[]>([a1, a2]);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testClear024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_2400
     * @tc.desc Verify Set<RegExp> clear
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<RegExp> = new Set<RegExp>([new RegExp("a", ""), new RegExp("b", ""),
      new RegExp("c", "")]);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testClear025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_2500
     * @tc.desc Verify Set<Map> clear Map refs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m1 = new Map<string, number>([['a', 1]]);
      const m2 = new Map<string, number>([['b', 2]]);
      const set: Set<Map<string, number>> = new Set<Map<string, number>>([m1, m2]);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testClear026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_2600
     * @tc.desc Verify Set<Map> clear Map refs (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m1 = new Map<string, number>([['a', 1]]);
      const m2 = new Map<string, number>([['b', 2]]);
      const set: Set<Map<string, number>> = new Set<Map<string, number>>();
      set.add(m1);
      set.add(m2);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testClear027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_2700
     * @tc.desc Verify Set<Set<int>> clear nested Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Set<int>([1]);
      const inner2 = new Set<int>([2]);
      const outer: Set<Set<int>> = new Set<Set<int>>([inner1, inner2]);
      outer.clear();
      expect(outer.size).assertEqual(0);
    });

    /**
     * @tc.name testClear028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_2800
     * @tc.desc Verify Set<Set<int>> clear nested Set (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Set<int>([1]);
      const inner2 = new Set<int>([2]);
      const outer: Set<Set<int>> = new Set<Set<int>>();
      outer.add(inner1);
      outer.add(inner2);
      outer.clear();
      expect(outer.size).assertEqual(0);
    });

    /**
     * @tc.name testClear029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_2900
     * @tc.desc Verify Set<Error> clear Error refs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<Error> = new Set<Error>([new Error('a'), new TypeError('b')]);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testClear030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_3000
     * @tc.desc Verify Set<WeakMap> clear WeakMap refs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<WeakMap<object, number>> = new Set<WeakMap<object, number>>([new WeakMap<object, number>()]);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testClear031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_3100
     * @tc.desc Verify Set<WeakMap> clear WeakMap refs (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<WeakMap<object, number>> = new Set<WeakMap<object, number>>();
      set.add(new WeakMap<object, number>());
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testClear032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_3200
     * @tc.desc Verify Set<WeakSet> clear WeakSet refs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<WeakSet<object>> = new Set<WeakSet<object>>([new WeakSet<object>()]);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testClear033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_3300
     * @tc.desc Verify Set<WeakSet> clear WeakSet refs (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<WeakSet<object>> = new Set<WeakSet<object>>();
      set.add(new WeakSet<object>());
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testClear034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_3400
     * @tc.desc Verify Set<Record> clear Record refs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Record<string, int> = { 'a': 1 };
      const r2: Record<string, int> = { 'b': 2 };
      const set: Set<Record<string, int>> = new Set<Record<string, int>>([r1, r2]);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testClear035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_3500
     * @tc.desc Verify Set<Record> clear Record refs (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Record<string, int> = { 'a': 1 };
      const r2: Record<string, int> = { 'b': 2 };
      const set: Set<Record<string, int>> = new Set<Record<string, int>>();
      set.add(r1);
      set.add(r2);

      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testClear036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_3600
     * @tc.desc Verify Set<Int8Array> clear TypedArray refs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<Int8Array> = new Set<Int8Array>([new Int8Array([1]), new Int8Array([2])]);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testClear037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_3700
     * @tc.desc Verify Set<Int8Array> clear TypedArray refs (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<Int8Array> = new Set<Int8Array>();
      set.add(new Int8Array([1]));
      set.add(new Int8Array([2]));
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testClear038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_3800
     * @tc.desc Verify Set<bigint> clear with large bigint values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<bigint> = new Set<bigint>([0n, 1n, -1n, 999999999999n]);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testClear039
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_3900
     * @tc.desc Verify Set<ObjTest> clear class instances
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<ObjTest> = new Set<ObjTest>([new ObjTest(1), new ObjTest(2)]);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testClear040
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_4000
     * @tc.desc Verify Set<number> clear with mixed int, float, Number.NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>([0, 1.5, -3.14, Number.POSITIVE_INFINITY, Number.NaN]);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testClear041
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_4100
     * @tc.desc Verify Set<float> clear with Float.NaN and Float.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<float> = new Set<float>();
      set.add(0.0 as float);
      set.add(Float.NaN);
      set.add(Float.POSITIVE_INFINITY);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testClear042
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_4200
     * @tc.desc Verify Set<Promise<Set<int>>> clear nested Promise generic
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Set<int> = new Set<int>([42]);
      const p: Promise<Set<int>> = Promise.resolve(inner);
      const set: Set<Promise<Set<int>>> = new Set<Promise<Set<int>>>([p]);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testClear043
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_P1_4300
     * @tc.desc Verify Set<jsonx.JsonElement> clear JSON parsed objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testClear043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const j1: jsonx.JsonElement = JSON.parseJsonElement('{"a":1}');
      const j2: jsonx.JsonElement = JSON.parseJsonElement('{"b":2}');
      const set: Set<jsonx.JsonElement> = new Set<jsonx.JsonElement>([j1, j2]);
      set.clear();
      expect(set.size).assertEqual(0);
    });
  });
}

