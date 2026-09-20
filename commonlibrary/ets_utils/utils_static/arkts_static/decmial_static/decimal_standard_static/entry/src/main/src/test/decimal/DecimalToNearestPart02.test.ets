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

export default function decimalToNearestPart02Test(): void {
  describe("DecimalToNearestPart02Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_0100
     * @tc.name decimalToNearestPart02Test001
     * @tc.desc Verify toNearest(0.5, 4) on new Decimal("1.7") returns 1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.7").toNearest(0.5, 4);
      let actual: string = r.toString();
      let expected: string = "1.5";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_0200
     * @tc.name decimalToNearestPart02Test002
     * @tc.desc Verify toNearest("0.25", 4) on new Decimal("0.375") returns 0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("0.375").toNearest("0.25", 4);
      let actual: string = r.toString();
      let expected: string = "0.5";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_0300
     * @tc.name decimalToNearestPart02Test003
     * @tc.desc Verify toNearest("0.1", 4) on new Decimal("0.35") returns 0.4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("0.35").toNearest("0.1", 4);
      let actual: string = r.toString();
      let expected: string = "0.4";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_0400
     * @tc.name decimalToNearestPart02Test004
     * @tc.desc Verify toNearest('1', 4) on new Decimal("3.9") returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("3.9").toNearest('1', 4);
      let actual: string = r.toString();
      let expected: string = '4';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_0500
     * @tc.name decimalToNearestPart02Test005
     * @tc.desc Verify toNearest("1e5", 4) on new Decimal("160000") returns 200000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("160000").toNearest("1e5", 4);
      let actual: string = r.toString();
      let expected: string = "200000";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_0600
     * @tc.name decimalToNearestPart02Test006
     * @tc.desc Verify toNearest("1e-1", 4) on new Decimal("0.45") returns 0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("0.45").toNearest("1e-1", 4);
      let actual: string = r.toString();
      let expected: string = "0.5";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_0700
     * @tc.name decimalToNearestPart02Test007
     * @tc.desc Verify toNearest("1e2", 4) on new Decimal("250") returns 300
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("250").toNearest("1e2", 4);
      let actual: string = r.toString();
      let expected: string = "300";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_0800
     * @tc.name decimalToNearestPart02Test008
     * @tc.desc Verify toNearest("1e-2", 4) on new Decimal("0.035") returns 0.04
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("0.035").toNearest("1e-2", 4);
      let actual: string = r.toString();
      let expected: string = "0.04";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_0900
     * @tc.name decimalToNearestPart02Test009
     * @tc.desc Verify toNearest("007.5", 4) on new Decimal("8.1") returns 7.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("8.1").toNearest("007.5", 4);
      let actual: string = r.toString();
      let expected: string = "7.5";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_1000
     * @tc.name decimalToNearestPart02Test010
     * @tc.desc Verify toNearest("0.50", 4) on new Decimal("0.3") returns 0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("0.3").toNearest("0.50", 4);
      let actual: string = r.toString();
      let expected: string = "0.5";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_1100
     * @tc.name decimalToNearestPart02Test011
     * @tc.desc Verify toNearest(" 0.5", 4) throws on leading-space string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal("3.9").toNearest(" 0.5", 4);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_1200
     * @tc.name decimalToNearestPart02Test012
     * @tc.desc Verify toNearest("0x10", 4) on new Decimal("20") returns 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("20").toNearest("0x10", 4);
      let actual: string = r.toString();
      let expected: string = "16";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_1300
     * @tc.name decimalToNearestPart02Test013
     * @tc.desc Verify toNearest("-0.5", 4) on new Decimal("2.6") returns 2.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("2.6").toNearest("-0.5", 4);
      let actual: string = r.toString();
      let expected: string = "2.5";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_1400
     * @tc.name decimalToNearestPart02Test014
     * @tc.desc Verify toNearest("-1", 4) on new Decimal("4.2") returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("4.2").toNearest("-1", 4);
      let actual: string = r.toString();
      let expected: string = '4';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_1500
     * @tc.name decimalToNearestPart02Test015
     * @tc.desc Verify toNearest('0', 4) on new Decimal("-1.7") returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("-1.7").toNearest('0', 4);
      let actual: string = r.toString();
      let expected: string = '0';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_1600
     * @tc.name decimalToNearestPart02Test016
     * @tc.desc Verify toNearest("1.5", 4) on new Decimal("2.25") returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("2.25").toNearest("1.5", 4);
      let actual: string = r.toString();
      let expected: string = '3';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_1700
     * @tc.name decimalToNearestPart02Test017
     * @tc.desc Verify toNearest(0.1, 4) on new Decimal("0.33") returns 0.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("0.33").toNearest(0.1, 4);
      let actual: string = r.toString();
      let expected: string = "0.3";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_1800
     * @tc.name decimalToNearestPart02Test018
     * @tc.desc Verify toNearest(0.25, 4) on new Decimal("0.9") returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("0.9").toNearest(0.25, 4);
      let actual: string = r.toString();
      let expected: string = '1';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_1900
     * @tc.name decimalToNearestPart02Test019
     * @tc.desc Verify toNearest(0.1, 4) on new Decimal(0.35) returns 0.4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(0.35).toNearest(0.1, 4);
      let actual: string = r.toString();
      let expected: string = "0.4";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_2000
     * @tc.name decimalToNearestPart02Test020
     * @tc.desc Verify toNearest(0.1, 4) on new Decimal(0.1 + 0.2) returns 0.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal(0.1 + 0.2).toNearest(0.1, 4);
      let actual: string = r.toString();
      let expected: string = "0.3";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_2100
     * @tc.name decimalToNearestPart02Test021
     * @tc.desc Verify toNearest(n, 4) on new Decimal("4.5") where n = toNearest(0.5, 4) on new Decimal("1.7") returns 4.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n: Decimal = new Decimal("1.7").toNearest(0.5, 4);
      const r: Decimal = new Decimal("4.5").toNearest(n, 4);
      let actual: string = r.toString();
      let expected: string = "4.5";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_2200
     * @tc.name decimalToNearestPart02Test022
     * @tc.desc Verify toNearest(-1, 4) on new Decimal("2.9") returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("2.9").toNearest(-1, 4);
      let actual: string = r.toString();
      let expected: string = '3';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_2300
     * @tc.name decimalToNearestPart02Test023
     * @tc.desc Verify toNearest(-0.25, 4) on new Decimal("-0.375") returns -0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("-0.375").toNearest(-0.25, 4);
      let actual: string = r.toString();
      let expected: string = "-0.5";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_2400
     * @tc.name decimalToNearestPart02Test024
     * @tc.desc Verify toNearest(-2, 4) on new Decimal('5') returns 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal('5').toNearest(-2, 4);
      let actual: string = r.toString();
      let expected: string = '6';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_2500
     * @tc.name decimalToNearestPart02Test025
     * @tc.desc Verify toNearest(-0.1, 4) on new Decimal("-0.35") returns -0.4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("-0.35").toNearest(-0.1, 4);
      let actual: string = r.toString();
      let expected: string = "-0.4";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_2600
     * @tc.name decimalToNearestPart02Test026
     * @tc.desc Verify toNearest(0, 4) on new Decimal("1.7") returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.7").toNearest(0, 4);
      let actual: string = r.toString();
      let expected: string = '0';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_2700
     * @tc.name decimalToNearestPart02Test027
     * @tc.desc Verify toNearest(0, 4) on new Decimal("-1.7") returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("-1.7").toNearest(0, 4);
      let actual: string = r.toString();
      let expected: string = '0';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_2800
     * @tc.name decimalToNearestPart02Test028
     * @tc.desc Verify toNearest(Double.NaN, 4) on new Decimal("1.7") returns Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.7").toNearest(Double.NaN, 4);
      let actual: string = r.toString();
      let expected: string = "NaN";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_2900
     * @tc.name decimalToNearestPart02Test029
     * @tc.desc Verify toNearest(Number.POSITIVE_INFINITY, 4) on new Decimal("1.7") returns non-finite result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.7").toNearest(Number.POSITIVE_INFINITY, 4);
      let actual: boolean = r.isFinite();
      expect(actual).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_3000
     * @tc.name decimalToNearestPart02Test030
     * @tc.desc Verify toNearest(-Number.POSITIVE_INFINITY, 4) on new Decimal("1.7") returns non-finite result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.7").toNearest(-Number.POSITIVE_INFINITY, 4);
      let actual: boolean = r.isFinite();
      expect(actual).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_3100
     * @tc.name decimalToNearestPart02Test031
     * @tc.desc Verify toNearest(0.5, 0) on new Decimal("1.7") returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.7").toNearest(0.5, 0);
      let actual: string = r.toString();
      let expected: string = '2';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_3200
     * @tc.name decimalToNearestPart02Test032
     * @tc.desc Verify toNearest(0.5, 1) on new Decimal("1.7") returns 1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.7").toNearest(0.5, 1);
      let actual: string = r.toString();
      let expected: string = "1.5";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_3300
     * @tc.name decimalToNearestPart02Test033
     * @tc.desc Verify toNearest(0.5, 2) on new Decimal("-1.7") returns -1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("-1.7").toNearest(0.5, 2);
      let actual: string = r.toString();
      let expected: string = "-1.5";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_3400
     * @tc.name decimalToNearestPart02Test034
     * @tc.desc Verify toNearest(0.5, 3) on new Decimal("-1.7") returns -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("-1.7").toNearest(0.5, 3);
      let actual: string = r.toString();
      let expected: string = "-2";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_3500
     * @tc.name decimalToNearestPart02Test035
     * @tc.desc Verify toNearest(0.5, 4) on new Decimal("1.75") returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.75").toNearest(0.5, 4);
      let actual: string = r.toString();
      let expected: string = '2';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_3600
     * @tc.name decimalToNearestPart02Test036
     * @tc.desc Verify toNearest(0.5, 5) on new Decimal("1.75") returns 1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.75").toNearest(0.5, 5);
      let actual: string = r.toString();
      let expected: string = "1.5";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_3700
     * @tc.name decimalToNearestPart02Test037
     * @tc.desc Verify toNearest(0.5, 6) on new Decimal("1.75") returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.75").toNearest(0.5, 6);
      let actual: string = r.toString();
      let expected: string = '2';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_3800
     * @tc.name decimalToNearestPart02Test038
     * @tc.desc Verify toNearest(0.5, 7) on new Decimal("1.75") returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.75").toNearest(0.5, 7);
      let actual: string = r.toString();
      let expected: string = '2';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_3900
     * @tc.name decimalToNearestPart02Test039
     * @tc.desc Verify toNearest(0.5, 8) on new Decimal("1.75") returns 1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.75").toNearest(0.5, 8);
      let actual: string = r.toString();
      let expected: string = "1.5";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_4000
     * @tc.name decimalToNearestPart02Test040
     * @tc.desc Verify toNearest(0.5, Decimal.ROUND_FLOOR) on new Decimal("1.7") returns 1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.7").toNearest(0.5, Decimal.ROUND_FLOOR);
      let actual: string = r.toString();
      let expected: string = "1.5";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_4100
     * @tc.name decimalToNearestPart02Test041
     * @tc.desc Verify toNearest(0.5, Decimal.ROUND_CEILING) on new Decimal("1.7") returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.7").toNearest(0.5, Decimal.ROUND_CEILING);
      let actual: string = r.toString();
      let expected: string = '2';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_4200
     * @tc.name decimalToNearestPart02Test042
     * @tc.desc Verify toNearest("-0.5", Decimal.ROUND_UP) on new Decimal("-1.7") returns -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("-1.7").toNearest("-0.5", Decimal.ROUND_UP);
      let actual: string = r.toString();
      let expected: string = "-2";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_4300
     * @tc.name decimalToNearestPart02Test043
     * @tc.desc Verify toNearest(0.5, -1) on new Decimal("1.7") throws BusinessError for invalid rounding mode -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal("1.7").toNearest(0.5, -1);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_4400
     * @tc.name decimalToNearestPart02Test044
     * @tc.desc Verify toNearest(0.5, 9) on new Decimal("1.7") throws BusinessError for invalid rounding mode 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal("1.7").toNearest(0.5, 9);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_4500
     * @tc.name decimalToNearestPart02Test045
     * @tc.desc Verify Decimal.set({ rounding: 9 }) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.set({ rounding: 9 });
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_4600
     * @tc.name decimalToNearestPart02Test046
     * @tc.desc Verify toNearest("invalid-object", 4) on new Decimal("1.7") throws BusinessError for invalid n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal("1.7").toNearest("invalid-object", 4);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_4700
     * @tc.name decimalToNearestPart02Test047
     * @tc.desc Verify toNearest(0.5, 4) on new Decimal("2.4") returns 2.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("2.4").toNearest(0.5, 4);
      let actual: string = r.toString();
      let expected: string = "2.5";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_4800
     * @tc.name decimalToNearestPart02Test048
     * @tc.desc Verify toNearest(0.5, 4) on new Decimal("1.7") then add(0.1) returns 1.6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.7").toNearest(0.5, 4).add(0.1);
      let actual: string = r.toString();
      let expected: string = "1.6";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_4900
     * @tc.name decimalToNearestPart02Test049
     * @tc.desc Verify toNearest(0.5, 4) on new Decimal("1.7") then mul(2) returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.7").toNearest(0.5, 4).mul(2);
      let actual: string = r.toString();
      let expected: string = '3';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_5000
     * @tc.name decimalToNearestPart02Test050
     * @tc.desc Verify toNearest(0.5, 4) on new Decimal("1.7") then toDecimalPlaces(0) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.7").toNearest(0.5, 4).toDecimalPlaces(0);
      let actual: string = r.toString();
      let expected: string = '2';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_5100
     * @tc.name decimalToNearestPart02Test051
     * @tc.desc Verify toNearest(0.5, 4) on new Decimal("1.7") does not mutate the source Decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Decimal = new Decimal("1.7");
      src.toNearest(0.5, 4);
      let actual: string = src.toString();
      let expected: string = "1.7";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_5200
     * @tc.name decimalToNearestPart02Test052
     * @tc.desc Verify toNearest(0.5, 4) on new Decimal("9.8") returns 10 with exponent e 1 and isInteger true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("9.8").toNearest(0.5, 4);
      let actual: number = r.e;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let actual2: boolean = r.isInteger();
      expect(actual2).assertTrue();
      let actual3: string = r.toString();
      let expected3: string = "10";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_5300
     * @tc.name decimalToNearestPart02Test053
     * @tc.desc Verify coefficient digits length is 1 for toNearest(0.5, 6) on new Decimal("1.75")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.75").toNearest(0.5, 6);
      let actual: int = r.d!.length;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_5400
     * @tc.name decimalToNearestPart02Test054
     * @tc.desc Verify sign field is -1 for toNearest(0.5, 4) on new Decimal("-1.7")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("-1.7").toNearest(0.5, 4);
      let actual: number = r.s;
      let expected: int = -1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_5500
     * @tc.name decimalToNearestPart02Test055
     * @tc.desc Verify toNearest(0.5, 4) on new Decimal("1.7") then toNearest(0.5, Decimal.ROUND_UP) returns 1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = new Decimal("1.7").toNearest(0.5, 4);
      const r2: Decimal = r1.toNearest(0.5, Decimal.ROUND_UP);
      let actual: string = r2.toString();
      let expected: string = "1.5";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_5600
     * @tc.name decimalToNearestPart02Test056
     * @tc.desc Verify toNearest(0.5, 4) on new Decimal("3.5") returns 3.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("3.5").toNearest(0.5, 4);
      let actual: string = r.toString();
      let expected: string = "3.5";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_5700
     * @tc.name decimalToNearestPart02Test057
     * @tc.desc Verify toNearest(2, 4) on new Decimal("9007199254740993") returns 9007199254740994
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("9007199254740993").toNearest(2, 4);
      let actual: string = r.toString();
      let expected: string = "9007199254740994";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_5800
     * @tc.name decimalToNearestPart02Test058
     * @tc.desc Verify toNearest(1, 4) on new Decimal("9007199254740993") returns 9007199254740993
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("9007199254740993").toNearest(1, 4);
      let actual: string = r.toString();
      let expected: string = "9007199254740993";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_5900
     * @tc.name decimalToNearestPart02Test059
     * @tc.desc Verify toNearest(3, 4) on new Decimal("1.7") returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.7").toNearest(3, 4);
      let actual: string = r.toString();
      let expected: string = '3';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_6000
     * @tc.name decimalToNearestPart02Test060
     * @tc.desc Verify toNearest(10, 4) on new Decimal("1.7") returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.7").toNearest(10, 4);
      let actual: string = r.toString();
      let expected: string = '0';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_6100
     * @tc.name decimalToNearestPart02Test061
     * @tc.desc Verify toNearest(100, 4) on new Decimal("1500") under maxE=2 returns "Infinity"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ maxE: 2 });
      const r: Decimal = new Decimal("1500").toNearest(100, 4);
      Decimal.set({ defaults: true });
      let actual: string = r.toString();
      let expected: string = "Infinity";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_6200
     * @tc.name decimalToNearestPart02Test062
     * @tc.desc Verify minE=-2 0.007 e=-3 toNearest 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ minE: -2 });
      const r: Decimal = new Decimal("0.007").toNearest(0.01, 4);
      Decimal.set({ defaults: true });
      let actual: string = r.toString();
      let expected: string = '0';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_6300
     * @tc.name decimalToNearestPart02Test063
     * @tc.desc Verify toNearest(0.5, 4) on new Decimal("1.456") under precision=3 returns 1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 3 });
      const r: Decimal = new Decimal("1.456").toNearest(0.5, 4);
      Decimal.set({ defaults: true });
      let actual: string = r.toString();
      let expected: string = "1.5";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_6400
     * @tc.name decimalToNearestPart02Test064
     * @tc.desc Verify toNearest("0.0001", 4) on new Decimal("0.00035") returns 0.0004
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("0.00035").toNearest("0.0001", 4);
      let actual: string = r.toString();
      let expected: string = "0.0004";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_6500
     * @tc.name decimalToNearestPart02Test065
     * @tc.desc Verify toNearest("0.001", 4) on new Decimal("1.777777") returns 1.778
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal("1.777777").toNearest("0.001", 4);
      let actual: string = r.toString();
      let expected: string = "1.778";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NEAREST_PART02_6600
     * @tc.name decimalToNearestPart02Test066
     * @tc.desc Verify toNearest(2, 4) on new Decimal('5') returns 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNearestPart02Test066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = new Decimal('5').toNearest(2, 4);
      let actual: string = r.toString();
      let expected: string = '6';
      expect(actual).assertEqual(expected);
    });
  });
}