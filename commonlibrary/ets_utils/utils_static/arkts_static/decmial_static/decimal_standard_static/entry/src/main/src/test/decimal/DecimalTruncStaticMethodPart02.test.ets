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
import Utils from "../Util.test";
import { Decimal } from "@kit.ArkTS";

export default function decimalTruncStaticMethodPart02Test(): void {
  describe("DecimalTruncStaticMethodPart02Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_0100
     * @tc.name decimalTruncStaticMethodPart02Test001
     * @tc.desc Verify trunc(7.7) returns 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc(7.7);
      expect(r.toString()).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_0200
     * @tc.name decimalTruncStaticMethodPart02Test002
     * @tc.desc Verify trunc("-7.7") returns -7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("-7.7");
      expect(r.toString()).assertEqual("-7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_0300
     * @tc.name decimalTruncStaticMethodPart02Test003
     * @tc.desc Verify trunc(src) on new Decimal(7.7) returns a new instance (not the same reference as src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Decimal = new Decimal(7.7);
      let r: Decimal = Decimal.trunc(src);
      let actual: boolean = r === src;
      expect(actual).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_0400
     * @tc.name decimalTruncStaticMethodPart02Test004
     * @tc.desc Verify trunc("7.7") sign field s equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("7.7");
      let actual: number = r.s;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_0500
     * @tc.name decimalTruncStaticMethodPart02Test005
     * @tc.desc Verify trunc("-7.7") s -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("-7.7");
      let actual: number = r.s;
      let expected: int = -1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_0600
     * @tc.name decimalTruncStaticMethodPart02Test006
     * @tc.desc Verify trunc("-123.456") e equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("-123.456");
      expect(r.e).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_0700
     * @tc.name decimalTruncStaticMethodPart02Test007
     * @tc.desc Verify trunc("-123.456") s equals -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("-123.456");
      expect(r.s).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_0800
     * @tc.name decimalTruncStaticMethodPart02Test008
     * @tc.desc Verify trunc digits Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("-123.456");
      let actual: boolean = r.d instanceof Array;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_0900
     * @tc.name decimalTruncStaticMethodPart02Test009
     * @tc.desc Verify trunc("7.7") toNumber returns 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("7.7");
      expect(r.toNumber()).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_1000
     * @tc.name decimalTruncStaticMethodPart02Test010
     * @tc.desc Verify trunc("0.999") returns '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("0.999");
      let actual: string = r.toString();
      let expected: string = '0';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_1100
     * @tc.name decimalTruncStaticMethodPart02Test011
     * @tc.desc Verify trunc("-0.999") returns '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("-0.999");
      let actual: string = r.toString();
      let expected: string = '0';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_1200
     * @tc.name decimalTruncStaticMethodPart02Test012
     * @tc.desc Verify trunc("123.456") 123 and e is 2 and equals 123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("123.456");
      let actual: string = r.toString();
      let expected: string = "123";
      expect(actual).assertEqual(expected);
      let actual2: number = r.e;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
      let actual3: number = r.comparedTo(123);
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_1300
     * @tc.name decimalTruncStaticMethodPart02Test013
     * @tc.desc Verify trunc("-123.456") -123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("-123.456");
      let actual: string = r.toString();
      let expected: string = "-123";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_1400
     * @tc.name decimalTruncStaticMethodPart02Test014
     * @tc.desc Verify trunc(2) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc(2);
      let actual: string = r.toString();
      let expected: string = '2';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_1500
     * @tc.name decimalTruncStaticMethodPart02Test015
     * @tc.desc Verify trunc(-2) returns -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc(-2);
      let actual: string = r.toString();
      let expected: string = "-2";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_1600
     * @tc.name decimalTruncStaticMethodPart02Test016
     * @tc.desc Verify trunc(-0) double toString '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc(-0);
      let actual: string = r.toString();
      let expected: string = '0';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_1700
     * @tc.name decimalTruncStaticMethodPart02Test017
     * @tc.desc Verify trunc("-0") isZero true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("-0");
      let actual: boolean = r.isZero();
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_1800
     * @tc.name decimalTruncStaticMethodPart02Test018
     * @tc.desc Verify trunc("0.5") isPositive true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("0.5");
      let actual: boolean = r.isPositive();
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_1900
     * @tc.name decimalTruncStaticMethodPart02Test019
     * @tc.desc Verify trunc("1e5") 100000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("1e5");
      let actual: string = r.toString();
      let expected: string = "100000";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_2000
     * @tc.name decimalTruncStaticMethodPart02Test020
     * @tc.desc Verify trunc("-1e5") -100000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("-1e5");
      let actual: string = r.toString();
      let expected: string = "-100000";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_2100
     * @tc.name decimalTruncStaticMethodPart02Test021
     * @tc.desc Verify trunc("1.23e-4") 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("1.23e-4");
      let actual: string = r.toString();
      let expected: string = '0';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_2200
     * @tc.name decimalTruncStaticMethodPart02Test022
     * @tc.desc Verify trunc("1234567890123456789.5") returns 1234567890123456789
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("1234567890123456789.5");
      let actual: string = r.toString();
      let expected: string = "1234567890123456789";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_2300
     * @tc.name decimalTruncStaticMethodPart02Test023
     * @tc.desc Verify trunc("-1234567890123456789.5") returns -1234567890123456789
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("-1234567890123456789.5");
      let actual: string = r.toString();
      let expected: string = "-1234567890123456789";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_2400
     * @tc.name decimalTruncStaticMethodPart02Test024
     * @tc.desc Verify trunc("-7.7") comparedTo(-7) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("-7.7");
      let actual: number = r.comparedTo(-7);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_2500
     * @tc.name decimalTruncStaticMethodPart02Test025
     * @tc.desc Verify trunc("7.7") isInteger true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("7.7");
      let actual: boolean = r.isInteger();
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_2600
     * @tc.name decimalTruncStaticMethodPart02Test026
     * @tc.desc Verify trunc("-7.7") isFinite true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("-7.7");
      let actual: boolean = r.isFinite();
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_2700
     * @tc.name decimalTruncStaticMethodPart02Test027
     * @tc.desc Verify trunc("7.7") isNaN false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("7.7");
      let actual: boolean = r.isNaN();
      expect(actual).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_2800
     * @tc.name decimalTruncStaticMethodPart02Test028
     * @tc.desc Verify trunc("0.5") trunc("-0.5") equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Decimal = Decimal.trunc("0.5");
      let n: Decimal = Decimal.trunc("-0.5");
      let actual: boolean = p.equals(n);
      expect(actual).assertTrue();
      expect(p.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_2900
     * @tc.name decimalTruncStaticMethodPart02Test029
     * @tc.desc Verify trunc(new Decimal("9.9")) Decimal 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Decimal = new Decimal("9.9");
      let r: Decimal = Decimal.trunc(src);
      let actual: string = r.toString();
      let expected: string = '9';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_3000
     * @tc.name decimalTruncStaticMethodPart02Test030
     * @tc.desc Verify trunc(new Decimal("-9.9")) Decimal -9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Decimal = new Decimal("-9.9");
      let r: Decimal = Decimal.trunc(src);
      let actual: string = r.toString();
      let expected: string = "-9";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_3100
     * @tc.name decimalTruncStaticMethodPart02Test031
     * @tc.desc Verify trunc("7.7") digits 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("7.7");
      let actual: int = r.d!.length;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_3200
     * @tc.name decimalTruncStaticMethodPart02Test032
     * @tc.desc Verify trunc(0) has coefficient digits length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc(0);
      let actual: int = r.d!.length;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_3300
     * @tc.name decimalTruncStaticMethodPart02Test033
     * @tc.desc Verify trunc("1000") equals 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("1000");
      let actual: number = r.comparedTo(1000);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_3400
     * @tc.name decimalTruncStaticMethodPart02Test034
     * @tc.desc Verify trunc("999.999") e 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("999.999");
      let actual: number = r.e;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_3500
     * @tc.name decimalTruncStaticMethodPart02Test035
     * @tc.desc Verify trunc Decimal toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Decimal = new Decimal("7.7");
      let before: string = src.toString();
      Decimal.trunc(src);
      let actual: string = src.toString();
      let expected: string = before;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_3600
     * @tc.name decimalTruncStaticMethodPart02Test036
     * @tc.desc Verify Decimal.trunc is not affected by DecimalConfig precision 5 and div respects precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 5 });
      let trunced: Decimal = Decimal.trunc("-123.456");
      let actual0: string = trunced.toString();
      let expected0: string = "-123";
      expect(actual0).assertEqual(expected0);
      let probe: Decimal = new Decimal('1').div(3);
      let actual: string = probe.toString();
      let expected: string = "0.33333";
      expect(actual).assertEqual(expected);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_3700
     * @tc.name decimalTruncStaticMethodPart02Test037
     * @tc.desc Verify trunc("2.9").add(1) returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("2.9").add(1);
      let actual: string = r.toString();
      let expected: string = '3';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_3800
     * @tc.name decimalTruncStaticMethodPart02Test038
     * @tc.desc Verify trunc("2.9").mul(2) returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("2.9").mul(2);
      let actual: string = r.toString();
      let expected: string = '4';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_3900
     * @tc.name decimalTruncStaticMethodPart02Test039
     * @tc.desc Verify trunc("2.9").sub(1) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("2.9").sub(1);
      let actual: string = r.toString();
      let expected: string = '1';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_4000
     * @tc.name decimalTruncStaticMethodPart02Test040
     * @tc.desc Verify trunc("5.9").div(2) returns 2.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("5.9").div(2);
      let actual: string = r.toString();
      let expected: string = "2.5";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_4100
     * @tc.name decimalTruncStaticMethodPart02Test041
     * @tc.desc Verify trunc("7.9").mod(3) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("7.9").mod(3);
      let actual: string = r.toString();
      let expected: string = '1';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_4200
     * @tc.name decimalTruncStaticMethodPart02Test042
     * @tc.desc Verify trunc("2.9").toFixed(2) returns 2.00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = Decimal.trunc("2.9").toFixed(2);
      expect(r).assertEqual("2.00");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_4300
     * @tc.name decimalTruncStaticMethodPart02Test043
     * @tc.desc Verify trunc("4.9").comparedTo(5) returns -1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: double = Decimal.trunc("4.9").comparedTo(5);
      expect(r).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_4400
     * @tc.name decimalTruncStaticMethodPart02Test044
     * @tc.desc Verify trunc("-2.1").abs() returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("-2.1").abs();
      let actual: string = r.toString();
      let expected: string = '2';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_4500
     * @tc.name decimalTruncStaticMethodPart02Test045
     * @tc.desc Verify trunc("2.9").negate() returns -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc("2.9").negate();
      let actual: string = r.toString();
      let expected: string = "-2";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_STATIC_METHOD_PART02_4600
     * @tc.name decimalTruncStaticMethodPart02Test046
     * @tc.desc Verify trunc(Decimal.trunc("4.9")) returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncStaticMethodPart02Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.trunc(Decimal.trunc("4.9"));
      let actual: string = r.toString();
      let expected: string = '4';
      expect(actual).assertEqual(expected);
    });
  });
}