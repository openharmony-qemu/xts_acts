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

export default function decimalToExponentialPart01Test(): void {
  describe("DecimalToExponentialPart01Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_0100
     * @tc.name decimalToExponentialPart01Test001
     * @tc.desc Verify toExponential(dp) on new Decimal(1234.5) returns 1.2345e+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dp: double = 4;
      let s: string = new Decimal(1234.5).toExponential(dp);
      expect(s).assertEqual("1.2345e+3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_0200
     * @tc.name decimalToExponentialPart01Test002
     * @tc.desc Verify toExponential(0) on new Decimal(1234.5) returns 1e+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1234.5).toExponential(0);
      expect(s).assertEqual("1e+3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_0300
     * @tc.name decimalToExponentialPart01Test003
     * @tc.desc Verify toExponential(1) on new Decimal(1234.5) returns 1.2e+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1234.5).toExponential(1);
      expect(s).assertEqual("1.2e+3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_0400
     * @tc.name decimalToExponentialPart01Test004
     * @tc.desc Verify toExponential(2) on new Decimal(100) returns 1.00e+2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(100).toExponential(2);
      expect(s).assertEqual("1.00e+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_0500
     * @tc.name decimalToExponentialPart01Test005
     * @tc.desc Verify toExponential(3) on new Decimal(1234.5) returns 1.235e+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1234.5).toExponential(3);
      expect(s).assertEqual("1.235e+3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_0600
     * @tc.name decimalToExponentialPart01Test006
     * @tc.desc Verify toExponential(10) on new Decimal("123.4567890123") returns 1.2345678901e+2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("123.4567890123").toExponential(10);
      expect(s).assertEqual("1.2345678901e+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_0700
     * @tc.name decimalToExponentialPart01Test007
     * @tc.desc Verify toExponential(16) on new Decimal("1.0000000000000001") returns 1.0000000000000001e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.0000000000000001").toExponential(16);
      expect(s).assertEqual("1.0000000000000001e+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_0800
     * @tc.name decimalToExponentialPart01Test008
     * @tc.desc Verify toExponential(10) on new Decimal(5) returns 5.0000000000e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(5).toExponential(10);
      expect(s).assertEqual("5.0000000000e+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_0900
     * @tc.name decimalToExponentialPart01Test009
     * @tc.desc Verify toExponential(0) on new Decimal(0.7) returns 7e-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0.7).toExponential(0);
      expect(s).assertEqual("7e-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_1000
     * @tc.name decimalToExponentialPart01Test010
     * @tc.desc Verify toExponential(1000) on new Decimal(1234.5) returns 1.2345 head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1234.5).toExponential(1000);
      let actual: string = s.substring(0, 6);
      let expected: string = "1.2345";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_1100
     * @tc.name decimalToExponentialPart01Test011
     * @tc.desc Verify toExponential(2) on new Decimal(678.9) returns 6.79e+2 and is deterministic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(678.9).toExponential(2);
      expect(s).assertEqual("6.79e+2");
      let a: string = new Decimal(678.9).toExponential(2);
      let b: string = new Decimal(678.9).toExponential(2);
      expect(a).assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_1200
     * @tc.name decimalToExponentialPart01Test012
     * @tc.desc Verify toExponential(2) on new Decimal(1234.5) returns string of length 7 and ends with e+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1234.5).toExponential(2);
      let actual: int = s.length;
      let expected: int = 7;
      expect(actual).assertEqual(expected);
      let actual2: boolean = s.endsWith("e+3");
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_1300
     * @tc.name decimalToExponentialPart01Test013
     * @tc.desc Verify toExponential(2) on new Decimal(-1234.5) returns -1.23e+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-1234.5).toExponential(2);
      expect(s).assertEqual("-1.23e+3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_1400
     * @tc.name decimalToExponentialPart01Test014
     * @tc.desc Verify toExponential(2) on new Decimal(0.00123) returns 1.23e-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0.00123).toExponential(2);
      expect(s).assertEqual("1.23e-3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_1500
     * @tc.name decimalToExponentialPart01Test015
     * @tc.desc Verify toExponential(2) on new Decimal(-0.00123) returns -1.23e-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-0.00123).toExponential(2);
      expect(s).assertEqual("-1.23e-3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_1600
     * @tc.name decimalToExponentialPart01Test016
     * @tc.desc Verify toExponential(2) on new Decimal(0) returns 0.00e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0).toExponential(2);
      expect(s).assertEqual("0.00e+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_1700
     * @tc.name decimalToExponentialPart01Test017
     * @tc.desc Verify toExponential(2) on new Decimal(Double.NaN) returns string "NaN"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(Double.NaN).toExponential(2);
      expect(s).assertEqual("NaN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_1800
     * @tc.name decimalToExponentialPart01Test018
     * @tc.desc Verify toExponential(2) on new Decimal(Number.POSITIVE_INFINITY) returns string "Infinity"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(Number.POSITIVE_INFINITY).toExponential(2);
      expect(s).assertEqual("Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_1900
     * @tc.name decimalToExponentialPart01Test019
     * @tc.desc Verify toExponential(2) on new Decimal(-Number.POSITIVE_INFINITY) returns string "-Infinity"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-Number.POSITIVE_INFINITY).toExponential(2);
      expect(s).assertEqual("-Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_2000
     * @tc.name decimalToExponentialPart01Test020
     * @tc.desc Verify toExponential(2) on new Decimal(-0) returns 0.00e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-0).toExponential(2);
      expect(s).assertEqual("0.00e+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_2100
     * @tc.name decimalToExponentialPart01Test021
     * @tc.desc Verify toExponential(0) on new Decimal(0.9999) returns 1e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0.9999).toExponential(0);
      expect(s).assertEqual("1e+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_2200
     * @tc.name decimalToExponentialPart01Test022
     * @tc.desc Verify toExponential(0) on new Decimal(1) returns 1e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1).toExponential(0);
      expect(s).assertEqual("1e+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_2300
     * @tc.name decimalToExponentialPart01Test023
     * @tc.desc Verify toExponential(4) on new Decimal(7) returns 7.0000e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(7).toExponential(4);
      expect(s).assertEqual("7.0000e+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_2400
     * @tc.name decimalToExponentialPart01Test024
     * @tc.desc Verify toExponential(2) on new Decimal(-100) returns -1.00e+2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-100).toExponential(2);
      expect(s).assertEqual("-1.00e+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_2500
     * @tc.name decimalToExponentialPart01Test025
     * @tc.desc Verify toExponential(1) on new Decimal(9.99) returns 1.0e+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(9.99).toExponential(1);
      expect(s).assertEqual("1.0e+1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_2600
     * @tc.name decimalToExponentialPart01Test026
     * @tc.desc Verify toExponential(2) on new Decimal(9.9999) returns 1.00e+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(9.9999).toExponential(2);
      expect(s).assertEqual("1.00e+1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_2700
     * @tc.name decimalToExponentialPart01Test027
     * @tc.desc Verify toExponential(2) on new Decimal(0.009999) returns 1.00e-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0.009999).toExponential(2);
      expect(s).assertEqual("1.00e-2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_2800
     * @tc.name decimalToExponentialPart01Test028
     * @tc.desc Verify toExponential(2) on new Decimal(999.999) returns 1.00e+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(999.999).toExponential(2);
      expect(s).assertEqual("1.00e+3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_2900
     * @tc.name decimalToExponentialPart01Test029
     * @tc.desc Verify toExponential(2) on new Decimal(1.235) returns 1.24e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.235).toExponential(2);
      expect(s).assertEqual("1.24e+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_3000
     * @tc.name decimalToExponentialPart01Test030
     * @tc.desc Verify toExponential(2) on new Decimal(1.234) returns 1.23e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.234).toExponential(2);
      expect(s).assertEqual("1.23e+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_3100
     * @tc.name decimalToExponentialPart01Test031
     * @tc.desc Verify toExponential(2) on new Decimal("1e+30") returns 1.00e+30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1e+30").toExponential(2);
      expect(s).assertEqual("1.00e+30");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_3200
     * @tc.name decimalToExponentialPart01Test032
     * @tc.desc Verify toExponential(0) on new Decimal("1e+30") returns 1e+30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1e+30").toExponential(0);
      expect(s).assertEqual("1e+30");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_3300
     * @tc.name decimalToExponentialPart01Test033
     * @tc.desc Verify toExponential(16) on new Decimal(1.7976931348623157e+308) returns 1.7976931348623157e+308
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.7976931348623157e308).toExponential(16);
      expect(s).assertEqual("1.7976931348623157e+308");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_3400
     * @tc.name decimalToExponentialPart01Test034
     * @tc.desc Verify toExponential(2) on new Decimal(5e-324) returns 5.00e-324
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(5e-324).toExponential(2);
      expect(s).assertEqual("5.00e-324");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_3500
     * @tc.name decimalToExponentialPart01Test035
     * @tc.desc Verify toExponential(3) on new Decimal(0.0001) returns 1.000e-4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0.0001).toExponential(3);
      expect(s).assertEqual("1.000e-4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_3600
     * @tc.name decimalToExponentialPart01Test036
     * @tc.desc Verify toExponential(3) on new Decimal(0.00000123) returns 1.230e-6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0.00000123).toExponential(3);
      expect(s).assertEqual("1.230e-6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_3700
     * @tc.name decimalToExponentialPart01Test037
     * @tc.desc Verify toExponential(10) on new Decimal(0.0000000123) returns 1.2300000000e-8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0.0000000123).toExponential(10);
      expect(s).assertEqual("1.2300000000e-8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_3800
     * @tc.name decimalToExponentialPart01Test038
     * @tc.desc Verify toExponential(5) on new Decimal("123456789012345678901234567890") returns 1.23457e+29
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("123456789012345678901234567890").toExponential(5);
      expect(s).assertEqual("1.23457e+29");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_3900
     * @tc.name decimalToExponentialPart01Test039
     * @tc.desc Verify toExponential(1) on new Decimal(0.1) returns 1.0e-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0.1).toExponential(1);
      expect(s).assertEqual("1.0e-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_4000
     * @tc.name decimalToExponentialPart01Test040
     * @tc.desc Verify toExponential(1) on new Decimal(0.1 + 0.2) returns 3.0e-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0.1 + 0.2).toExponential(1);
      expect(s).assertEqual("3.0e-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_4100
     * @tc.name decimalToExponentialPart01Test041
     * @tc.desc Verify toExponential(1) on new Decimal("1.23e+4") returns 1.2e+4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.23e+4").toExponential(1);
      expect(s).assertEqual("1.2e+4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_4200
     * @tc.name decimalToExponentialPart01Test042
     * @tc.desc Verify toExponential(1) on new Decimal("2.5e-3") returns 2.5e-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("2.5e-3").toExponential(1);
      expect(s).assertEqual("2.5e-3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_4300
     * @tc.name decimalToExponentialPart01Test043
     * @tc.desc Verify toExponential(2) on new Decimal("0x10") returns 1.60e+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("0x10").toExponential(2);
      expect(s).assertEqual("1.60e+1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_4400
     * @tc.name decimalToExponentialPart01Test044
     * @tc.desc Verify toExponential(2) on new Decimal(123.456) returns 1.23e+2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(123.456).toExponential(2);
      expect(s).assertEqual("1.23e+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_4500
     * @tc.name decimalToExponentialPart01Test045
     * @tc.desc Verify new Decimal(toExponential(4) result).valueOf() round-trips back to 1234.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = new Decimal(new Decimal(1234.5).toExponential(4)).valueOf();
      expect(r).assertEqual("1234.5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_4600
     * @tc.name decimalToExponentialPart01Test046
     * @tc.desc Verify toExponential(2) on new Decimal("0123") returns 1.23e+2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("0123").toExponential(2);
      expect(s).assertEqual("1.23e+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_4700
     * @tc.name decimalToExponentialPart01Test047
     * @tc.desc Verify toExponential(0) on new Decimal("123456789012345678901234567890") returns 1e+29
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("123456789012345678901234567890").toExponential(0);
      expect(s).assertEqual("1e+29");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_4800
     * @tc.name decimalToExponentialPart01Test048
     * @tc.desc Verify toExponential(0) on new Decimal(-1) returns -1e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-1).toExponential(0);
      expect(s).assertEqual("-1e+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_4900
     * @tc.name decimalToExponentialPart01Test049
     * @tc.desc Verify toExponential(2) on new Decimal("1234.5") does not mutate the original Decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1234.5");
      d.toExponential(2);
      let actual: string = d.toString();
      let expected: string = "1234.5";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_5000
     * @tc.name decimalToExponentialPart01Test050
     * @tc.desc Verify toExponential(2) on a copy of new Decimal("123.456") does not mutate the source Decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Decimal = new Decimal("123.456");
      let child: Decimal = new Decimal(src);
      child.toExponential(2);
      let actual: string = src.toString();
      let expected: string = "123.456";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_5100
     * @tc.name decimalToExponentialPart01Test051
     * @tc.desc Verify toExponential(0) on new Decimal(2.5) returns 3e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ defaults: true });
      let s: string = new Decimal(2.5).toExponential(0);
      expect(s).assertEqual("3e+0");
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_5200
     * @tc.name decimalToExponentialPart01Test052
     * @tc.desc Verify toExponential(2) on new Decimal(1234.5) returns 1.24e+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_UP });
      let s: string = new Decimal(1234.5).toExponential(2);
      expect(s).assertEqual("1.24e+3");
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_5300
     * @tc.name decimalToExponentialPart01Test053
     * @tc.desc Verify toExponential(2) on new Decimal(9.999) returns 9.99e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let s: string = new Decimal(9.999).toExponential(2);
      expect(s).assertEqual("9.99e+0");
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_5400
     * @tc.name decimalToExponentialPart01Test054
     * @tc.desc Verify toExponential(2) on new Decimal(-1.235) returns -1.23e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_CEILING });
      let s: string = new Decimal(-1.235).toExponential(2);
      expect(s).assertEqual("-1.23e+0");
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_5500
     * @tc.name decimalToExponentialPart01Test055
     * @tc.desc Verify toExponential(2) on new Decimal(-1.235) returns -1.24e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_FLOOR });
      let s: string = new Decimal(-1.235).toExponential(2);
      expect(s).assertEqual("-1.24e+0");
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_5600
     * @tc.name decimalToExponentialPart01Test056
     * @tc.desc Verify toExponential(0) on new Decimal(2.5) returns 2e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_HALF_EVEN });
      let s: string = new Decimal(2.5).toExponential(0);
      expect(s).assertEqual("2e+0");
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_5700
     * @tc.name decimalToExponentialPart01Test057
     * @tc.desc Verify toExponential(-1) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(1234.5).toExponential(-1);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_5800
     * @tc.name decimalToExponentialPart01Test058
     * @tc.desc Verify toExponential(0.5) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(1234.5).toExponential(0.5);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_5900
     * @tc.name decimalToExponentialPart01Test059
     * @tc.desc Verify toExponential(1000000001) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(1234.5).toExponential(1000000001);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_6000
     * @tc.name decimalToExponentialPart01Test060
     * @tc.desc Verify toExponential(Double.NaN) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(1234.5).toExponential(Double.NaN);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_6100
     * @tc.name decimalToExponentialPart01Test061
     * @tc.desc Verify toExponential(Number.POSITIVE_INFINITY) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(1234.5).toExponential(Number.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART01_6200
     * @tc.name decimalToExponentialPart01Test062
     * @tc.desc Verify toExponential(-Number.POSITIVE_INFINITY) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart01Test062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(1234.5).toExponential(-Number.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });
  });
}