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

export default function decimalToFractionPart03Test(): void {
  describe("DecimalToFractionPart03Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART03_0100
     * @tc.name decimalToFractionPart03Test001
     * @tc.desc Verify toFraction(5) on new Decimal("2.3") returns 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart03Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("2.3");
      const f: Decimal[] = d.toFraction(5);
      let actual: string = f[0].toString();
      let expected: string = '7';
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = '3';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART03_0200
     * @tc.name decimalToFractionPart03Test002
     * @tc.desc Verify toFraction(4) on new Decimal("1.9") returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart03Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("1.9");
      const f: Decimal[] = d.toFraction(4);
      let actual: string = f[0].toString();
      let expected: string = '2';
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = '1';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART03_0300
     * @tc.name decimalToFractionPart03Test003
     * @tc.desc Verify toFraction(2) on new Decimal("1.5") returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart03Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("1.5");
      const f: Decimal[] = d.toFraction(2);
      let actual: string = f[0].toString();
      let expected: string = '3';
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = '2';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART03_0400
     * @tc.name decimalToFractionPart03Test004
     * @tc.desc Verify toFraction(100) on new Decimal(Double.NaN) returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart03Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(Double.NaN);
      const f: Decimal[] = d.toFraction(100);
      let actual: string = f[0].toString();
      let expected: string = "NaN";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART03_0500
     * @tc.name decimalToFractionPart03Test005
     * @tc.desc Verify toFraction(100) on new Decimal(Number.POSITIVE_INFINITY) returns Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart03Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(Number.POSITIVE_INFINITY);
      const f: Decimal[] = d.toFraction(100);
      let actual: string = f[0].toString();
      let expected: string = "Infinity";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART03_0600
     * @tc.name decimalToFractionPart03Test006
     * @tc.desc Verify toFraction(100) on new Decimal(-Number.POSITIVE_INFINITY) returns -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart03Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(-Number.POSITIVE_INFINITY);
      const f: Decimal[] = d.toFraction(100);
      let actual: string = f[0].toString();
      let expected: string = "-Infinity";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART03_0700
     * @tc.name decimalToFractionPart03Test007
     * @tc.desc Verify toFraction(1) on new Decimal("-0.5") returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart03Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("-0.5");
      const f: Decimal[] = d.toFraction(1);
      let actual: string = f[0].toString();
      let expected: string = '0';
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = '1';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART03_0800
     * @tc.name decimalToFractionPart03Test008
     * @tc.desc Verify toFraction(3) on new Decimal("-2.9") returns -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart03Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("-2.9");
      const f: Decimal[] = d.toFraction(3);
      let actual: string = f[0].toString();
      let expected: string = "-3";
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = '1';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART03_0900
     * @tc.name decimalToFractionPart03Test009
     * @tc.desc Verify toFraction(8) on new Decimal("1.1") returns 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart03Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("1.1");
      const f: Decimal[] = d.toFraction(8);
      let actual: string = f[0].toString();
      let expected: string = '9';
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = '8';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART03_1000
     * @tc.name decimalToFractionPart03Test010
     * @tc.desc Verify toFraction(100) on new Decimal("1e-2") returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart03Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("1e-2");
      const f: Decimal[] = d.toFraction(100);
      let actual: string = f[0].toString();
      let expected: string = '1';
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = "100";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART03_1100
     * @tc.name decimalToFractionPart03Test011
     * @tc.desc Verify toFraction(50) on new Decimal("1e-2") returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart03Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("1e-2");
      const f: Decimal[] = d.toFraction(50);
      let actual: string = f[0].toString();
      let expected: string = '0';
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = '1';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART03_1200
     * @tc.name decimalToFractionPart03Test012
     * @tc.desc Verify toFraction(9) on new Decimal("0.1") returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart03Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("0.1");
      const f: Decimal[] = d.toFraction(9);
      let actual: string = f[0].toString();
      let expected: string = '1';
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = '9';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART03_1300
     * @tc.name decimalToFractionPart03Test013
     * @tc.desc Verify toFraction(999) on new Decimal("0.0001") returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart03Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("0.0001");
      const f: Decimal[] = d.toFraction(999);
      let actual: string = f[0].toString();
      let expected: string = '0';
      expect(actual).assertEqual(expected);
      let actual2: string = f[1].toString();
      let expected2: string = '1';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART03_1400
     * @tc.name decimalToFractionPart03Test014
     * @tc.desc Verify toFraction(Number.NaN) on new Decimal("0.5") throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart03Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("0.5");
      try {
        d.toFraction(Number.NaN);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART03_1500
     * @tc.name decimalToFractionPart03Test015
     * @tc.desc Verify toFraction(Number.POSITIVE_INFINITY) on new Decimal("0.5") throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart03Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("0.5");
      try {
        d.toFraction(Number.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART03_1600
     * @tc.name decimalToFractionPart03Test016
     * @tc.desc Verify toFraction("invalid-boolean") on new Decimal("0.5") throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart03Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("0.5");
      let bad: string = "invalid-boolean";
      try {
        d.toFraction(bad);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART03_1700
     * @tc.name decimalToFractionPart03Test017
     * @tc.desc Verify toFraction(-5) on new Decimal("0.5") throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart03Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("0.5");
      try {
        d.toFraction(-5);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART03_1800
     * @tc.name decimalToFractionPart03Test018
     * @tc.desc Verify toFraction(2.5) on new Decimal("0.5") throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart03Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("0.5");
      try {
        d.toFraction(2.5);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART03_1900
     * @tc.name decimalToFractionPart03Test019
     * @tc.desc Verify toFraction(0) on new Decimal("0.5") throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart03Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("0.5");
      try {
        d.toFraction(0);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FRACTION_PART03_2000
     * @tc.name decimalToFractionPart03Test020
     * @tc.desc Verify toFraction(-Number.POSITIVE_INFINITY) on new Decimal("0.5") throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFractionPart03Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal("0.5");
      try {
        d.toFraction(-Number.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  });
}