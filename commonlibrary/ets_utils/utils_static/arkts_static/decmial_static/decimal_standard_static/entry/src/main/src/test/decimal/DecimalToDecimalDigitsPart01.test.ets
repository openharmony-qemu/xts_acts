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

export default function decimalToDecimalDigitsPart01Test(): void {
  describe("DecimalToDecimalDigitsPart01Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_0100
     * @tc.name decimalToDecimalDigitsPart01Test001
     * @tc.desc Verify toDecimalPlaces(2) on new Decimal(1.2345)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(1.2345).toDecimalPlaces(2);
      let actual: string = d.toString();
      let expected: string = "1.23";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_0200
     * @tc.name decimalToDecimalDigitsPart01Test002
     * @tc.desc Verify toDecimalPlaces(dp) on new Decimal(1.2345) returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dp: double = 2;
      const d: Decimal = new Decimal(1.2345).toDecimalPlaces(dp);
      let actual: string = d.toString();
      let expected: string = "1.23";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_0300
     * @tc.name decimalToDecimalDigitsPart01Test003
     * @tc.desc Verify toDecimalPlaces(2) on new Decimal(1.235) returns 1.24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(1.235).toDecimalPlaces(2);
      let actual: string = d.toString();
      let expected: string = "1.24";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_0400
     * @tc.name decimalToDecimalDigitsPart01Test004
     * @tc.desc Verify toDecimalPlaces(0) on new Decimal(1.9) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(1.9).toDecimalPlaces(0);
      let actual: string = d.toString();
      let expected: string = '2';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_0500
     * @tc.name decimalToDecimalDigitsPart01Test005
     * @tc.desc Verify toDecimalPlaces(0) on new Decimal(-1.6) returns -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(-1.6).toDecimalPlaces(0);
      let actual: string = d.toString();
      let expected: string = "-2";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_0600
     * @tc.name decimalToDecimalDigitsPart01Test006
     * @tc.desc Verify toDecimalPlaces(0) on new Decimal(0.04) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(0.04).toDecimalPlaces(0);
      let actual: string = d.toString();
      let expected: string = '0';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_0700
     * @tc.name decimalToDecimalDigitsPart01Test007
     * @tc.desc Verify toDecimalPlaces(1) on new Decimal(1.25) returns 1.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(1.25).toDecimalPlaces(1);
      let actual: string = d.toString();
      let expected: string = "1.3";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_0800
     * @tc.name decimalToDecimalDigitsPart01Test008
     * @tc.desc Verify toDecimalPlaces(2) on new Decimal(1.245) returns 1.25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(1.245).toDecimalPlaces(2);
      let actual: string = d.toString();
      let expected: string = "1.25";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_0900
     * @tc.name decimalToDecimalDigitsPart01Test009
     * @tc.desc Verify toDecimalPlaces(2) on new Decimal(-1.235) returns -1.24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(-1.235).toDecimalPlaces(2);
      let actual: string = d.toString();
      let expected: string = "-1.24";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_1000
     * @tc.name decimalToDecimalDigitsPart01Test010
     * @tc.desc Verify toDecimalPlaces(2) on new Decimal(1.4445) returns 1.44
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(1.4445).toDecimalPlaces(2);
      let actual: string = d.toString();
      let expected: string = "1.44";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_1100
     * @tc.name decimalToDecimalDigitsPart01Test011
     * @tc.desc Verify toDecimalPlaces(2) on new Decimal(1.4455) returns 1.45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(1.4455).toDecimalPlaces(2);
      let actual: string = d.toString();
      let expected: string = "1.45";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_1200
     * @tc.name decimalToDecimalDigitsPart01Test012
     * @tc.desc Verify toDecimalPlaces(10) on new Decimal(1.12345678901234) returns 1.123456789
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(1.12345678901234).toDecimalPlaces(10);
      let actual: string = d.toString();
      let expected: string = "1.123456789";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_1300
     * @tc.name decimalToDecimalDigitsPart01Test013
     * @tc.desc Verify toDecimalPlaces(10) on new Decimal(1.2345) returns 1.2345
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(1.2345).toDecimalPlaces(10);
      let actual: string = d.toString();
      let expected: string = "1.2345";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_1400
     * @tc.name decimalToDecimalDigitsPart01Test014
     * @tc.desc Verify toDecimalPlaces(1e9) on new Decimal(0.5) returns 0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(0.5).toDecimalPlaces(1e9);
      let actual: string = d.toString();
      let expected: string = "0.5";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_1500
     * @tc.name decimalToDecimalDigitsPart01Test015
     * @tc.desc Verify toDecimalPlaces(1e9) on new Decimal(-0.5) returns -0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(-0.5).toDecimalPlaces(1e9);
      let actual: string = d.toString();
      let expected: string = "-0.5";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_1600
     * @tc.name decimalToDecimalDigitsPart01Test016
     * @tc.desc Verify toDecimalPlaces(-0) on new Decimal(1.9) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(1.9).toDecimalPlaces(-0);
      let actual: string = d.toString();
      let expected: string = '2';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_1700
     * @tc.name decimalToDecimalDigitsPart01Test017
     * @tc.desc Verify toDecimalPlaces(2) on new Decimal(1.23) returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(1.23).toDecimalPlaces(2);
      let actual: string = d.toString();
      let expected: string = "1.23";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_1800
     * @tc.name decimalToDecimalDigitsPart01Test018
     * @tc.desc Verify toDecimalPlaces(-1) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(1.2345).toDecimalPlaces(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_1900
     * @tc.name decimalToDecimalDigitsPart01Test019
     * @tc.desc Verify toDecimalPlaces(1.5) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(1.2345).toDecimalPlaces(1.5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_2000
     * @tc.name decimalToDecimalDigitsPart01Test020
     * @tc.desc Verify toDecimalPlaces(Double.NaN) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(1.2345).toDecimalPlaces(Double.NaN);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_2100
     * @tc.name decimalToDecimalDigitsPart01Test021
     * @tc.desc Verify toDecimalPlaces(Number.POSITIVE_INFINITY) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(1.2345).toDecimalPlaces(Number.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_2200
     * @tc.name decimalToDecimalDigitsPart01Test022
     * @tc.desc Verify toDecimalPlaces(1e9 + 1) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(1.2345).toDecimalPlaces(1e9 + 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_2300
     * @tc.name decimalToDecimalDigitsPart01Test023
     * @tc.desc Verify toDecimalPlaces(2) on new Decimal("1.2345") returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("1.2345").toDecimalPlaces(2);
      let actual: string = d.toString();
      let expected: string = "1.23";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_2400
     * @tc.name decimalToDecimalDigitsPart01Test024
     * @tc.desc Verify toDecimalPlaces(2) on new Decimal(new Decimal(1.2345) returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(new Decimal(1.2345)).toDecimalPlaces(2);
      let actual: string = d.toString();
      let expected: string = "1.23";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_2500
     * @tc.name decimalToDecimalDigitsPart01Test025
     * @tc.desc Verify toDecimalPlaces(0) on new Decimal("1.2345e+3") returns 1235
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("1.2345e+3").toDecimalPlaces(0);
      let actual: string = d.toString();
      let expected: string = "1235";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_2600
     * @tc.name decimalToDecimalDigitsPart01Test026
     * @tc.desc Verify toDecimalPlaces(4) on new Decimal("1.2345e-3") returns 0.0012
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("1.2345e-3").toDecimalPlaces(4);
      let actual: string = d.toString();
      let expected: string = "0.0012";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_2700
     * @tc.name decimalToDecimalDigitsPart01Test027
     * @tc.desc Verify toDecimalPlaces(2) on new Decimal("-1.2345") returns -1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("-1.2345").toDecimalPlaces(2);
      let actual: string = d.toString();
      let expected: string = "-1.23";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_2800
     * @tc.name decimalToDecimalDigitsPart01Test028
     * @tc.desc Verify Value NaN toDecimalPlaces NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(Double.NaN).toDecimalPlaces(2);
      let actual: string = d.toString();
      let expected: string = "NaN";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_2900
     * @tc.name decimalToDecimalDigitsPart01Test029
     * @tc.desc Verify Value Infinity toDecimalPlaces Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(Number.POSITIVE_INFINITY).toDecimalPlaces(2);
      let actual: string = d.toString();
      let expected: string = "Infinity";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_3000
     * @tc.name decimalToDecimalDigitsPart01Test030
     * @tc.desc Verify Value -Infinity toDecimalPlaces -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(-Number.POSITIVE_INFINITY).toDecimalPlaces(2);
      let actual: string = d.toString();
      let expected: string = "-Infinity";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_3100
     * @tc.name decimalToDecimalDigitsPart01Test031
     * @tc.desc Verify toDecimalPlaces(2) on new Decimal(-0) keeps result negative (isNegative true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(-0).toDecimalPlaces(2);
      let actual: boolean = d.isNegative();
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_3200
     * @tc.name decimalToDecimalDigitsPart01Test032
     * @tc.desc Verify Value 0 toDecimalPlaces '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(0).toDecimalPlaces(2);
      let actual: string = d.toString();
      let expected: string = '0';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_3300
     * @tc.name decimalToDecimalDigitsPart01Test033
     * @tc.desc Verify toDecimalPlaces(0) on new Decimal("9007199254740993") returns 9007199254740993
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("9007199254740993").toDecimalPlaces(0);
      let actual: string = d.toString();
      let expected: string = "9007199254740993";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_3400
     * @tc.name decimalToDecimalDigitsPart01Test034
     * @tc.desc Verify toDecimalPlaces(2) on new Decimal("1e-5") returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("1e-5").toDecimalPlaces(2);
      let actual: string = d.toString();
      let expected: string = '0';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_3500
     * @tc.name decimalToDecimalDigitsPart01Test035
     * @tc.desc Verify toDecimalPlaces(5) on new Decimal("123456789.123456789") returns 123456789.12346
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("123456789.123456789").toDecimalPlaces(5);
      let actual: string = d.toString();
      let expected: string = "123456789.12346";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_3600
     * @tc.name decimalToDecimalDigitsPart01Test036
     * @tc.desc Verify toDecimalPlaces(1) on new Decimal(0.1 + 0.2) returns 0.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(0.1 + 0.2).toDecimalPlaces(1);
      let actual: string = d.toString();
      let expected: string = "0.3";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_3700
     * @tc.name decimalToDecimalDigitsPart01Test037
     * @tc.desc Verify toDecimalPlaces(2) on new Decimal(2.675) returns 2.68
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(2.675).toDecimalPlaces(2);
      let actual: string = d.toString();
      let expected: string = "2.68";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_3800
     * @tc.name decimalToDecimalDigitsPart01Test038
     * @tc.desc Verify toDecimalPlaces(2) on new Decimal("99.995") returns 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("99.995").toDecimalPlaces(2);
      let actual: string = d.toString();
      let expected: string = "100";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_3900
     * @tc.name decimalToDecimalDigitsPart01Test039
     * @tc.desc Verify toDecimalPlaces(1) on new Decimal(9.99) returns 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(9.99).toDecimalPlaces(1);
      let actual: string = d.toString();
      let expected: string = "10";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_4000
     * @tc.name decimalToDecimalDigitsPart01Test040
     * @tc.desc Verify toDecimalPlaces(2) on new Decimal(1.2345) then add(0.01) returns 1.24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(1.2345).toDecimalPlaces(2).add(0.01);
      let actual: string = d.toString();
      let expected: string = "1.24";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_4100
     * @tc.name decimalToDecimalDigitsPart01Test041
     * @tc.desc Verify toDecimalPlaces(2) then toDecimalPlaces(0) on new Decimal(1.2345) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(1.2345).toDecimalPlaces(2).toDecimalPlaces(0);
      let actual: string = d.toString();
      let expected: string = '1';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_4200
     * @tc.name decimalToDecimalDigitsPart01Test042
     * @tc.desc Verify toDecimalPlaces does not mutate the original Decimal instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Decimal = new Decimal(1.2345);
      src.toDecimalPlaces(2);
      let actual: string = src.toString();
      let expected: string = "1.2345";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_4300
     * @tc.name decimalToDecimalDigitsPart01Test043
     * @tc.desc Verify toDecimalPlaces(2) on new Decimal(-1.2345) sign field s equals -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(-1.2345).toDecimalPlaces(2);
      let actual: number = d.s;
      let expected: int = -1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_4400
     * @tc.name decimalToDecimalDigitsPart01Test044
     * @tc.desc Verify toDecimalPlaces(2) on new Decimal(1.2345) then mul(2) returns 2.46
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(1.2345).toDecimalPlaces(2).mul(2);
      let actual: string = d.toString();
      let expected: string = "2.46";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_4500
     * @tc.name decimalToDecimalDigitsPart01Test045
     * @tc.desc Verify toDecimalPlaces(2) on new Decimal(1.2345) then toFixed(2) returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: string = new Decimal(1.2345).toDecimalPlaces(2).toFixed(2);
      expect(s).assertEqual("1.23");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_4600
     * @tc.name decimalToDecimalDigitsPart01Test046
     * @tc.desc Verify toDecimalPlaces(2) on new Decimal(9.999) returns 10 and e is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(9.999).toDecimalPlaces(2);
      let actual: string = d.toString();
      let expected: string = "10";
      expect(actual).assertEqual(expected);
      let actual2: number = d.e;
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_4700
     * @tc.name decimalToDecimalDigitsPart01Test047
     * @tc.desc Verify toDecimalPlaces(8) on new Decimal(0.9999999999999999) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(0.9999999999999999).toDecimalPlaces(8);
      let actual: string = d.toString();
      let expected: string = '1';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_4800
     * @tc.name decimalToDecimalDigitsPart01Test048
     * @tc.desc Verify toDecimalPlaces(2) on new Decimal(1.004) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(1.004).toDecimalPlaces(2);
      let actual: string = d.toString();
      let expected: string = '1';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_4900
     * @tc.name decimalToDecimalDigitsPart01Test049
     * @tc.desc Verify toDecimalPlaces(2) on new Decimal(1.005) returns 1.01
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(1.005).toDecimalPlaces(2);
      let actual: string = d.toString();
      let expected: string = "1.01";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_5000
     * @tc.name decimalToDecimalDigitsPart01Test050
     * @tc.desc Verify toDecimalPlaces(3) on new Decimal(0.0001) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(0.0001).toDecimalPlaces(3);
      let actual: string = d.toString();
      let expected: string = '0';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_5100
     * @tc.name decimalToDecimalDigitsPart01Test051
     * @tc.desc Verify toDecimalPlaces(3) on new Decimal(0.0005) returns 0.001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(0.0005).toDecimalPlaces(3);
      let actual: string = d.toString();
      let expected: string = "0.001";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_5200
     * @tc.name decimalToDecimalDigitsPart01Test052
     * @tc.desc Verify toDecimalPlaces(3) on new Decimal(-0.0005) returns -0.001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(-0.0005).toDecimalPlaces(3);
      let actual: string = d.toString();
      let expected: string = "-0.001";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_5300
     * @tc.name decimalToDecimalDigitsPart01Test053
     * @tc.desc Verify toDecimalPlaces(3) on new Decimal(-0.0004) returns 0 (isZero true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(-0.0004).toDecimalPlaces(3);
      let actual: boolean = d.isZero();
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_5400
     * @tc.name decimalToDecimalDigitsPart01Test054
     * @tc.desc Verify toDecimalPlaces(1) on new Decimal(0.05) returns 0.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(0.05).toDecimalPlaces(1);
      let actual: string = d.toString();
      let expected: string = "0.1";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_5500
     * @tc.name decimalToDecimalDigitsPart01Test055
     * @tc.desc Verify toDecimalPlaces(1) on new Decimal(-0.05) returns -0.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(-0.05).toDecimalPlaces(1);
      let actual: string = d.toString();
      let expected: string = "-0.1";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_5600
     * @tc.name decimalToDecimalDigitsPart01Test056
     * @tc.desc Verify toDecimalPlaces(0) on new Decimal(2.5) returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(2.5).toDecimalPlaces(0);
      let actual: string = d.toString();
      let expected: string = '3';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_5700
     * @tc.name decimalToDecimalDigitsPart01Test057
     * @tc.desc Verify toDecimalPlaces(0) on new Decimal(-2.5) returns -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(-2.5).toDecimalPlaces(0);
      let actual: string = d.toString();
      let expected: string = "-3";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_5800
     * @tc.name decimalToDecimalDigitsPart01Test058
     * @tc.desc Verify toDecimalPlaces(2) on new Decimal(123456.789) returns 123456.79
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(123456.789).toDecimalPlaces(2);
      let actual: string = d.toString();
      let expected: string = "123456.79";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_5900
     * @tc.name decimalToDecimalDigitsPart01Test059
     * @tc.desc Verify toDecimalPlaces(2) on new Decimal(-123.456) returns -123.46
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(-123.456).toDecimalPlaces(2);
      let actual: string = d.toString();
      let expected: string = "-123.46";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_6000
     * @tc.name decimalToDecimalDigitsPart01Test060
     * @tc.desc Verify toDecimalPlaces(2) on new Decimal(1.235) returns 1.23 under Decimal.set({ rounding: ROUND_DOWN })
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        Decimal.set({ rounding: Decimal.ROUND_DOWN });
        const d: Decimal = new Decimal(1.235).toDecimalPlaces(2);
        let actual: string = d.toString();
        let expected: string = "1.23";
        expect(actual).assertEqual(expected);
        Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_6100
     * @tc.name decimalToDecimalDigitsPart01Test061
     * @tc.desc Verify toDecimalPlaces(0) on new Decimal(2.5) returns 2 under Decimal.set({ rounding: ROUND_HALF_EVEN })
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        Decimal.set({ rounding: Decimal.ROUND_HALF_EVEN });
        const d: Decimal = new Decimal(2.5).toDecimalPlaces(0);
        let actual: string = d.toString();
        let expected: string = '2';
        expect(actual).assertEqual(expected);
        Decimal.set({ defaults: true });

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_6200
     * @tc.name decimalToDecimalDigitsPart01Test062
     * @tc.desc Verify toDecimalPlaces(2) on new Decimal(1.2301) returns 1.24 under Decimal.set({ rounding: ROUND_UP })
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        Decimal.set({ rounding: Decimal.ROUND_UP });
        const d: Decimal = new Decimal(1.2301).toDecimalPlaces(2);
        let actual: string = d.toString();
        let expected: string = "1.24";
        expect(actual).assertEqual(expected);
        Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART01_6300
     * @tc.name decimalToDecimalDigitsPart01Test063
     * @tc.desc Verify toDecimalPlaces(2) on new Decimal(-1.235) returns -1.24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart01Test063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        Decimal.set({ rounding: Decimal.ROUND_FLOOR });
        const d: Decimal = new Decimal(-1.235).toDecimalPlaces(2);
        let actual: string = d.toString();
        let expected: string = "-1.24";
        expect(actual).assertEqual(expected);
        Decimal.set({ defaults: true });

    });
  });
}
