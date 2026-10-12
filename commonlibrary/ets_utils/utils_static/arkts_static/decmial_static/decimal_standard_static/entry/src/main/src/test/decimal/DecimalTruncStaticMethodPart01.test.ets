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
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from "../../../../hypium/index";
import { BusinessError } from '@ohos.base';
import Utils from "../Util.test";
import { Decimal } from "@kit.ArkTS";

export default function decimalTruncStaticMethodPart01Test(): void {
  describe("DecimalTruncStaticMethodPart01Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_0100
     * @tc.name decimalTruncStaticMethodPart01Test001
     * @tc.desc Verify trunc(6.3) returns 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc(6.3);
      let actual: string = r.toString();
      let expected: string = '6';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_0200
     * @tc.name decimalTruncStaticMethodPart01Test002
     * @tc.desc Verify trunc(Decimal.trunc(8.9)) returns 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc(Decimal.trunc(8.9));
      let actual: string = r.toString();
      let expected: string = '8';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_0300
     * @tc.name decimalTruncStaticMethodPart01Test003
     * @tc.desc Verify trunc("+42") returns 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("+42");
      let actual: string = r.toString();
      let expected: string = "42";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_0400
     * @tc.name decimalTruncStaticMethodPart01Test004
     * @tc.desc Verify trunc("-98") returns -98
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("-98");
      let actual: string = r.toString();
      let expected: string = "-98";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_0500
     * @tc.name decimalTruncStaticMethodPart01Test005
     * @tc.desc Verify trunc("9.99") returns 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("9.99");
      let actual: string = r.toString();
      let expected: string = '9';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_0600
     * @tc.name decimalTruncStaticMethodPart01Test006
     * @tc.desc Verify trunc("-9.99") returns -9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("-9.99");
      let actual: string = r.toString();
      let expected: string = "-9";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_0700
     * @tc.name decimalTruncStaticMethodPart01Test007
     * @tc.desc Verify trunc("-0.08") returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("-0.08");
      let actual: string = r.toString();
      let expected: string = '0';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_0800
     * @tc.name decimalTruncStaticMethodPart01Test008
     * @tc.desc Verify trunc("3e4") returns 30000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("3e4");
      let actual: string = r.toString();
      let expected: string = "30000";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_0900
     * @tc.name decimalTruncStaticMethodPart01Test009
     * @tc.desc Verify trunc("-1.23e-4") returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("-1.23e-4");
      let actual: string = r.toString();
      let expected: string = '0';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_1000
     * @tc.name decimalTruncStaticMethodPart01Test010
     * @tc.desc Verify trunc("2E6") returns 2000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("2E6");
      let actual: string = r.toString();
      let expected: string = "2000000";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_1100
     * @tc.name decimalTruncStaticMethodPart01Test011
     * @tc.desc Verify trunc("1e+5") returns 100000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("1e+5");
      let actual: string = r.toString();
      let expected: string = "100000";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_1200
     * @tc.name decimalTruncStaticMethodPart01Test012
     * @tc.desc Verify trunc("2.5e+03") returns 2500
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("2.5e+03");
      let actual: string = r.toString();
      let expected: string = "2500";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_1300
     * @tc.name decimalTruncStaticMethodPart01Test013
     * @tc.desc Verify trunc("7e0") returns 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("7e0");
      let actual: string = r.toString();
      let expected: string = '7';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_1400
     * @tc.name decimalTruncStaticMethodPart01Test014
     * @tc.desc Verify trunc("0456.78") returns 456
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("0456.78");
      let actual: string = r.toString();
      let expected: string = "456";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_1500
     * @tc.name decimalTruncStaticMethodPart01Test015
     * @tc.desc Verify trunc("3.500") returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("3.500");
      let actual: string = r.toString();
      let expected: string = '3';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_1600
     * @tc.name decimalTruncStaticMethodPart01Test016
     * @tc.desc Verify trunc("111222333444555666777888999.5") returns 1.11222333444555666777888999e+26
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("111222333444555666777888999.5");
      let actual: string = r.toString();
      let expected: string = "1.11222333444555666777888999e+26";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_1700
     * @tc.name decimalTruncStaticMethodPart01Test017
     * @tc.desc Verify trunc("-12345678901234567890.99") returns -12345678901234567890
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("-12345678901234567890.99");
      let actual: string = r.toString();
      let expected: string = "-12345678901234567890";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_1800
     * @tc.name decimalTruncStaticMethodPart01Test018
     * @tc.desc Verify trunc("4e+30") returns 4e+30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("4e+30");
      let actual: string = r.toString();
      let expected: string = "4e+30";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_1900
     * @tc.name decimalTruncStaticMethodPart01Test019
     * @tc.desc Verify trunc(-4.3) returns -4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc(-4.3);
      let actual: string = r.toString();
      let expected: string = "-4";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_2000
     * @tc.name decimalTruncStaticMethodPart01Test020
     * @tc.desc Verify trunc(-0.3) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc(-0.3);
      let actual: string = r.toString();
      let expected: string = '0';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_2100
     * @tc.name decimalTruncStaticMethodPart01Test021
     * @tc.desc Verify trunc(1.1 + 2.2) returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc(1.1 + 2.2);
      let actual: string = r.toString();
      let expected: string = '3';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_2200
     * @tc.name decimalTruncStaticMethodPart01Test022
     * @tc.desc Verify trunc(-1.7976931348623157e+308) returns sign -1 and exponent 308
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc(-1.7976931348623157e308);
      let actual: number = r.s;
      let expected: int = -1;
      expect(actual).assertEqual(expected);
      let actual2: number = r.e;
      let expected2: int = 308;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_2300
     * @tc.name decimalTruncStaticMethodPart01Test023
     * @tc.desc Verify trunc(9007199254740991) returns 9007199254740991
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc(9007199254740991);
      let actual: string = r.toString();
      let expected: string = "9007199254740991";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_2400
     * @tc.name decimalTruncStaticMethodPart01Test024
     * @tc.desc Verify trunc(0.1 + 0.2 - 0.3) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc(0.1 + 0.2 - 0.3);
      let actual: string = r.toString();
      let expected: string = '0';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_2500
     * @tc.name decimalTruncStaticMethodPart01Test025
     * @tc.desc Verify trunc(src) on new Decimal("8.5") returns 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Decimal = new Decimal("8.5");
      let r: Decimal = Decimal.trunc(src);
      let actual: string = r.toString();
      let expected: string = '8';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_2600
     * @tc.name decimalTruncStaticMethodPart01Test026
     * @tc.desc Verify trunc(src) on new Decimal("-8.5") returns -8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Decimal = new Decimal("-8.5");
      let r: Decimal = Decimal.trunc(src);
      let actual: string = r.toString();
      let expected: string = "-8";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_2700
     * @tc.name decimalTruncStaticMethodPart01Test027
     * @tc.desc Verify trunc(src) on new Decimal("0.00") returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Decimal = new Decimal("0.00");
      let r: Decimal = Decimal.trunc(src);
      let actual: string = r.toString();
      let expected: string = '0';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_2800
     * @tc.name decimalTruncStaticMethodPart01Test028
     * @tc.desc Verify trunc(src) on new Decimal("-0.00") returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Decimal = new Decimal("-0.00");
      let r: Decimal = Decimal.trunc(src);
      let actual: boolean = r.isZero();
      expect(actual).assertTrue();
      let actual2: string = r.toString();
      let expected2: string = '0';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_2900
     * @tc.name decimalTruncStaticMethodPart01Test029
     * @tc.desc Verify trunc(src) on new Decimal("9e+25") returns 9e+25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Decimal = new Decimal("9e+25");
      let r: Decimal = Decimal.trunc(src);
      let actual: string = r.toString();
      let expected: string = "9e+25";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_3000
     * @tc.name decimalTruncStaticMethodPart01Test030
     * @tc.desc Verify trunc(src) on new Decimal("0.123456789") returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Decimal = new Decimal("0.123456789");
      let r: Decimal = Decimal.trunc(src);
      let actual: string = r.toString();
      let expected: string = '0';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_3100
     * @tc.name decimalTruncStaticMethodPart01Test031
     * @tc.desc Verify trunc(src) on new Decimal("-9876543210.987") returns -9876543210
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Decimal = new Decimal("-9876543210.987");
      let r: Decimal = Decimal.trunc(src);
      let actual: string = r.toString();
      let expected: string = "-9876543210";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_3200
     * @tc.name decimalTruncStaticMethodPart01Test032
     * @tc.desc Verify trunc(5.7)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc(5.7);
      let actual: string = r.toString();
      let expected: string = '5';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_3300
     * @tc.name decimalTruncStaticMethodPart01Test033
     * @tc.desc Verify trunc("-5.7") returns sign -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("-5.7");
      let actual: number = r.s;
      let expected: int = -1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_3400
     * @tc.name decimalTruncStaticMethodPart01Test034
     * @tc.desc Verify trunc("-0.1")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("-0.1");
      let actual: boolean = r.isPositive();
      expect(actual).assertFalse();
      let sign: number = r.s;
      let expectedSign: int = -1;
      expect(sign).assertEqual(expectedSign);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_3500
     * @tc.name decimalTruncStaticMethodPart01Test035
     * @tc.desc Verify trunc("6.7") and not negative and positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("6.7");
      let actual: boolean = r.isInteger();
      expect(actual).assertTrue();
      let actual2: boolean = r.isNegative();
      expect(actual2).assertFalse();
      let actual3: boolean = r.isPositive();
      expect(actual3).assertTrue();
      let str: string = r.toString();
      expect(str).assertEqual('6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_3600
     * @tc.name decimalTruncStaticMethodPart01Test036
     * @tc.desc Verify string trunc trunc "-6.3"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = Decimal.trunc("-6.3").toString();
      let expected: string = new Decimal("-6.3").trunc().toString();
      expect(actual).assertEqual(expected);
      expect(actual).assertEqual("-6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_3700
     * @tc.name decimalTruncStaticMethodPart01Test037
     * @tc.desc Verify double trunc trunc 6.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = Decimal.trunc(6.3).toString();
      let expected: string = new Decimal(6.3).trunc().toString();
      expect(actual).assertEqual(expected);
      expect(actual).assertEqual('6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_3800
     * @tc.name decimalTruncStaticMethodPart01Test038
     * @tc.desc Verify Decimal trunc trunc -7.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Decimal = new Decimal("-7.5");
      let actual: string = Decimal.trunc(src).toString();
      let expected: string = src.trunc().toString();
      expect(actual).assertEqual(expected);
      expect(actual).assertEqual("-7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_3900
     * @tc.name decimalTruncStaticMethodPart01Test039
     * @tc.desc Verify -Infinity trunc trunc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = Decimal.trunc(-Number.POSITIVE_INFINITY).toString();
      let expected: string = new Decimal(-Number.POSITIVE_INFINITY).trunc().toString();
      expect(actual).assertEqual(expected);
      expect(actual).assertEqual("-Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_4000
     * @tc.name decimalTruncStaticMethodPart01Test040
     * @tc.desc Verify trunc("6.7").add(1) returns 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("6.7").add(1);
      let actual: string = r.toString();
      let expected: string = '7';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_4100
     * @tc.name decimalTruncStaticMethodPart01Test041
     * @tc.desc Verify trunc("invalid-object") throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.trunc("invalid-object");
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART01_4200
     * @tc.name decimalTruncStaticMethodPart01Test042
     * @tc.desc Verify trunc("0x10") returns 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart01Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("0x10");
      let actual: string = r.toString();
      let expected: string = "16";
      expect(actual).assertEqual(expected);
    });
  });
}