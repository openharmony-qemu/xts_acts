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

export default function decimalToFractionPart01Test(): void {
  describe("DecimalToFractionPart01Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_0100
     * @tc.name decimalToFractionPart01Test001
     * @tc.desc Verify toFraction() on new Decimal(2) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Decimal[] = new Decimal(2).toFraction();
      let actual: int = f.length;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
      expect(f[0].comparedTo(2)).assertEqual(0);
      expect(f[1].comparedTo(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_0200
     * @tc.name decimalToFractionPart01Test002
     * @tc.desc Verify toFraction() on new Decimal(0.5) returns fraction 1/2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Decimal[] = new Decimal(0.5).toFraction();
      let actual: number = f[0].comparedTo(1);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actualDenominator: number = f[1].comparedTo(2);
      let expectedDenominator: int = 0;
      expect(actualDenominator).assertEqual(expectedDenominator);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_0300
     * @tc.name decimalToFractionPart01Test003
     * @tc.desc Verify toFraction() on new Decimal("0.60") returns fraction 3/5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Decimal[] = new Decimal("0.60").toFraction();
      let actual: number = f[0].comparedTo(3);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actualDenominator: number = f[1].comparedTo(5);
      let expectedDenominator: int = 0;
      expect(actualDenominator).assertEqual(expectedDenominator);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_0400
     * @tc.name decimalToFractionPart01Test004
     * @tc.desc Verify toFraction() on new Decimal("0.3333") returns fraction 3333/10000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Decimal[] = new Decimal("0.3333").toFraction();
      let actual: number = f[0].comparedTo(3333);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actualDenominator: number = f[1].comparedTo(10000);
      let expectedDenominator: int = 0;
      expect(actualDenominator).assertEqual(expectedDenominator);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_0500
     * @tc.name decimalToFractionPart01Test005
     * @tc.desc Verify toFraction() on new Decimal("0.0000001") returns fraction 1/10000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Decimal[] = new Decimal("0.0000001").toFraction();
      let actual: number = f[0].comparedTo(1);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actualDenominator: number = f[1].comparedTo(10000000);
      let expectedDenominator: int = 0;
      expect(actualDenominator).assertEqual(expectedDenominator);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_0600
     * @tc.name decimalToFractionPart01Test006
     * @tc.desc Verify toFraction() on new Decimal("0.123456789123456789") returns 123456789123456789
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Decimal[] = new Decimal("0.123456789123456789").toFraction();
      let actual: string = f[0].toString();
      let expected: string = "123456789123456789";
      expect(actual).assertEqual(expected);
      let actualDenominatorStr: string = f[1].toString();
      let expectedDenominatorStr: string = "1000000000000000000";
      expect(actualDenominatorStr).assertEqual(expectedDenominatorStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_0700
     * @tc.name decimalToFractionPart01Test007
     * @tc.desc Verify toFraction() on new Decimal(1) returns fraction 1/1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Decimal[] = new Decimal(1).toFraction();
      let actual: number = f[0].comparedTo(1);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actualDenominator: number = f[1].comparedTo(1);
      let expectedDenominator: int = 0;
      expect(actualDenominator).assertEqual(expectedDenominator);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_0800
     * @tc.name decimalToFractionPart01Test008
     * @tc.desc Verify toFraction() on new Decimal(0) returns fraction 0/1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Decimal[] = new Decimal(0).toFraction();
      let actual: boolean = f[0].isZero();
      expect(actual).assertTrue();
      let actualDenominator: number = f[1].comparedTo(1);
      let expectedDenominator: int = 0;
      expect(actualDenominator).assertEqual(expectedDenominator);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_0900
     * @tc.name decimalToFractionPart01Test009
     * @tc.desc Verify toFraction() on new Decimal("123456789012345678901234567890") returns 1.2345678901234567890123456789e+29
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Decimal[] = new Decimal("123456789012345678901234567890").toFraction();
      let actual: string = f[0].toString();
      let expected: string = "1.2345678901234567890123456789e+29";
      expect(actual).assertEqual(expected);
      let actualDenominator: number = f[1].comparedTo(1);
      let expectedDenominator: int = 0;
      expect(actualDenominator).assertEqual(expectedDenominator);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_1000
     * @tc.name decimalToFractionPart01Test010
     * @tc.desc Verify toFraction() on new Decimal(-0.5) returns fraction -1/2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Decimal[] = new Decimal(-0.5).toFraction();
      let actual: number = f[0].comparedTo(-1);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actualDenominator: number = f[1].comparedTo(2);
      let expectedDenominator: int = 0;
      expect(actualDenominator).assertEqual(expectedDenominator);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_1100
     * @tc.name decimalToFractionPart01Test011
     * @tc.desc Verify toFraction() on new Decimal(-2) returns fraction -2/1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Decimal[] = new Decimal(-2).toFraction();
      let actual: number = f[0].comparedTo(-2);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actualDenominator: number = f[1].comparedTo(1);
      let expectedDenominator: int = 0;
      expect(actualDenominator).assertEqual(expectedDenominator);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_1200
     * @tc.name decimalToFractionPart01Test012
     * @tc.desc Verify toFraction() on new Decimal(-0) keeps negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Decimal[] = new Decimal(-0).toFraction();
      let actual: boolean = f[0].isZero();
      expect(actual).assertTrue();
      let actualIsNegative: boolean = f[0].isNegative();
      expect(actualIsNegative).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_1300
     * @tc.name decimalToFractionPart01Test013
     * @tc.desc Verify toFraction() on new Decimal(0.1 + 0.2) returns fraction 7500000000000001/25000000000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Decimal[] = new Decimal(0.1 + 0.2).toFraction();
      let actual: number = f[0].comparedTo(7500000000000001);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actualDenominator: number = f[1].comparedTo(25000000000000000);
      let expectedDenominator: int = 0;
      expect(actualDenominator).assertEqual(expectedDenominator);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_1400
     * @tc.name decimalToFractionPart01Test014
     * @tc.desc Verify toFraction() on new Decimal("0.30000000000000004") returns fraction 7500000000000001/25000000000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Decimal[] = new Decimal("0.30000000000000004").toFraction();
      let actual: number = f[0].comparedTo(7500000000000001);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actualDenominator: number = f[1].comparedTo(25000000000000000);
      let expectedDenominator: int = 0;
      expect(actualDenominator).assertEqual(expectedDenominator);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_1500
     * @tc.name decimalToFractionPart01Test015
     * @tc.desc Verify toFraction() on new Decimal(0.1 + 0.7) returns fraction 7999999999999999/10000000000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Decimal[] = new Decimal(0.1 + 0.7).toFraction();
      let actual: number = f[0].comparedTo(7999999999999999);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actualDenominator: number = f[1].comparedTo(10000000000000000);
      let expectedDenominator: int = 0;
      expect(actualDenominator).assertEqual(expectedDenominator);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_1600
     * @tc.name decimalToFractionPart01Test016
     * @tc.desc Verify toFraction() on new Decimal(1e-3) returns fraction 1/1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Decimal[] = new Decimal(1e-3).toFraction();
      let actual: number = f[0].comparedTo(1);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actualDenominator: number = f[1].comparedTo(1000);
      let expectedDenominator: int = 0;
      expect(actualDenominator).assertEqual(expectedDenominator);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_1700
     * @tc.name decimalToFractionPart01Test017
     * @tc.desc Verify toFraction() on new Decimal(1.7976931348623157e+308) returns a fraction whose quotient equals the input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Decimal[] = new Decimal(1.7976931348623157e308).toFraction();
      let actual: number = f[0].div(f[1]).comparedTo(1.7976931348623157e308);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_1800
     * @tc.name decimalToFractionPart01Test018
     * @tc.desc Verify toFraction() on new Decimal(5e-324) returns a fraction whose quotient equals the input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Decimal[] = new Decimal(5e-324).toFraction();
      let actual: number = f[0].div(f[1]).comparedTo(5e-324);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_1900
     * @tc.name decimalToFractionPart01Test019
     * @tc.desc Verify toFraction() on new Decimal("1e5") returns fraction 100000/1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Decimal[] = new Decimal("1e5").toFraction();
      let actual: number = f[0].comparedTo(100000);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actualDenominator: number = f[1].comparedTo(1);
      let expectedDenominator: int = 0;
      expect(actualDenominator).assertEqual(expectedDenominator);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_2000
     * @tc.name decimalToFractionPart01Test020
     * @tc.desc Verify toFraction() on new Decimal("1.23e-4") returns fraction 123/1000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Decimal[] = new Decimal("1.23e-4").toFraction();
      let actual: number = f[0].comparedTo(123);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actualDenominator: number = f[1].comparedTo(1000000);
      let expectedDenominator: int = 0;
      expect(actualDenominator).assertEqual(expectedDenominator);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_2100
     * @tc.name decimalToFractionPart01Test021
     * @tc.desc Verify toFraction() under precision=5 yields quotient greater than d
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 5 });
      let d: Decimal = new Decimal("0.123456");
      let f: Decimal[] = d.toFraction();
      let actual: number = f[0].div(f[1]).comparedTo(d);
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_2200
     * @tc.name decimalToFractionPart01Test022
     * @tc.desc Verify toFraction() on new Decimal("0.75") returns fraction 3/4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let f: Decimal[] = new Decimal("0.75").toFraction();
      let actual: number = f[0].comparedTo(3);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actualDenominator: number = f[1].comparedTo(4);
      let expectedDenominator: int = 0;
      expect(actualDenominator).assertEqual(expectedDenominator);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_2300
     * @tc.name decimalToFractionPart01Test023
     * @tc.desc Verify toFraction() on new Decimal("1e-500") returns fraction 1/1e500
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Decimal[] = new Decimal("1e-500").toFraction();
      let actual: number = f[0].comparedTo(1);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actualDenominator: number = f[1].comparedTo("1e500");
      let expectedDenominator: int = 0;
      expect(actualDenominator).assertEqual(expectedDenominator);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_2400
     * @tc.name decimalToFractionPart01Test024
     * @tc.desc Verify toFraction() on new Decimal("123456789.123456789") returns 123456789123456789
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Decimal[] = new Decimal("123456789.123456789").toFraction();
      let actual: string = f[0].toString();
      let expected: string = "123456789123456789";
      expect(actual).assertEqual(expected);
      let actualDenominator: number = f[1].comparedTo(1000000000);
      let expectedDenominator: int = 0;
      expect(actualDenominator).assertEqual(expectedDenominator);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_2500
     * @tc.name decimalToFractionPart01Test025
     * @tc.desc Verify toFraction() on new Decimal("99999999999999999999.5") returns 199999999999999999999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Decimal[] = new Decimal("99999999999999999999.5").toFraction();
      let actual: string = f[0].toString();
      let expected: string = "199999999999999999999";
      expect(actual).assertEqual(expected);
      let actualDenominator: number = f[1].comparedTo(2);
      let expectedDenominator: int = 0;
      expect(actualDenominator).assertEqual(expectedDenominator);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_2600
     * @tc.name decimalToFractionPart01Test026
     * @tc.desc Verify toFraction() on new Decimal("0.9999999999999999999") returns 9999999999999999999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Decimal[] = new Decimal("0.9999999999999999999").toFraction();
      let actual: string = f[0].toString();
      let expected: string = "9999999999999999999";
      expect(actual).assertEqual(expected);
      let actualDenominatorStr: string = f[1].toString();
      let expectedDenominatorStr: string = "10000000000000000000";
      expect(actualDenominatorStr).assertEqual(expectedDenominatorStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_2700
     * @tc.name decimalToFractionPart01Test027
     * @tc.desc Verify toFraction() on new Decimal("3.141592653589793") returns fraction 3141592653589793/1000000000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Decimal[] = new Decimal("3.141592653589793").toFraction();
      let actual: number = f[0].comparedTo(3141592653589793);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actualDenominator: number = f[1].comparedTo(1000000000000000);
      let expectedDenominator: int = 0;
      expect(actualDenominator).assertEqual(expectedDenominator);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_2800
     * @tc.name decimalToFractionPart01Test028
     * @tc.desc Verify toFraction() on new Decimal("-0") returns fraction 0/1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Decimal[] = new Decimal("-0").toFraction();
      let actual: boolean = f[0].isZero();
      expect(actual).assertTrue();
      let actualDenominator: number = f[1].comparedTo(1);
      let expectedDenominator: int = 0;
      expect(actualDenominator).assertEqual(expectedDenominator);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_2900
     * @tc.name decimalToFractionPart01Test029
     * @tc.desc Verify toFraction() on new Decimal(0.5) returns fraction 1/2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Decimal[] = new Decimal(0.5).toFraction();
      expect(f.length).assertEqual(2);
      expect(f[0].comparedTo(1)).assertEqual(0);
      expect(f[1].comparedTo(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_3000
     * @tc.name decimalToFractionPart01Test030
     * @tc.desc Verify toFraction() on new Decimal(1.5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Decimal[] = new Decimal(1.5).toFraction();
      expect(f[0].comparedTo(3)).assertEqual(0);
      expect(f[1].comparedTo(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_3100
     * @tc.name decimalToFractionPart01Test031
     * @tc.desc Verify toFraction() on new Decimal(1.75) returns a fraction whose quotient equals the input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Decimal[] = new Decimal(1.75).toFraction();
      let actual: number = f[0].div(f[1]).comparedTo(1.75);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      expect(f[0].comparedTo(7)).assertEqual(0);
      expect(f[1].comparedTo(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_3200
     * @tc.name decimalToFractionPart01Test032
     * @tc.desc Verify toFraction() on new Decimal(-1.5) returns a fraction whose quotient equals the input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Decimal[] = new Decimal(-1.5).toFraction();
      let actual: number = f[0].div(f[1]).comparedTo(-1.5);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      expect(f[0].comparedTo(-3)).assertEqual(0);
      expect(f[1].comparedTo(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_3300
     * @tc.name decimalToFractionPart01Test033
     * @tc.desc Verify toFraction() on new Decimal(0.5) returns numerator 1 and denominator 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Decimal[] = new Decimal(0.5).toFraction();
      expect(f[0].comparedTo(1)).assertEqual(0);
      expect(f[1].comparedTo(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_3400
     * @tc.name decimalToFractionPart01Test034
     * @tc.desc Verify toFraction() on new Decimal(7)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Decimal[] = new Decimal(7).toFraction();
      expect(f[0].comparedTo(7)).assertEqual(0);
      expect(f[1].comparedTo(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_3500
     * @tc.name decimalToFractionPart01Test035
     * @tc.desc Verify toFraction() on new Decimal("0.75") returns the same fraction on repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("0.75");
      let a: Decimal[] = d.toFraction();
      let b: Decimal[] = d.toFraction();
      let actual: number = a[0].comparedTo(b[0]);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actualDenominatorMatch: number = a[1].comparedTo(b[1]);
      let expectedDenominatorMatch: int = 0;
      expect(actualDenominatorMatch).assertEqual(expectedDenominatorMatch);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_3600
     * @tc.name decimalToFractionPart01Test036
     * @tc.desc Verify toFraction() on new Decimal(0.5) returns a fresh fraction 1/2 not affected by mutating a prior result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0.5);
      let a: Decimal[] = d.toFraction();
      let b: Decimal[] = d.toFraction();
      a[0] = new Decimal(9);
      let actual: number = b[0].comparedTo(1);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_3700
     * @tc.name decimalToFractionPart01Test037
     * @tc.desc Verify toFraction() on new Decimal("0.5") returns fraction 1/2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("0.5");
      d.add(1);
      let f: Decimal[] = d.toFraction();
      let actual: number = f[0].comparedTo(1);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actualDenominator: number = f[1].comparedTo(2);
      let expectedDenominator: int = 0;
      expect(actualDenominator).assertEqual(expectedDenominator);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_3800
     * @tc.name decimalToFractionPart01Test038
     * @tc.desc Verify toFraction() on new Decimal("0.1").add("0.2") returns 3/10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Decimal[] = new Decimal("0.1").add("0.2").toFraction();
      let actual: number = f[0].comparedTo(3);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actualDenominator: number = f[1].comparedTo(10);
      let expectedDenominator: int = 0;
      expect(actualDenominator).assertEqual(expectedDenominator);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_3900
     * @tc.name decimalToFractionPart01Test039
     * @tc.desc Verify toFraction() on new Decimal('1').div('3') returns fraction equal to 1/3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Decimal[] = new Decimal('1').div('3').toFraction();
      let actual: number = f[0].div(f[1]).comparedTo(new Decimal('1').div('3'));
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_4000
     * @tc.name decimalToFractionPart01Test040
     * @tc.desc Verify NaN toFraction NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Decimal[] = new Decimal(Double.NaN).toFraction();
      let actual: boolean = f[0].isNaN();
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_4100
     * @tc.name decimalToFractionPart01Test041
     * @tc.desc Verify Infinity toFraction returns Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Decimal[] = new Decimal(Number.POSITIVE_INFINITY).toFraction();
      let actual: string = f[0].toString();
      let expected: string = "Infinity";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_4200
     * @tc.name decimalToFractionPart01Test042
     * @tc.desc Verify -Infinity toFraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Decimal[] = new Decimal(-Number.POSITIVE_INFINITY).toFraction();
      let actual: boolean = f[0].isFinite();
      expect(actual).assertFalse();
      let actualIsNegative: boolean = f[0].isNegative();
      expect(actualIsNegative).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART01_4300
     * @tc.name decimalToFractionPart01Test043
     * @tc.desc Verify toFraction() on new Decimal(-0.25)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart01Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Decimal[] = new Decimal(-0.25).toFraction();
      let actual: boolean = f[0].isNegative();
      expect(actual).assertTrue();
      expect(f[0].comparedTo(-1)).assertEqual(0);
      expect(f[1].comparedTo(4)).assertEqual(0);
    });
  });
}
