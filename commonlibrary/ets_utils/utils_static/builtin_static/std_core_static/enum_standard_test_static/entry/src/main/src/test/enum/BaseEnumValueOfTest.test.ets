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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import {
  ValueOfByteEnum,
  ValueOfDoubleEnum,
  ValueOfFloatEnum,
  ValueOfIntEnum,
  ValueOfLongEnum,
  ValueOfShortEnum,
  ValueOfStringEnum
} from './EnumDefine.test';
import Utils from './../Util.test';

export default function BaseEnumValueOfTest(): void {
  describe('BaseEnumValueOfTest', (): void => {
    // yield to coroutine scheduler for proper async test execution
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(1);
    });

    /**
     * @tc.name testBaseEnumValueOf001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_0100
     * @tc.desc Verify valueOf normal call without parameters returns underlying value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfIntEnum.HUNDRED;
      let result: int = e.valueOf();
      expect(result).assertEqual(100);
    });

    /**
     * @tc.name testBaseEnumValueOf002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_0200
     * @tc.desc Verify valueOf no-argument call for string type returns correct value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfStringEnum.DEBUG;
      let result: string = e.valueOf();
      expect(result).assertEqual("debug");
    });

    /**
     * @tc.name testBaseEnumValueOf003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_0300
     * @tc.desc Verify valueOf returns correct normal value for byte type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfByteEnum.BYTE_12;
      let result: byte = e.valueOf();
      expect(result).assertEqual(12 as byte);
    });

    /**
     * @tc.name testBaseEnumValueOf004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_0400
     * @tc.desc Verify valueOf returns zero value for byte type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfByteEnum.BYTE_0;
      let result: byte = e.valueOf();
      expect(result).assertEqual(0 as byte);
    });

    /**
     * @tc.name testBaseEnumValueOf005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_0500
     * @tc.desc Verify valueOf returns negative value for byte type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfByteEnum.BYTE_NEG_1;
      let result: byte = e.valueOf();
      expect(result).assertEqual(-1 as byte);
    });

    /**
     * @tc.name testBaseEnumValueOf006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_0600
     * @tc.desc Verify valueOf returns hexadecimal value for byte type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfByteEnum.BYTE_HEX_0A;
      let result: byte = e.valueOf();
      expect(result).assertEqual(0x0A as byte);
    });

    /**
     * @tc.name testBaseEnumValueOf007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_0700
     * @tc.desc Verify valueOf returns maximum value 127 for byte type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfByteEnum.BYTE_MAX;
      let result: byte = e.valueOf();
      expect(result).assertEqual(127 as byte);
    });

    /**
     * @tc.name testBaseEnumValueOf008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_0800
     * @tc.desc Verify valueOf returns minimum value -128 for byte type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfByteEnum.BYTE_MIN;
      let result: byte = e.valueOf();
      expect(result).assertEqual(-128 as byte);
    });

    /**
     * @tc.name testBaseEnumValueOf009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_0900
     * @tc.desc Verify valueOf returns correct normal value for short type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfShortEnum.SHORT_100;
      let result: short = e.valueOf();
      expect(result).assertEqual(100 as short);
    });

    /**
     * @tc.name testBaseEnumValueOf010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_1000
     * @tc.desc Verify valueOf returns zero value for short type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfShortEnum.SHORT_0;
      let result: short = e.valueOf();
      expect(result).assertEqual(0 as short);
    });

    /**
     * @tc.name testBaseEnumValueOf011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_1100
     * @tc.desc Verify valueOf returns hexadecimal value for short type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfShortEnum.SHORT_HEX;
      let result: short = e.valueOf();
      expect(result).assertEqual(0x7FF as short);
    });

    /**
     * @tc.name testBaseEnumValueOf012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_1200
     * @tc.desc Verify valueOf returns negative value for short type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfShortEnum.SHORT_NEG_100;
      let result: short = e.valueOf();
      expect(result).assertEqual(-100 as short);
    });

    /**
     * @tc.name testBaseEnumValueOf013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_1300
     * @tc.desc Verify valueOf returns maximum value 32767 for short type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfShortEnum.SHORT_MAX;
      let result: short = e.valueOf();
      expect(result).assertEqual(32767 as short);
    });

    /**
     * @tc.name testBaseEnumValueOf014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_1400
     * @tc.desc Verify valueOf returns minimum value -32768 for short type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfShortEnum.SHORT_MIN;
      let result: short = e.valueOf();
      expect(result).assertEqual(-32768 as short);
    });

    /**
     * @tc.name testBaseEnumValueOf015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_1500
     * @tc.desc Verify valueOf returns correct normal value for int type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfIntEnum.INT_10000;
      let result: int = e.valueOf();
      expect(result).assertEqual(10000);
    });

    /**
     * @tc.name testBaseEnumValueOf016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_1600
     * @tc.desc Verify valueOf returns zero value for int type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfIntEnum.INT_0;
      let result: int = e.valueOf();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testBaseEnumValueOf017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_1700
     * @tc.desc Verify valueOf returns hexadecimal value for int type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfIntEnum.INT_HEX;
      let result: int = e.valueOf();
      expect(result).assertEqual(0x1234);
    });

    /**
     * @tc.name testBaseEnumValueOf018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_1800
     * @tc.desc Verify valueOf returns negative value for int type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfIntEnum.INT_NEG_1;
      let result: int = e.valueOf();
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name testBaseEnumValueOf019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_1900
     * @tc.desc Verify valueOf returns maximum value 2147483647 for int type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfIntEnum.INT_MAX;
      let result: int = e.valueOf();
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.name testBaseEnumValueOf020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_2000
     * @tc.desc Verify valueOf returns minimum value -2147483648 for int type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfIntEnum.INT_MIN;
      let result: int = e.valueOf();
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.name testBaseEnumValueOf021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_2100
     * @tc.desc Verify valueOf returns correct normal value for long type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfLongEnum.LONG_100;
      let result: long = e.valueOf();
      expect(result).assertEqual(Int.toLong(100));
    });

    /**
     * @tc.name testBaseEnumValueOf022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_2200
     * @tc.desc Verify valueOf returns zero value for long type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfLongEnum.LONG_0;
      let result: long = e.valueOf();
      expect(result).assertEqual(Int.toLong(0));
    });

    /**
     * @tc.name testBaseEnumValueOf023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_2300
     * @tc.desc Verify valueOf returns hexadecimal value for long type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfLongEnum.LONG_HEX;
      let result: long = e.valueOf();
      expect(result).assertEqual(Int.toLong(0x1234));
    });

    /**
     * @tc.name testBaseEnumValueOf024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_2400
     * @tc.desc Verify valueOf returns negative value for long type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfLongEnum.LONG_NEG_1;
      let result: long = e.valueOf();
      expect(result).assertEqual(Int.toLong(-1));
    });

    /**
     * @tc.name testBaseEnumValueOf025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_2500
     * @tc.desc Verify valueOf returns large business number value for long type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfLongEnum.LONG_BIG;
      let result: long = e.valueOf();
      expect(result).assertEqual(10000000000);
    });

    /**
     * @tc.name testBaseEnumValueOf026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_2600
     * @tc.desc Verify valueOf returns maximum value for long type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfLongEnum.LONG_MAX;
      let result: long = e.valueOf();
      expect(result).assertEqual(9223372036854775807);
    });

    /**
     * @tc.name testBaseEnumValueOf027
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_2700
     * @tc.desc Verify valueOf returns minimum value for long type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longMin: long = -9223372036854775807 - 1;
      let e = ValueOfLongEnum.LONG_MIN;
      let result: long = e.valueOf();
      expect(result).assertEqual(longMin);
    });

    /**
     * @tc.name testBaseEnumValueOf028
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_2800
     * @tc.desc Verify valueOf returns correct normal value for float type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfFloatEnum.FLOAT_PI;
      let result: float = e.valueOf();
      expect(result).assertEqual(3.14f);
    });

    /**
     * @tc.name testBaseEnumValueOf029
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_2900
     * @tc.desc Verify valueOf returns zero value for float type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfFloatEnum.FLOAT_0;
      let result: float = e.valueOf();
      expect(result).assertEqual(0.0f);
    });

    /**
     * @tc.name testBaseEnumValueOf030
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_3000
     * @tc.desc Verify valueOf returns negative value for float type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfFloatEnum.FLOAT_NEG;
      let result: float = e.valueOf();
      expect(result).assertEqual(-99.99f);
    });

    /**
     * @tc.name testBaseEnumValueOf031
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_3100
     * @tc.desc Verify valueOf returns scientific notation value for float type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfFloatEnum.FLOAT_1000;
      let result: float = e.valueOf();
      expect(result).assertEqual(1.0e3f);
    });

    /**
     * @tc.name testBaseEnumValueOf032
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_3200
     * @tc.desc Verify valueOf returns whole number value for float type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfFloatEnum.FLOAT_9;
      let result: float = e.valueOf();
      expect(result).assertEqual(9.0f);
    });

    /**
     * @tc.name testBaseEnumValueOf033
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_3300
     * @tc.desc Verify valueOf returns Float.MAX_VALUE for float type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfFloatEnum.FLOAT_MAX;
      let result: float = e.valueOf();
      expect(result).assertEqual(Float.MAX_VALUE);
    });

    /**
     * @tc.name testBaseEnumValueOf034
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_3400
     * @tc.desc Verify valueOf returns Float.MIN_VALUE minimum positive for float type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfFloatEnum.FLOAT_MIN;
      let result: float = e.valueOf();
      expect(result).assertEqual(Float.MIN_VALUE);
    });

    /**
     * @tc.name testBaseEnumValueOf035
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_3500
     * @tc.desc Verify valueOf returns correct normal value for double type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfDoubleEnum.DOUBLE_123_456;
      let result: double = e.valueOf();
      expect(result).assertEqual(123.456);
    });

    /**
     * @tc.name testBaseEnumValueOf036
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_3600
     * @tc.desc Verify valueOf returns zero value for double type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfDoubleEnum.DOUBLE_0;
      let result: double = e.valueOf();
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.name testBaseEnumValueOf037
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_3700
     * @tc.desc Verify valueOf returns negative value for double type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfDoubleEnum.DOUBLE_NEG;
      let result: double = e.valueOf();
      expect(result).assertEqual(-888.88);
    });

    /**
     * @tc.name testBaseEnumValueOf038
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_3800
     * @tc.desc Verify valueOf returns scientific notation value for double type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfDoubleEnum.DOUBLE_1E6;
      let result: double = e.valueOf();
      expect(result).assertEqual(1.0e6);
    });

    /**
     * @tc.name testBaseEnumValueOf039
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_3900
     * @tc.desc Verify valueOf returns whole number value for double type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfDoubleEnum.DOUBLE_9;
      let result: double = e.valueOf();
      expect(result).assertEqual(9.0);
    });

    /**
     * @tc.name testBaseEnumValueOf040
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_4000
     * @tc.desc Verify valueOf returns Double.MAX_VALUE for double type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfDoubleEnum.DOUBLE_MAX;
      let result: double = e.valueOf();
      expect(result).assertEqual(Double.MAX_VALUE);
    });

    /**
     * @tc.name testBaseEnumValueOf041
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_4100
     * @tc.desc Verify valueOf returns Double.MIN_VALUE minimum positive for double type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfDoubleEnum.DOUBLE_MIN;
      let result: double = e.valueOf();
      expect(result).assertEqual(Double.MIN_VALUE);
    });

    /**
     * @tc.name testBaseEnumValueOf042
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_4200
     * @tc.desc Verify valueOf returns Chinese characters string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfStringEnum.TEST_CN;
      let result: string = e.valueOf();
      expect(result).assertEqual("测试");
    });

    /**
     * @tc.name testBaseEnumValueOf043
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_4300
     * @tc.desc Verify valueOf returns numeric string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfStringEnum.NUMERIC;
      let result: string = e.valueOf();
      expect(result).assertEqual("123456");
    });

    /**
     * @tc.name testBaseEnumValueOf044
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_4400
     * @tc.desc Verify valueOf returns special characters string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfStringEnum.SPECIAL;
      let result: string = e.valueOf();
      expect(result).assertEqual("!@#$%^&*()");
    });

    /**
     * @tc.name testBaseEnumValueOf045
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_4500
     * @tc.desc Verify valueOf returns empty string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfStringEnum.EMPTY;
      let result: string = e.valueOf();
      expect(result).assertEqual("");
    });

    /**
     * @tc.name testBaseEnumValueOf046
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_4600
     * @tc.desc Verify valueOf returns space character string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfStringEnum.SPACE;
      let result: string = e.valueOf();
      expect(result).assertEqual(" ");
    });

    /**
     * @tc.name testBaseEnumValueOf047
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_4700
     * @tc.desc Verify valueOf returns Unicode string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfStringEnum.UNICODE;
      let result: string = e.valueOf();
      expect(result).assertEqual("\u4e2d\u6587");
    });

    /**
     * @tc.name testBaseEnumValueOf048
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_4800
     * @tc.desc Verify valueOf returns emoji string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfStringEnum.EMOJI;
      let result: string = e.valueOf();
      expect(result).assertEqual("\uD83D\uDE00");
    });

    /**
     * @tc.name testBaseEnumValueOf049
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_4900
     * @tc.desc Verify valueOf returns multilingual string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfStringEnum.JP;
      let result: string = e.valueOf();
      expect(result).assertEqual("テスト");
    });

    /**
     * @tc.name testBaseEnumValueOf050
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_5000
     * @tc.desc Verify valueOf returns zero-width space string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfStringEnum.ZERO_WIDTH;
      let result: string = e.valueOf();
      expect(result).assertEqual("\u200B");
    });

    /**
     * @tc.name testBaseEnumValueOf051
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_5100
     * @tc.desc Verify valueOf handles XSS script string safely
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfStringEnum.XSS;
      let result: string = e.valueOf();
      expect(result).assertEqual("<script>alert(1)</script>");
    });

    /**
     * @tc.name testBaseEnumValueOf052
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_5200
     * @tc.desc Verify valueOf returns negative zero -0.0f for float type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfFloatEnum.FLOAT_NEG_ZERO;
      let result: float = e.valueOf();
      expect(result).assertEqual(-0.0f);
    });

    /**
     * @tc.name testBaseEnumValueOf053
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_5300
     * @tc.desc Verify valueOf returns negative zero -0.0 for double type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfDoubleEnum.DOUBLE_NEG_ZERO;
      let result: double = e.valueOf();
      expect(result).assertEqual(-0.0);
    });

    /**
     * @tc.name testBaseEnumValueOf054
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_5400
     * @tc.desc Verify valueOf return value equals constructor value parameter for int type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: int = 404;
      let e = ValueOfIntEnum.VALUE_404;
      expect(e.valueOf()).assertEqual(value);
    });

    /**
     * @tc.name testBaseEnumValueOf055
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_5500
     * @tc.desc Verify valueOf return value equals constructor value parameter for string type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: string = "debug";
      let e = ValueOfStringEnum.DEBUG;
      expect(e.valueOf()).assertEqual(value);
    });

    /**
     * @tc.name testBaseEnumValueOf056
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_5600
     * @tc.desc Verify valueOf return value equals constructor value parameter for long type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: long = 9999999999;
      let e = ValueOfLongEnum.VALUE_9999999999;
      expect(e.valueOf()).assertEqual(value);
    });

    /**
     * @tc.name testBaseEnumValueOf057
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_5700
     * @tc.desc Verify valueOf return value equals constructor value parameter for float type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: float = 3.14f;
      let e = ValueOfFloatEnum.FLOAT_PI;
      expect(e.valueOf()).assertEqual(value);
    });

    /**
     * @tc.name testBaseEnumValueOf058
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_5800
     * @tc.desc Verify valueOf return value equals constructor value parameter for double type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: double = 2.718281828;
      let e = ValueOfDoubleEnum.EULER;
      expect(e.valueOf()).assertEqual(value);
    });

    /**
     * @tc.name testBaseEnumValueOf059
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_5900
     * @tc.desc Verify valueOf returns consistent value on multiple calls for int type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfIntEnum.ANSWER;
      let r1: int = e.valueOf();
      let r2: int = e.valueOf();
      let r3: int = e.valueOf();
      expect(r1).assertEqual(r2);
      expect(r2).assertEqual(r3);
      expect(r1).assertEqual(42);
    });

    /**
     * @tc.name testBaseEnumValueOf060
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_6000
     * @tc.desc Verify valueOf returns consistent value on multiple calls for string type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfStringEnum.HELLO;
      let r1: string = e.valueOf();
      let r2: string = e.valueOf();
      let r3: string = e.valueOf();
      expect(r1).assertEqual(r2);
      expect(r2).assertEqual(r3);
      expect(r1).assertEqual("hello");
    });

    /**
     * @tc.name testBaseEnumValueOf061
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_6100
     * @tc.desc Verify valueOf returns consistent value on multiple calls for long type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfLongEnum.VALUE_123456789;
      let r1: long = e.valueOf();
      let r2: long = e.valueOf();
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(Int.toLong(123456789));
    });

    /**
     * @tc.name testBaseEnumValueOf062
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_6200
     * @tc.desc Verify valueOf returns independent values for different int instances
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1 = ValueOfIntEnum.HUNDRED;
      let e2 = ValueOfIntEnum.VALUE_200;
      expect(e1.valueOf()).assertEqual(100);
      expect(e2.valueOf()).assertEqual(200);
      expect(e1.valueOf() === e2.valueOf()).assertFalse();
    });

    /**
     * @tc.name testBaseEnumValueOf063
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_6300
     * @tc.desc Verify valueOf returns different types for different generic type instances
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eInt = ValueOfIntEnum.ANSWER;
      let eStr = ValueOfStringEnum.DEBUG;
      let eLong = ValueOfLongEnum.VALUE_999;
      expect(eInt.valueOf()).assertEqual(42);
      expect(eStr.valueOf()).assertEqual("debug");
      expect(eLong.valueOf()).assertEqual(Int.toLong(999));
    });

    /**
     * @tc.name testBaseEnumValueOf064
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_6400
     * @tc.desc Verify valueOf returns same value for instances with same value different names
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1 = ValueOfIntEnum.ONE_A;
      let e2 = ValueOfIntEnum.ONE_B;
      expect(e1.valueOf()).assertEqual(e2.valueOf());
      expect(e1.valueOf()).assertEqual(1);
    });

    /**
     * @tc.name testBaseEnumValueOf065
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_6500
     * @tc.desc Verify modifying one instance does not affect another instance valueOf
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1 = ValueOfStringEnum.FIRST;
      let e2 = ValueOfStringEnum.SECOND;
      let val1: string = e1.valueOf();
      let val2: string = e2.valueOf();
      expect(val1).assertEqual("first");
      expect(val2).assertEqual("second");
    });

    /**
     * @tc.name testBaseEnumValueOf066
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_6600
     * @tc.desc Verify valueOf returns correct value for string type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfStringEnum.TEST;
      let result: string = e.valueOf();
      expect(result).assertEqual("test");
    });

    /**
     * @tc.name testBaseEnumValueOf067
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_6700
     * @tc.desc Verify valueOf returns correct negative value for int type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = ValueOfIntEnum.VALUE_NEG_100;
      let result: int = e.valueOf();
      expect(result).assertEqual(-100);
    });
  });
}
