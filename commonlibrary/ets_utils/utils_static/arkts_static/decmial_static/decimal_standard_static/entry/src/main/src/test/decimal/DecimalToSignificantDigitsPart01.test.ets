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
} from "../../../ets/hypium/index";
import { BusinessError } from '@ohos.base';
import Utils from "../Util.test";
import { Decimal } from "@kit.ArkTS";
import { BusinessError } from "@ohos.base";

export default function decimalToSignificantDigitsPart01Test(): void {
  describe("DecimalToSignificantDigitsPart01Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_0100
     * @tc.name decimalToSignificantDigitsPart01Test001
     * @tc.desc Verify toSignificantDigits(3) on new Decimal("1.2345") returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal("1.2345").toSignificantDigits(3);
      let actual: string = r.toString();
      let expected: string = "1.23";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_0200
     * @tc.name decimalToSignificantDigitsPart01Test002
     * @tc.desc Verify toSignificantDigits(1) on new Decimal("0.0045") returns 0.005 and e is -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal("0.0045").toSignificantDigits(1);
      let actual: string = r.toString();
      let expected: string = "0.005";
      expect(actual).assertEqual(expected);
      let actual2: number = r.e;
      let expected2: int = -3;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_0300
     * @tc.name decimalToSignificantDigitsPart01Test003
     * @tc.desc Verify toSignificantDigits(1) on new Decimal(500) returns 500
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(500).toSignificantDigits(1);
      let actual: string = r.toString();
      let expected: string = "500";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_0400
     * @tc.name decimalToSignificantDigitsPart01Test004
     * @tc.desc Verify toSignificantDigits(1) on new Decimal("0.4") returns 0.4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal("0.4").toSignificantDigits(1);
      let actual: string = r.toString();
      let expected: string = "0.4";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_0500
     * @tc.name decimalToSignificantDigitsPart01Test005
     * @tc.desc Verify toSignificantDigits(1) on new Decimal(999) returns 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(999).toSignificantDigits(1);
      let actual: string = r.toString();
      let expected: string = "1000";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_0600
     * @tc.name decimalToSignificantDigitsPart01Test006
     * @tc.desc Verify toSignificantDigits(1) on new Decimal(15) returns 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(15).toSignificantDigits(1);
      let actual: string = r.toString();
      let expected: string = "20";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_0700
     * @tc.name decimalToSignificantDigitsPart01Test007
     * @tc.desc Verify toSignificantDigits(2) on new Decimal(123.456) returns 120
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(123.456).toSignificantDigits(2);
      let actual: string = r.toString();
      let expected: string = "120";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_0800
     * @tc.name decimalToSignificantDigitsPart01Test008
     * @tc.desc Verify toSignificantDigits(2) on new Decimal("0.500") returns 0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal("0.500").toSignificantDigits(2);
      let actual: string = r.toString();
      let expected: string = "0.5";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_0900
     * @tc.name decimalToSignificantDigitsPart01Test009
     * @tc.desc Verify toSignificantDigits(3) on new Decimal(42) returns 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(42).toSignificantDigits(3);
      let actual: string = r.toString();
      let expected: string = "42";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_1000
     * @tc.name decimalToSignificantDigitsPart01Test010
     * @tc.desc Verify toSignificantDigits(4) on new Decimal("1.234") returns 1.234
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal("1.234").toSignificantDigits(4);
      let actual: string = r.toString();
      let expected: string = "1.234";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_1100
     * @tc.name decimalToSignificantDigitsPart01Test011
     * @tc.desc Verify toSignificantDigits(5) on new Decimal("1.2") returns 1.2 and e is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal("1.2").toSignificantDigits(5);
      let actual: string = r.toString();
      let expected: string = "1.2";
      expect(actual).assertEqual(expected);
      let actual2: number = r.e;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_1200
     * @tc.name decimalToSignificantDigitsPart01Test012
     * @tc.desc Verify toSignificantDigits(6) on new Decimal(7) returns 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(7).toSignificantDigits(6);
      let actual: string = r.toString();
      let expected: string = '7';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_1300
     * @tc.name decimalToSignificantDigitsPart01Test013
     * @tc.desc Verify toSignificantDigits(10) on new Decimal("12345.6789") returns a value equal to input (comparedTo 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal("12345.6789").toSignificantDigits(10);
      let actual: number = r.comparedTo(new Decimal("12345.6789"));
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_1400
     * @tc.name decimalToSignificantDigitsPart01Test014
     * @tc.desc Verify toSignificantDigits(20) on new Decimal("12345678901234567890") returns 12345678901234567890
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal("12345678901234567890").toSignificantDigits(20);
      let actual: string = r.toString();
      let expected: string = "12345678901234567890";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_1500
     * @tc.name decimalToSignificantDigitsPart01Test015
     * @tc.desc Verify toSignificantDigits(1000) on new Decimal("1.5") returns 1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal("1.5").toSignificantDigits(1000);
      let actual: string = r.toString();
      let expected: string = "1.5";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_1600
     * @tc.name decimalToSignificantDigitsPart01Test016
     * @tc.desc Verify toSignificantDigits(3) on new Decimal("1.235") returns 1.24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal("1.235").toSignificantDigits(3);
      let actual: string = r.toString();
      let expected: string = "1.24";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_1700
     * @tc.name decimalToSignificantDigitsPart01Test017
     * @tc.desc Verify toSignificantDigits(3) on new Decimal("1.234") returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal("1.234").toSignificantDigits(3);
      let actual: string = r.toString();
      let expected: string = "1.23";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_1800
     * @tc.name decimalToSignificantDigitsPart01Test018
     * @tc.desc Verify toSignificantDigits(2) on new Decimal(999.9) returns 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(999.9).toSignificantDigits(2);
      let actual: string = r.toString();
      let expected: string = "1000";
      expect(actual).assertEqual(expected);
      let actual2: number = r.comparedTo(new Decimal("1000"));
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_1900
     * @tc.name decimalToSignificantDigitsPart01Test019
     * @tc.desc Verify toSignificantDigits(3) on new Decimal(1999) returns 2000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(1999).toSignificantDigits(3);
      let actual: string = r.toString();
      let expected: string = "2000";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_2000
     * @tc.name decimalToSignificantDigitsPart01Test020
     * @tc.desc Verify toSignificantDigits(5) on new Decimal(123456789) returns 123460000 and e is 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(123456789).toSignificantDigits(5);
      let actual: string = r.toString();
      let expected: string = "123460000";
      expect(actual).assertEqual(expected);
      let actual2: number = r.e;
      let expected2: int = 8;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_2100
     * @tc.name decimalToSignificantDigitsPart01Test021
     * @tc.desc Verify toSignificantDigits(5) on new Decimal(-123456789) returns -123460000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(-123456789).toSignificantDigits(5);
      let actual: string = r.toString();
      let expected: string = "-123460000";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_2200
     * @tc.name decimalToSignificantDigitsPart01Test022
     * @tc.desc Verify toSignificantDigits(3) on new Decimal("-1.235") returns -1.24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal("-1.235").toSignificantDigits(3);
      let actual: string = r.toString();
      let expected: string = "-1.24";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_2300
     * @tc.name decimalToSignificantDigitsPart01Test023
     * @tc.desc Verify toSignificantDigits(1) on new Decimal("-0.0045") returns -0.005
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal("-0.0045").toSignificantDigits(1);
      let actual: string = r.toString();
      let expected: string = "-0.005";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_2400
     * @tc.name decimalToSignificantDigitsPart01Test024
     * @tc.desc Verify toSignificantDigits(2) on new Decimal("0.0009999") returns a value equal to 0.001 (comparedTo 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal("0.0009999").toSignificantDigits(2);
      let actual: number = r.comparedTo(new Decimal("0.001"));
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_2500
     * @tc.name decimalToSignificantDigitsPart01Test025
     * @tc.desc Verify toSignificantDigits(3) on new Decimal(1005) returns 1010
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(1005).toSignificantDigits(3);
      let actual: string = r.toString();
      let expected: string = "1010";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_2600
     * @tc.name decimalToSignificantDigitsPart01Test026
     * @tc.desc Verify toSignificantDigits(4) on new Decimal("123.456") returns 123.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal("123.456").toSignificantDigits(4);
      let actual: string = r.toString();
      let expected: string = "123.5";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_2700
     * @tc.name decimalToSignificantDigitsPart01Test027
     * @tc.desc Verify toSignificantDigits(3) on new Decimal("1.2355e-2") returns 0.0124
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal("1.2355e-2").toSignificantDigits(3);
      let actual: string = r.toString();
      let expected: string = "0.0124";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_2800
     * @tc.name decimalToSignificantDigitsPart01Test028
     * @tc.desc Verify toSignificantDigits(2) on new Decimal("1e5") returns 100000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal("1e5").toSignificantDigits(2);
      let actual: string = r.toString();
      let expected: string = "100000";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_2900
     * @tc.name decimalToSignificantDigitsPart01Test029
     * @tc.desc Verify toSignificantDigits(3) on new Decimal("1e21") returns a value equal to 1e21 (comparedTo 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal("1e21").toSignificantDigits(3);
      let actual: number = r.comparedTo(new Decimal("1e21"));
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_3000
     * @tc.name decimalToSignificantDigitsPart01Test030
     * @tc.desc Verify toSignificantDigits(3) on new Decimal("0.000012345") returns 0.0000123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal("0.000012345").toSignificantDigits(3);
      let actual: string = r.toString();
      let expected: string = "0.0000123";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_3100
     * @tc.name decimalToSignificantDigitsPart01Test031
     * @tc.desc Verify toSignificantDigits(6) on new Decimal("0.00123") returns 0.00123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal("0.00123").toSignificantDigits(6);
      let actual: string = r.toString();
      let expected: string = "0.00123";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_3200
     * @tc.name decimalToSignificantDigitsPart01Test032
     * @tc.desc Verify toSignificantDigits(5) on new Decimal("-1.2") returns -1.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal("-1.2").toSignificantDigits(5);
      let actual: string = r.toString();
      let expected: string = "-1.2";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_3300
     * @tc.name decimalToSignificantDigitsPart01Test033
     * @tc.desc Verify toSignificantDigits(3) on new Decimal("0.000") returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal("0.000").toSignificantDigits(3);
      let actual: string = r.toString();
      let expected: string = '0';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_3400
     * @tc.name decimalToSignificantDigitsPart01Test034
     * @tc.desc Verify toSignificantDigits(5) on new Decimal("0.33333333333333333333") returns 0.33333
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal("0.33333333333333333333").toSignificantDigits(5);
      let actual: string = r.toString();
      let expected: string = "0.33333";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_3500
     * @tc.name decimalToSignificantDigitsPart01Test035
     * @tc.desc Verify toSignificantDigits(1) on new Decimal(0.1 + 0.2) returns 0.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(0.1 + 0.2).toSignificantDigits(1);
      let actual: string = r.toString();
      let expected: string = "0.3";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_3600
     * @tc.name decimalToSignificantDigitsPart01Test036
     * @tc.desc Verify toSignificantDigits(1) on new Decimal("123.456") returns 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal("123.456").toSignificantDigits(1);
      let actual: string = r.toString();
      let expected: string = "100";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_3700
     * @tc.name decimalToSignificantDigitsPart01Test037
     * @tc.desc Verify toSignificantDigits(3) on new Decimal("-123.456") returns -123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal("-123.456").toSignificantDigits(3);
      let actual: string = r.toString();
      let expected: string = "-123";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_3800
     * @tc.name decimalToSignificantDigitsPart01Test038
     * @tc.desc Verify toSignificantDigits(3) on new Decimal(Double.NaN) returns Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(Double.NaN).toSignificantDigits(3);
      let actual: string = r.toString();
      let expected: string = "NaN";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_3900
     * @tc.name decimalToSignificantDigitsPart01Test039
     * @tc.desc Verify toSignificantDigits(3) on new Decimal(Number.POSITIVE_INFINITY) returns Number.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(Number.POSITIVE_INFINITY).toSignificantDigits(3);
      let actual: string = r.toString();
      let expected: string = "Infinity";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_4000
     * @tc.name decimalToSignificantDigitsPart01Test040
     * @tc.desc Verify toSignificantDigits(3) on new Decimal(-Number.POSITIVE_INFINITY) returns -Number.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(-Number.POSITIVE_INFINITY).toSignificantDigits(3);
      let actual: string = r.toString();
      let expected: string = "-Infinity";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_4100
     * @tc.name decimalToSignificantDigitsPart01Test041
     * @tc.desc Verify toSignificantDigits(3) on new Decimal(0) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(0).toSignificantDigits(3);
      let actual: string = r.toString();
      let expected: string = '0';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_4200
     * @tc.name decimalToSignificantDigitsPart01Test042
     * @tc.desc Verify toSignificantDigits(3) on new Decimal(-0) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(-0).toSignificantDigits(3);
      let actual: string = r.toString();
      let expected: string = '0';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_4300
     * @tc.name decimalToSignificantDigitsPart01Test043
     * @tc.desc Verify toSignificantDigits(3) on new Decimal("1.2345") returns 1.23 and does not mutate source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.2345");
      let r: Decimal = d.toSignificantDigits(3);
      let actual0: string = r.toString();
      let expected0: string = "1.23";
      expect(actual0).assertEqual(expected0);
      let actual: string = d.toString();
      let expected: string = "1.2345";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_4400
     * @tc.name decimalToSignificantDigitsPart01Test044
     * @tc.desc Verify toSignificantDigits(3) on new Decimal("1.2345") returns a new Decimal instance (not equal to d)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.2345");
      let r: Decimal = d.toSignificantDigits(3);
      expect(r).not().assertEqual(d);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_4500
     * @tc.name decimalToSignificantDigitsPart01Test045
     * @tc.desc Verify new Decimal("1.2345").toSignificantDigits(3).add(0.01) returns 1.24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.2345").toSignificantDigits(3).add(0.01).toString();
      expect(s).assertEqual("1.24");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_4600
     * @tc.name decimalToSignificantDigitsPart01Test046
     * @tc.desc Verify new Decimal("1.2345").toSignificantDigits(3).toSignificantDigits(3) returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal("1.2345").toSignificantDigits(3).toSignificantDigits(3);
      let actual: string = r.toString();
      let expected: string = "1.23";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_4700
     * @tc.name decimalToSignificantDigitsPart01Test047
     * @tc.desc Verify new Decimal("1.2345").toSignificantDigits(4).toSignificantDigits(2) returns 1.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal("1.2345").toSignificantDigits(4).toSignificantDigits(2);
      let actual: string = r.toString();
      let expected: string = "1.2";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_4800
     * @tc.name decimalToSignificantDigitsPart01Test048
     * @tc.desc Verify new Decimal("123.456").toSignificantDigits(2).mul(2) returns 240
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal("123.456").toSignificantDigits(2).mul(2);
      let actual: string = r.toString();
      let expected: string = "240";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_4900
     * @tc.name decimalToSignificantDigitsPart01Test049
     * @tc.desc Verify new Decimal("1.2345").toSignificantDigits(3).toSignificantDigits(5) returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal("1.2345").toSignificantDigits(3).toSignificantDigits(5);
      let actual: string = r.toString();
      let expected: string = "1.23";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_5000
     * @tc.name decimalToSignificantDigitsPart01Test050
     * @tc.desc Verify toSignificantDigits(3) on new Decimal(new Decimal("1.2345").toSignificantDigits(3)) returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(new Decimal("1.2345").toSignificantDigits(3));
      let actual: string = r.toString();
      let expected: string = "1.23";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_5100
     * @tc.name decimalToSignificantDigitsPart01Test051
     * @tc.desc Verify toSignificantDigits(3) on new Decimal("-1.2345") sign field s equals -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal("-1.2345").toSignificantDigits(3);
      let actual: number = r.s;
      let expected: int = -1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_5200
     * @tc.name decimalToSignificantDigitsPart01Test052
     * @tc.desc Verify toSignificantDigits(0) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal("1.2345").toSignificantDigits(0);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_5300
     * @tc.name decimalToSignificantDigitsPart01Test053
     * @tc.desc Verify toSignificantDigits(-1) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal("1.2345").toSignificantDigits(-1);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_5400
     * @tc.name decimalToSignificantDigitsPart01Test054
     * @tc.desc Verify toSignificantDigits(1.5) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal("1.2345").toSignificantDigits(1.5);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_5500
     * @tc.name decimalToSignificantDigitsPart01Test055
     * @tc.desc Verify toSignificantDigits(1000000001) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal("1.2345").toSignificantDigits(1000000001);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_5600
     * @tc.name decimalToSignificantDigitsPart01Test056
     * @tc.desc Verify toSignificantDigits(Double.NaN) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal("1.2345").toSignificantDigits(Double.NaN);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_5700
     * @tc.name decimalToSignificantDigitsPart01Test057
     * @tc.desc Verify toSignificantDigits(Number.POSITIVE_INFINITY) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal("1.2345").toSignificantDigits(Number.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART01_5800
     * @tc.name decimalToSignificantDigitsPart01Test058
     * @tc.desc Verify toSignificantDigits(-Number.POSITIVE_INFINITY) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart01Test058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal("1.2345").toSignificantDigits(-Number.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });
  });
}