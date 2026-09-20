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

export default function decimalToHexadecimalPart03Test(): void {
  describe("DecimalToHexadecimalPart03Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_0100
     * @tc.name decimalToHexadecimalPart03Test001
     * @tc.desc Verify toHexadecimal(20, Decimal.ROUND_HALF_UP) on new Decimal(0.75) returns 0x1.8p-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart03Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0.75).toHexadecimal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0x1.8p-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_0200
     * @tc.name decimalToHexadecimalPart03Test002
     * @tc.desc Verify toHexadecimal(20, Decimal.ROUND_HALF_UP) on new Decimal(1.5) returns 0x1.8p+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart03Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.5).toHexadecimal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0x1.8p+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_0300
     * @tc.name decimalToHexadecimalPart03Test003
     * @tc.desc Verify toHexadecimal(20, Decimal.ROUND_HALF_UP) on new Decimal(-0.5) returns -0x1p-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart03Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-0.5).toHexadecimal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("-0x1p-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_0400
     * @tc.name decimalToHexadecimalPart03Test004
     * @tc.desc Verify toHexadecimal(20, Decimal.ROUND_HALF_UP) on new Decimal("1e2") returns 0x1.9p+6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart03Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1e2").toHexadecimal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0x1.9p+6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_0500
     * @tc.name decimalToHexadecimalPart03Test005
     * @tc.desc Verify toHexadecimal(20, Decimal.ROUND_HALF_UP) on new Decimal("1.5e2") returns 0x1.2cp+7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart03Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.5e2").toHexadecimal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0x1.2cp+7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_0600
     * @tc.name decimalToHexadecimalPart03Test006
     * @tc.desc Verify toHexadecimal(20, Decimal.ROUND_HALF_UP) on new Decimal("-2.5e2") returns -0x1.f4p+7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart03Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("-2.5e2").toHexadecimal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("-0x1.f4p+7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_0700
     * @tc.name decimalToHexadecimalPart03Test007
     * @tc.desc Verify toHexadecimal(30, Decimal.ROUND_HALF_UP) on new Decimal("1e-1")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart03Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = new Decimal("1e-1").toHexadecimal(30, Decimal.ROUND_HALF_UP);
      expect(a).assertEqual("0x1.9999999999999999999999999999ap-4");
      let b: string = new Decimal("1e-1").toHexadecimal(10, Decimal.ROUND_HALF_UP);
      expect(b).assertEqual("0x1.99999999ap-4");
      let actual: boolean = a.length > b.length;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_0800
     * @tc.name decimalToHexadecimalPart03Test008
     * @tc.desc Verify toHexadecimal(20, Decimal.ROUND_HALF_UP) on new Decimal("0x10") returns 0x1p+4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart03Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("0x10").toHexadecimal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0x1p+4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_0900
     * @tc.name decimalToHexadecimalPart03Test009
     * @tc.desc Verify toHexadecimal(20, Decimal.ROUND_HALF_UP) on new Decimal("0b101") returns 0x1.4p+2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart03Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("0b101").toHexadecimal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0x1.4p+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_1000
     * @tc.name decimalToHexadecimalPart03Test010
     * @tc.desc Verify toHexadecimal(20, Decimal.ROUND_HALF_UP) on new Decimal("0o17") returns 0x1.ep+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart03Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("0o17").toHexadecimal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0x1.ep+3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_1100
     * @tc.name decimalToHexadecimalPart03Test011
     * @tc.desc Verify toHexadecimal(20, Decimal.ROUND_HALF_UP) on new Decimal("0177") returns 0x1.62p+7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart03Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("0177").toHexadecimal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0x1.62p+7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_1200
     * @tc.name decimalToHexadecimalPart03Test012
     * @tc.desc Verify toHexadecimal(20, Decimal.ROUND_HALF_UP) on new Decimal(0xff) returns 0x1.fep+7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart03Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0xff).toHexadecimal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0x1.fep+7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_1300
     * @tc.name decimalToHexadecimalPart03Test013
     * @tc.desc Verify toHexadecimal(20, Decimal.ROUND_HALF_UP) on new Decimal(0b1010) returns 0x1.4p+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart03Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0b1010).toHexadecimal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0x1.4p+3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_1400
     * @tc.name decimalToHexadecimalPart03Test014
     * @tc.desc Verify toHexadecimal(20, Decimal.ROUND_HALF_UP) on new Decimal(0o17) returns 0x1.ep+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart03Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0o17).toHexadecimal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0x1.ep+3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_1500
     * @tc.name decimalToHexadecimalPart03Test015
     * @tc.desc Verify NaN toHexadecimal "NaN"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart03Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(Double.NaN).toHexadecimal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("NaN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_1600
     * @tc.name decimalToHexadecimalPart03Test016
     * @tc.desc Verify "NaN" toHexadecimal "NaN"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart03Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("NaN").toHexadecimal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("NaN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_1700
     * @tc.name decimalToHexadecimalPart03Test017
     * @tc.desc Verify Infinity toHexadecimal "Infinity"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart03Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(Number.POSITIVE_INFINITY).toHexadecimal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_1800
     * @tc.name decimalToHexadecimalPart03Test018
     * @tc.desc Verify "Infinity" toHexadecimal "Infinity"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart03Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("Infinity").toHexadecimal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_1900
     * @tc.name decimalToHexadecimalPart03Test019
     * @tc.desc Verify -Infinity toHexadecimal "-Infinity"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart03Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-Number.POSITIVE_INFINITY).toHexadecimal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("-Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_2000
     * @tc.name decimalToHexadecimalPart03Test020
     * @tc.desc Verify "-Infinity" toHexadecimal "-Infinity"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart03Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("-Infinity").toHexadecimal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("-Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_2100
     * @tc.name decimalToHexadecimalPart03Test021
     * @tc.desc Verify toHexadecimal(20, Decimal.ROUND_HALF_UP) on new Decimal(1.7976931348623157e+308)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart03Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = new Decimal(1.7976931348623157e308).toHexadecimal(20, Decimal.ROUND_HALF_UP);
      expect(a).assertEqual("0x1.ffffffffffffef58d65p+1023");
      let b: string = new Decimal(1).toHexadecimal(20, Decimal.ROUND_HALF_UP);
      expect(b).assertEqual("0x1p+0");
      let actual: boolean = a.length > b.length;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_2200
     * @tc.name decimalToHexadecimalPart03Test022
     * @tc.desc Verify toHexadecimal(20, Decimal.ROUND_HALF_UP) on new Decimal(5e-324)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart03Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = new Decimal(5e-324).toHexadecimal(20, Decimal.ROUND_HALF_UP);
      expect(a).assertEqual("0x1.03132b9cf541c364e68p-1074");
      let b: string = new Decimal(0).toHexadecimal(20, Decimal.ROUND_HALF_UP);
      expect(b).assertEqual("0x0p+0");
      let actual: boolean = a.length > b.length;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_2300
     * @tc.name decimalToHexadecimalPart03Test023
     * @tc.desc Verify toHexadecimal(30, Decimal.ROUND_HALF_UP) on new Decimal(0.1 + 0.2) returns 0x1.3333333333333ebaadd6569d7e77cp-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart03Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let da: Decimal = new Decimal(0.1 + 0.2);
      let db: Decimal = new Decimal("0.3");
      let actual: boolean = da.greaterThan(db);
      expect(actual).assertTrue();
      let sa: string = da.toHexadecimal(30, Decimal.ROUND_HALF_UP);
      expect(sa).assertEqual("0x1.3333333333333ebaadd6569d7e77cp-2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_2400
     * @tc.name decimalToHexadecimalPart03Test024
     * @tc.desc Verify toHexadecimal(20, Decimal.ROUND_HALF_UP) on new Decimal(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart03Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(5).toHexadecimal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0x1.4p+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_2500
     * @tc.name decimalToHexadecimalPart03Test025
     * @tc.desc Verify toHexadecimal(20, Decimal.ROUND_HALF_UP) on new Decimal(-5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart03Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-5).toHexadecimal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("-0x1.4p+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_2600
     * @tc.name decimalToHexadecimalPart03Test026
     * @tc.desc Verify toHexadecimal(20, Decimal.ROUND_HALF_UP) on new Decimal(42)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart03Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(42).toHexadecimal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0x1.5p+5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_2700
     * @tc.name decimalToHexadecimalPart03Test027
     * @tc.desc Verify toHexadecimal(20, Decimal.ROUND_HALF_UP) on new Decimal(10) returns 0x1.4p+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart03Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = new Decimal(10).toHexadecimal(20, Decimal.ROUND_HALF_UP);
      expect(a).assertEqual("0x1.4p+3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_2800
     * @tc.name decimalToHexadecimalPart03Test028
     * @tc.desc Verify toHexadecimal(20, Decimal.ROUND_HALF_UP) on new Decimal(255) returns 0x1.fep+7 and toString 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart03Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(255);
      let s: string = d.toHexadecimal(20, Decimal.ROUND_HALF_UP);
      let actual: string = d.toString();
      let expected: string = "255";
      expect(actual).assertEqual(expected);
      expect(s).assertEqual("0x1.fep+7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_2900
     * @tc.name decimalToHexadecimalPart03Test029
     * @tc.desc Verify toHexadecimal(30, Decimal.ROUND_HALF_UP) on new Decimal(0.75)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart03Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0.75).toHexadecimal(30, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0x1.8p-1");
      let actual: boolean = new Decimal(s).equals(new Decimal(0.75));
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_3000
     * @tc.name decimalToHexadecimalPart03Test030
     * @tc.desc Verify toHexadecimal(20, Decimal.ROUND_HALF_UP) on new Decimal(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart03Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0).toHexadecimal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0x0p+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_3100
     * @tc.name decimalToHexadecimalPart03Test031
     * @tc.desc Verify toHexadecimal(1000, Decimal.ROUND_HALF_UP) on new Decimal(15) returns 0x1.ep+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart03Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(15).toHexadecimal(1000, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0x1.ep+3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_3200
     * @tc.name decimalToHexadecimalPart03Test032
     * @tc.desc Verify toHexadecimal(1, Decimal.ROUND_UP) on new Decimal(255) returns 0x1p+8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart03Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let s: string = new Decimal(255).toHexadecimal(1, Decimal.ROUND_UP);
      Decimal.set({ defaults: true });
      expect(s).assertEqual("0x1p+8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_3300
     * @tc.name decimalToHexadecimalPart03Test033
     * @tc.desc Verify toHexadecimal(20, 4) on new Decimal(10) returns 0x1.4p+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart03Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 5 });
      let s: string = new Decimal(10).toHexadecimal(20, 4);
      Decimal.set({ defaults: true });
      expect(s).assertEqual("0x1.4p+3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_3400
     * @tc.name decimalToHexadecimalPart03Test034
     * @tc.desc Verify toHexadecimal(0, 4) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart03Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(255);
      try {
        d.toHexadecimal(0, 4);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
      }
      let actual2: string = d.toString();
      let expected2: string = "255";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_3500
     * @tc.name decimalToHexadecimalPart03Test035
     * @tc.desc Verify toHexadecimal(20, -1) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart03Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(42);
      try {
        d.toHexadecimal(20, -1);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      let actual: number = d.comparedTo(new Decimal(42));
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_3600
     * @tc.name decimalToHexadecimalPart03Test036
     * @tc.desc Verify toHexadecimal(-1, 4) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart03Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(42);
      try {
        d.toHexadecimal(-1, 4);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_3700
     * @tc.name decimalToHexadecimalPart03Test037
     * @tc.desc Verify toHexadecimal(20, 9) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart03Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(42);
      try {
        d.toHexadecimal(20, 9);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_3800
     * @tc.name decimalToHexadecimalPart03Test038
     * @tc.desc Verify toHexadecimal(2e9, 4) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart03Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(42);
      try {
        d.toHexadecimal(2e9, 4);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
      }
      let actual2: string = d.toString();
      let expected2: string = "42";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_3900
     * @tc.name decimalToHexadecimalPart03Test039
     * @tc.desc Verify toHexadecimal throws BusinessError and returns 0x1.cp+2 for 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart03Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Decimal = new Decimal(42);
      let d2: Decimal = new Decimal(7);
      try {
        d1.toHexadecimal(5.5, 4);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      let actual: string = d2.toHexadecimal(20, 4);
      let expected: string = "0x1.cp+2";
      expect(actual).assertEqual(expected);
    });
  });
}