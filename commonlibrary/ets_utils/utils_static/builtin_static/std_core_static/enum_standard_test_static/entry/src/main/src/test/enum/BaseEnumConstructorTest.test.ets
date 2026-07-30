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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from './../Util.test';

export default function BaseEnumConstructorTest(): void {
  describe('BaseEnumConstructorTest', (): void => {
    // yield to coroutine scheduler for proper async test execution
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(1);
    });

    /**
     * @tc.name testBaseEnumConstructor001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0100
     * @tc.desc Verify BaseEnum constructor throws Error when value parameter is missing
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const status = new BaseEnum<int>(undefined as int, "READY");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testBaseEnumConstructor002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0200
     * @tc.desc Verify BaseEnum constructor throws Error when name parameter is missing
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const status = new BaseEnum<int>(1, undefined as string);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testBaseEnumConstructor003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0300
     * @tc.desc Verify BaseEnum constructor with valid int value and name returns correct value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(255, "TEST_004");
      expect(e.valueOf()).assertEqual(255);
      expect(e.getName()).assertEqual("TEST_004");
    });

    /**
     * @tc.name testBaseEnumConstructor004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0400
     * @tc.desc Verify BaseEnum constructor with valid string value and name returns correct name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<string>("world", "TEST_005");
      expect(e.valueOf()).assertEqual("world");
      expect(e.getName()).assertEqual("TEST_005");
    });

    /**
     * @tc.name testBaseEnumConstructor005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0500
     * @tc.desc Verify BaseEnum constructor with byte value and name returns correct valueOf and getName
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<byte>(100 as byte, "VALUE_100");
      expect(e.valueOf()).assertEqual(100 as byte);
      expect(e.getName()).assertEqual("VALUE_100");
    });

    /**
     * @tc.name testBaseEnumConstructor006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0600
     * @tc.desc Verify BaseEnum constructor with short value and name returns correct valueOf and getName
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<short>(10000 as short, "VALUE_10000");
      expect(e.valueOf()).assertEqual(10000 as short);
      expect(e.getName()).assertEqual("VALUE_10000");
    });

    /**
     * @tc.name testBaseEnumConstructor007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0700
     * @tc.desc Verify BaseEnum constructor with int value and name returns correct valueOf and getName
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(100, "VALUE_100");
      expect(e.valueOf()).assertEqual(100);
      expect(e.getName()).assertEqual("VALUE_100");
    });

    /**
     * @tc.name testBaseEnumConstructor008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0800
     * @tc.desc  Verify BaseEnum constructor with long value and name returns correct valueOf and getName
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<long>(Int.toLong(1000), "VALUE_1000");
      expect(e.valueOf()).assertEqual(Int.toLong(1000));
      expect(e.getName()).assertEqual("VALUE_1000");
    });

    /**
     * @tc.name testBaseEnumConstructor009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_0900
     * @tc.desc Verify BaseEnum constructor with long negative value and name returns correct valueOf and getName
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<long>(Int.toLong(-1), "VALUE_NEG_1");
      expect(e.valueOf()).assertEqual(Int.toLong(-1));
      expect(e.getName()).assertEqual("VALUE_NEG_1");
    });

    /**
     * @tc.name testBaseEnumConstructor010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_1000
     * @tc.desc  Verify BaseEnum constructor with float value and name returns correct valueOf and getName
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<float>(Double.toFloat(3.14), "PI");
      expect(e.valueOf()).assertEqual(Double.toFloat(3.14));
      expect(e.getName()).assertEqual("PI");
    });

    /**
     * @tc.name testBaseEnumConstructor011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_1100
     * @tc.desc Verify BaseEnum constructor with float negative value and name returns correct valueOf and getName
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<float>(Double.toFloat(-0.5), "NEG_HALF");
      expect(e.valueOf()).assertEqual(Double.toFloat(-0.5));
      expect(e.getName()).assertEqual("NEG_HALF");
    });

    /**
     * @tc.name testBaseEnumConstructor012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_1200
     * @tc.desc Verify BaseEnum constructor with float minimum value and name returns correct valueOf and getName
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<float>(Double.toFloat(-3.4e38), "MIN_FLOAT");
      expect(e.valueOf()).assertEqual(Double.toFloat(-3.4e38));
      expect(e.getName()).assertEqual("MIN_FLOAT");
    });

    /**
     * @tc.name testBaseEnumConstructor013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_1300
     * @tc.desc Verify BaseEnum constructor with double value and name returns correct valueOf and getName
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<double>(3.141592653589793, "PI");
      expect(e.valueOf()).assertEqual(3.141592653589793);
      expect(e.getName()).assertEqual("PI");
    });

    /**
     * @tc.name testBaseEnumConstructor014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_1400
     * @tc.desc Verify BaseEnum constructor with double negative value and name returns correct valueOf and getName
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<double>(-0.001, "NEG_SMALL");
      expect(e.valueOf()).assertEqual(-0.001);
      expect(e.getName()).assertEqual("NEG_SMALL");
    });

    /**
     * @tc.name testBaseEnumConstructor015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_1500
     * @tc.desc  Verify BaseEnum constructor with double maximum value and name returns correct valueOf and getName
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<double>(1.7e308, "MAX_DOUBLE");
      expect(e.valueOf()).assertEqual(1.7e308);
      expect(e.getName()).assertEqual("MAX_DOUBLE");
    });

    /**
     * @tc.name testBaseEnumConstructor016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_1600
     * @tc.desc Verify BaseEnum constructor with double minimum value and name returns correct valueOf and getName
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<double>(-1.7e308, "MIN_DOUBLE");
      expect(e.valueOf()).assertEqual(-1.7e308);
      expect(e.getName()).assertEqual("MIN_DOUBLE");
    });

    /**
     * @tc.name testBaseEnumConstructor017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_1700
     * @tc.desc Verify BaseEnum constructor with string normal value "ACTIVE"
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<string>("ACTIVE", "STATUS_ACTIVE");
      expect(e.valueOf()).assertEqual("ACTIVE");
    });

    /**
     * @tc.name testBaseEnumConstructor018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_1800
     * @tc.desc Verify BaseEnum constructor with string single space value " "
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<string>(" ", "SPACE_STRING");
      expect(e.valueOf()).assertEqual(" ");
    });

    /**
     * @tc.name testBaseEnumConstructor019
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_1900
     * @tc.desc Verify BaseEnum constructor with string containing Unicode characters
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<string>("中文值", "UNICODE_VALUE");
      expect(e.valueOf()).assertEqual("中文值");
    });

    /**
     * @tc.name testBaseEnumConstructor020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_2000
     * @tc.desc Verify BaseEnum constructor with string containing emoji characters
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<string>("value😀", "EMOJI_VALUE");
      expect(e.valueOf()).assertEqual("value😀");
    });

    /**
     * @tc.name testBaseEnumConstructor021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_2100
     * @tc.desc Verify BaseEnum constructor with string containing special characters
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<string>("value\t\n\r", "SPECIAL_CHARS");
      expect(e.valueOf()).assertEqual("value\t\n\r");
    });

    /**
     * @tc.name testBaseEnumConstructor022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_2200
     * @tc.desc Verify BaseEnum constructor with string containing zero-width space
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<string>("​", "ZERO_WIDTH_SPACE");
      expect(e.valueOf()).assertEqual("​");
    });

    /**
     * @tc.name testBaseEnumConstructor023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_2300
     * @tc.desc Verify BaseEnum constructor with empty string as value and name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<string>("", "");
      expect(e.valueOf()).assertEqual("");
      expect(e.getName()).assertEqual("");
    });

    /**
     * @tc.name testBaseEnumConstructor024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_2400
     * @tc.desc Verify BaseEnum constructor throws Error when value is boolean (outside generic constraint)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const e = new BaseEnum<int>(true as int, "BOOL_VALUE");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testBaseEnumConstructor025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_2500
     * @tc.desc Verify BaseEnum constructor throws Error when value is object (outside generic constraint)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let invalidValue: Object = {};
        const e = new BaseEnum<int>(invalidValue as int, "OBJ_VALUE");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testBaseEnumConstructor026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_2600
     * @tc.desc Verify BaseEnum constructor throws Error when value is array (outside generic constraint)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let invalidValue: Object = [1, 2];
        const e = new BaseEnum<int>(invalidValue as int, "ARRAY_VALUE");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testBaseEnumConstructor027
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_2700
     * @tc.desc Verify BaseEnum constructor throws Error when int generic receives string value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let invalidValue: Object = "not_int";
        const e = new BaseEnum<int>(invalidValue as int, "TYPE_MISMATCH");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testBaseEnumConstructor028
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_2800
     * @tc.desc Verify BaseEnum constructor with camelCase name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(1, "myEnumName");
      expect(e.getName()).assertEqual("myEnumName");
    });

    /**
     * @tc.name testBaseEnumConstructor029
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_2900
     * @tc.desc Verify BaseEnum constructor with uppercase underscored name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(1, "ENUM_VALUE_1");
      expect(e.getName()).assertEqual("ENUM_VALUE_1");
    });

    /**
     * @tc.name testBaseEnumConstructor030
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_3000
     * @tc.desc Verify BaseEnum constructor with single space name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(1, " ");
      expect(e.getName()).assertEqual(" ");
    });

    /**
     * @tc.name testBaseEnumConstructor031
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_3100
     * @tc.desc Verify BaseEnum constructor with Chinese characters in name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(1, "就绪状态");
      expect(e.getName()).assertEqual("就绪状态");
    });

    /**
     * @tc.name testBaseEnumConstructor032
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_3200
     * @tc.desc Verify BaseEnum constructor with digits in name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(1, "VALUE_123");
      expect(e.getName()).assertEqual("VALUE_123");
    });

    /**
     * @tc.name testBaseEnumConstructor033
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_3300
     * @tc.desc Verify BaseEnum constructor with special symbols in name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(1, "VALUE@#$%");
      expect(e.getName()).assertEqual("VALUE@#$%");
    });

    /**
     * @tc.name testBaseEnumConstructor034
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_3400
     * @tc.desc Verify BaseEnum constructor with Unicode characters in name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(1, "值_éè");
      expect(e.getName()).assertEqual("值_éè");
    });

    /**
     * @tc.name testBaseEnumConstructor035
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_3500
     * @tc.desc Verify BaseEnum constructor with zero-width space in name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(1, "NAME​");
      expect(e.getName()).assertEqual("NAME​");
    });

    /**
     * @tc.name testBaseEnumConstructor036
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_3600
     * @tc.desc Verify BaseEnum constructor throws Error when name is number type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let invalidName: Object = 123;
        const e = new BaseEnum<int>(1, invalidName as string);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testBaseEnumConstructor037
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_3700
     * @tc.desc Verify BaseEnum constructor throws Error when name is boolean type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let invalidName: Object = true;
        const e = new BaseEnum<int>(1, invalidName as string);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testBaseEnumConstructor038
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_3800
     * @tc.desc Verify BaseEnum constructor throws Error when name is object type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let invalidName: Object = {};
        const e = new BaseEnum<int>(1, invalidName as string);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testBaseEnumConstructor039
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_3900
     * @tc.desc Verify BaseEnum constructor throws Error when name is array type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let invalidName: Object = ["name"];
        const e = new BaseEnum<int>(1, invalidName as string);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testBaseEnumConstructor040
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_4000
     * @tc.desc Verify BaseEnum constructor with long value and Chinese name combination
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<long>(Int.toLong(100), "浮点枚举");
      expect(e.valueOf()).assertEqual(Int.toLong(100));
      expect(e.getName()).assertEqual("浮点枚举");
    });

    /**
     * @tc.name testBaseEnumConstructor041
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_4100
     * @tc.desc Verify BaseEnum constructor with float value and Chinese name combination
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<float>(Double.toFloat(3.14), "浮点枚举");
      expect(e.valueOf()).assertEqual(Double.toFloat(3.14));
      expect(e.getName()).assertEqual("浮点枚举");
    });

    /**
     * @tc.name testBaseEnumConstructor042
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_4200
     * @tc.desc Verify BaseEnum constructor with string value and long name combination
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longName: string = "N".repeat(10000);
      const e = new BaseEnum<string>("val", longName);
      expect(e.valueOf()).assertEqual("val");
      expect(e.getName()).assertEqual(longName);
    });

    /**
     * @tc.name testBaseEnumConstructor043
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_4300
     * @tc.desc Verify BaseEnum constructor in try-catch-finally context executes finally block
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBaseEnumConstructor044
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_4400
     * @tc.desc Verify BaseEnum constructor with double value and emoji name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<double>(1.5, "VALUE😀");
      expect(e.valueOf()).assertEqual(1.5);
      expect(e.getName()).assertEqual("VALUE😀");
    });

    /**
     * @tc.name testBaseEnumConstructor045
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_4500
     * @tc.desc Verify BaseEnum constructor with short value and special character name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<short>(Int.toShort(1), "SHORT★♥");
      expect(e.valueOf()).assertEqual(Int.toShort(1));
      expect(e.getName()).assertEqual("SHORT★♥");
    });

  });
}
