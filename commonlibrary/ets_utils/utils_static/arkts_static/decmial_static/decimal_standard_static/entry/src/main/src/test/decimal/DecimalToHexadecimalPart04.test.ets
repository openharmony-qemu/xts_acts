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

export default function decimalToHexadecimalPart04Test(): void {
  describe("DecimalToHexadecimalPart04Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART04_0100
     * @tc.name decimalToHexadecimalPart04Test001
     * @tc.desc Verify toHexadecimal(20) on new Decimal(128) returns 0x1p+7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart04Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(128).toHexadecimal(20);
      expect(s).assertEqual("0x1p+7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART04_0200
     * @tc.name decimalToHexadecimalPart04Test002
     * @tc.desc Verify toHexadecimal(20) on new Decimal(255) returns b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart04Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = new Decimal(255).toHexadecimal(20);
      let b: string = new Decimal(255).toHexadecimal(20, 4);
      expect(a).assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART04_0300
     * @tc.name decimalToHexadecimalPart04Test003
     * @tc.desc Verify toHexadecimal(1) on new Decimal(255) a and b not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart04Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = new Decimal(255).toHexadecimal(1);
      let b: string = new Decimal(255).toHexadecimal(1, Decimal.ROUND_DOWN);
      expect(a).not().assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART04_0400
     * @tc.name decimalToHexadecimalPart04Test004
     * @tc.desc Verify toHexadecimal(4) 4 significantDigits 255 returns 0x1.fep+7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart04Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(255).toHexadecimal(4);
      expect(s).assertEqual("0x1.fep+7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART04_0500
     * @tc.name decimalToHexadecimalPart04Test005
     * @tc.desc Verify toHexadecimal(4, 4) sd rm 255.5 returns 0x1.ffp+7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart04Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(255.5).toHexadecimal(4, 4);
      expect(s).assertEqual("0x1.ffp+7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART04_0600
     * @tc.name decimalToHexadecimalPart04Test006
     * @tc.desc Verify toHexadecimal(1) on new Decimal(255) returns 0x1p+8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart04Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(255).toHexadecimal(1);
      expect(s).assertEqual("0x1p+8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART04_0700
     * @tc.name decimalToHexadecimalPart04Test007
     * @tc.desc Verify toHexadecimal(1) on new Decimal(255) returns b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart04Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = new Decimal(255).toHexadecimal(1);
      let b: string = new Decimal(255).toHexadecimal(1, Decimal.ROUND_UP);
      expect(a).assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART04_0800
     * @tc.name decimalToHexadecimalPart04Test008
     * @tc.desc Verify toHexadecimal(1) on new Decimal(255) returns 0x1p+7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart04Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let s: string = new Decimal(255).toHexadecimal(1);
      Decimal.set({ defaults: true });
      expect(s).assertEqual("0x1p+7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART04_0900
     * @tc.name decimalToHexadecimalPart04Test009
     * @tc.desc Verify toHexadecimal(1, Decimal.ROUND_HALF_UP) on new Decimal(1.5) returns 0x1p+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart04Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let s: string = new Decimal(1.5).toHexadecimal(1, Decimal.ROUND_HALF_UP);
      Decimal.set({ defaults: true });
      expect(s).assertEqual("0x1p+1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART04_1000
     * @tc.name decimalToHexadecimalPart04Test010
     * @tc.desc Verify toHexadecimal(1) on new Decimal(1.5) a and b not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart04Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let a: string = new Decimal(1.5).toHexadecimal(1);
      let b: string = new Decimal(1.5).toHexadecimal(1, Decimal.ROUND_HALF_UP);
      Decimal.set({ defaults: true });
      expect(a).not().assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART04_1100
     * @tc.name decimalToHexadecimalPart04Test011
     * @tc.desc Verify toHexadecimal(1) on new Decimal(255) returns 0x1p+8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart04Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_UP });
      let s: string = new Decimal(255).toHexadecimal(1);
      Decimal.set({ defaults: true });
      expect(s).assertEqual("0x1p+8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART04_1200
     * @tc.name decimalToHexadecimalPart04Test012
     * @tc.desc Verify toHexadecimal(1, Decimal.ROUND_DOWN) on new Decimal(1.5) returns 0x1p+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart04Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_UP });
      let s: string = new Decimal(1.5).toHexadecimal(1, Decimal.ROUND_DOWN);
      Decimal.set({ defaults: true });
      expect(s).assertEqual("0x1p+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART04_1300
     * @tc.name decimalToHexadecimalPart04Test013
     * @tc.desc Verify toHexadecimal(1) on new Decimal(-1.5) returns -0x1p+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart04Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_FLOOR });
      let s: string = new Decimal(-1.5).toHexadecimal(1);
      Decimal.set({ defaults: true });
      expect(s).assertEqual("-0x1p+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART04_1400
     * @tc.name decimalToHexadecimalPart04Test014
     * @tc.desc Verify toHexadecimal(1, Decimal.ROUND_CEILING) on new Decimal(-1.5) returns -0x1p+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart04Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_FLOOR });
      let s: string = new Decimal(-1.5).toHexadecimal(1, Decimal.ROUND_CEILING);
      Decimal.set({ defaults: true });
      expect(s).assertEqual("-0x1p+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART04_1500
     * @tc.name decimalToHexadecimalPart04Test015
     * @tc.desc Verify toHexadecimal(0) on new Decimal(255) throws BusinessError code 10200001 and keeps the Decimal unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart04Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(255);
      let coeff: Array<double> | null = d.d;
      let before: Array<double> | null = coeff === null ? null : coeff.slice();
      try {
        d.toHexadecimal(0);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
      }
      let actual2: Array<double> | null = d.d;
      let expected2: Array<double> | null = before;
      expect(actual2).assertDeepEquals(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART04_1600
     * @tc.name decimalToHexadecimalPart04Test016
     * @tc.desc Verify toHexadecimal(-1) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart04Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(255);
      try {
        d.toHexadecimal(-1);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
      }
      let actual2: string = d.toString();
      let expected2: string = "255";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART04_1700
     * @tc.name decimalToHexadecimalPart04Test017
     * @tc.desc Verify toHexadecimal(0, 4) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart04Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(255);
      let e0: double = d.e;
      try {
        d.toHexadecimal(0, 4);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
      }
      let actual2: number = d.e;
      let expected2: number = e0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART04_1800
     * @tc.name decimalToHexadecimalPart04Test018
     * @tc.desc Verify toHexadecimal(20, 9) on new Decimal(255) throws BusinessError code 10200001, keeps the Decimal unchanged and returns 0x1.fep+7 after
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart04Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(255);
      let coeff: Array<double> | null = d.d;
      let before: Array<double> | null = coeff === null ? null : coeff.slice();
      try {
        d.toHexadecimal(20, 9);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
      }
      let actual2: Array<double> | null = d.d;
      let expected2: Array<double> | null = before;
      expect(actual2).assertDeepEquals(expected2);
      let actual3: string = d.toHexadecimal(20);
      let expected3: string = "0x1.fep+7";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART04_1900
     * @tc.name decimalToHexadecimalPart04Test019
     * @tc.desc Verify toHexadecimal throws BusinessError and returns 0x1.cp+2 for 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart04Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Decimal = new Decimal(255);
      let d2: Decimal = new Decimal(7);
      try {
        d1.toHexadecimal(2e9);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
      }
      let actual2: string = d2.toHexadecimal(20);
      let expected2: string = "0x1.cp+2";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART04_2000
     * @tc.name decimalToHexadecimalPart04Test020
     * @tc.desc Verify toHexadecimal(20, -1) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart04Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(42);
      try {
        d.toHexadecimal(20, -1);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
      }
      let actual2: number = d.s;
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART04_2100
     * @tc.name decimalToHexadecimalPart04Test021
     * @tc.desc Verify toHexadecimal(Double.NaN) on new Decimal(255) throws BusinessError code 10200001 and keeps the Decimal unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart04Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(255);
      let coeff: Array<double> | null = d.d;
      let before: Array<double> | null = coeff === null ? null : coeff.slice();
      try {
        d.toHexadecimal(Double.NaN);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
      }
      let actual2: Array<double> | null = d.d;
      let expected2: Array<double> | null = before;
      expect(actual2).assertDeepEquals(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART04_2200
     * @tc.name decimalToHexadecimalPart04Test022
     * @tc.desc Verify toHexadecimal(20) on new Decimal(Double.NaN) returns b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart04Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = new Decimal(Double.NaN).toHexadecimal(20);
      let b: string = new Decimal(Double.NaN).toHexadecimal(20, 4);
      expect(a).assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART04_2300
     * @tc.name decimalToHexadecimalPart04Test023
     * @tc.desc Verify toHexadecimal(20) on new Decimal(0) returns b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart04Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = new Decimal(0).toHexadecimal(20);
      let b: string = new Decimal(0).toHexadecimal(20, 4);
      expect(a).assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART04_2400
     * @tc.name decimalToHexadecimalPart04Test024
     * @tc.desc Verify toHexadecimal(30) on new Decimal(1) returns b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart04Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(1).div(3);
      let a: string = d.toHexadecimal(30);
      let b: string = d.toHexadecimal(30, Decimal.ROUND_HALF_UP);
      expect(a).assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART04_2500
     * @tc.name decimalToHexadecimalPart04Test025
     * @tc.desc Verify toHexadecimal does not mutate source Decimal(255), toString remains 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart04Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(255);
      d.toHexadecimal(20);
      let actual: string = d.toString();
      let expected: string = "255";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART04_2600
     * @tc.name decimalToHexadecimalPart04Test026
     * @tc.desc Verify toHexadecimal(30) on new Decimal(42) returns 0x1.5p+5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart04Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(42).toHexadecimal(30);
      let actual: boolean = new Decimal(s).equals(new Decimal(42));
      expect(actual).assertTrue();
      expect(s).assertEqual("0x1.5p+5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART04_2700
     * @tc.name decimalToHexadecimalPart04Test027
     * @tc.desc Verify toHexadecimal(30, 4) on new Decimal(-42) returns -0x1.5p+5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart04Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-42);
      let s: string = d.toHexadecimal(30, 4);
      let actual: boolean = new Decimal(s.slice(1)).equals(d.abs());
      expect(actual).assertTrue();
      expect(s).assertEqual("-0x1.5p+5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART04_2800
     * @tc.name decimalToHexadecimalPart04Test028
     * @tc.desc Verify toHexadecimal(20) on new Decimal(255) returns d2.toHexadecimal(20)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart04Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Decimal = new Decimal(255);
      let d2: Decimal = new Decimal(255);
      let actual: string = d1.toHexadecimal(20);
      let expected: string = d2.toHexadecimal(20);
      expect(actual).assertEqual(expected);
      expect(actual).assertEqual("0x1.fep+7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART04_2900
     * @tc.name decimalToHexadecimalPart04Test029
     * @tc.desc Verify toHexadecimal(20) on new Decimal(100) returns b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart04Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(100);
      let a: string = d.toHexadecimal(20);
      let b: string = d.toHexadecimal(20, 4);
      expect(a).assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART04_3000
     * @tc.name decimalToHexadecimalPart04Test030
     * @tc.desc Verify toHexadecimal(1) on new Decimal(1.5) returns 0x1p+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart04Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.5).toHexadecimal(1);
      expect(s).assertEqual("0x1p+1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART04_3100
     * @tc.name decimalToHexadecimalPart04Test031
     * @tc.desc Verify toHexadecimal(1, Decimal.ROUND_UP) on new Decimal(255) returns 0x1p+8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart04Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(255);
      let b: string = d.toHexadecimal(1, Decimal.ROUND_UP);
      expect(b).assertEqual("0x1p+8");
    });
  });
}