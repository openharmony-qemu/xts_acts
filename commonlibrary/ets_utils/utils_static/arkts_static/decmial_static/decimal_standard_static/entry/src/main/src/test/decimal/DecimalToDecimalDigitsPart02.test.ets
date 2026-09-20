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

export default function decimalToDecimalDigitsPart02Test(): void {
  describe("DecimalToDecimalDigitsPart02Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_0100
     * @tc.name decimalToDecimalDigitsPart02Test001
     * @tc.desc Verify toDecimalPlaces(0, Decimal.ROUND_HALF_UP) on new Decimal(123.456) returns 123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(123.456).toDecimalPlaces(0, Decimal.ROUND_HALF_UP).toString();
      let expected: string = "123";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_0200
     * @tc.name decimalToDecimalDigitsPart02Test002
     * @tc.desc Verify toDecimalPlaces(1, Decimal.ROUND_HALF_UP) on new Decimal(1.05) returns 1.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(1.05).toDecimalPlaces(1, Decimal.ROUND_HALF_UP).toString();
      let expected: string = "1.1";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_0300
     * @tc.name decimalToDecimalDigitsPart02Test003
     * @tc.desc Verify toDecimalPlaces(3, Decimal.ROUND_HALF_UP) on new Decimal(1.2345) returns 1.235
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(1.2345).toDecimalPlaces(3, Decimal.ROUND_HALF_UP).toString();
      let expected: string = "1.235";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_0400
     * @tc.name decimalToDecimalDigitsPart02Test004
     * @tc.desc Verify toDecimalPlaces(10, Decimal.ROUND_HALF_UP) on new Decimal(123.456) returns 123.456
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(123.456).toDecimalPlaces(10, Decimal.ROUND_HALF_UP).toString();
      let expected: string = "123.456";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_0500
     * @tc.name decimalToDecimalDigitsPart02Test005
     * @tc.desc Verify toDecimalPlaces(1e9, Decimal.ROUND_HALF_UP) on new Decimal(123.456) keeps result finite (isFinite true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const res: Decimal = new Decimal(123.456).toDecimalPlaces(1e9, Decimal.ROUND_HALF_UP);
      let actual: boolean = res.isFinite();
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_0600
     * @tc.name decimalToDecimalDigitsPart02Test006
     * @tc.desc Verify toDecimalPlaces(1, Decimal.ROUND_HALF_UP) on new Decimal(-1.05) returns -1.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(-1.05).toDecimalPlaces(1, Decimal.ROUND_HALF_UP).toString();
      let expected: string = "-1.1";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_0700
     * @tc.name decimalToDecimalDigitsPart02Test007
     * @tc.desc Verify toDecimalPlaces(0, Decimal.ROUND_HALF_UP) on new Decimal(-123.456) returns -123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(-123.456).toDecimalPlaces(0, Decimal.ROUND_HALF_UP).toString();
      let expected: string = "-123";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_0800
     * @tc.name decimalToDecimalDigitsPart02Test008
     * @tc.desc Verify toDecimalPlaces(2, Decimal.ROUND_HALF_UP) on new Decimal(7) returns 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(7).toDecimalPlaces(2, Decimal.ROUND_HALF_UP).toString();
      let expected: string = '7';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_0900
     * @tc.name decimalToDecimalDigitsPart02Test009
     * @tc.desc Verify toDecimalPlaces(2, Decimal.ROUND_HALF_UP) on new Decimal(-7) returns -7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(-7).toDecimalPlaces(2, Decimal.ROUND_HALF_UP).toString();
      let expected: string = "-7";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_1000
     * @tc.name decimalToDecimalDigitsPart02Test010
     * @tc.desc Verify toDecimalPlaces(0, Decimal.ROUND_HALF_UP) on new Decimal(100) returns 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(100).toDecimalPlaces(0, Decimal.ROUND_HALF_UP).toString();
      let expected: string = "100";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_1100
     * @tc.name decimalToDecimalDigitsPart02Test011
     * @tc.desc Verify toDecimalPlaces throws on dp=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(1.5).toDecimalPlaces(-1, Decimal.ROUND_HALF_UP);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_1200
     * @tc.name decimalToDecimalDigitsPart02Test012
     * @tc.desc Verify toDecimalPlaces throws on dp=1000000001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(1.5).toDecimalPlaces(1000000001, Decimal.ROUND_HALF_UP);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_1300
     * @tc.name decimalToDecimalDigitsPart02Test013
     * @tc.desc Verify toDecimalPlaces throws on dp=NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(1.5).toDecimalPlaces(Double.NaN, Decimal.ROUND_HALF_UP);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_1400
     * @tc.name decimalToDecimalDigitsPart02Test014
     * @tc.desc Verify toDecimalPlaces throws on dp=2.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(1.5).toDecimalPlaces(2.5, Decimal.ROUND_HALF_UP);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_1500
     * @tc.name decimalToDecimalDigitsPart02Test015
     * @tc.desc Verify toDecimalPlaces throws on rounding=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(2.5).toDecimalPlaces(0, -1);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_1600
     * @tc.name decimalToDecimalDigitsPart02Test016
     * @tc.desc Verify toDecimalPlaces throws on rounding=9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(1.5).toDecimalPlaces(1, 9);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_1700
     * @tc.name decimalToDecimalDigitsPart02Test017
     * @tc.desc Verify toDecimalPlaces(0, Decimal.ROUND_DOWN) on new Decimal(2.5) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(2.5).toDecimalPlaces(0, Decimal.ROUND_DOWN).toString();
      let expected: string = '2';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_1800
     * @tc.name decimalToDecimalDigitsPart02Test018
     * @tc.desc Verify toDecimalPlaces(0, Decimal.ROUND_CEILING) on new Decimal(2.5) returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(2.5).toDecimalPlaces(0, Decimal.ROUND_CEILING).toString();
      let expected: string = '3';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_1900
     * @tc.name decimalToDecimalDigitsPart02Test019
     * @tc.desc Verify toDecimalPlaces(0, Decimal.ROUND_FLOOR) on new Decimal(2.5) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(2.5).toDecimalPlaces(0, Decimal.ROUND_FLOOR).toString();
      let expected: string = '2';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_2000
     * @tc.name decimalToDecimalDigitsPart02Test020
     * @tc.desc Verify toDecimalPlaces(0, Decimal.ROUND_HALF_UP) on new Decimal(2.5) returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(2.5).toDecimalPlaces(0, Decimal.ROUND_HALF_UP).toString();
      let expected: string = '3';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_2100
     * @tc.name decimalToDecimalDigitsPart02Test021
     * @tc.desc Verify toDecimalPlaces(0, Decimal.ROUND_HALF_DOWN) on new Decimal(2.5) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(2.5).toDecimalPlaces(0, Decimal.ROUND_HALF_DOWN).toString();
      let expected: string = '2';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_2200
     * @tc.name decimalToDecimalDigitsPart02Test022
     * @tc.desc Verify toDecimalPlaces(0, Decimal.ROUND_HALF_EVEN) on new Decimal(2.5) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(2.5).toDecimalPlaces(0, Decimal.ROUND_HALF_EVEN).toString();
      let expected: string = '2';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_2300
     * @tc.name decimalToDecimalDigitsPart02Test023
     * @tc.desc Verify toDecimalPlaces(0, Decimal.ROUND_HALF_CEILING) on new Decimal(2.5) returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(2.5).toDecimalPlaces(0, Decimal.ROUND_HALF_CEILING).toString();
      let expected: string = '3';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_2400
     * @tc.name decimalToDecimalDigitsPart02Test024
     * @tc.desc Verify toDecimalPlaces(0, Decimal.ROUND_HALF_FLOOR) on new Decimal(2.5) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(2.5).toDecimalPlaces(0, Decimal.ROUND_HALF_FLOOR).toString();
      let expected: string = '2';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_2500
     * @tc.name decimalToDecimalDigitsPart02Test025
     * @tc.desc Verify toDecimalPlaces(0, Decimal.ROUND_UP) on new Decimal(-2.5) returns -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(-2.5).toDecimalPlaces(0, Decimal.ROUND_UP).toString();
      let expected: string = "-3";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_2600
     * @tc.name decimalToDecimalDigitsPart02Test026
     * @tc.desc Verify toDecimalPlaces(0, Decimal.ROUND_DOWN) on new Decimal(-2.5) returns -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(-2.5).toDecimalPlaces(0, Decimal.ROUND_DOWN).toString();
      let expected: string = "-2";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_2700
     * @tc.name decimalToDecimalDigitsPart02Test027
     * @tc.desc Verify toDecimalPlaces(0, Decimal.ROUND_CEILING) on new Decimal(-2.5) returns -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(-2.5).toDecimalPlaces(0, Decimal.ROUND_CEILING).toString();
      let expected: string = "-2";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_2800
     * @tc.name decimalToDecimalDigitsPart02Test028
     * @tc.desc Verify toDecimalPlaces(0, Decimal.ROUND_FLOOR) on new Decimal(-2.5) returns -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(-2.5).toDecimalPlaces(0, Decimal.ROUND_FLOOR).toString();
      let expected: string = "-3";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_2900
     * @tc.name decimalToDecimalDigitsPart02Test029
     * @tc.desc Verify toDecimalPlaces(0, Decimal.ROUND_HALF_UP) on new Decimal(-2.5) returns -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(-2.5).toDecimalPlaces(0, Decimal.ROUND_HALF_UP).toString();
      let expected: string = "-3";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_3000
     * @tc.name decimalToDecimalDigitsPart02Test030
     * @tc.desc Verify toDecimalPlaces(0, Decimal.ROUND_HALF_DOWN) on new Decimal(-2.5) returns -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(-2.5).toDecimalPlaces(0, Decimal.ROUND_HALF_DOWN).toString();
      let expected: string = "-2";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_3100
     * @tc.name decimalToDecimalDigitsPart02Test031
     * @tc.desc Verify toDecimalPlaces(0, Decimal.ROUND_HALF_EVEN) on new Decimal(-2.5) returns -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(-2.5).toDecimalPlaces(0, Decimal.ROUND_HALF_EVEN).toString();
      let expected: string = "-2";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_3200
     * @tc.name decimalToDecimalDigitsPart02Test032
     * @tc.desc Verify toDecimalPlaces(0, Decimal.ROUND_HALF_CEILING) on new Decimal(-2.5) returns -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(-2.5).toDecimalPlaces(0, Decimal.ROUND_HALF_CEILING).toString();
      let expected: string = "-2";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_3300
     * @tc.name decimalToDecimalDigitsPart02Test033
     * @tc.desc Verify toDecimalPlaces(0, Decimal.ROUND_HALF_FLOOR) on new Decimal(-2.5) returns -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(-2.5).toDecimalPlaces(0, Decimal.ROUND_HALF_FLOOR).toString();
      let expected: string = "-3";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_3400
     * @tc.name decimalToDecimalDigitsPart02Test034
     * @tc.desc Verify toDecimalPlaces(2, Decimal.ROUND_UP) on new Decimal(1.2345) returns 1.24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(1.2345).toDecimalPlaces(2, Decimal.ROUND_UP).toString();
      let expected: string = "1.24";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_3500
     * @tc.name decimalToDecimalDigitsPart02Test035
     * @tc.desc Verify toDecimalPlaces(2, Decimal.ROUND_DOWN) on new Decimal(1.2345) returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(1.2345).toDecimalPlaces(2, Decimal.ROUND_DOWN).toString();
      let expected: string = "1.23";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_3600
     * @tc.name decimalToDecimalDigitsPart02Test036
     * @tc.desc Verify toDecimalPlaces(2, Decimal.ROUND_CEILING) on new Decimal(1.2345) returns 1.24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(1.2345).toDecimalPlaces(2, Decimal.ROUND_CEILING).toString();
      let expected: string = "1.24";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_3700
     * @tc.name decimalToDecimalDigitsPart02Test037
     * @tc.desc Verify toDecimalPlaces(2, Decimal.ROUND_FLOOR) on new Decimal(1.2345) returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(1.2345).toDecimalPlaces(2, Decimal.ROUND_FLOOR).toString();
      let expected: string = "1.23";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_3800
     * @tc.name decimalToDecimalDigitsPart02Test038
     * @tc.desc Verify toDecimalPlaces(1, Decimal.ROUND_HALF_DOWN) on new Decimal(1.25) returns 1.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(1.25).toDecimalPlaces(1, Decimal.ROUND_HALF_DOWN).toString();
      let expected: string = "1.2";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_3900
     * @tc.name decimalToDecimalDigitsPart02Test039
     * @tc.desc Verify toDecimalPlaces(1, Decimal.ROUND_HALF_EVEN) on new Decimal(1.25) returns 1.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(1.25).toDecimalPlaces(1, Decimal.ROUND_HALF_EVEN).toString();
      let expected: string = "1.2";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_4000
     * @tc.name decimalToDecimalDigitsPart02Test040
     * @tc.desc Verify toDecimalPlaces(1, Decimal.ROUND_HALF_CEILING) on new Decimal(1.25) returns 1.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(1.25).toDecimalPlaces(1, Decimal.ROUND_HALF_CEILING).toString();
      let expected: string = "1.3";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_4100
     * @tc.name decimalToDecimalDigitsPart02Test041
     * @tc.desc Verify toDecimalPlaces(1, Decimal.ROUND_HALF_FLOOR) on new Decimal(1.25) returns 1.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(1.25).toDecimalPlaces(1, Decimal.ROUND_HALF_FLOOR).toString();
      let expected: string = "1.2";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_4200
     * @tc.name decimalToDecimalDigitsPart02Test042
     * @tc.desc Verify toDecimalPlaces(1, Decimal.ROUND_HALF_UP) on new Decimal(-1.25) returns -1.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(-1.25).toDecimalPlaces(1, Decimal.ROUND_HALF_UP).toString();
      let expected: string = "-1.3";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_4300
     * @tc.name decimalToDecimalDigitsPart02Test043
     * @tc.desc Verify toDecimalPlaces(1, Decimal.ROUND_HALF_DOWN) on new Decimal(-1.25) returns -1.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(-1.25).toDecimalPlaces(1, Decimal.ROUND_HALF_DOWN).toString();
      let expected: string = "-1.2";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_4400
     * @tc.name decimalToDecimalDigitsPart02Test044
     * @tc.desc Verify toDecimalPlaces(1, Decimal.ROUND_HALF_EVEN) on new Decimal(-1.25) returns -1.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(-1.25).toDecimalPlaces(1, Decimal.ROUND_HALF_EVEN).toString();
      let expected: string = "-1.2";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_4500
     * @tc.name decimalToDecimalDigitsPart02Test045
     * @tc.desc Verify toDecimalPlaces(1, Decimal.ROUND_HALF_CEILING) on new Decimal(-1.25) returns -1.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(-1.25).toDecimalPlaces(1, Decimal.ROUND_HALF_CEILING).toString();
      let expected: string = "-1.2";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_4600
     * @tc.name decimalToDecimalDigitsPart02Test046
     * @tc.desc Verify toDecimalPlaces(1, Decimal.ROUND_HALF_FLOOR) on new Decimal(-1.25) returns -1.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(-1.25).toDecimalPlaces(1, Decimal.ROUND_HALF_FLOOR).toString();
      let expected: string = "-1.3";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_4700
     * @tc.name decimalToDecimalDigitsPart02Test047
     * @tc.desc Verify toDecimalPlaces(1, Decimal.ROUND_HALF_EVEN) on new Decimal(1.35) returns 1.4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(1.35).toDecimalPlaces(1, Decimal.ROUND_HALF_EVEN).toString();
      let expected: string = "1.4";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_4800
     * @tc.name decimalToDecimalDigitsPart02Test048
     * @tc.desc Verify toDecimalPlaces(1, Decimal.ROUND_HALF_EVEN) on new Decimal(-1.35) returns -1.4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(-1.35).toDecimalPlaces(1, Decimal.ROUND_HALF_EVEN).toString();
      let expected: string = "-1.4";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_4900
     * @tc.name decimalToDecimalDigitsPart02Test049
     * @tc.desc Verify toDecimalPlaces(2, Decimal.ROUND_HALF_UP) on new Decimal(9.999) returns 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(9.999).toDecimalPlaces(2, Decimal.ROUND_HALF_UP).toString();
      let expected: string = "10";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_5000
     * @tc.name decimalToDecimalDigitsPart02Test050
     * @tc.desc Verify toDecimalPlaces(0, Decimal.ROUND_FLOOR) on new Decimal(-9.5) returns -10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(-9.5).toDecimalPlaces(0, Decimal.ROUND_FLOOR).toString();
      let expected: string = "-10";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_5100
     * @tc.name decimalToDecimalDigitsPart02Test051
     * @tc.desc Verify toDecimalPlaces(2, ROUND_HALF_UP) on new Decimal(1.2345) then mul(100) returns 123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(1.2345).toDecimalPlaces(2, Decimal.ROUND_HALF_UP);
      let actual: string = r.mul(100).toString();
      let expected: string = "123";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_5200
     * @tc.name decimalToDecimalDigitsPart02Test052
     * @tc.desc Verify toDecimalPlaces(3, ROUND_UP) on new Decimal(1.23456) then toDecimalPlaces(2, ROUND_UP) returns 1.24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(1.23456).toDecimalPlaces(3, Decimal.ROUND_UP);
      let actual: string = r.toDecimalPlaces(2, Decimal.ROUND_UP).toString();
      let expected: string = "1.24";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_5300
     * @tc.name decimalToDecimalDigitsPart02Test053
     * @tc.desc Verify toDecimalPlaces(2, ROUND_HALF_UP) on new Decimal(1.2345) comparedTo new Decimal("1.23") returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(1.2345).toDecimalPlaces(2, Decimal.ROUND_HALF_UP);
      let actual: number = r.comparedTo(new Decimal("1.23"));
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_5400
     * @tc.name decimalToDecimalDigitsPart02Test054
     * @tc.desc Verify toDecimalPlaces(2, Decimal.ROUND_HALF_UP) on new Decimal(big) keeps value equal to big
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big: string = "1267650600228229401496703205376";
      let actual: number = new Decimal(big).toDecimalPlaces(2, Decimal.ROUND_HALF_UP).comparedTo(big);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_5500
     * @tc.name decimalToDecimalDigitsPart02Test055
     * @tc.desc Verify toDecimalPlaces(0, Decimal.ROUND_HALF_UP) on new Decimal("1e5") returns 100000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal("1e5").toDecimalPlaces(0, Decimal.ROUND_HALF_UP).toString();
      let expected: string = "100000";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_5600
     * @tc.name decimalToDecimalDigitsPart02Test056
     * @tc.desc Verify toDecimalPlaces(10, Decimal.ROUND_HALF_UP) on new Decimal("1e-10") value equal to 0.0000000001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: number = new Decimal("1e-10").toDecimalPlaces(10, Decimal.ROUND_HALF_UP).comparedTo("0.0000000001");
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_5700
     * @tc.name decimalToDecimalDigitsPart02Test057
     * @tc.desc Verify toDecimalPlaces(5, Decimal.ROUND_HALF_UP) on new Decimal("1e-10") returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1e-10").toDecimalPlaces(5, Decimal.ROUND_HALF_UP);
      let actual: number = r.comparedTo(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_5800
     * @tc.name decimalToDecimalDigitsPart02Test058
     * @tc.desc Verify toDecimalPlaces(0, Decimal.ROUND_UP) on new Decimal(12345678.9) returns 12345679
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(12345678.9).toDecimalPlaces(0, Decimal.ROUND_UP).toString();
      let expected: string = "12345679";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_5900
     * @tc.name decimalToDecimalDigitsPart02Test059
     * @tc.desc Verify toDecimalPlaces(6, Decimal.ROUND_HALF_UP) on new Decimal(0.0000012345) returns 0.000001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(0.0000012345).toDecimalPlaces(6, Decimal.ROUND_HALF_UP).toString();
      let expected: string = "0.000001";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DECIMAL_DIGITS_PART02_6000
     * @tc.name decimalToDecimalDigitsPart02Test060
     * @tc.desc Verify toDecimalPlaces(0, Decimal.ROUND_CEILING) on new Decimal(-12345678.9) returns -12345678
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToDecimalDigitsPart02Test060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal(-12345678.9).toDecimalPlaces(0, Decimal.ROUND_CEILING).toString();
      let expected: string = "-12345678";
      expect(actual).assertEqual(expected);
    });
  });
}