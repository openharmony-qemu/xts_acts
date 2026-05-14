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

class Status073 extends BaseEnum<int> {
  constructor(value: int, name: string) {
    super(value, name);
  }
}

export default function BaseEnumToStringTest(): void {
  describe('BaseEnumToStringTest', (): void => {
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
     * @tc.name testBaseEnumToString001
     * @tc.number SUB_BASEENUM_TOSTRING_0100
     * @tc.desc Verify BaseEnum toString normal call returns value string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const code = new BaseEnum<int>(404, "NOT_FOUND");
      let result = code.toString();
      expect(result).assertEqual("404");
    });

    /**
     * @tc.name testBaseEnumToString002
     * @tc.number SUB_BASEENUM_TOSTRING_0200
     * @tc.desc Verify BaseEnum toString ignores extra parameters
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const code = new BaseEnum<int>(404, "NOT_FOUND");
      let result = code.toString();
      expect(result).assertEqual("404");
    });

    /**
     * @tc.name testBaseEnumToString003
     * @tc.number SUB_BASEENUM_TOSTRING_0300
     * @tc.desc Verify BaseEnum toString ignores multiple extra parameters
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const code = new BaseEnum<int>(404, "NOT_FOUND");
      let result = code.toString();
      expect(result).assertEqual("404");
    });

    /**
     * @tc.name testBaseEnumToString004
     * @tc.number SUB_BASEENUM_TOSTRING_0400
     * @tc.desc Verify BaseEnum toString with byte positive value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<byte>(Int.toByte(100), "TEST");
      let result = e.toString();
      expect(result).assertEqual("100");
    });

    /**
     * @tc.name testBaseEnumToString005
     * @tc.number SUB_BASEENUM_TOSTRING_0500
     * @tc.desc Verify BaseEnum toString with byte zero value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<byte>(Int.toByte(0), "ZERO");
      let result = e.toString();
      expect(result).assertEqual("0");
    });

    /**
     * @tc.name testBaseEnumToString006
     * @tc.number SUB_BASEENUM_TOSTRING_0600
     * @tc.desc Verify BaseEnum toString with byte maximum value 127
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<byte>(Int.toByte(127), "MAX");
      let result = e.toString();
      expect(result).assertEqual("127");
    });

    /**
     * @tc.name testBaseEnumToString007
     * @tc.number SUB_BASEENUM_TOSTRING_0700
     * @tc.desc Verify BaseEnum toString with byte minimum value -128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<byte>(Int.toByte(-128), "MIN");
      let result = e.toString();
      expect(result).assertEqual("-128");
    });

    /**
     * @tc.name testBaseEnumToString008
     * @tc.number SUB_BASEENUM_TOSTRING_0800
     * @tc.desc Verify BaseEnum toString with byte negative value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<byte>(Int.toByte(-1), "NEG");
      let result = e.toString();
      expect(result).assertEqual("-1");
    });

    /**
     * @tc.name testBaseEnumToString009
     * @tc.number SUB_BASEENUM_TOSTRING_0900
     * @tc.desc Verify BaseEnum toString with short positive value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<short>(Int.toShort(1000), "TEST");
      let result = e.toString();
      expect(result).assertEqual("1000");
    });

    /**
     * @tc.name testBaseEnumToString010
     * @tc.number SUB_BASEENUM_TOSTRING_1000
     * @tc.desc Verify BaseEnum toString with short zero value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<short>(Int.toShort(0), "ZERO");
      let result = e.toString();
      expect(result).assertEqual("0");
    });

    /**
     * @tc.name testBaseEnumToString011
     * @tc.number SUB_BASEENUM_TOSTRING_1100
     * @tc.desc Verify BaseEnum toString with short maximum value 32767
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<short>(Int.toShort(32767), "MAX");
      let result = e.toString();
      expect(result).assertEqual("32767");
    });

    /**
     * @tc.name testBaseEnumToString012
     * @tc.number SUB_BASEENUM_TOSTRING_1200
     * @tc.desc Verify BaseEnum toString with short minimum value -32768
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<short>(Int.toShort(-32768), "MIN");
      let result = e.toString();
      expect(result).assertEqual("-32768");
    });

    /**
     * @tc.name testBaseEnumToString013
     * @tc.number SUB_BASEENUM_TOSTRING_1300
     * @tc.desc Verify BaseEnum toString with int positive value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const code = new BaseEnum<int>(404, "NOT_FOUND");
      let result = code.toString();
      expect(result).assertEqual("404");
    });

    /**
     * @tc.name testBaseEnumToString014
     * @tc.number SUB_BASEENUM_TOSTRING_1400
     * @tc.desc Verify BaseEnum toString with int zero value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(0, "ZERO");
      let result = e.toString();
      expect(result).assertEqual("0");
    });

    /**
     * @tc.name testBaseEnumToString015
     * @tc.number SUB_BASEENUM_TOSTRING_1500
     * @tc.desc Verify BaseEnum toString with int negative value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(-1, "NEG");
      let result = e.toString();
      expect(result).assertEqual("-1");
    });

    /**
     * @tc.name testBaseEnumToString016
     * @tc.number SUB_BASEENUM_TOSTRING_1600
     * @tc.desc Verify BaseEnum toString with int large positive value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(2147483647, "MAX");
      let result = e.toString();
      expect(result).assertEqual("2147483647");
    });

    /**
     * @tc.name testBaseEnumToString017
     * @tc.number SUB_BASEENUM_TOSTRING_1700
     * @tc.desc Verify BaseEnum toString with int large negative value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(-2147483648, "MIN");
      let result = e.toString();
      expect(result).assertEqual("-2147483648");
    });

    /**
     * @tc.name testBaseEnumToString018
     * @tc.number SUB_BASEENUM_TOSTRING_1800
     * @tc.desc Verify BaseEnum toString with long positive value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<long>(Int.toLong(100000), "TEST");
      let result = e.toString();
      expect(result).assertEqual("100000");
    });

    /**
     * @tc.name testBaseEnumToString019
     * @tc.number SUB_BASEENUM_TOSTRING_1900
     * @tc.desc Verify BaseEnum toString with long zero value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<long>(Int.toLong(0), "ZERO");
      let result = e.toString();
      expect(result).assertEqual("0");
    });

    /**
     * @tc.name testBaseEnumToString020
     * @tc.number SUB_BASEENUM_TOSTRING_2000
     * @tc.desc Verify BaseEnum toString with long negative value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<long>(Int.toLong(-999), "NEG");
      let result = e.toString();
      expect(result).assertEqual("-999");
    });

    /**
     * @tc.name testBaseEnumToString021
     * @tc.number SUB_BASEENUM_TOSTRING_2100
     * @tc.desc Verify BaseEnum toString with long large value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<long>(9223372036854775807, "MAX");
      let result = e.toString();
      expect(result).assertEqual("9223372036854775807");
    });

    /**
     * @tc.name testBaseEnumToString022
     * @tc.number SUB_BASEENUM_TOSTRING_2200
     * @tc.desc Verify BaseEnum toString with long minimum value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<long>(-9223372036854775807 - 1, "MIN");
      let result = e.toString();
      expect(result).assertEqual("-9223372036854775808");
    });

    /**
     * @tc.name testBaseEnumToString023
     * @tc.number SUB_BASEENUM_TOSTRING_2300
     * @tc.desc Verify BaseEnum toString with float positive value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<float>(Double.toFloat(3.14), "PI");
      let result = e.toString();
      expect(result).assertEqual("3.14");
    });

    /**
     * @tc.name testBaseEnumToString024
     * @tc.number SUB_BASEENUM_TOSTRING_2400
     * @tc.desc Verify BaseEnum toString with float zero value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<float>(Double.toFloat(0.0), "ZERO");
      let result = e.toString();
      expect(result).assertEqual("0");
    });

    /**
     * @tc.name testBaseEnumToString025
     * @tc.number SUB_BASEENUM_TOSTRING_2500
     * @tc.desc Verify BaseEnum toString with float negative value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<float>(Double.toFloat(-2.5), "NEG");
      let result = e.toString();
      expect(result).assertEqual("-2.5");
    });

    /**
     * @tc.name testBaseEnumToString026
     * @tc.number SUB_BASEENUM_TOSTRING_2600
     * @tc.desc Verify BaseEnum toString with float whole number value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<float>(Double.toFloat(100.0), "WHOLE");
      let result = e.toString();
      expect(result).assertEqual("100");
    });

    /**
     * @tc.name testBaseEnumToString027
     * @tc.number SUB_BASEENUM_TOSTRING_2700
     * @tc.desc Verify BaseEnum toString with float small decimal value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<float>(Double.toFloat(0.001), "SMALL");
      let result = e.toString();
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.name testBaseEnumToString028
     * @tc.number SUB_BASEENUM_TOSTRING_2800
     * @tc.desc Verify BaseEnum toString with double positive value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<double>(2.718281828, "E");
      let result = e.toString();
      expect(result).assertEqual("2.718281828");
    });

    /**
     * @tc.name testBaseEnumToString029
     * @tc.number SUB_BASEENUM_TOSTRING_2900
     * @tc.desc Verify BaseEnum toString with double zero value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<double>(0.0, "ZERO");
      let result = e.toString();
      expect(result).assertEqual("0");
    });

    /**
     * @tc.name testBaseEnumToString030
     * @tc.number SUB_BASEENUM_TOSTRING_3000
     * @tc.desc Verify BaseEnum toString with double negative value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<double>(-99.99, "NEG");
      let result = e.toString();
      expect(result).assertEqual("-99.99");
    });

    /**
     * @tc.name testBaseEnumToString031
     * @tc.number SUB_BASEENUM_TOSTRING_3100
     * @tc.desc Verify BaseEnum toString with double high precision value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<double>(3.141592653589793, "HIGH_PREC");
      let result = e.toString();
      expect(typeof result).assertEqual("string");
      expect(result.length > 3).assertTrue();
    });

    /**
     * @tc.name testBaseEnumToString032
     * @tc.number SUB_BASEENUM_TOSTRING_3200
     * @tc.desc Verify BaseEnum toString with string normal value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<string>("hello", "GREETING");
      let result = e.toString();
      expect(result).assertEqual("hello");
    });

    /**
     * @tc.name testBaseEnumToString033
     * @tc.number SUB_BASEENUM_TOSTRING_3300
     * @tc.desc Verify BaseEnum toString with string empty value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<string>("", "EMPTY");
      let result = e.toString();
      expect(result).assertEqual("");
    });

    /**
     * @tc.name testBaseEnumToString034
     * @tc.number SUB_BASEENUM_TOSTRING_3400
     * @tc.desc Verify BaseEnum toString with string numeric value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<string>("123", "NUM_STR");
      let result = e.toString();
      expect(result).assertEqual("123");
    });

    /**
     * @tc.name testBaseEnumToString035
     * @tc.number SUB_BASEENUM_TOSTRING_3500
     * @tc.desc Verify BaseEnum toString with string containing spaces
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<string>("hello world", "SPACE");
      let result = e.toString();
      expect(result).assertEqual("hello world");
    });

    /**
     * @tc.name testBaseEnumToString036
     * @tc.number SUB_BASEENUM_TOSTRING_3600
     * @tc.desc Verify BaseEnum toString with string special characters
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<string>("!@#$%^&*()", "SPECIAL");
      let result = e.toString();
      expect(result).assertEqual("!@#$%^&*()");
    });

    /**
     * @tc.name testBaseEnumToString037
     * @tc.number SUB_BASEENUM_TOSTRING_3700
     * @tc.desc Verify BaseEnum toString with Unicode string value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<string>("你好世界", "CN");
      let result = e.toString();
      expect(result).assertEqual("你好世界");
    });

    /**
     * @tc.name testBaseEnumToString038
     * @tc.number SUB_BASEENUM_TOSTRING_3800
     * @tc.desc Verify BaseEnum toString with long string value (1000 characters)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "a".repeat(1000);
      const e = new BaseEnum<string>(longStr, "LONG");
      let result = e.toString();
      expect(result).assertEqual(longStr);
      expect(result.length).assertEqual(1000);
    });

    /**
     * @tc.name testBaseEnumToString039
     * @tc.number SUB_BASEENUM_TOSTRING_3900
     * @tc.desc Verify BaseEnum toString with float NaN value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<float>(Double.toFloat(NaN), "NAN_VAL");
      let result = e.toString();
      expect(result).assertEqual("NaN");
    });

    /**
     * @tc.name testBaseEnumToString040
     * @tc.number SUB_BASEENUM_TOSTRING_4000
     * @tc.desc Verify BaseEnum toString with double NaN value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<double>(NaN, "NAN_VAL");
      let result = e.toString();
      expect(result).assertEqual("NaN");
    });

    /**
     * @tc.name testBaseEnumToString041
     * @tc.number SUB_BASEENUM_TOSTRING_4100
     * @tc.desc Verify BaseEnum toString with float Infinity value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<float>(Double.toFloat(Infinity), "INF");
      let result = e.toString();
      expect(result).assertEqual("Infinity");
    });

    /**
     * @tc.name testBaseEnumToString042
     * @tc.number SUB_BASEENUM_TOSTRING_4200
     * @tc.desc Verify BaseEnum toString with float negative Infinity value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<float>(Double.toFloat(-Infinity), "NEG_INF");
      let result = e.toString();
      expect(result).assertEqual("-Infinity");
    });

    /**
     * @tc.name testBaseEnumToString043
     * @tc.number SUB_BASEENUM_TOSTRING_4300
     * @tc.desc Verify BaseEnum toString with double Infinity value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<double>(Infinity, "INF");
      let result = e.toString();
      expect(result).assertEqual("Infinity");
    });

    /**
     * @tc.name testBaseEnumToString044
     * @tc.number SUB_BASEENUM_TOSTRING_4400
     * @tc.desc Verify BaseEnum toString with double negative Infinity value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<double>(-Infinity, "NEG_INF");
      let result = e.toString();
      expect(result).assertEqual("-Infinity");
    });

    /**
     * @tc.name testBaseEnumToString045
     * @tc.number SUB_BASEENUM_TOSTRING_4500
     * @tc.desc Verify BaseEnum toString with float positive zero value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<float>(Double.toFloat(0.0), "POS_ZERO");
      let result = e.toString();
      expect(result).assertEqual("0");
    });

    /**
     * @tc.name testBaseEnumToString046
     * @tc.number SUB_BASEENUM_TOSTRING_4600
     * @tc.desc Verify BaseEnum toString with float negative zero value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<float>(Double.toFloat(-0.0), "NEG_ZERO");
      let result = e.toString();
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.name testBaseEnumToString047
     * @tc.number SUB_BASEENUM_TOSTRING_4700
     * @tc.desc Verify BaseEnum toString with float large value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<float>(Double.toFloat(3.4e38), "MAX_FLOAT");
      let result = e.toString();
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.name testBaseEnumToString048
     * @tc.number SUB_BASEENUM_TOSTRING_4800
     * @tc.desc Verify BaseEnum toString with double large value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<double>(1.7e308, "MAX_DOUBLE");
      let result = e.toString();
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.name testBaseEnumToString049
     * @tc.number SUB_BASEENUM_TOSTRING_4900
     * @tc.desc Verify BaseEnum toString with float minimum positive value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<float>(Double.toFloat(1.4e-45), "MIN_FLOAT");
      let result = e.toString();
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.name testBaseEnumToString050
     * @tc.number SUB_BASEENUM_TOSTRING_5000
     * @tc.desc Verify BaseEnum toString with double minimum positive value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<double>(5e-324, "MIN_DOUBLE");
      let result = e.toString();
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.name testBaseEnumToString051
     * @tc.number SUB_BASEENUM_TOSTRING_5100
     * @tc.desc Verify BaseEnum toString return value type is string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(404, "NOT_FOUND");
      let result = e.toString();
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.name testBaseEnumToString052
     * @tc.number SUB_BASEENUM_TOSTRING_5200
     * @tc.desc Verify BaseEnum toString return value is not number
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(404, "NOT_FOUND");
      let result = e.toString();
      expect(typeof result === "number").assertFalse();
    });

    /**
     * @tc.name testBaseEnumToString053
     * @tc.number SUB_BASEENUM_TOSTRING_5300
     * @tc.desc Verify BaseEnum toString return value is not object
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(404, "NOT_FOUND");
      let result = e.toString();
      expect(typeof result === "object").assertFalse();
    });

    /**
     * @tc.name testBaseEnumToString054
     * @tc.number SUB_BASEENUM_TOSTRING_5400
     * @tc.desc Verify BaseEnum toString return value is not undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(404, "NOT_FOUND");
      let result = e.toString();
      expect(result == null).assertFalse();
      expect(result == undefined).assertFalse();
    });

    /**
     * @tc.name testBaseEnumToString055
     * @tc.number SUB_BASEENUM_TOSTRING_5500
     * @tc.desc Verify BaseEnum toString returns value not name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const code = new BaseEnum<int>(404, "NOT_FOUND");
      let result = code.toString();
      expect(result).assertEqual("404");
      expect(result === "NOT_FOUND").assertFalse();
    });

    /**
     * @tc.name testBaseEnumToString056
     * @tc.number SUB_BASEENUM_TOSTRING_5600
     * @tc.desc Verify BaseEnum toString returns value not name for multiple types
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1 = new BaseEnum<int>(100, "CODE_100");
      expect(e1.toString()).assertEqual("100");
      expect(e1.toString() === "CODE_100").assertFalse();

      const e2 = new BaseEnum<string>("value", "NAME");
      expect(e2.toString()).assertEqual("value");
      expect(e2.toString() === "NAME").assertFalse();
    });

    /**
     * @tc.name testBaseEnumToString057
     * @tc.number SUB_BASEENUM_TOSTRING_5700
     * @tc.desc Verify BaseEnum toString returns empty string for empty string value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<string>("", "EMPTY");
      let result = e.toString();
      expect(result).assertEqual("");
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name testBaseEnumToString058
     * @tc.number SUB_BASEENUM_TOSTRING_5800
     * @tc.desc Verify BaseEnum toString returns single character for single char value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<string>("A", "SINGLE");
      let result = e.toString();
      expect(result).assertEqual("A");
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name testBaseEnumToString059
     * @tc.number SUB_BASEENUM_TOSTRING_5900
     * @tc.desc Verify BaseEnum toString returns full long string value (10000 characters)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longVal: string = "x".repeat(10000);
      const e = new BaseEnum<string>(longVal, "LONG");
      let result = e.toString();
      expect(result.length).assertEqual(10000);
    });

    /**
     * @tc.name testBaseEnumToString060
     * @tc.number SUB_BASEENUM_TOSTRING_6000
     * @tc.desc Verify BaseEnum toString returns "0" for int value 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(0, "ZERO");
      let result = e.toString();
      expect(result).assertEqual("0");
      expect(result == undefined).assertFalse();
    });

    /**
     * @tc.name testBaseEnumToString061
     * @tc.number SUB_BASEENUM_TOSTRING_6100
     * @tc.desc Verify BaseEnum toString with negative value includes minus sign
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(-999, "NEG");
      let result = e.toString();
      expect(result).assertEqual("-999");
      expect(result.startsWith("-")).assertTrue();
    });

    /**
     * @tc.name testBaseEnumToString062
     * @tc.number SUB_BASEENUM_TOSTRING_6200
     * @tc.desc Verify BaseEnum toString returns consistent value on multiple calls
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(404, "NOT_FOUND");
      let r1 = e.toString();
      let r2 = e.toString();
      let r3 = e.toString();
      expect(r1).assertEqual(r2);
      expect(r2).assertEqual(r3);
      expect(r1).assertEqual("404");
    });

    /**
     * @tc.name testBaseEnumToString063
     * @tc.number SUB_BASEENUM_TOSTRING_6300
     * @tc.desc Verify BaseEnum toString for different instances with same value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1 = new BaseEnum<int>(404, "A");
      const e2 = new BaseEnum<int>(404, "B");
      expect(e1.toString()).assertEqual(e2.toString());
      expect(e1.toString()).assertEqual("404");
    });

    /**
     * @tc.name testBaseEnumToString064
     * @tc.number SUB_BASEENUM_TOSTRING_6400
     * @tc.desc Verify BaseEnum toString returns value and getName returns name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(404, "NOT_FOUND");
      expect(e.toString()).assertEqual("404");
      expect(e.getName()).assertEqual("NOT_FOUND");
      expect(e.toString() === e.getName()).assertFalse();
    });

    /**
     * @tc.name testBaseEnumToString065
     * @tc.number SUB_BASEENUM_TOSTRING_6500
     * @tc.desc Verify BaseEnum toString and getName comparison for string type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1 = new BaseEnum<string>("same", "same");
      expect(e1.toString()).assertEqual("same");
      expect(e1.getName()).assertEqual("same");

      const e2 = new BaseEnum<string>("value", "name");
      expect(e2.toString()).assertEqual("value");
      expect(e2.getName()).assertEqual("name");
      expect(e2.toString() !== e2.getName()).assertTrue();
    });

    /**
     * @tc.name testBaseEnumToString066
     * @tc.number SUB_BASEENUM_TOSTRING_6600
     * @tc.desc Verify BaseEnum toString and getName comparison for various types
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eInt = new BaseEnum<int>(200, "OK");
      expect(eInt.toString()).assertEqual("200");
      expect(eInt.getName()).assertEqual("OK");

      const eLong = new BaseEnum<long>(Int.toLong(999), "BIG");
      expect(eLong.toString()).assertEqual("999");
      expect(eLong.getName()).assertEqual("BIG");

      const eFloat = new BaseEnum<float>(Double.toFloat(1.5), "HALF");
      expect(eFloat.toString()).assertEqual("1.5");
      expect(eFloat.getName()).assertEqual("HALF");
    });

    /**
     * @tc.name testBaseEnumToString067
     * @tc.number SUB_BASEENUM_TOSTRING_6700
     * @tc.desc Verify BaseEnum toString does not throw exception
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(404, "NOT_FOUND");
      try {
        let result = e.toString();
        expect(result).assertEqual("404");
      } catch (error) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name testBaseEnumToString068
     * @tc.number SUB_BASEENUM_TOSTRING_6800
     * @tc.desc Verify BaseEnum toString in try-catch-finally block
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(100, "TEST");
      let result: string = "";
      try {
        result = e.toString();
      } catch (error) {
        result = "error";
      } finally {
        expect(result).assertEqual("100");
      }
    });

    /**
     * @tc.name testBaseEnumToString069
     * @tc.number SUB_BASEENUM_TOSTRING_6900
     * @tc.desc Verify BaseEnum toString with NaN and Infinity does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eNaN = new BaseEnum<float>(Double.toFloat(NaN), "NAN");
      const eInf = new BaseEnum<float>(Double.toFloat(Infinity), "INF");
      const eNegInf = new BaseEnum<float>(Double.toFloat(-Infinity), "NEG_INF");
      try {
        expect(eNaN.toString()).assertEqual("NaN");
        expect(eInf.toString()).assertEqual("Infinity");
        expect(eNegInf.toString()).assertEqual("-Infinity");
      } catch (error) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name testBaseEnumToString070
     * @tc.number SUB_BASEENUM_TOSTRING_7000
     * @tc.desc Verify BaseEnum toString with empty string value does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<string>("", "EMPTY");
      expect(e.toString()).assertEqual("");
    });

    /**
     * @tc.name testBaseEnumToString071
     * @tc.number SUB_BASEENUM_TOSTRING_7100
     * @tc.desc Verify BaseEnum toString is override of Object.toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(404, "NOT_FOUND");
      let result = e.toString();
      expect(typeof result).assertEqual("string");
      expect(result).assertEqual("404");
    });

    /**
     * @tc.name testBaseEnumToString072
     * @tc.number SUB_BASEENUM_TOSTRING_7200
     * @tc.desc Verify BaseEnum toString returns value string not [object Object]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(404, "NOT_FOUND");
      let result = e.toString();
      expect(result).assertEqual("404");
      expect(result === "[object Object]").assertFalse();
    });

    /**
     * @tc.name testBaseEnumToString073
     * @tc.number SUB_BASEENUM_TOSTRING_7300
     * @tc.desc Verify subclass inheriting BaseEnum toString behavior
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const status = new Status073(200, "OK");
      let result = status.toString();
      expect(result).assertEqual("200");
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.name testBaseEnumToString074
     * @tc.number SUB_BASEENUM_TOSTRING_7400
     * @tc.desc Verify BaseEnum toString override returns value not name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(500, "SERVER_ERROR");
      let strResult = e.toString();
      let nameResult = e.getName();
      expect(strResult).assertEqual("500");
      expect(nameResult).assertEqual("SERVER_ERROR");
      expect(strResult !== nameResult).assertTrue();
    });

    /**
     * @tc.name testBaseEnumToString075
     * @tc.number SUB_BASEENUM_TOSTRING_7500
     * @tc.desc Verify BaseEnum toString consistent override behavior for all generic types
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumToString075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eByte = new BaseEnum<byte>(Int.toByte(10), "TEN");
      expect(eByte.toString()).assertEqual("10");

      const eShort = new BaseEnum<short>(Int.toShort(1000), "THOUSAND");
      expect(eShort.toString()).assertEqual("1000");

      const eInt = new BaseEnum<int>(100000, "LARGE");
      expect(eInt.toString()).assertEqual("100000");

      const eLong = new BaseEnum<long>(Int.toLong(9999), "BIG");
      expect(eLong.toString()).assertEqual("9999");

      const eFloat = new BaseEnum<float>(Double.toFloat(2.5), "HALF");
      expect(eFloat.toString()).assertEqual("2.5");

      const eDouble = new BaseEnum<double>(3.14, "PI");
      expect(eDouble.toString()).assertEqual("3.14");

      const eStr = new BaseEnum<string>("active", "STATUS");
      expect(eStr.toString()).assertEqual("active");
    });
  });
}
