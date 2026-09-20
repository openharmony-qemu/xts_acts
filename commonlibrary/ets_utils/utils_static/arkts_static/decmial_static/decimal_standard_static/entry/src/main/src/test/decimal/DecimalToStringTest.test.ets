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

export default function decimalToStringTestTest(): void {
  describe("DecimalToStringTestTest", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_0100
     * @tc.name decimalToStringTest001
     * @tc.desc Verify toString() on new Decimal(7) returns '7'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(7);
      let r1: string = d.toString();
      let e1: string = '7';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_0200
     * @tc.name decimalToStringTest002
     * @tc.desc Verify toString() on new Decimal("123") returns "123"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("123");
      let r1: string = d.toString();
      let e1: string = "123";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_0300
     * @tc.name decimalToStringTest003
     * @tc.desc Verify toString() on new Decimal("-123") returns "-123"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("-123");
      let r1: string = d.toString();
      let e1: string = "-123";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_0400
     * @tc.name decimalToStringTest004
     * @tc.desc Verify toString (assertEqual) and length 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("123.456");
      let r1: string = d.toString();
      let e1: string = "123.456";
      expect(r1).assertEqual(e1);
      let r2: int = d.toString().length;
      let e2: int = 7;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_0500
     * @tc.name decimalToStringTest005
     * @tc.desc Verify toString() on new Decimal("-0.456") returns "-0.456"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("-0.456");
      let r1: string = d.toString();
      let e1: string = "-0.456";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_0600
     * @tc.name decimalToStringTest006
     * @tc.desc Verify toString() on new Decimal("1.50") returns "1.5"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.50");
      let r1: string = d.toString();
      let e1: string = "1.5";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_0700
     * @tc.name decimalToStringTest007
     * @tc.desc Verify toString() on new Decimal('0') returns '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('0');
      let r1: string = d.toString();
      let e1: string = '0';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_0800
     * @tc.name decimalToStringTest008
     * @tc.desc Verify toString() on new Decimal("-0") returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("-0");
      let r1: string = d.toString();
      let e1: string = '0';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_0900
     * @tc.name decimalToStringTest009
     * @tc.desc Verify toString() on new Decimal("0123") returns "123"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("0123");
      let r1: string = d.toString();
      let e1: string = "123";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_1000
     * @tc.name decimalToStringTest010
     * @tc.desc Verify toString() on new Decimal(".5") returns "0.5"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(".5");
      let r1: string = d.toString();
      let e1: string = "0.5";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_1100
     * @tc.name decimalToStringTest011
     * @tc.desc Verify toString() on new Decimal("5.") returns '5'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("5.");
      let r1: string = d.toString();
      let e1: string = '5';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_1200
     * @tc.name decimalToStringTest012
     * @tc.desc Verify toString() on new Decimal("100") returns "100"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("100");
      let r1: string = d.toString();
      let e1: string = "100";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_1300
     * @tc.name decimalToStringTest013
     * @tc.desc Verify toString() on new Decimal("98765432109876543210") returns "98765432109876543210"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("98765432109876543210");
      let r1: string = d.toString();
      let e1: string = "98765432109876543210";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_1400
     * @tc.name decimalToStringTest014
     * @tc.desc Verify toString() on new Decimal("1.234567890123456789") returns "1.234567890123456789"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.234567890123456789");
      let r1: string = d.toString();
      let e1: string = "1.234567890123456789";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_1500
     * @tc.name decimalToStringTest015
     * @tc.desc Verify toString() on new Decimal("1e5") returns "100000"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1e5");
      let r1: string = d.toString();
      let e1: string = "100000";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_1600
     * @tc.name decimalToStringTest016
     * @tc.desc Verify toString() on new Decimal("1.23e-4") returns "0.000123"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.23e-4");
      let r1: string = d.toString();
      let e1: string = "0.000123";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_1700
     * @tc.name decimalToStringTest017
     * @tc.desc Verify toString() on new Decimal("2.5e3") returns "2500"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("2.5e3");
      let r1: string = d.toString();
      let e1: string = "2500";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_1800
     * @tc.name decimalToStringTest018
     * @tc.desc Verify toString() on new Decimal("-1e4") returns "-10000"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("-1e4");
      let r1: string = d.toString();
      let e1: string = "-10000";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_1900
     * @tc.name decimalToStringTest019
     * @tc.desc Verify toString() on new Decimal("1e21") returns "1e+21"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1e21");
      let r1: string = d.toString();
      let e1: string = "1e+21";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_2000
     * @tc.name decimalToStringTest020
     * @tc.desc Verify toString() on new Decimal("1e-6") returns "0.000001"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1e-6");
      let r1: string = d.toString();
      let e1: string = "0.000001";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_2100
     * @tc.name decimalToStringTest021
     * @tc.desc Verify toString() on new Decimal("1e20") returns "100000000000000000000"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1e20");
      let r1: string = d.toString();
      let e1: string = "100000000000000000000";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_2200
     * @tc.name decimalToStringTest022
     * @tc.desc Verify toString() on new Decimal("6.02e23") returns "6.02e+23"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("6.02e23");
      let r1: string = d.toString();
      let e1: string = "6.02e+23";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_2300
     * @tc.name decimalToStringTest023
     * @tc.desc Verify toString() on new Decimal("0.0000001") returns 1e-7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("0.0000001");
      let r1: string = d.toString();
      let e1: string = "1e-7";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_2400
     * @tc.name decimalToStringTest024
     * @tc.desc Verify new Decimal('') throws with message "Invalid index: 0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('');
        expect().assertFail();
      } catch (e) {
        expect(e instanceof RangeError).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_2500
     * @tc.name decimalToStringTest025
     * @tc.desc Verify toString() on new Decimal("0x10") returns 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("0x10");
      let r1: string = d.toString();
      let e1: string = "16";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_2600
     * @tc.name decimalToStringTest026
     * @tc.desc Verify toString() on new Decimal(0.1 + 0.2) returns 0.30000000000000004
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0.1 + 0.2);
      let r1: string = d.toString();
      let e1: string = "0.30000000000000004";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_2700
     * @tc.name decimalToStringTest027
     * @tc.desc Verify toString() on new Decimal(0.1) returns "0.1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0.1);
      let r1: string = d.toString();
      let e1: string = "0.1";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_2800
     * @tc.name decimalToStringTest028
     * @tc.desc Verify toString() on new Decimal(123.456) returns "123.456"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(123.456);
      let r1: string = d.toString();
      let e1: string = "123.456";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_2900
     * @tc.name decimalToStringTest029
     * @tc.desc Verify toString() on new Decimal(-2.5) returns "-2.5"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-2.5);
      let r1: string = d.toString();
      let e1: string = "-2.5";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_3000
     * @tc.name decimalToStringTest030
     * @tc.desc Verify double NaN toString NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(Double.NaN);
      let r1: string = d.toString();
      let e1: string = "NaN";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_3100
     * @tc.name decimalToStringTest031
     * @tc.desc Verify double Infinity toString Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(Number.POSITIVE_INFINITY);
      let r1: string = d.toString();
      let e1: string = "Infinity";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_3200
     * @tc.name decimalToStringTest032
     * @tc.desc Verify double -Infinity toString -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-Number.POSITIVE_INFINITY);
      let r1: string = d.toString();
      let e1: string = "-Infinity";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_3300
     * @tc.name decimalToStringTest033
     * @tc.desc Verify toString() on new Decimal(1.7976931348623157e+308) returns 1.7976931348623157e+308
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(1.7976931348623157e308);
      let r1: string = d.toString();
      let e1: string = "1.7976931348623157e+308";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_3400
     * @tc.name decimalToStringTest034
     * @tc.desc Verify toString() on new Decimal(5e-324) returns 5e-324
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(5e-324);
      let r1: string = d.toString();
      let e1: string = "5e-324";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_3500
     * @tc.name decimalToStringTest035
     * @tc.desc Verify Decimal Value toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(new Decimal("42"));
      let r1: string = d.toString();
      let e1: string = "42";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_3600
     * @tc.name decimalToStringTest036
     * @tc.desc Verify toString() on new Decimal(new Decimal("7.25")) returns "7.25"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(new Decimal("7.25"));
      let r1: string = d.toString();
      let e1: string = "7.25";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_3700
     * @tc.name decimalToStringTest037
     * @tc.desc Verify toString() on new Decimal(new Decimal("1e3")) returns "1000"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(new Decimal("1e3"));
      let r1: string = d.toString();
      let e1: string = "1000";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_3800
     * @tc.name decimalToStringTest038
     * @tc.desc Verify toString() on new Decimal("9.9") returns "9.9"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("9.9");
      expect(d.toString()).assertEqual("9.9");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_3900
     * @tc.name decimalToStringTest039
     * @tc.desc Verify toString() length after Decimal.set({ precision: 50, toExpPos: 100 }) is 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 50, toExpPos: 100 });
      let d: Decimal = new Decimal("98765432109876543210");
      let r1: int = d.toString().length;
      let e1: int = 20;
      expect(r1).assertEqual(e1);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_4000
     * @tc.name decimalToStringTest040
     * @tc.desc Verify toString() on new Decimal("12.34") returns "12.34" and sign field s is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("12.34");
      let s1: string = d.toString();
      expect(s1).assertEqual("12.34");
      let r1: number = d.s;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_4100
     * @tc.name decimalToStringTest041
     * @tc.desc Verify toString() on new Decimal("1.5").add("2.5") returns '4'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.5").add("2.5");
      let r1: string = d.toString();
      let e1: string = '4';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_4200
     * @tc.name decimalToStringTest042
     * @tc.desc Verify toString 1/8 0.125
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(1).div(8);
      let r1: string = d.toString();
      let e1: string = "0.125";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_4300
     * @tc.name decimalToStringTest043
     * @tc.desc Verify precision=5 + ROUND_HALF_UP does not affect toString of new Decimal("123.456789")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 5, rounding: Decimal.ROUND_HALF_UP });
      let d: Decimal = new Decimal("123.456789");
      let r1: string = d.toString();
      let e1: string = "123.456789";
      expect(r1).assertEqual(e1);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_4400
     * @tc.name decimalToStringTest044
     * @tc.desc Verify precision=5 + ROUND_DOWN does not affect toString of new Decimal("123.456789")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 5, rounding: Decimal.ROUND_DOWN });
      let d: Decimal = new Decimal("123.456789");
      let r1: string = d.toString();
      let e1: string = "123.456789";
      expect(r1).assertEqual(e1);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_4500
     * @tc.name decimalToStringTest045
     * @tc.desc Verify precision=3 + ROUND_HALF_UP does not affect toString of new Decimal("1234.5")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 3, rounding: Decimal.ROUND_HALF_UP });
      let d: Decimal = new Decimal("1234.5");
      let r1: string = d.toString();
      let e1: string = "1234.5";
      expect(r1).assertEqual(e1);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_4600
     * @tc.name decimalToStringTest046
     * @tc.desc Verify precision=2 + ROUND_HALF_UP does not affect toString of new Decimal("999.99")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 2, rounding: Decimal.ROUND_HALF_UP });
      let d: Decimal = new Decimal("999.99");
      let r1: string = d.toString();
      let e1: string = "999.99";
      expect(r1).assertEqual(e1);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_4700
     * @tc.name decimalToStringTest047
     * @tc.desc Verify toString on new Decimal("123456789012345678901234567890") returns full precision 1.2345678901234567890123456789e+29
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("123456789012345678901234567890");
      let r1: string = d.toString();
      let e1: string = "1.2345678901234567890123456789e+29";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_4800
     * @tc.name decimalToStringTest048
     * @tc.desc Verify toString() on new Decimal("123.456789") returns 123.456789
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("123.456789");
      let r1: string = d.toString();
      let e1: string = "123.456789";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_4900
     * @tc.name decimalToStringTest049
     * @tc.desc Verify toString() after Decimal.set({ toExpPos: 21 }) on new Decimal("9e21") returns "9e+21"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ toExpPos: 21 });
      let d: Decimal = new Decimal("9e21");
      let r1: string = d.toString();
      let e1: string = "9e+21";
      expect(r1).assertEqual(e1);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_5000
     * @tc.name decimalToStringTest050
     * @tc.desc Verify toString() after Decimal.set({ toExpPos: 21 }) on new Decimal("8e20") returns "800000000000000000000"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ toExpPos: 21 });
      let d: Decimal = new Decimal("8e20");
      let r1: string = d.toString();
      let e1: string = "800000000000000000000";
      expect(r1).assertEqual(e1);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_5100
     * @tc.name decimalToStringTest051
     * @tc.desc Verify toString() after Decimal.set({ toExpNeg: -7 }) on new Decimal("9e-7") returns "9e-7"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ toExpNeg: -7 });
      let d: Decimal = new Decimal("9e-7");
      let r1: string = d.toString();
      let e1: string = "9e-7";
      expect(r1).assertEqual(e1);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_5200
     * @tc.name decimalToStringTest052
     * @tc.desc Verify toString() after Decimal.set({ toExpNeg: -7 }) on new Decimal("2e-6") returns "0.000002"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ toExpNeg: -7 });
      let d: Decimal = new Decimal("2e-6");
      let r1: string = d.toString();
      let e1: string = "0.000002";
      expect(r1).assertEqual(e1);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_5300
     * @tc.name decimalToStringTest053
     * @tc.desc Verify toString() on new Decimal("123") returns 1.23e+2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ toExpPos: 0 });
      let d: Decimal = new Decimal("123");
      let r1: string = d.toString();
      let e1: string = "1.23e+2";
      expect(r1).assertEqual(e1);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_5400
     * @tc.name decimalToStringTest054
     * @tc.desc Verify toString() after Decimal.set({ toExpPos: 1 }) on new Decimal("12") returns "1.2e+1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ toExpPos: 1 });
      let d: Decimal = new Decimal("12");
      let r1: string = d.toString();
      let e1: string = "1.2e+1";
      expect(r1).assertEqual(e1);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_5500
     * @tc.name decimalToStringTest055
     * @tc.desc Verify toString() after Decimal.set({ toExpPos: 2 }) on new Decimal("12") returns "12"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ toExpPos: 2 });
      let d: Decimal = new Decimal("12");
      let r1: string = d.toString();
      let e1: string = "12";
      expect(r1).assertEqual(e1);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_5600
     * @tc.name decimalToStringTest056
     * @tc.desc Verify toString() on new Decimal("0.5") returns 5e-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ toExpNeg: 0 });
      let d: Decimal = new Decimal("0.5");
      let r1: string = d.toString();
      let e1: string = "5e-1";
      expect(r1).assertEqual(e1);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_5700
     * @tc.name decimalToStringTest057
     * @tc.desc Verify toString() on new Decimal("0.12") returns 1.2e-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ toExpNeg: -1 });
      let d: Decimal = new Decimal("0.12");
      let r1: string = d.toString();
      let e1: string = "1.2e-1";
      expect(r1).assertEqual(e1);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_5800
     * @tc.name decimalToStringTest058
     * @tc.desc Verify toString() on new Decimal("0.12") returns 0.12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ toExpNeg: -3 });
      let d: Decimal = new Decimal("0.12");
      let r1: string = d.toString();
      let e1: string = "0.12";
      expect(r1).assertEqual(e1);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_5900
     * @tc.name decimalToStringTest059
     * @tc.desc Verify toString() after Decimal.set({ precision: 50, toExpPos: 100 }) on new Decimal("123456789012345678901234567890") returns "123456789012345678901234567890"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 50, toExpPos: 100 });
      let d: Decimal = new Decimal("123456789012345678901234567890");
      let r1: string = d.toString();
      let e1: string = "123456789012345678901234567890";
      expect(r1).assertEqual(e1);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_6000
     * @tc.name decimalToStringTest060
     * @tc.desc Verify toString() after Decimal.set({ precision: 20000, toExpPos: 10000 }) on new Decimal(big) returns big
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20000, toExpPos: 10000 });
      let big: string = '9'.repeat(10000);
      let d: Decimal = new Decimal(big);
      let r1: string = d.toString();
      let e1: string = big;
      expect(r1).assertEqual(e1);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_6100
     * @tc.name decimalToStringTest061
     * @tc.desc Verify toString() on new Decimal("0.0000010") returns "0.000001"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("0.0000010");
      let r1: string = d.toString();
      let e1: string = "0.000001";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_6200
     * @tc.name decimalToStringTest062
     * @tc.desc Verify toString() on new Decimal("1234567890.12345") returns "1234567890.12345"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1234567890.12345");
      let r1: string = d.toString();
      let e1: string = "1234567890.12345";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_6300
     * @tc.name decimalToStringTest063
     * @tc.desc Verify toString() on new Decimal("-0.0000001") returns "-1e-7"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("-0.0000001");
      let r1: string = d.toString();
      let e1: string = "-1e-7";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_6400
     * @tc.name decimalToStringTest064
     * @tc.desc Verify 1/0 toString Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(1).div(0);
      let r1: string = d.toString();
      let e1: string = "Infinity";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_6500
     * @tc.name decimalToStringTest065
     * @tc.desc Verify 0/0 toString returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0).div(0);
      let r1: string = d.toString();
      let e1: string = "NaN";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_6600
     * @tc.name decimalToStringTest066
     * @tc.desc Verify sqrt(-1) toString returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToStringTest066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-1).sqrt();
      let r1: string = d.toString();
      let e1: string = "NaN";
      expect(r1).assertEqual(e1);
    });
  });
}