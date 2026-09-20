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

export default function decimalToFractionPart02Test(): void {
  describe("DecimalToFractionPart02Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_0100
     * @tc.name decimalToFractionPart02Test001
     * @tc.desc Verify toFraction(1) on new Decimal("0.5") returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart02Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("0.5");
      const f: Decimal[] = d.toFraction(1);
      let actual: string = f[0].toString();
      let expected: string = '0';
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = '1';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_0200
     * @tc.name decimalToFractionPart02Test002
     * @tc.desc Verify toFraction(2) on new Decimal("0.5") returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart02Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("0.5");
      const f: Decimal[] = d.toFraction(2);
      let actual: string = f[0].toString();
      let expected: string = '1';
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = '2';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_0300
     * @tc.name decimalToFractionPart02Test003
     * @tc.desc Verify toFraction(3) on new Decimal("0.6") returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart02Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("0.6");
      const f: Decimal[] = d.toFraction(3);
      let actual: string = f[0].toString();
      let expected: string = '2';
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = '3';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_0400
     * @tc.name decimalToFractionPart02Test004
     * @tc.desc Verify toFraction(4) on new Decimal("0.75") returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart02Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("0.75");
      const f: Decimal[] = d.toFraction(4);
      let actual: string = f[0].toString();
      let expected: string = '3';
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = '4';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_0500
     * @tc.name decimalToFractionPart02Test005
     * @tc.desc Verify toFraction(5) on new Decimal("0.4") returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart02Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("0.4");
      const f: Decimal[] = d.toFraction(5);
      let actual: string = f[0].toString();
      let expected: string = '2';
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = '5';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_0600
     * @tc.name decimalToFractionPart02Test006
     * @tc.desc Verify toFraction(7) on new Decimal("3.5") returns 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart02Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("3.5");
      const f: Decimal[] = d.toFraction(7);
      let actual: string = f[0].toString();
      let expected: string = '7';
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = '2';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_0700
     * @tc.name decimalToFractionPart02Test007
     * @tc.desc Verify toFraction(9) on new Decimal("1.1") returns 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart02Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("1.1");
      const f: Decimal[] = d.toFraction(9);
      let actual: string = f[0].toString();
      let expected: string = "10";
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = '9';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_0800
     * @tc.name decimalToFractionPart02Test008
     * @tc.desc Verify toFraction(10) on new Decimal("0.9") returns 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart02Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("0.9");
      const f: Decimal[] = d.toFraction(10);
      let actual: string = f[0].toString();
      let expected: string = '9';
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = "10";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_0900
     * @tc.name decimalToFractionPart02Test009
     * @tc.desc Verify toFraction(10) on new Decimal("0.3333333333") returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart02Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("0.3333333333");
      const f: Decimal[] = d.toFraction(10);
      let actual: string = f[0].toString();
      let expected: string = '1';
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = '3';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_1000
     * @tc.name decimalToFractionPart02Test010
     * @tc.desc Verify toFraction(100) on new Decimal("0.35") returns 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart02Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("0.35");
      const f: Decimal[] = d.toFraction(100);
      let actual: string = f[0].toString();
      let expected: string = '7';
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = "20";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_1100
     * @tc.name decimalToFractionPart02Test011
     * @tc.desc Verify toFraction(125) on new Decimal("123.456") returns 15432
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart02Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("123.456");
      const f: Decimal[] = d.toFraction(125);
      let actual: string = f[0].toString();
      let expected: string = "15432";
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = "125";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_1200
     * @tc.name decimalToFractionPart02Test012
     * @tc.desc Verify toFraction(124) on new Decimal("123.456") returns 8395
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart02Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("123.456");
      const f: Decimal[] = d.toFraction(124);
      let actual: string = f[0].toString();
      let expected: string = "8395";
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = "68";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_1300
     * @tc.name decimalToFractionPart02Test013
     * @tc.desc Verify toFraction(100000) on new Decimal("0.0001") returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart02Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("0.0001");
      const f: Decimal[] = d.toFraction(100000);
      let actual: string = f[0].toString();
      let expected: string = '1';
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = "10000";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_1400
     * @tc.name decimalToFractionPart02Test014
     * @tc.desc Verify toFraction(9999) on new Decimal("0.0001") returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart02Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("0.0001");
      const f: Decimal[] = d.toFraction(9999);
      let actual: string = f[0].toString();
      let expected: string = '1';
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = "9999";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_1500
     * @tc.name decimalToFractionPart02Test015
     * @tc.desc Verify toFraction(1000) on new Decimal("0.999") returns 999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart02Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("0.999");
      const f: Decimal[] = d.toFraction(1000);
      let actual: string = f[0].toString();
      let expected: string = "999";
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = "1000";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_1600
     * @tc.name decimalToFractionPart02Test016
     * @tc.desc Verify toFraction(1000) on new Decimal("3.14159") returns 355
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart02Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("3.14159");
      const f: Decimal[] = d.toFraction(1000);
      let actual: string = f[0].toString();
      let expected: string = "355";
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = "113";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_1700
     * @tc.name decimalToFractionPart02Test017
     * @tc.desc Verify toFraction(1000) on new Decimal("0.123456789") returns 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart02Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("0.123456789");
      const f: Decimal[] = d.toFraction(1000);
      let actual: string = f[0].toString();
      let expected: string = "10";
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = "81";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_1800
     * @tc.name decimalToFractionPart02Test018
     * @tc.desc Verify toFraction(1000) on new Decimal("0.6666666666666666") returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart02Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("0.6666666666666666");
      const f: Decimal[] = d.toFraction(1000);
      let actual: string = f[0].toString();
      let expected: string = '2';
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = '3';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_1900
     * @tc.name decimalToFractionPart02Test019
     * @tc.desc Verify toFraction(1000) on new Decimal("0.142857142857142857") returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart02Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("0.142857142857142857");
      const f: Decimal[] = d.toFraction(1000);
      let actual: string = f[0].toString();
      let expected: string = '1';
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = '7';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_2000
     * @tc.name decimalToFractionPart02Test020
     * @tc.desc Verify toFraction(1000) on new Decimal("2.718281828") returns 1457
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart02Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("2.718281828");
      const f: Decimal[] = d.toFraction(1000);
      let actual: string = f[0].toString();
      let expected: string = "1457";
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = "536";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_2100
     * @tc.name decimalToFractionPart02Test021
     * @tc.desc Verify toFraction(1000000000) on new Decimal("0.5") returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart02Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("0.5");
      const f: Decimal[] = d.toFraction(1000000000);
      let actual: string = f[0].toString();
      let expected: string = '1';
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = '2';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_2200
     * @tc.name decimalToFractionPart02Test022
     * @tc.desc Verify toFraction(1000000000) on new Decimal("0.123456789012345678") returns 97393689
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart02Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("0.123456789012345678");
      const f: Decimal[] = d.toFraction(1000000000);
      let actual: string = f[0].toString();
      let expected: string = "97393689";
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = "788888888";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_2300
     * @tc.name decimalToFractionPart02Test023
     * @tc.desc Verify toFraction("100") on new Decimal("0.75") returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart02Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("0.75");
      const f: Decimal[] = d.toFraction("100");
      let actual: string = f[0].toString();
      let expected: string = '3';
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = '4';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_2400
     * @tc.name decimalToFractionPart02Test024
     * @tc.desc Verify toFraction(den) on new Decimal("0.5") returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart02Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("0.5");
      const den: Decimal = new Decimal(100);
      const f: Decimal[] = d.toFraction(den);
      let actual: string = f[0].toString();
      let expected: string = '1';
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = '2';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_2500
     * @tc.name decimalToFractionPart02Test025
     * @tc.desc Verify toFraction('') on new Decimal("0.5") throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart02Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("0.5");
      try {
        d.toFraction('');
        expect().assertFail();
      } catch (e) {
        expect(e instanceof RangeError).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_2600
     * @tc.name decimalToFractionPart02Test026
     * @tc.desc Verify toFraction("0x10") on new Decimal("0.5") returns 1/2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart02Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("0.5");
      const f: Decimal[] = d.toFraction("0x10");
      let actual: string = f[0].toString();
      let expected: string = '1';
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = '2';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_2700
     * @tc.name decimalToFractionPart02Test027
     * @tc.desc Verify toFraction("NaN") on new Decimal("0.5") throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart02Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("0.5");
      try {
        d.toFraction("NaN");
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_2800
     * @tc.name decimalToFractionPart02Test028
     * @tc.desc Verify toFraction(100) on new Decimal("0.5") does not return the original Decimal instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart02Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("0.5");
      const f: Decimal[] = d.toFraction(100);
      let actual: boolean = f[0] === d;
      expect(actual).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_2900
     * @tc.name decimalToFractionPart02Test029
     * @tc.desc Verify toFraction(100) on new Decimal(0) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart02Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(0);
      const f: Decimal[] = d.toFraction(100);
      let actual: string = f[0].toString();
      let expected: string = '0';
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = '1';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_3000
     * @tc.name decimalToFractionPart02Test030
     * @tc.desc Verify toFraction(100) on new Decimal(1) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart02Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(1);
      const f: Decimal[] = d.toFraction(100);
      let actual: string = f[0].toString();
      let expected: string = '1';
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = '1';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_3100
     * @tc.name decimalToFractionPart02Test031
     * @tc.desc Verify toFraction(100) on new Decimal("-0.5") returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart02Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("-0.5");
      const f: Decimal[] = d.toFraction(100);
      let actual: string = f[0].toString();
      let expected: string = "-1";
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = '2';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_3200
     * @tc.name decimalToFractionPart02Test032
     * @tc.desc Verify toFraction(100) on new Decimal("-3") returns -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart02Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("-3");
      const f: Decimal[] = d.toFraction(100);
      let actual: string = f[0].toString();
      let expected: string = "-3";
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = '1';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_3300
     * @tc.name decimalToFractionPart02Test033
     * @tc.desc Verify toFraction(100) on new Decimal(0.1).add(0.2) returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart02Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(0.1).add(0.2);
      const f: Decimal[] = d.toFraction(100);
      let actual: string = f[0].toString();
      let expected: string = '3';
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = "10";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_3400
     * @tc.name decimalToFractionPart02Test034
     * @tc.desc Verify toFraction(8) on new Decimal("0.125") returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart02Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("0.125");
      const f: Decimal[] = d.toFraction(8);
      let actual: string = f[0].toString();
      let expected: string = '1';
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = '8';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_3500
     * @tc.name decimalToFractionPart02Test035
     * @tc.desc Verify toFraction(10) on new Decimal("3.141592653589793") returns 22
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart02Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("3.141592653589793");
      const f: Decimal[] = d.toFraction(10);
      let actual: string = f[0].toString();
      let expected: string = "22";
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = '7';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_3600
     * @tc.name decimalToFractionPart02Test036
     * @tc.desc Verify toFraction(100) on new Decimal("3.141592653589793") returns 311
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart02Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("3.141592653589793");
      const f: Decimal[] = d.toFraction(100);
      let actual: string = f[0].toString();
      let expected: string = "311";
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = "99";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_3700
     * @tc.name decimalToFractionPart02Test037
     * @tc.desc Verify toFraction(1000) on new Decimal("3.141592653589793") returns 355
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart02Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("3.141592653589793");
      const f: Decimal[] = d.toFraction(1000);
      let actual: string = f[0].toString();
      let expected: string = "355";
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = "113";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART02_3800
     * @tc.name decimalToFractionPart02Test038
     * @tc.desc Verify toFraction(112) on new Decimal("3.141592653589793") returns 333
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart02Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("3.141592653589793");
      const f: Decimal[] = d.toFraction(112);
      let actual: string = f[0].toString();
      let expected: string = "333";
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = "106";
      expect(actual2).assertEqual(expected2);
    });
  });
}