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

export default function decimalToExponentialPart02Test(): void {
  describe("DecimalToExponentialPart02Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_0100
     * @tc.name decimalToExponentialPart02Test001
     * @tc.desc Verify toExponential(0, Decimal.ROUND_HALF_DOWN) on new Decimal(2.5) returns 2e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(2.5).toExponential(0, Decimal.ROUND_HALF_DOWN);
      expect(s).assertEqual("2e+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_0200
     * @tc.name decimalToExponentialPart02Test002
     * @tc.desc Verify toExponential(0, Decimal.ROUND_DOWN) on new Decimal(2.5) returns 2e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(2.5).toExponential(0, Decimal.ROUND_DOWN);
      expect(s).assertEqual("2e+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_0300
     * @tc.name decimalToExponentialPart02Test003
     * @tc.desc Verify toExponential(1, Decimal.ROUND_DOWN) on new Decimal(9.99) returns 9.9e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(9.99).toExponential(1, Decimal.ROUND_DOWN);
      expect(s).assertEqual("9.9e+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_0400
     * @tc.name decimalToExponentialPart02Test004
     * @tc.desc Verify toExponential(1, Decimal.ROUND_UP) on new Decimal(9.99) returns 1.0e+1 and is deterministic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(9.99).toExponential(1, Decimal.ROUND_UP);
      expect(s).assertEqual("1.0e+1");
      let a: string = new Decimal(9.99).toExponential(1, Decimal.ROUND_UP);
      let b: string = new Decimal(9.99).toExponential(1, Decimal.ROUND_UP);
      expect(a).assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_0500
     * @tc.name decimalToExponentialPart02Test005
     * @tc.desc Verify toExponential(2, Decimal.ROUND_HALF_UP) on new Decimal(1.234) returns 1.23e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.234).toExponential(2, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("1.23e+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_0600
     * @tc.name decimalToExponentialPart02Test006
     * @tc.desc Verify toExponential(2, Decimal.ROUND_HALF_UP) on new Decimal(1.235) returns 1.24e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.235).toExponential(2, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("1.24e+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_0700
     * @tc.name decimalToExponentialPart02Test007
     * @tc.desc Verify toExponential(2, Decimal.ROUND_HALF_DOWN) on new Decimal(1.235) returns 1.23e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.235).toExponential(2, Decimal.ROUND_HALF_DOWN);
      expect(s).assertEqual("1.23e+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_0800
     * @tc.name decimalToExponentialPart02Test008
     * @tc.desc Verify toExponential(2, Decimal.ROUND_HALF_EVEN) on new Decimal(2.675) returns 2.68e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(2.675).toExponential(2, Decimal.ROUND_HALF_EVEN);
      expect(s).assertEqual("2.68e+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_0900
     * @tc.name decimalToExponentialPart02Test009
     * @tc.desc Verify toExponential(2, Decimal.ROUND_CEILING) on new Decimal(0.1001) returns 1.01e-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0.1001).toExponential(2, Decimal.ROUND_CEILING);
      expect(s).assertEqual("1.01e-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_1000
     * @tc.name decimalToExponentialPart02Test010
     * @tc.desc Verify toExponential(2, Decimal.ROUND_FLOOR) on new Decimal(0.1001) returns 1.00e-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0.1001).toExponential(2, Decimal.ROUND_FLOOR);
      expect(s).assertEqual("1.00e-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_1100
     * @tc.name decimalToExponentialPart02Test011
     * @tc.desc Verify toExponential(6, Decimal.ROUND_HALF_UP) on new Decimal(123.456) returns 1.234560e+2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(123.456).toExponential(6, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("1.234560e+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_1200
     * @tc.name decimalToExponentialPart02Test012
     * @tc.desc Verify toExponential(10, Decimal.ROUND_HALF_UP) on new Decimal(123.456) returns 1.2345600000e+2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(123.456).toExponential(10, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("1.2345600000e+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_1300
     * @tc.name decimalToExponentialPart02Test013
     * @tc.desc Verify toExponential(1000, Decimal.ROUND_HALF_UP) on new Decimal(1234.5) returns 1.2345 head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1234.5).toExponential(1000, Decimal.ROUND_HALF_UP);
      let actual: string = s.substring(0, 6);
      let expected: string = "1.2345";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_1400
     * @tc.name decimalToExponentialPart02Test014
     * @tc.desc Verify toExponential(1000, Decimal.ROUND_DOWN) on new Decimal(1234.5) returns 1.2345 head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1234.5).toExponential(1000, Decimal.ROUND_DOWN);
      let actual: string = s.substring(0, 6);
      let expected: string = "1.2345";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_1500
     * @tc.name decimalToExponentialPart02Test015
     * @tc.desc Verify toExponential(0, Decimal.ROUND_HALF_UP) on new Decimal(1) returns 1e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1).toExponential(0, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("1e+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_1600
     * @tc.name decimalToExponentialPart02Test016
     * @tc.desc Verify toExponential(2, Decimal.ROUND_UP) on new Decimal(1234.5) returns 1.24e+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1234.5).toExponential(2, Decimal.ROUND_UP);
      expect(s).assertEqual("1.24e+3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_1700
     * @tc.name decimalToExponentialPart02Test017
     * @tc.desc Verify toExponential(2, Decimal.ROUND_UP) on new Decimal(9.999) returns 1.00e+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(9.999).toExponential(2, Decimal.ROUND_UP);
      expect(s).assertEqual("1.00e+1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_1800
     * @tc.name decimalToExponentialPart02Test018
     * @tc.desc Verify toExponential(2, Decimal.ROUND_DOWN) on new Decimal(9.999) returns 9.99e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(9.999).toExponential(2, Decimal.ROUND_DOWN);
      expect(s).assertEqual("9.99e+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_1900
     * @tc.name decimalToExponentialPart02Test019
     * @tc.desc Verify toExponential(2, Decimal.ROUND_DOWN) on new Decimal(100) returns 1.00e+2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(100).toExponential(2, Decimal.ROUND_DOWN);
      expect(s).assertEqual("1.00e+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_2000
     * @tc.name decimalToExponentialPart02Test020
     * @tc.desc Verify toExponential(2, Decimal.ROUND_CEILING) on new Decimal(1234.55) returns 1.24e+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1234.55).toExponential(2, Decimal.ROUND_CEILING);
      expect(s).assertEqual("1.24e+3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_2100
     * @tc.name decimalToExponentialPart02Test021
     * @tc.desc Verify toExponential(2, Decimal.ROUND_FLOOR) on new Decimal(1234.55) returns 1.23e+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1234.55).toExponential(2, Decimal.ROUND_FLOOR);
      expect(s).assertEqual("1.23e+3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_2200
     * @tc.name decimalToExponentialPart02Test022
     * @tc.desc Verify toExponential(2, Decimal.ROUND_CEILING) on new Decimal(-1234.55) returns -1.23e+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-1234.55).toExponential(2, Decimal.ROUND_CEILING);
      expect(s).assertEqual("-1.23e+3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_2300
     * @tc.name decimalToExponentialPart02Test023
     * @tc.desc Verify toExponential(2, Decimal.ROUND_FLOOR) on new Decimal(-1234.55) returns -1.24e+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-1234.55).toExponential(2, Decimal.ROUND_FLOOR);
      expect(s).assertEqual("-1.24e+3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_2400
     * @tc.name decimalToExponentialPart02Test024
     * @tc.desc Verify toExponential(2, Decimal.ROUND_HALF_UP) on new Decimal(-1.235) returns -1.24e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-1.235).toExponential(2, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("-1.24e+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_2500
     * @tc.name decimalToExponentialPart02Test025
     * @tc.desc Verify toExponential(2, Decimal.ROUND_HALF_DOWN) on new Decimal(-1.235) returns -1.23e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-1.235).toExponential(2, Decimal.ROUND_HALF_DOWN);
      expect(s).assertEqual("-1.23e+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_2600
     * @tc.name decimalToExponentialPart02Test026
     * @tc.desc Verify toExponential(2, Decimal.ROUND_HALF_EVEN) on new Decimal(-1.235) returns -1.24e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-1.235).toExponential(2, Decimal.ROUND_HALF_EVEN);
      expect(s).assertEqual("-1.24e+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_2700
     * @tc.name decimalToExponentialPart02Test027
     * @tc.desc Verify toExponential(1, Decimal.ROUND_HALF_CEILING) on new Decimal(1.45) returns 1.5e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.45).toExponential(1, Decimal.ROUND_HALF_CEILING);
      expect(s).assertEqual("1.5e+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_2800
     * @tc.name decimalToExponentialPart02Test028
     * @tc.desc Verify toExponential(1, Decimal.ROUND_HALF_FLOOR) on new Decimal(1.45) returns 1.4e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.45).toExponential(1, Decimal.ROUND_HALF_FLOOR);
      expect(s).assertEqual("1.4e+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_2900
     * @tc.name decimalToExponentialPart02Test029
     * @tc.desc Verify toExponential(1, Decimal.ROUND_HALF_CEILING) on new Decimal(-1.45) returns -1.4e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-1.45).toExponential(1, Decimal.ROUND_HALF_CEILING);
      expect(s).assertEqual("-1.4e+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_3000
     * @tc.name decimalToExponentialPart02Test030
     * @tc.desc Verify toExponential(1, Decimal.ROUND_HALF_FLOOR) on new Decimal(-1.45) returns -1.5e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-1.45).toExponential(1, Decimal.ROUND_HALF_FLOOR);
      expect(s).assertEqual("-1.5e+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_3100
     * @tc.name decimalToExponentialPart02Test031
     * @tc.desc Verify toExponential(0, Decimal.ROUND_HALF_CEILING) on new Decimal(-2.5) returns -2e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-2.5).toExponential(0, Decimal.ROUND_HALF_CEILING);
      expect(s).assertEqual("-2e+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_3200
     * @tc.name decimalToExponentialPart02Test032
     * @tc.desc Verify toExponential(0, Decimal.ROUND_HALF_FLOOR) on new Decimal(-2.5) returns -3e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-2.5).toExponential(0, Decimal.ROUND_HALF_FLOOR);
      expect(s).assertEqual("-3e+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_3300
     * @tc.name decimalToExponentialPart02Test033
     * @tc.desc Verify toExponential(1, Decimal.ROUND_HALF_EVEN) on new Decimal(2.25) returns 2.2e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(2.25).toExponential(1, Decimal.ROUND_HALF_EVEN);
      expect(s).assertEqual("2.2e+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_3400
     * @tc.name decimalToExponentialPart02Test034
     * @tc.desc Verify toExponential(2, Decimal.ROUND_UP) on new Decimal(0.1001) returns 1.01e-1 and ROUND_HALF_UP returns 1.00e-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let up: string = new Decimal(0.1001).toExponential(2, Decimal.ROUND_UP);
      let half: string = new Decimal(0.1001).toExponential(2, Decimal.ROUND_HALF_UP);
      expect(up).assertEqual("1.01e-1");
      expect(half).assertEqual("1.00e-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_3500
     * @tc.name decimalToExponentialPart02Test035
     * @tc.desc Verify toExponential(2, Decimal.ROUND_DOWN) on new Decimal(0.1001) returns 1.00e-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let down: string = new Decimal(0.1001).toExponential(2, Decimal.ROUND_DOWN);
      let up: string = new Decimal(0.1001).toExponential(2, Decimal.ROUND_UP);
      expect(down).assertEqual("1.00e-1");
      expect(up).assertEqual("1.01e-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_3600
     * @tc.name decimalToExponentialPart02Test036
     * @tc.desc Verify toExponential(2, Decimal.ROUND_CEILING) on new Decimal(9.999) returns 1.00e+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ceil: string = new Decimal(9.999).toExponential(2, Decimal.ROUND_CEILING);
      let floor: string = new Decimal(9.999).toExponential(2, Decimal.ROUND_FLOOR);
      expect(ceil).assertEqual("1.00e+1");
      expect(floor).assertEqual("9.99e+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_3700
     * @tc.name decimalToExponentialPart02Test037
     * @tc.desc Verify toExponential(0, Decimal.ROUND_UP) on new Decimal(2.5) returns 3e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(2.5).toExponential(0, Decimal.ROUND_UP);
      expect(s).assertEqual("3e+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_3800
     * @tc.name decimalToExponentialPart02Test038
     * @tc.desc Verify toExponential(2, Decimal.ROUND_UP) on new Decimal(-1.2341) returns -1.24e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-1.2341).toExponential(2, Decimal.ROUND_UP);
      expect(s).assertEqual("-1.24e+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_3900
     * @tc.name decimalToExponentialPart02Test039
     * @tc.desc Verify toExponential(2, Decimal.ROUND_HALF_UP) on new Decimal(1234.5) result ends with e+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1234.5).toExponential(2, Decimal.ROUND_HALF_UP);
      let actual: boolean = s.endsWith("e+3");
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_4000
     * @tc.name decimalToExponentialPart02Test040
     * @tc.desc Verify toExponential(2, Decimal.ROUND_HALF_UP) on new Decimal(-1234.5) returns -
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-1234.5).toExponential(2, Decimal.ROUND_HALF_UP);
      let actual: string = s.substring(0, 1);
      let expected: string = '-';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_4100
     * @tc.name decimalToExponentialPart02Test041
     * @tc.desc Verify toExponential(2, Decimal.ROUND_HALF_UP) on new Decimal(1234.5) returns 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1234.5).toExponential(2, Decimal.ROUND_HALF_UP);
      let actual: int = s.length;
      let expected: int = 7;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_4200
     * @tc.name decimalToExponentialPart02Test042
     * @tc.desc Verify toExponential(0, Decimal.ROUND_HALF_UP) on new Decimal("-0") returns 0e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("-0").toExponential(0, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0e+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_4300
     * @tc.name decimalToExponentialPart02Test043
     * @tc.desc Verify toExponential(1, Decimal.ROUND_HALF_UP) on new Decimal(0.9999) returns 1.0e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0.9999).toExponential(1, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("1.0e+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_4400
     * @tc.name decimalToExponentialPart02Test044
     * @tc.desc Verify toExponential(5, Decimal.ROUND_DOWN) on new Decimal("123456789012345678901234567890") returns 1.23456e+29
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("123456789012345678901234567890").toExponential(5, Decimal.ROUND_DOWN);
      expect(s).assertEqual("1.23456e+29");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_4500
     * @tc.name decimalToExponentialPart02Test045
     * @tc.desc Verify toExponential(1, Decimal.ROUND_HALF_UP) on new Decimal("0.3") returns 3.0e-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("0.3").toExponential(1, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("3.0e-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART02_4600
     * @tc.name decimalToExponentialPart02Test046
     * @tc.desc Verify toExponential(2, -1) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart02Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(1234.5).toExponential(2, -1);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });
  });
}