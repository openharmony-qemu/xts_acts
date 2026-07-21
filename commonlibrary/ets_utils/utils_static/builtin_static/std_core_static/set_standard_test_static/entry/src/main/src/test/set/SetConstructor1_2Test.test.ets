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

export default function SetConstructor1_2Test(): void {
  describe('SetConstructor1Part1Test', (): void => {
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
     * @tc.name testConstructor1_001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_0100
     * @tc.desc Verify constructing Set<byte> with initial array containing one byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<byte> = new Set<byte>([1 as byte]);
      expect(set.size).assertEqual(1);
      expect(set.has(1 as byte)).assertTrue();
    });

    /**
     * @tc.name testConstructor1_002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_0200
     * @tc.desc Verify Set<byte> constructor deduplicates repeated byte values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<byte> = new Set<byte>([1 as byte, 1 as byte, 1 as byte]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor1_003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_0300
     * @tc.desc Verify constructing Set<int> with initial array containing one int
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>([1]);
      expect(set.size).assertEqual(1);
      expect(set.has(1)).assertTrue();
    });

    /**
     * @tc.name testConstructor1_004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_0400
     * @tc.desc Verify Set<int> constructor deduplicates repeated int values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>([1, 1, 1]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor1_005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_0500
     * @tc.desc Verify constructing Set<long> with initial array containing one long
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<long> = new Set<long>([1 as long]);
      expect(set.size).assertEqual(1);
      expect(set.has(1 as long)).assertTrue();
    });

    /**
     * @tc.name testConstructor1_006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_0600
     * @tc.desc Verify Set<long> constructor deduplicates repeated long values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<long> = new Set<long>([1 as long, 1 as long, 1 as long]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor1_007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_0700
     * @tc.desc Verify constructing Set<short> with initial array containing one short
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<short> = new Set<short>([100 as short]);
      expect(set.size).assertEqual(1);
      expect(set.has(100 as short)).assertTrue();
    });

    /**
     * @tc.name testConstructor1_008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_0800
     * @tc.desc Verify constructing Set<double> with initial array containing one double (1.5)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<double> = new Set<double>([1.5]);
      expect(set.size).assertEqual(1);
      expect(set.has(1.5)).assertTrue();
    });

    /**
     * @tc.name testConstructor1_009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_0900
     * @tc.desc Verify constructing Set<boolean> with true value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<boolean> = new Set<boolean>([true]);
      expect(set.size).assertEqual(1);
      expect(set.has(true)).assertTrue();
    });

    /**
     * @tc.name testConstructor1_010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_1000
     * @tc.desc Verify constructing Set<boolean> with false value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<boolean> = new Set<boolean>([false]);
      expect(set.size).assertEqual(1);
      expect(set.has(false)).assertTrue();
    });

    /**
     * @tc.name testConstructor1_011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_1100
     * @tc.desc Verify constructing Set<string> with single character
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>(["a"]);
      expect(set.size).assertEqual(1);
      expect(set.has("a")).assertTrue();
    });

    /**
     * @tc.name testConstructor1_012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_1200
     * @tc.desc Verify Set<string> constructor deduplicates repeated strings
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>(["a", "a", "a"]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor1_013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_1300
     * @tc.desc Verify state transition from empty to non-empty after add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>();
      set.add(1);
      expect(set.size).assertEqual(1);
      expect(set.has(1)).assertTrue();
    });

    /**
     * @tc.name testConstructor1_014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_1400
     * @tc.desc Verify state transition from non-empty to empty after clear
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>([1, 2, 3]);
      expect(set.size).assertEqual(3);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testConstructor1_015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_1500
     * @tc.desc Verify state transition from single to multiple elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>([1]);
      expect(set.size).assertEqual(1);
      set.add(2);
      set.add(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testConstructor1_016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_1600
     * @tc.desc Verify state transition from multiple to single element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>([1, 2, 3]);
      expect(set.size).assertEqual(3);
      set.delete(2);
      set.delete(3);
      expect(set.size).assertEqual(1);
      expect(set.has(1)).assertTrue();
    });

    /**
     * @tc.name testConstructor1_017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_1700
     * @tc.desc Verify -32768 as short
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<short> = new Set<short>();
      s.add(-32768 as short);
      expect(s.has(-32768 as short)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor1_018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_1800
     * @tc.desc Verify 32767 as short
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<short> = new Set<short>();
      s.add(32767 as short);
      expect(s.has(32767 as short)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor1_019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_1900
     * @tc.desc Verify constructor with Number.MIN_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<double> = new Set<double>([Number.MIN_VALUE]);
      expect(set.size).assertEqual(1);
      expect(set.has(Number.MIN_VALUE)).assertTrue();
    });

    /**
     * @tc.name testConstructor1_020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_2000
     * @tc.desc Verify constructor with Number.MAX_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<double> = new Set<double>([Number.MAX_VALUE]);
      expect(set.size).assertEqual(1);
      expect(set.has(Number.MAX_VALUE)).assertTrue();
    });

    /**
     * @tc.name testConstructor1_021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_2100
     * @tc.desc Verify no-arg constructed Set add Number.EPSILON
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<double> = new Set<double>();
      s.add(Number.EPSILON);
      expect(s.has(Number.EPSILON)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor1_022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_2200
     * @tc.desc Verify no-arg constructed Set add 1.0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<double> = new Set<double>();
      s.add(1.0);
      expect(s.has(1.0)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor1_023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_2300
     * @tc.desc Verify constructor with manual iteration copy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set1: Set<int> = new Set<int>([1, 2, 3]);
      const set2 = new Set<int>();
      for (const v of set1) { set2.add(v); }
      set2.add(4);
      set2.add(5);
      expect(set2.size).assertEqual(5);
      expect(set2.has(1)).assertTrue();
      expect(set2.has(4)).assertTrue();
    });

    /**
     * @tc.name testConstructor1_024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_2400
     * @tc.desc Verify constructor with union type
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int | string> = new Set<int | string>([1, "a", 2]);
      expect(set.size).assertEqual(3);
      expect(set.has(1)).assertTrue();
      expect(set.has("a")).assertTrue();
      expect(set.has(2)).assertTrue();
    });

    /**
     * @tc.name testConstructor1_025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_2500
     * @tc.desc Verify constructing Set<int> with three elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>([1, 2, 3]);
      expect(set.size).assertEqual(3);
      expect(set.has(1)).assertTrue();
    });

    /**
     * @tc.name testConstructor1_026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_2600
     * @tc.desc Verify constructor with array containing Double.NaN, Double.NaN treated as valid element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<double> = new Set<double>([1.5, Double.NaN, 2.5]);
      expect(set.size).assertEqual(3);
      expect(set.has(Double.NaN)).assertTrue();
    });

    /**
     * @tc.name testConstructor1_027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_2700
     * @tc.desc Verify no-arg constructed Set add +0.0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<double> = new Set<double>();
      s.add(+0.0);
      expect(s.has(+0.0)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor1_028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_2800
     * @tc.desc Verify no-arg constructed Set add -0.0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<double> = new Set<double>();
      s.add(-0.0);
      expect(s.has(-0.0)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor1_029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_2900
     * @tc.desc Verify no-arg constructed Set add byte -128
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<byte> = new Set<byte>();
      s.add(-128 as byte);
      expect(s.has(-128 as byte)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor1_030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_3000
     * @tc.desc Verify no-arg constructed Set add byte 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<byte> = new Set<byte>();
      s.add(0 as byte);
      expect(s.has(0 as byte)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor1_031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_3100
     * @tc.desc Verify no-arg constructed Set add byte 127
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<byte> = new Set<byte>();
      s.add(127 as byte);
      expect(s.has(127 as byte)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor1_032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_3200
     * @tc.desc Verify Set<byte> constructor with MIN+1=-127 and MAX-1=126 as distinct values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<byte> = new Set<byte>([-127 as byte, 126 as byte]);
      expect(set.size).assertEqual(2);
      expect(set.has(-127 as byte)).assertTrue();
      expect(set.has(126 as byte)).assertTrue();
    });

    /**
     * @tc.name testConstructor1_033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_3300
     * @tc.desc Verify no-arg constructed Set add Int.MIN_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(Int.MIN_VALUE);
      expect(s.has(Int.MIN_VALUE)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor1_034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_3400
     * @tc.desc Verify no-arg constructed Set add 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(0);
      expect(s.has(0)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor1_035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_3500
     * @tc.desc Verify no-arg constructed Set add Int.MAX_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(Int.MAX_VALUE);
      expect(s.has(Int.MAX_VALUE)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor1_036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_3600
     * @tc.desc Verify no-arg constructed Set add Int.MIN_VALUE + 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(Int.MIN_VALUE + 1);
      expect(s.has(Int.MIN_VALUE + 1)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor1_037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_3700
     * @tc.desc Verify no-arg constructed Set add Int.MAX_VALUE - 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(Int.MAX_VALUE - 1);
      expect(s.has(Int.MAX_VALUE - 1)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor1_038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_3800
     * @tc.desc Verify no-arg constructed Set add Long.MIN_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<long> = new Set<long>();
      s.add(Long.MIN_VALUE);
      expect(s.has(Long.MIN_VALUE)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor1_039
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_3900
     * @tc.desc Verify no-arg constructed Set add 0 as long
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<long> = new Set<long>();
      s.add(0 as long);
      expect(s.has(0 as long)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor1_040
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_4000
     * @tc.desc Verify no-arg constructed Set add Long.MAX_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<long> = new Set<long>();
      s.add(Long.MAX_VALUE);
      expect(s.has(Long.MAX_VALUE)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor1_041
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_4100
     * @tc.desc Verify Set<float> no-arg constructor creates empty set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<float> = new Set<float>();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testConstructor1_042
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_4200
     * @tc.desc Verify no-arg constructed Set add Float.NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<float> = new Set<float>();
      s.add(Float.NaN);
      expect(s.has(Float.NaN)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor1_043
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_4300
     * @tc.desc Verify no-arg constructed Set add Float.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<float> = new Set<float>();
      s.add(Float.POSITIVE_INFINITY);
      expect(s.has(Float.POSITIVE_INFINITY)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor1_044
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_4400
     * @tc.desc Verify Set<char> no-arg constructor creates empty set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<char> = new Set<char>();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testConstructor1_045
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_4500
     * @tc.desc Verify Set<char> constructor with letters, digits, Unicode, escape chars
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<char> = new Set<char>([c'a', c'Z', c'0', c'\n', c'中']);
      expect(set.size).assertEqual(5);
      expect(set.has(c'中')).assertTrue();
    });

    /**
     * @tc.name testConstructor1_046
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_4600
     * @tc.desc Verify Set<number> constructor with int, float, Number.POSITIVE_INFINITY, Number.NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>([0, 1.5, -3.14, Number.POSITIVE_INFINITY, Number.NaN]);
      expect(set.size).assertEqual(5);
      expect(set.has(0)).assertTrue();
      expect(set.has(Number.NaN)).assertTrue();
    });

    /**
     * @tc.name testConstructor1_047
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_4700
     * @tc.desc Verify Set<number> no-arg constructor creates empty set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testConstructor1_048
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_4800
     * @tc.desc Verify Set<string> constructed then chain add/delete/has
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>();
      set.add("a").add("b").add("c");
      expect(set.size).assertEqual(3);
      set.delete("b");
      expect(set.has("a")).assertTrue();
      expect(set.has("b")).assertFalse();
      expect(set.has("c")).assertTrue();
    });

    /**
     * @tc.name testConstructor1_049
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_4900
     * @tc.desc Verify Set<int> constructor from FixedArray
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = new FixedArray<int>(3);
      fa[0] = 10;
      fa[1] = 20;
      fa[2] = 30;
      const set: Set<int> = new Set<int>(fa);
      expect(set.size).assertEqual(3);
      expect(set.has(10)).assertTrue();
      expect(set.has(20)).assertTrue();
    });

    /**
     * @tc.name testConstructor1_050
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_5000
     * @tc.desc Verify Set<int> constructor from another Set's values iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Set<int> = new Set<int>([1, 2, 3]);
      const set: Set<int> = new Set<int>(src.values());
      expect(set.size).assertEqual(3);
      expect(set.has(1)).assertTrue();
    });

    /**
     * @tc.name testConstructor1_051
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_5100
     * @tc.desc Verify Set<Date> no-arg constructor creates empty set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<Date> = new Set<Date>();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testConstructor1_052
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_5200
     * @tc.desc Verify Set<Date> copy constructor preserves Date refs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Date(2025, 0, 1);
      const src: Set<Date> = new Set<Date>([d]);
      const set: Set<Date> = new Set<Date>(src);
      expect(set.size).assertEqual(1);
      expect(set.has(d)).assertTrue();
    });

    /**
     * @tc.name testConstructor1_053
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_5300
     * @tc.desc Verify Set<RegExp> constructor with regex array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1 = new RegExp("abc");
      const r2 = new RegExp("def", "i");
      const set: Set<RegExp> = new Set<RegExp>([r1, r2]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testConstructor1_054
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_5400
     * @tc.desc Verify Set<object> constructor with POJOs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1 = new ObjTest(1);
      const obj2 = new ObjTest(1);
      const set: Set<object> = new Set<object>([obj1, obj2]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testConstructor1_055
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_5500
     * @tc.desc Verify Set<Map> constructor with array of Map instances
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m1 = new Map<string, number>([['a', 1]]);
      const m2 = new Map<string, number>([['b', 2]]);
      const set: Set<Map<string, number>> = new Set<Map<string, number>>([m1, m2]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testConstructor1_056
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_5600
     * @tc.desc Verify Set<Map> constructor with array of Map instances (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m1 = new Map<string, number>([['a', 1]]);
      const m2 = new Map<string, number>([['b', 2]]);
      const set: Set<Map<string, number>> = new Set<Map<string, number>>();
      set.add(m1);
      set.add(m2);

      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testConstructor1_057
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_5700
     * @tc.desc Verify Set<Set<int>> constructor with nested Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Set<int>([1, 2]);
      const inner2 = new Set<int>([3, 4]);
      const outer: Set<Set<int>> = new Set<Set<int>>([inner1, inner2]);
      expect(outer.size).assertEqual(2);
    });

    /**
     * @tc.name testConstructor1_058
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_5800
     * @tc.desc Verify Set<Set<int>> constructor with nested Set (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Set<int>([1, 2]);
      const inner2 = new Set<int>([3, 4]);
      const outer: Set<Set<int>> = new Set<Set<int>>();
      outer.add(inner1);
      outer.add(inner2);

      expect(outer.size).assertEqual(2);
    });

    /**
     * @tc.name testConstructor1_059
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_5900
     * @tc.desc Verify Set<Record> constructor with Record instances
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Record<string, int> = { 'a': 1 };
      const r2: Record<string, int> = { 'b': 2 };
      const set: Set<Record<string, int>> = new Set<Record<string, int>>([r1, r2]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testConstructor1_060
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_6000
     * @tc.desc Verify Set<Record> constructor with Record instances (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Record<string, int> = { 'a': 1 };
      const r2: Record<string, int> = { 'b': 2 };
      const set: Set<Record<string, int>> = new Set<Record<string, int>>();
      set.add(r1);
      set.add(r2);

      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testConstructor1_061
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_6100
     * @tc.desc Verify Set<Error> constructor with Error, TypeError, RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1 = new Error('msg1');
      const e2 = new TypeError('type error');
      const set: Set<Error> = new Set<Error>([e1, e2]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testConstructor1_062
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_6200
     * @tc.desc Verify Set<WeakMap> constructor with WeakMap
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm = new WeakMap<object, number>();
      const set: Set<WeakMap<object, number>> = new Set<WeakMap<object, number>>([wm]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor1_063
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_6300
     * @tc.desc Verify Set<WeakMap> constructor with WeakMap (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm = new WeakMap<object, number>();
      const set: Set<WeakMap<object, number>> = new Set<WeakMap<object, number>>();
      set.add(wm);

      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor1_064
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_6400
     * @tc.desc Verify Set<WeakSet> constructor with WeakSet
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws = new WeakSet<object>();
      const set: Set<WeakSet<object>> = new Set<WeakSet<object>>([ws]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor1_065
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_6500
     * @tc.desc Verify Set<WeakSet> constructor with WeakSet (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws = new WeakSet<object>();
      const set: Set<WeakSet<object>> = new Set<WeakSet<object>>();
      set.add(ws);

      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor1_066
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_6600
     * @tc.desc Verify Set<Int8Array> constructor with TypedArray
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3]);
      const set: Set<Int8Array> = new Set<Int8Array>([arr]);
      expect(set.size).assertEqual(1);
      expect(set.has(arr)).assertTrue();
    });

    /**
     * @tc.name testConstructor1_067
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_6700
     * @tc.desc Verify Set<Int8Array> constructor with TypedArray (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3]);
      const set: Set<Int8Array> = new Set<Int8Array>();
      set.add(arr);

      expect(set.size).assertEqual(1);
      expect(set.has(arr)).assertTrue();
    });

    /**
     * @tc.name testConstructor1_068
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_6800
     * @tc.desc Verify Set<Set<Set<int>>> triple nested constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Set<int> = new Set<int>([1]);
      const mid: Set<Set<int>> = new Set<Set<int>>([inner]);
      const outer: Set<Set<Set<int>>> = new Set<Set<Set<int>>>([mid]);
      expect(outer.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor1_069
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_6900
     * @tc.desc Verify Set<Set<Set<int>>> triple nested constructor (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Set<int> = new Set<int>([1]);
      const mid: Set<Set<int>> = new Set<Set<int>>();
      mid.add(inner);

      const outer: Set<Set<Set<int>>> = new Set<Set<Set<int>>>([mid]);
      expect(outer.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor1_070
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_7000
     * @tc.desc Verify Set<Map<string, number[]>> mixed generic constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, number[]> = new Map<string, number[]>();
      m.set('a', [1, 2]);
      const set: Set<Map<string, number[]>> = new Set<Map<string, number[]>>([m]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor1_071
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_7100
     * @tc.desc Verify Set<Map<string, number[]>> mixed generic constructor (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, number[]> = new Map<string, number[]>();
      m.set('a', [1, 2]);
      const set: Set<Map<string, number[]>> = new Set<Map<string, number[]>>();
      set.add(m);

      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor1_072
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_7200
     * @tc.desc Verify Set<bigint> constructor with array and BigInt hex values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<bigint> = new Set<bigint>([0n, 1n, -1n, BigInt(0xFFFF)]);
      expect(set.size).assertEqual(4);
      expect(set.has(BigInt(0xFFFF))).assertTrue();
    });

    /**
     * @tc.name testConstructor1_073
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_7300
     * @tc.desc Verify Set<ObjTest> constructor with class instances
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o1 = new ObjTest(1);
      const o2 = new ObjTest(2);
      const set: Set<ObjTest> = new Set<ObjTest>([o1, o2]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testConstructor1_074
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_7400
     * @tc.desc Verify ReadonlySet reference from constructed Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<double> = new Set<double>([1.0, 2.0]);
      const rs: ReadonlySet<double> = set;
      expect(rs.size).assertEqual(2);
    });

    /**
     * @tc.name testConstructor1_075
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_7500
     * @tc.desc Verify Set<Promise<Set<int>>> constructor with nested Promise generic
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Set<int> = new Set<int>([42]);
      const p: Promise<Set<int>> = Promise.resolve(inner);
      const set: Set<Promise<Set<int>>> = new Set<Promise<Set<int>>>([p]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor1_076
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_P1_7600
     * @tc.desc Verify Set<jsonx.JsonElement> constructor with JSON parsed objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor1_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const j1: jsonx.JsonElement = JSON.parseJsonElement('{"a":1}');
      const j2: jsonx.JsonElement = JSON.parseJsonElement('{"b":2}');
      const set: Set<jsonx.JsonElement> = new Set<jsonx.JsonElement>([j1, j2]);
      expect(set.size).assertEqual(2);
    });
  });
}

