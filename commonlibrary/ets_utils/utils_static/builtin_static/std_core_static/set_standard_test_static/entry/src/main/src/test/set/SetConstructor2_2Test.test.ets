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

export default function SetConstructor2_2Test(): void {
  describe('SetConstructor2Part1Test', (): void => {
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
     * @tc.name testConstructor2_001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_0100
     * @tc.desc Verify no-arg constructor creates empty Set<int>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testConstructor2_002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_0200
     * @tc.desc Verify constructor with null creates empty Set<int>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>(null);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testConstructor2_003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_0300
     * @tc.desc Verify constructor from FixedArray<int> preserves all elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = new FixedArray<int>(3);
      fa[0] = 10;
      fa[1] = 20;
      fa[2] = 30;
      const set: Set<int> = new Set<int>(fa);
      expect(set.size).assertEqual(3);
      expect(set.has(10)).assertTrue();
      expect(set.has(20)).assertTrue();
      expect(set.has(30)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_0400
     * @tc.desc Verify constructor from FixedArray with duplicate values deduplicates
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = new FixedArray<int>(3);
      fa[0] = 1;
      fa[1] = 1;
      fa[2] = 1;
      const set: Set<int> = new Set<int>(fa);
      expect(set.size).assertEqual(1);
      expect(set.has(1)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_0500
     * @tc.desc Verify constructor from empty FixedArray creates empty Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = new FixedArray<int>(0);
      const set: Set<int> = new Set<int>(fa);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testConstructor2_006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_0600
     * @tc.desc Verify constructor from Set.values() IterableIterator preserves elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Set<int> = new Set<int>([1, 2, 3]);
      const set: Set<int> = new Set<int>(src.values());
      expect(set.size).assertEqual(3);
      expect(set.has(1)).assertTrue();
      expect(set.has(2)).assertTrue();
      expect(set.has(3)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_0700
     * @tc.desc Verify constructor from Set.keys() IterableIterator preserves elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Set<string> = new Set<string>(["a", "b", "c"]);
      const set: Set<string> = new Set<string>(src.keys());
      expect(set.size).assertEqual(3);
      expect(set.has("a")).assertTrue();
      expect(set.has("b")).assertTrue();
      expect(set.has("c")).assertTrue();
    });

    /**
     * @tc.name testConstructor2_008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_0800
     * @tc.desc Verify constructor from empty IterableIterator creates empty Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Set<int> = new Set<int>();
      const set: Set<int> = new Set<int>(src.values());
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testConstructor2_009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_0900
     * @tc.desc Verify constructor from FixedArray<string> with string elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<string> = new FixedArray<string>(2);
      fa[0] = "hello";
      fa[1] = "world";
      const set: Set<string> = new Set<string>(fa);
      expect(set.size).assertEqual(2);
      expect(set.has("hello")).assertTrue();
      expect(set.has("world")).assertTrue();
    });

    /**
     * @tc.name testConstructor2_010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_1000
     * @tc.desc Verify constructor from large FixedArray<int> verifies size correctness
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const LEN: int = 100;
      const fa: FixedArray<int> = new FixedArray<int>(LEN);
      for (let i: int = 0; i < LEN; i++) {
        fa[i] = i;
      }
      const set: Set<int> = new Set<int>(fa);
      expect(set.size).assertEqual(LEN);
      expect(set.has(0)).assertTrue();
      expect(set.has(LEN - 1)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_1100
     * @tc.desc Verify constructor from Iterable with duplicate values deduplicates
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Set<int> = new Set<int>([5, 5, 5]);
      const set: Set<int> = new Set<int>(src.values());
      expect(set.size).assertEqual(1);
      expect(set.has(5)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_1200
     * @tc.desc Verify no-arg constructed Set supports subsequent add and has operations
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>();
      set.add(42);
      expect(set.size).assertEqual(1);
      expect(set.has(42)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_1300
     * @tc.desc Verify constructor from FixedArray<byte> with value 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<byte> = new FixedArray<byte>(1);
      fa[0] = 0;
      const set: Set<byte> = new Set<byte>(fa);
      expect(set.size).assertEqual(1);
      expect(set.has(0)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_1400
     * @tc.desc Verify constructor from FixedArray<byte> with MAX value 127
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<byte> = new FixedArray<byte>(1);
      fa[0] = 127;
      const set: Set<byte> = new Set<byte>(fa);
      expect(set.size).assertEqual(1);
      expect(set.has(127)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_1500
     * @tc.desc Verify constructor from FixedArray<byte> with MIN value -128
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<byte> = new FixedArray<byte>(1);
      fa[0] = -128 as byte;
      const set: Set<byte> = new Set<byte>(fa);
      expect(set.size).assertEqual(1);
      expect(set.has(-128 as byte)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_1600
     * @tc.desc Verify constructor from FixedArray<short> with MIN value -32768
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<short> = new FixedArray<short>(1);
      fa[0] = -32768 as short;
      const set: Set<short> = new Set<short>(fa);
      expect(set.size).assertEqual(1);
      expect(set.has(-32768 as short)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_1700
     * @tc.desc Verify constructor from FixedArray<short> with value 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<short> = new FixedArray<short>(1);
      fa[0] = 0;
      const set: Set<short> = new Set<short>(fa);
      expect(set.size).assertEqual(1);
      expect(set.has(0)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_1800
     * @tc.desc Verify constructor from FixedArray<short> with MAX value 32767
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<short> = new FixedArray<short>(1);
      fa[0] = 32767 as short;
      const set: Set<short> = new Set<short>(fa);
      expect(set.size).assertEqual(1);
      expect(set.has(32767 as short)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_1900
     * @tc.desc Verify constructor from FixedArray<long> with MIN value Long.MIN_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<long> = new FixedArray<long>(1);
      fa[0] = Long.MIN_VALUE;
      const set: Set<long> = new Set<long>(fa);
      expect(set.size).assertEqual(1);
      expect(set.has(Long.MIN_VALUE)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_2000
     * @tc.desc Verify constructor from FixedArray<long> with value 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<long> = new FixedArray<long>(1);
      fa[0] = 0;
      const set: Set<long> = new Set<long>(fa);
      expect(set.size).assertEqual(1);
      expect(set.has(0)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_2100
     * @tc.desc Verify constructor from FixedArray<long> with MAX value Long.MAX_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<long> = new FixedArray<long>(1);
      fa[0] = Long.MAX_VALUE;
      const set: Set<long> = new Set<long>(fa);
      expect(set.size).assertEqual(1);
      expect(set.has(Long.MAX_VALUE)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_2200
     * @tc.desc Verify constructor from Iterable with value 0.0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Set<double> = new Set<double>();
      src.add(0.0);
      const set: Set<double> = new Set<double>(src.values());
      expect(set.size).assertEqual(1);
      expect(set.has(0.0)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_2300
     * @tc.desc Verify constructor from Iterable of double with special value -0.0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Set<double> = new Set<double>();
      src.add(-0.0);
      const set: Set<double> = new Set<double>(src.values());
      expect(set.size).assertEqual(1);
      expect(set.has(-0.0)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_2400
     * @tc.desc Verify constructor from Iterable of double with special value NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Set<double> = new Set<double>();
      src.add(Double.NaN);
      const set: Set<double> = new Set<double>(src.values());
      expect(set.size).assertEqual(1);
      expect(set.has(Double.NaN)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_2500
     * @tc.desc Verify constructor from Iterable of double with special value POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Set<double> = new Set<double>();
      src.add(Double.POSITIVE_INFINITY);
      const set: Set<double> = new Set<double>(src.values());
      expect(set.size).assertEqual(1);
      expect(set.has(Double.POSITIVE_INFINITY)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_2600
     * @tc.desc Verify constructor from Iterable of double with special value NEGATIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Set<double> = new Set<double>();
      src.add(Double.NEGATIVE_INFINITY);
      const set: Set<double> = new Set<double>(src.values());
      expect(set.size).assertEqual(1);
      expect(set.has(Double.NEGATIVE_INFINITY)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_2700
     * @tc.desc Verify constructor from FixedArray<boolean> preserves elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<boolean> = new FixedArray<boolean>(2);
      fa[0] = true;
      fa[1] = false;
      const set: Set<boolean> = new Set<boolean>(fa);
      expect(set.size).assertEqual(2);
      expect(set.has(true)).assertTrue();
      expect(set.has(false)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_2800
     * @tc.desc Verify constructor from FixedArray<int> with MIN value Int.MIN_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = new FixedArray<int>(1);
      fa[0] = Int.MIN_VALUE;
      const set: Set<int> = new Set<int>(fa);
      expect(set.size).assertEqual(1);
      expect(set.has(Int.MIN_VALUE)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_2900
     * @tc.desc Verify constructor from FixedArray<int> with value 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = new FixedArray<int>(1);
      fa[0] = 0;
      const set: Set<int> = new Set<int>(fa);
      expect(set.size).assertEqual(1);
      expect(set.has(0)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_3000
     * @tc.desc Verify constructor from FixedArray<int> with MAX value Int.MAX_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = new FixedArray<int>(1);
      fa[0] = Int.MAX_VALUE;
      const set: Set<int> = new Set<int>(fa);
      expect(set.size).assertEqual(1);
      expect(set.has(Int.MAX_VALUE)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_3100
     * @tc.desc Verify constructor from IterableIterator of Set<double> preserves insertion order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Set<double> = new Set<double>([1.5, 2.5, 3.5]);
      const set: Set<double> = new Set<double>(src.values());
      expect(set.size).assertEqual(3);
      expect(set.has(1.5)).assertTrue();
      expect(set.has(2.5)).assertTrue();
      expect(set.has(3.5)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_3200
     * @tc.desc Verify constructor from IterableIterator of Set<boolean> preserves elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Set<boolean> = new Set<boolean>([true, false]);
      const set: Set<boolean> = new Set<boolean>(src.values());
      expect(set.size).assertEqual(2);
      expect(set.has(true)).assertTrue();
      expect(set.has(false)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_3300
     * @tc.desc Verify constructor from Set.values() IterableIterator of Set<string> preserves elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Set<string> = new Set<string>(["hello", "world"]);
      const set: Set<string> = new Set<string>(src.values());
      expect(set.size).assertEqual(2);
      expect(set.has("hello")).assertTrue();
      expect(set.has("world")).assertTrue();
    });

    /**
     * @tc.name testConstructor2_034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_3400
     * @tc.desc Verify constructor from IterableIterator with special value NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Set<double> = new Set<double>([Double.NaN]);
      const set: Set<double> = new Set<double>(src.keys());
      expect(set.size).assertEqual(1);
      expect(set.has(Double.NaN)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_3500
     * @tc.desc Verify constructor from IterableIterator with special value POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Set<double> = new Set<double>([Double.POSITIVE_INFINITY]);
      const set: Set<double> = new Set<double>(src.keys());
      expect(set.size).assertEqual(1);
      expect(set.has(Double.POSITIVE_INFINITY)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_3600
     * @tc.desc Verify constructor from IterableIterator with special value NEGATIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Set<double> = new Set<double>([Double.NEGATIVE_INFINITY]);
      const set: Set<double> = new Set<double>(src.keys());
      expect(set.size).assertEqual(1);
      expect(set.has(Double.NEGATIVE_INFINITY)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_3700
     * @tc.desc Verify no-arg constructed Set<byte> with MIN value -128
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<byte> = new Set<byte>();
      set.add(-128 as byte);
      expect(set.size).assertEqual(1);
      expect(set.has(-128 as byte)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_3800
     * @tc.desc Verify no-arg constructed Set<byte> with value 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<byte> = new Set<byte>();
      set.add(0);
      expect(set.size).assertEqual(1);
      expect(set.has(0)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_039
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_3900
     * @tc.desc Verify no-arg constructed Set<byte> with MAX value 127
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<byte> = new Set<byte>();
      set.add(127);
      expect(set.size).assertEqual(1);
      expect(set.has(127)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_040
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_4000
     * @tc.desc Verify no-arg constructed Set<double> with value 0.0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<double> = new Set<double>();
      set.add(0.0);
      expect(set.size).assertEqual(1);
      expect(set.has(0.0)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_041
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_4100
     * @tc.desc Verify no-arg constructed Set<double> with special value -0.0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<double> = new Set<double>();
      set.add(-0.0);
      expect(set.size).assertEqual(1);
      expect(set.has(-0.0)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_042
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_4200
     * @tc.desc Verify no-arg constructed Set<double> with special value NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<double> = new Set<double>();
      set.add(Double.NaN);
      expect(set.size).assertEqual(1);
      expect(set.has(Double.NaN)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_043
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_4300
     * @tc.desc Verify no-arg constructed Set<double> with special value POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<double> = new Set<double>();
      set.add(Double.POSITIVE_INFINITY);
      expect(set.size).assertEqual(1);
      expect(set.has(Double.POSITIVE_INFINITY)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_044
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_4400
     * @tc.desc Verify no-arg constructed Set<double> with special value NEGATIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<double> = new Set<double>();
      set.add(Double.NEGATIVE_INFINITY);
      expect(set.size).assertEqual(1);
      expect(set.has(Double.NEGATIVE_INFINITY)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_045
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_4500
     * @tc.desc Verify null-constructed Set<double> creates empty set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<double> = new Set<double>(null);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testConstructor2_046
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_4600
     * @tc.desc Verify null-constructed Set<string> creates empty set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>(null);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testConstructor2_047
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_4700
     * @tc.desc Verify no-arg constructed Set supports clear and re-add cycle
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>();
      set.add(1);
      set.add(2);
      set.clear();
      expect(set.size).assertEqual(0);
      set.add(3);
      expect(set.size).assertEqual(1);
      expect(set.has(3)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_048
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_4800
     * @tc.desc Verify no-arg constructed Set supports delete operation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>();
      set.add(10);
      set.add(20);
      expect(set.delete(10)).assertTrue();
      expect(set.has(10)).assertFalse();
      expect(set.has(20)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor2_049
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_4900
     * @tc.desc Verify no-arg constructed Set<string> with empty string and whitespace
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>();
      set.add("");
      set.add(" ");
      set.add("\t");
      expect(set.size).assertEqual(3);
      expect(set.has("")).assertTrue();
      expect(set.has(" ")).assertTrue();
      expect(set.has("\t")).assertTrue();
    });

    /**
     * @tc.name testConstructor2_050
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_5000
     * @tc.desc Verify no-arg constructed Set<long> with value 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<long> = new Set<long>();
      set.add(0);
      expect(set.size).assertEqual(1);
      expect(set.has(0)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_051
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_5100
     * @tc.desc Verify no-arg constructed Set<long> with MAX value Long.MAX_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<long> = new Set<long>();
      set.add(Long.MAX_VALUE);
      expect(set.size).assertEqual(1);
      expect(set.has(Long.MAX_VALUE)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_052
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_5200
     * @tc.desc Verify no-arg constructed Set<long> with MIN value Long.MIN_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<long> = new Set<long>();
      set.add(Long.MIN_VALUE);
      expect(set.size).assertEqual(1);
      expect(set.has(Long.MIN_VALUE)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_053
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_5300
     * @tc.desc Verify no-arg constructed Set<float> with value 0.0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<float> = new Set<float>();
      set.add(0.0 as float);
      expect(set.size).assertEqual(1);
      expect(set.has(0.0 as float)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_054
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_5400
     * @tc.desc Verify no-arg constructed Set<float> with special value NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<float> = new Set<float>();
      set.add(Float.NaN);
      expect(set.size).assertEqual(1);
      expect(set.has(Float.NaN)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_055
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_5500
     * @tc.desc Verify no-arg constructed Set<float> with special value POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<float> = new Set<float>();
      set.add(Float.POSITIVE_INFINITY);
      expect(set.size).assertEqual(1);
      expect(set.has(Float.POSITIVE_INFINITY)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_056
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_5600
     * @tc.desc Verify no-arg constructed Set<char> supports add and has
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<char> = new Set<char>();
      set.add(c'a');
      set.add(c'Z');
      set.add(c'\n');
      expect(set.size).assertEqual(3);
      expect(set.has(c'a')).assertTrue();
      expect(set.has(c'Z')).assertTrue();
      expect(set.has(c'\n')).assertTrue();
    });

    /**
     * @tc.name testConstructor2_057
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_5700
     * @tc.desc Verify no-arg constructed Set<number> supports add and has with mixed types
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(0);
      set.add(1.5);
      set.add(Number.NaN);
      expect(set.size).assertEqual(3);
      expect(set.has(0)).assertTrue();
      expect(set.has(1.5)).assertTrue();
      expect(set.has(Number.NaN)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_058
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_5800
     * @tc.desc Verify no-arg constructed Set<bigint> supports add and has
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<bigint> = new Set<bigint>();
      set.add(0n);
      set.add(1n);
      set.add(-1n);
      expect(set.size).assertEqual(3);
      expect(set.has(0n)).assertTrue();
      expect(set.has(1n)).assertTrue();
      expect(set.has(-1n)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_059
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_5900
     * @tc.desc Verify constructor from FixedArray<float> with value 0.0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<float> = new FixedArray<float>(1);
      fa[0] = 0.0 as float;
      const set: Set<float> = new Set<float>(fa);
      expect(set.size).assertEqual(1);
      expect(set.has(0.0 as float)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_060
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_6000
     * @tc.desc Verify constructor from FixedArray<float> with special value NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<float> = new FixedArray<float>(1);
      fa[0] = Float.NaN;
      const set: Set<float> = new Set<float>(fa);
      expect(set.size).assertEqual(1);
      expect(set.has(Float.NaN)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_061
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_6100
     * @tc.desc Verify constructor from FixedArray<float> with special value POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<float> = new FixedArray<float>(1);
      fa[0] = Float.POSITIVE_INFINITY;
      const set: Set<float> = new Set<float>(fa);
      expect(set.size).assertEqual(1);
      expect(set.has(Float.POSITIVE_INFINITY)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_062
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_6200
     * @tc.desc Verify constructor from FixedArray<char> preserves elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<char> = new FixedArray<char>(3);
      fa[0] = c'A';
      fa[1] = c'中';
      fa[2] = c'0';
      const set: Set<char> = new Set<char>(fa);
      expect(set.size).assertEqual(3);
      expect(set.has(c'A')).assertTrue();
      expect(set.has(c'中')).assertTrue();
      expect(set.has(c'0')).assertTrue();
    });

    /**
     * @tc.name testConstructor2_063
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_6300
     * @tc.desc Verify constructor from FixedArray<bigint> preserves elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<bigint> = new FixedArray<bigint>(3);
      fa[0] = 0n;
      fa[1] = 1n;
      fa[2] = -1n;
      const set: Set<bigint> = new Set<bigint>(fa);
      expect(set.size).assertEqual(3);
      expect(set.has(0n)).assertTrue();
      expect(set.has(1n)).assertTrue();
      expect(set.has(-1n)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_064
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_6400
     * @tc.desc Verify constructor from FixedArray<int> with boundary values MIN+1 and MAX-1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = new FixedArray<int>(2);
      fa[0] = Int.MIN_VALUE + 1;
      fa[1] = Int.MAX_VALUE - 1;
      const set: Set<int> = new Set<int>(fa);
      expect(set.size).assertEqual(2);
      expect(set.has(Int.MIN_VALUE + 1)).assertTrue();
      expect(set.has(Int.MAX_VALUE - 1)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_065
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_6500
     * @tc.desc Verify constructor from FixedArray<byte> with boundary MIN+1 and MAX-1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<byte> = new FixedArray<byte>(2);
      fa[0] = -127 as byte;
      fa[1] = 126;
      const set: Set<byte> = new Set<byte>(fa);
      expect(set.size).assertEqual(2);
      expect(set.has(-127 as byte)).assertTrue();
      expect(set.has(126)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_066
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_6600
     * @tc.desc Verify constructor from FixedArray<short> with boundary MIN+1 and MAX-1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<short> = new FixedArray<short>(2);
      fa[0] = -32767 as short;
      fa[1] = 32766 as short;
      const set: Set<short> = new Set<short>(fa);
      expect(set.size).assertEqual(2);
      expect(set.has(-32767 as short)).assertTrue();
      expect(set.has(32766 as short)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_067
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_6700
     * @tc.desc Verify constructor from Map.values() IterableIterator preserves elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set("a", 1);
      m.set("b", 2);
      m.set("c", 3);
      const set: Set<int> = new Set<int>(m.values());
      expect(set.size).assertEqual(3);
      expect(set.has(1)).assertTrue();
      expect(set.has(2)).assertTrue();
      expect(set.has(3)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_068
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_6800
     * @tc.desc Verify constructor from Map.keys() IterableIterator preserves elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set("x", 10);
      m.set("y", 20);
      const set: Set<string> = new Set<string>(m.keys());
      expect(set.size).assertEqual(2);
      expect(set.has("x")).assertTrue();
      expect(set.has("y")).assertTrue();
    });

    /**
     * @tc.name testConstructor2_069
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_6900
     * @tc.desc Verify constructor from empty Map.values() creates empty Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      const set: Set<int> = new Set<int>(m.values());
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testConstructor2_070
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_7000
     * @tc.desc Verify constructor from IterableIterator of union type Set preserves elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Set<int | string> = new Set<int | string>([1, "a", 2]);
      const set: Set<int | string> = new Set<int | string>(src.values());
      expect(set.size).assertEqual(3);
      expect(set.has(1)).assertTrue();
      expect(set.has("a")).assertTrue();
      expect(set.has(2)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_071
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_7100
     * @tc.desc Verify constructor from FixedArray<ObjTest> preserves distinct object references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o1: ObjTest = new ObjTest(1);
      const o2: ObjTest = new ObjTest(2);
      const fa: FixedArray<ObjTest> = new FixedArray<ObjTest>(2);
      fa[0] = o1;
      fa[1] = o2;
      const set: Set<ObjTest> = new Set<ObjTest>(fa);
      expect(set.size).assertEqual(2);
      expect(set.has(o1)).assertTrue();
      expect(set.has(o2)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_072
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_7200
     * @tc.desc Verify constructor from Iterable of number[] preserves distinct array references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1: number[] = [1, 2];
      const a2: number[] = [3, 4];
      const src: Set<number[]> = new Set<number[]>();
      src.add(a1);
      src.add(a2);
      const set: Set<number[]> = new Set<number[]>(src.values());
      expect(set.size).assertEqual(2);
      expect(set.has(a1)).assertTrue();
      expect(set.has(a2)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_073
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_7300
     * @tc.desc Verify constructed Set from FixedArray is independent of source modification
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = new FixedArray<int>(2);
      fa[0] = 10;
      fa[1] = 20;
      const set: Set<int> = new Set<int>(fa);
      fa[0] = 99;
      expect(set.size).assertEqual(2);
      expect(set.has(10)).assertTrue();
      expect(set.has(99)).assertFalse();
    });

    /**
     * @tc.name testConstructor2_074
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_7400
     * @tc.desc Verify constructed Set from IterableIterator is independent of source modification
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Set<int> = new Set<int>([1, 2, 3]);
      const set: Set<int> = new Set<int>(src.values());
      src.add(4);
      src.delete(1);
      expect(set.size).assertEqual(3);
      expect(set.has(1)).assertTrue();
      expect(set.has(4)).assertFalse();
    });

    /**
     * @tc.name testConstructor2_075
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_7500
     * @tc.desc Verify constructor from FixedArray<Date> with distinct Date refs preserves elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(2025, 0, 1);
      const d2: Date = new Date(2025, 6, 15);
      const fa: FixedArray<Date> = new FixedArray<Date>(2);
      fa[0] = d1;
      fa[1] = d2;
      const set: Set<Date> = new Set<Date>(fa);
      expect(set.size).assertEqual(2);
      expect(set.has(d1)).assertTrue();
      expect(set.has(d2)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_076
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_7600
     * @tc.desc Verify constructor from Iterable of RegExp with ref-based dedup preserves distinct refs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: RegExp = new RegExp("abc");
      const r2: RegExp = new RegExp("abc");
      const src: Set<RegExp> = new Set<RegExp>();
      src.add(r1);
      src.add(r2);
      const set: Set<RegExp> = new Set<RegExp>(src.values());
      expect(set.size).assertEqual(2);
      expect(set.has(r1)).assertTrue();
      expect(set.has(r2)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_077
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_7700
     * @tc.desc Verify constructor from Iterable of Map preserves distinct Map refs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m1: Map<string, number> = new Map<string, number>();
      m1.set("a", 1);
      const m2: Map<string, number> = new Map<string, number>();
      m2.set("b", 2);
      const src: Set<Map<string, number>> = new Set<Map<string, number>>();
      src.add(m1);
      src.add(m2);
      const set: Set<Map<string, number>> = new Set<Map<string, number>>(src.values());
      expect(set.size).assertEqual(2);
      expect(set.has(m1)).assertTrue();
      expect(set.has(m2)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_078
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_7800
     * @tc.desc Verify constructor from Iterable of nested Set preserves nested Set refs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1: Set<int> = new Set<int>([1, 2]);
      const inner2: Set<int> = new Set<int>([3, 4]);
      const src: Set<Set<int>> = new Set<Set<int>>();
      src.add(inner1);
      src.add(inner2);
      const outer: Set<Set<int>> = new Set<Set<int>>(src.values());
      expect(outer.size).assertEqual(2);
      expect(outer.has(inner1)).assertTrue();
      expect(outer.has(inner2)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_079
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_7900
     * @tc.desc Verify constructor from Iterable of triple nested Set preserves refs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Set<int> = new Set<int>([1, 2]);
      const mid1: Set<Set<int>> = new Set<Set<int>>([inner]);
      const mid2: Set<Set<int>> = new Set<Set<int>>([inner]);
      const src: Set<Set<Set<int>>> = new Set<Set<Set<int>>>();
      src.add(mid1);
      src.add(mid2);
      const outer: Set<Set<Set<int>>> = new Set<Set<Set<int>>>(src.values());
      expect(outer.size).assertEqual(2);
      expect(outer.has(mid1)).assertTrue();
      expect(outer.has(mid2)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_080
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_8000
     * @tc.desc Verify constructor from Iterable of Record preserves distinct Record refs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Record<string, int> = { 'x': 10 };
      const r2: Record<string, int> = { 'y': 20 };
      const src: Set<Record<string, int>> = new Set<Record<string, int>>();
      src.add(r1);
      src.add(r2);
      const set: Set<Record<string, int>> = new Set<Record<string, int>>(src.values());
      expect(set.size).assertEqual(2);
      expect(set.has(r1)).assertTrue();
      expect(set.has(r2)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_081
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_8100
     * @tc.desc Verify constructor from FixedArray<Error> preserves distinct Error refs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1: Error = new Error('msg1');
      const e2: TypeError = new TypeError('type error');
      const fa: FixedArray<Error> = new FixedArray<Error>(2);
      fa[0] = e1;
      fa[1] = e2;
      const set: Set<Error> = new Set<Error>(fa);
      expect(set.size).assertEqual(2);
      expect(set.has(e1)).assertTrue();
      expect(set.has(e2)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_082
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_8200
     * @tc.desc Verify constructor from FixedArray<Int8Array> preserves distinct TypedArray refs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1: Int8Array = new Int8Array([1, 2]);
      const a2: Int8Array = new Int8Array([3, 4]);
      const fa: FixedArray<Int8Array> = new FixedArray<Int8Array>(2);
      fa[0] = a1;
      fa[1] = a2;
      const set: Set<Int8Array> = new Set<Int8Array>(fa);
      expect(set.size).assertEqual(2);
      expect(set.has(a1)).assertTrue();
      expect(set.has(a2)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_083
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_8300
     * @tc.desc Verify constructor from Iterable of WeakMap preserves ref
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm: WeakMap<object, number> = new WeakMap<object, number>();
      const src: Set<WeakMap<object, number>> = new Set<WeakMap<object, number>>();
      src.add(wm);
      const set: Set<WeakMap<object, number>> = new Set<WeakMap<object, number>>(src.values());
      expect(set.size).assertEqual(1);
      expect(set.has(wm)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_084
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_8400
     * @tc.desc Verify constructor from Iterable of WeakSet preserves ref
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws: WeakSet<object> = new WeakSet<object>();
      const src: Set<WeakSet<object>> = new Set<WeakSet<object>>();
      src.add(ws);
      const set: Set<WeakSet<object>> = new Set<WeakSet<object>>(src.values());
      expect(set.size).assertEqual(1);
      expect(set.has(ws)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_085
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_8500
     * @tc.desc Verify constructor from IterableIterator of nested Set<Set<int>> preserves refs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1: Set<int> = new Set<int>([1, 2]);
      const inner2: Set<int> = new Set<int>([3, 4]);
      const src: Set<Set<int>> = new Set<Set<int>>([inner1, inner2]);
      const outer: Set<Set<int>> = new Set<Set<int>>(src.values());
      expect(outer.size).assertEqual(2);
      expect(outer.has(inner1)).assertTrue();
      expect(outer.has(inner2)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_086
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_8600
     * @tc.desc Verify no-arg constructed Set<Date> supports add and has with ref semantics
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<Date> = new Set<Date>();
      const d: Date = new Date(2025, 0, 1);
      set.add(d);
      expect(set.size).assertEqual(1);
      expect(set.has(d)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_087
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_8700
     * @tc.desc Verify constructor from Iterable of union type Set<number | boolean> preserves distinct elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Set<number | boolean> = new Set<number | boolean>();
      src.add(42);
      src.add(true);
      src.add(3.14);
      const set: Set<number | boolean> = new Set<number | boolean>(src.values());
      expect(set.size).assertEqual(3);
      expect(set.has(42)).assertTrue();
      expect(set.has(true)).assertTrue();
      expect(set.has(3.14)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_088
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_8800
     * @tc.desc Verify constructor from Iterable of union type Set<string | boolean> preserves distinct elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Set<string | boolean> = new Set<string | boolean>();
      src.add("hello");
      src.add(true);
      src.add("world");
      const set: Set<string | boolean> = new Set<string | boolean>(src.values());
      expect(set.size).assertEqual(3);
      expect(set.has("hello")).assertTrue();
      expect(set.has(true)).assertTrue();
      expect(set.has("world")).assertTrue();
    });

    /**
     * @tc.name testConstructor2_089
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_8900
     * @tc.desc Verify constructor from IterableIterator of union type Set<int | boolean> preserves elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Set<int | boolean> = new Set<int | boolean>([1, true, 0]);
      const set: Set<int | boolean> = new Set<int | boolean>(src.values());
      expect(set.size).assertEqual(3);
      expect(set.has(1)).assertTrue();
      expect(set.has(true)).assertTrue();
      expect(set.has(0)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_090
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_9000
     * @tc.desc Verify constructor from IterableIterator of union type Set<string | number> preserves elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Set<string | number> = new Set<string | number>(["a", 1, "b"]);
      const set: Set<string | number> = new Set<string | number>(src.keys());
      expect(set.size).assertEqual(3);
      expect(set.has("a")).assertTrue();
      expect(set.has(1)).assertTrue();
      expect(set.has("b")).assertTrue();
    });

    /**
     * @tc.name testConstructor2_091
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_9100
     * @tc.desc Verify constructor from Set.values() of triple union type Set<int | string | boolean>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Set<int | string | boolean> = new Set<int | string | boolean>([1, "hello", true]);
      const set: Set<int | string | boolean> = new Set<int | string | boolean>(src.values());
      expect(set.size).assertEqual(3);
      expect(set.has(1)).assertTrue();
      expect(set.has("hello")).assertTrue();
      expect(set.has(true)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_092
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_9200
     * @tc.desc Verify Set<object> from Set.values() of POJO refs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: object = new ObjTest(1);
      const obj2: object = new ObjTest(2);
      const src: Set<object> = new Set<object>([obj1, obj2]);
      const set: Set<object> = new Set<object>(src.values());
      expect(set.size).assertEqual(2);
      expect(set.has(obj1)).assertTrue();
    });

    /**
     * @tc.name testConstructor2_093
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_9300
     * @tc.desc Verify Set<Promise<Set<int>>> from iterable with nested Promise generic
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Set<int> = new Set<int>([42]);
      const p: Promise<Set<int>> = Promise.resolve(inner);
      const src: Set<Promise<Set<int>>> = new Set<Promise<Set<int>>>();
      src.add(p);
      const set: Set<Promise<Set<int>>> = new Set<Promise<Set<int>>>(src.values());
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor2_094
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR2_P1_9400
     * @tc.desc Verify Set<jsonx.JsonElement> from iterable with JSON parsed objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor2_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const j1: jsonx.JsonElement = JSON.parseJsonElement('{"a":1}');
      const j2: jsonx.JsonElement = JSON.parseJsonElement('{"b":2}');
      const src: Set<jsonx.JsonElement> = new Set<jsonx.JsonElement>([j1, j2]);
      const set: Set<jsonx.JsonElement> = new Set<jsonx.JsonElement>(src.values());
      expect(set.size).assertEqual(2);
    });
  });
}
