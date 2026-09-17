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
import { BusinessError } from "@ohos.base";

export default function decimalToOctalPart02Test(): void {
  describe("DecimalToOctalPart02Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART02_0100
     * @tc.name decimalToOctalPart02Test001
     * @tc.desc Verify toOctal(10) on new Decimal(-9.9) returns -0o1.171463146p+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart02Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-9.9);
      let s: string = d.toOctal(10);
      expect(s).assertEqual("-0o1.171463146p+3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART02_0200
     * @tc.name decimalToOctalPart02Test002
     * @tc.desc Verify toOctal(5) on new Decimal(-64.3) returns -0o1.0023p+6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart02Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-64.3);
      let s: string = d.toOctal(5);
      expect(s).assertEqual("-0o1.0023p+6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART02_0300
     * @tc.name decimalToOctalPart02Test003
     * @tc.desc Verify toOctal(5) on new Decimal(0.5) returns 0o1p-1 and on new Decimal(-0.5) returns -0o1p-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart02Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Decimal = new Decimal(0.5);
      let d2: Decimal = new Decimal(-0.5);
      let s1: string = d1.toOctal(5);
      let s2: string = d2.toOctal(5);
      expect(s1).assertEqual("0o1p-1");
      expect(s2).assertEqual("-0o1p-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART02_0400
     * @tc.name decimalToOctalPart02Test004
     * @tc.desc Verify toOctal(5) on new Decimal("-8.5") returns -0o1.04p+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart02Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("-8.5");
      let s: string = d.toOctal(5);
      expect(s).assertEqual("-0o1.04p+3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART02_0500
     * @tc.name decimalToOctalPart02Test005
     * @tc.desc Verify toOctal(10) on new Decimal("NaN") returns Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart02Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("NaN");
      let s: string = d.toOctal(10);
      expect(s).assertEqual("NaN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART02_0600
     * @tc.name decimalToOctalPart02Test006
     * @tc.desc Verify toOctal(10) on new Decimal("Infinity") returns Number.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart02Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("Infinity");
      let s: string = d.toOctal(10);
      expect(s).assertEqual("Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART02_0700
     * @tc.name decimalToOctalPart02Test007
     * @tc.desc Verify toOctal(10) on new Decimal("-Infinity") returns -Number.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart02Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("-Infinity");
      let s: string = d.toOctal(10);
      expect(s).assertEqual("-Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART02_0800
     * @tc.name decimalToOctalPart02Test008
     * @tc.desc Verify toOctal(10) on new Decimal(Double.NaN) returns Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart02Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(Double.NaN);
      let s: string = d.toOctal(10);
      expect(s).assertEqual("NaN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART02_0900
     * @tc.name decimalToOctalPart02Test009
     * @tc.desc Verify toOctal(10) on new Decimal(Number.POSITIVE_INFINITY) returns Number.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart02Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(Number.POSITIVE_INFINITY);
      let s: string = d.toOctal(10);
      expect(s).assertEqual("Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART02_1000
     * @tc.name decimalToOctalPart02Test010
     * @tc.desc Verify toOctal(10) on new Decimal(Number.NEGATIVE_INFINITY) returns -Number.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart02Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(Number.NEGATIVE_INFINITY);
      let s: string = d.toOctal(10);
      expect(s).assertEqual("-Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART02_1100
     * @tc.name decimalToOctalPart02Test011
     * @tc.desc Verify toOctal(10) on new Decimal(5e-324) returns 0o1.006114535p-1074
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart02Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(5e-324);
      let s: string = d.toOctal(10);
      expect(s).assertEqual("0o1.006114535p-1074");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART02_1200
     * @tc.name decimalToOctalPart02Test012
     * @tc.desc Verify toOctal(10) on new Decimal(1.7976931348623157e+308) returns 0o1p+1024
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart02Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(1.7976931348623157e308);
      let s: string = d.toOctal(10);
      expect(s).assertEqual("0o1p+1024");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART02_1300
     * @tc.name decimalToOctalPart02Test013
     * @tc.desc Verify toOctal(10) on new Decimal(64) returns string of length 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart02Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(64);
      let s: string = d.toOctal(10);
      let actual: int = s.length;
      let expected: int = 6;
      expect(actual).assertEqual(expected);
      expect(s).assertEqual("0o1p+6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART02_1400
     * @tc.name decimalToOctalPart02Test014
     * @tc.desc Verify toOctal(10) on new Decimal(-64) returns string starting with '-'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart02Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-64);
      let s: string = d.toOctal(10);
      let actual: boolean = s.startsWith('-');
      expect(actual).assertTrue();
      expect(s).assertEqual("-0o1p+6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART02_1500
     * @tc.name decimalToOctalPart02Test015
     * @tc.desc Verify toOctal(10) on new Decimal(0.1) returns 13
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart02Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0.1);
      let s: string = d.toOctal(10);
      let actual: int = s.indexOf("p-");
      let expected: int = 13;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART02_1600
     * @tc.name decimalToOctalPart02Test016
     * @tc.desc Verify toOctal(10) on new Decimal(1000) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart02Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(1000);
      let s: string = d.toOctal(10);
      let actual: number = s.indexOf("1.");
      let expected: int = 2;
      expect(actual).assertEqual(expected);
      expect(s).assertEqual("0o1.75p+9");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART02_1700
     * @tc.name decimalToOctalPart02Test017
     * @tc.desc Verify toOctal(10) on new Decimal("0b101") returns 0o1.2p+2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart02Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("0b101");
      let s: string = d.toOctal(10);
      expect(s).assertEqual("0o1.2p+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART02_1800
     * @tc.name decimalToOctalPart02Test018
     * @tc.desc Verify toOctal(10) on new Decimal("0x10") returns 0o1p+4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart02Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("0x10");
      let s: string = d.toOctal(10);
      expect(s).assertEqual("0o1p+4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART02_1900
     * @tc.name decimalToOctalPart02Test019
     * @tc.desc Verify toOctal(10) on new Decimal("0o10") returns 0o1p+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart02Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("0o10");
      let s: string = d.toOctal(10);
      expect(s).assertEqual("0o1p+3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART02_2000
     * @tc.name decimalToOctalPart02Test020
     * @tc.desc Verify toOctal(1) on new Decimal(3) returns 0o1p+2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart02Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(3);
      let s: string = d.toOctal(1);
      expect(s).assertEqual("0o1p+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART02_2100
     * @tc.name decimalToOctalPart02Test021
     * @tc.desc Verify toOctal(1) on new Decimal(0.875) returns 0o1p+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart02Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0.875);
      let s: string = d.toOctal(1);
      expect(s).assertEqual("0o1p+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART02_2200
     * @tc.name decimalToOctalPart02Test022
     * @tc.desc Verify toOctal(64) and toOctal(11) on new Decimal(1000000000) return 0o1.6715312p+29
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart02Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(1000000000);
      let s64: string = d.toOctal(64);
      let s11: string = d.toOctal(11);
      expect(s64).assertEqual("0o1.6715312p+29");
      expect(s11).assertEqual("0o1.6715312p+29");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART02_2300
     * @tc.name decimalToOctalPart02Test023
     * @tc.desc Verify toOctal(20) on new Decimal(123456789) returns 0o1.655715052p+26
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart02Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(123456789);
      let s20: string = d.toOctal(20);
      expect(s20).assertEqual("0o1.655715052p+26");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART02_2400
     * @tc.name decimalToOctalPart02Test024
     * @tc.desc Verify toOctal(5) on new Decimal(0) returns 0o0p+0 and on new Decimal(-0) returns -0o0p+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart02Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Decimal = new Decimal(0);
      let d2: Decimal = new Decimal(-0);
      let s1: string = d1.toOctal(5);
      let s2: string = d2.toOctal(5);
      expect(s1).assertEqual("0o0p+0");
      expect(s2).assertEqual("-0o0p+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART02_2500
     * @tc.name decimalToOctalPart02Test025
     * @tc.desc Verify Decimal.set({ defaults: true }) then toOctal(10) on new Decimal(64) returns 0o1p+6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart02Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ defaults: true });
      let d: Decimal = new Decimal(64);
      let s: string = d.toOctal(10);
      expect(s).assertEqual("0o1p+6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART02_2600
     * @tc.name decimalToOctalPart02Test026
     * @tc.desc Verify toOctal(10) on new Decimal(v) returns 0o1p+6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart02Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: double = 64.0;
      let d: Decimal = new Decimal(v);
      let s: string = d.toOctal(10);
      expect(s).assertEqual("0o1p+6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART02_2700
     * @tc.name decimalToOctalPart02Test027
     * @tc.desc Verify toOctal(5) on new Decimal(v) returns 0o1.01p+5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart02Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = 32.5;
      let d: Decimal = new Decimal(v);
      let s: string = d.toOctal(5);
      expect(s).assertEqual("0o1.01p+5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART02_2800
     * @tc.name decimalToOctalPart02Test028
     * @tc.desc Verify toOctal(20) on new Decimal(v) returns 0o1.6715311776p+29
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart02Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: long = 999999999;
      let d: Decimal = new Decimal(v);
      let s: string = d.toOctal(20);
      expect(s).assertEqual("0o1.6715311776p+29");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART02_2900
     * @tc.name decimalToOctalPart02Test029
     * @tc.desc Verify toOctal(5) on new Decimal(v) returns 0o1.6p+2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart02Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: byte = 7;
      let d: Decimal = new Decimal(v);
      let s: string = d.toOctal(5);
      expect(s).assertEqual("0o1.6p+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART02_3000
     * @tc.name decimalToOctalPart02Test030
     * @tc.desc Verify toOctal(10) on new Decimal(v) returns 0o1.75p+9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart02Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: short = 1000;
      let d: Decimal = new Decimal(v);
      let s: string = d.toOctal(10);
      expect(s).assertEqual("0o1.75p+9");
    });
  });
}
