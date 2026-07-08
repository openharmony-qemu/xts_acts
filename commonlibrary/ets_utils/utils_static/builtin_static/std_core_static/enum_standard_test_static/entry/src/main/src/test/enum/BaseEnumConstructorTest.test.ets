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
  ByteEnum,
  DoubleEnum,
  FloatEnum,
  IntEnum,
  LongEnum,
  ShortEnum,
  StringEnum
} from './EnumDefine.test';
import Utils from './../Util.test';

export default function BaseEnumConstructorTest(): void {
  describe('BaseEnumConstructorTest', (): void => {
    // yield to coroutine scheduler for proper async test execution
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(1);
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
      const e = IntEnum.TEST_004;
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
      const e = StringEnum.TEST_005;
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
      const e = ByteEnum.VALUE_100;
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
      const e = ShortEnum.VALUE_10000;
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
      const e = IntEnum.VALUE_100;
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
      const e = LongEnum.VALUE_1000;
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
      const e = LongEnum.VALUE_NEG_1;
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
      const e = FloatEnum.PI;
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
      const e = FloatEnum.NEG_HALF;
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
      const e = FloatEnum.MIN_FLOAT;
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
      const e = DoubleEnum.PI;
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
      const e = DoubleEnum.NEG_SMALL;
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
      const e = DoubleEnum.MAX_DOUBLE;
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
      const e = DoubleEnum.MIN_DOUBLE;
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
      const e = StringEnum.STATUS_ACTIVE;
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
      const e = StringEnum.SPACE_STRING;
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
      const e = StringEnum.UNICODE_VALUE;
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
      const e = StringEnum.EMOJI_VALUE;
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
      const e = StringEnum.SPECIAL_CHARS;
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
      const e = StringEnum.ZERO_WIDTH_SPACE;
      expect(e.valueOf()).assertEqual("​");
    });

    /**
     * @tc.name testBaseEnumConstructor023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_2300
     * @tc.desc Verify BaseEnum constructor with camelCase name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = IntEnum.myEnumName;
      expect(e.getName()).assertEqual("myEnumName");
    });

    /**
     * @tc.name testBaseEnumConstructor024
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_2400
     * @tc.desc Verify BaseEnum constructor with uppercase underscored name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = IntEnum.ENUM_VALUE_1;
      expect(e.getName()).assertEqual("ENUM_VALUE_1");
    });

    /**
     * @tc.name testBaseEnumConstructor025
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_CONSTRUCTOR_2500
     * @tc.desc Verify BaseEnum constructor with digits in name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumConstructor025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = IntEnum.VALUE_123;
      expect(e.getName()).assertEqual("VALUE_123");
    });

  });
}
