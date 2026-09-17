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

export default function decimalToNumberTestTest(): void {
  describe("DecimalToNumberTestTest", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_0100
     * @tc.name decimalToNumberTest001
     * @tc.desc Verify toNumber() on new Decimal("123.456") returns 123.456
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("123.456");
      let n: double = d.toNumber();
      expect(n).assertEqual(123.456);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_0200
     * @tc.name decimalToNumberTest002
     * @tc.desc Verify toNumber() on new Decimal(789) returns 789.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(789);
      let n: double = d.toNumber();
      expect(n).assertEqual(789.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_0300
     * @tc.name decimalToNumberTest003
     * @tc.desc Verify toNumber() on new Decimal(-42) returns -42.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-42);
      let n: double = d.toNumber();
      expect(n).assertEqual(-42.0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_0400
     * @tc.name decimalSetRoundingNineTest004
     * @tc.desc Verify Decimal.set({ rounding: 9 }) throws BusinessError with code 10200001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalSetRoundingNineTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.set({ rounding: 9 });
        expect().assertFail();
      } catch (e) {
        let r1: number = (e as BusinessError).code;
        let e1: int = 10200001;
        expect(r1).assertEqual(e1);
        expect(e.name).assertEqual("BusinessError");
      } finally {
        Decimal.set({ defaults: true });
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_0500
     * @tc.name decimalToNumberTest005
     * @tc.desc Verify toNumber() on new Decimal("9007199254740993") returns 9007199254740992
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("9007199254740993");
      let n: double = d.toNumber();
      let r1: string = n.toFixed(0);
      let e1: string = "9007199254740992";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_0600
     * @tc.name decimalToNumberTest006
     * @tc.desc Verify toNumber() on new Decimal("0.1234567890123456789012345") returns 0.12345678901234568
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("0.1234567890123456789012345");
      let n: double = d.toNumber();
      expect(n).assertEqual(0.12345678901234568);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_0700
     * @tc.name decimalToNumberTest007
     * @tc.desc Verify toNumber() maps new Decimal("0.1234567890123456789012345") and new Decimal("0.1234567890123456789012346") to the same double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Decimal = new Decimal("0.1234567890123456789012345");
      let d2: Decimal = new Decimal("0.1234567890123456789012346");
      let n1: double = d1.toNumber();
      let n2: double = d2.toNumber();
      expect(n1).assertEqual(n2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_0800
     * @tc.name decimalToNumberTest008
     * @tc.desc Verify toNumber() on new Decimal('2') and new Decimal("2.0") returns the same double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Decimal = new Decimal('2');
      let d2: Decimal = new Decimal("2.0");
      let r1: number = d1.toNumber();
      let e1: number = d2.toNumber();
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_0900
     * @tc.name decimalToNumberTest009
     * @tc.desc Verify toNumber() on new Decimal("1e5") returns 100000.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1e5");
      let n: double = d.toNumber();
      expect(n).assertEqual(100000.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_1000
     * @tc.name decimalToNumberTest010
     * @tc.desc Verify toNumber() on new Decimal("1.23e-4") returns 0.000123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.23e-4");
      let n: double = d.toNumber();
      expect(n).assertEqual(0.000123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_1100
     * @tc.name decimalToNumberTest011
     * @tc.desc Verify toNumber() on new Decimal("1e-20") returns 1e-20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1e-20");
      let n: double = d.toNumber();
      expect(n).assertEqual(1e-20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_1200
     * @tc.name decimalToNumberTest012
     * @tc.desc Verify toNumber() on new Decimal("0.3") returns double 0.3 whose toFixed(20) is 0.29999999999999998890
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("0.3");
      let n: double = d.toNumber();
      let r1: string = n.toFixed(20);
      let e1: string = "0.29999999999999998890";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_1300
     * @tc.name decimalToNumberTest013
     * @tc.desc Verify toNumber() on new Decimal("NaN")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("NaN");
      let n: double = d.toNumber();
      let r1: boolean = isNaN(n);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_1400
     * @tc.name decimalToNumberTest014
     * @tc.desc Verify toNumber() on new Decimal("Infinity")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("Infinity");
      let n: double = d.toNumber();
      let r1: boolean = isFinite(n);
      expect(r1).assertFalse();
      expect(n).assertLarger(1.7976931348623157e308);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_1500
     * @tc.name decimalToNumberTest015
     * @tc.desc Verify toNumber() on new Decimal("-Infinity")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("-Infinity");
      let n: double = d.toNumber();
      let r1: boolean = isFinite(n);
      expect(r1).assertFalse();
      expect(n).assertLess(-1.7976931348623157e308);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_1600
     * @tc.name decimalToNumberTest016
     * @tc.desc Verify toNumber() on new Decimal("-0") returns -Number.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("-0");
      let n: double = d.toNumber();
      let r1: number = 1 / n;
      let e1: number = -Number.POSITIVE_INFINITY;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_1700
     * @tc.name decimalToNumberTest017
     * @tc.desc Verify toNumber() on new Decimal('0') returns Number.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('0');
      let n: double = d.toNumber();
      let r1: number = 1 / n;
      let e1: number = Number.POSITIVE_INFINITY;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_1800
     * @tc.name decimalToNumberTest018
     * @tc.desc Verify toNumber() on new Decimal("1.7976931348623157e308")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.7976931348623157e308");
      let n: double = d.toNumber();
      let r1: boolean = isFinite(n);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_1900
     * @tc.name decimalToNumberTest019
     * @tc.desc Verify toNumber() on new Decimal("1e-323") returns non-zero subnormal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1e-323");
      let n: double = d.toNumber();
      expect(n).assertLarger(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_2000
     * @tc.name decimalToNumberTest020
     * @tc.desc Verify toNumber() on new Decimal("1.7976931348623157e309")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.7976931348623157e309");
      let n: double = d.toNumber();
      let r1: boolean = isFinite(n);
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_2100
     * @tc.name decimalToNumberTest021
     * @tc.desc Verify toNumber() on new Decimal("-1.7976931348623157e309")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("-1.7976931348623157e309");
      let n: double = d.toNumber();
      let r1: boolean = isFinite(n);
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_2200
     * @tc.name decimalToNumberTest022
     * @tc.desc Verify toNumber() on new Decimal("999...") returns finite double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(
        "9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
      );
      let n: double = d.toNumber();
      let r1: boolean = isFinite(n);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_2300
     * @tc.name decimalToNumberTest023
     * @tc.desc Verify toNumber() on new Decimal("9.9e307")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("9.9e307");
      let n: double = d.toNumber();
      let r1: boolean = isFinite(n);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_2400
     * @tc.name decimalToNumberTest024
     * @tc.desc Verify toNumber() on new Decimal(s)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '1'.repeat(10000);
      let d: Decimal = new Decimal(s);
      let n: double = d.toNumber();
      let r1: boolean = isNaN(n);
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_2500
     * @tc.name decimalToNumberTest025
     * @tc.desc Verify toNumber() on new Decimal(s) with 10000 digits returns non-finite value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '3'.repeat(10000) + ".5";
      let d: Decimal = new Decimal(s);
      let n: double = d.toNumber();
      let r1: boolean = isFinite(n);
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_2600
     * @tc.name decimalToNumberTest026
     * @tc.desc Verify toNumber() on new Decimal(s) returns 42.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "00000000000000000000000000000000000000000000000000042";
      let d: Decimal = new Decimal(s);
      let n: double = d.toNumber();
      expect(n).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_2700
     * @tc.name decimalToNumberTest027
     * @tc.desc Verify toNumber() on new Decimal("0.1").add("0.2") returns 0.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("0.1").add("0.2");
      let n: double = d.toNumber();
      expect(n).assertEqual(0.3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_2800
     * @tc.name decimalToNumberTest028
     * @tc.desc Verify toNumber() on new Decimal("0.1").sub("0.8") returns -0.7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("0.1").sub("0.8");
      let n: double = d.toNumber();
      expect(n).assertEqual(-0.7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_2900
     * @tc.name decimalToNumberTest029
     * @tc.desc Verify toNumber() on new Decimal("0.1").mul("0.2") returns 0.02
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("0.1").mul("0.2");
      let n: double = d.toNumber();
      expect(n).assertEqual(0.02);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_3000
     * @tc.name decimalToNumberTest030
     * @tc.desc Verify toNumber() on new Decimal('1') div '3' returns 0.33333333333333337
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('1').div('3');
      let n: double = d.toNumber();
      expect(n).assertEqual(0.33333333333333337);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_3100
     * @tc.name decimalToNumberTest031
     * @tc.desc Verify toNumber() on new Decimal('2') sqrt returns 1.414213562373095
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('2').sqrt();
      let n: double = d.toNumber();
      expect(n).assertEqual(1.414213562373095);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_3200
     * @tc.name decimalToNumberTest032
     * @tc.desc Verify toNumber() on new Decimal('2') returns 0.6931471805599453
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('2').ln();
      let n: double = d.toNumber();
      expect(n).assertEqual(0.6931471805599453);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_3300
     * @tc.name decimalToNumberTest033
     * @tc.desc Verify toNumber() on new Decimal('2') returns 1024.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('2').pow("10");
      let n: double = d.toNumber();
      expect(n).assertEqual(1024.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_3400
     * @tc.name decimalToNumberTest034
     * @tc.desc Verify toNumber() on new Decimal('1')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('1').div('0');
      let n: double = d.toNumber();
      let r1: boolean = isFinite(n);
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_3500
     * @tc.name decimalToNumberTest035
     * @tc.desc Verify toNumber() on new Decimal('0')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('0').div('0');
      let n: double = d.toNumber();
      let r1: boolean = isNaN(n);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_3600
     * @tc.name decimalToNumberTest036
     * @tc.desc Verify toNumber() on new Decimal("-4")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("-4").sqrt();
      let n: double = d.toNumber();
      let r1: boolean = isNaN(n);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_3700
     * @tc.name decimalToNumberTest037
     * @tc.desc Verify toNumber() on new Decimal('0') ln returns non-finite value (-Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('0').ln();
      let n: double = d.toNumber();
      let r1: boolean = isFinite(n);
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_3800
     * @tc.name decimalToNumberTest038
     * @tc.desc Verify toNumber() on new Decimal("1.2345678901234567890123456789") returns 1.2345678901234567
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20 });
      let d: Decimal = new Decimal("1.2345678901234567890123456789");
      let n: double = d.toNumber();
      expect(n).assertEqual(1.2345678901234567);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_3900
     * @tc.name decimalToNumberTest039
     * @tc.desc Verify toNumber() on new Decimal("1.9") returns 1.9 unaffected by ROUND_DOWN config
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let d: Decimal = new Decimal("1.9");
      let n: double = d.toNumber();
      expect(n).assertEqual(1.9);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_4000
     * @tc.name decimalToNumberTest040
     * @tc.desc Verify toNumber() on new Decimal("1.5") returns 1.5 unaffected by ROUND_HALF_UP config
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_HALF_UP });
      let d: Decimal = new Decimal("1.5");
      let n: double = d.toNumber();
      expect(n).assertEqual(1.5);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_4100
     * @tc.name decimalToNumberTest041
     * @tc.desc Verify toNumber() on new Decimal("1.1")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.1");
      let n: double = d.toNumber();
      let r1: boolean = isFinite(n);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_4200
     * @tc.name decimalToNumberTest042
     * @tc.desc Verify toNumber Decimal comparedTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.1");
      let n: double = d.toNumber();
      let r1: number = d.comparedTo(new Decimal(n));
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_4300
     * @tc.name decimalToNumberTest043
     * @tc.desc Verify toNumber() on new Decimal("7.7") returns 7.7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("7.7");
      let n: double = d.toNumber();
      expect(n).assertEqual(7.7);
      let r1: string = d.toString();
      let e1: string = "7.7";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_4400
     * @tc.name decimalToNumberTest044
     * @tc.desc Verify toNumber 0 < n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1e-300");
      let n: double = d.toNumber();
      expect(n).assertLarger(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_4500
     * @tc.name decimalToNumberTest045
     * @tc.desc Verify new Decimal("invalid-object") throws BusinessError with code 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToNumberTest045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal("invalid-object");
        expect().assertFail();
        let n: double = d.toNumber();
        expect(n).assertEqual(0.0);
      } catch (e) {
        let r1: number = (e as BusinessError).code;
        let e1: int = 401;
        expect(r1).assertEqual(e1);
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_NUMBER_4600
     * @tc.name decimalSetPrecisionZeroTest046
     * @tc.desc Verify Decimal.set({ precision: 0 }) throws BusinessError with code 10200001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalSetPrecisionZeroTest046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.set({ precision: 0 });
        expect().assertFail();
      } catch (e) {
        let r1: number = (e as BusinessError).code;
        let e1: int = 10200001;
        expect(r1).assertEqual(e1);
        expect(e.name).assertEqual("BusinessError");
      } finally {
        Decimal.set({ defaults: true });
      }
    });

  });
}
