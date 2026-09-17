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
import Utils from "../Util.test";
import { Decimal } from "@kit.ArkTS";

export default function decimalToSignificantDigitsPart03Test(): void {
  describe("DecimalToSignificantDigitsPart03Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_0100
     * @tc.name decimalToSignificantDigitsPart03Test001
     * @tc.desc Verify toSignificantDigits(2) on new Decimal("1.2500") returns 1.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.2500");
      let r: Decimal = d.toSignificantDigits(2);
      let actual: string = r.toString();
      let expected: string = "1.3";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_0200
     * @tc.name decimalToSignificantDigitsPart03Test002
     * @tc.desc Verify toSignificantDigits(2, Decimal.ROUND_DOWN) on new Decimal("1.2500") returns 1.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.2500");
      let r: Decimal = d.toSignificantDigits(2, Decimal.ROUND_DOWN);
      let actual: string = r.toString();
      let expected: string = "1.2";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_0300
     * @tc.name decimalToSignificantDigitsPart03Test003
     * @tc.desc Verify toSignificantDigits(2) on new Decimal("2.3500") returns 2.4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("2.3500");
      let r1: Decimal = d.toSignificantDigits(2);
      let r2: Decimal = d.toSignificantDigits(2, Decimal.ROUND_DOWN);
      let actual: string = r1.toString();
      let expected: string = "2.4";
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = "2.3";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_0400
     * @tc.name decimalToSignificantDigitsPart03Test004
     * @tc.desc Verify toSignificantDigits(3) on new Decimal("1.25") returns 1.25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.25");
      let r: Decimal = d.toSignificantDigits(3);
      let actual: string = r.toString();
      let expected: string = "1.25";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_0500
     * @tc.name decimalToSignificantDigitsPart03Test005
     * @tc.desc Verify toSignificantDigits(1, Decimal.ROUND_DOWN) on new Decimal("8.5") returns 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("8.5");
      let r: Decimal = d.toSignificantDigits(1, Decimal.ROUND_DOWN);
      let actual: string = r.toString();
      let expected: string = '8';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_0600
     * @tc.name decimalToSignificantDigitsPart03Test006
     * @tc.desc Verify toSignificantDigits(10) on new Decimal("123.456") returns 123.456
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("123.456");
      let r: Decimal = d.toSignificantDigits(10);
      let actual: string = r.toString();
      let expected: string = "123.456";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_0700
     * @tc.name decimalToSignificantDigitsPart03Test007
     * @tc.desc Verify toSignificantDigits(3) on new Decimal("0.0012345") returns 0.00123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("0.0012345");
      let r: Decimal = d.toSignificantDigits(3);
      let actual: string = r.toString();
      let expected: string = "0.00123";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_0800
     * @tc.name decimalToSignificantDigitsPart03Test008
     * @tc.desc Verify toSignificantDigits(3, Decimal.ROUND_UP) on new Decimal("0.0012345") returns 0.00124
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("0.0012345");
      let r: Decimal = d.toSignificantDigits(3, Decimal.ROUND_UP);
      let actual: string = r.toString();
      let expected: string = "0.00124";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_0900
     * @tc.name decimalToSignificantDigitsPart03Test009
     * @tc.desc Verify toSignificantDigits(2, Decimal.ROUND_DOWN) on new Decimal("4.3500") returns 4.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("4.3500");
      let r: Decimal = d.toSignificantDigits(2, Decimal.ROUND_DOWN);
      let actual: string = r.toString();
      let expected: string = "4.3";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_1000
     * @tc.name decimalToSignificantDigitsPart03Test010
     * @tc.desc Verify toSignificantDigits(2) on new Decimal("-1.2500") returns -1.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("-1.2500");
      let r: Decimal = d.toSignificantDigits(2);
      let actual: string = r.toString();
      let expected: string = "-1.3";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_1100
     * @tc.name decimalToSignificantDigitsPart03Test011
     * @tc.desc Verify toSignificantDigits(2, Decimal.ROUND_CEILING) on new Decimal("-1.2500") returns -1.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("-1.2500");
      let r: Decimal = d.toSignificantDigits(2, Decimal.ROUND_CEILING);
      let actual: string = r.toString();
      let expected: string = "-1.2";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_1200
     * @tc.name decimalToSignificantDigitsPart03Test012
     * @tc.desc Verify toSignificantDigits(2, Decimal.ROUND_FLOOR) on new Decimal("-1.2500") returns -1.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("-1.2500");
      let r: Decimal = d.toSignificantDigits(2, Decimal.ROUND_FLOOR);
      let actual: string = r.toString();
      let expected: string = "-1.3";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_1300
     * @tc.name decimalToSignificantDigitsPart03Test013
     * @tc.desc Verify toSignificantDigits(3) on new Decimal("10.050") returns 10.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("10.050");
      let r: Decimal = d.toSignificantDigits(3);
      let actual: string = r.toString();
      let expected: string = "10.1";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_1400
     * @tc.name decimalToSignificantDigitsPart03Test014
     * @tc.desc Verify toSignificantDigits(3, Decimal.ROUND_DOWN) on new Decimal("10.050") returns 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("10.050");
      let r: Decimal = d.toSignificantDigits(3, Decimal.ROUND_DOWN);
      let actual: string = r.toString();
      let expected: string = "10";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_1500
     * @tc.name decimalToSignificantDigitsPart03Test015
     * @tc.desc Verify toSignificantDigits(2) on new Decimal("9.8765") returns 9.9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("9.8765");
      let r1: Decimal = d.toSignificantDigits(2);
      let r2: Decimal = d.toSignificantDigits(2, Decimal.ROUND_HALF_UP);
      let actual: string = r1.toString();
      let expected: string = "9.9";
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = "9.9";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_1600
     * @tc.name decimalToSignificantDigitsPart03Test016
     * @tc.desc Verify toSignificantDigits(2) on new Decimal("3.4500") returns 3.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("3.4500");
      let r1: Decimal = d.toSignificantDigits(2);
      expect(r1.toString()).assertEqual("3.5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_1700
     * @tc.name decimalToSignificantDigitsPart03Test017
     * @tc.desc Verify toSignificantDigits(3) on new Decimal("0.00012345") returns 0.000123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("0.00012345");
      let r1: Decimal = d.toSignificantDigits(3);
      let r2: Decimal = d.toSignificantDigits(3, Decimal.ROUND_HALF_UP);
      let actual: string = r1.toString();
      let expected: string = "0.000123";
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = "0.000123";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_1800
     * @tc.name decimalToSignificantDigitsPart03Test018
     * @tc.desc Verify toSignificantDigits(2) on new Decimal("-2.345") returns -2.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("-2.345");
      let r1: Decimal = d.toSignificantDigits(2);
      let r2: Decimal = d.toSignificantDigits(2, Decimal.ROUND_HALF_UP);
      let actual: string = r1.toString();
      let expected: string = "-2.3";
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = "-2.3";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_1900
     * @tc.name decimalToSignificantDigitsPart03Test019
     * @tc.desc Verify toSignificantDigits(1) on new Decimal("7.5") returns 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("7.5");
      let r1: Decimal = d.toSignificantDigits(1);
      let r2: Decimal = d.toSignificantDigits(1, Decimal.ROUND_HALF_UP);
      let actual: string = r1.toString();
      let expected: string = '8';
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = '8';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_2000
     * @tc.name decimalToSignificantDigitsPart03Test020
     * @tc.desc Verify toSignificantDigits(3) on new Decimal("120.5") returns 121
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("120.5");
      let r1: Decimal = d.toSignificantDigits(3);
      let r2: Decimal = d.toSignificantDigits(3, Decimal.ROUND_HALF_UP);
      let actual: string = r1.toString();
      let expected: string = "121";
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = "121";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_2100
     * @tc.name decimalToSignificantDigitsPart03Test021
     * @tc.desc Verify toSignificantDigits(1) on new Decimal("9.5000") returns 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("9.5000");
      let r1: Decimal = d.toSignificantDigits(1);
      let r2: Decimal = d.toSignificantDigits(1, Decimal.ROUND_HALF_DOWN);
      let actual: string = r1.toString();
      let expected: string = "10";
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = '9';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_2200
     * @tc.name decimalToSignificantDigitsPart03Test022
     * @tc.desc Verify toSignificantDigits(3) on new Decimal("7.4500") returns 7.45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("7.4500");
      let r1: Decimal = d.toSignificantDigits(3);
      expect(r1.toNumber()).assertEqual(7.45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_2300
     * @tc.name decimalToSignificantDigitsPart03Test023
     * @tc.desc Verify toSignificantDigits(2) on new Decimal("2.9500") returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("2.9500");
      let r1: Decimal = d.toSignificantDigits(2);
      expect(r1.toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_2400
     * @tc.name decimalToSignificantDigitsPart03Test024
     * @tc.desc Verify toSignificantDigits(1) on new Decimal("-8.5") returns -9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("-8.5");
      let r1: Decimal = d.toSignificantDigits(1);
      let r2: Decimal = d.toSignificantDigits(1, Decimal.ROUND_HALF_UP);
      let actual: string = r1.toString();
      let expected: string = "-9";
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = "-9";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_2500
     * @tc.name decimalToSignificantDigitsPart03Test025
     * @tc.desc Verify toSignificantDigits(2) on new Decimal('0') returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('0');
      let r1: Decimal = d.toSignificantDigits(2);
      let r2: Decimal = d.toSignificantDigits(2, Decimal.ROUND_HALF_UP);
      let actual: string = r1.toString();
      let expected: string = '0';
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = '0';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_2600
     * @tc.name decimalToSignificantDigitsPart03Test026
     * @tc.desc Verify toSignificantDigits(2) on new Decimal("-1.2500") returns -1.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("-1.2500");
      let r1: Decimal = d.toSignificantDigits(2);
      let r2: Decimal = d.toSignificantDigits(2, Decimal.ROUND_HALF_CEILING);
      let actual: string = r1.toString();
      let expected: string = "-1.3";
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = "-1.2";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_2700
     * @tc.name decimalToSignificantDigitsPart03Test027
     * @tc.desc Verify toSignificantDigits(2) on new Decimal("12.345") has exponent e equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("12.345");
      let r1: Decimal = d.toSignificantDigits(2);
      expect(r1.e).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_2800
     * @tc.name decimalToSignificantDigitsPart03Test028
     * @tc.desc Verify toSignificantDigits(2) on new Decimal("-12.345") has sign s equals -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("-12.345");
      let r1: Decimal = d.toSignificantDigits(2);
      expect(r1.s).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_2900
     * @tc.name decimalToSignificantDigitsPart03Test029
     * @tc.desc Verify toSignificantDigits(4) on new Decimal("123.456") returns 123.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("123.456");
      let r1: Decimal = d.toSignificantDigits(4);
      let r2: Decimal = d.toSignificantDigits(4, Decimal.ROUND_HALF_UP);
      let actual: number = r1.comparedTo(new Decimal("123.5"));
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = r2.comparedTo(new Decimal("123.5"));
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_3000
     * @tc.name decimalToSignificantDigitsPart03Test030
     * @tc.desc Verify toSignificantDigits(2) on new Decimal("0.00123") returns -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("0.00123");
      let r1: Decimal = d.toSignificantDigits(2);
      let r2: Decimal = d.toSignificantDigits(2, Decimal.ROUND_HALF_UP);
      let actual: number = r1.e;
      let expected: int = -3;
      expect(actual).assertEqual(expected);
      let actual2: number = r2.e;
      let expected2: int = -3;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_3100
     * @tc.name decimalToSignificantDigitsPart03Test031
     * @tc.desc Verify toSignificantDigits(1) on new Decimal("987") returns 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("987");
      let r: Decimal = d.toSignificantDigits(1);
      let actual: string = r.toString();
      let expected: string = "1000";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_3200
     * @tc.name decimalToSignificantDigitsPart03Test032
     * @tc.desc Verify toSignificantDigits(1, Decimal.ROUND_DOWN) on new Decimal("987") returns 900
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("987");
      let r: Decimal = d.toSignificantDigits(1, Decimal.ROUND_DOWN);
      let actual: string = r.toString();
      let expected: string = "900";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_3300
     * @tc.name decimalToSignificantDigitsPart03Test033
     * @tc.desc Verify toSignificantDigits(2) on new Decimal("0.0001234") returns 0.00012
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("0.0001234");
      let r1: Decimal = d.toSignificantDigits(2);
      let r2: Decimal = d.toSignificantDigits(2, Decimal.ROUND_HALF_UP);
      let actual: string = r1.toString();
      let expected: string = "0.00012";
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = "0.00012";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_3400
     * @tc.name decimalToSignificantDigitsPart03Test034
     * @tc.desc Verify toSignificantDigits(3) on new Decimal("5.6789") returns 5.68
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("5.6789");
      let r1: Decimal = d.toSignificantDigits(3);
      expect(r1.toString()).assertEqual("5.68");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_3500
     * @tc.name decimalToSignificantDigitsPart03Test035
     * @tc.desc Verify toSignificantDigits(2) on new Decimal("-9.9") has sign -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("-9.9");
      let r1: Decimal = d.toSignificantDigits(2);
      expect(Decimal.sign(r1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_3600
     * @tc.name decimalToSignificantDigitsPart03Test036
     * @tc.desc Verify toSignificantDigits(1000) on new Decimal("1.2345") returns 1.2345
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.2345");
      let r1: Decimal = d.toSignificantDigits(1000);
      let r2: Decimal = d.toSignificantDigits(1000, Decimal.ROUND_HALF_UP);
      let actual: string = r1.toString();
      let expected: string = "1.2345";
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = "1.2345";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_3700
     * @tc.name decimalToSignificantDigitsPart03Test037
     * @tc.desc Verify the sign field (s) of toSignificantDigits(2) result on new Decimal("0.12345") equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("0.12345");
      let r: Decimal = d.toSignificantDigits(2);
      let actual: number = r.s;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_3800
     * @tc.name decimalToSignificantDigitsPart03Test038
     * @tc.desc Verify the exponent field (e) of toSignificantDigits(2) result on new Decimal("12.345") equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("12.345");
      let r: Decimal = d.toSignificantDigits(2);
      let actual: number = r.e;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_3900
     * @tc.name decimalToSignificantDigitsPart03Test039
     * @tc.desc Verify toSignificantDigits(2) on new Decimal("3.4567") returns 3.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("3.4567");
      let r1: Decimal = d.toSignificantDigits(2);
      let r2: Decimal = d.toSignificantDigits(2, Decimal.ROUND_HALF_UP);
      let actual: number = r1.toNumber();
      let expected: number = 3.5;
      expect(actual).assertEqual(expected);
      let actual2: number = r2.toNumber();
      let expected2: number = 3.5;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_4000
     * @tc.name decimalToSignificantDigitsPart03Test040
     * @tc.desc Verify toSignificantDigits(3) on new Decimal("12345000000") returns 12300000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("12345000000");
      let r1: Decimal = d.toSignificantDigits(3);
      let r2: Decimal = d.toSignificantDigits(3, Decimal.ROUND_DOWN);
      let actual: string = r1.toString();
      let expected: string = "12300000000";
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = "12300000000";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_4100
     * @tc.name decimalToSignificantDigitsPart03Test041
     * @tc.desc Verify toSignificantDigits(0) on new Decimal("1.2345") throws BusinessError and d remains 1.2345
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.2345");
      try {
        d.toSignificantDigits(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
      let actual: string = d.toString();
      let expected: string = "1.2345";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_4200
     * @tc.name decimalToSignificantDigitsPart03Test042
     * @tc.desc Verify toSignificantDigits(-1) on new Decimal("-12.345") throws BusinessError and d unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("-12.345");
      try {
        d.toSignificantDigits(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
      let actual: number = d.e;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let actual2: number = d.s;
      let expected2: int = -1;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_4300
     * @tc.name decimalToSignificantDigitsPart03Test043
     * @tc.desc Verify toSignificantDigits(3, -1) on new Decimal("2.3456") throws BusinessError and d remains 2.3456
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("2.3456");
      try {
        d.toSignificantDigits(3, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
      let actual: string = d.toString();
      let expected: string = "2.3456";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_4400
     * @tc.name decimalToSignificantDigitsPart03Test044
     * @tc.desc Verify toSignificantDigits(2, 9) on new Decimal("4.5678") throws BusinessError and d remains 4.5678
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("4.5678");
      try {
        d.toSignificantDigits(2, 9);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
      let actual: string = d.toString();
      let expected: string = "4.5678";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_4500
     * @tc.name decimalToSignificantDigitsPart03Test045
     * @tc.desc Verify toSignificantDigits(1.5) on new Decimal("6.789") throws BusinessError and d unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("6.789");
      try {
        d.toSignificantDigits(1.5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
      let actual: number = d.e;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_4600
     * @tc.name decimalToSignificantDigitsPart03Test046
     * @tc.desc Verify toSignificantDigits(1000000001) on new Decimal("3.3333") throws BusinessError and d remains 3.3333
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("3.3333");
      try {
        d.toSignificantDigits(1000000001);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
      let actual: string = d.toString();
      let expected: string = "3.3333";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_4700
     * @tc.name decimalToSignificantDigitsPart03Test047
     * @tc.desc Verify toSignificantDigits(0) on new Decimal("1.2345") throws BusinessError and d still usable via add(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.2345");
      try {
        d.toSignificantDigits(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
      let actual: string = d.add(1).toString();
      let expected: string = "2.2345";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_4800
     * @tc.name decimalToSignificantDigitsPart03Test048
     * @tc.desc Verify toSignificantDigits(2, -1) on new Decimal("1.2345") throws BusinessError and d unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.2345");
      try {
        d.toSignificantDigits(2, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
      let actual: boolean = d.equals(new Decimal("1.2345"));
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_4900
     * @tc.name decimalToSignificantDigitsPart03Test049
     * @tc.desc Verify toSignificantDigits(0) and toSignificantDigits(3, -1) on new Decimal("7.7777") throw BusinessError and d remains 7.7777
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("7.7777");
      try {
        d.toSignificantDigits(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
      try {
        d.toSignificantDigits(3, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
      let actual: string = d.toString();
      let expected: string = "7.7777";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_5000
     * @tc.name decimalToSignificantDigitsPart03Test050
     * @tc.desc Verify toSignificantDigits(2, 99) on new Decimal("5.5678") throws BusinessError and later toSignificantDigits(2) returns 5.6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("5.5678");
      try {
        d.toSignificantDigits(2, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
      let actual: string = d.toSignificantDigits(2).toString();
      let expected: string = "5.6";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_5100
     * @tc.name decimalToSignificantDigitsPart03Test051
     * @tc.desc Verify toSignificantDigits(-2) on new Decimal("0.12345") throws BusinessError and d unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("0.12345");
      try {
        d.toSignificantDigits(-2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
      let actual: boolean = d.equals(new Decimal("0.12345"));
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_5200
     * @tc.name decimalToSignificantDigitsPart03Test052
     * @tc.desc Verify toSignificantDigits(Double.NaN) on new Decimal("-5.4321") throws BusinessError and d unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("-5.4321");
      try {
        d.toSignificantDigits(Double.NaN);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
      let actual: number = d.s;
      let expected: int = -1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_5300
     * @tc.name decimalToSignificantDigitsPart03Test053
     * @tc.desc Verify toSignificantDigits(4, -5) throws and d remains 8.8888
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("8.8888");
      try {
        d.toSignificantDigits(4, -5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
      let actual: string = d.toString();
      let expected: string = "8.8888";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_5400
     * @tc.name decimalToSignificantDigitsPart03Test054
     * @tc.desc Verify toSignificantDigits(3, 9) on new Decimal("0.00123") throws BusinessError and d unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("0.00123");
      try {
        d.toSignificantDigits(3, 9);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
      let actual: number = d.e;
      let expected: int = -3;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_5500
     * @tc.name decimalToSignificantDigitsPart03Test055
     * @tc.desc Verify toSignificantDigits(2) on new Decimal("1.2345") returns 1.2 and d remains 1.2345
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.2345");
      let r: Decimal = d.toSignificantDigits(2);
      let actual: string = d.toString();
      let expected: string = "1.2345";
      expect(actual).assertEqual(expected);
      let actual2: string = r.toString();
      let expected2: string = "1.2";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_5600
     * @tc.name decimalToSignificantDigitsPart03Test056
     * @tc.desc Verify chained toSignificantDigits(4).toSignificantDigits(2) on new Decimal("1.2345") returns 1.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.2345");
      let r: Decimal = d.toSignificantDigits(4).toSignificantDigits(2);
      let actual: string = r.toString();
      let expected: string = "1.2";
      expect(actual).assertEqual(expected);
      let actual2: string = d.toString();
      let expected2: string = "1.2345";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_5700
     * @tc.name decimalToSignificantDigitsPart03Test057
     * @tc.desc Verify toSignificantDigits(3) on new Decimal("9.8765") returns 9.88
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("9.8765");
      let r1: Decimal = d.toSignificantDigits(3);
      let actual: string = r1.toString();
      let expected: string = "9.88";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_5800
     * @tc.name decimalToSignificantDigitsPart03Test058
     * @tc.desc Verify toSignificantDigits(6) on new Decimal("1.2345") returns r.equals(d) is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.2345");
      let r: Decimal = d.toSignificantDigits(6);
      let actual: boolean = r.equals(d);
      expect(actual).assertTrue();
      expect(r.toString()).assertEqual("1.2345");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_5900
     * @tc.name decimalToSignificantDigitsPart03Test059
     * @tc.desc Verify toSignificantDigits(2) on new Decimal("1.2500") returns 1.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let d: Decimal = new Decimal("1.2500");
      let r: Decimal = d.toSignificantDigits(2);
      Decimal.set({ defaults: true });
      let actual: string = r.toString();
      let expected: string = "1.2";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_6000
     * @tc.name decimalToSignificantDigitsPart03Test060
     * @tc.desc Verify toSignificantDigits(2, Decimal.ROUND_HALF_UP) on new Decimal("1.2500") returns 1.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let d: Decimal = new Decimal("1.2500");
      let r: Decimal = d.toSignificantDigits(2, Decimal.ROUND_HALF_UP);
      Decimal.set({ defaults: true });
      let actual: string = r.toString();
      let expected: string = "1.3";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_6100
     * @tc.name decimalToSignificantDigitsPart03Test061
     * @tc.desc Verify toSignificantDigits(2) on new Decimal("1.2500") returns 1.3 and d2 remains 1.25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Decimal = new Decimal("1.2500");
      let d2: Decimal = new Decimal("1.2500");
      let r1: Decimal = d1.toSignificantDigits(2);
      let actual: string = r1.toString();
      let expected: string = "1.3";
      expect(actual).assertEqual(expected);
      let actual2: string = d2.toString();
      let expected2: string = "1.25";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_6200
     * @tc.name decimalToSignificantDigitsPart03Test062
     * @tc.desc Verify chained toSignificantDigits(3).toSignificantDigits(1) on new Decimal("2.3456") returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("2.3456");
      let mid: Decimal = d.toSignificantDigits(3);
      let fin: Decimal = mid.toSignificantDigits(1);
      let actual: string = fin.toString();
      let expected: string = '2';
      expect(actual).assertEqual(expected);
      let actual2: string = mid.toString();
      let expected2: string = "2.35";
      expect(actual2).assertEqual(expected2);
      let actual3: string = d.toString();
      let expected3: string = "2.3456";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_6300
     * @tc.name decimalToSignificantDigitsPart03Test063
     * @tc.desc Verify chained toSignificantDigits(4).toSignificantDigits(2) on new Decimal("3.3333") returns chain.equals(single) is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("3.3333");
      let chain: Decimal = d.toSignificantDigits(4).toSignificantDigits(2);
      let single: Decimal = d.toSignificantDigits(2);
      let actual: boolean = chain.equals(single);
      expect(actual).assertTrue();
      expect(chain.toString()).assertEqual("3.3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_6400
     * @tc.name decimalToSignificantDigitsPart03Test064
     * @tc.desc Verify toSignificantDigits(2) on new Decimal("1.2345") returns 1.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.2345");
      let r: Decimal = d.toSignificantDigits(2);
      let d2: Decimal = d.add(1);
      let actual: string = r.toString();
      let expected: string = "1.2";
      expect(actual).assertEqual(expected);
      let actual2: string = d2.toString();
      let expected2: string = "2.2345";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_6500
     * @tc.name decimalToSignificantDigitsPart03Test065
     * @tc.desc Verify toSignificantDigits(2) on new Decimal("6.6666") returns 6.7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("6.6666");
      let r1: Decimal = d.toSignificantDigits(2);
      let r2: Decimal = d.toSignificantDigits(2, Decimal.ROUND_DOWN);
      let actual: string = r1.toString();
      let expected: string = "6.7";
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = "6.6";
      expect(actual2).assertEqual(expected2);
      let actual3: string = d.toString();
      let expected3: string = "6.6666";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_6600
     * @tc.name decimalToSignificantDigitsPart03Test066
     * @tc.desc Verify toSignificantDigits(2) on new Decimal("-0") returns r1.isZero() and r2.isZero() are true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("-0");
      let r1: Decimal = d.toSignificantDigits(2);
      let r2: Decimal = d.toSignificantDigits(2, Decimal.ROUND_DOWN);
      let actual: boolean = r1.isZero();
      expect(actual).assertTrue();
      let actual2: boolean = r2.isZero();
      expect(actual2).assertTrue();
      expect(r1.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_6700
     * @tc.name decimalToSignificantDigitsPart03Test067
     * @tc.desc Verify toSignificantDigits(2) on new Decimal("8.7654") returns 8.8 and d remains 8.7654
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("8.7654");
      let r: Decimal = d.toSignificantDigits(2);
      let actual: string = d.toString();
      let expected: string = "8.7654";
      expect(actual).assertEqual(expected);
      let actual2: string = r.toString();
      let expected2: string = "8.8";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_6800
     * @tc.name decimalToSignificantDigitsPart03Test068
     * @tc.desc Verify toSignificantDigits(2) on new Decimal("-1.2500") returns -1.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_CEILING });
      let d: Decimal = new Decimal("-1.2500");
      let r: Decimal = d.toSignificantDigits(2);
      Decimal.set({ defaults: true });
      let actual: string = r.toString();
      let expected: string = "-1.2";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART03_6900
     * @tc.name decimalToSignificantDigitsPart03Test069
     * @tc.desc Verify toSignificantDigits(2, Decimal.ROUND_FLOOR) on new Decimal("-1.2500") returns -1.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart03Test069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_CEILING });
      let d: Decimal = new Decimal("-1.2500");
      let r: Decimal = d.toSignificantDigits(2, Decimal.ROUND_FLOOR);
      Decimal.set({ defaults: true });
      let actual: string = r.toString();
      let expected: string = "-1.3";
      expect(actual).assertEqual(expected);
    });
  });
}
