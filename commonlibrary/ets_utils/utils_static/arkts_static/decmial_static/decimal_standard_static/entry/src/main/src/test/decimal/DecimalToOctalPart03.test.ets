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

export default function decimalToOctalPart03Test(): void {
  describe("DecimalToOctalPart03Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_0100
     * @tc.name decimalToOctalPart03Test001
     * @tc.desc Verify toOctal(20, Decimal.ROUND_HALF_UP) on new Decimal(42) returns 0o1.24p+5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(42).toOctal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0o1.24p+5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_0200
     * @tc.name decimalToOctalPart03Test002
     * @tc.desc Verify toOctal(20, Decimal.ROUND_HALF_UP) on new Decimal(-42) returns -0o1.24p+5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-42).toOctal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("-0o1.24p+5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_0300
     * @tc.name decimalToOctalPart03Test003
     * @tc.desc Verify toOctal(20, Decimal.ROUND_HALF_UP) on new Decimal(2.5) returns 0o1.2p+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(2.5).toOctal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0o1.2p+1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_0400
     * @tc.name decimalToOctalPart03Test004
     * @tc.desc Verify toOctal(20, Decimal.ROUND_HALF_UP) on new Decimal(Double.NaN) returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(Double.NaN).toOctal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("NaN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_0500
     * @tc.name decimalToOctalPart03Test005
     * @tc.desc Verify toOctal(1, Decimal.ROUND_DOWN) on new Decimal(42) returns 0o1p+5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(42).toOctal(1, Decimal.ROUND_DOWN);
      expect(s).assertEqual("0o1p+5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_0600
     * @tc.name decimalToOctalPart03Test006
     * @tc.desc Verify toOctal(1, Decimal.ROUND_UP) on new Decimal(42) returns 0o1p+6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(42).toOctal(1, Decimal.ROUND_UP);
      expect(s).assertEqual("0o1p+6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_0700
     * @tc.name decimalToOctalPart03Test007
     * @tc.desc Verify toOctal(3, Decimal.ROUND_DOWN) on new Decimal(100) returns 0o1.44p+6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(100).toOctal(3, Decimal.ROUND_DOWN);
      expect(s).assertEqual("0o1.44p+6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_0800
     * @tc.name decimalToOctalPart03Test008
     * @tc.desc Verify toOctal(1000, Decimal.ROUND_DOWN) on new Decimal(512) returns 0o1p+9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(512).toOctal(1000, Decimal.ROUND_DOWN);
      expect(s).assertEqual("0o1p+9");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_0900
     * @tc.name decimalToOctalPart03Test009
     * @tc.desc Verify toOctal(20, Decimal.ROUND_HALF_UP) on new Decimal(1).div(3) produces a longer string than toOctal(10, Decimal.ROUND_HALF_UP)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = new Decimal(1).div(3).toOctal(20, Decimal.ROUND_HALF_UP);
      let b: string = new Decimal(1).div(3).toOctal(10, Decimal.ROUND_HALF_UP);
      let actual: boolean = a.length > b.length;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_1000
     * @tc.name decimalToOctalPart03Test010
     * @tc.desc Verify toOctal(30, Decimal.ROUND_DOWN) on new Decimal("0.1") produces a longer string than toOctal(10, Decimal.ROUND_DOWN)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = new Decimal("0.1").toOctal(30, Decimal.ROUND_DOWN);
      let b: string = new Decimal("0.1").toOctal(10, Decimal.ROUND_DOWN);
      let actual: boolean = a.length > b.length;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_1100
     * @tc.name decimalToOctalPart03Test011
     * @tc.desc Verify toOctal(1, Decimal.ROUND_HALF_UP) on new Decimal(0.5) returns 0o1p-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = new Decimal(0.5).toOctal(1, Decimal.ROUND_HALF_UP);
      let b: string = new Decimal(0.5).toOctal(1000, Decimal.ROUND_HALF_UP);
      expect(a).assertEqual(b);
      expect(a).assertEqual("0o1p-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_1200
     * @tc.name decimalToOctalPart03Test012
     * @tc.desc Verify toOctal(0, 4) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(42).toOctal(0, 4);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_1300
     * @tc.name decimalToOctalPart03Test013
     * @tc.desc Verify toOctal(-1, 4) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(42).toOctal(-1, 4);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_1400
     * @tc.name decimalToOctalPart03Test014
     * @tc.desc Verify toOctal(5.5, 4) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(42).toOctal(5.5, 4);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_1500
     * @tc.name decimalToOctalPart03Test015
     * @tc.desc Verify toOctal(2e9, 4) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(42).toOctal(2e9, 4);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_1600
     * @tc.name decimalToOctalPart03Test016
     * @tc.desc Verify toOctal(Double.NaN, 4) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(42).toOctal(Double.NaN, 4);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_1700
     * @tc.name decimalToOctalPart03Test017
     * @tc.desc Verify toOctal(Number.POSITIVE_INFINITY, 4) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(42).toOctal(Number.POSITIVE_INFINITY, 4);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_1800
     * @tc.name decimalToOctalPart03Test018
     * @tc.desc Verify toOctal(-Number.POSITIVE_INFINITY, 4) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(42).toOctal(-Number.POSITIVE_INFINITY, 4);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_1900
     * @tc.name decimalToOctalPart03Test019
     * @tc.desc Verify toOctal(1, Decimal.ROUND_UP) on new Decimal(5.5) returns 0o1p+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(5.5).toOctal(1, Decimal.ROUND_UP);
      expect(s).assertEqual("0o1p+3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_2000
     * @tc.name decimalToOctalPart03Test020
     * @tc.desc Verify toOctal(1, Decimal.ROUND_DOWN) on new Decimal(5.5) returns 0o1p+2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(5.5).toOctal(1, Decimal.ROUND_DOWN);
      expect(s).assertEqual("0o1p+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_2100
     * @tc.name decimalToOctalPart03Test021
     * @tc.desc Verify toOctal(1, Decimal.ROUND_CEILING) on new Decimal(5.5) returns 0o1p+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(5.5).toOctal(1, Decimal.ROUND_CEILING);
      expect(s).assertEqual("0o1p+3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_2200
     * @tc.name decimalToOctalPart03Test022
     * @tc.desc Verify toOctal(1, Decimal.ROUND_FLOOR) on new Decimal(5.5) returns 0o1p+2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(5.5).toOctal(1, Decimal.ROUND_FLOOR);
      expect(s).assertEqual("0o1p+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_2300
     * @tc.name decimalToOctalPart03Test023
     * @tc.desc Verify toOctal(1, Decimal.ROUND_HALF_UP) on new Decimal(5.5) returns 0o1p+2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(5.5).toOctal(1, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0o1p+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_2400
     * @tc.name decimalToOctalPart03Test024
     * @tc.desc Verify toOctal(1, Decimal.ROUND_HALF_DOWN) on new Decimal(5.5) returns 0o1p+2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(5.5).toOctal(1, Decimal.ROUND_HALF_DOWN);
      expect(s).assertEqual("0o1p+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_2500
     * @tc.name decimalToOctalPart03Test025
     * @tc.desc Verify toOctal(1, Decimal.ROUND_HALF_EVEN) on new Decimal(5.5) returns 0o1p+2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(5.5).toOctal(1, Decimal.ROUND_HALF_EVEN);
      expect(s).assertEqual("0o1p+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_2600
     * @tc.name decimalToOctalPart03Test026
     * @tc.desc Verify toOctal(1, Decimal.ROUND_HALF_CEILING) on new Decimal(5.5) returns 0o1p+2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(5.5).toOctal(1, Decimal.ROUND_HALF_CEILING);
      expect(s).assertEqual("0o1p+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_2700
     * @tc.name decimalToOctalPart03Test027
     * @tc.desc Verify toOctal(1, Decimal.ROUND_HALF_FLOOR) on new Decimal(5.5) returns 0o1p+2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(5.5).toOctal(1, Decimal.ROUND_HALF_FLOOR);
      expect(s).assertEqual("0o1p+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_2800
     * @tc.name decimalToOctalPart03Test028
     * @tc.desc Verify toOctal(1, Decimal.ROUND_UP) on new Decimal(-5.5) returns -0o1p+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-5.5).toOctal(1, Decimal.ROUND_UP);
      expect(s).assertEqual("-0o1p+3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_2900
     * @tc.name decimalToOctalPart03Test029
     * @tc.desc Verify toOctal(1, Decimal.ROUND_DOWN) on new Decimal(-5.5) returns -0o1p+2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-5.5).toOctal(1, Decimal.ROUND_DOWN);
      expect(s).assertEqual("-0o1p+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_3000
     * @tc.name decimalToOctalPart03Test030
     * @tc.desc Verify toOctal(1, Decimal.ROUND_CEILING) on new Decimal(-5.5) returns -0o1p+2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-5.5).toOctal(1, Decimal.ROUND_CEILING);
      expect(s).assertEqual("-0o1p+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_3100
     * @tc.name decimalToOctalPart03Test031
     * @tc.desc Verify toOctal(1, Decimal.ROUND_FLOOR) on new Decimal(-5.5) returns -0o1p+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-5.5).toOctal(1, Decimal.ROUND_FLOOR);
      expect(s).assertEqual("-0o1p+3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_3200
     * @tc.name decimalToOctalPart03Test032
     * @tc.desc Verify toOctal(1, Decimal.ROUND_HALF_EVEN) on new Decimal(-5.5) returns -0o1p+2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-5.5).toOctal(1, Decimal.ROUND_HALF_EVEN);
      expect(s).assertEqual("-0o1p+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_3300
     * @tc.name decimalToOctalPart03Test033
     * @tc.desc Verify toOctal(1, Decimal.ROUND_HALF_CEILING) on new Decimal(-5.5) returns -0o1p+2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-5.5).toOctal(1, Decimal.ROUND_HALF_CEILING);
      expect(s).assertEqual("-0o1p+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_3400
     * @tc.name decimalToOctalPart03Test034
     * @tc.desc Verify toOctal(1, Decimal.ROUND_HALF_FLOOR) on new Decimal(-5.5) returns -0o1p+2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-5.5).toOctal(1, Decimal.ROUND_HALF_FLOOR);
      expect(s).assertEqual("-0o1p+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_3500
     * @tc.name decimalToOctalPart03Test035
     * @tc.desc Verify toOctal(1, Decimal.ROUND_CEILING) on new Decimal(-42) returns -0o1p+5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-42).toOctal(1, Decimal.ROUND_CEILING);
      expect(s).assertEqual("-0o1p+5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_3600
     * @tc.name decimalToOctalPart03Test036
     * @tc.desc Verify toOctal(1, Decimal.ROUND_CEILING) on new Decimal(42) returns 0o1p+6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(42).toOctal(1, Decimal.ROUND_CEILING);
      expect(s).assertEqual("0o1p+6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_3700
     * @tc.name decimalToOctalPart03Test037
     * @tc.desc Verify toOctal(1, Decimal.ROUND_FLOOR) on new Decimal(-42) returns -0o1p+6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-42).toOctal(1, Decimal.ROUND_FLOOR);
      expect(s).assertEqual("-0o1p+6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_3800
     * @tc.name decimalToOctalPart03Test038
     * @tc.desc Verify toOctal(20, -1) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(42).toOctal(20, -1);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_3900
     * @tc.name decimalToOctalPart03Test039
     * @tc.desc Verify toOctal(20, 9) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(42).toOctal(20, 9);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_4000
     * @tc.name decimalToOctalPart03Test040
     * @tc.desc Verify toOctal(20, Decimal.ROUND_HALF_UP) on new Decimal(1) returns 0o1p+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1).toOctal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0o1p+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_4100
     * @tc.name decimalToOctalPart03Test041
     * @tc.desc Verify toOctal(20, Decimal.ROUND_HALF_UP) on new Decimal(2147483647) returns 0o1.7777777777p+30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(2147483647).toOctal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0o1.7777777777p+30");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_4200
     * @tc.name decimalToOctalPart03Test042
     * @tc.desc Verify toOctal(20, Decimal.ROUND_HALF_UP) on new Decimal(-1) returns -0o1p+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-1).toOctal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("-0o1p+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_4300
     * @tc.name decimalToOctalPart03Test043
     * @tc.desc Verify toOctal(40, Decimal.ROUND_HALF_UP) on new Decimal(-1000000) produces a string starting with -0o that round-trips to the absolute value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-1000000);
      let s: string = d.toOctal(40, Decimal.ROUND_HALF_UP);
      let actual: boolean = s.startsWith("-0o");
      expect(actual).assertTrue();
      let actual2: boolean = new Decimal(s.slice(1)).equals(d.abs());
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_4400
     * @tc.name decimalToOctalPart03Test044
     * @tc.desc Verify toOctal(40, Decimal.ROUND_HALF_UP) on new Decimal(-2147483648) produces a string starting with -0o that round-trips to the absolute value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-2147483648);
      let s: string = d.toOctal(40, Decimal.ROUND_HALF_UP);
      let actual: boolean = s.startsWith("-0o");
      expect(actual).assertTrue();
      let actual2: boolean = new Decimal(s.slice(1)).equals(d.abs());
      expect(actual2).assertTrue();
      expect(s).assertEqual("-0o1p+31");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_4500
     * @tc.name decimalToOctalPart03Test045
     * @tc.desc Verify toOctal(20, Decimal.ROUND_HALF_UP) on new Decimal(0) returns 0o0p+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0).toOctal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0o0p+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_4600
     * @tc.name decimalToOctalPart03Test046
     * @tc.desc Verify toOctal(20, Decimal.ROUND_HALF_UP) on new Decimal(-0) returns -0o0p+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-0).toOctal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("-0o0p+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_4700
     * @tc.name decimalToOctalPart03Test047
     * @tc.desc Verify toOctal(20, Decimal.ROUND_HALF_UP) on new Decimal('0') returns 0o0p+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal('0').toOctal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0o0p+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_4800
     * @tc.name decimalToOctalPart03Test048
     * @tc.desc Verify toOctal(20, Decimal.ROUND_HALF_UP) on new Decimal(0.5) returns 0o1p-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0.5).toOctal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0o1p-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_4900
     * @tc.name decimalToOctalPart03Test049
     * @tc.desc Verify toOctal(20, Decimal.ROUND_HALF_UP) on new Decimal(0.25) returns 0o1p-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0.25).toOctal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0o1p-2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_5000
     * @tc.name decimalToOctalPart03Test050
     * @tc.desc Verify toOctal(20, Decimal.ROUND_HALF_UP) on new Decimal(0.125) returns 0o1p-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0.125).toOctal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0o1p-3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_5100
     * @tc.name decimalToOctalPart03Test051
     * @tc.desc Verify toOctal(20, Decimal.ROUND_HALF_UP) on new Decimal(0.75) returns 0o1.4p-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0.75).toOctal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0o1.4p-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_5200
     * @tc.name decimalToOctalPart03Test052
     * @tc.desc Verify toOctal(20, Decimal.ROUND_HALF_UP) on new Decimal(0.0625) returns 0o1p-4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0.0625).toOctal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0o1p-4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_5300
     * @tc.name decimalToOctalPart03Test053
     * @tc.desc Verify toOctal(20, Decimal.ROUND_HALF_UP) on new Decimal(0.015625) returns 0o1p-6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0.015625).toOctal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0o1p-6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_5400
     * @tc.name decimalToOctalPart03Test054
     * @tc.desc Verify toOctal(20, Decimal.ROUND_HALF_UP) on new Decimal(1.5) returns 0o1.4p+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.5).toOctal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0o1.4p+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_5500
     * @tc.name decimalToOctalPart03Test055
     * @tc.desc Verify toOctal(20, Decimal.ROUND_HALF_UP) on new Decimal(3.5) returns 0o1.6p+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(3.5).toOctal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0o1.6p+1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_5600
     * @tc.name decimalToOctalPart03Test056
     * @tc.desc Verify toOctal(20, Decimal.ROUND_HALF_UP) on new Decimal(42.5) returns 0o1.25p+5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(42.5).toOctal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0o1.25p+5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_5700
     * @tc.name decimalToOctalPart03Test057
     * @tc.desc Verify toOctal(20, Decimal.ROUND_HALF_UP) on new Decimal(-0.5) returns -0o1p-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-0.5).toOctal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("-0o1p-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_5800
     * @tc.name decimalToOctalPart03Test058
     * @tc.desc Verify toOctal(20, Decimal.ROUND_HALF_UP) on new Decimal(-6.25) returns -0o1.44p+2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-6.25).toOctal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("-0o1.44p+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_5900
     * @tc.name decimalToOctalPart03Test059
     * @tc.desc Verify toOctal(20, Decimal.ROUND_HALF_UP) on new Decimal(6.25) returns 0o1.44p+2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(6.25).toOctal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0o1.44p+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_6000
     * @tc.name decimalToOctalPart03Test060
     * @tc.desc Verify toOctal(20, Decimal.ROUND_HALF_UP) on new Decimal("1e2") returns 0o1.44p+6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1e2").toOctal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0o1.44p+6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_6100
     * @tc.name decimalToOctalPart03Test061
     * @tc.desc Verify toOctal(20, Decimal.ROUND_HALF_UP) on new Decimal("1.5e2") returns 0o1.13p+7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.5e2").toOctal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0o1.13p+7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_6200
     * @tc.name decimalToOctalPart03Test062
     * @tc.desc Verify toOctal(20, Decimal.ROUND_HALF_UP) on new Decimal("-2.5e2") returns -0o1.75p+7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("-2.5e2").toOctal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("-0o1.75p+7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_6300
     * @tc.name decimalToOctalPart03Test063
     * @tc.desc Verify toOctal(30, Decimal.ROUND_HALF_UP) on new Decimal("1e-1") produces a longer string than toOctal(10, Decimal.ROUND_HALF_UP)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = new Decimal("1e-1").toOctal(30, Decimal.ROUND_HALF_UP);
      let b: string = new Decimal("1e-1").toOctal(10, Decimal.ROUND_HALF_UP);
      let actual: boolean = a.length > b.length;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_6400
     * @tc.name decimalToOctalPart03Test064
     * @tc.desc Verify toOctal(20, Decimal.ROUND_HALF_UP) on new Decimal("0x10") returns 0o1p+4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("0x10").toOctal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0o1p+4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_6500
     * @tc.name decimalToOctalPart03Test065
     * @tc.desc Verify toOctal(20, Decimal.ROUND_HALF_UP) on new Decimal("0b101") returns 0o1.2p+2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("0b101").toOctal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0o1.2p+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_6600
     * @tc.name decimalToOctalPart03Test066
     * @tc.desc Verify toOctal(20, Decimal.ROUND_HALF_UP) on new Decimal("0o7") returns 0o1.6p+2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("0o7").toOctal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0o1.6p+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART03_6700
     * @tc.name decimalToOctalPart03Test067
     * @tc.desc Verify toOctal(20, Decimal.ROUND_HALF_UP) on new Decimal("0123") returns 0o1.73p+6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart03Test067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("0123").toOctal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0o1.73p+6");
    });
  });
}