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

export default function decimalToDecimalDigitsPart03Test(): void {
  describe("DecimalToDecimalDigitsPart03Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_0100
     * @tc.name decimalToDecimalDigitsPart03Test001
     * @tc.desc Verify toDecimalPlaces(3) on new Decimal("1.23345") returns 1.233
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = new Decimal("1.23345").toDecimalPlaces(3);
      const r2: Decimal = new Decimal("1.23345").toDecimalPlaces(3, Decimal.ROUND_UP);
      let actual: string = r1.toString();
      let expected: string = "1.233";
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = "1.234";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_0200
     * @tc.name decimalToDecimalDigitsPart03Test002
     * @tc.desc Verify toDecimalPlaces(2) on new Decimal("4.225") returns 4.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = new Decimal("4.225").toDecimalPlaces(2);
      const r2: Decimal = new Decimal("4.225").toDecimalPlaces(2, Decimal.ROUND_DOWN);
      let actual: string = r1.toString();
      let expected: string = "4.23";
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = "4.22";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_0300
     * @tc.name decimalToDecimalDigitsPart03Test003
     * @tc.desc Verify toDecimalPlaces(0) on new Decimal(6.5) returns 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = new Decimal(6.5).toDecimalPlaces(0);
      const r2: Decimal = new Decimal(6.5).toDecimalPlaces(0, Decimal.ROUND_HALF_EVEN);
      let actual: string = r1.toString();
      let expected: string = '7';
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = '6';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_0400
     * @tc.name decimalToDecimalDigitsPart03Test004
     * @tc.desc Verify toDecimalPlaces(0) on new Decimal(-1.5) returns -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = new Decimal(-1.5).toDecimalPlaces(0);
      const r2: Decimal = new Decimal(-1.5).toDecimalPlaces(0, Decimal.ROUND_DOWN);
      let actual: string = r1.toString();
      let expected: string = "-2";
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = "-1";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_0500
     * @tc.name decimalToDecimalDigitsPart03Test005
     * @tc.desc Verify toDecimalPlaces(1) on new Decimal("3.15") returns 3.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = new Decimal("3.15").toDecimalPlaces(1);
      const r2: Decimal = new Decimal("3.15").toDecimalPlaces(1, Decimal.ROUND_HALF_DOWN);
      let actual: string = r1.toString();
      let expected: string = "3.2";
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = "3.1";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_0600
     * @tc.name decimalToDecimalDigitsPart03Test006
     * @tc.desc Verify toDecimalPlaces(0) on new Decimal(5.5) returns 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = new Decimal(5.5).toDecimalPlaces(0);
      const r2: Decimal = new Decimal(5.5).toDecimalPlaces(0, Decimal.ROUND_FLOOR);
      let actual: string = r1.toString();
      let expected: string = '6';
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = '5';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_0700
     * @tc.name decimalToDecimalDigitsPart03Test007
     * @tc.desc Verify toDecimalPlaces(2) on new Decimal("-3.775") returns -3.78
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = new Decimal("-3.775").toDecimalPlaces(2);
      const r2: Decimal = new Decimal("-3.775").toDecimalPlaces(2, Decimal.ROUND_CEILING);
      let actual: string = r1.toString();
      let expected: string = "-3.78";
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = "-3.77";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_0800
     * @tc.name decimalToDecimalDigitsPart03Test008
     * @tc.desc Verify toDecimalPlaces(3) on new Decimal("1.0005") returns 1.001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = new Decimal("1.0005").toDecimalPlaces(3);
      const r2: Decimal = new Decimal("1.0005").toDecimalPlaces(3, Decimal.ROUND_DOWN);
      let actual: string = r1.toString();
      let expected: string = "1.001";
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = '1';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_0900
     * @tc.name decimalToDecimalDigitsPart03Test009
     * @tc.desc Verify toDecimalPlaces(2) on new Decimal(9.999) returns 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = new Decimal(9.999).toDecimalPlaces(2);
      const r2: Decimal = new Decimal(9.999).toDecimalPlaces(2, Decimal.ROUND_DOWN);
      let actual: string = r1.toString();
      let expected: string = "10";
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = "9.99";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_1000
     * @tc.name decimalToDecimalDigitsPart03Test010
     * @tc.desc Verify toDecimalPlaces(2) on new Decimal(0.004) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = new Decimal(0.004).toDecimalPlaces(2);
      const r2: Decimal = new Decimal(0.004).toDecimalPlaces(2, Decimal.ROUND_UP);
      let actual: string = r1.toString();
      let expected: string = '0';
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = "0.01";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_1100
     * @tc.name decimalToDecimalDigitsPart03Test011
     * @tc.desc Verify toDecimalPlaces(0) on new Decimal(-2.5) returns -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = new Decimal(-2.5).toDecimalPlaces(0);
      const r2: Decimal = new Decimal(-2.5).toDecimalPlaces(0, Decimal.ROUND_HALF_EVEN);
      let actual: string = r1.toString();
      let expected: string = "-3";
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = "-2";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_1200
     * @tc.name decimalToDecimalDigitsPart03Test012
     * @tc.desc Verify toDecimalPlaces(10) on new Decimal("1.12345678905") returns 1.1234567891
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = new Decimal("1.12345678905").toDecimalPlaces(10);
      const r2: Decimal = new Decimal("1.12345678905").toDecimalPlaces(10, Decimal.ROUND_DOWN);
      let actual: string = r1.toString();
      let expected: string = "1.1234567891";
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = "1.123456789";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_1300
     * @tc.name decimalToDecimalDigitsPart03Test013
     * @tc.desc Verify toDecimalPlaces(1e9) on new Decimal("1.23345") returns 1.23345
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = new Decimal("1.23345").toDecimalPlaces(1e9);
      const r2: Decimal = new Decimal("1.23345").toDecimalPlaces(1e9, Decimal.ROUND_UP);
      let actual: string = r1.toString();
      let expected: string = "1.23345";
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = "1.23345";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_1400
     * @tc.name decimalToDecimalDigitsPart03Test014
     * @tc.desc Verify toDecimalPlaces(dp) on new Decimal("8.884") returns 8.88
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dp: double = 2;
      const r1: Decimal = new Decimal("8.884").toDecimalPlaces(dp);
      const r2: Decimal = new Decimal("8.884").toDecimalPlaces(dp, Decimal.ROUND_UP);
      let actual: string = r1.toString();
      let expected: string = "8.88";
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = "8.89";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_1500
     * @tc.name decimalToDecimalDigitsPart03Test015
     * @tc.desc Verify toDecimalPlaces(1) on new Decimal("-0.05") returns -0.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = new Decimal("-0.05").toDecimalPlaces(1);
      const r2: Decimal = new Decimal("-0.05").toDecimalPlaces(1, Decimal.ROUND_CEILING);
      let actual: string = r1.toString();
      let expected: string = "-0.1";
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = '0';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_1600
     * @tc.name decimalToDecimalDigitsPart03Test016
     * @tc.desc Verify toDecimalPlaces(2) on new Decimal("1.125") returns 1.13
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = new Decimal("1.125").toDecimalPlaces(2);
      const r2: Decimal = new Decimal("1.125").toDecimalPlaces(2, Decimal.ROUND_HALF_FLOOR);
      let actual: string = r1.toString();
      let expected: string = "1.13";
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = "1.12";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_1700
     * @tc.name decimalToDecimalDigitsPart03Test017
     * @tc.desc Verify toDecimalPlaces(1) on new Decimal("-0.35") returns -0.4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = new Decimal("-0.35").toDecimalPlaces(1);
      const r2: Decimal = new Decimal("-0.35").toDecimalPlaces(1, Decimal.ROUND_HALF_CEILING);
      let actual: string = r1.toString();
      let expected: string = "-0.4";
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = "-0.3";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_1800
     * @tc.name decimalToDecimalDigitsPart03Test018
     * @tc.desc Verify toDecimalPlaces(2) on new Decimal("2.675") returns 2.68
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = new Decimal("2.675").toDecimalPlaces(2);
      const r2: Decimal = new Decimal("2.675").toDecimalPlaces(2, Decimal.ROUND_HALF_DOWN);
      let actual: string = r1.toString();
      let expected: string = "2.68";
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = "2.67";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_1900
     * @tc.name decimalToDecimalDigitsPart03Test019
     * @tc.desc Verify toDecimalPlaces(2) on new Decimal("59.995") returns 60
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = new Decimal("59.995").toDecimalPlaces(2);
      const r2: Decimal = new Decimal("59.995").toDecimalPlaces(2, Decimal.ROUND_DOWN);
      let actual: string = r1.toString();
      let expected: string = "60";
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = "59.99";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_2000
     * @tc.name decimalToDecimalDigitsPart03Test020
     * @tc.desc Verify toDecimalPlaces(0) on new Decimal("1.9") returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = new Decimal("1.9").toDecimalPlaces(0);
      const r2: Decimal = new Decimal("1.9").toDecimalPlaces(0, Decimal.ROUND_DOWN);
      let actual: string = r1.toString();
      let expected: string = '2';
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = '1';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_2100
     * @tc.name decimalToDecimalDigitsPart03Test021
     * @tc.desc Verify toDecimalPlaces(1) on new Decimal("0.12345") returns 0.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = new Decimal("0.12345").toDecimalPlaces(1);
      const r2: Decimal = new Decimal("0.12345").toDecimalPlaces(1, Decimal.ROUND_UP);
      let actual: string = r1.toString();
      let expected: string = "0.1";
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = "0.2";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_2200
     * @tc.name decimalToDecimalDigitsPart03Test022
     * @tc.desc Verify toDecimalPlaces(2) on new Decimal("1.2345") returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = new Decimal("1.2345").toDecimalPlaces(2);
      const r2: Decimal = new Decimal("1.2345").toDecimalPlaces(2.0);
      let actual: string = r1.toString();
      let expected: string = "1.23";
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = "1.23";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_2300
     * @tc.name decimalToDecimalDigitsPart03Test023
     * @tc.desc Verify toDecimalPlaces(2) result equals toDecimalPlaces(2, 4) via comparedTo returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = new Decimal("1.2345").toDecimalPlaces(2);
      const r2: Decimal = new Decimal("1.2345").toDecimalPlaces(2, 4);
      let actual: number = r1.comparedTo(r2);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_2400
     * @tc.name decimalToDecimalDigitsPart03Test024
     * @tc.desc Verify toDecimalPlaces(2) returns 5.68 equals toDecimalPlaces(2, ROUND_HALF_UP) via comparedTo returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = new Decimal("5.6789").toDecimalPlaces(2);
      const r2: Decimal = new Decimal("5.6789").toDecimalPlaces(2, Decimal.ROUND_HALF_UP);
      let actual: string = r1.toString();
      let expected: string = "5.68";
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = "5.68";
      expect(actual2).assertEqual(expected2);
      let actual3: number = r1.comparedTo(r2);
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_2500
     * @tc.name decimalToDecimalDigitsPart03Test025
     * @tc.desc Verify toDecimalPlaces(3, Decimal.ROUND_HALF_UP) on new Decimal("1.23355") returns 1.234
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      const r: Decimal = new Decimal("1.23355").toDecimalPlaces(3, Decimal.ROUND_HALF_UP);
      Decimal.set({ defaults: true });
      let actual: string = r.toString();
      let expected: string = "1.234";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_2600
     * @tc.name decimalToDecimalDigitsPart03Test026
     * @tc.desc Verify toDecimalPlaces(3) on new Decimal("1.23355") returns 1.233
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      const r1: Decimal = new Decimal("1.23355").toDecimalPlaces(3);
      const r2: Decimal = new Decimal("1.23355").toDecimalPlaces(3, Decimal.ROUND_DOWN);
      Decimal.set({ defaults: true });
      let actual: string = r1.toString();
      let expected: string = "1.233";
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = "1.233";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_2700
     * @tc.name decimalToDecimalDigitsPart03Test027
     * @tc.desc Verify toDecimalPlaces(3) on new Decimal("1.23345") returns 1.234
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_UP });
      const r1: Decimal = new Decimal("1.23345").toDecimalPlaces(3);
      Decimal.set({ defaults: true });
      const r2: Decimal = new Decimal("1.23345").toDecimalPlaces(3);
      let actual: string = r1.toString();
      let expected: string = "1.234";
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = "1.233";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_2800
     * @tc.name decimalToDecimalDigitsPart03Test028
     * @tc.desc Verify toDecimalPlaces(3) on new Decimal("-1.23355") returns -1.233
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_CEILING });
      const r: Decimal = new Decimal("-1.23355").toDecimalPlaces(3);
      Decimal.set({ defaults: true });
      let actual: string = r.toString();
      let expected: string = "-1.233";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_2900
     * @tc.name decimalToDecimalDigitsPart03Test029
     * @tc.desc Verify toDecimalPlaces(0) on new Decimal(2.5) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_HALF_EVEN });
      const r1: Decimal = new Decimal(2.5).toDecimalPlaces(0);
      const r2: Decimal = new Decimal(2.5).toDecimalPlaces(0, Decimal.ROUND_HALF_UP);
      Decimal.set({ defaults: true });
      let actual: string = r1.toString();
      let expected: string = '2';
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = '3';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_3000
     * @tc.name decimalToDecimalDigitsPart03Test030
     * @tc.desc Verify toDecimalPlaces(3) on new Decimal("-1.23345") returns -1.234
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_FLOOR });
      const r: Decimal = new Decimal("-1.23345").toDecimalPlaces(3);
      Decimal.set({ defaults: true });
      let actual: string = r.toString();
      let expected: string = "-1.234";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_3100
     * @tc.name decimalToDecimalDigitsPart03Test031
     * @tc.desc Verify toDecimalPlaces(3) on new Decimal("1.2355") returns 1.236
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = new Decimal("1.2355").toDecimalPlaces(3);
      const r2: Decimal = new Decimal("1.2355").toDecimalPlaces(3, 1);
      let actual: string = r1.toString();
      let expected: string = "1.236";
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = "1.235";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_3200
     * @tc.name decimalToDecimalDigitsPart03Test032
     * @tc.desc Verify toDecimalPlaces(-1) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Decimal = new Decimal("1.23345");
      try {
        src.toDecimalPlaces(-1);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      let actual: string = src.toString();
      let expected: string = "1.23345";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_3300
     * @tc.name decimalToDecimalDigitsPart03Test033
     * @tc.desc Verify toDecimalPlaces(-1, 4) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Decimal = new Decimal("1.23345");
      try {
        src.toDecimalPlaces(-1, 4);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      let actual: number = src.comparedTo("1.23345");
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_3400
     * @tc.name decimalToDecimalDigitsPart03Test034
     * @tc.desc Verify toDecimalPlaces(2, -1) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Decimal = new Decimal("1.23345");
      try {
        src.toDecimalPlaces(2, -1);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      let actual: number = src.e;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_3500
     * @tc.name decimalToDecimalDigitsPart03Test035
     * @tc.desc Verify toDecimalPlaces(Double.NaN) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Decimal = new Decimal("1.23345");
      try {
        src.toDecimalPlaces(Double.NaN);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      let actual: number = src.s;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_3600
     * @tc.name decimalToDecimalDigitsPart03Test036
     * @tc.desc Verify toDecimalPlaces(1e9 + 1, 4) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Decimal = new Decimal("1.23345");
      try {
        src.toDecimalPlaces(1e9 + 1, 4);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      let actual: string = src.add(0.01).toString();
      let expected: string = "1.24345";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_3700
     * @tc.name decimalToDecimalDigitsPart03Test037
     * @tc.desc Verify toDecimalPlaces(2, 9) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Decimal = new Decimal("1.23345");
      try {
        src.toDecimalPlaces(2, 9);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      let actual: string = src.toString();
      let expected: string = "1.23345";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_3800
     * @tc.name decimalToDecimalDigitsPart03Test038
     * @tc.desc Verify toDecimalPlaces(-1e9) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Decimal = new Decimal("1.23345");
      try {
        src.toDecimalPlaces(-1e9);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      let actual: number = src.comparedTo("1.23345");
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_3900
     * @tc.name decimalToDecimalDigitsPart03Test039
     * @tc.desc Verify toDecimalPlaces(-0.5) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Decimal = new Decimal("1.23345");
      try {
        src.toDecimalPlaces(-0.5);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      let actual: boolean = src.isFinite();
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_4000
     * @tc.name decimalToDecimalDigitsPart03Test040
     * @tc.desc Verify toDecimalPlaces(Double.NaN, 4) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Decimal = new Decimal("1.23345");
      try {
        src.toDecimalPlaces(Double.NaN, 4);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      let actual: number = src.comparedTo("1.23345");
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_4100
     * @tc.name decimalToDecimalDigitsPart03Test041
     * @tc.desc Verify toDecimalPlaces(Number.POSITIVE_INFINITY) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Decimal = new Decimal("1.23345");
      try {
        src.toDecimalPlaces(Number.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      let actual: number = src.d![0];
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_4200
     * @tc.name decimalToDecimalDigitsPart03Test042
     * @tc.desc Verify toDecimalPlaces(-1e9, Decimal.ROUND_UP) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Decimal = new Decimal("1.23345");
      try {
        src.toDecimalPlaces(-1e9, Decimal.ROUND_UP);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      let actual: string = src.toDecimalPlaces(2, Decimal.ROUND_UP).toString();
      let expected: string = "1.24";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_4300
     * @tc.name decimalToDecimalDigitsPart03Test043
     * @tc.desc Verify toDecimalPlaces(1e9 + 0.5) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Decimal = new Decimal("1.23345");
      try {
        src.toDecimalPlaces(1e9 + 0.5);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      let actual: boolean = src.isNegative();
      expect(actual).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_4400
     * @tc.name decimalToDecimalDigitsPart03Test044
     * @tc.desc Verify toDecimalPlaces(1) on new Decimal("9.95") exponent e equals 1 and ROUND_DOWN exponent e equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = new Decimal("9.95").toDecimalPlaces(1);
      const r2: Decimal = new Decimal("9.95").toDecimalPlaces(1, Decimal.ROUND_DOWN);
      let actual: number = r1.e;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let actual2: number = r2.e;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_4500
     * @tc.name decimalToDecimalDigitsPart03Test045
     * @tc.desc Verify toDecimalPlaces(2) on new Decimal("7.7777") returns 7.78 and ROUND_DOWN returns 7.77
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = new Decimal("7.7777").toDecimalPlaces(2);
      const r2: Decimal = new Decimal("7.7777").toDecimalPlaces(2, Decimal.ROUND_DOWN);
      let actual: string = r1.toString();
      let expected: string = "7.78";
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = "7.77";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_4600
     * @tc.name decimalToDecimalDigitsPart03Test046
     * @tc.desc Verify toDecimalPlaces(3) on new Decimal("-1.23345") keeps sign s -1 and ROUND_DOWN returns -1.233
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = new Decimal("-1.23345").toDecimalPlaces(3);
      const r2: Decimal = new Decimal("-1.23345").toDecimalPlaces(3, Decimal.ROUND_DOWN);
      let actual: number = r1.s;
      let expected: int = -1;
      expect(actual).assertEqual(expected);
      let actual2: number = r2.s;
      let expected2: int = -1;
      expect(actual2).assertEqual(expected2);
      let actual3: string = r2.toString();
      let expected3: string = "-1.233";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_4700
     * @tc.name decimalToDecimalDigitsPart03Test047
     * @tc.desc Verify toDecimalPlaces(2, Decimal.ROUND_DOWN) add(0.01) returns 1.24 and receiver unchanged 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.23345").toDecimalPlaces(2, Decimal.ROUND_DOWN);
      let actual: string = r.add(0.01).toString();
      let expected: string = "1.24";
      expect(actual).assertEqual(expected);
      let actual2: string = r.toString();
      let expected2: string = "1.23";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_4800
     * @tc.name decimalToDecimalDigitsPart03Test048
     * @tc.desc Verify div 9.999.toDecimalPlaces(2).div(2) 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(9.999).toDecimalPlaces(2).div(2);
      let actual: string = r.toString();
      let expected: string = '5';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_4900
     * @tc.name decimalToDecimalDigitsPart03Test049
     * @tc.desc Verify toDecimalPlaces (1.2345, 2, ROUND_UP).toDecimalPlaces(0) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.2345").toDecimalPlaces(2, Decimal.ROUND_UP).toDecimalPlaces(0);
      let actual: string = r.toString();
      let expected: string = '1';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_5000
     * @tc.name decimalToDecimalDigitsPart03Test050
     * @tc.desc Verify toDecimalPlaces(2) on new Decimal("4.5678") returns 4.57
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s1: string = new Decimal("4.5678").toDecimalPlaces(2).toFixed(2);
      const s2: string = new Decimal("4.5678").toDecimalPlaces(2, Decimal.ROUND_DOWN).toFixed(2);
      expect(s1).assertEqual("4.57");
      expect(s2).assertEqual("4.56");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_5100
     * @tc.name decimalToDecimalDigitsPart03Test051
     * @tc.desc Verify toDecimalPlaces(0) on new Decimal(1.5) returns 2 (default) and 1 (ROUND_DOWN)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = new Decimal(1.5).toDecimalPlaces(0);
      const r2: Decimal = new Decimal(1.5).toDecimalPlaces(0, Decimal.ROUND_DOWN);
      let actual: boolean = r1.isInteger();
      expect(actual).assertTrue();
      let actualS: string = r1.toString();
      let expectedS: string = '2';
      expect(actualS).assertEqual(expectedS);
      let actual2: boolean = r2.isInteger();
      expect(actual2).assertTrue();
      let actual3: string = r2.toString();
      let expected3: string = '1';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_5200
     * @tc.name decimalToDecimalDigitsPart03Test052
     * @tc.desc Verify toDecimalPlaces(2) on new Decimal(0.009)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = new Decimal(0.009).toDecimalPlaces(2);
      const r2: Decimal = new Decimal(0.009).toDecimalPlaces(2, Decimal.ROUND_DOWN);
      let actual: boolean = r1.isZero();
      expect(actual).assertFalse();
      let actual2: boolean = r2.isZero();
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_5300
     * @tc.name decimalToDecimalDigitsPart03Test053
     * @tc.desc Verify toDecimalPlaces(2) result greater than ROUND_DOWN via comparedTo returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = new Decimal("9.8765").toDecimalPlaces(2);
      const r2: Decimal = new Decimal("9.8765").toDecimalPlaces(2, Decimal.ROUND_DOWN);
      let actual: number = r1.comparedTo(r2);
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_5400
     * @tc.name decimalToDecimalDigitsPart03Test054
     * @tc.desc Verify toDecimalPlaces(1) on new Decimal(0.04)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = new Decimal(0.04).toDecimalPlaces(1);
      const r2: Decimal = new Decimal(0.04).toDecimalPlaces(1, Decimal.ROUND_UP);
      let actual: string = r1.toString();
      let expected: string = '0';
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = "0.1";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_5500
     * @tc.name decimalToDecimalDigitsPart03Test055
     * @tc.desc Verify toDecimalPlaces(2, ROUND_UP) on new Decimal("1.2345") then mul(2) returns 2.48
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.2345").toDecimalPlaces(2, Decimal.ROUND_UP).mul(2);
      let actual: string = r.toString();
      let expected: string = "2.48";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_5600
     * @tc.name decimalToDecimalDigitsPart03Test056
     * @tc.desc Verify toDecimalPlaces(2) and toDecimalPlaces(2, ROUND_UP) on new Decimal("1.2345") added together return 2.47
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Decimal = new Decimal("1.2345").toDecimalPlaces(2);
      const b: Decimal = new Decimal("1.2345").toDecimalPlaces(2, Decimal.ROUND_UP);
      let actual: string = a.add(b).toString();
      let expected: string = "2.47";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_5700
     * @tc.name decimalToDecimalDigitsPart03Test057
     * @tc.desc Verify toDecimalPlaces(3) on new Decimal("1.23345") then mul(2) returns 2.466
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.23345").toDecimalPlaces(3).mul(2);
      let actual: string = r.toString();
      let expected: string = "2.466";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_5800
     * @tc.name decimalToDecimalDigitsPart03Test058
     * @tc.desc Verify toDecimalPlaces(2, Decimal.ROUND_DOWN) on new Decimal("1.2345") returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.2345").toDecimalPlaces(2, Decimal.ROUND_DOWN);
      let actual: string = r.toString();
      let expected: string = "1.23";
      expect(actual).assertEqual(expected);
      let actual2: string = r.toFixed(2);
      let expected2: string = "1.23";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_5900
     * @tc.name decimalToDecimalDigitsPart03Test059
     * @tc.desc Verify repeated toDecimalPlaces calls do not mutate source Decimal("1.23345"), source remains 1.23345
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Decimal = new Decimal("1.23345");
      src.toDecimalPlaces(3);
      src.toDecimalPlaces(3, Decimal.ROUND_UP);
      src.toDecimalPlaces(2);
      let actual: string = src.toString();
      let expected: string = "1.23345";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_6000
     * @tc.name decimalToDecimalDigitsPart03Test060
     * @tc.desc Verify toDecimalPlaces(3) 1.233 toDecimalPlaces(2, ROUND_UP) 1.24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("1.23345");
      const r1: Decimal = d.toDecimalPlaces(3);
      const r2: Decimal = d.toDecimalPlaces(2, Decimal.ROUND_UP);
      let actual: string = r1.toString();
      let expected: string = "1.233";
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = "1.24";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART03_6100
     * @tc.name decimalToDecimalDigitsPart03Test061
     * @tc.desc Verify (1.23345, 3).toDecimalPlaces(2, ROUND_UP) 1.24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart03Test061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.23345").toDecimalPlaces(3).toDecimalPlaces(2, Decimal.ROUND_UP);
      let actual: string = r.toString();
      let expected: string = "1.24";
      expect(actual).assertEqual(expected);
    });
  });
}