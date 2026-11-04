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
} from "@ohos/hypium-static/src/main/indexStatic";
import { BusinessError } from '@ohos.base';
import Utils from "../Util.test";
import { Decimal } from "@kit.ArkTS";
import { BusinessError } from "@ohos.base";

export default function decimalToHexadecimalPart01Test(): void {
  describe("DecimalToHexadecimalPart01Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_0100
     * @tc.name decimalToHexadecimalPart01Test001
     * @tc.desc Verify toHexadecimal(10) on new Decimal(255) returns 0x1.fep+7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hex: string = new Decimal(255).toHexadecimal(10);
      expect(hex).assertEqual("0x1.fep+7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_0200
     * @tc.name decimalToHexadecimalPart01Test002
     * @tc.desc Verify toHexadecimal(sd) on new Decimal(255) returns 0x1p+8 and length 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sd: double = 1;
      let hex: string = new Decimal(255).toHexadecimal(sd);
      expect(hex).assertEqual("0x1p+8");
      let actual: int = hex.length;
      let expected: int = 6;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_0300
     * @tc.name decimalToHexadecimalPart01Test003
     * @tc.desc Verify toHexadecimal(2) on new Decimal(255.7) returns 0x1p+8 with exponent at index 3 and length 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hex: string = new Decimal(255.7).toHexadecimal(2);
      expect(hex).assertEqual("0x1p+8");
      let actual: int = hex.indexOf("p+8");
      let expected: int = 3;
      expect(actual).assertEqual(expected);
      let actual2: int = hex.length;
      let expected2: int = 6;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_0400
     * @tc.name decimalToHexadecimalPart01Test004
     * @tc.desc Verify toHexadecimal(4) on new Decimal(255.7) returns 0x1.ff6p+7 and length 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hex: string = new Decimal(255.7).toHexadecimal(4);
      expect(hex).assertEqual("0x1.ff6p+7");
      let actual: int = hex.length;
      let expected: int = 10;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_0500
     * @tc.name decimalToHexadecimalPart01Test005
     * @tc.desc Verify toHexadecimal(2) on new Decimal(5) returns 0x1.4p+2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hex: string = new Decimal(5).toHexadecimal(2);
      expect(hex).assertEqual("0x1.4p+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_0600
     * @tc.name decimalToHexadecimalPart01Test006
     * @tc.desc Verify toHexadecimal(2) on new Decimal(3) returns 0x1.8p+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hex: string = new Decimal(3).toHexadecimal(2);
      expect(hex).assertEqual("0x1.8p+1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_0700
     * @tc.name decimalToHexadecimalPart01Test007
     * @tc.desc Verify toHexadecimal(1) on new Decimal(1) returns 0x1p+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hex: string = new Decimal(1).toHexadecimal(1);
      expect(hex).assertEqual("0x1p+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_0800
     * @tc.name decimalToHexadecimalPart01Test008
     * @tc.desc Verify toHexadecimal(10) on new Decimal(255.7)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hex: string = new Decimal(255.7).toHexadecimal(10);
      expect(hex).assertEqual("0x1.ff6666666p+7");
      let shortHex: string = new Decimal(255.7).toHexadecimal(2);
      expect(shortHex).assertEqual("0x1p+8");
      let actual: boolean = hex.length > shortHex.length;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_0900
     * @tc.name decimalToHexadecimalPart01Test009
     * @tc.desc Verify toHexadecimal(3) on new Decimal(16) returns hexBig
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hex: string = new Decimal(16).toHexadecimal(3);
      expect(hex).assertEqual("0x1p+4");
      let hexBig: string = new Decimal(16).toHexadecimal(10);
      expect(hexBig).assertEqual("0x1p+4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_1000
     * @tc.name decimalToHexadecimalPart01Test010
     * @tc.desc Verify toHexadecimal(10) on new Decimal(-255) returns -0x1.fep+7 and char at 5 is f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hex: string = new Decimal(-255).toHexadecimal(10);
      expect(hex).assertEqual("-0x1.fep+7");
      let actual: string = hex.substring(5, 6);
      let expected: string = 'f';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_1100
     * @tc.name decimalToHexadecimalPart01Test011
     * @tc.desc Verify toHexadecimal(10) on new Decimal(-16) returns -0x1p+4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hex: string = new Decimal(-16).toHexadecimal(10);
      expect(hex).assertEqual("-0x1p+4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_1200
     * @tc.name decimalToHexadecimalPart01Test012
     * @tc.desc Verify toHexadecimal(10) on new Decimal(-0.5) returns -0x1p-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hex: string = new Decimal(-0.5).toHexadecimal(10);
      expect(hex).assertEqual("-0x1p-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_1300
     * @tc.name decimalToHexadecimalPart01Test013
     * @tc.desc Verify toHexadecimal(10) on new Decimal(0.5) returns 0x1p-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hex: string = new Decimal(0.5).toHexadecimal(10);
      expect(hex).assertEqual("0x1p-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_1400
     * @tc.name decimalToHexadecimalPart01Test014
     * @tc.desc Verify toHexadecimal(10) on new Decimal(0.25) returns 0x1p-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hex: string = new Decimal(0.25).toHexadecimal(10);
      expect(hex).assertEqual("0x1p-2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_1500
     * @tc.name decimalToHexadecimalPart01Test015
     * @tc.desc Verify toHexadecimal(10) on new Decimal(0.125) returns 0x1p-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hex: string = new Decimal(0.125).toHexadecimal(10);
      expect(hex).assertEqual("0x1p-3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_1600
     * @tc.name decimalToHexadecimalPart01Test016
     * @tc.desc Verify toHexadecimal(10) on new Decimal(0.75) returns 0x1.8p-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hex: string = new Decimal(0.75).toHexadecimal(10);
      expect(hex).assertEqual("0x1.8p-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_1700
     * @tc.name decimalToHexadecimalPart01Test017
     * @tc.desc Verify toHexadecimal(10) on new Decimal(15) returns 0x1.ep+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hex: string = new Decimal(15).toHexadecimal(10);
      expect(hex).assertEqual("0x1.ep+3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_1800
     * @tc.name decimalToHexadecimalPart01Test018
     * @tc.desc Verify toHexadecimal(10) on new Decimal(1.5) returns 0x1.8p+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hex: string = new Decimal(1.5).toHexadecimal(10);
      expect(hex).assertEqual("0x1.8p+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_1900
     * @tc.name decimalToHexadecimalPart01Test019
     * @tc.desc Verify toHexadecimal(10) on new Decimal(-1) returns -0x1p+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hex: string = new Decimal(-1).toHexadecimal(10);
      expect(hex).assertEqual("-0x1p+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_2000
     * @tc.name decimalToHexadecimalPart01Test020
     * @tc.desc Verify toHexadecimal(10) on new Decimal("16") returns 0x1p+4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hex: string = new Decimal("16").toHexadecimal(10);
      expect(hex).assertEqual("0x1p+4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_2100
     * @tc.name decimalToHexadecimalPart01Test021
     * @tc.desc Verify toHexadecimal(10) on new Decimal("255") returns 0x1.fep+7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hex: string = new Decimal("255").toHexadecimal(10);
      expect(hex).assertEqual("0x1.fep+7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_2200
     * @tc.name decimalToHexadecimalPart01Test022
     * @tc.desc Verify toHexadecimal(10) on new Decimal(4294967295) returns 0x1.fffffffep+31
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hex: string = new Decimal(4294967295).toHexadecimal(10);
      expect(hex).assertEqual("0x1.fffffffep+31");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_2300
     * @tc.name decimalToHexadecimalPart01Test023
     * @tc.desc Verify toHexadecimal(10) on new Decimal(0.00390625) returns 0x1p-8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hex: string = new Decimal(0.00390625).toHexadecimal(10);
      expect(hex).assertEqual("0x1p-8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_2400
     * @tc.name decimalToHexadecimalPart01Test024
     * @tc.desc Verify toHexadecimal(10) on new Decimal(255.7) returns 0x1.ff6666666p+7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hex: string = new Decimal(255.7).toHexadecimal(10);
      expect(hex).assertEqual("0x1.ff6666666p+7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_2500
     * @tc.name decimalToHexadecimalPart01Test025
     * @tc.desc Verify toHexadecimal(10) on new Decimal("1e5") returns 0x1.86ap+16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1e5");
      let hex: string = d.toHexadecimal(10);
      expect(hex).assertEqual("0x1.86ap+16");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_2600
     * @tc.name decimalToHexadecimalPart01Test026
     * @tc.desc Verify toHexadecimal(10) on new Decimal("1.23e-4") returns 13
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.23e-4");
      let hex: string = d.toHexadecimal(10);
      let actual: int = hex.indexOf("p-");
      let expected: int = 13;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_2700
     * @tc.name decimalToHexadecimalPart01Test027
     * @tc.desc Verify toHexadecimal(10) on new Decimal("1e15") returns 13
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1e15");
      let hex: string = d.toHexadecimal(10);
      let actual: int = hex.indexOf("p+49");
      let expected: int = 13;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_2800
     * @tc.name decimalToHexadecimalPart01Test028
     * @tc.desc Verify toHexadecimal(10) on new Decimal(0.1) returns 0x1.99999999ap-4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hex: string = new Decimal(0.1).toHexadecimal(10);
      expect(hex).assertEqual("0x1.99999999ap-4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_2900
     * @tc.name decimalToHexadecimalPart01Test029
     * @tc.desc Verify toHexadecimal(10) on new Decimal(0.2) returns 0x1.99999999ap-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hex: string = new Decimal(0.2).toHexadecimal(10);
      expect(hex).assertEqual("0x1.99999999ap-3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_3000
     * @tc.name decimalToHexadecimalPart01Test030
     * @tc.desc Verify toHexadecimal(10) on new Decimal(0) returns 0x0p+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hex: string = new Decimal(0).toHexadecimal(10);
      expect(hex).assertEqual("0x0p+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_3100
     * @tc.name decimalToHexadecimalPart01Test031
     * @tc.desc Verify toHexadecimal(10) on new Decimal(-0) returns -0x0p+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hex: string = new Decimal(-0).toHexadecimal(10);
      expect(hex).assertEqual("-0x0p+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_3200
     * @tc.name decimalToHexadecimalPart01Test032
     * @tc.desc Verify toHexadecimal(2) on new Decimal(0) returns 0x0p+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hex: string = new Decimal(0).toHexadecimal(2);
      expect(hex).assertEqual("0x0p+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_3300
     * @tc.name decimalToHexadecimalPart01Test033
     * @tc.desc Verify toHexadecimal(10) on new Decimal('0') returns 0x0p+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hex: string = new Decimal('0').toHexadecimal(10);
      expect(hex).assertEqual("0x0p+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_3400
     * @tc.name decimalToHexadecimalPart01Test034
     * @tc.desc Verify toHexadecimal(10) on new Decimal(Double.NaN) returns Double.NaN and starts with Na
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hex: string = new Decimal(Double.NaN).toHexadecimal(10);
      expect(hex).assertEqual("NaN");
      let actual: string = hex.substring(0, 2);
      let expected: string = "Na";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_3500
     * @tc.name decimalToHexadecimalPart01Test035
     * @tc.desc Verify toHexadecimal(10) on new Decimal(Number.POSITIVE_INFINITY) returns Number.POSITIVE_INFINITY and uppercased i...
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hex: string = new Decimal(Number.POSITIVE_INFINITY).toHexadecimal(10);
      expect(hex).assertEqual("Infinity");
      let actual: string = hex.toUpperCase();
      let expected: string = "INFINITY";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_3600
     * @tc.name decimalToHexadecimalPart01Test036
     * @tc.desc Verify toHexadecimal(10) on new Decimal(-Number.POSITIVE_INFINITY) returns -Number.POSITIVE_INFINITY and starts with -
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hex: string = new Decimal(-Number.POSITIVE_INFINITY).toHexadecimal(10);
      expect(hex).assertEqual("-Infinity");
      let actual: string = hex.substring(0, 1);
      let expected: string = '-';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_3700
     * @tc.name decimalToHexadecimalPart01Test037
     * @tc.desc Verify toHexadecimal(sd) on new Decimal(16) returns 0x1p+4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sd: double = 1000;
      let hex: string = new Decimal(16).toHexadecimal(sd);
      expect(hex).assertEqual("0x1p+4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_3800
     * @tc.name decimalToHexadecimalPart01Test038
     * @tc.desc Verify toHexadecimal(10) on new Decimal(255) does not mutate the original Decimal; toString() still returns 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(255);
      d.toHexadecimal(10);
      let actual: string = d.toString();
      let expected: string = "255";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_3900
     * @tc.name decimalToHexadecimalPart01Test039
     * @tc.desc Verify toHexadecimal throws on sd=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(255).toHexadecimal(0);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_4000
     * @tc.name decimalToHexadecimalPart01Test040
     * @tc.desc Verify toHexadecimal throws on sd=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(255).toHexadecimal(-1);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_4100
     * @tc.name decimalToHexadecimalPart01Test041
     * @tc.desc Verify toHexadecimal throws on sd=1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(255).toHexadecimal(1.5);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_4200
     * @tc.name decimalToHexadecimalPart01Test042
     * @tc.desc Verify toHexadecimal throws on sd=1000000001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(255).toHexadecimal(1e9 + 1);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_4300
     * @tc.name decimalToHexadecimalPart01Test043
     * @tc.desc Verify toHexadecimal throws on sd=NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(255).toHexadecimal(Double.NaN);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_4400
     * @tc.name decimalToHexadecimalPart01Test044
     * @tc.desc Verify toHexadecimal throws on sd=POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(255).toHexadecimal(Number.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_4500
     * @tc.name decimalToHexadecimalPart01Test045
     * @tc.desc Verify toHexadecimal throws on sd=-POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(255).toHexadecimal(-Number.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_4600
     * @tc.name decimalToHexadecimalPart01Test046
     * @tc.desc Verify precision toHexadecimal ROUND_HALF_UP
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 30 });
      let hex: string = new Decimal(255.7).toHexadecimal(10);
      Decimal.set({ defaults: true });
      expect(hex).assertEqual("0x1.ff6666666p+7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_4700
     * @tc.name decimalToHexadecimalPart01Test047
     * @tc.desc Verify toHexadecimal(10) on new Decimal(255.7) returns 0x1.ff6666666p+7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ defaults: true });
      let hex: string = new Decimal(255.7).toHexadecimal(10);
      expect(hex).assertEqual("0x1.ff6666666p+7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_4800
     * @tc.name decimalToHexadecimalPart01Test048
     * @tc.desc Verify toHexadecimal(10) on new Decimal(255) returns 0x1.fep+7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart01Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 50 });
      new Decimal(255).toHexadecimal(10);
      Decimal.set({ defaults: true });
      let hex: string = new Decimal(255).toHexadecimal(10);
      expect(hex).assertEqual("0x1.fep+7");
    });
  });
}