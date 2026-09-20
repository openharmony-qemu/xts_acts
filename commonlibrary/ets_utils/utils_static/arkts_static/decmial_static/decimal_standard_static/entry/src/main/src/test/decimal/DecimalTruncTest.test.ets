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
import Utils from "../Util.test";
import { Decimal } from "@kit.ArkTS";

export default function decimalTruncTestTest(): void {
  describe("DecimalTruncTestTest", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_0100
     * @tc.name decimalTruncTest001
     * @tc.desc Verify trunc() on new Decimal(7.7) returns 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(7.7).trunc();
      let r1: string = d.toString();
      let e1: string = '7';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_0200
     * @tc.name decimalTruncTest002
     * @tc.desc Verify trunc() on new Decimal(5) returns 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(5).trunc();
      let r1: string = d.toString();
      let e1: string = '5';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_0300
     * @tc.name decimalTruncTest003
     * @tc.desc Verify trunc() on new Decimal(-5) returns -5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-5).trunc();
      let r1: string = d.toString();
      let e1: string = "-5";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_0400
     * @tc.name decimalTruncTest004
     * @tc.desc Verify trunc() on new Decimal(0) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0).trunc();
      let r1: string = d.toString();
      let e1: string = '0';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_0500
     * @tc.name decimalTruncTest005
     * @tc.desc Verify trunc() on new Decimal("NaN") returns Double.NaN and isNaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("NaN").trunc();
      let r1: string = d.toString();
      let e1: string = "NaN";
      expect(r1).assertEqual(e1);
      let r2: boolean = d.isNaN();
      expect(r2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_0600
     * @tc.name decimalTruncTest006
     * @tc.desc Verify trunc() on new Decimal("Infinity") returns Number.POSITIVE_INFINITY and not finite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("Infinity").trunc();
      let r1: string = d.toString();
      let e1: string = "Infinity";
      expect(r1).assertEqual(e1);
      let r2: boolean = d.isFinite();
      expect(r2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_0700
     * @tc.name decimalTruncTest007
     * @tc.desc Verify trunc() on new Decimal("-Infinity") returns -Number.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("-Infinity").trunc();
      let r1: string = d.toString();
      let e1: string = "-Infinity";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_0800
     * @tc.name decimalTruncTest008
     * @tc.desc Verify trunc() on new Decimal("-1.8") returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("-1.8").trunc();
      let r1: string = d.toString();
      let e1: string = "-1";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_0900
     * @tc.name decimalTruncTest009
     * @tc.desc Verify trunc() on new Decimal("123.999") returns 123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("123.999").trunc();
      let r1: string = d.toString();
      let e1: string = "123";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_1000
     * @tc.name decimalTruncTest010
     * @tc.desc Verify trunc() on new Decimal("0.000") returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("0.000").trunc();
      let r1: string = d.toString();
      let e1: string = '0';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_1100
     * @tc.name decimalTruncTest011
     * @tc.desc Verify trunc() on new Decimal("-0.0") returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("-0.0").trunc();
      let r1: string = d.toString();
      let e1: string = '0';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_1200
     * @tc.name decimalTruncTest012
     * @tc.desc Verify trunc() on new Decimal("1e5") returns 100000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1e5").trunc();
      let r1: string = d.toString();
      let e1: string = "100000";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_1300
     * @tc.name decimalTruncTest013
     * @tc.desc Verify trunc() on new Decimal("1.23e-4") returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.23e-4").trunc();
      let r1: string = d.toString();
      let e1: string = '0';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_1400
     * @tc.name decimalTruncTest014
     * @tc.desc Verify trunc() on new Decimal("2.5E-1") returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("2.5E-1").trunc();
      let r1: string = d.toString();
      let e1: string = '0';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_1500
     * @tc.name decimalTruncTest015
     * @tc.desc Verify trunc() on new Decimal("1e100")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1e100").trunc();
      let r1: boolean = d.equals(new Decimal("1e100"));
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_1600
     * @tc.name decimalTruncTest016
     * @tc.desc Verify trunc() on new Decimal("0005.7") returns 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("0005.7").trunc();
      let r1: string = d.toString();
      let e1: string = '5';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_1700
     * @tc.name decimalTruncTest017
     * @tc.desc Verify trunc() on new Decimal("2.7") returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Decimal = new Decimal("2.7");
      let d: Decimal = new Decimal(src).trunc();
      let r1: string = d.toString();
      let e1: string = '2';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_1800
     * @tc.name decimalTruncTest018
     * @tc.desc Verify trunc() on new Decimal(new Decimal(1.8).trunc()) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(new Decimal(1.8).trunc()).trunc();
      let r1: string = d.toString();
      let e1: string = '1';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_1900
     * @tc.name decimalTruncTest019
     * @tc.desc Verify trunc() on new Decimal(1.8) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(1.8).trunc();
      let r1: number = d.toNumber();
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_2000
     * @tc.name decimalTruncTest020
     * @tc.desc Verify trunc isInteger true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(123.456).trunc();
      let r1: boolean = d.isInteger();
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_2100
     * @tc.name decimalTruncTest021
     * @tc.desc Verify trunc() on new Decimal(-1.8) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-1.8).trunc().trunc();
      let r1: string = d.toString();
      let e1: string = "-1";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_2200
     * @tc.name decimalTruncTest022
     * @tc.desc Verify trunc() on new Decimal(1.8) then add(1) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(1.8).trunc().add(1);
      let r1: string = d.toString();
      let e1: string = '2';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_2300
     * @tc.name decimalTruncTest023
     * @tc.desc Verify trunc() does not mutate the source Decimal(1.8), src stays 1.8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncTest023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Decimal = new Decimal(1.8);
      let d: Decimal = src.trunc();
      let r1: string = src.toString();
      let e1: string = "1.8";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_2400
     * @tc.name decimalTruncTest024
     * @tc.desc Verify trunc floor -1.8 trunc floor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncTest024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t: Decimal = new Decimal(-1.8).trunc();
      let f: Decimal = new Decimal(-1.8).floor();
      let r1: boolean = t.greaterThan(f);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_2500
     * @tc.name decimalTruncTest025
     * @tc.desc Verify trunc ceil 1.2 trunc ceil
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncTest025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t: Decimal = new Decimal(1.2).trunc();
      let c: Decimal = new Decimal(1.2).ceil();
      let r1: boolean = t.lessThan(c);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_2600
     * @tc.name decimalTruncTest026
     * @tc.desc Verify trunc round 1.5 trunc round
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncTest026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t: Decimal = new Decimal(1.5).trunc();
      let r: Decimal = Decimal.round(new Decimal(1.5));
      let r1: boolean = t.lessThan(r);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_2700
     * @tc.name decimalTruncTest027
     * @tc.desc Verify trunc() on new Decimal(1.7976931348623157e+308)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncTest027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(1.7976931348623157e308).trunc();
      let r1: boolean = d.equals(new Decimal(1.7976931348623157e308));
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_2800
     * @tc.name decimalTruncTest028
     * @tc.desc Verify trunc() on new Decimal(5e-324)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncTest028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(5e-324).trunc();
      let r1: boolean = d.isZero();
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_2900
     * @tc.name decimalTruncTest029
     * @tc.desc Verify trunc() on new Decimal("9007199254740991.5") returns 9007199254740991
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncTest029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("9007199254740991.5").trunc();
      let r1: string = d.toString();
      let e1: string = "9007199254740991";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_3000
     * @tc.name decimalTruncTest030
     * @tc.desc Verify trunc() on new Decimal("-9007199254740991.5") returns -9007199254740991
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncTest030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("-9007199254740991.5").trunc();
      let r1: string = d.toString();
      let e1: string = "-9007199254740991";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_3100
     * @tc.name decimalTruncTest031
     * @tc.desc Verify trunc() on new Decimal(0.1+0.2) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncTest031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: double = 0.1 + 0.2;
      let d: Decimal = new Decimal(v).trunc();
      let r1: boolean = d.isZero();
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_3200
     * @tc.name decimalTruncTest032
     * @tc.desc Verify trunc() on new Decimal("12345678901234567890123.9") returns 1.2345678901234567890123e+22
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncTest032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 50 });
      let d: Decimal = new Decimal("12345678901234567890123.9").trunc();
      Decimal.set({ defaults: true });
      let r1: string = d.toString();
      let e1: string = "1.2345678901234567890123e+22";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_3300
     * @tc.name decimalTruncTest033
     * @tc.desc Verify rounding=ROUND_UP(0) trunc -1.8 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncTest033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: 0 });
      let d: Decimal = new Decimal(-1.8).trunc();
      Decimal.set({ defaults: true });
      let r1: string = d.toString();
      let e1: string = "-1";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_3400
     * @tc.name decimalTruncTest034
     * @tc.desc Verify rounding=ROUND_FLOOR(3) trunc -1.8 -1 -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncTest034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: 3 });
      let d: Decimal = new Decimal(-1.8).trunc();
      Decimal.set({ defaults: true });
      let r1: string = d.toString();
      let e1: string = "-1";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_3500
     * @tc.name decimalTruncTest035
     * @tc.desc Verify trunc("-0.5") isZero true -0/0 and negative and equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncTest035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("-0.5").trunc();
      let r1: boolean = d.isZero();
      expect(r1).assertTrue();
      let r2: boolean = d.isNegative();
      expect(r2).assertTrue();
      let r3: boolean = d.equals(new Decimal(0));
      expect(r3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_3600
     * @tc.name decimalTruncTest036
     * @tc.desc Verify trunc() on new Decimal("0.9999999999999999") returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalTruncTest036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("0.9999999999999999").trunc();
      let r1: string = d.toString();
      let e1: string = '0';
      expect(r1).assertEqual(e1);
    });
  });
}