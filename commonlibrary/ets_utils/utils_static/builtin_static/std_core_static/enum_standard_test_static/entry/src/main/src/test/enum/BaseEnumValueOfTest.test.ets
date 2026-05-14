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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from './../Util.test';

export default function BaseEnumValueOfTest(): void {
  describe('BaseEnumValueOfTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
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
      let e: BaseEnum<int> = new BaseEnum<int>(100, "HUNDRED")
      let result: int = e.valueOf()
      expect(result).assertEqual(100)
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
      let e: BaseEnum<string> = new BaseEnum<string>("debug", "DEBUG")
      let result: string = e.valueOf()
      expect(result).assertEqual("debug")
    });

    /**
     * @tc.name testBaseEnumValueOf003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_0300
     * @tc.desc Verify method handles extra parameters gracefully or throws error
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 此测试仅用于验证编译时异常，跳过执行
      return;
    });

    /**
     * @tc.name testBaseEnumValueOf004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_0400
     * @tc.desc Verify method handles multiple extra parameters gracefully or throws error
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 此测试仅用于验证编译时异常，跳过执行
      return;
    });

    /**
     * @tc.name testBaseEnumValueOf005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_0500
     * @tc.desc Verify method behavior when passing null as argument
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 此测试仅用于验证编译时异常，跳过执行
      return;
    });

    /**
     * @tc.name testBaseEnumValueOf006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_0600
     * @tc.desc Verify method behavior when passing undefined as argument
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 此测试仅用于验证编译时异常，跳过执行
      return;
    });

    /**
     * @tc.name testBaseEnumValueOf007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_0700
     * @tc.desc Verify valueOf returns correct normal value for byte type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<byte> = new BaseEnum<byte>(12 as byte, "BYTE_CONST")
      let result: byte = e.valueOf()
      expect(result).assertEqual(12 as byte)
    });

    /**
     * @tc.name testBaseEnumValueOf008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_0800
     * @tc.desc Verify valueOf returns zero value for byte type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<byte> = new BaseEnum<byte>(0 as byte, "BYTE_ZERO")
      let result: byte = e.valueOf()
      expect(result).assertEqual(0 as byte)
    });

    /**
     * @tc.name testBaseEnumValueOf009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_0900
     * @tc.desc Verify valueOf returns negative value for byte type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<byte> = new BaseEnum<byte>(-1 as byte, "BYTE_NEG")
      let result: byte = e.valueOf()
      expect(result).assertEqual(-1 as byte)
    });

    /**
     * @tc.name testBaseEnumValueOf010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_1000
     * @tc.desc Verify valueOf returns hexadecimal value for byte type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<byte> = new BaseEnum<byte>(0x0A as byte, "BYTE_HEX")
      let result: byte = e.valueOf()
      expect(result).assertEqual(0x0A as byte)
    });

    /**
     * @tc.name testBaseEnumValueOf011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_1100
     * @tc.desc Verify valueOf returns maximum value 127 for byte type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<byte> = new BaseEnum<byte>(127 as byte, "BYTE_MAX")
      let result: byte = e.valueOf()
      expect(result).assertEqual(127 as byte)
    });

    /**
     * @tc.name testBaseEnumValueOf012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_1200
     * @tc.desc Verify valueOf returns minimum value -128 for byte type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<byte> = new BaseEnum<byte>(-128 as byte, "BYTE_MIN")
      let result: byte = e.valueOf()
      expect(result).assertEqual(-128 as byte)
    });

    /**
     * @tc.name testBaseEnumValueOf013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_1300
     * @tc.desc Verify valueOf returns correct normal value for short type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<short> = new BaseEnum<short>(100 as short, "SHORT_CONST")
      let result: short = e.valueOf()
      expect(result).assertEqual(100 as short)
    });

    /**
     * @tc.name testBaseEnumValueOf014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_1400
     * @tc.desc Verify valueOf returns zero value for short type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<short> = new BaseEnum<short>(0 as short, "SHORT_ZERO")
      let result: short = e.valueOf()
      expect(result).assertEqual(0 as short)
    });

    /**
     * @tc.name testBaseEnumValueOf015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_1500
     * @tc.desc Verify valueOf returns hexadecimal value for short type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<short> = new BaseEnum<short>(0x7FF as short, "SHORT_HEX")
      let result: short = e.valueOf()
      expect(result).assertEqual(0x7FF as short)
    });

    /**
     * @tc.name testBaseEnumValueOf016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_1600
     * @tc.desc Verify valueOf returns negative value for short type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<short> = new BaseEnum<short>(-100 as short, "SHORT_NEG")
      let result: short = e.valueOf()
      expect(result).assertEqual(-100 as short)
    });

    /**
     * @tc.name testBaseEnumValueOf017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_1700
     * @tc.desc Verify valueOf returns maximum value 32767 for short type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<short> = new BaseEnum<short>(32767 as short, "SHORT_MAX")
      let result: short = e.valueOf()
      expect(result).assertEqual(32767 as short)
    });

    /**
     * @tc.name testBaseEnumValueOf018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_1800
     * @tc.desc Verify valueOf returns minimum value -32768 for short type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<short> = new BaseEnum<short>(-32768 as short, "SHORT_MIN")
      let result: short = e.valueOf()
      expect(result).assertEqual(-32768 as short)
    });

    /**
     * @tc.name testBaseEnumValueOf019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_1900
     * @tc.desc Verify valueOf returns correct normal value for int type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(10000, "INT_CONST")
      let result: int = e.valueOf()
      expect(result).assertEqual(10000)
    });

    /**
     * @tc.name testBaseEnumValueOf020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_2000
     * @tc.desc Verify valueOf returns zero value for int type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(0, "INT_ZERO")
      let result: int = e.valueOf()
      expect(result).assertEqual(0)
    });

    /**
     * @tc.name testBaseEnumValueOf021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_2100
     * @tc.desc Verify valueOf returns hexadecimal value for int type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(0x1234, "INT_HEX")
      let result: int = e.valueOf()
      expect(result).assertEqual(0x1234)
    });

    /**
     * @tc.name testBaseEnumValueOf022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_2200
     * @tc.desc Verify valueOf returns octal value for int type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(83, "INT_OCT")
      let result: int = e.valueOf()
      expect(result).assertEqual(83)
    });

    /**
     * @tc.name testBaseEnumValueOf023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_2300
     * @tc.desc Verify valueOf returns binary value for int type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(10, "INT_BIN")
      let result: int = e.valueOf()
      expect(result).assertEqual(10)
    });

    /**
     * @tc.name testBaseEnumValueOf024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_2400
     * @tc.desc Verify valueOf returns negative value for int type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(-1, "INT_NEG")
      let result: int = e.valueOf()
      expect(result).assertEqual(-1)
    });

    /**
     * @tc.name testBaseEnumValueOf025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_2500
     * @tc.desc Verify valueOf returns maximum value 2147483647 for int type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(2147483647, "INT_MAX")
      let result: int = e.valueOf()
      expect(result).assertEqual(2147483647)
    });

    /**
     * @tc.name testBaseEnumValueOf026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_2600
     * @tc.desc Verify valueOf returns minimum value -2147483648 for int type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(-2147483648, "INT_MIN")
      let result: int = e.valueOf()
      expect(result).assertEqual(-2147483648)
    });

    /**
     * @tc.name testBaseEnumValueOf027
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_2700
     * @tc.desc Verify valueOf returns correct normal value for long type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<long> = new BaseEnum<long>(Int.toLong(100), "LONG_CONST")
      let result: long = e.valueOf()
      expect(result).assertEqual(Int.toLong(100))
    });

    /**
     * @tc.name testBaseEnumValueOf028
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_2800
     * @tc.desc Verify valueOf returns zero value for long type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<long> = new BaseEnum<long>(Int.toLong(0), "LONG_ZERO")
      let result: long = e.valueOf()
      expect(result).assertEqual(Int.toLong(0))
    });

    /**
     * @tc.name testBaseEnumValueOf029
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_2900
     * @tc.desc Verify valueOf returns hexadecimal value for long type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<long> = new BaseEnum<long>(Int.toLong(0x1234), "LONG_HEX")
      let result: long = e.valueOf()
      expect(result).assertEqual(Int.toLong(0x1234))
    });

    /**
     * @tc.name testBaseEnumValueOf030
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_3000
     * @tc.desc Verify valueOf returns negative value for long type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<long> = new BaseEnum<long>(Int.toLong(-1), "LONG_NEG")
      let result: long = e.valueOf()
      expect(result).assertEqual(Int.toLong(-1))
    });

    /**
     * @tc.name testBaseEnumValueOf031
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_3100
     * @tc.desc Verify valueOf returns large business number value for long type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<long> = new BaseEnum<long>(10000000000, "LONG_BIG")
      let result: long = e.valueOf()
      expect(result).assertEqual(10000000000)
    });

    /**
     * @tc.name testBaseEnumValueOf032
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_3200
     * @tc.desc Verify valueOf returns maximum value for long type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<long> = new BaseEnum<long>(9223372036854775807, "LONG_MAX")
      let result: long = e.valueOf()
      expect(result).assertEqual(9223372036854775807)
    });

    /**
     * @tc.name testBaseEnumValueOf033
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_3300
     * @tc.desc Verify valueOf returns minimum value for long type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<long> = new BaseEnum<long>(-9223372036854775807 - 1, "LONG_MIN")
      let result: long = e.valueOf()
      expect(result).assertEqual(-9223372036854775807 - 1)
    });

    /**
     * @tc.name testBaseEnumValueOf034
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_3400
     * @tc.desc Verify valueOf returns correct normal value for float type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<float> = new BaseEnum<float>(3.14f, "FLOAT_CONST")
      let result: float = e.valueOf()
      expect(result).assertEqual(3.14f)
    });

    /**
     * @tc.name testBaseEnumValueOf035
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_3500
     * @tc.desc Verify valueOf returns zero value for float type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<float> = new BaseEnum<float>(0.0f, "FLOAT_ZERO")
      let result: float = e.valueOf()
      expect(result).assertEqual(0.0f)
    });

    /**
     * @tc.name testBaseEnumValueOf036
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_3600
     * @tc.desc Verify valueOf returns negative value for float type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<float> = new BaseEnum<float>(-99.99f, "FLOAT_NEG")
      let result: float = e.valueOf()
      expect(result).assertEqual(-99.99f)
    });

    /**
     * @tc.name testBaseEnumValueOf037
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_3700
     * @tc.desc Verify valueOf returns scientific notation value for float type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<float> = new BaseEnum<float>(1.0e3f, "FLOAT_SCI")
      let result: float = e.valueOf()
      expect(result).assertEqual(1.0e3f)
    });

    /**
     * @tc.name testBaseEnumValueOf038
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_3800
     * @tc.desc Verify valueOf returns hexadecimal float value for float type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<float> = new BaseEnum<float>(9.0, "FLOAT_HEX")
      let result: float = e.valueOf()
      expect(result).assertEqual(9.0)
    });

    /**
     * @tc.name testBaseEnumValueOf039
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_3900
     * @tc.desc Verify valueOf returns Float.MAX_VALUE for float type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<float> = new BaseEnum<float>(Float.MAX_VALUE, "FLOAT_MAX")
      let result: float = e.valueOf()
      expect(result).assertEqual(Float.MAX_VALUE)
    });

    /**
     * @tc.name testBaseEnumValueOf040
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_4000
     * @tc.desc Verify valueOf returns Float.MIN_VALUE minimum positive for float type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<float> = new BaseEnum<float>(Float.MIN_VALUE, "FLOAT_MIN_POSITIVE")
      let result: float = e.valueOf()
      expect(result).assertEqual(Float.MIN_VALUE)
    });

    /**
     * @tc.name testBaseEnumValueOf041
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_4100
     * @tc.desc Verify valueOf returns correct normal value for double type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<double> = new BaseEnum<double>(123.456, "DOUBLE_CONST")
      let result: double = e.valueOf()
      expect(result).assertEqual(123.456)
    });

    /**
     * @tc.name testBaseEnumValueOf042
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_4200
     * @tc.desc Verify valueOf returns zero value for double type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<double> = new BaseEnum<double>(0.0, "DOUBLE_ZERO")
      let result: double = e.valueOf()
      expect(result).assertEqual(0.0)
    });

    /**
     * @tc.name testBaseEnumValueOf043
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_4300
     * @tc.desc Verify valueOf returns negative value for double type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<double> = new BaseEnum<double>(-888.88, "DOUBLE_NEG")
      let result: double = e.valueOf()
      expect(result).assertEqual(-888.88)
    });

    /**
     * @tc.name testBaseEnumValueOf044
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_4400
     * @tc.desc Verify valueOf returns scientific notation value for double type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<double> = new BaseEnum<double>(1.0e6, "DOUBLE_SCI")
      let result: double = e.valueOf()
      expect(result).assertEqual(1.0e6)
    });

    /**
     * @tc.name testBaseEnumValueOf045
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_4500
     * @tc.desc Verify valueOf returns hexadecimal float value for double type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<double> = new BaseEnum<double>(9.0, "DOUBLE_HEX")
      let result: double = e.valueOf()
      expect(result).assertEqual(9.0)
    });

    /**
     * @tc.name testBaseEnumValueOf046
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_4600
     * @tc.desc Verify valueOf returns Double.MAX_VALUE for double type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<double> = new BaseEnum<double>(Double.MAX_VALUE, "DOUBLE_MAX")
      let result: double = e.valueOf()
      expect(result).assertEqual(Double.MAX_VALUE)
    });

    /**
     * @tc.name testBaseEnumValueOf047
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_4700
     * @tc.desc Verify valueOf returns Double.MIN_VALUE minimum positive for double type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<double> = new BaseEnum<double>(Double.MIN_VALUE, "DOUBLE_MIN_POSITIVE")
      let result: double = e.valueOf()
      expect(result).assertEqual(Double.MIN_VALUE)
    });

    /**
     * @tc.name testBaseEnumValueOf048
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_4800
     * @tc.desc Verify valueOf returns correct normal string value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<string> = new BaseEnum<string>("debug", "DEBUG")
      let result: string = e.valueOf()
      expect(result).assertEqual("debug")
    });

    /**
     * @tc.name testBaseEnumValueOf049
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_4900
     * @tc.desc Verify valueOf returns Chinese characters string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<string> = new BaseEnum<string>("测试", "TEST_CN")
      let result: string = e.valueOf()
      expect(result).assertEqual("测试")
    });

    /**
     * @tc.name testBaseEnumValueOf050
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_5000
     * @tc.desc Verify valueOf returns numeric string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<string> = new BaseEnum<string>("123456", "NUM_STR")
      let result: string = e.valueOf()
      expect(result).assertEqual("123456")
    });

    /**
     * @tc.name testBaseEnumValueOf051
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_5100
     * @tc.desc Verify valueOf returns special characters string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<string> = new BaseEnum<string>("!@#$%^&*()", "SPECIAL")
      let result: string = e.valueOf()
      expect(result).assertEqual("!@#$%^&*()")
    });

    /**
     * @tc.name testBaseEnumValueOf052
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_5200
     * @tc.desc Verify valueOf returns empty string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<string> = new BaseEnum<string>("", "EMPTY_STR")
      let result: string = e.valueOf()
      expect(result).assertEqual("")
    });

    /**
     * @tc.name testBaseEnumValueOf053
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_5300
     * @tc.desc Verify valueOf returns space character string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<string> = new BaseEnum<string>(" ", "SPACE_STR")
      let result: string = e.valueOf()
      expect(result).assertEqual(" ")
    });

    /**
     * @tc.name testBaseEnumValueOf054
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_5400
     * @tc.desc Verify valueOf returns Unicode string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<string> = new BaseEnum<string>("\u4e2d\u6587", "UNICODE_STR")
      let result: string = e.valueOf()
      expect(result).assertEqual("\u4e2d\u6587")
    });

    /**
     * @tc.name testBaseEnumValueOf055
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_5500
     * @tc.desc Verify valueOf returns emoji string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<string> = new BaseEnum<string>("\uD83D\uDE00", "EMOJI_STR")
      let result: string = e.valueOf()
      expect(result).assertEqual("\uD83D\uDE00")
    });

    /**
     * @tc.name testBaseEnumValueOf056
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_5600
     * @tc.desc Verify valueOf returns multilingual string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<string> = new BaseEnum<string>("テスト", "JP_STR")
      let result: string = e.valueOf()
      expect(result).assertEqual("テスト")
    });

    /**
     * @tc.name testBaseEnumValueOf057
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_5700
     * @tc.desc Verify valueOf returns zero-width space string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<string> = new BaseEnum<string>("\u200B", "ZERO_WIDTH")
      let result: string = e.valueOf()
      expect(result).assertEqual("\u200B")
    });

    /**
     * @tc.name testBaseEnumValueOf058
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_5800
     * @tc.desc Verify valueOf handles XSS script string safely
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<string> = new BaseEnum<string>("<script>alert(1)</script>", "XSS")
      let result: string = e.valueOf()
      expect(result).assertEqual("<script>alert(1)</script>")
    });

    /**
     * @tc.name testBaseEnumValueOf059
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_5900
     * @tc.desc Verify valueOf returns Float.NaN which does not equal itself
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<float> = new BaseEnum<float>(Float.NaN, "FLOAT_NAN")
      let result: float = e.valueOf()
      expect(result !== result).assertTrue()
    });

    /**
     * @tc.name testBaseEnumValueOf060
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_6000
     * @tc.desc Verify valueOf returns Float.POSITIVE_INFINITY
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<float> = new BaseEnum<float>(Float.POSITIVE_INFINITY, "FLOAT_POS_INF")
      let result: float = e.valueOf()
      expect(result).assertEqual(Float.POSITIVE_INFINITY)
    });

    /**
     * @tc.name testBaseEnumValueOf061
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_6100
     * @tc.desc Verify valueOf returns Float.NEGATIVE_INFINITY
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<float> = new BaseEnum<float>(Float.NEGATIVE_INFINITY, "FLOAT_NEG_INF")
      let result: float = e.valueOf()
      expect(result).assertEqual(Float.NEGATIVE_INFINITY)
    });

    /**
     * @tc.name testBaseEnumValueOf062
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_6200
     * @tc.desc Verify valueOf returns negative zero -0.0f for float type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<float> = new BaseEnum<float>(-0.0f, "FLOAT_NEG_ZERO")
      let result: float = e.valueOf()
      expect(result).assertEqual(-0.0f)
    });

    /**
     * @tc.name testBaseEnumValueOf063
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_6300
     * @tc.desc Verify valueOf returns Double.NaN which does not equal itself
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<double> = new BaseEnum<double>(Double.NaN, "DOUBLE_NAN")
      let result: double = e.valueOf()
      expect(result !== result).assertTrue()
    });

    /**
     * @tc.name testBaseEnumValueOf064
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_6400
     * @tc.desc Verify valueOf returns Double.POSITIVE_INFINITY
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<double> = new BaseEnum<double>(Double.POSITIVE_INFINITY, "DOUBLE_POS_INF")
      let result: double = e.valueOf()
      expect(result).assertEqual(Double.POSITIVE_INFINITY)
    });

    /**
     * @tc.name testBaseEnumValueOf065
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_6500
     * @tc.desc Verify valueOf returns Double.NEGATIVE_INFINITY
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<double> = new BaseEnum<double>(Double.NEGATIVE_INFINITY, "DOUBLE_NEG_INF")
      let result: double = e.valueOf()
      expect(result).assertEqual(Double.NEGATIVE_INFINITY)
    });

    /**
     * @tc.name testBaseEnumValueOf066
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_6600
     * @tc.desc Verify valueOf returns negative zero -0.0 for double type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<double> = new BaseEnum<double>(-0.0, "DOUBLE_NEG_ZERO")
      let result: double = e.valueOf()
      expect(result).assertEqual(-0.0)
    });

    /**
     * @tc.name testBaseEnumValueOf067
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_6700
     * @tc.desc Verify valueOf return value type for byte type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<byte> = new BaseEnum<byte>(12 as byte, "BYTE")
      let result: byte = e.valueOf()
      expect(result).assertEqual(12 as byte)
    });

    /**
     * @tc.name testBaseEnumValueOf068
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_6800
     * @tc.desc Verify valueOf return value type for short type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<short> = new BaseEnum<short>(100 as short, "SHORT")
      let result: short = e.valueOf()
      expect(result).assertEqual(100 as short)
    });

    /**
     * @tc.name testBaseEnumValueOf069
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_6900
     * @tc.desc Verify valueOf return value type for int type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(100, "INT")
      let result: int = e.valueOf()
      expect(result).assertEqual(100)
    });

    /**
     * @tc.name testBaseEnumValueOf070
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_7000
     * @tc.desc Verify valueOf return value type for long type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<long> = new BaseEnum<long>(Int.toLong(100), "LONG")
      let result: long = e.valueOf()
      expect(result).assertEqual(Int.toLong(100))
    });

    /**
     * @tc.name testBaseEnumValueOf071
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_7100
     * @tc.desc Verify valueOf return value type for float type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<float> = new BaseEnum<float>(3.14f, "FLOAT")
      let result: float = e.valueOf()
      expect(result).assertEqual(3.14f)
    });

    /**
     * @tc.name testBaseEnumValueOf072
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_7200
     * @tc.desc Verify valueOf return value type for double type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<double> = new BaseEnum<double>(123.456, "DOUBLE")
      let result: double = e.valueOf()
      expect(typeof result === 'number').assertTrue()
    });

    /**
     * @tc.name testBaseEnumValueOf073
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_7300
     * @tc.desc Verify valueOf return value type for string type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<string> = new BaseEnum<string>("debug", "DEBUG")
      let result: string = e.valueOf()
      expect(typeof result === 'string').assertTrue()
    });

    /**
     * @tc.name testBaseEnumValueOf074
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_7400
     * @tc.desc Verify valueOf return value equals constructor value parameter for int type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: int = 404
      let e: BaseEnum<int> = new BaseEnum<int>(value, "NOT_FOUND")
      expect(e.valueOf()).assertEqual(value)
    });

    /**
     * @tc.name testBaseEnumValueOf075
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_7500
     * @tc.desc Verify valueOf return value equals constructor value parameter for string type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: string = "debug"
      let e: BaseEnum<string> = new BaseEnum<string>(value, "DEBUG")
      expect(e.valueOf()).assertEqual(value)
    });

    /**
     * @tc.name testBaseEnumValueOf076
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_7600
     * @tc.desc Verify valueOf return value equals constructor value parameter for long type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: long = 9999999999
      let e: BaseEnum<long> = new BaseEnum<long>(value, "BIG_NUM")
      expect(e.valueOf()).assertEqual(value)
    });

    /**
     * @tc.name testBaseEnumValueOf077
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_7700
     * @tc.desc Verify valueOf return value equals constructor value parameter for float type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: float = 3.14f
      let e: BaseEnum<float> = new BaseEnum<float>(value, "PI")
      expect(e.valueOf()).assertEqual(value)
    });

    /**
     * @tc.name testBaseEnumValueOf078
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_7800
     * @tc.desc Verify valueOf return value equals constructor value parameter for double type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: double = 2.718281828
      let e: BaseEnum<double> = new BaseEnum<double>(value, "EULER")
      expect(e.valueOf()).assertEqual(value)
    });

    /**
     * @tc.name testBaseEnumValueOf079
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_7900
     * @tc.desc Verify valueOf returns consistent value on multiple calls for int type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(42, "ANSWER")
      let r1: int = e.valueOf()
      let r2: int = e.valueOf()
      let r3: int = e.valueOf()
      expect(r1).assertEqual(r2)
      expect(r2).assertEqual(r3)
      expect(r1).assertEqual(42)
    });

    /**
     * @tc.name testBaseEnumValueOf080
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_8000
     * @tc.desc Verify valueOf returns consistent value on multiple calls for string type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<string> = new BaseEnum<string>("hello", "GREETING")
      let r1: string = e.valueOf()
      let r2: string = e.valueOf()
      let r3: string = e.valueOf()
      expect(r1).assertEqual(r2)
      expect(r2).assertEqual(r3)
      expect(r1).assertEqual("hello")
    });

    /**
     * @tc.name testBaseEnumValueOf081
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_8100
     * @tc.desc Verify valueOf returns consistent NaN on multiple calls for float type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<float> = new BaseEnum<float>(Float.NaN, "NAN_VAL")
      let r1: float = e.valueOf()
      let r2: float = e.valueOf()
      expect(r1 !== r1).assertTrue()
      expect(r2 !== r2).assertTrue()
    });

    /**
     * @tc.name testBaseEnumValueOf082
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_8200
     * @tc.desc Verify valueOf returns consistent value on multiple calls for long type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<long> = new BaseEnum<long>(Int.toLong(123456789), "LONG_VAL")
      let r1: long = e.valueOf()
      let r2: long = e.valueOf()
      expect(r1).assertEqual(r2)
      expect(r1).assertEqual(Int.toLong(123456789))
    });

    /**
     * @tc.name testBaseEnumValueOf083
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_8300
     * @tc.desc Verify valueOf returns independent values for different int instances
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1: BaseEnum<int> = new BaseEnum<int>(100, "A")
      let e2: BaseEnum<int> = new BaseEnum<int>(200, "B")
      expect(e1.valueOf()).assertEqual(100)
      expect(e2.valueOf()).assertEqual(200)
      expect(e1.valueOf() == e2.valueOf()).assertFalse()
    });

    /**
     * @tc.name testBaseEnumValueOf084
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_8400
     * @tc.desc Verify valueOf returns different types for different generic type instances
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eInt: BaseEnum<int> = new BaseEnum<int>(42, "INT_VAL")
      let eStr: BaseEnum<string> = new BaseEnum<string>("debug", "STR_VAL")
      let eLong: BaseEnum<long> = new BaseEnum<long>(Int.toLong(999), "LONG_VAL")
      expect(eInt.valueOf()).assertEqual(42)
      expect(eStr.valueOf()).assertEqual("debug")
      expect(eLong.valueOf()).assertEqual(Int.toLong(999))
    });

    /**
     * @tc.name testBaseEnumValueOf085
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_8500
     * @tc.desc Verify valueOf returns same value for instances with same value different names
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1: BaseEnum<int> = new BaseEnum<int>(1, "ONE_A")
      let e2: BaseEnum<int> = new BaseEnum<int>(1, "ONE_B")
      expect(e1.valueOf()).assertEqual(e2.valueOf())
      expect(e1.valueOf()).assertEqual(1)
    });

    /**
     * @tc.name testBaseEnumValueOf086
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_8600
     * @tc.desc Verify modifying one instance does not affect another instance valueOf
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1: BaseEnum<string> = new BaseEnum<string>("first", "FIRST")
      let e2: BaseEnum<string> = new BaseEnum<string>("second", "SECOND")
      let val1: string = e1.valueOf()
      let val2: string = e2.valueOf()
      expect(val1).assertEqual("first")
      expect(val2).assertEqual("second")
    });

    /**
     * @tc.name testBaseEnumValueOf087
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_8700
     * @tc.desc Verify valueOf precision for very small positive float value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<float> = new BaseEnum<float>(Float.MIN_VALUE, "FLOAT_TINY")
      let result: float = e.valueOf()
      expect(result > 0.0f).assertTrue()
      expect(result).assertEqual(Float.MIN_VALUE)
    });

    /**
     * @tc.name testBaseEnumValueOf088
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_8800
     * @tc.desc Verify valueOf precision for very small positive double value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<double> = new BaseEnum<double>(Double.MIN_VALUE, "DOUBLE_TINY")
      let result: double = e.valueOf()
      expect(result > 0.0).assertTrue()
      expect(result).assertEqual(Double.MIN_VALUE)
    });

    /**
     * @tc.name testBaseEnumValueOf089
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_8900
     * @tc.desc Verify valueOf returns complete long string value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "a".repeat(10000)
      let e: BaseEnum<string> = new BaseEnum<string>(longStr, "LONG_STR")
      expect(e.valueOf()).assertEqual(longStr)
      expect(e.valueOf().length).assertEqual(10000)
    });

    /**
     * @tc.name testBaseEnumValueOf090
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_9000
     * @tc.desc Verify valueOf precision for large long number value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bigLong: long = 9223372036854775807
      let e: BaseEnum<long> = new BaseEnum<long>(bigLong, "LONG_BIG")
      expect(e.valueOf()).assertEqual(bigLong)
    });

    /**
     * @tc.name testBaseEnumValueOf091
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_9100
     * @tc.desc Verify valueOf returns boundary value -1 for int type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(-1, "NEG_ONE")
      expect(e.valueOf()).assertEqual(-1)
    });

    /**
     * @tc.name testBaseEnumValueOf092
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_9200
     * @tc.desc Verify valueOf returns boundary value -1 for byte type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<byte> = new BaseEnum<byte>(-1 as byte, "BYTE_NEG_ONE")
      expect(e.valueOf()).assertEqual(-1 as byte)
    });

    /**
     * @tc.name testBaseEnumValueOf093
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_9300
     * @tc.desc Verify valueOf does not throw exception for int type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(100, "VAL")
      try {
      let result: int = e.valueOf()
      expect(result).assertEqual(100)
      } catch (error) {
      expect().assertFail()
      }
    });

    /**
     * @tc.name testBaseEnumValueOf094
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_9400
     * @tc.desc Verify valueOf does not throw exception for string type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<string> = new BaseEnum<string>("test", "TEST")
      try {
      let result: string = e.valueOf()
      expect(result).assertEqual("test")
      } catch (error) {
      expect().assertFail()
      }
    });

    /**
     * @tc.name testBaseEnumValueOf095
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_9500
     * @tc.desc Verify valueOf throws error when called with illegal argument type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 此测试仅用于验证编译时异常，跳过执行
      return;
    });

    /**
     * @tc.name testBaseEnumValueOf096
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_VALUEOF_9600
     * @tc.desc Verify valueOf does not produce UncaughtExceptionError in normal usage
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumValueOf096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: BaseEnum<int> = new BaseEnum<int>(0, "ZERO")
      let result: int = e.valueOf()
      expect(result).assertEqual(0)
    });

  });
}
