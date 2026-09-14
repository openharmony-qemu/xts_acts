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
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function longProperty1Part1Test(): void {
  describe('LongProperty1Part1Test', (): void => {
    beforeAll(() => {});

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_0100
     * @tc.name testLongProperty1Part1_001
     * @tc.desc Verify Long.MAX_VALUE value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: long = Long.MAX_VALUE;
      expect(v).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_0200
     * @tc.name testLongProperty1Part1_002
     * @tc.desc Verify Long.BIT_SIZE value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = Long.BIT_SIZE;
      expect(v).assertEqual(64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_0300
     * @tc.name testLongProperty1Part1_003
     * @tc.desc Verify Long.BYTE_SIZE value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = Long.BYTE_SIZE;
      expect(v).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_0400
     * @tc.name testLongProperty1Part1_004
     * @tc.desc Verify Long.MIN_VALUE plus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sum: long = Long.MIN_VALUE + 1;
      expect(sum).assertEqual(-9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_0500
     * @tc.name testLongProperty1Part1_005
     * @tc.desc Verify one shifted left by Long.BYTE_SIZE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: byte = Long.BYTE_SIZE;
      const shifted: long = 1 << b;
      expect(shifted).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_0600
     * @tc.name testLongProperty1Part1_006
     * @tc.desc Verify Long.MIN_VALUE value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.MIN_VALUE).assertEqual(-9223372036854775808);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_0700
     * @tc.name testLongProperty1Part1_007
     * @tc.desc Verify Long.MIN_VALUE negated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const neg: long = -Long.MIN_VALUE;
      expect(neg).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_0800
     * @tc.name testLongProperty1Part1_008
     * @tc.desc Verify Long.MIN_VALUE minus one wraps to maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sub: long = Long.MIN_VALUE - 1;
      expect(sub).assertEqual(Long.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_0900
     * @tc.name testLongProperty1Part1_009
     * @tc.desc Verify Long.MIN_VALUE plus negative one wraps to maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const add: long = Long.MIN_VALUE + -1;
      expect(add).assertEqual(Long.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_1000
     * @tc.name testLongProperty1Part1_010
     * @tc.desc Verify Long.MIN_VALUE plus Long.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sum: long = Long.MIN_VALUE + Long.MIN_VALUE;
      expect(sum).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_1100
     * @tc.name testLongProperty1Part1_011
     * @tc.desc Verify Long.MIN_VALUE divided by negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const div: long = Long.MIN_VALUE / -1;
      expect(div).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_1200
     * @tc.name testLongProperty1Part1_012
     * @tc.desc Verify Long.MIN_VALUE ANDed with negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const and: long = Long.MIN_VALUE & -1;
      expect(and).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_1300
     * @tc.name testLongProperty1Part1_013
     * @tc.desc Verify Long.MIN_VALUE ORed with negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const or: long = Long.MIN_VALUE | -1;
      expect(or).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_1400
     * @tc.name testLongProperty1Part1_014
     * @tc.desc Verify Long.MIN_VALUE unsigned shifted right by one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const usr: long = (Long.MIN_VALUE as long) >>> 1;
      expect(usr).assertEqual(4611686018427387904);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_1500
     * @tc.name testLongProperty1Part1_015
     * @tc.desc Verify Long.MIN_VALUE decimal string template representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = `${Long.MIN_VALUE}`;
      expect(str).assertEqual('-9223372036854775808');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_1600
     * @tc.name testLongProperty1Part1_016
     * @tc.desc Verify Long.MIN_VALUE string representation in hexadecimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hex: string = Long.MIN_VALUE.toString(16);
      expect(hex).assertEqual('-8000000000000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_1700
     * @tc.name testLongProperty1Part1_017
     * @tc.desc Verify Long.MAX_VALUE minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sub: long = Long.MAX_VALUE - 1;
      expect(sub).assertEqual(9223372036854775806);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_1800
     * @tc.name testLongProperty1Part1_018
     * @tc.desc Verify Long.MAX_VALUE times two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mul: long = Long.MAX_VALUE * 2;
      expect(mul).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_1900
     * @tc.name testLongProperty1Part1_019
     * @tc.desc Verify Long.MAX_VALUE divided by two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const div: long = Long.MAX_VALUE / 2;
      expect(div).assertEqual(4611686018427387903);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_2000
     * @tc.name testLongProperty1Part1_020
     * @tc.desc Verify Long.MAX_VALUE bitwise complemented
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const not: long = ~Long.MAX_VALUE;
      expect(not).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_2100
     * @tc.name testLongProperty1Part1_021
     * @tc.desc Verify Long.MAX_VALUE ANDed with negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const and: long = Long.MAX_VALUE & -1;
      expect(and).assertEqual(Long.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_2200
     * @tc.name testLongProperty1Part1_022
     * @tc.desc Verify Long.MAX_VALUE XORed with Long.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const xor: long = Long.MAX_VALUE ^ Long.MAX_VALUE;
      expect(xor).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_2300
     * @tc.name testLongProperty1Part1_023
     * @tc.desc Verify Long.MAX_VALUE unsigned shifted right by positive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const usr: long = Long.MAX_VALUE >>> 63;
      expect(usr).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_2400
     * @tc.name testLongProperty1Part1_024
     * @tc.desc Verify Long.MAX_VALUE shifted right by positive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const shr: long = Long.MAX_VALUE >> 63;
      expect(shr).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_2500
     * @tc.name testLongProperty1Part1_025
     * @tc.desc Verify Long.MAX_VALUE shifted left by one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const shl: long = Long.MAX_VALUE << 1;
      expect(shl).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_2600
     * @tc.name testLongProperty1Part1_026
     * @tc.desc Verify Long.MAX_VALUE decimal string template representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = `${Long.MAX_VALUE}`;
      expect(str).assertEqual('9223372036854775807');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_2700
     * @tc.name testLongProperty1Part1_027
     * @tc.desc Verify Long.MAX_VALUE string representation in octal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oct: string = Long.MAX_VALUE.toString(8);
      expect(oct).assertEqual('777777777777777777777');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_2800
     * @tc.name testLongProperty1Part1_028
     * @tc.desc Verify one shifted left by Long.BIT_SIZE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const shl: long = 1 << Long.BIT_SIZE;
      expect(shl).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_2900
     * @tc.name testLongProperty1Part1_029
     * @tc.desc Verify one shifted left by Long.BIT_SIZE minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const shl: long = 1 << (Long.BIT_SIZE - 1);
      expect(shl).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_3000
     * @tc.name testLongProperty1Part1_030
     * @tc.desc Verify Long.BIT_SIZE decimal string template representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = `${Long.BIT_SIZE}`;
      expect(str).assertEqual('64');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_3100
     * @tc.name testLongProperty1Part1_031
     * @tc.desc Verify Long.BYTE_SIZE decimal string template representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = `${Long.BYTE_SIZE}`;
      expect(str).assertEqual('8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_3200
     * @tc.name testLongProperty1Part1_032
     * @tc.desc Verify Long.BIT_SIZE divided by Long.BYTE_SIZE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ratio: int = Long.BIT_SIZE / Long.BYTE_SIZE;
      expect(ratio).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_3300
     * @tc.name testLongProperty1Part1_033
     * @tc.desc Verify Long.MIN_VALUE plus negative two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: long = Long.MIN_VALUE + -2;
      expect(v).assertEqual(Long.MAX_VALUE - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_3400
     * @tc.name testLongProperty1Part1_034
     * @tc.desc Verify Long.MAX_VALUE plus two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: long = Long.MAX_VALUE + 2;
      expect(v).assertEqual(Long.MIN_VALUE + 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_3500
     * @tc.name testLongProperty1Part1_035
     * @tc.desc Verify Long.MAX_VALUE times three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mul: long = Long.MAX_VALUE * 3;
      expect(mul).assertEqual(Long.MAX_VALUE + Long.MAX_VALUE + Long.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_3600
     * @tc.name testLongProperty1Part1_036
     * @tc.desc Verify bit mask of one shifted left by Long.BIT_SIZE minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mask: long = (1 << Long.BIT_SIZE) - 1;
      expect(mask).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_3700
     * @tc.name testLongProperty1Part1_037
     * @tc.desc Verify Long.MIN_VALUE unsigned shifted right by Long.BIT_SIZE minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const usr: long = (Long.MIN_VALUE as long) >>> (Long.BIT_SIZE - 1);
      expect(usr).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_3800
     * @tc.name testLongProperty1Part1_038
     * @tc.desc Verify Long.MAX_VALUE signed shifted right by Long.BIT_SIZE minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const shr: long = Long.MAX_VALUE >> (Long.BIT_SIZE - 1);
      expect(shr).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_3900
     * @tc.name testLongProperty1Part1_039
     * @tc.desc Verify Long.MAX_VALUE times four
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mul: long = Long.MAX_VALUE * 4;
      expect(mul).assertEqual(-4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_4000
     * @tc.name testLongProperty1Part1_040
     * @tc.desc Verify bit mask of one shifted left by Long.BYTE_SIZE times eight minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const byteMask: long = (1 << (Long.BYTE_SIZE * 8)) - 1;
      expect(byteMask).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_4100
     * @tc.name testLongProperty1Part1_041
     * @tc.desc Verify Long.BIT_SIZE plus Long.BYTE_SIZE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sum: int = Long.BIT_SIZE + Long.BYTE_SIZE;
      expect(sum).assertEqual(72);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_4200
     * @tc.name testLongProperty1Part1_042
     * @tc.desc Verify Long.BIT_SIZE minus Long.BYTE_SIZE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const diff: int = Long.BIT_SIZE - Long.BYTE_SIZE;
      expect(diff).assertEqual(56);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_4300
     * @tc.name testLongProperty1Part1_043
     * @tc.desc Verify Long.BYTE_SIZE times three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const shifted: long = 1 << (Long.BYTE_SIZE * 3);
      expect(shifted).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_4400
     * @tc.name testLongProperty1Part1_044
     * @tc.desc Verify Long.MIN_VALUE ORed with one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const or: long = Long.MIN_VALUE | 1;
      expect(or).assertEqual(-9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_4500
     * @tc.name testLongProperty1Part1_045
     * @tc.desc Verify Long.BIT_SIZE converted to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inst: Long = new Long(Long.BIT_SIZE);
      expect(inst.toLong()).assertEqual(64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_4600
     * @tc.name testLongProperty1Part1_046
     * @tc.desc Verify Long.BYTE_SIZE converted to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inst: Long = new Long(Long.BYTE_SIZE);
      expect(inst.toLong()).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_4700
     * @tc.name testLongProperty1Part1_047
     * @tc.desc Verify Long.MIN_VALUE string representation in binary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bin: string = Long.MIN_VALUE.toString(2);
      expect(bin).assertEqual('-1000000000000000000000000000000000000000000000000000000000000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_4800
     * @tc.name testLongProperty1Part1_048
     * @tc.desc Verify Long.MAX_VALUE string representation in binary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bin: string = Long.MAX_VALUE.toString(2);
      expect(bin).assertEqual('111111111111111111111111111111111111111111111111111111111111111');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_4900
     * @tc.name testLongProperty1Part1_049
     * @tc.desc Verify Long.MIN_VALUE string representation in decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: string = Long.MIN_VALUE.toString(10);
      expect(dec).assertEqual('-9223372036854775808');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_5000
     * @tc.name testLongProperty1Part1_050
     * @tc.desc Verify Long.MAX_VALUE string representation in decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: string = Long.MAX_VALUE.toString(10);
      expect(dec).assertEqual('9223372036854775807');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_5100
     * @tc.name testLongProperty1Part1_051
     * @tc.desc Verify Long.BYTE_SIZE used as array index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8];
      const idx: byte = Long.BYTE_SIZE;
      expect(arr[idx - 1]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_5200
     * @tc.name testLongProperty1Part1_052
     * @tc.desc Verify Long.MIN_VALUE modulo ten billion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rem: long = Long.MIN_VALUE % 10000000000;
      expect(rem).assertEqual(-6854775808);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_5300
     * @tc.name testLongProperty1Part1_053
     * @tc.desc Verify Long.MAX_VALUE modulo ten billion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rem: long = Long.MAX_VALUE % 10000000000;
      expect(rem).assertEqual(6854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_5400
     * @tc.name testLongProperty1Part1_054
     * @tc.desc Verify Long.MAX_VALUE positive branch selected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cond: long = Long.MAX_VALUE > 0 ? Long.MAX_VALUE : 0;
      expect(cond).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_5500
     * @tc.name testLongProperty1Part1_055
     * @tc.desc Verify Long.BIT_SIZE divided by eight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.BIT_SIZE / 8).assertEqual(Long.BYTE_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_5600
     * @tc.name testLongProperty1Part1_056
     * @tc.desc Verify Long.MAX_VALUE divided by Long.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.MAX_VALUE / Long.MIN_VALUE).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_5700
     * @tc.name testLongProperty1Part1_057
     * @tc.desc Verify Long.MIN_VALUE modulo Long.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.MIN_VALUE % Long.MAX_VALUE).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_5800
     * @tc.name testLongProperty1Part1_058
     * @tc.desc Verify Long.MIN_VALUE binary string first character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = Long.MIN_VALUE.toString(2);
      expect(s.charAt(0).toString()).assertEqual('-');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_5900
     * @tc.name testLongProperty1Part1_059
     * @tc.desc Verify Long.MIN_VALUE string representation in octal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.MIN_VALUE.toString(8)).assertEqual('-1000000000000000000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_6000
     * @tc.name testLongProperty1Part1_060
     * @tc.desc Verify Long.MIN_VALUE base-36 string length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = Long.MIN_VALUE.toString(36);
      expect(s.length).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_6100
     * @tc.name testLongProperty1Part1_061
     * @tc.desc Verify Long.MIN_VALUE decimal string first character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = Long.MIN_VALUE.toString();
      expect(s.charAt(0).toString()).assertEqual('-');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_6200
     * @tc.name testLongProperty1Part1_062
     * @tc.desc Verify Long.MIN_VALUE decimal string length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.MIN_VALUE.toString().length).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_6300
     * @tc.name testLongProperty1Part1_063
     * @tc.desc Verify Long.MIN_VALUE hexadecimal string first character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = Long.MIN_VALUE.toString(16);
      expect(s.charAt(0).toString()).assertEqual('-');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_6400
     * @tc.name testLongProperty1Part1_064
     * @tc.desc Verify Long.MAX_VALUE binary string first character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = Long.MAX_VALUE.toString(2);
      expect(s.charAt(0).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_6500
     * @tc.name testLongProperty1Part1_065
     * @tc.desc Verify Long.MAX_VALUE string representation in hexadecimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.MAX_VALUE.toString(16)).assertEqual('7fffffffffffffff');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_6600
     * @tc.name testLongProperty1Part1_066
     * @tc.desc Verify Long.MAX_VALUE base-36 string length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = Long.MAX_VALUE.toString(36);
      expect(s.length).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_6700
     * @tc.name testLongProperty1Part1_067
     * @tc.desc Verify Long.MAX_VALUE decimal string first character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = Long.MAX_VALUE.toString();
      let c = s.charAt(0);
      expect(c.toString()).assertEqual('9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_6800
     * @tc.name testLongProperty1Part1_068
     * @tc.desc Verify Long.MAX_VALUE decimal string length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.MAX_VALUE.toString().length).assertEqual(19);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_6900
     * @tc.name testLongProperty1Part1_069
     * @tc.desc Verify Long.MAX_VALUE hexadecimal string first character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = Long.MAX_VALUE.toString(16);
      expect(s.charAt(0).toString()).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_7000
     * @tc.name testLongProperty1Part1_070
     * @tc.desc Verify Long.BIT_SIZE decimal string representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.BIT_SIZE.toString()).assertEqual('64');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_7100
     * @tc.name testLongProperty1Part1_071
     * @tc.desc Verify Long.BYTE_SIZE decimal string representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.BYTE_SIZE.toString()).assertEqual('8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_7200
     * @tc.name testLongProperty1Part1_072
     * @tc.desc Verify Long.BYTE_SIZE string representation in binary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.BYTE_SIZE.toString(2)).assertEqual('1000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_7300
     * @tc.name testLongProperty1Part1_073
     * @tc.desc Verify Long.BIT_SIZE string representation in hexadecimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.BIT_SIZE.toString(16)).assertEqual('40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_7400
     * @tc.name testLongProperty1Part1_074
     * @tc.desc Verify Long.MIN_VALUE minus zero wraps to minimum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.MIN_VALUE - 0).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_7500
     * @tc.name testLongProperty1Part1_075
     * @tc.desc Verify Long.MIN_VALUE divided by negative two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.MIN_VALUE / -2).assertEqual(4611686018427387904);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_7600
     * @tc.name testLongProperty1Part1_076
     * @tc.desc Verify Long.MIN_VALUE modulo negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.MIN_VALUE % -1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_7700
     * @tc.name testLongProperty1Part1_077
     * @tc.desc Verify Long.MAX_VALUE minus zero wraps to maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.MAX_VALUE - 0).assertEqual(Long.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART1_7800
     * @tc.name testLongProperty1Part1_078
     * @tc.desc Verify Long.MAX_VALUE times one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part1_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.MAX_VALUE * 1).assertEqual(Long.MAX_VALUE);
    });
  });
}
