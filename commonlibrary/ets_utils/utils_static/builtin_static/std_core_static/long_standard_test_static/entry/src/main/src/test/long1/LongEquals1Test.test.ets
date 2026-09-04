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

export default function longEquals1Test(): void {
  describe('LongEquals1Test', (): void => {

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_0100
     * @tc.name testLongEquals1_001
     * @tc.desc Verify Long equals equal int boundary value returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: int = 2147483647 as int;
      const result: boolean = new Long(2147483647).equals(obj);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_0200
     * @tc.name testLongEquals1_002
     * @tc.desc Verify Long not equal to adjacent int boundary Long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(2147483647);
      const b: Long = new Long(2147483648);
      expect(a.equals(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_0300
     * @tc.name testLongEquals1_003
     * @tc.desc Verify two equal Long values beyond int range are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(2147483648);
      const b: Long = new Long(2147483648);
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_0400
     * @tc.name testLongEquals1_004
     * @tc.desc Verify two equal Long values at 10^10 magnitude are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(10000000000);
      const b: Long = new Long(10000000000);
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_0500
     * @tc.name testLongEquals1_005
     * @tc.desc Verify adjacent Long values at 10^10 magnitude are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(10000000001);
      const b: Long = new Long(10000000000);
      expect(a.equals(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_0600
     * @tc.name testLongEquals1_006
     * @tc.desc Verify different small positive Long values are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(42);
      const b: Long = new Long(99);
      const result: boolean = a.equals(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_0700
     * @tc.name testLongEquals1_007
     * @tc.desc Verify repeated equals calls on equal Long values return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(100);
      const b: Long = new Long(100);
      const r1: boolean = a.equals(b);
      const r2: boolean = a.equals(b);
      expect(r1).assertTrue();
      expect(r2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_0800
     * @tc.name testLongEquals1_008
     * @tc.desc Verify Long not equal to Map object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(42);
      const m: Map<string, string> = new Map<string, string>();
      const result: boolean = a.equals(m);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_0900
     * @tc.name testLongEquals1_009
     * @tc.desc Verify Long not equal to mismatched double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nmb: double = 43.0;
      let result: boolean = new Long(42).equals(nmb);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_1000
     * @tc.name testLongEquals1_010
     * @tc.desc Verify Long not equal to different small primitive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(1).equals(10);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_1100
     * @tc.name testLongEquals1_011
     * @tc.desc Verify Long.MAX_VALUE not equal to adjacent primitive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(Long.MAX_VALUE).equals(Long.MAX_VALUE - 1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_1200
     * @tc.name testLongEquals1_012
     * @tc.desc Verify Long.MIN_VALUE not equal to adjacent primitive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(Long.MIN_VALUE).equals(Long.MIN_VALUE + 1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_1300
     * @tc.name testLongEquals1_013
     * @tc.desc Verify 10^10 Long not equal to adjacent primitive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(10000000000).equals(9999999999);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_1400
     * @tc.name testLongEquals1_014
     * @tc.desc Verify Long not equal to empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(42).equals('');
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_1500
     * @tc.name testLongEquals1_015
     * @tc.desc Verify Long not equal to equal-valued numeric string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(42).equals('42');
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_1600
     * @tc.name testLongEquals1_016
     * @tc.desc Verify Long zero not equal to zero numeric string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(0).equals('0');
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_1700
     * @tc.name testLongEquals1_017
     * @tc.desc Verify negative Long not equal to matching numeric string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(-1).equals('-1');
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_1800
     * @tc.name testLongEquals1_018
     * @tc.desc Verify Long.MAX_VALUE not equal to matching MAX numeric string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(Long.MAX_VALUE).equals('9223372036854775807');
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_1900
     * @tc.name testLongEquals1_019
     * @tc.desc Verify Long not equal to non-numeric string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(42).equals('abc');
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_2000
     * @tc.name testLongEquals1_020
     * @tc.desc Verify Long not equal to boolean-like string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(42).equals('true');
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_2100
     * @tc.name testLongEquals1_021
     * @tc.desc Verify Long not equal to NaN-like string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(42).equals('Number.NaN');
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_2200
     * @tc.name testLongEquals1_022
     * @tc.desc Verify Long not equal to whitespace string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(42).equals(' ');
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_2300
     * @tc.name testLongEquals1_023
     * @tc.desc Verify Long zero not equal to true boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(0).equals(true);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_2400
     * @tc.name testLongEquals1_024
     * @tc.desc Verify positive Long not equal to true boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(1).equals(true);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_2500
     * @tc.name testLongEquals1_025
     * @tc.desc Verify Long zero not equal to false boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(0).equals(false);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_2600
     * @tc.name testLongEquals1_026
     * @tc.desc Verify positive Long not equal to false boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(1).equals(false);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_2700
     * @tc.name testLongEquals1_027
     * @tc.desc Verify negative Long not equal to true boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(-1).equals(true);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_2800
     * @tc.name testLongEquals1_028
     * @tc.desc Verify Long.MAX_VALUE not equal to true boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(Long.MAX_VALUE).equals(true);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_2900
     * @tc.name testLongEquals1_029
     * @tc.desc Verify Long.MIN_VALUE not equal to false boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(Long.MIN_VALUE).equals(false);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_3000
     * @tc.name testLongEquals1_030
     * @tc.desc Verify Long not equal to Object instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(42).equals(new Object());
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_3100
     * @tc.name testLongEquals1_031
     * @tc.desc Verify Long zero not equal to Object instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(0).equals(new Object());
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_3200
     * @tc.name testLongEquals1_032
     * @tc.desc Verify Long not equal to empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Long[] = [];
      let result: boolean = new Long(42).equals(arr);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_3300
     * @tc.name testLongEquals1_033
     * @tc.desc Verify Long not equal to single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(42).equals([42]);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_3400
     * @tc.name testLongEquals1_034
     * @tc.desc Verify negative Long not equal to Object instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(-1).equals(new Object());
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_3500
     * @tc.name testLongEquals1_035
     * @tc.desc Verify Long not equal to multi-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(42).equals([42, 43]);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_3600
     * @tc.name testLongEquals1_036
     * @tc.desc Verify Long zero not equal to Long.MIN_VALUE primitive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(0).equals(Long.MIN_VALUE);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_3700
     * @tc.name testLongEquals1_037
     * @tc.desc Verify Long zero not equal to underflow primitive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(0).equals(Long.MIN_VALUE - 1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_3800
     * @tc.name testLongEquals1_038
     * @tc.desc Verify Long zero not equal to overflow primitive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(0).equals(Long.MAX_VALUE + 1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_3900
     * @tc.name testLongEquals1_039
     * @tc.desc Verify Long zero not equal to hex literal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(0).equals(0x1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_4000
     * @tc.name testLongEquals1_040
     * @tc.desc Verify Long zero not equal to large hex literal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(0).equals(0xFF);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_4100
     * @tc.name testLongEquals1_041
     * @tc.desc Verify Long zero not equal to negative primitive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(0).equals(-1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_4200
     * @tc.name testLongEquals1_042
     * @tc.desc Verify Long zero not equal to multi-digit negative primitive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(0).equals(-10);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_4300
     * @tc.name testLongEquals1_043
     * @tc.desc Verify Long zero not equal to Long.MAX_VALUE object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(0).equals(new Long(Long.MAX_VALUE));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_4400
     * @tc.name testLongEquals1_044
     * @tc.desc Verify Long zero not equal to Long.MIN_VALUE object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(0).equals(new Long(Long.MIN_VALUE));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_4500
     * @tc.name testLongEquals1_045
     * @tc.desc Verify Long.MAX_VALUE not equal to Long.MIN_VALUE object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(Long.MAX_VALUE).equals(new Long(Long.MIN_VALUE));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_4600
     * @tc.name testLongEquals1_046
     * @tc.desc Verify Long.MAX_VALUE not equal to zero Long object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(Long.MAX_VALUE).equals(new Long(0));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_4700
     * @tc.name testLongEquals1_047
     * @tc.desc Verify Long.MAX_VALUE not equal to negative Long object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(Long.MAX_VALUE).equals(new Long(-1));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_4800
     * @tc.name testLongEquals1_048
     * @tc.desc Verify Long.MIN_VALUE not equal to zero Long object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(Long.MIN_VALUE).equals(new Long(0));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_4900
     * @tc.name testLongEquals1_049
     * @tc.desc Verify Long.MIN_VALUE not equal to negative Long object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(Long.MIN_VALUE).equals(new Long(-1));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_5000
     * @tc.name testLongEquals1_050
     * @tc.desc Verify Long.MAX_VALUE not equal to adjacent MAX-1 Long object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(Long.MAX_VALUE).equals(new Long(9223372036854775806));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_5100
     * @tc.name testLongEquals1_051
     * @tc.desc Verify Long.MIN_VALUE not equal to adjacent MIN+1 Long object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(Long.MIN_VALUE).equals(new Long(-9223372036854775807));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_5200
     * @tc.name testLongEquals1_052
     * @tc.desc Verify Long.MAX_VALUE not equal to 10^10 Long object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(Long.MAX_VALUE).equals(new Long(10000000000));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_EQUALS1_5300
     * @tc.name testLongEquals1_053
     * @tc.desc Verify 10^10 Long not equal to adjacent Long object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongEquals1_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = new Long(10000000000).equals(new Long(10000000001));
      expect(result).assertFalse();
    });
  });
}
