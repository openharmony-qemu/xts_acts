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
import { BusinessError } from '@ohos.base';
import Utils from "../Util.test";
import { Decimal } from "@kit.ArkTS";

export default function decimalToExponentialPart04Test(): void {
  describe("DecimalToExponentialPart04Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_0100
     * @tc.name decimalToExponentialPart04Test001
     * @tc.desc Verify toExponential(2) on new Decimal("1.005") returns 1.01e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.005");
      let actual: string = d.toExponential(2);
      let expected: string = "1.01e+0";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_0200
     * @tc.name decimalToExponentialPart04Test002
     * @tc.desc Verify toExponential(2, 3) on new Decimal("1.005") returns 1.00e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.005");
      let actual: string = d.toExponential(2, 3);
      let expected: string = "1.00e+0";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_0300
     * @tc.name decimalToExponentialPart04Test003
     * @tc.desc Verify toExponential(2) on new Decimal("1.005") returns 1.01e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.005");
      let actual: string = d.toExponential(2);
      let expected: string = d.toExponential(2.0);
      expect(actual).assertEqual(expected);
      expect(d.toExponential(2)).assertEqual("1.01e+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_0400
     * @tc.name decimalToExponentialPart04Test004
     * @tc.desc Verify toExponential(0) on new Decimal("1234.5") returns 1e+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1234.5");
      let actual: string = d.toExponential(0);
      let expected: string = "1e+3";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_0500
     * @tc.name decimalToExponentialPart04Test005
     * @tc.desc Verify toExponential(0, 0) on new Decimal("1234.5") returns 2e+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1234.5");
      let actual: string = d.toExponential(0, 0);
      let expected: string = "2e+3";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_0600
     * @tc.name decimalToExponentialPart04Test006
     * @tc.desc Verify toExponential(0) on new Decimal("9.9") returns 1e+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("9.9");
      let actual: string = d.toExponential(0);
      let expected: string = "1e+1";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_0700
     * @tc.name decimalToExponentialPart04Test007
     * @tc.desc Verify toExponential(0, 3) on new Decimal("9.9") returns 9e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("9.9");
      let actual: string = d.toExponential(0, 3);
      let expected: string = "9e+0";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_0800
     * @tc.name decimalToExponentialPart04Test008
     * @tc.desc Verify toExponential(-1) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1234.5");
      try {
        d.toExponential(-1);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_0900
     * @tc.name decimalToExponentialPart04Test009
     * @tc.desc Verify toExponential(2.5, 4) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.005");
      try {
        d.toExponential(2.5, 4);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_1000
     * @tc.name decimalToExponentialPart04Test010
     * @tc.desc Verify toExponential(2, Decimal.ROUND_HALF_UP) on new Decimal("1.005") returns d.toExponential(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.005");
      let actual: string = d.toExponential(2, Decimal.ROUND_HALF_UP);
      let expected: string = d.toExponential(2);
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_1100
     * @tc.name decimalToExponentialPart04Test011
     * @tc.desc Verify toExponential(1) on new Decimal("1.05") returns 1.1e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.05");
      let actual: string = d.toExponential(1);
      let expected: string = "1.1e+0";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_1200
     * @tc.name decimalToExponentialPart04Test012
     * @tc.desc Verify toExponential(1, 5) on new Decimal("1.05") returns 1.0e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.05");
      let actual: string = d.toExponential(1, 5);
      let expected: string = "1.0e+0";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_1300
     * @tc.name decimalToExponentialPart04Test013
     * @tc.desc Verify toExponential(0, 6) on new Decimal("0.5") returns 5e-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("0.5");
      let actual: string = d.toExponential(0, 6);
      let expected: string = "5e-1";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_1400
     * @tc.name decimalToExponentialPart04Test014
     * @tc.desc Verify toExponential(1, 7) on new Decimal("-1.05") returns -1.0e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("-1.05");
      let actual: string = d.toExponential(1, 7);
      let expected: string = "-1.0e+0";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_1500
     * @tc.name decimalToExponentialPart04Test015
     * @tc.desc Verify toExponential(1) on new Decimal("-1.05") returns -1.1e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("-1.05");
      let actual: string = d.toExponential(1);
      let expected: string = "-1.1e+0";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_1600
     * @tc.name decimalToExponentialPart04Test016
     * @tc.desc Verify toExponential(1) on new Decimal('0') returns 0.0e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('0');
      let actual: string = d.toExponential(1);
      let expected: string = "0.0e+0";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_1700
     * @tc.name decimalToExponentialPart04Test017
     * @tc.desc Verify toExponential(10) on new Decimal("1234.5") returns 1.2345000000e+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1234.5");
      let actual: string = d.toExponential(10);
      let expected: string = "1.2345000000e+3";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_1800
     * @tc.name decimalToExponentialPart04Test018
     * @tc.desc Verify toExponential(2) on new Decimal("1234.5") returns 1.23e+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1234.5");
      let actual: string = d.toExponential(2);
      let expected: string = "1.23e+3";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_1900
     * @tc.name decimalToExponentialPart04Test019
     * @tc.desc Verify toExponential(2, 3) on new Decimal("1.005") returns 1.00e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.005");
      let actual: string = d.toExponential(2, 3);
      let expected: string = "1.00e+0";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_2000
     * @tc.name decimalToExponentialPart04Test020
     * @tc.desc Verify toExponential(2.5) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1234.5");
      try {
        d.toExponential(2.5);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      let actual: string = d.add(new Decimal("0.5")).toString();
      let expected: string = "1235";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_2100
     * @tc.name decimalToExponentialPart04Test021
     * @tc.desc Verify toExponential(2, 9) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1234.5");
      try {
        d.toExponential(2, 9);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      let actual: string = d.toString();
      let expected: string = "1234.5";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_2200
     * @tc.name decimalToExponentialPart04Test022
     * @tc.desc Verify toExponential(2) on new Decimal("1234.5") returns d.toExponential(2, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1234.5");
      let actual: string = d.toExponential(2);
      let expected: string = d.toExponential(2, 4);
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_2300
     * @tc.name decimalToExponentialPart04Test023
     * @tc.desc Verify toExponential(Double.NaN) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1234.5");
      try {
        d.toExponential(Double.NaN);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      let actual: string = d.toString();
      let expected: string = "1234.5";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_2400
     * @tc.name decimalToExponentialPart04Test024
     * @tc.desc Verify toExponential(2, 4) on new Decimal("1.005") returns 1.01e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Decimal = new Decimal("1.005");
      let d2: Decimal = new Decimal("1.005");
      let actual: string = d1.toExponential(2, 4);
      let expected: string = d2.toExponential(2, 4);
      expect(actual).assertEqual(expected);
      expect(actual).assertEqual("1.01e+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_2500
     * @tc.name decimalToExponentialPart04Test025
     * @tc.desc Verify toExponential(1, 9) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Decimal = new Decimal("1.05");
      let d2: Decimal = new Decimal("1.05");
      try {
        d1.toExponential(1, 9);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      let actual: string = d1.toExponential(1);
      let expected: string = d2.toExponential(1);
      expect(actual).assertEqual(expected);
      expect(actual).assertEqual("1.1e+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_2600
     * @tc.name decimalToExponentialPart04Test026
     * @tc.desc Verify toExponential(2) on new Decimal("1234.5") returns 1.23e+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1234.5");
      let actual: string = d.toExponential(2);
      let expected: string = "1.23e+3";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_2700
     * @tc.name decimalToExponentialPart04Test027
     * @tc.desc Verify toExponential toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1234.5");
      let before: string = d.toString();
      d.toExponential(2);
      let actual: string = d.toString();
      let expected: string = before;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_2800
     * @tc.name decimalToExponentialPart04Test028
     * @tc.desc Verify toExponential(3) e
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1234.5");
      let n: number = d.e;
      d.toExponential(3);
      let actual: number = d.e;
      let expected: number = n;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_2900
     * @tc.name decimalToExponentialPart04Test029
     * @tc.desc Verify toExponential(3,4) s
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1234.5");
      let n: number = d.s;
      d.toExponential(3, 4);
      let actual: number = d.s;
      let expected: number = n;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_3000
     * @tc.name decimalToExponentialPart04Test030
     * @tc.desc Verify double toExponential
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal("1234.5");
      let b: Decimal = new Decimal(1234.5);
      let actual: string = a.toExponential(2);
      let expected: string = b.toExponential(2);
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_3100
     * @tc.name decimalToExponentialPart04Test031
     * @tc.desc Verify new Decimal(existing) toExponential
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal("1234.5");
      let c: Decimal = new Decimal(a);
      let actual: string = a.toExponential(2);
      let expected: string = c.toExponential(2);
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_3200
     * @tc.name decimalToExponentialPart04Test032
     * @tc.desc Verify toExponential(0) on new Decimal("1e21") returns 1e+21
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1e21");
      let actual: string = d.toExponential(0);
      let expected: string = "1e+21";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_3300
     * @tc.name decimalToExponentialPart04Test033
     * @tc.desc Verify toExponential(0, 4) on new Decimal("1e21") returns 1e+21
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1e21");
      let actual: string = d.toExponential(0, 4);
      let expected: string = "1e+21";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_3400
     * @tc.name decimalToExponentialPart04Test034
     * @tc.desc Verify toExponential(2) and toExponential(2, 4) produce equal-length output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1234.5");
      let actual: int = d.toExponential(2).length;
      let expected: number = d.toExponential(2, 4).length;
      expect(actual).assertEqual(expected);
      expect(actual).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_3500
     * @tc.name decimalToExponentialPart04Test035
     * @tc.desc Verify toExponential(4) on new Decimal("1234.5") output round-trips through Decimal constructor to 1234.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: string = new Decimal("1234.5").toExponential(4);
      let actual: string = new Decimal(s1).toString();
      let expected: string = "1234.5";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_3600
     * @tc.name decimalToExponentialPart04Test036
     * @tc.desc Verify toExponential(2) on new Decimal("0.001") returns 1.00e-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("0.001");
      let actual: string = d.toExponential(2);
      let expected: string = "1.00e-3";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_3700
     * @tc.name decimalToExponentialPart04Test037
     * @tc.desc Verify toExponential(2) on new Decimal("1234.5") returns b.toExponential(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal("1234.5");
      let b: Decimal = new Decimal("1234.5");
      let actual: string = a.toExponential(2);
      let expected: string = b.toExponential(2);
      expect(actual).assertEqual(expected);
      expect(actual).assertEqual("1.23e+3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_3800
     * @tc.name decimalToExponentialPart04Test038
     * @tc.desc Verify toExponential() on two equal Decimal instances returns the same output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal("1234.5");
      let b: Decimal = new Decimal("1234.5");
      let actual: string = a.toExponential();
      let expected: string = b.toExponential();
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_3900
     * @tc.name decimalToExponentialPart04Test039
     * @tc.desc Verify toExponential(1) on new Decimal("1.05") returns d.toExponential(1, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: 3 });
      let d: Decimal = new Decimal("1.05");
      let actual: string = d.toExponential(1);
      let expected: string = d.toExponential(1, 3);
      expect(actual).assertEqual(expected);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_4000
     * @tc.name decimalToExponentialPart04Test040
     * @tc.desc Verify toExponential(1, 4) on new Decimal("1.05") returns 1.1e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: 3 });
      let d: Decimal = new Decimal("1.05");
      let actual: string = d.toExponential(1, 4);
      let expected: string = "1.1e+0";
      expect(actual).assertEqual(expected);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_4100
     * @tc.name decimalToExponentialPart04Test041
     * @tc.desc Verify toExponential(1) on new Decimal("1.05") returns 1.0e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: 3 });
      let d: Decimal = new Decimal("1.05");
      let actual: string = d.toExponential(1);
      let expected: string = "1.0e+0";
      expect(actual).assertEqual(expected);
      Decimal.set({ defaults: true });
      let actual2: string = d.toExponential(1);
      let expected2: string = "1.1e+0";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_4200
     * @tc.name decimalToExponentialPart04Test042
     * @tc.desc Verify toExponential(8) on new Decimal("123456789") returns d.toExponential(8, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 3 });
      let d: Decimal = new Decimal("123456789");
      let actual: string = d.toExponential(8);
      let expected: string = d.toExponential(8, 4);
      expect(actual).assertEqual(expected);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_4300
     * @tc.name decimalToExponentialPart04Test043
     * @tc.desc Verify toExponential(8) on new Decimal("123456789") returns 1.23456789e+8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 3 });
      let d: Decimal = new Decimal("123456789");
      let actual: string = d.toExponential(8);
      let expected: string = "1.23456789e+8";
      expect(actual).assertEqual(expected);
      Decimal.set({ defaults: true });
      let actual2: string = new Decimal("123456789").toExponential(8);
      let expected2: string = "1.23456789e+8";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_4400
     * @tc.name decimalToExponentialPart04Test044
     * @tc.desc Verify toExponential(1) on new Decimal("1.05") returns d.toExponential(1, 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: 0 });
      let d: Decimal = new Decimal("1.05");
      let actual: string = d.toExponential(1);
      let expected: string = d.toExponential(1, 0);
      expect(actual).assertEqual(expected);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_4500
     * @tc.name decimalToExponentialPart04Test045
     * @tc.desc Verify toExponential(1) on new Decimal("1.05") returns 1.1e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: 0 });
      let d: Decimal = new Decimal("1.05");
      let actual: string = d.toExponential(1);
      let expected: string = "1.1e+0";
      expect(actual).assertEqual(expected);
      Decimal.set({ defaults: true });
      let actual2: string = d.toExponential(1);
      let expected2: string = d.toExponential(1, 4);
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_4600
     * @tc.name decimalToExponentialPart04Test046
     * @tc.desc Verify toExponential(2) on new Decimal("1.005") returns b.toExponential(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal("1.005");
      let b: Decimal = new Decimal("1.005");
      let actual: string = a.toExponential(2);
      let expected: string = b.toExponential(2);
      expect(actual).assertEqual(expected);
      expect(actual).assertEqual("1.01e+0");
      let actual2: string = a.toExponential(2, 3);
      let expected2: string = b.toExponential(2, 3);
      expect(actual2).assertEqual(expected2);
      expect(actual2).assertEqual("1.00e+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_4700
     * @tc.name decimalToExponentialPart04Test047
     * @tc.desc Verify toExponential(1) on new Decimal("-1.05") returns -1.1e+0 and sign field s equals -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("-1.05");
      let actual: number = d.s;
      let expected: int = -1;
      expect(actual).assertEqual(expected);
      let actual2: string = d.toExponential(1);
      let expected2: string = "-1.1e+0";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_4800
     * @tc.name decimalToExponentialPart04Test048
     * @tc.desc Verify digits dp toExponential(8)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1234.5");
      let n: int = d.d!.length;
      d.toExponential(8);
      let actual: int = d.d!.length;
      let expected: number = n;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_4900
     * @tc.name decimalToExponentialPart04Test049
     * @tc.desc Verify toExponential(0) on new Decimal("0.9999") returns 1e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("0.9999");
      let actual: string = d.toExponential(0);
      let expected: string = "1e+0";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_5000
     * @tc.name decimalToExponentialPart04Test050
     * @tc.desc Verify toExponential(0, 3) on new Decimal("0.9999") returns 9e-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("0.9999");
      let actual: string = d.toExponential(0, 3);
      let expected: string = "9e-1";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_5100
     * @tc.name decimalToExponentialPart04Test051
     * @tc.desc Verify toExponential(0, 3) on new Decimal("7.5") returns 7e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("7.5");
      let actual: string = d.toExponential(0, 3);
      let expected: string = "7e+0";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_5200
     * @tc.name decimalToExponentialPart04Test052
     * @tc.desc Verify toExponential(4) on new Decimal("1234.5") returns 1.2345e+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1234.5");
      let actual: string = d.toExponential(4);
      let expected: string = "1.2345e+3";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART04_5300
     * @tc.name decimalToExponentialPart04Test053
     * @tc.desc Verify toExponential(1) on new Decimal("1.05") returns 1.0e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart04Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: 3 });
      let a: Decimal = new Decimal("1.05");
      let b: Decimal = new Decimal("1.05");
      let actual: string = a.toExponential(1);
      let expected: string = "1.0e+0";
      expect(actual).assertEqual(expected);
      let actual2: string = b.toExponential(1);
      let expected2: string = "1.0e+0";
      expect(actual2).assertEqual(expected2);
      Decimal.set({ defaults: true });
      let actual3: string = a.toExponential(1);
      let expected3: string = "1.1e+0";
      expect(actual3).assertEqual(expected3);
      let actual4: string = b.toExponential(1);
      let expected4: string = "1.1e+0";
      expect(actual4).assertEqual(expected4);
    });
  });
}