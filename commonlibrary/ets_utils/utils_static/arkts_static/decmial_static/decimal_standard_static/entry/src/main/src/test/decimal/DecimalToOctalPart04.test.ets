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

export default function decimalToOctalPart04Test(): void {
  describe("DecimalToOctalPart04Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART04_0100
     * @tc.name decimalToOctalPart04Test001
     * @tc.desc Verify toOctal(20, Decimal.ROUND_HALF_UP) on new Decimal(1e2) returns 0o1.44p+6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart04Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1e2).toOctal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0o1.44p+6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART04_0200
     * @tc.name decimalToOctalPart04Test002
     * @tc.desc Verify "NaN" toOctal "NaN"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart04Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("NaN").toOctal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("NaN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART04_0300
     * @tc.name decimalToOctalPart04Test003
     * @tc.desc Verify Infinity toOctal "Infinity"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart04Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(Number.POSITIVE_INFINITY).toOctal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART04_0400
     * @tc.name decimalToOctalPart04Test004
     * @tc.desc Verify "Infinity" toOctal "Infinity"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart04Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("Infinity").toOctal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART04_0500
     * @tc.name decimalToOctalPart04Test005
     * @tc.desc Verify -Infinity toOctal "-Infinity"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart04Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-Number.POSITIVE_INFINITY).toOctal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("-Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART04_0600
     * @tc.name decimalToOctalPart04Test006
     * @tc.desc Verify "-Infinity" toOctal "-Infinity"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart04Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("-Infinity").toOctal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("-Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART04_0700
     * @tc.name decimalToOctalPart04Test007
     * @tc.desc Verify toOctal(20, Decimal.ROUND_HALF_UP) on new Decimal(1.7976931348623157e+308)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart04Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = new Decimal(1.7976931348623157e308).toOctal(20, Decimal.ROUND_HALF_UP);
      let b: string = new Decimal(1).toOctal(20, Decimal.ROUND_HALF_UP);
      let actual: boolean = a.length > b.length;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART04_0800
     * @tc.name decimalToOctalPart04Test008
     * @tc.desc Verify toOctal(20, Decimal.ROUND_HALF_UP) on new Decimal(5e-324)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart04Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = new Decimal(5e-324).toOctal(20, Decimal.ROUND_HALF_UP);
      let b: string = new Decimal(0).toOctal(20, Decimal.ROUND_HALF_UP);
      let actual: boolean = a.length > b.length;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART04_0900
     * @tc.name decimalToOctalPart04Test009
     * @tc.desc Verify toOctal(30, Decimal.ROUND_HALF_UP) on new Decimal(0.1 + 0.2) starts with 0o1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart04Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let da: Decimal = new Decimal(0.1 + 0.2);
      let db: Decimal = new Decimal("0.3");
      let actual: boolean = da.greaterThan(db);
      expect(actual).assertTrue();
      let sa: string = da.toOctal(30, Decimal.ROUND_HALF_UP);
      let actual2: boolean = sa.startsWith("0o1.");
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART04_1000
     * @tc.name decimalToOctalPart04Test010
     * @tc.desc Verify toOctal(20, Decimal.ROUND_HALF_UP) on new Decimal(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart04Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(5).toOctal(20, Decimal.ROUND_HALF_UP);
      let actual: boolean = s.startsWith("0o");
      expect(actual).assertTrue();
      expect(s).assertEqual("0o1.2p+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART04_1100
     * @tc.name decimalToOctalPart04Test011
     * @tc.desc Verify toOctal(20, Decimal.ROUND_HALF_UP) on new Decimal(-5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart04Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-5).toOctal(20, Decimal.ROUND_HALF_UP);
      let actual: boolean = s.startsWith("-0o");
      expect(actual).assertTrue();
      expect(s).assertEqual("-0o1.2p+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART04_1200
     * @tc.name decimalToOctalPart04Test012
     * @tc.desc Verify toOctal(20, Decimal.ROUND_HALF_UP) on new Decimal(10) returns 0o1.2p+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart04Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = new Decimal(10).toOctal(20, Decimal.ROUND_HALF_UP);
      expect(a).assertEqual("0o1.2p+3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART04_1300
     * @tc.name decimalToOctalPart04Test013
     * @tc.desc Verify toOctal(20, Decimal.ROUND_HALF_UP) on new Decimal(42) returns 0o1.24p+5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart04Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(42);
      let s: string = d.toOctal(20, Decimal.ROUND_HALF_UP);
      let actual: string = d.toString();
      let expected: string = "42";
      expect(actual).assertEqual(expected);
      expect(s).assertEqual("0o1.24p+5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART04_1400
     * @tc.name decimalToOctalPart04Test014
     * @tc.desc Verify toOctal(30, Decimal.ROUND_HALF_UP) on new Decimal(0.75)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart04Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0.75).toOctal(30, Decimal.ROUND_HALF_UP);
      let actual: boolean = new Decimal(s).equals(new Decimal(0.75));
      expect(actual).assertTrue();
      expect(s).assertEqual("0o1.4p-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART04_1500
     * @tc.name decimalToOctalPart04Test015
     * @tc.desc Verify toOctal(30, Decimal.ROUND_HALF_UP) on new Decimal(3.5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart04Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(3.5).toOctal(30, Decimal.ROUND_HALF_UP);
      let actual: boolean = new Decimal(s).equals(new Decimal(3.5));
      expect(actual).assertTrue();
      expect(s).assertEqual("0o1.6p+1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART04_1600
     * @tc.name decimalToOctalPart04Test016
     * @tc.desc Verify toOctal(1000, Decimal.ROUND_HALF_UP) on new Decimal(7) returns 0o1.6p+2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart04Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(7).toOctal(1000, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0o1.6p+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART04_1700
     * @tc.name decimalToOctalPart04Test017
     * @tc.desc Verify toOctal(30, Decimal.ROUND_HALF_UP) on new Decimal(-42)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart04Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-42).toOctal(30, Decimal.ROUND_HALF_UP);
      let actual: boolean = new Decimal(s).equals(new Decimal(-42));
      expect(actual).assertTrue();
      expect(s).assertEqual("-0o1.24p+5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART04_1800
     * @tc.name decimalToOctalPart04Test018
     * @tc.desc Verify toOctal(1, Decimal.ROUND_UP) on new Decimal(42) returns 0o1p+6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart04Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let s: string = new Decimal(42).toOctal(1, Decimal.ROUND_UP);
      Decimal.set({ defaults: true });
      expect(s).assertEqual("0o1p+6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART04_1900
     * @tc.name decimalToOctalPart04Test019
     * @tc.desc Verify toOctal(20, 4) on new Decimal(10) returns 0o1.2p+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart04Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 5 });
      let s: string = new Decimal(10).toOctal(20, 4);
      Decimal.set({ defaults: true });
      expect(s).assertEqual("0o1.2p+3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART04_2000
     * @tc.name decimalToOctalPart04Test020
     * @tc.desc Verify toOctal(1, Decimal.ROUND_HALF_UP) on new Decimal(5.5) returns 0o1p+2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart04Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(5.5).toOctal(1, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0o1p+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART04_2100
     * @tc.name decimalToOctalPart04Test021
     * @tc.desc Verify toOctal(1000, Decimal.ROUND_HALF_UP) on new Decimal(42) returns 0o1.24p+5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart04Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 2 });
      let s: string = new Decimal(42).toOctal(1000, Decimal.ROUND_HALF_UP);
      Decimal.set({ defaults: true });
      expect(s).assertEqual("0o1.24p+5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART04_2200
     * @tc.name decimalToOctalPart04Test022
     * @tc.desc Verify toOctal(0, 4) on new Decimal(42) throws BusinessError code 10200001 and toOctal(20, 4) on new Decimal(0.5) returns 0o1p-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart04Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(42);
      try {
        d.toOctal(0, 4);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
        expect(e.name).assertEqual("BusinessError");
      }
      let actual2: string = d.toString();
      let expected2: string = "42";
      expect(actual2).assertEqual(expected2);
      let d2: Decimal = new Decimal(0.5);
      let s: string = d2.toOctal(20, 4);
      expect(s).assertEqual("0o1p-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART04_2300
     * @tc.name decimalToOctalPart04Test023
     * @tc.desc Verify toOctal(20, 4) on new Decimal(64) returns 0o1p+6 and toOctal(20, 9) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart04Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(64);
      try {
        d.toOctal(20, 9);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
      let s: string = d.toOctal(20, 4);
      expect(s).assertEqual("0o1p+6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART04_2400
     * @tc.name decimalToOctalPart04Test024
     * @tc.desc Verify toOctal(20, -1) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart04Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(42);
      try {
        d.toOctal(20, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
      let actual: number = d.comparedTo(new Decimal(42));
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });
  });
}
