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
import { BusinessError } from "@ohos.base";

export default function decimalToOctalPart05Test(): void {
  describe("DecimalToOctalPart05Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_0100
     * @tc.name decimalToOctalPart05Test001
     * @tc.desc Verify sd=1 42 toOctal(1) toOctal(1, ROUND_UP)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(42);
      let a: string = d.toOctal(1);
      let b: string = d.toOctal(1, Decimal.ROUND_UP);
      expect(a).assertEqual("0o1p+5");
      expect(b).assertEqual("0o1p+6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_0200
     * @tc.name decimalToOctalPart05Test002
     * @tc.desc Verify sd=1 toOctal(1) toOctal(1, ROUND_HALF_UP) = ROUND_HALF_UP
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(42);
      let actual: string = d.toOctal(1);
      let expected: string = d.toOctal(1, Decimal.ROUND_HALF_UP);
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_0300
     * @tc.name decimalToOctalPart05Test003
     * @tc.desc Verify toOctal(sd) on new Decimal(42) returns string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sd: double = 20;
      let a: string = new Decimal(42).toOctal(sd);
      let b: string = new Decimal(42).toOctal(sd, Decimal.ROUND_DOWN);
      expect(a).assertEqual("0o1.24p+5");
      expect(b).assertEqual("0o1.24p+5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_0400
     * @tc.name decimalToOctalPart05Test004
     * @tc.desc Verify -42 sd=1 toOctal(1) toOctal(1, ROUND_FLOOR)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-42);
      let a: string = d.toOctal(1);
      let b: string = d.toOctal(1, Decimal.ROUND_FLOOR);
      expect(a).assertEqual("-0o1p+5");
      expect(b).assertEqual("-0o1p+6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_0500
     * @tc.name decimalToOctalPart05Test005
     * @tc.desc Verify 5.5 sd=1 toOctal(1) toOctal(1, ROUND_DOWN)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(5.5);
      let a: string = d.toOctal(1);
      let b: string = d.toOctal(1, Decimal.ROUND_DOWN);
      expect(a).assertEqual("0o1p+2");
      expect(b).assertEqual("0o1p+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_0600
     * @tc.name decimalToOctalPart05Test006
     * @tc.desc Verify toOctal(20) on new Decimal(Double.NaN) returns "NaN"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(Double.NaN);
      let actual: string = d.toOctal(20);
      let expected: string = "NaN";
      expect(actual).assertEqual(expected);
      let actual2: string = d.toOctal(20, Decimal.ROUND_DOWN);
      let expected2: string = "NaN";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_0700
     * @tc.name decimalToOctalPart05Test007
     * @tc.desc Verify toOctal(20) on new Decimal(0.5) returns 0o1p-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0.5);
      let actual: string = d.toOctal(20);
      let expected: string = "0o1p-1";
      expect(actual).assertEqual(expected);
      let actual2: string = d.toOctal(20, Decimal.ROUND_UP);
      let expected2: string = "0o1p-1";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_0800
     * @tc.name decimalToOctalPart05Test008
     * @tc.desc Verify toOctal(1000) on new Decimal(42) returns d.toOctal(1000, Decimal.ROUND_HALF_UP)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(42);
      let actual: string = d.toOctal(1000);
      let expected: string = d.toOctal(1000, Decimal.ROUND_HALF_UP);
      expect(actual).assertEqual(expected);
      expect(actual).assertEqual("0o1.24p+5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_0900
     * @tc.name decimalToOctalPart05Test009
     * @tc.desc Verify toOctal(20) on new Decimal(-0.5) returns -0o1p-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-0.5);
      let actual: string = d.toOctal(20);
      let expected: string = "-0o1p-1";
      expect(actual).assertEqual(expected);
      let actual2: string = d.toOctal(20, Decimal.ROUND_UP);
      let expected2: string = "-0o1p-1";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_1000
     * @tc.name decimalToOctalPart05Test010
     * @tc.desc Verify toOctal(20) on new Decimal(8) returns 0o1p+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(8);
      let actual: string = d.toOctal(20);
      let expected: string = "0o1p+3";
      expect(actual).assertEqual(expected);
      let actual2: string = d.toOctal(20, Decimal.ROUND_DOWN);
      let expected2: string = "0o1p+3";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_1100
     * @tc.name decimalToOctalPart05Test011
     * @tc.desc Verify toOctal(20) on new Decimal("1e2") returns 0o1.44p+6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1e2");
      let actual: string = d.toOctal(20);
      let expected: string = "0o1.44p+6";
      expect(actual).assertEqual(expected);
      let actual2: string = d.toOctal(20, Decimal.ROUND_HALF_UP);
      let expected2: string = "0o1.44p+6";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_1200
     * @tc.name decimalToOctalPart05Test012
     * @tc.desc Verify toOctal(20) on new Decimal(0.25) returns 0o1p-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0.25);
      let actual: string = d.toOctal(20);
      let expected: string = "0o1p-2";
      expect(actual).assertEqual(expected);
      let actual2: string = d.toOctal(20, Decimal.ROUND_DOWN);
      let expected2: string = "0o1p-2";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_1300
     * @tc.name decimalToOctalPart05Test013
     * @tc.desc Verify toOctal(20) on new Decimal(64) returns 0o1p+6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(64);
      let actual: string = d.toOctal(20);
      let expected: string = "0o1p+6";
      expect(actual).assertEqual(expected);
      let actual2: string = d.toOctal(20, Decimal.ROUND_HALF_UP);
      let expected2: string = "0o1p+6";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_1400
     * @tc.name decimalToOctalPart05Test014
     * @tc.desc Verify toOctal(20) on new Decimal("0123") returns 0o1.73p+6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("0123");
      let actual: string = d.toOctal(20);
      let expected: string = "0o1.73p+6";
      expect(actual).assertEqual(expected);
      let actual2: string = d.toOctal(20, Decimal.ROUND_DOWN);
      let expected2: string = "0o1.73p+6";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_1500
     * @tc.name decimalToOctalPart05Test015
     * @tc.desc Verify toOctal(1) on new Decimal(5.5) returns b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let a: string = new Decimal(5.5).toOctal(1);
      let b: string = new Decimal(5.5).toOctal(1, Decimal.ROUND_DOWN);
      Decimal.set({ defaults: true });
      expect(a).assertEqual(b);
      expect(a).assertEqual("0o1p+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_1600
     * @tc.name decimalToOctalPart05Test016
     * @tc.desc Verify toOctal(1) on new Decimal(42) returns b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_UP });
      let a: string = new Decimal(42).toOctal(1);
      let b: string = new Decimal(42).toOctal(1, Decimal.ROUND_UP);
      Decimal.set({ defaults: true });
      expect(a).assertEqual(b);
      expect(a).assertEqual("0o1p+6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_1700
     * @tc.name decimalToOctalPart05Test017
     * @tc.desc Verify toOctal(1) on new Decimal(-42) returns b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_FLOOR });
      let a: string = new Decimal(-42).toOctal(1);
      let b: string = new Decimal(-42).toOctal(1, Decimal.ROUND_FLOOR);
      Decimal.set({ defaults: true });
      expect(a).assertEqual(b);
      expect(a).assertEqual("-0o1p+6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_1800
     * @tc.name decimalToOctalPart05Test018
     * @tc.desc Verify toOctal(20) on new Decimal(-0) returns -0o0p+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_UP });
      let d: Decimal = new Decimal(-0);
      let a: string = d.toOctal(20);
      let b: string = d.toOctal(20, Decimal.ROUND_DOWN);
      Decimal.set({ defaults: true });
      expect(a).assertEqual("-0o0p+0");
      expect(b).assertEqual("-0o0p+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_1900
     * @tc.name decimalToOctalPart05Test019
     * @tc.desc Verify toOctal(20) on new Decimal(0.125) returns 0o1p-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_UP });
      let d: Decimal = new Decimal(0.125);
      let a: string = d.toOctal(20);
      let b: string = d.toOctal(20, Decimal.ROUND_DOWN);
      Decimal.set({ defaults: true });
      expect(a).assertEqual("0o1p-3");
      expect(b).assertEqual("0o1p-3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_2000
     * @tc.name decimalToOctalPart05Test020
     * @tc.desc Verify toOctal(20) on new Decimal(Number.POSITIVE_INFINITY) returns "Infinity"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_FLOOR });
      let d: Decimal = new Decimal(Number.POSITIVE_INFINITY);
      let a: string = d.toOctal(20);
      let b: string = d.toOctal(20, Decimal.ROUND_UP);
      Decimal.set({ defaults: true });
      expect(a).assertEqual("Infinity");
      expect(b).assertEqual("Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_2100
     * @tc.name decimalToOctalPart05Test021
     * @tc.desc Verify toOctal(20) on new Decimal(-Number.POSITIVE_INFINITY) returns "-Infinity"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_FLOOR });
      let d: Decimal = new Decimal(-Number.POSITIVE_INFINITY);
      let a: string = d.toOctal(20);
      let b: string = d.toOctal(20, Decimal.ROUND_UP);
      Decimal.set({ defaults: true });
      expect(a).assertEqual("-Infinity");
      expect(b).assertEqual("-Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_2200
     * @tc.name decimalToOctalPart05Test022
     * @tc.desc Verify toOctal(20) on new Decimal(10) returns b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 5 });
      let d: Decimal = new Decimal(10);
      let a: string = d.toOctal(20);
      let b: string = d.toOctal(20, Decimal.ROUND_HALF_UP);
      Decimal.set({ defaults: true });
      expect(a).assertEqual(b);
      expect(a).assertEqual("0o1.2p+3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_2300
     * @tc.name decimalToOctalPart05Test023
     * @tc.desc Verify toOctal(1, Decimal.ROUND_UP) on new Decimal(5.5) returns 0o1p+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let s: string = new Decimal(5.5).toOctal(1, Decimal.ROUND_UP);
      Decimal.set({ defaults: true });
      expect(s).assertEqual("0o1p+3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_2400
     * @tc.name decimalToOctalPart05Test024
     * @tc.desc Verify toOctal(0) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(42);
      let before: Array<double> | null = d.d;
      try {
        d.toOctal(0);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
      }
      let actual2: Array<double> | null = d.d;
      let expected2: Array<double> | null = before;
      expect(actual2).assertEqual(expected2);
      let actual3: string = d.toString();
      let expected3: string = "42";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_2500
     * @tc.name decimalToOctalPart05Test025
     * @tc.desc Verify toOctal(20, 9) throws BusinessError and toOctal(20) on new Decimal(42) returns 0o1.24p+5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(42);
      let e0: double = d.e;
      let before: Array<double> | null = d.d;
      try {
        d.toOctal(20, 9);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      let actual: number = d.e;
      let expected: number = e0;
      expect(actual).assertEqual(expected);
      let actual2: Array<double> | null = d.d;
      let expected2: Array<double> | null = before;
      expect(actual2).assertEqual(expected2);
      let actual3: string = d.toOctal(20);
      let expected3: string = "0o1.24p+5";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_2600
     * @tc.name decimalToOctalPart05Test026
     * @tc.desc Verify toOctal(20, -1) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(42);
      let s0: double = d.s;
      try {
        d.toOctal(20, -1);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      let actual: number = d.s;
      let expected: number = s0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_2700
     * @tc.name decimalToOctalPart05Test027
     * @tc.desc Verify toOctal(-1) throws BusinessError and toOctal(20, Decimal.ROUND_DOWN) on new Decimal(42) returns 0o1.24p+5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(42);
      try {
        d.toOctal(-1);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
      }
      let actual2: string = d.toOctal(20, Decimal.ROUND_DOWN);
      let expected2: string = "0o1.24p+5";
      expect(actual2).assertEqual(expected2);
      let actual3: number = d.comparedTo(new Decimal(42));
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_2800
     * @tc.name decimalToOctalPart05Test028
     * @tc.desc Verify toOctal(Double.NaN, 4) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(42);
      let len0: number = d.d!.length;
      try {
        d.toOctal(Double.NaN, 4);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
      }
      let actual2: int = d.d!.length;
      let expected2: number = len0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_2900
     * @tc.name decimalToOctalPart05Test029
     * @tc.desc Verify toOctal(Double.NaN) on new Decimal(42) throws BusinessError and toOctal(20) on new Decimal(0.5) returns 0o1p-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Decimal = new Decimal(42);
      let d2: Decimal = new Decimal(0.5);
      try {
        d1.toOctal(Double.NaN);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      let actual: string = d2.toOctal(20);
      let expected: string = "0o1p-1";
      expect(actual).assertEqual(expected);
      let actual2: string = d2.toOctal(20, Decimal.ROUND_DOWN);
      let expected2: string = "0o1p-1";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_3000
     * @tc.name decimalToOctalPart05Test030
     * @tc.desc Verify toOctal(0, 4) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Decimal = new Decimal(42);
      let d2: Decimal = d1;
      let e0: double = d1.e;
      try {
        d2.toOctal(0, 4);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
      }
      let actual2: number = d1.e;
      let expected2: number = e0;
      expect(actual2).assertEqual(expected2);
      let actual3: string = d1.toString();
      let expected3: string = "42";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_3100
     * @tc.name decimalToOctalPart05Test031
     * @tc.desc Verify toOctal(2e9) throws BusinessError and toOctal(20) on new Decimal(64) returns 0o1p+6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(64);
      try {
        d.toOctal(2e9);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
      }
      let actual2: string = d.toOctal(20);
      let expected2: string = "0o1p+6";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_3200
     * @tc.name decimalToOctalPart05Test032
     * @tc.desc Verify toOctal(-Number.POSITIVE_INFINITY, 4) throws BusinessError and toOctal(20, Decimal.ROUND_HALF_UP) on new Decimal(42) returns 0o1.24p+5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(42);
      try {
        d.toOctal(-Number.POSITIVE_INFINITY, 4);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
      }
      let actual2: string = d.toOctal(20, Decimal.ROUND_HALF_UP);
      let expected2: string = "0o1.24p+5";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_3300
     * @tc.name decimalToOctalPart05Test033
     * @tc.desc Verify toOctal does not mutate source Decimal(42), toString remains 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(42);
      d.toOctal(20);
      d.toOctal(20, Decimal.ROUND_UP);
      let actual: string = d.toString();
      let expected: string = "42";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_3400
     * @tc.name decimalToOctalPart05Test034
     * @tc.desc Verify toOctal(20) on new Decimal(42) returns e0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(42);
      let e0: double = d.e;
      d.toOctal(20);
      d.toOctal(20, Decimal.ROUND_DOWN);
      let actual: number = d.e;
      let expected: number = e0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_3500
     * @tc.name decimalToOctalPart05Test035
     * @tc.desc Verify d.s=-1 toOctal "-0o1.24p+5"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-42);
      let actual: string = d.toOctal(20, Decimal.ROUND_DOWN);
      let expected: string = "-0o1.24p+5";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_3600
     * @tc.name decimalToOctalPart05Test036
     * @tc.desc Verify toOctal(20, Decimal.ROUND_HALF_UP) on new Decimal(255)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(255);
      let s: string = d.toOctal(20, Decimal.ROUND_HALF_UP);
      let actual: boolean = new Decimal(s).equals(d);
      expect(actual).assertTrue();
      expect(s).assertEqual("0o1.774p+7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_3700
     * @tc.name decimalToOctalPart05Test037
     * @tc.desc Verify toOctal(20) on new Decimal(42)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(42);
      let actual: boolean = d.toOctal(20).includes('e');
      expect(actual).assertFalse();
      let actual2: boolean = d.toOctal(20, Decimal.ROUND_DOWN).includes('e');
      expect(actual2).assertFalse();
      let s1: string = d.toOctal(20);
      expect(s1).assertEqual("0o1.24p+5");
      let s2: string = d.toOctal(20, Decimal.ROUND_DOWN);
      expect(s2).assertEqual("0o1.24p+5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_3800
     * @tc.name decimalToOctalPart05Test038
     * @tc.desc Verify toOctal(20) on new Decimal(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(5);
      let actual: boolean = d.toOctal(20).startsWith("0o");
      expect(actual).assertTrue();
      let actual2: boolean = d.toOctal(20, Decimal.ROUND_UP).startsWith("0o");
      expect(actual2).assertTrue();
      let s1: string = d.toOctal(20);
      expect(s1).assertEqual("0o1.2p+2");
      let s2: string = d.toOctal(20, Decimal.ROUND_UP);
      expect(s2).assertEqual("0o1.2p+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_3900
     * @tc.name decimalToOctalPart05Test039
     * @tc.desc Verify toOctal(20) on new Decimal(-5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-5);
      let actual: boolean = d.toOctal(20).startsWith("-0o");
      expect(actual).assertTrue();
      let actual2: boolean = d.toOctal(20, Decimal.ROUND_UP).startsWith("-0o");
      expect(actual2).assertTrue();
      let s1: string = d.toOctal(20);
      expect(s1).assertEqual("-0o1.2p+2");
      let s2: string = d.toOctal(20, Decimal.ROUND_UP);
      expect(s2).assertEqual("-0o1.2p+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_4000
     * @tc.name decimalToOctalPart05Test040
     * @tc.desc Verify toOctal(1) on new Decimal(42) returns before
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(42);
      let before: Array<double> | null = d.d;
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let s: string = d.toOctal(1);
      Decimal.set({ defaults: true });
      let actual: Array<double> | null = d.d;
      let expected: Array<double> | null = before;
      expect(actual).assertEqual(expected);
      expect(s).assertEqual("0o1p+5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_4100
     * @tc.name decimalToOctalPart05Test041
     * @tc.desc Verify NaN d.d null toOctal arity null digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(Double.NaN);
      d.toOctal(20);
      d.toOctal(20, Decimal.ROUND_DOWN);
      expect(d.d).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART05_4200
     * @tc.name decimalToOctalPart05Test042
     * @tc.desc Verify toOctal(1) on new Decimal(42) returns b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart05Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let d1: Decimal = new Decimal(42);
      let a: string = d1.toOctal(1);
      let d2: Decimal = new Decimal(42);
      let b: string = d2.toOctal(1);
      Decimal.set({ defaults: true });
      expect(a).assertEqual(b);
      expect(a).assertEqual("0o1p+5");
    });
  });
}