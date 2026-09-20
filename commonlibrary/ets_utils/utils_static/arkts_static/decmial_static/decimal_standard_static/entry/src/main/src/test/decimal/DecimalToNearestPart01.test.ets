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

export default function decimalToNearestPart01Test(): void {
  describe("DecimalToNearestPart01Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_0100
     * @tc.name decimalToNearestPart01Test001
     * @tc.desc Verify toNearest(n) double 0.5 1.7 HALF_UP 1.5 and is Decimal and e is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.7").toNearest(0.5);
      let actual: string = r.toString();
      let expected: string = "1.5";
      expect(actual).assertEqual(expected);
      let actual3: number = r.e;
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_0200
     * @tc.name decimalToNearestPart01Test002
     * @tc.desc Verify toNearest(n) string '2' 5 HALF_UP 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal('5').toNearest('2');
      let actual: string = r.toString();
      let expected: string = '6';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_0300
     * @tc.name decimalToNearestPart01Test003
     * @tc.desc Verify toNearest(1) on new Decimal("2.5") returns 3 and is integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("2.5").toNearest(1);
      let actual: string = r.toString();
      let expected: string = '3';
      expect(actual).assertEqual(expected);
      let actual2: boolean = r.isInteger();
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_0400
     * @tc.name decimalToNearestPart01Test004
     * @tc.desc Verify toNearest(3) on new Decimal('9') returns 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal('9').toNearest(3);
      let actual: string = r.toString();
      let expected: string = '9';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_0500
     * @tc.name decimalToNearestPart01Test005
     * @tc.desc Verify toNearest(0.25) on new Decimal("1.7") returns 1.75
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.7").toNearest(0.25);
      let actual: string = r.toString();
      let expected: string = "1.75";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_0600
     * @tc.name decimalToNearestPart01Test006
     * @tc.desc Verify toNearest(3) on new Decimal('5') returns 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal('5').toNearest(3);
      let actual: string = r.toString();
      let expected: string = '6';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_0700
     * @tc.name decimalToNearestPart01Test007
     * @tc.desc Verify toNearest(0.1) on new Decimal("0.45") returns 0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("0.45").toNearest(0.1);
      let actual: string = r.toString();
      let expected: string = "0.5";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_0800
     * @tc.name decimalToNearestPart01Test008
     * @tc.desc Verify toNearest(100) on new Decimal("1250") returns 1300
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1250").toNearest(100);
      let actual: string = r.toString();
      let expected: string = "1300";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_0900
     * @tc.name decimalToNearestPart01Test009
     * @tc.desc Verify toNearest(0) on new Decimal("1.7") returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.7").toNearest(0);
      let actual: string = r.toString();
      let expected: string = '0';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_1000
     * @tc.name decimalToNearestPart01Test010
     * @tc.desc Verify toNearest(-0.5) on new Decimal("1.7") returns 1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.7").toNearest(-0.5);
      let actual: string = r.toString();
      let expected: string = "1.5";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_1100
     * @tc.name decimalToNearestPart01Test011
     * @tc.desc Verify toNearest(-1) on new Decimal("2.3") returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("2.3").toNearest(-1);
      let actual: string = r.toString();
      let expected: string = '2';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_1200
     * @tc.name decimalToNearestPart01Test012
     * @tc.desc Verify toNearest(1.7976931348623157e+308) on new Decimal("1000") returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1000").toNearest(1.7976931348623157e308);
      let actual: string = r.toString();
      let expected: string = '0';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_1300
     * @tc.name decimalToNearestPart01Test013
     * @tc.desc Verify toNearest(5e-324) on new Decimal("0.1") result equals original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("0.1").toNearest(5e-324);
      const cmp: double = r.comparedTo(new Decimal("0.1"));
      expect(cmp).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_1400
     * @tc.name decimalToNearestPart01Test014
     * @tc.desc Verify toNearest(Double.NaN) on new Decimal("1.7")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.7").toNearest(Double.NaN);
      let actual: boolean = r.isNaN();
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_1500
     * @tc.name decimalToNearestPart01Test015
     * @tc.desc Verify toNearest(Double.POSITIVE_INFINITY) on new Decimal("1.7") does not return NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.7").toNearest(Double.POSITIVE_INFINITY);
      let actual: boolean = r.isNaN();
      expect(actual).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_1600
     * @tc.name decimalToNearestPart01Test016
     * @tc.desc Verify toNearest("1e5") on new Decimal("123456") returns 100000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("123456").toNearest("1e5");
      let actual: string = r.toString();
      let expected: string = "100000";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_1700
     * @tc.name decimalToNearestPart01Test017
     * @tc.desc Verify toNearest("1.23e-4") on new Decimal("0.005") returns 0.005043
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("0.005").toNearest("1.23e-4");
      let actual: string = r.toString();
      let expected: string = "0.005043";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_1800
     * @tc.name decimalToNearestPart01Test018
     * @tc.desc Verify toNearest("1e+5") on new Decimal("150000") returns 200000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("150000").toNearest("1e+5");
      let actual: string = r.toString();
      let expected: string = "200000";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_1900
     * @tc.name decimalToNearestPart01Test019
     * @tc.desc Verify toNearest("1E5") on new Decimal("250000") returns 300000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("250000").toNearest("1E5");
      let actual: string = r.toString();
      let expected: string = "300000";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_2000
     * @tc.name decimalToNearestPart01Test020
     * @tc.desc Verify toNearest("0x10") on new Decimal("20") returns 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("20").toNearest("0x10");
      let actual: string = r.toString();
      let expected: string = "16";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_2100
     * @tc.name decimalToNearestPart01Test021
     * @tc.desc Verify toNearest("0b101") on new Decimal('7') returns 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal('7').toNearest("0b101");
      let actual: string = r.toString();
      let expected: string = '5';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_2200
     * @tc.name decimalToNearestPart01Test022
     * @tc.desc Verify toNearest("0123") on new Decimal("250") returns 246
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("250").toNearest("0123");
      let actual: string = r.toString();
      let expected: string = "246";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_2300
     * @tc.name decimalToNearestPart01Test023
     * @tc.desc Verify toNearest("-Infinity") on new Decimal("1.7") does not return NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.7").toNearest("-Infinity");
      let actual: boolean = r.isNaN();
      expect(actual).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_2400
     * @tc.name decimalToNearestPart01Test024
     * @tc.desc Verify toNearest("-0") on new Decimal("1.7") does not return NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.7").toNearest("-0");
      let actual: boolean = r.isNaN();
      expect(actual).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_2500
     * @tc.name decimalToNearestPart01Test025
     * @tc.desc Verify toNearest("1.5e-2") on new Decimal("0.1") returns 0.105
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("0.1").toNearest("1.5e-2");
      let actual: string = r.toString();
      let expected: string = "0.105";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_2600
     * @tc.name decimalToNearestPart01Test026
     * @tc.desc Verify toNearest(s) on new Decimal("1.7") returns 1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "0.5";
      for (let i: int = 0; i < 9998; i++) {
        s = s + '0';
      }
      const r: Decimal = new Decimal("1.7").toNearest(s);
      let actual: string = r.toString();
      let expected: string = "1.5";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_2700
     * @tc.name decimalToNearestPart01Test027
     * @tc.desc Verify toNearest(0.5) on new Decimal("-1.7") returns -1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("-1.7").toNearest(0.5);
      let actual: string = r.toString();
      let expected: string = "-1.5";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_2800
     * @tc.name decimalToNearestPart01Test028
     * @tc.desc Verify toNearest(0.5) on new Decimal(0) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(0).toNearest(0.5);
      let actual: string = r.toString();
      let expected: string = '0';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_2900
     * @tc.name decimalToNearestPart01Test029
     * @tc.desc Verify toNearest(0.5) on new Decimal(-0) returns negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(-0).toNearest(0.5);
      let actual: boolean = r.isZero();
      expect(actual).assertTrue();
      let actual2: boolean = r.isNegative();
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_3000
     * @tc.name decimalToNearestPart01Test030
     * @tc.desc Verify toNearest(0.5) on new Decimal(Double.NaN)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(Double.NaN).toNearest(0.5);
      let actual: boolean = r.isNaN();
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_3100
     * @tc.name decimalToNearestPart01Test031
     * @tc.desc Verify toNearest(0.5) on new Decimal(Double.POSITIVE_INFINITY) returns Number.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(Double.POSITIVE_INFINITY).toNearest(0.5);
      let actual: string = r.toString();
      let expected: string = "Infinity";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_3200
     * @tc.name decimalToNearestPart01Test032
     * @tc.desc Verify toNearest(0.5) on new Decimal(Double.NEGATIVE_INFINITY) returns -Number.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(Double.NEGATIVE_INFINITY).toNearest(0.5);
      let actual: string = r.toString();
      let expected: string = "-Infinity";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_3300
     * @tc.name decimalToNearestPart01Test033
     * @tc.desc Verify toNearest(0.1) on new Decimal(0.1 + 0.2) returns 0.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(0.1 + 0.2).toNearest(0.1);
      let actual: string = r.toString();
      let expected: string = "0.3";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_3400
     * @tc.name decimalToNearestPart01Test034
     * @tc.desc Verify toNearest(0.01) on new Decimal("0.1234567890123456789012345678901234567890") returns 0.12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("0.1234567890123456789012345678901234567890").toNearest(0.01);
      let actual: string = r.toString();
      let expected: string = "0.12";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_3500
     * @tc.name decimalToNearestPart01Test035
     * @tc.desc Verify toNearest(1) on new Decimal("1.5e1") returns 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.5e1").toNearest(1);
      let actual: string = r.toString();
      let expected: string = "15";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_3600
     * @tc.name decimalToNearestPart01Test036
     * @tc.desc Verify toNearest(0.01) on new Decimal("2.675") returns 2.68
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("2.675").toNearest(0.01);
      let actual: string = r.toString();
      let expected: string = "2.68";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_3700
     * @tc.name decimalToNearestPart01Test037
     * @tc.desc Verify plus toNearest 1.7 + 0.3 = 2.0 0.5 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.7").add("0.3").toNearest(0.5);
      let actual: string = r.toString();
      let expected: string = '2';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_3800
     * @tc.name decimalToNearestPart01Test038
     * @tc.desc Verify toNearest(0) on new Decimal(0) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(0).toNearest(0);
      let actual: string = r.toString();
      let expected: string = '0';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_3900
     * @tc.name decimalToNearestPart01Test039
     * @tc.desc Verify toNearest(1) on new Decimal("7.5") returns 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("7.5").toNearest(1);
      let actual: string = r.toString();
      let expected: string = '8';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_4000
     * @tc.name decimalToNearestPart01Test040
     * @tc.desc Verify toNearest(1) on new Decimal("-7.5") returns -8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("-7.5").toNearest(1);
      let actual: string = r.toString();
      let expected: string = "-8";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_4100
     * @tc.name decimalToNearestPart01Test041
     * @tc.desc Verify toNearest(0.1) on new Decimal("0.35") returns 0.4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("0.35").toNearest(0.1);
      let actual: string = r.toString();
      let expected: string = "0.4";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_4200
     * @tc.name decimalToNearestPart01Test042
     * @tc.desc Verify toNearest(0.1) on new Decimal("-0.35") returns -0.4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("-0.35").toNearest(0.1);
      let actual: string = r.toString();
      let expected: string = "-0.4";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_4300
     * @tc.name decimalToNearestPart01Test043
     * @tc.desc Verify toNearest(0.5) on new Decimal("1.25") returns 1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.25").toNearest(0.5);
      let actual: string = r.toString();
      let expected: string = "1.5";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_4400
     * @tc.name decimalToNearestPart01Test044
     * @tc.desc Verify toNearest(0.5) on new Decimal("-1.25") returns -1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("-1.25").toNearest(0.5);
      let actual: string = r.toString();
      let expected: string = "-1.5";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_4500
     * @tc.name decimalToNearestPart01Test045
     * @tc.desc Verify toNearest(0.1) on new Decimal("0.125") returns 0.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("0.125").toNearest(0.1);
      let actual: string = r.toString();
      let expected: string = "0.1";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_4600
     * @tc.name decimalToNearestPart01Test046
     * @tc.desc Verify 1.7.toNearest(0.5) 0.1 1.6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.7").toNearest(0.5).add("0.1");
      let actual: string = r.toString();
      let expected: string = "1.6";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_4700
     * @tc.name decimalToNearestPart01Test047
     * @tc.desc Verify 1 toNearest round() 2.5 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Decimal = new Decimal("2.5").toNearest(1);
      const b: Decimal = Decimal.round(new Decimal("2.5"));
      let actual: boolean = a.equals(b);
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_4800
     * @tc.name decimalToNearestPart01Test048
     * @tc.desc Verify toNearest("invalid-boolean") throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string = "invalid-boolean";
      try {
        new Decimal(5).toNearest(v);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_4900
     * @tc.name decimalToNearestPart01Test049
     * @tc.desc Verify maxE=2 123456 e=5 Infinity toNearest(1) Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.set({ maxE: 2 });
        const r: Decimal = new Decimal("123456").toNearest(1);
        let actual: string = r.toString();
        let expected: string = "Infinity";
        expect(actual).assertEqual(expected);
      } finally {
        Decimal.set({ defaults: true });
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_5000
     * @tc.name decimalToNearestPart01Test050
     * @tc.desc Verify minE=-5 0.00000001 e=-8 0 toNearest(0.00001) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.set({ minE: -5 });
        const r: Decimal = new Decimal("0.00000001").toNearest(0.00001);
        let actual: string = r.toString();
        let expected: string = '0';
        expect(actual).assertEqual(expected);
      } finally {
        Decimal.set({ defaults: true });
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_5100
     * @tc.name decimalToNearestPart01Test051
     * @tc.desc Verify toNearest("1e307") on new Decimal("1e308") result equals original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1e308").toNearest("1e307");
      const cmp: double = r.comparedTo(new Decimal("1e308"));
      expect(cmp).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART01_5200
     * @tc.name decimalToNearestPart01Test052
     * @tc.desc Verify toNearest("1e10") on new Decimal("12345678901234567890") returns 12345678900000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart01Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("12345678901234567890").toNearest("1e10");
      let actual: string = r.toString();
      let expected: string = "12345678900000000000";
      expect(actual).assertEqual(expected);
    });
  });
}