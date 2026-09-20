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

export default function decimalToFixedPart03Test(): void {
  describe("DecimalToFixedPart03Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_0100
     * @tc.name decimalToFixedPart03Test001
     * @tc.desc Verify toFixed(2) on new Decimal("1.235") returns 1.24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = new Decimal("1.235").toFixed(2);
      let b: string = new Decimal("1.235").toFixed(2, Decimal.ROUND_DOWN);
      expect(a).assertEqual("1.24");
      expect(b).assertEqual("1.23");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_0200
     * @tc.name decimalToFixedPart03Test002
     * @tc.desc Verify toFixed(2) on new Decimal("1.245") returns 1.25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = new Decimal("1.245").toFixed(2);
      let b: string = new Decimal("1.245").toFixed(2, Decimal.ROUND_HALF_EVEN);
      expect(a).assertEqual("1.25");
      expect(b).assertEqual("1.24");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_0300
     * @tc.name decimalToFixedPart03Test003
     * @tc.desc Verify toFixed(1) on new Decimal("1.25") returns 1.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = new Decimal("1.25").toFixed(1);
      let b: string = new Decimal("1.25").toFixed(1, Decimal.ROUND_HALF_FLOOR);
      expect(a).assertEqual("1.3");
      expect(b).assertEqual("1.2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_0400
     * @tc.name decimalToFixedPart03Test004
     * @tc.desc Verify toFixed(0) on new Decimal("1.5") returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = new Decimal("1.5").toFixed(0);
      let b: string = new Decimal("1.5").toFixed(0, Decimal.ROUND_DOWN);
      expect(a).assertEqual('2');
      expect(b).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_0500
     * @tc.name decimalToFixedPart03Test005
     * @tc.desc Verify toFixed(0) on new Decimal("1.2") returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = new Decimal("1.2").toFixed(0);
      let b: string = new Decimal("1.2").toFixed(0, Decimal.ROUND_UP);
      expect(a).assertEqual('1');
      expect(b).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_0600
     * @tc.name decimalToFixedPart03Test006
     * @tc.desc Verify toFixed(2) on new Decimal("-1.235") returns -1.24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = new Decimal("-1.235").toFixed(2);
      let b: string = new Decimal("-1.235").toFixed(2, Decimal.ROUND_HALF_DOWN);
      expect(a).assertEqual("-1.24");
      expect(b).assertEqual("-1.23");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_0700
     * @tc.name decimalToFixedPart03Test007
     * @tc.desc Verify toFixed(2) on new Decimal("9.995") returns 10.00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = new Decimal("9.995").toFixed(2);
      let b: string = new Decimal("9.995").toFixed(2, Decimal.ROUND_DOWN);
      expect(a).assertEqual("10.00");
      expect(b).assertEqual("9.99");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_0800
     * @tc.name decimalToFixedPart03Test008
     * @tc.desc Verify toFixed(2) and toFixed(2.0) on new Decimal("1.2345") are equivalent (int/double dp) and return "1.23"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = new Decimal("1.2345").toFixed(2);
      let b: string = new Decimal("1.2345").toFixed(2.0);
      expect(a).assertEqual(b);
      expect(a).assertEqual("1.23");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_0900
     * @tc.name decimalToFixedPart03Test009
     * @tc.desc Verify toFixed(2, 4) on new Decimal("1.2345") returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = new Decimal("1.2345").toFixed(2, 4);
      let b: string = new Decimal("1.2345").toFixed(2, Decimal.ROUND_HALF_UP);
      expect(a).assertEqual(b);
      expect(a).assertEqual("1.23");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_1000
     * @tc.name decimalToFixedPart03Test010
     * @tc.desc Verify toFixed(20) on new Decimal("1.2345") returns 1.23450000000000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = new Decimal("1.2345").toFixed(20);
      let b: string = new Decimal("1.2345").toFixed(20, Decimal.ROUND_HALF_UP);
      expect(a).assertEqual(b);
      expect(a).assertEqual("1.23450000000000000000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_1100
     * @tc.name decimalToFixedPart03Test011
     * @tc.desc Verify toFixed(2) on new Decimal('7') returns 7.00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal('7').toFixed(2);
      let expected: string = "7.00";
      expect(actual).assertEqual(expected);
      let actualRoundUp: string = new Decimal('7').toFixed(2, Decimal.ROUND_UP);
      let expectedRoundUp: string = "7.00";
      expect(actualRoundUp).assertEqual(expectedRoundUp);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_1200
     * @tc.name decimalToFixedPart03Test012
     * @tc.desc Verify toFixed(3) on new Decimal("0.5") returns 0.500
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = new Decimal("0.5").toFixed(3);
      let b: string = new Decimal("0.5").toFixed(3, Decimal.ROUND_HALF_UP);
      expect(a).assertEqual(b);
      expect(a).assertEqual("0.500");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_1300
     * @tc.name decimalToFixedPart03Test013
     * @tc.desc Verify toFixed(2, Decimal.ROUND_UP) on new Decimal("1.235") returns 1.24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let r: string = new Decimal("1.235").toFixed(2, Decimal.ROUND_UP);
      Decimal.set({ defaults: true });
      expect(r).assertEqual("1.24");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_1400
     * @tc.name decimalToFixedPart03Test014
     * @tc.desc Verify toFixed(2) on new Decimal("1.235") returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let d: Decimal = new Decimal("1.235");
      let r1: string = d.toFixed(2);
      Decimal.set({ defaults: true });
      let r2: string = d.toFixed(2);
      expect(r1).assertEqual("1.23");
      expect(r2).assertEqual("1.24");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_1500
     * @tc.name decimalToFixedPart03Test015
     * @tc.desc Verify toFixed(2) on new Decimal('5') returns 5.00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let r: string = new Decimal('5').toFixed(2);
      Decimal.set({ defaults: true });
      expect(r).assertEqual("5.00");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_1600
     * @tc.name decimalToFixedPart03Test016
     * @tc.desc Verify toFixed(2) on new Decimal("2.675") returns 2.68
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = new Decimal("2.675").toFixed(2);
      let b: string = new Decimal("2.675").toFixed(2, Decimal.ROUND_HALF_UP);
      expect(a).assertEqual(b);
      expect(a).assertEqual("2.68");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_1700
     * @tc.name decimalToFixedPart03Test017
     * @tc.desc Verify toFixed(1) on new Decimal("1.15") returns 1.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal("1.15").toFixed(1);
      let expected: string = "1.2";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_1800
     * @tc.name decimalToFixedPart03Test018
     * @tc.desc Verify toFixed(-1) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.2345");
      try {
        d.toFixed(-1);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      let actual: string = d.toString();
      let expected: string = "1.2345";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_1900
     * @tc.name decimalToFixedPart03Test019
     * @tc.desc Verify toFixed(1000000001) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.2345e3");
      try {
        d.toFixed(1000000001);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      let actual: number = d.e;
      let expected: int = 3;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_2000
     * @tc.name decimalToFixedPart03Test020
     * @tc.desc Verify toFixed(Double.NaN) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.2345");
      try {
        d.toFixed(Double.NaN);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      let actual: string = d.toFixed(2, Decimal.ROUND_DOWN);
      let expected: string = "1.23";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_2100
     * @tc.name decimalToFixedPart03Test021
     * @tc.desc Verify toFixed(2, 9) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("-1.2345");
      try {
        d.toFixed(2, 9);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      let actual: number = d.s;
      let expected: int = -1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_2200
     * @tc.name decimalToFixedPart03Test022
     * @tc.desc Verify toFixed(2, -1) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("12345.678");
      try {
        d.toFixed(2, -1);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      let actual: string = d.toString();
      let expected: string = "12345.678";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_2300
     * @tc.name decimalToFixedPart03Test023
     * @tc.desc Verify toFixed(-2) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.2345");
      try {
        d.toFixed(-2);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      try {
        d.toFixed(2, 10);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      let actual: string = d.toFixed(2);
      let expected: string = "1.23";
      expect(actual).assertEqual(expected);
      let actualRoundUp: string = d.toFixed(2, Decimal.ROUND_UP);
      let expectedRoundUp: string = "1.24";
      expect(actualRoundUp).assertEqual(expectedRoundUp);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_2400
     * @tc.name decimalToFixedPart03Test024
     * @tc.desc Verify toFixed(Number.POSITIVE_INFINITY) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("0.000123");
      try {
        d.toFixed(Number.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      let actual: string = d.toFixed(4);
      let expected: string = "0.0001";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_2500
     * @tc.name decimalToFixedPart03Test025
     * @tc.desc Verify toFixed(2, 99) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.2345e5");
      try {
        d.toFixed(2, 99);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      let actual: number = d.e;
      let expected: int = 5;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_2600
     * @tc.name decimalToFixedPart03Test026
     * @tc.desc Verify toFixed(-1) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.235");
      try {
        d.toFixed(-1);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      let actual: string = new Decimal("1.235").toFixed(2);
      let expected: string = "1.24";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_2700
     * @tc.name decimalToFixedPart03Test027
     * @tc.desc Verify toFixed(0, 9) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.5");
      try {
        d.toFixed(0, 9);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      let actual: string = d.toString();
      let expected: string = "1.5";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_2800
     * @tc.name decimalToFixedPart03Test028
     * @tc.desc Verify toFixed(10) on new Decimal("1.2345") returns 1.2345000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.2345");
      let actual: string = d.toFixed(10);
      let expected: string = "1.2345000000";
      expect(actual).assertEqual(expected);
      let actualToString: string = d.toString();
      let expectedToString: string = "1.2345";
      expect(actualToString).assertEqual(expectedToString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_2900
     * @tc.name decimalToFixedPart03Test029
     * @tc.desc Verify toString on new Decimal('5') returns '5' and toFixed(2) returns "5.00"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('5');
      let actual: string = d.toString();
      let expected: string = '5';
      expect(actual).assertEqual(expected);
      let actualToFixed2: string = d.toFixed(2);
      let expectedToFixed2: string = "5.00";
      expect(actualToFixed2).assertEqual(expectedToFixed2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_3000
     * @tc.name decimalToFixedPart03Test030
     * @tc.desc Verify d.e equals 2 and toFixed(2) returns 123.45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("123.45");
      let actual: number = d.e;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
      let actualToFixed2: string = d.toFixed(2);
      let expectedToFixed2: string = "123.45";
      expect(actualToFixed2).assertEqual(expectedToFixed2);
      let actualRoundHalfUp: string = d.toFixed(2, Decimal.ROUND_HALF_UP);
      let expectedRoundHalfUp: string = "123.45";
      expect(actualRoundHalfUp).assertEqual(expectedRoundHalfUp);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_3100
     * @tc.name decimalToFixedPart03Test031
     * @tc.desc Verify toFixed(2) does not mutate the Decimal, toString still returns 1.2345
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.2345");
      d.toFixed(2);
      d.toFixed(2, Decimal.ROUND_UP);
      let actual: string = d.toString();
      let expected: string = "1.2345";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_3200
     * @tc.name decimalToFixedPart03Test032
     * @tc.desc Verify toFixed(3) on new Decimal("1.2345") returns 1.235
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.2345");
      let actual: string = d.toFixed(3);
      let expected: string = "1.235";
      expect(actual).assertEqual(expected);
      let actualToFixed3Again: string = d.toFixed(3);
      let expectedToFixed3Again: string = "1.235";
      expect(actualToFixed3Again).assertEqual(expectedToFixed3Again);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_3300
     * @tc.name decimalToFixedPart03Test033
     * @tc.desc Verify toFixed(5) on new Decimal("1.2") returns 1.20000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = new Decimal("1.2").toFixed(5);
      expect(r).assertEqual("1.20000");
      let actual: int = r.length;
      let expected: int = 7;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_3400
     * @tc.name decimalToFixedPart03Test034
     * @tc.desc Verify toFixed(2) on new Decimal("-5") returns -5.00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal("-5").toFixed(2);
      let expected: string = "-5.00";
      expect(actual).assertEqual(expected);
      let actualRoundUp: string = new Decimal("-5").toFixed(2, Decimal.ROUND_UP);
      let expectedRoundUp: string = "-5.00";
      expect(actualRoundUp).assertEqual(expectedRoundUp);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_3500
     * @tc.name decimalToFixedPart03Test035
     * @tc.desc Verify toFixed(2) on new Decimal("0.00123") returns 0.00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = new Decimal("0.00123").toFixed(2);
      let b: string = new Decimal("0.00123").toFixed(2, Decimal.ROUND_UP);
      expect(a).assertEqual("0.00");
      expect(b).assertEqual("0.01");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_3600
     * @tc.name decimalToFixedPart03Test036
     * @tc.desc Verify toFixed(2) on new Decimal("123456789.5") returns 123456789.50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual: string = new Decimal("123456789.5").toFixed(2);
      let expected: string = "123456789.50";
      expect(actual).assertEqual(expected);
      let actualRoundDown: string = new Decimal("123456789.5").toFixed(2, Decimal.ROUND_DOWN);
      let expectedRoundDown: string = "123456789.50";
      expect(actualRoundDown).assertEqual(expectedRoundDown);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_3700
     * @tc.name decimalToFixedPart03Test037
     * @tc.desc Verify toFixed(2) on new Decimal("-1.5") returns -1.50 and sign field s equals -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("-1.5");
      let actual: number = d.s;
      let expected: int = -1;
      expect(actual).assertEqual(expected);
      let actualToFixed2: string = d.toFixed(2);
      let expectedToFixed2: string = "-1.50";
      expect(actualToFixed2).assertEqual(expectedToFixed2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_3800
     * @tc.name decimalToFixedPart03Test038
     * @tc.desc Verify toFixed(2) on new Decimal("001.2300") returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("001.2300");
      let actual: string = d.toFixed(2);
      let expected: string = "1.23";
      expect(actual).assertEqual(expected);
      let actualRoundUp: string = d.toFixed(2, Decimal.ROUND_UP);
      let expectedRoundUp: string = "1.23";
      expect(actualRoundUp).assertEqual(expectedRoundUp);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_3900
     * @tc.name decimalToFixedPart03Test039
     * @tc.desc Verify 1.5e3 toString 1500 toFixed(2) 1500.00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.5e3");
      let actual: string = d.toString();
      let expected: string = "1500";
      expect(actual).assertEqual(expected);
      let actualToFixed2: string = d.toFixed(2);
      let expectedToFixed2: string = "1500.00";
      expect(actualToFixed2).assertEqual(expectedToFixed2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_4000
     * @tc.name decimalToFixedPart03Test040
     * @tc.desc Verify toFixed(2) on new Decimal("1.2345") returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Decimal = new Decimal("1.2345");
      let d2: Decimal = new Decimal(d1);
      let actual: string = d2.toFixed(2);
      let expected: string = "1.23";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_4100
     * @tc.name decimalToFixedPart03Test041
     * @tc.desc Verify toFixed(2) does not mutate the source Decimal("1.2345"); d2 stays 6.789
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Decimal = new Decimal("1.2345");
      let d2: Decimal = new Decimal("6.789");
      d1.toFixed(2);
      let actual: string = d2.toString();
      let expected: string = "6.789";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_4200
     * @tc.name decimalToFixedPart03Test042
     * @tc.desc Verify toFixed(2) on new Decimal("1.23456") with precision set returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 4 });
      let r: string = new Decimal("1.23456").toFixed(2);
      Decimal.set({ defaults: true });
      expect(r).assertEqual("1.23");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_4300
     * @tc.name decimalToFixedPart03Test043
     * @tc.desc Verify toFixed(2, Decimal.ROUND_DOWN) on new Decimal("1.23456") returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 4 });
      let r: string = new Decimal("1.23456").toFixed(2, Decimal.ROUND_DOWN);
      Decimal.set({ defaults: true });
      expect(r).assertEqual("1.23");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_4400
     * @tc.name decimalToFixedPart03Test044
     * @tc.desc Verify toFixed(2) on new Decimal(-0) returns 0.00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-0);
      let actual: string = d.toFixed(2);
      let expected: string = "0.00";
      expect(actual).assertEqual(expected);
      let actualRoundUp: string = d.toFixed(2, Decimal.ROUND_UP);
      let expectedRoundUp: string = "0.00";
      expect(actualRoundUp).assertEqual(expectedRoundUp);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_4500
     * @tc.name decimalToFixedPart03Test045
     * @tc.desc Verify toFixed(2) on new Decimal("-1.235") returns -1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_CEILING });
      let a: string = new Decimal("-1.235").toFixed(2);
      let b: string = new Decimal("-1.235").toFixed(2, Decimal.ROUND_FLOOR);
      Decimal.set({ defaults: true });
      expect(a).assertEqual("-1.23");
      expect(b).assertEqual("-1.24");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_4600
     * @tc.name decimalToFixedPart03Test046
     * @tc.desc Verify repeated toFixed(2, ROUND_DOWN) on new Decimal("1.235") always returns 1.23 (mismatch count 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.235");
      let mismatch: int = 0;
      for (let i: int = 0; i < 3; i++) {
        if (d.toFixed(2, Decimal.ROUND_DOWN) !== "1.23") {
          mismatch = mismatch + 1;
        }
      }
      expect(mismatch).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_4700
     * @tc.name decimalToFixedPart03Test047
     * @tc.desc Verify concatenation of toFixed(2) and toFixed(2, Decimal.ROUND_DOWN) on new Decimal("1.235") returns 1.241.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.235");
      let actual: string = d.toFixed(2) + d.toFixed(2, Decimal.ROUND_DOWN);
      let expected: string = "1.241.23";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_4800
     * @tc.name decimalToFixedPart03Test048
     * @tc.desc Verify toFixed(2) on new Decimal("1.235") yields value greater than toFixed(2, ROUND_DOWN) via comparedTo (==1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.235");
      let r1: Decimal = new Decimal(d.toFixed(2));
      let r2: Decimal = new Decimal(d.toFixed(2, Decimal.ROUND_DOWN));
      let actual: number = r1.comparedTo(r2);
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_4900
     * @tc.name decimalToFixedPart03Test049
     * @tc.desc Verify toFixed(2, Decimal.ROUND_UP) on new Decimal("1.235") produces Decimal whose exponent e equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.235");
      let a: Decimal = new Decimal(d.toFixed(2, Decimal.ROUND_UP));
      let actual: number = a.e;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_5000
     * @tc.name decimalToFixedPart03Test050
     * @tc.desc Verify toFixed(2) on new Decimal("9.999") returns 10.00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = new Decimal("9.999").toFixed(2);
      expect(r).assertEqual("10.00");
      let actual: int = r.length;
      let expected: int = 5;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_5100
     * @tc.name decimalToFixedPart03Test051
     * @tc.desc Verify toFixed(2) on new Decimal('0') returns 0.00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('0');
      let actual: string = d.toFixed(2);
      let expected: string = "0.00";
      expect(actual).assertEqual(expected);
      let actualRoundUp: string = d.toFixed(2, Decimal.ROUND_UP);
      let expectedRoundUp: string = "0.00";
      expect(actualRoundUp).assertEqual(expectedRoundUp);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_5200
     * @tc.name decimalToFixedPart03Test052
     * @tc.desc Verify toFixed(1) on new Decimal(0.1 + 0.2) returns 0.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0.1 + 0.2);
      let actual: string = d.toFixed(1);
      let expected: string = "0.3";
      expect(actual).assertEqual(expected);
      let actualRoundUp: string = d.toFixed(1, Decimal.ROUND_UP);
      let expectedRoundUp: string = "0.4";
      expect(actualRoundUp).assertEqual(expectedRoundUp);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_5300
     * @tc.name decimalToFixedPart03Test053
     * @tc.desc Verify toFixed(2) on new Decimal("1.2345") keeps internal digit array length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.2345");
      let digitsBefore: int = d.d!.length;
      d.toFixed(2);
      d.toFixed(2, Decimal.ROUND_UP);
      let actual: int = d.d!.length;
      let expected: number = digitsBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_5400
     * @tc.name decimalToFixedPart03Test054
     * @tc.desc Verify toFixed(2) on new Decimal("123456789012345678901234567890") returns 123456789012345678901234567890.00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("123456789012345678901234567890");
      let actual: string = d.toFixed(2);
      let expected: string = "123456789012345678901234567890.00";
      expect(actual).assertEqual(expected);
      let actualRoundDown: string = d.toFixed(2, Decimal.ROUND_DOWN);
      let expectedRoundDown: string = "123456789012345678901234567890.00";
      expect(actualRoundDown).assertEqual(expectedRoundDown);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_5500
     * @tc.name decimalToFixedPart03Test055
     * @tc.desc Verify toFixed(1) on new Decimal("1e5") returns 100000.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1e5");
      let actual: string = d.toFixed(1);
      let expected: string = "100000.0";
      expect(actual).assertEqual(expected);
      let actualRoundUp: string = d.toFixed(1, Decimal.ROUND_UP);
      let expectedRoundUp: string = "100000.0";
      expect(actualRoundUp).assertEqual(expectedRoundUp);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_5600
     * @tc.name decimalToFixedPart03Test056
     * @tc.desc Verify toFixed(6) on new Decimal("1.23e-4") returns 0.000123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.23e-4");
      let actual: string = d.toFixed(6);
      let expected: string = "0.000123";
      expect(actual).assertEqual(expected);
      let actualRoundUp: string = d.toFixed(6, Decimal.ROUND_UP);
      let expectedRoundUp: string = "0.000123";
      expect(actualRoundUp).assertEqual(expectedRoundUp);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_5700
     * @tc.name decimalToFixedPart03Test057
     * @tc.desc Verify toFixed(12) on new Decimal("1.5") returns 1.500000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = new Decimal("1.5").toFixed(12);
      let b: string = new Decimal("1.5").toFixed(12, Decimal.ROUND_HALF_UP);
      expect(a).assertEqual(b);
      expect(a).assertEqual("1.500000000000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_5800
     * @tc.name decimalToFixedPart03Test058
     * @tc.desc Verify toFixed(0) on new Decimal("1.999") returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = new Decimal("1.999").toFixed(0);
      let b: string = new Decimal("1.999").toFixed(0, Decimal.ROUND_DOWN);
      expect(a).assertEqual('2');
      expect(b).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_5900
     * @tc.name decimalToFixedPart03Test059
     * @tc.desc Verify toFixed(0) on new Decimal("-1.5") returns -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = new Decimal("-1.5").toFixed(0);
      let b: string = new Decimal("-1.5").toFixed(0, Decimal.ROUND_DOWN);
      expect(a).assertEqual("-2");
      expect(b).assertEqual("-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART03_6000
     * @tc.name decimalToFixedPart03Test060
     * @tc.desc Verify toFixed(1) on new Decimal("99.99") returns 100.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart03Test060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = new Decimal("99.99").toFixed(1);
      let b: string = new Decimal("99.99").toFixed(1, Decimal.ROUND_DOWN);
      expect(a).assertEqual("100.0");
      expect(b).assertEqual("99.9");
    });
  });
}