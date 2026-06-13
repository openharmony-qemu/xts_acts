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

export default function LongConstructor1Test(): void {
  describe('LongConstructor1Test', () => {
    const CON1_30: int = 30;
    const CON1_STR_0: string = "0";
    const CON1_NEG_5: long = -5;
    const CON1_NEG_1: long = -1;
    const CON1_0_BYTE: byte = 0;
    const CON1_0_SHORT: short = 0;
    const CON1_0_INT: int = 0;
    const CON1_0_LONG: long = 0;
    const CON1_0_FLOAT: float = 0;
    const CON1_0_DOUBLE: double = 0;
    const CON1_1: long = 1;
    const CON1_2: int = 2;
    const CON1_5: long = 5;
    const CON1_10: int = 10;
    const CON1_16: int = 16;
    const CON1_CHAR_NULL: char = c'\0';
    const CON1_STR_NEG_5: string = "-5";
    const CON1_STR_5: string = "5";
    const CON1_STR_EN_US: string = "en-US";

    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(CON1_30);
    });

    afterEach(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_0100
     * @tc.name testLongConstructor1001
     * @tc.desc Verify default constructor creates non-null, non-undefined instance with toString "0"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      expect(value.toString()).assertEqual(CON1_STR_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_0200
     * @tc.name testLongConstructor1002
     * @tc.desc Verify multiple default constructor instances have same toString "0"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: Long = new Long();
      const value2: Long = new Long();
      expect(value1.toString()).assertEqual(CON1_STR_0);
      expect(value2.toString()).assertEqual(CON1_STR_0);
      expect(value1.toString()).assertEqual(value2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_0300
     * @tc.name testLongConstructor1003
     * @tc.desc Verify default constructor instances are equal via equals()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: Long = new Long();
      const value2: Long = new Long();
      expect(value1.equals(value2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_0400
     * @tc.name testLongConstructor1004
     * @tc.desc Verify default constructor instance toByte() returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const result: byte = value.toByte();
      expect(result).assertEqual(CON1_0_BYTE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_0500
     * @tc.name testLongConstructor1005
     * @tc.desc Verify default constructor instance toShort() returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const result: short = value.toShort();
      expect(result).assertEqual(CON1_0_SHORT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_0600
     * @tc.name testLongConstructor1006
     * @tc.desc Verify default constructor instance toInt() returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const result: int = value.toInt();
      expect(result).assertEqual(CON1_0_INT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_0700
     * @tc.name testLongConstructor1007
     * @tc.desc Verify default constructor instance toLong() returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const result: long = value.toLong();
      expect(result).assertEqual(CON1_0_LONG);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_0800
     * @tc.name testLongConstructor1008
     * @tc.desc Verify default constructor instance toFloat() returns 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const result: float = value.toFloat();
      expect(result).assertEqual(CON1_0_FLOAT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_0900
     * @tc.name testLongConstructor1009
     * @tc.desc Verify default constructor instance toDouble() returns 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const result: double = value.toDouble();
      expect(result).assertEqual(CON1_0_DOUBLE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_1000
     * @tc.name testLongConstructor1010
     * @tc.desc Verify default constructor instance toChar() returns null char for value 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const result: char = value.toChar();
      expect(result).assertEqual(CON1_CHAR_NULL);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_1100
     * @tc.name testLongConstructor1011
     * @tc.desc Verify default constructor instance compareTo with equal Long(0) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const other: Long = new Long(CON1_0_LONG);
      const result: int = value.compareTo(other);
      expect(result).assertEqual(CON1_0_INT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_1200
     * @tc.name testLongConstructor1012
     * @tc.desc Verify default constructor instance compareTo with larger Long(1) returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const other: Long = new Long(CON1_1);
      const result: int = value.compareTo(other);
      expect(result).assertEqual(CON1_NEG_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_1300
     * @tc.name testLongConstructor1013
     * @tc.desc Verify default constructor instance compareTo with smaller Long(-1) returns 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const other: Long = new Long(CON1_NEG_1);
      const result: int = value.compareTo(other);
      expect(result).assertEqual(CON1_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_1400
     * @tc.name testLongConstructor1014
     * @tc.desc Verify default constructor instance isLessThan with larger Long(1) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const other: Long = new Long(CON1_1);
      const result: boolean = value.isLessThan(other);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_1500
     * @tc.name testLongConstructor1015
     * @tc.desc Verify default constructor instance isLessThan with equal Long(0) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const other: Long = new Long(CON1_0_LONG);
      const result: boolean = value.isLessThan(other);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_1600
     * @tc.name testLongConstructor1016
     * @tc.desc Verify default constructor instance isLessEqualThan with equal Long(0) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const other: Long = new Long(CON1_0_LONG);
      const result: boolean = value.isLessEqualThan(other);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_1700
     * @tc.name testLongConstructor1017
     * @tc.desc Verify default constructor instance isGreaterThan with smaller Long(-1) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const other: Long = new Long(CON1_NEG_1);
      const result: boolean = value.isGreaterThan(other);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_1800
     * @tc.name testLongConstructor1018
     * @tc.desc Verify default constructor instance isGreaterThan with equal Long(0) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const other: Long = new Long(CON1_0_LONG);
      const result: boolean = value.isGreaterThan(other);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_1900
     * @tc.name testLongConstructor1019
     * @tc.desc Verify default constructor instance isGreaterEqualThan with equal Long(0) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const other: Long = new Long(CON1_0_LONG);
      const result: boolean = value.isGreaterEqualThan(other);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_2000
     * @tc.name testLongConstructor1020
     * @tc.desc Verify default constructor instance add with Long(5) returns Long(5) as additive identity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const result: Long = value.add(new Long(CON1_5));
      expect(result.toString()).assertEqual(CON1_STR_5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_2100
     * @tc.name testLongConstructor1021
     * @tc.desc Verify default constructor instance sub with Long(5) returns Long(-5)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const result: Long = value.sub(new Long(CON1_5));
      expect(result.toString()).assertEqual(CON1_STR_NEG_5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_2200
     * @tc.name testLongConstructor1022
     * @tc.desc Verify default constructor instance mul with Long(5) returns Long(0) as zero multiplier
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const result: Long = value.mul(new Long(CON1_5));
      expect(result.toString()).assertEqual(CON1_STR_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_2300
     * @tc.name testLongConstructor1023
     * @tc.desc Verify default constructor instance div with Long(5) returns Long(0) as zero dividend
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const result: Long = value.div(new Long(CON1_5));
      expect(result.toString()).assertEqual(CON1_STR_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_2400
     * @tc.name testLongConstructor1024
     * @tc.desc Verify default constructor instance toString(2) returns "0" in binary format
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const result: string = value.toString(CON1_2);
      expect(result).assertEqual(CON1_STR_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_2500
     * @tc.name testLongConstructor1025
     * @tc.desc Verify default constructor instance toString(16) returns "0" in hex format
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const result: string = value.toString(CON1_16);
      expect(result).assertEqual(CON1_STR_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_2600
     * @tc.name testLongConstructor1026
     * @tc.desc Verify default constructor instance toLocaleString("en-US") returns "0"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const result: string = value.toLocaleString(CON1_STR_EN_US);
      expect(result).assertEqual(CON1_STR_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_2700
     * @tc.name testLongConstructor1027
     * @tc.desc Verify default constructor produces Long whose toLong() returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      expect(value.toLong()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_2800
     * @tc.name testLongConstructor1028
     * @tc.desc Verify default constructor instance add with negative Long(-5) equals Long(-5)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const result: Long = value.add(new Long(CON1_NEG_5));
      expect(result.toString()).assertEqual(CON1_STR_NEG_5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_2900
     * @tc.name testLongConstructor1029
     * @tc.desc Verify default constructor instance compareTo with Long.MIN_VALUE returns 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const other: Long = new Long(Long.MIN_VALUE);
      const result: int = value.compareTo(other);
      expect(result).assertEqual(CON1_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_3000
     * @tc.name testLongConstructor1030
     * @tc.desc Verify default constructor instance compareTo with Long.MAX_VALUE returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const other: Long = new Long(Long.MAX_VALUE);
      const result: int = value.compareTo(other);
      expect(result).assertEqual(CON1_NEG_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_3100
     * @tc.name testLongConstructor1031
     * @tc.desc Verify default constructor instance equals with explicit Long(0) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const other: Long = new Long(CON1_0_LONG);
      expect(value.equals(other)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_3200
     * @tc.name testLongConstructor1032
     * @tc.desc Verify default constructor instance equals with non-zero Long(10) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const other: Long = new Long(CON1_10);
      expect(value.equals(other)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_3300
     * @tc.name testLongConstructor1033
     * @tc.desc Verify default constructor instance sub with negative Long(-5) returns Long(5)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const result: Long = value.sub(new Long(CON1_NEG_5));
      expect(result.toString()).assertEqual(CON1_STR_5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_3400
     * @tc.name testLongConstructor1034
     * @tc.desc Verify default constructor instance mul with Long(-5) returns Long(0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const result: Long = value.mul(new Long(CON1_NEG_5));
      expect(result.toString()).assertEqual(CON1_STR_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_3500
     * @tc.name testLongConstructor1035
     * @tc.desc Verify default constructor instance div with Long(-5) returns Long(0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const result: Long = value.div(new Long(CON1_NEG_5));
      expect(result.toString()).assertEqual(CON1_STR_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_3600
     * @tc.name testLongConstructor1036
     * @tc.desc Verify default constructor instance isLessThan with negative Long(-1) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const other: Long = new Long(CON1_NEG_1);
      const result: boolean = value.isLessThan(other);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_3700
     * @tc.name testLongConstructor1037
     * @tc.desc Verify default constructor instance isGreaterEqualThan with larger Long(1) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const other: Long = new Long(CON1_1);
      const result: boolean = value.isGreaterEqualThan(other);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_3800
     * @tc.name testLongConstructor1038
     * @tc.desc Verify default constructor instance isGreaterEqualThan with negative Long(-1) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const other: Long = new Long(CON1_NEG_1);
      const result: boolean = value.isGreaterEqualThan(other);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_3900
     * @tc.name testLongConstructor1039
     * @tc.desc Verify default constructor instance isLessEqualThan with larger Long(1) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const other: Long = new Long(CON1_1);
      const result: boolean = value.isLessEqualThan(other);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_4000
     * @tc.name testLongConstructor1040
     * @tc.desc Verify default constructor instance isLessEqualThan with negative Long(-1) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const other: Long = new Long(CON1_NEG_1);
      const result: boolean = value.isLessEqualThan(other);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_4100
     * @tc.name testLongConstructor1041
     * @tc.desc Verify default constructor instance add with Long(0) returns Long(0) as identity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const result: Long = value.add(new Long(CON1_0_LONG));
      expect(result.toString()).assertEqual(CON1_STR_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_4200
     * @tc.name testLongConstructor1042
     * @tc.desc Verify default constructor instance sub with Long(0) returns Long(0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const result: Long = value.sub(new Long(CON1_0_LONG));
      expect(result.toString()).assertEqual(CON1_STR_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_4300
     * @tc.name testLongConstructor1043
     * @tc.desc Verify default constructor instance mul with Long(0) returns Long(0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const result: Long = value.mul(new Long(CON1_0_LONG));
      expect(result.toString()).assertEqual(CON1_STR_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_4400
     * @tc.name testLongConstructor1044
     * @tc.desc Verify default constructor instance toLocaleString with no params returns non-empty string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const result: string = value.toLocaleString();
      expect(result.indexOf("0") >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_4500
     * @tc.name testLongConstructor1045
     * @tc.desc Verify default constructor instance toString(10) returns "0" in decimal format
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      const result: string = value.toString(CON1_10);
      expect(result).assertEqual(CON1_STR_0);
    });
  });
}
