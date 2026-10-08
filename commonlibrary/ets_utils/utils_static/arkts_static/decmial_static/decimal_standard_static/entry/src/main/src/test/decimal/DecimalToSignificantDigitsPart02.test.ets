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
import { BusinessError } from "@ohos.base";

export default function decimalToSignificantDigitsPart02Test(): void {
  describe("DecimalToSignificantDigitsPart02Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_0100
     * @tc.name decimalToSignificantDigitsPart02Test001
     * @tc.desc Verify toSignificantDigits(sd, rm) on new Decimal("2.345") returns 2.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sd: double = 2;
      const rm: int = Decimal.ROUND_DOWN;
      const r: Decimal = new Decimal("2.345").toSignificantDigits(sd, rm);
      let actual: string = r.toString();
      let expected: string = "2.3";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_0200
     * @tc.name decimalToSignificantDigitsPart02Test002
     * @tc.desc Verify toSignificantDigits(1, Decimal.ROUND_UP) on new Decimal("500") returns 500
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("500").toSignificantDigits(1, Decimal.ROUND_UP);
      let actual: string = r.toString();
      let expected: string = "500";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_0300
     * @tc.name decimalToSignificantDigitsPart02Test003
     * @tc.desc Verify toSignificantDigits(1, Decimal.ROUND_HALF_UP) on new Decimal("0.0009999") returns 0.001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("0.0009999").toSignificantDigits(1, Decimal.ROUND_HALF_UP);
      let actual: string = r.toString();
      let expected: string = "0.001";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_0400
     * @tc.name decimalToSignificantDigitsPart02Test004
     * @tc.desc Verify toSignificantDigits(1, Decimal.ROUND_UP) on new Decimal("0.45") returns 0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("0.45").toSignificantDigits(1, Decimal.ROUND_UP);
      let actual: string = r.toString();
      let expected: string = "0.5";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_0500
     * @tc.name decimalToSignificantDigitsPart02Test005
     * @tc.desc Verify toSignificantDigits(1, Decimal.ROUND_DOWN) on new Decimal("0.45") returns 0.4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("0.45").toSignificantDigits(1, Decimal.ROUND_DOWN);
      let actual: string = r.toString();
      let expected: string = "0.4";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_0600
     * @tc.name decimalToSignificantDigitsPart02Test006
     * @tc.desc Verify toSignificantDigits(2, Decimal.ROUND_HALF_UP) on new Decimal("1.999") returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.999").toSignificantDigits(2, Decimal.ROUND_HALF_UP);
      expect(r.toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_0700
     * @tc.name decimalToSignificantDigitsPart02Test007
     * @tc.desc Verify toSignificantDigits(2, Decimal.ROUND_HALF_UP) on new Decimal("0.0004567") returns 0.00046
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("0.0004567").toSignificantDigits(2, Decimal.ROUND_HALF_UP);
      let actual: string = r.toString();
      let expected: string = "0.00046";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_0800
     * @tc.name decimalToSignificantDigitsPart02Test008
     * @tc.desc Verify toSignificantDigits(3, Decimal.ROUND_HALF_UP) on new Decimal("0.00012345") returns 0.000123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("0.00012345").toSignificantDigits(3, Decimal.ROUND_HALF_UP);
      let actual: string = r.toString();
      let expected: string = "0.000123";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_0900
     * @tc.name decimalToSignificantDigitsPart02Test009
     * @tc.desc Verify toSignificantDigits(3, Decimal.ROUND_UP) on new Decimal("1.2345") returns 1.24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.2345").toSignificantDigits(3, Decimal.ROUND_UP);
      let actual: string = r.toString();
      let expected: string = "1.24";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_1000
     * @tc.name decimalToSignificantDigitsPart02Test010
     * @tc.desc Verify toSignificantDigits(3, Decimal.ROUND_HALF_UP) on new Decimal("9.995") returns 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("9.995").toSignificantDigits(3, Decimal.ROUND_HALF_UP);
      expect(r.toString()).assertEqual("10");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_1100
     * @tc.name decimalToSignificantDigitsPart02Test011
     * @tc.desc Verify toSignificantDigits(10, Decimal.ROUND_HALF_UP) on new Decimal("1.234567890123456789") returns 1.23456789
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.234567890123456789").toSignificantDigits(10, Decimal.ROUND_HALF_UP);
      expect(r.toString()).assertEqual("1.23456789");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_1200
     * @tc.name decimalToSignificantDigitsPart02Test012
     * @tc.desc Verify toSignificantDigits(20, Decimal.ROUND_DOWN) on new Decimal("1.123456789012345678901") returns 1.1234567890123456789
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.123456789012345678901").toSignificantDigits(20, Decimal.ROUND_DOWN);
      expect(r.toString()).assertEqual("1.1234567890123456789");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_1300
     * @tc.name decimalToSignificantDigitsPart02Test013
     * @tc.desc Verify toSignificantDigits(1000, Decimal.ROUND_UP) on new Decimal("3.14159") returns 3.14159
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("3.14159").toSignificantDigits(1000, Decimal.ROUND_UP);
      let actual: string = r.toString();
      let expected: string = "3.14159";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_1400
     * @tc.name decimalToSignificantDigitsPart02Test014
     * @tc.desc Verify toSignificantDigits(5, Decimal.ROUND_DOWN) on new Decimal("1234567890123456789012345") returns 1234500000000000000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1234567890123456789012345").toSignificantDigits(5, Decimal.ROUND_DOWN);
      let actual: number = r.comparedTo("1234500000000000000000000");
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_1500
     * @tc.name decimalToSignificantDigitsPart02Test015
     * @tc.desc Verify toSignificantDigits(5, Decimal.ROUND_UP) on new Decimal("1234567890123456789012345") returns 1234600000000000000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1234567890123456789012345").toSignificantDigits(5, Decimal.ROUND_UP);
      let actual: number = r.comparedTo("1234600000000000000000000");
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_1600
     * @tc.name decimalToSignificantDigitsPart02Test016
     * @tc.desc Verify toSignificantDigits(2, Decimal.ROUND_HALF_UP) on new Decimal("999.95") returns 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("999.95").toSignificantDigits(2, Decimal.ROUND_HALF_UP);
      expect(r.toString()).assertEqual("1000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_1700
     * @tc.name decimalToSignificantDigitsPart02Test017
     * @tc.desc Verify toSignificantDigits(3, Decimal.ROUND_DOWN) on new Decimal("0.0009999") returns 0.000999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("0.0009999").toSignificantDigits(3, Decimal.ROUND_DOWN);
      let actual: string = r.toString();
      let expected: string = "0.000999";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_1800
     * @tc.name decimalToSignificantDigitsPart02Test018
     * @tc.desc Verify toSignificantDigits(6, Decimal.ROUND_HALF_UP) on new Decimal("0.1234567") returns 0.123457
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("0.1234567").toSignificantDigits(6, Decimal.ROUND_HALF_UP);
      let actual: string = r.toString();
      let expected: string = "0.123457";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_1900
     * @tc.name decimalToSignificantDigitsPart02Test019
     * @tc.desc Verify toSignificantDigits(1000, Decimal.ROUND_DOWN) on new Decimal("123456.789") returns 123456.789
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("123456.789").toSignificantDigits(1000, Decimal.ROUND_DOWN);
      let actual: string = r.toString();
      let expected: string = "123456.789";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_2000
     * @tc.name decimalToSignificantDigitsPart02Test020
     * @tc.desc Verify toSignificantDigits(3, Decimal.ROUND_UP) on new Decimal("2.345") returns 2.35
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("2.345").toSignificantDigits(3, Decimal.ROUND_UP);
      let actual: string = r.toString();
      let expected: string = "2.35";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_2100
     * @tc.name decimalToSignificantDigitsPart02Test021
     * @tc.desc Verify toSignificantDigits(3, Decimal.ROUND_DOWN) on new Decimal("2.345") returns 2.34
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("2.345").toSignificantDigits(3, Decimal.ROUND_DOWN);
      let actual: string = r.toString();
      let expected: string = "2.34";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_2200
     * @tc.name decimalToSignificantDigitsPart02Test022
     * @tc.desc Verify toSignificantDigits(3, Decimal.ROUND_CEILING) on new Decimal("2.345") returns 2.35
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("2.345").toSignificantDigits(3, Decimal.ROUND_CEILING);
      let actual: string = r.toString();
      let expected: string = "2.35";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_2300
     * @tc.name decimalToSignificantDigitsPart02Test023
     * @tc.desc Verify toSignificantDigits(3, Decimal.ROUND_FLOOR) on new Decimal("2.345") returns 2.34
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("2.345").toSignificantDigits(3, Decimal.ROUND_FLOOR);
      let actual: string = r.toString();
      let expected: string = "2.34";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_2400
     * @tc.name decimalToSignificantDigitsPart02Test024
     * @tc.desc Verify toSignificantDigits(3, Decimal.ROUND_HALF_UP) on new Decimal("2.345") returns 2.35
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("2.345").toSignificantDigits(3, Decimal.ROUND_HALF_UP);
      let actual: string = r.toString();
      let expected: string = "2.35";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_2500
     * @tc.name decimalToSignificantDigitsPart02Test025
     * @tc.desc Verify toSignificantDigits(3, Decimal.ROUND_HALF_DOWN) on new Decimal("2.345") returns 2.34
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("2.345").toSignificantDigits(3, Decimal.ROUND_HALF_DOWN);
      let actual: string = r.toString();
      let expected: string = "2.34";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_2600
     * @tc.name decimalToSignificantDigitsPart02Test026
     * @tc.desc Verify toSignificantDigits(3, Decimal.ROUND_HALF_EVEN) on new Decimal("2.345") returns 2.34
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("2.345").toSignificantDigits(3, Decimal.ROUND_HALF_EVEN);
      let actual: string = r.toString();
      let expected: string = "2.34";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_2700
     * @tc.name decimalToSignificantDigitsPart02Test027
     * @tc.desc Verify toSignificantDigits(3, Decimal.ROUND_HALF_CEILING) on new Decimal("2.345") returns 2.35
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("2.345").toSignificantDigits(3, Decimal.ROUND_HALF_CEILING);
      let actual: string = r.toString();
      let expected: string = "2.35";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_2800
     * @tc.name decimalToSignificantDigitsPart02Test028
     * @tc.desc Verify toSignificantDigits(3, Decimal.ROUND_HALF_FLOOR) on new Decimal("2.345") returns 2.34
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("2.345").toSignificantDigits(3, Decimal.ROUND_HALF_FLOOR);
      let actual: string = r.toString();
      let expected: string = "2.34";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_2900
     * @tc.name decimalToSignificantDigitsPart02Test029
     * @tc.desc Verify toSignificantDigits(3, Decimal.ROUND_UP) on new Decimal("-2.345") returns -2.35
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("-2.345").toSignificantDigits(3, Decimal.ROUND_UP);
      let actual: string = r.toString();
      let expected: string = "-2.35";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_3000
     * @tc.name decimalToSignificantDigitsPart02Test030
     * @tc.desc Verify toSignificantDigits(3, Decimal.ROUND_DOWN) on new Decimal("-2.345") returns -2.34
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("-2.345").toSignificantDigits(3, Decimal.ROUND_DOWN);
      let actual: string = r.toString();
      let expected: string = "-2.34";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_3100
     * @tc.name decimalToSignificantDigitsPart02Test031
     * @tc.desc Verify toSignificantDigits(3, Decimal.ROUND_CEILING) on new Decimal("-2.345") returns -2.34
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("-2.345").toSignificantDigits(3, Decimal.ROUND_CEILING);
      let actual: string = r.toString();
      let expected: string = "-2.34";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_3200
     * @tc.name decimalToSignificantDigitsPart02Test032
     * @tc.desc Verify toSignificantDigits(3, Decimal.ROUND_FLOOR) on new Decimal("-2.345") returns -2.35
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("-2.345").toSignificantDigits(3, Decimal.ROUND_FLOOR);
      let actual: string = r.toString();
      let expected: string = "-2.35";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_3300
     * @tc.name decimalToSignificantDigitsPart02Test033
     * @tc.desc Verify toSignificantDigits(2, Decimal.ROUND_HALF_UP) on new Decimal("1.05") returns 1.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.05").toSignificantDigits(2, Decimal.ROUND_HALF_UP);
      let actual: string = r.toString();
      let expected: string = "1.1";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_3400
     * @tc.name decimalToSignificantDigitsPart02Test034
     * @tc.desc Verify toSignificantDigits(2, Decimal.ROUND_HALF_DOWN) on new Decimal("1.05") returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.05").toSignificantDigits(2, Decimal.ROUND_HALF_DOWN);
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_3500
     * @tc.name decimalToSignificantDigitsPart02Test035
     * @tc.desc Verify toSignificantDigits(2, Decimal.ROUND_HALF_EVEN) on new Decimal("1.05") returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.05").toSignificantDigits(2, Decimal.ROUND_HALF_EVEN);
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_3600
     * @tc.name decimalToSignificantDigitsPart02Test036
     * @tc.desc Verify toSignificantDigits(2, Decimal.ROUND_HALF_CEILING) on new Decimal("1.05") returns 1.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.05").toSignificantDigits(2, Decimal.ROUND_HALF_CEILING);
      let actual: string = r.toString();
      let expected: string = "1.1";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_3700
     * @tc.name decimalToSignificantDigitsPart02Test037
     * @tc.desc Verify toSignificantDigits(2, Decimal.ROUND_HALF_FLOOR) on new Decimal("1.05") returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.05").toSignificantDigits(2, Decimal.ROUND_HALF_FLOOR);
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_3800
     * @tc.name decimalToSignificantDigitsPart02Test038
     * @tc.desc Verify toSignificantDigits(2, Decimal.ROUND_HALF_UP) on new Decimal("1.15") returns 1.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.15").toSignificantDigits(2, Decimal.ROUND_HALF_UP);
      let actual: string = r.toString();
      let expected: string = "1.2";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_3900
     * @tc.name decimalToSignificantDigitsPart02Test039
     * @tc.desc Verify toSignificantDigits(2, Decimal.ROUND_HALF_DOWN) on new Decimal("1.15") returns 1.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.15").toSignificantDigits(2, Decimal.ROUND_HALF_DOWN);
      let actual: string = r.toString();
      let expected: string = "1.1";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_4000
     * @tc.name decimalToSignificantDigitsPart02Test040
     * @tc.desc Verify toSignificantDigits(2, Decimal.ROUND_HALF_EVEN) on new Decimal("1.15") returns 1.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.15").toSignificantDigits(2, Decimal.ROUND_HALF_EVEN);
      expect(r.toString()).assertEqual("1.2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_4100
     * @tc.name decimalToSignificantDigitsPart02Test041
     * @tc.desc Verify toSignificantDigits(3, Decimal.ROUND_HALF_UP) on new Decimal("-2.345") returns -2.35
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("-2.345").toSignificantDigits(3, Decimal.ROUND_HALF_UP);
      let actual: string = r.toString();
      let expected: string = "-2.35";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_4200
     * @tc.name decimalToSignificantDigitsPart02Test042
     * @tc.desc Verify toSignificantDigits(3, Decimal.ROUND_HALF_DOWN) on new Decimal("-2.345") returns -2.34
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("-2.345").toSignificantDigits(3, Decimal.ROUND_HALF_DOWN);
      let actual: string = r.toString();
      let expected: string = "-2.34";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_4300
     * @tc.name decimalToSignificantDigitsPart02Test043
     * @tc.desc Verify toSignificantDigits(3, Decimal.ROUND_HALF_EVEN) on new Decimal("-2.345") returns -2.34
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("-2.345").toSignificantDigits(3, Decimal.ROUND_HALF_EVEN);
      let actual: string = r.toString();
      let expected: string = "-2.34";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_4400
     * @tc.name decimalToSignificantDigitsPart02Test044
     * @tc.desc Verify toSignificantDigits(2, Decimal.ROUND_DOWN) on new Decimal("007.6") returns 7.6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("007.6").toSignificantDigits(2, Decimal.ROUND_DOWN);
      let actual: string = r.toString();
      let expected: string = "7.6";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_4500
     * @tc.name decimalToSignificantDigitsPart02Test045
     * @tc.desc Verify toSignificantDigits(2, Decimal.ROUND_UP) on new Decimal("1e5") returns 100000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1e5").toSignificantDigits(2, Decimal.ROUND_UP);
      let actual: string = r.toString();
      let expected: string = "100000";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_4600
     * @tc.name decimalToSignificantDigitsPart02Test046
     * @tc.desc Verify toSignificantDigits(3, Decimal.ROUND_UP) on new Decimal("1.23e-4") returns 0.000123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.23e-4").toSignificantDigits(3, Decimal.ROUND_UP);
      let actual: string = r.toString();
      let expected: string = "0.000123";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_4700
     * @tc.name decimalToSignificantDigitsPart02Test047
     * @tc.desc Verify toSignificantDigits(5, Decimal.ROUND_DOWN) on new Decimal("Infinity") returns "Infinity"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("Infinity").toSignificantDigits(5, Decimal.ROUND_DOWN);
      let actual: string = r.toString();
      let expected: string = "Infinity";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_4800
     * @tc.name decimalToSignificantDigitsPart02Test048
     * @tc.desc Verify toSignificantDigits(5, Decimal.ROUND_DOWN) on new Decimal("NaN") returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("NaN").toSignificantDigits(5, Decimal.ROUND_DOWN);
      let actual: boolean = r.isNaN();
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_4900
     * @tc.name decimalToSignificantDigitsPart02Test049
     * @tc.desc Verify toSignificantDigits(1, Decimal.ROUND_HALF_UP) on new Decimal("999999999999") returns 1000000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("999999999999").toSignificantDigits(1, Decimal.ROUND_HALF_UP);
      let actual: string = r.toString();
      let expected: string = "1000000000000";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_5000
     * @tc.name decimalToSignificantDigitsPart02Test050
     * @tc.desc Verify toSignificantDigits(3, Decimal.ROUND_HALF_UP) on new Decimal("1.2345") returns a new Decimal instance (different reference)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("1.2345");
      const r: Decimal = d.toSignificantDigits(3, Decimal.ROUND_HALF_UP);
      expect(r).not().assertEqual(d);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_5100
     * @tc.name decimalToSignificantDigitsPart02Test051
     * @tc.desc Verify toSignificantDigits(3, Decimal.ROUND_HALF_UP) on new Decimal("1.2345") returns a new Decimal instance on each call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("1.2345");
      const r1: Decimal = d.toSignificantDigits(3, Decimal.ROUND_HALF_UP);
      const r2: Decimal = d.toSignificantDigits(3, Decimal.ROUND_HALF_UP);
      expect(r1).not().assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_5200
     * @tc.name decimalToSignificantDigitsPart02Test052
     * @tc.desc Verify toSignificantDigits(...).toSignificantDigits(...)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.2345")
        .toSignificantDigits(3, Decimal.ROUND_UP)
        .toSignificantDigits(2, Decimal.ROUND_DOWN);
      let actual: string = r.toString();
      let expected: string = "1.2";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_5300
     * @tc.name decimalToSignificantDigitsPart02Test053
     * @tc.desc Verify new Decimal("2.345").toSignificantDigits(2, Decimal.ROUND_HALF_UP).add("0.05") returns 2.35
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("2.345").toSignificantDigits(2, Decimal.ROUND_HALF_UP).add("0.05");
      expect(r.toString()).assertEqual("2.35");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_5400
     * @tc.name decimalToSignificantDigitsPart02Test054
     * @tc.desc Verify toSignificantDigits(3, -1) on new Decimal("2.345") throws BusinessError code 10200001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal("2.345").toSignificantDigits(3, -1);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_SIGNIFICANT_DIGITS_PART02_5500
     * @tc.name decimalToSignificantDigitsPart02Test055
     * @tc.desc Verify toSignificantDigits(3, 9) on new Decimal("2.345") throws BusinessError code 10200001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToSignificantDigitsPart02Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal("2.345").toSignificantDigits(3, 9);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
      }
    });
  });
}