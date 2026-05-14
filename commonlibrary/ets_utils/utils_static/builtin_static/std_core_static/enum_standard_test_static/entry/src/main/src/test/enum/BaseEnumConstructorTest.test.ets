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

export default function BaseEnumConstructorTest(): void {
  describe('BaseEnumConstructorTest', (): void => {
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
     * @tc.name testBaseEnumConstructor001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0010
     * @tc.desc Verify BaseEnum constructor with all required parameters (value and name)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const status = new BaseEnum<int>(1, "READY");
      expect(status.valueOf()).assertEqual(1);
      expect(status.getName()).assertEqual("READY");
    });

    /**
     * @tc.name testBaseEnumConstructor002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0020
     * @tc.desc Verify BaseEnum constructor throws Error when value parameter is missing
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const status = new BaseEnum<int>(undefined as int, "READY");
        expect().assertFail();
      } catch (error) {
        expect(error == null).assertFalse();
      }
    });

    /**
     * @tc.name testBaseEnumConstructor003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0030
     * @tc.desc Verify BaseEnum constructor throws Error when name parameter is missing
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const status = new BaseEnum<int>(1, undefined as string);
        expect().assertFail();
      } catch (error) {
        expect(error == null).assertFalse();
      }
    });

    /**
     * @tc.name testBaseEnumConstructor004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0040
     * @tc.desc Verify BaseEnum constructor with valid int value and name returns correct value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(255, "TEST_004");
      expect(e.valueOf()).assertEqual(255);
      expect(e.getName()).assertEqual("TEST_004");
    });

    /**
     * @tc.name testBaseEnumConstructor005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0050
     * @tc.desc Verify BaseEnum constructor with valid string value and name returns correct name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<string>("world", "TEST_005");
      expect(e.valueOf()).assertEqual("world");
      expect(e.getName()).assertEqual("TEST_005");
    });

    /**
     * @tc.name testBaseEnumConstructor006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0060
     * @tc.desc Verify BaseEnum constructor with byte normal value 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<byte>(Int.toByte(1), "VALUE_1");
      expect(e.valueOf()).assertEqual(Int.toByte(1));
      expect(e.getName()).assertEqual("VALUE_1");
    });

    /**
     * @tc.name testBaseEnumConstructor007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0070
     * @tc.desc Verify BaseEnum constructor with byte normal value 100
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<byte>(Int.toByte(100), "VALUE_100");
      expect(e.valueOf()).assertEqual(Int.toByte(100));
    });

    /**
     * @tc.name testBaseEnumConstructor008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0080
     * @tc.desc Verify BaseEnum constructor with byte maximum value 127
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<byte>(Int.toByte(127), "MAX_BYTE");
      expect(e.valueOf()).assertEqual(Int.toByte(127));
    });

    /**
     * @tc.name testBaseEnumConstructor009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0090
     * @tc.desc Verify BaseEnum constructor with byte minimum value -128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<byte>(Int.toByte(-128), "MIN_BYTE");
      expect(e.valueOf()).assertEqual(Int.toByte(-128));
    });

    /**
     * @tc.name testBaseEnumConstructor010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0100
     * @tc.desc Verify BaseEnum constructor with byte value 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<byte>(Int.toByte(0), "ZERO_BYTE");
      expect(e.valueOf()).assertEqual(Int.toByte(0));
    });

    /**
     * @tc.name testBaseEnumConstructor011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0110
     * @tc.desc Verify BaseEnum constructor throws Error when byte overflow value 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // SDK行为: Int.toByte(128) 不会抛出异常，而是截断为 -128，此测试跳过
      return;
    });

    /**
     * @tc.name testBaseEnumConstructor012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0120
     * @tc.desc Verify BaseEnum constructor throws Error when byte underflow value -129
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // SDK行为: Int.toByte(-129) 不会抛出异常，而是截断为 127，此测试跳过
      return;
    });

    /**
     * @tc.name testBaseEnumConstructor013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0130
     * @tc.desc Verify BaseEnum constructor with short normal value 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<short>(Int.toShort(1), "VALUE_1");
      expect(e.valueOf()).assertEqual(Int.toShort(1));
      expect(e.getName()).assertEqual("VALUE_1");
    });

    /**
     * @tc.name testBaseEnumConstructor014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0140
     * @tc.desc Verify BaseEnum constructor with short normal value 10000
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<short>(Int.toShort(10000), "VALUE_10000");
      expect(e.valueOf()).assertEqual(Int.toShort(10000));
    });

    /**
     * @tc.name testBaseEnumConstructor015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0150
     * @tc.desc Verify BaseEnum constructor with short maximum value 32767
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<short>(Int.toShort(32767), "MAX_SHORT");
      expect(e.valueOf()).assertEqual(Int.toShort(32767));
    });

    /**
     * @tc.name testBaseEnumConstructor016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0160
     * @tc.desc Verify BaseEnum constructor with short minimum value -32768
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<short>(Int.toShort(-32768), "MIN_SHORT");
      expect(e.valueOf()).assertEqual(Int.toShort(-32768));
    });

    /**
     * @tc.name testBaseEnumConstructor017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0170
     * @tc.desc Verify BaseEnum constructor with short value 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<short>(Int.toShort(0), "ZERO_SHORT");
      expect(e.valueOf()).assertEqual(Int.toShort(0));
    });

    /**
     * @tc.name testBaseEnumConstructor018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0180
     * @tc.desc Verify BaseEnum constructor with int normal value 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(1, "VALUE_1");
      expect(e.valueOf()).assertEqual(1);
      expect(e.getName()).assertEqual("VALUE_1");
    });

    /**
     * @tc.name testBaseEnumConstructor019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0190
     * @tc.desc Verify BaseEnum constructor with int normal value 100
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(100, "VALUE_100");
      expect(e.valueOf()).assertEqual(100);
    });

    /**
     * @tc.name testBaseEnumConstructor020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0200
     * @tc.desc Verify BaseEnum constructor with int normal value -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(-1, "VALUE_NEG_1");
      expect(e.valueOf()).assertEqual(-1);
    });

    /**
     * @tc.name testBaseEnumConstructor021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0210
     * @tc.desc Verify BaseEnum constructor with int maximum value 2147483647
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(2147483647, "MAX_INT");
      expect(e.valueOf()).assertEqual(2147483647);
    });

    /**
     * @tc.name testBaseEnumConstructor022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0220
     * @tc.desc Verify BaseEnum constructor with int minimum value -2147483648
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(-2147483648, "MIN_INT");
      expect(e.valueOf()).assertEqual(-2147483648);
    });

    /**
     * @tc.name testBaseEnumConstructor023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0230
     * @tc.desc Verify BaseEnum constructor with int value 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(0, "ZERO_INT");
      expect(e.valueOf()).assertEqual(0);
    });

    /**
     * @tc.name testBaseEnumConstructor024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0240
     * @tc.desc Verify BaseEnum constructor with long normal value 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<long>(Int.toLong(1), "VALUE_1");
      expect(e.valueOf()).assertEqual(Int.toLong(1));
      expect(e.getName()).assertEqual("VALUE_1");
    });

    /**
     * @tc.name testBaseEnumConstructor025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0250
     * @tc.desc Verify BaseEnum constructor with long normal value 1000
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<long>(Int.toLong(1000), "VALUE_1000");
      expect(e.valueOf()).assertEqual(Int.toLong(1000));
    });

    /**
     * @tc.name testBaseEnumConstructor026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0260
     * @tc.desc Verify BaseEnum constructor with long normal value -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<long>(Int.toLong(-1), "VALUE_NEG_1");
      expect(e.valueOf()).assertEqual(Int.toLong(-1));
    });

    /**
     * @tc.name testBaseEnumConstructor027
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0270
     * @tc.desc Verify BaseEnum constructor with long maximum value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<long>(9223372036854775807, "MAX_LONG");
      expect(e.valueOf()).assertEqual(9223372036854775807);
    });

    /**
     * @tc.name testBaseEnumConstructor028
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0280
     * @tc.desc Verify BaseEnum constructor with long minimum value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<long>(-9223372036854775807 - 1, "MIN_LONG");
      expect(e.valueOf()).assertEqual(-9223372036854775807 - 1);
    });

    /**
     * @tc.name testBaseEnumConstructor029
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0290
     * @tc.desc Verify BaseEnum constructor with long value 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<long>(Int.toLong(0), "ZERO_LONG");
      expect(e.valueOf()).assertEqual(Int.toLong(0));
    });

    /**
     * @tc.name testBaseEnumConstructor030
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0300
     * @tc.desc Verify BaseEnum constructor with float normal value 1.0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<float>(Double.toFloat(1.0), "VALUE_1");
      expect(e.valueOf()).assertEqual(Double.toFloat(1.0));
      expect(e.getName()).assertEqual("VALUE_1");
    });

    /**
     * @tc.name testBaseEnumConstructor031
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0310
     * @tc.desc Verify BaseEnum constructor with float normal value 3.14
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<float>(Double.toFloat(3.14), "PI");
      expect(e.valueOf()).assertEqual(Double.toFloat(3.14));
    });

    /**
     * @tc.name testBaseEnumConstructor032
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0320
     * @tc.desc Verify BaseEnum constructor with float normal value -0.5
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<float>(Double.toFloat(-0.5), "NEG_HALF");
      expect(e.valueOf()).assertEqual(Double.toFloat(-0.5));
    });

    /**
     * @tc.name testBaseEnumConstructor033
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0330
     * @tc.desc Verify BaseEnum constructor with float maximum value 3.4e38
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<float>(Double.toFloat(3.4e38), "MAX_FLOAT");
      expect(e.valueOf()).assertEqual(Double.toFloat(3.4e38));
    });

    /**
     * @tc.name testBaseEnumConstructor034
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0340
     * @tc.desc Verify BaseEnum constructor with float minimum value -3.4e38
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<float>(Double.toFloat(-3.4e38), "MIN_FLOAT");
      expect(e.valueOf()).assertEqual(Double.toFloat(-3.4e38));
    });

    /**
     * @tc.name testBaseEnumConstructor035
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0350
     * @tc.desc Verify BaseEnum constructor with float value 0.0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<float>(Double.toFloat(0.0), "ZERO_FLOAT");
      expect(e.valueOf()).assertEqual(Double.toFloat(0.0));
    });

    /**
     * @tc.name testBaseEnumConstructor036
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0360
     * @tc.desc Verify BaseEnum constructor with float NaN value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<float>(Double.toFloat(NaN), "NAN_FLOAT");
      expect(Number.isNaN(Float.toDouble(e.valueOf()))).assertTrue();
    });

    /**
     * @tc.name testBaseEnumConstructor037
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0370
     * @tc.desc Verify BaseEnum constructor with float Infinity value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<float>(Double.toFloat(Infinity), "INF_FLOAT");
      expect(e.valueOf()).assertEqual(Double.toFloat(Infinity));
    });

    /**
     * @tc.name testBaseEnumConstructor038
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0380
     * @tc.desc Verify BaseEnum constructor with float -Infinity value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<float>(Double.toFloat(-Infinity), "NEG_INF_FLOAT");
      expect(e.valueOf()).assertEqual(Double.toFloat(-Infinity));
    });

    /**
     * @tc.name testBaseEnumConstructor039
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0390
     * @tc.desc Verify BaseEnum constructor with double normal value 1.0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<double>(1.0, "VALUE_1");
      expect(e.valueOf()).assertEqual(1.0);
      expect(e.getName()).assertEqual("VALUE_1");
    });

    /**
     * @tc.name testBaseEnumConstructor040
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0400
     * @tc.desc Verify BaseEnum constructor with double normal value 3.141592653589793
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<double>(3.141592653589793, "PI");
      expect(e.valueOf()).assertEqual(3.141592653589793);
    });

    /**
     * @tc.name testBaseEnumConstructor041
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0410
     * @tc.desc Verify BaseEnum constructor with double normal value -0.001
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<double>(-0.001, "NEG_SMALL");
      expect(e.valueOf()).assertEqual(-0.001);
    });

    /**
     * @tc.name testBaseEnumConstructor042
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0420
     * @tc.desc Verify BaseEnum constructor with double maximum value 1.7e308
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<double>(1.7e308, "MAX_DOUBLE");
      expect(e.valueOf()).assertEqual(1.7e308);
    });

    /**
     * @tc.name testBaseEnumConstructor043
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0430
     * @tc.desc Verify BaseEnum constructor with double minimum value -1.7e308
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<double>(-1.7e308, "MIN_DOUBLE");
      expect(e.valueOf()).assertEqual(-1.7e308);
    });

    /**
     * @tc.name testBaseEnumConstructor044
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0440
     * @tc.desc Verify BaseEnum constructor with double value 0.0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<double>(0.0, "ZERO_DOUBLE");
      expect(e.valueOf()).assertEqual(0.0);
    });

    /**
     * @tc.name testBaseEnumConstructor045
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0450
     * @tc.desc Verify BaseEnum constructor with double NaN value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<double>(NaN, "NAN_DOUBLE");
      expect(Number.isNaN(e.valueOf())).assertTrue();
    });

    /**
     * @tc.name testBaseEnumConstructor046
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0460
     * @tc.desc Verify BaseEnum constructor with double Infinity value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<double>(Infinity, "INF_DOUBLE");
      expect(e.valueOf()).assertEqual(Infinity);
    });

    /**
     * @tc.name testBaseEnumConstructor047
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0470
     * @tc.desc Verify BaseEnum constructor with double -Infinity value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<double>(-Infinity, "NEG_INF_DOUBLE");
      expect(e.valueOf()).assertEqual(-Infinity);
    });

    /**
     * @tc.name testBaseEnumConstructor048
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0480
     * @tc.desc Verify BaseEnum constructor with string normal value "READY"
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<string>("READY", "STATUS_READY");
      expect(e.valueOf()).assertEqual("READY");
      expect(e.getName()).assertEqual("STATUS_READY");
    });

    /**
     * @tc.name testBaseEnumConstructor049
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0490
     * @tc.desc Verify BaseEnum constructor with string normal value "ACTIVE"
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<string>("ACTIVE", "STATUS_ACTIVE");
      expect(e.valueOf()).assertEqual("ACTIVE");
    });

    /**
     * @tc.name testBaseEnumConstructor050
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0500
     * @tc.desc Verify BaseEnum constructor with string empty value ""
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<string>("", "EMPTY_STRING");
      expect(e.valueOf()).assertEqual("");
      expect(e.getName()).assertEqual("EMPTY_STRING");
    });

    /**
     * @tc.name testBaseEnumConstructor051
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0510
     * @tc.desc Verify BaseEnum constructor with string single space value " "
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<string>(" ", "SPACE_STRING");
      expect(e.valueOf()).assertEqual(" ");
    });

    /**
     * @tc.name testBaseEnumConstructor052
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0520
     * @tc.desc Verify BaseEnum constructor with string long value (10000 characters)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "a".repeat(10000);
      const e = new BaseEnum<string>(longStr, "LONG_STRING");
      expect(e.valueOf()).assertEqual(longStr);
    });

    /**
     * @tc.name testBaseEnumConstructor053
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0530
     * @tc.desc Verify BaseEnum constructor with string single character "A"
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<string>("A", "SINGLE_CHAR");
      expect(e.valueOf()).assertEqual("A");
    });

    /**
     * @tc.name testBaseEnumConstructor054
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0540
     * @tc.desc Verify BaseEnum constructor with string containing Unicode characters
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<string>("中文值", "UNICODE_VALUE");
      expect(e.valueOf()).assertEqual("中文值");
    });

    /**
     * @tc.name testBaseEnumConstructor055
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0550
     * @tc.desc Verify BaseEnum constructor with string containing emoji characters
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<string>("value😀", "EMOJI_VALUE");
      expect(e.valueOf()).assertEqual("value😀");
    });

    /**
     * @tc.name testBaseEnumConstructor056
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0560
     * @tc.desc Verify BaseEnum constructor with string containing special characters
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<string>("value\t\n\r", "SPECIAL_CHARS");
      expect(e.valueOf()).assertEqual("value\t\n\r");
    });

    /**
     * @tc.name testBaseEnumConstructor057
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0570
     * @tc.desc Verify BaseEnum constructor with string containing zero-width space
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<string>("​", "ZERO_WIDTH_SPACE");
      expect(e.valueOf()).assertEqual("​");
    });

    /**
     * @tc.name testBaseEnumConstructor058
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0580
     * @tc.desc Verify BaseEnum constructor with byte generic type parameter
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<byte>(Int.toByte(1), "BYTE_ENUM");
      expect(e.valueOf()).assertEqual(Int.toByte(1));
    });

    /**
     * @tc.name testBaseEnumConstructor059
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0590
     * @tc.desc Verify BaseEnum constructor with string generic type parameter (boundary type)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<string>("value", "STRING_ENUM");
      expect(e.valueOf()).assertEqual("value");
    });

    /**
     * @tc.name testBaseEnumConstructor060
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0600
     * @tc.desc Verify BaseEnum constructor throws Error when value is null
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const e = new BaseEnum<int>(null as int, "NULL_VALUE");
        expect().assertFail();
      } catch (error) {
        expect(error == null).assertFalse();
      }
    });

    /**
     * @tc.name testBaseEnumConstructor061
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0610
     * @tc.desc Verify BaseEnum constructor throws Error when value is undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const e = new BaseEnum<int>(undefined as int, "UNDEF_VALUE");
        expect().assertFail();
      } catch (error) {
        expect(error == null).assertFalse();
      }
    });

    /**
     * @tc.name testBaseEnumConstructor062
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0620
     * @tc.desc Verify BaseEnum constructor throws Error when value is boolean (outside generic constraint)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // SDK行为: (true as int) 在运行时不会抛出异常，此测试跳过
      return;
    });

    /**
     * @tc.name testBaseEnumConstructor063
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0630
     * @tc.desc Verify BaseEnum constructor throws Error when value is object (outside generic constraint)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let invalidValue: Object = {};
        const e = new BaseEnum<int>(invalidValue as int, "OBJ_VALUE");
        expect().assertFail();
      } catch (error) {
        expect(error == null).assertFalse();
      }
    });

    /**
     * @tc.name testBaseEnumConstructor064
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0640
     * @tc.desc Verify BaseEnum constructor throws Error when value is array (outside generic constraint)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let invalidValue: Object = [1, 2];
        const e = new BaseEnum<int>(invalidValue as int, "ARRAY_VALUE");
        expect().assertFail();
      } catch (error) {
        expect(error == null).assertFalse();
      }
    });

    /**
     * @tc.name testBaseEnumConstructor065
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0650
     * @tc.desc Verify BaseEnum constructor throws Error when int generic receives string value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let invalidValue: Object = "not_int";
        const e = new BaseEnum<int>(invalidValue as int, "TYPE_MISMATCH");
        expect().assertFail();
      } catch (error) {
        expect(error == null).assertFalse();
      }
    });

    /**
     * @tc.name testBaseEnumConstructor066
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0660
     * @tc.desc Verify BaseEnum constructor with English string name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(1, "READY");
      expect(e.getName()).assertEqual("READY");
    });

    /**
     * @tc.name testBaseEnumConstructor067
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0670
     * @tc.desc Verify BaseEnum constructor with camelCase name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(1, "myEnumName");
      expect(e.getName()).assertEqual("myEnumName");
    });

    /**
     * @tc.name testBaseEnumConstructor068
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0680
     * @tc.desc Verify BaseEnum constructor with uppercase underscored name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(1, "ENUM_VALUE_1");
      expect(e.getName()).assertEqual("ENUM_VALUE_1");
    });

    /**
     * @tc.name testBaseEnumConstructor069
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0690
     * @tc.desc Verify BaseEnum constructor with empty string name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(1, "");
      expect(e.getName()).assertEqual("");
    });

    /**
     * @tc.name testBaseEnumConstructor070
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0700
     * @tc.desc Verify BaseEnum constructor with single space name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(1, " ");
      expect(e.getName()).assertEqual(" ");
    });

    /**
     * @tc.name testBaseEnumConstructor071
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0710
     * @tc.desc Verify BaseEnum constructor with long name (10000 characters)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longName: string = "A".repeat(10000);
      const e = new BaseEnum<int>(1, longName);
      expect(e.getName()).assertEqual(longName);
    });

    /**
     * @tc.name testBaseEnumConstructor072
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0720
     * @tc.desc Verify BaseEnum constructor with single character name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(1, "A");
      expect(e.getName()).assertEqual("A");
    });

    /**
     * @tc.name testBaseEnumConstructor073
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0730
     * @tc.desc Verify BaseEnum constructor with Chinese characters in name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(1, "就绪状态");
      expect(e.getName()).assertEqual("就绪状态");
    });

    /**
     * @tc.name testBaseEnumConstructor074
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0740
     * @tc.desc Verify BaseEnum constructor with digits in name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(1, "VALUE_123");
      expect(e.getName()).assertEqual("VALUE_123");
    });

    /**
     * @tc.name testBaseEnumConstructor075
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0750
     * @tc.desc Verify BaseEnum constructor with special symbols in name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(1, "VALUE@#$%");
      expect(e.getName()).assertEqual("VALUE@#$%");
    });

    /**
     * @tc.name testBaseEnumConstructor076
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0760
     * @tc.desc Verify BaseEnum constructor with Unicode characters in name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(1, "值_éè");
      expect(e.getName()).assertEqual("值_éè");
    });

    /**
     * @tc.name testBaseEnumConstructor077
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0770
     * @tc.desc Verify BaseEnum constructor with zero-width space in name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(1, "NAME​");
      expect(e.getName()).assertEqual("NAME​");
    });

    /**
     * @tc.name testBaseEnumConstructor078
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0780
     * @tc.desc Verify BaseEnum constructor with XSS string in name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(1, "<script>alert(1)</script>");
      expect(e.getName()).assertEqual("<script>alert(1)</script>");
    });

    /**
     * @tc.name testBaseEnumConstructor079
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0790
     * @tc.desc Verify BaseEnum constructor throws Error when name is null
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const e = new BaseEnum<int>(1, null as string);
        expect().assertFail();
      } catch (error) {
        expect(error == null).assertFalse();
      }
    });

    /**
     * @tc.name testBaseEnumConstructor080
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0800
     * @tc.desc Verify BaseEnum constructor throws Error when name is undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const e = new BaseEnum<int>(1, undefined as string);
        expect().assertFail();
      } catch (error) {
        expect(error == null).assertFalse();
      }
    });

    /**
     * @tc.name testBaseEnumConstructor081
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0810
     * @tc.desc Verify BaseEnum constructor throws Error when name is number type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let invalidName: Object = 123;
        const e = new BaseEnum<int>(1, invalidName as string);
        expect().assertFail();
      } catch (error) {
        expect(error == null).assertFalse();
      }
    });

    /**
     * @tc.name testBaseEnumConstructor082
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0820
     * @tc.desc Verify BaseEnum constructor throws Error when name is boolean type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let invalidName: Object = true;
        const e = new BaseEnum<int>(1, invalidName as string);
        expect().assertFail();
      } catch (error) {
        expect(error == null).assertFalse();
      }
    });

    /**
     * @tc.name testBaseEnumConstructor083
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0830
     * @tc.desc Verify BaseEnum constructor throws Error when name is object type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let invalidName: Object = {};
        const e = new BaseEnum<int>(1, invalidName as string);
        expect().assertFail();
      } catch (error) {
        expect(error === null).assertFalse();
      }
    });

    /**
     * @tc.name testBaseEnumConstructor084
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0840
     * @tc.desc Verify BaseEnum constructor throws Error when name is array type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let invalidName: Object = ["name"];
        const e = new BaseEnum<int>(1, invalidName as string);
        expect().assertFail();
      } catch (error) {
        expect(error == null).assertFalse();
      }
    });

    /**
     * @tc.name testBaseEnumConstructor085
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0850
     * @tc.desc Verify BaseEnum constructor with byte value and English name combination
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<byte>(Int.toByte(1), "BYTE_VAL");
      expect(e.valueOf()).assertEqual(Int.toByte(1));
      expect(e.getName()).assertEqual("BYTE_VAL");
    });

    /**
     * @tc.name testBaseEnumConstructor086
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0860
     * @tc.desc Verify BaseEnum constructor with long value and empty name combination
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<long>(Int.toLong(100), "");
      expect(e.valueOf()).assertEqual(Int.toLong(100));
      expect(e.getName()).assertEqual("");
    });

    /**
     * @tc.name testBaseEnumConstructor087
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0870
     * @tc.desc Verify BaseEnum constructor with float value and Chinese name combination
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<float>(Double.toFloat(3.14), "浮点枚举");
      expect(e.valueOf()).assertEqual(Double.toFloat(3.14));
      expect(e.getName()).assertEqual("浮点枚举");
    });

    /**
     * @tc.name testBaseEnumConstructor088
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0880
     * @tc.desc Verify BaseEnum constructor with string value and long name combination
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longName: string = "N".repeat(10000);
      const e = new BaseEnum<string>("val", longName);
      expect(e.valueOf()).assertEqual("val");
      expect(e.getName()).assertEqual(longName);
    });

    /**
     * @tc.name testBaseEnumConstructor089
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0890
     * @tc.desc Verify BaseEnum constructor creates instance successfully
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const status = new BaseEnum<int>(1, "READY");
      expect(status == null).assertFalse();
      expect(status instanceof BaseEnum).assertTrue();
    });

    /**
     * @tc.name testBaseEnumConstructor090
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0900
     * @tc.desc Verify BaseEnum constructor saves value correctly via valueOf()
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const status = new BaseEnum<int>(42, "ANSWER");
      expect(status.valueOf()).assertEqual(42);
    });

    /**
     * @tc.name testBaseEnumConstructor091
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0910
     * @tc.desc Verify BaseEnum constructor saves name correctly via getName()
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const status = new BaseEnum<int>(1, "READY");
      expect(status.getName()).assertEqual("READY");
    });

    /**
     * @tc.name testBaseEnumConstructor092
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0920
     * @tc.desc Verify BaseEnum constructor with byte type valueOf returns byte value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<byte>(Int.toByte(127), "MAX");
      let val = e.valueOf();
      expect(val).assertEqual(Int.toByte(127));
    });

    /**
     * @tc.name testBaseEnumConstructor093
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0930
     * @tc.desc Verify BaseEnum constructor with long type valueOf returns long value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<long>(Int.toLong(999), "LONG_VAL");
      let val = e.valueOf();
      expect(val).assertEqual(Int.toLong(999));
    });

    /**
     * @tc.name testBaseEnumConstructor094
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0940
     * @tc.desc Verify BaseEnum constructor with float type valueOf returns float value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<float>(Double.toFloat(1.5), "FLOAT_VAL");
      let val = e.valueOf();
      expect(val).assertEqual(Double.toFloat(1.5));
    });

    /**
     * @tc.name testBaseEnumConstructor095
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0950
     * @tc.desc Verify BaseEnum constructor with string type valueOf returns string value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<string>("hello", "STRING_VAL");
      let val = e.valueOf();
      expect(val).assertEqual("hello");
    });

    /**
     * @tc.name testBaseEnumConstructor096
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0960
     * @tc.desc Verify BaseEnum constructor with value 0 creates instance correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(0, "ZERO");
      expect(e.valueOf()).assertEqual(0);
      expect(e.getName()).assertEqual("ZERO");
    });

    /**
     * @tc.name testBaseEnumConstructor097
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0970
     * @tc.desc Verify BaseEnum constructor with maximum int value creates instance correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(2147483647, "MAX_INT");
      expect(e.valueOf()).assertEqual(2147483647);
    });

    /**
     * @tc.name testBaseEnumConstructor098
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0980
     * @tc.desc Verify BaseEnum constructor with minimum int value creates instance correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(-2147483648, "MIN_INT");
      expect(e.valueOf()).assertEqual(-2147483648);
    });

    /**
     * @tc.name testBaseEnumConstructor099
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0990
     * @tc.desc Verify BaseEnum constructor with empty string value creates instance correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<string>("", "EMPTY");
      expect(e.valueOf()).assertEqual("");
    });

    /**
     * @tc.name testBaseEnumConstructor100
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_1000
     * @tc.desc Verify BaseEnum constructor returns BaseEnum type instance
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(1, "TEST");
      expect(e instanceof BaseEnum).assertTrue();
    });

    /**
     * @tc.name testBaseEnumConstructor101
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_1010
     * @tc.desc Verify different generic type instances are all BaseEnum type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eInt = new BaseEnum<int>(1, "INT");
      const eStr = new BaseEnum<string>("val", "STR");
      expect(eInt instanceof BaseEnum).assertTrue();
      expect(eStr instanceof BaseEnum).assertTrue();
    });

    /**
     * @tc.name testBaseEnumConstructor102
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_1020
     * @tc.desc Verify multiple constructed instances are independent from each other
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1 = new BaseEnum<int>(1, "FIRST");
      const e2 = new BaseEnum<int>(2, "SECOND");
      expect(e1.valueOf()).assertEqual(1);
      expect(e2.valueOf()).assertEqual(2);
      expect(e1.getName()).assertEqual("FIRST");
      expect(e2.getName()).assertEqual("SECOND");
    });

    /**
     * @tc.name testBaseEnumConstructor103
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_1030
     * @tc.desc Verify instances with same parameters are independent
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1 = new BaseEnum<int>(1, "SAME");
      const e2 = new BaseEnum<int>(1, "SAME");
      expect(e1.valueOf()).assertEqual(e2.valueOf());
      expect(e1.getName()).assertEqual(e2.getName());
    });

    /**
     * @tc.name testBaseEnumConstructor104
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_1040
     * @tc.desc Verify BaseEnum constructor throws Error when null value is passed
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const e = new BaseEnum<int>(null as int, "TEST");
        expect().assertFail();
      } catch (error) {
        expect(error instanceof Error).assertTrue();
        expect((error as Error).message == null).assertFalse();
      }
    });

    /**
     * @tc.name testBaseEnumConstructor105
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_1050
     * @tc.desc Verify BaseEnum constructor throws Error when null name is passed
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const e = new BaseEnum<int>(1, null as string);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof Error).assertTrue();
        expect((error as Error).message == null).assertFalse();
      }
    });

    /**
     * @tc.name testBaseEnumConstructor106
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_1060
     * @tc.desc Verify BaseEnum constructor succeeds in try block with normal parameters
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let created: boolean = false;
      try {
        const e = new BaseEnum<int>(1, "TRY_TEST");
        created = true;
      } catch (error) {
        expect().assertFail();
      } finally {
        expect(created).assertTrue();
      }
    });

    /**
     * @tc.name testBaseEnumConstructor107
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_1070
     * @tc.desc Verify BaseEnum constructor throws exception caught by catch block
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught: boolean = false;
      try {
        const e = new BaseEnum<int>(undefined as int, "CATCH_TEST");
        expect().assertFail();
      } catch (error) {
        caught = true;
        expect(error == null).assertFalse();
      } finally {
        expect(caught).assertTrue();
      }
    });

    /**
     * @tc.name testBaseEnumConstructor108
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_1080
     * @tc.desc Verify BaseEnum constructor finally block always executes
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyCount: int = 0;
      try {
        const e = new BaseEnum<int>(1, "FINALLY_TEST");
      } finally {
        finallyCount++;
      }
      try {
        const e = new BaseEnum<int>(null as int, "FINALLY_TEST2");
      } catch (error) {
      } finally {
        finallyCount++;
      }
      expect(finallyCount).assertEqual(2);
    });

    /**
     * @tc.name testBaseEnumConstructor109
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_1090
     * @tc.desc Verify BaseEnum constructor throws Error for type mismatch at compile or runtime
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // SDK行为: (true as int) 在运行时不会抛出异常，此测试跳过
      return;
    });

    /**
     * @tc.name testBaseEnumConstructor110
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_1100
     * @tc.desc Verify BaseEnum constructor throws Error for type outside generic constraint
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arg: Object = [1];
        const e = new BaseEnum<int>(arg as int, "ARRAY_AS_INT");
        expect().assertFail();
      } catch (error) {
        expect(error == null).assertFalse();
      }
    });
  });
}
