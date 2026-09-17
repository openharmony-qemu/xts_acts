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

export default function decimalToPrecisionPart03Test(): void {
  describe("DecimalToPrecisionPart03Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_0100
     * @tc.name decimalToPrecisionPart03Test001
     * @tc.desc Verify toPrecision(3) on new Decimal("1.2345") returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: string = new Decimal("1.2345").toPrecision(3);
      let s2: string = new Decimal("1.2345").toPrecision(3, Decimal.ROUND_HALF_UP);
      expect(s1).assertEqual("1.23");
      expect(s2).assertEqual(s1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_0200
     * @tc.name decimalToPrecisionPart03Test002
     * @tc.desc Verify toPrecision(sdInt) on new Decimal("1.2345") returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sdInt: int = 3;
      let s: string = new Decimal("1.2345").toPrecision(sdInt);
      expect(s).assertEqual("1.23");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_0300
     * @tc.name decimalToPrecisionPart03Test003
     * @tc.desc Verify toPrecision(-1) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("55.5");
      try {
        d.toPrecision(-1);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_0400
     * @tc.name decimalToPrecisionPart03Test004
     * @tc.desc Verify toPrecision(1) on new Decimal("1.5") returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.5").toPrecision(1);
      expect(s).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_0500
     * @tc.name decimalToPrecisionPart03Test005
     * @tc.desc Verify toPrecision(1, Decimal.ROUND_DOWN) on new Decimal("1.5") returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.5").toPrecision(1, Decimal.ROUND_DOWN);
      expect(s).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_0600
     * @tc.name decimalToPrecisionPart03Test006
     * @tc.desc Verify toPrecision(4) on new Decimal("1.2345") returns 1.235
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: string = new Decimal("1.2345").toPrecision(4);
      let s2: string = new Decimal("1.2345").toPrecision(4, Decimal.ROUND_HALF_UP);
      expect(s1).assertEqual("1.235");
      expect(s2).assertEqual("1.235");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_0700
     * @tc.name decimalToPrecisionPart03Test007
     * @tc.desc Verify toPrecision(a, b) on new Decimal("1.2345") returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = 3;
      let b: int = Decimal.ROUND_HALF_UP;
      let s: string = new Decimal("1.2345").toPrecision(a, b);
      expect(s).assertEqual("1.23");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_0800
     * @tc.name decimalToPrecisionPart03Test008
     * @tc.desc Verify toPrecision(3.0) on new Decimal("1.2345") returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.2345").toPrecision(3.0);
      expect(s).assertEqual("1.23");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_0900
     * @tc.name decimalToPrecisionPart03Test009
     * @tc.desc Verify toPrecision(2) on new Decimal("1.25") returns 1.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: string = new Decimal("1.25").toPrecision(2);
      let s2: string = new Decimal("1.25").toPrecision(2, Decimal.ROUND_DOWN);
      expect(s1).assertEqual("1.3");
      expect(s2).assertEqual("1.2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_1000
     * @tc.name decimalToPrecisionPart03Test010
     * @tc.desc Verify toPrecision(3) on new Decimal("1.2355") returns 1.24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: string = new Decimal("1.2355").toPrecision(3);
      let s2: string = new Decimal("1.2355").toPrecision(3, Decimal.ROUND_UP);
      expect(s1).assertEqual("1.24");
      expect(s2).assertEqual("1.24");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_1100
     * @tc.name decimalToPrecisionPart03Test011
     * @tc.desc Verify toPrecision(sdBig) on new Decimal("7.5") returns 7.5000000000000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sdBig: double = 20;
      let s1: string = new Decimal("7.5").toPrecision(sdBig);
      let s2: string = new Decimal("7.5").toPrecision(sdBig, Decimal.ROUND_HALF_EVEN);
      expect(s1).assertEqual("7.5000000000000000000");
      expect(s2).assertEqual(s1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_1200
     * @tc.name decimalToPrecisionPart03Test012
     * @tc.desc Verify toPrecision(2, Decimal.ROUND_DOWN) on new Decimal("0.000012345") returns 0.000012
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: string = new Decimal("0.000012345").toPrecision(2, Decimal.ROUND_DOWN);
      let s2: string = new Decimal("0.000012345").toPrecision(2, Decimal.ROUND_UP);
      expect(s1).assertEqual("0.000012");
      expect(s2).assertEqual("0.000013");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_1300
     * @tc.name decimalToPrecisionPart03Test013
     * @tc.desc Verify toPrecision(2) on new Decimal("1.25") returns 1.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: string = new Decimal("1.25").toPrecision(2);
      let s2: string = new Decimal("1.25").toPrecision(2, Decimal.ROUND_HALF_UP);
      expect(s1).assertEqual("1.3");
      expect(s2).assertEqual(s1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_1400
     * @tc.name decimalToPrecisionPart03Test014
     * @tc.desc Verify toPrecision(2) under Decimal.set({ rounding: Decimal.ROUND_DOWN }) on new Decimal("1.25") returns 1.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let s1: string = new Decimal("1.25").toPrecision(2);
      let s2: string = new Decimal("1.25").toPrecision(2, Decimal.ROUND_UP);
      expect(s1).assertEqual("1.2");
      expect(s2).assertEqual("1.3");
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_1500
     * @tc.name decimalToPrecisionPart03Test015
     * @tc.desc Verify toPrecision(2) under Decimal.set({ rounding: Decimal.ROUND_CEILING }) on new Decimal("1.21") returns 1.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_CEILING });
      let s1: string = new Decimal("1.21").toPrecision(2);
      let s2: string = new Decimal("1.21").toPrecision(2, Decimal.ROUND_DOWN);
      expect(s1).assertEqual("1.3");
      expect(s2).assertEqual("1.2");
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_1600
     * @tc.name decimalToPrecisionPart03Test016
     * @tc.desc Verify toPrecision(4) on new Decimal("1.2345") with precision set returns 1.235
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 2 });
      let s1: string = new Decimal("1.2345").toPrecision(4);
      let s2: string = new Decimal("1.2345").toPrecision(4, Decimal.ROUND_HALF_UP);
      expect(s1).assertEqual("1.235");
      expect(s2).assertEqual("1.235");
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_1700
     * @tc.name decimalToPrecisionPart03Test017
     * @tc.desc Verify toPrecision(3) under Decimal.set({ toExpPos: 6 }) on new Decimal("1234567") returns 1.23e+6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ toExpPos: 6 });
      let s1: string = new Decimal("1234567").toPrecision(3);
      let s2: string = new Decimal("1234567").toPrecision(3, Decimal.ROUND_HALF_UP);
      expect(s1).assertEqual("1.23e+6");
      expect(s2).assertEqual(s1);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_1800
     * @tc.name decimalToPrecisionPart03Test018
     * @tc.desc Verify toPrecision(3) under Decimal.set({ toExpNeg: -7 }) on new Decimal("0.000000123456") returns 1.23e-7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ toExpNeg: -7 });
      let s1: string = new Decimal("0.000000123456").toPrecision(3);
      let s2: string = new Decimal("0.000000123456").toPrecision(3, Decimal.ROUND_HALF_UP);
      expect(s1).assertEqual("1.23e-7");
      expect(s2).assertEqual(s1);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_1900
     * @tc.name decimalToPrecisionPart03Test019
     * @tc.desc Verify toPrecision(2) on new Decimal("6.66") returns 6.7 and equals ROUND_HALF_UP result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: string = new Decimal("6.66").toPrecision(2);
      let s2: string = new Decimal("6.66").toPrecision(2, Decimal.ROUND_HALF_UP);
      expect(s1).assertEqual("6.7");
      let actual: boolean = s2 === s1;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_2000
     * @tc.name decimalToPrecisionPart03Test020
     * @tc.desc Verify toPrecision(3) on new Decimal("1.2346") returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: string = new Decimal("1.2346").toPrecision(3);
      let s2: string = new Decimal("1.2346").toPrecision(3, Decimal.ROUND_HALF_EVEN);
      expect(s1).assertEqual("1.23");
      expect(s2).assertEqual(s1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_2100
     * @tc.name decimalToPrecisionPart03Test021
     * @tc.desc Verify toPrecision(0) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("9.87");
      try {
        d.toPrecision(0);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
        expect(e.name).assertEqual("BusinessError");
      }
      let s2: string = d.toPrecision(2, Decimal.ROUND_HALF_UP);
      expect(s2).assertEqual("9.9");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_2200
     * @tc.name decimalToPrecisionPart03Test022
     * @tc.desc Verify toPrecision(2.5, Decimal.ROUND_HALF_UP) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("9.87");
      try {
        d.toPrecision(2.5, Decimal.ROUND_HALF_UP);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
        expect(e.name).assertEqual("BusinessError");
      }
      let s2: string = d.toPrecision(2);
      expect(s2).assertEqual("9.9");
      let actual: string = d.toString();
      let expected: string = "9.87";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_2300
     * @tc.name decimalToPrecisionPart03Test023
     * @tc.desc Verify toPrecision(2, -1) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("8.8");
      try {
        d.toPrecision(2, -1);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
        expect(e.name).assertEqual("BusinessError");
      }
      let s2: string = d.toPrecision(2);
      expect(s2).assertEqual("8.8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_2400
     * @tc.name decimalToPrecisionPart03Test024
     * @tc.desc Verify toPrecision(2, 9) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("8.8");
      try {
        d.toPrecision(2, 9);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
        expect(e.name).assertEqual("BusinessError");
      }
      let actual: int = d.d!.length;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_2500
     * @tc.name decimalToPrecisionPart03Test025
     * @tc.desc Verify toPrecision(Double.NaN) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("-8.8");
      try {
        d.toPrecision(Double.NaN);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
        expect(e.name).assertEqual("BusinessError");
      }
      let actual: number = d.s;
      let expected: int = -1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_2600
     * @tc.name decimalToPrecisionPart03Test026
     * @tc.desc Verify toPrecision(0) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("8.8");
      let c1: int = 0;
      try {
        d.toPrecision(0);
        expect().assertFail();
      } catch (e) {
        c1 = c1 + 1;
        expect((e as BusinessError).code).assertEqual(10200001);
        expect(e.name).assertEqual("BusinessError");
      }
      let c2: int = 0;
      try {
        d.toPrecision(0);
        expect().assertFail();
      } catch (e) {
        c2 = c2 + 1;
        expect((e as BusinessError).code).assertEqual(10200001);
        expect(e.name).assertEqual("BusinessError");
      }
      expect(c1).assertEqual(1);
      expect(c2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_2700
     * @tc.name decimalToPrecisionPart03Test027
     * @tc.desc Verify toPrecision(1000000001, Decimal.ROUND_HALF_UP) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("8.8");
      try {
        d.toPrecision(1000000001, Decimal.ROUND_HALF_UP);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
        expect(e.name).assertEqual("BusinessError");
      }
      let actual: int = d.d!.length;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_2800
     * @tc.name decimalToPrecisionPart03Test028
     * @tc.desc Verify toPrecision(-1) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Decimal = new Decimal("6.66");
      let d2: Decimal = new Decimal("6.66");
      try {
        d1.toPrecision(-1);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
        expect(e.name).assertEqual("BusinessError");
      }
      let s2: string = d2.toPrecision(2, Decimal.ROUND_HALF_UP);
      expect(s2).assertEqual("6.7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_2900
     * @tc.name decimalToPrecisionPart03Test029
     * @tc.desc Verify toPrecision(-1) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.2355");
      try {
        d.toPrecision(-1);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
        expect(e.name).assertEqual("BusinessError");
      }
      let s2: string = d.toPrecision(3, Decimal.ROUND_UP);
      expect(s2).assertEqual("1.24");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_3000
     * @tc.name decimalToPrecisionPart03Test030
     * @tc.desc Verify toPrecision(2, 9) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("9.87");
      try {
        d.toPrecision(2, 9);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
        expect(e.name).assertEqual("BusinessError");
      }
      let s2: string = d.toPrecision(2);
      expect(s2).assertEqual("9.9");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_3100
     * @tc.name decimalToPrecisionPart03Test031
     * @tc.desc Verify toPrecision(4) on new Decimal("123.456") returns 123.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: string = new Decimal("123.456").toPrecision(4);
      let s2: string = new Decimal("123.456").toPrecision(4, Decimal.ROUND_HALF_UP);
      expect(s1).assertEqual("123.5");
      expect(s2).assertEqual("123.5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_3200
     * @tc.name decimalToPrecisionPart03Test032
     * @tc.desc Verify toPrecision(2, Decimal.ROUND_HALF_UP) on new Decimal("1.25") returns 1.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: string = new Decimal("1.25").toPrecision(2, Decimal.ROUND_HALF_UP);
      let s2: string = new Decimal("1.25").toPrecision(2, Decimal.ROUND_HALF_DOWN);
      expect(s1).assertEqual("1.3");
      expect(s2).assertEqual("1.2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_3300
     * @tc.name decimalToPrecisionPart03Test033
     * @tc.desc Verify toPrecision(4) on new Decimal("123.456") keeps toString as 123.456 and returns 123.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("123.456");
      let s1: string = d.toPrecision(4);
      let s2: string = d.toPrecision(4, Decimal.ROUND_HALF_UP);
      let actual: string = d.toString();
      let expected: string = "123.456";
      expect(actual).assertEqual(expected);
      expect(s1).assertEqual("123.5");
      expect(s2).assertEqual("123.5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_3400
     * @tc.name decimalToPrecisionPart03Test034
     * @tc.desc Verify toPrecision(4) on new Decimal("123.456") keeps exponent d.e as 2 and returns 123.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("123.456");
      let s1: string = d.toPrecision(4);
      let s2: string = d.toPrecision(4, Decimal.ROUND_HALF_UP);
      let actual: number = d.e;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
      expect(s1).assertEqual("123.5");
      expect(s2).assertEqual("123.5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_3500
     * @tc.name decimalToPrecisionPart03Test035
     * @tc.desc Verify toPrecision(4) on new Decimal("123.456") keeps sign d.s as 1 and returns 123.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("123.456");
      let s1: string = d.toPrecision(4);
      let s2: string = d.toPrecision(4, Decimal.ROUND_HALF_UP);
      let actual: number = d.s;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      expect(s1).assertEqual("123.5");
      expect(s2).assertEqual("123.5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_3600
     * @tc.name decimalToPrecisionPart03Test036
     * @tc.desc Verify toPrecision(6) on new Decimal("123.456") returns 123.456
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("123.456").toPrecision(6);
      expect(s).assertEqual("123.456");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_3700
     * @tc.name decimalToPrecisionPart03Test037
     * @tc.desc Verify toPrecision(6) on new Decimal("123.456")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: string = new Decimal("123.456").toPrecision(6);
      let s2: string = new Decimal("123.456").toPrecision(6, Decimal.ROUND_HALF_UP);
      expect(s1).assertEqual("123.456");
      let actual: boolean = new Decimal(s1).equals(new Decimal(s2));
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_3800
     * @tc.name decimalToPrecisionPart03Test038
     * @tc.desc Verify toPrecision(8) on new Decimal("123456789012345") returns 1.2345679e+14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: string = new Decimal("123456789012345").toPrecision(8);
      let s2: string = new Decimal("123456789012345").toPrecision(8, Decimal.ROUND_HALF_UP);
      expect(s1).assertEqual("1.2345679e+14");
      expect(s2).assertEqual(s1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_3900
     * @tc.name decimalToPrecisionPart03Test039
     * @tc.desc Verify toPrecision(3) on new Decimal("0.000123456") returns 0.000123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: string = new Decimal("0.000123456").toPrecision(3);
      let s2: string = new Decimal("0.000123456").toPrecision(3, Decimal.ROUND_HALF_UP);
      expect(s1).assertEqual("0.000123");
      expect(s2).assertEqual(s1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_4000
     * @tc.name decimalToPrecisionPart03Test040
     * @tc.desc Verify toPrecision(4) on new Decimal(0) returns 0.000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: string = new Decimal(0).toPrecision(4);
      let s2: string = new Decimal(0).toPrecision(4, Decimal.ROUND_HALF_UP);
      expect(s1).assertEqual("0.000");
      expect(s2).assertEqual(s1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_4100
     * @tc.name decimalToPrecisionPart03Test041
     * @tc.desc Verify toPrecision(3) on new Decimal(-0) returns 0.00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: string = new Decimal(-0).toPrecision(3);
      let s2: string = new Decimal(-0).toPrecision(3, Decimal.ROUND_HALF_UP);
      expect(s1).assertEqual("0.00");
      expect(s2).assertEqual("0.00");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_4200
     * @tc.name decimalToPrecisionPart03Test042
     * @tc.desc Verify toPrecision(3) on new Decimal(Double.NaN) returns "NaN"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: string = new Decimal(Double.NaN).toPrecision(3);
      let s2: string = new Decimal(Double.NaN).toPrecision(3, Decimal.ROUND_HALF_UP);
      expect(s1).assertEqual("NaN");
      expect(s2).assertEqual("NaN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_4300
     * @tc.name decimalToPrecisionPart03Test043
     * @tc.desc Verify toPrecision(3) on new Decimal(Number.POSITIVE_INFINITY) returns "Infinity"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: string = new Decimal(Number.POSITIVE_INFINITY).toPrecision(3);
      let s2: string = new Decimal(Number.POSITIVE_INFINITY).toPrecision(3, Decimal.ROUND_HALF_UP);
      expect(s1).assertEqual("Infinity");
      expect(s2).assertEqual("Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_4400
     * @tc.name decimalToPrecisionPart03Test044
     * @tc.desc Verify toPrecision(3) on new Decimal(Number.NEGATIVE_INFINITY) returns "-Infinity"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: string = new Decimal(Number.NEGATIVE_INFINITY).toPrecision(3);
      let s2: string = new Decimal(Number.NEGATIVE_INFINITY).toPrecision(3, Decimal.ROUND_HALF_UP);
      expect(s1).assertEqual("-Infinity");
      expect(s2).assertEqual("-Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_4500
     * @tc.name decimalToPrecisionPart03Test045
     * @tc.desc Verify toPrecision(1) on new Decimal("9.99") returns 1e+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: string = new Decimal("9.99").toPrecision(1);
      let s2: string = new Decimal("9.99").toPrecision(1, Decimal.ROUND_HALF_UP);
      expect(s1).assertEqual("1e+1");
      expect(s2).assertEqual(s1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_4600
     * @tc.name decimalToPrecisionPart03Test046
     * @tc.desc Verify toPrecision(10) on new Decimal("1.2345") returns "1.234500000"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: string = new Decimal("1.2345").toPrecision(10);
      let s2: string = new Decimal("1.2345").toPrecision(10, Decimal.ROUND_HALF_UP);
      expect(s1).assertEqual("1.234500000");
      expect(s2).assertEqual(s1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_4700
     * @tc.name decimalToPrecisionPart03Test047
     * @tc.desc Verify toPrecision(4) on new Decimal("123.456") returns d2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Decimal = new Decimal("123.456");
      let d2: Decimal = new Decimal("123.456");
      expect(d1.equals(d2)).assertTrue();
      let s1: string = d1.toPrecision(4);
      let s2: string = d2.toPrecision(4, Decimal.ROUND_HALF_UP);
      expect(s1).assertEqual("123.5");
      expect(s2).assertEqual("123.5");
      expect(s1).assertEqual(s2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_4800
     * @tc.name decimalToPrecisionPart03Test048
     * @tc.desc Verify toPrecision(2) under Decimal.set({ rounding: Decimal.ROUND_FLOOR }) on new Decimal("1.25") returns 1.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_FLOOR });
      let s1: string = new Decimal("1.25").toPrecision(2);
      let s2: string = new Decimal("1.25").toPrecision(2, Decimal.ROUND_FLOOR);
      expect(s1).assertEqual("1.2");
      expect(s2).assertEqual(s1);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_4900
     * @tc.name decimalToPrecisionPart03Test049
     * @tc.desc Verify toPrecision(3) on new Decimal("55.5") returns 55.5 and comparedTo is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("55.5");
      let s1: string = d.toPrecision(3);
      let s2: string = d.toPrecision(3, Decimal.ROUND_HALF_UP);
      let actual: boolean = d.equals(new Decimal("55.5"));
      expect(actual).assertTrue();
      expect(s1).assertEqual("55.5");
      expect(s2).assertEqual(s1);
      let actual2: string = d.toString();
      let expected2: string = "55.5";
      expect(actual2).assertEqual(expected2);
      let actual3: number = d.comparedTo(new Decimal("55.5"));
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_5000
     * @tc.name decimalToPrecisionPart03Test050
     * @tc.desc Verify toPrecision(4) on new Decimal("123.456") returns 123.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: string = new Decimal("123.456").toPrecision(4);
      let s2: string = new Decimal("123.456").toPrecision(4, Decimal.ROUND_HALF_UP);
      expect(s1).assertEqual("123.5");
      expect(s2).assertEqual("123.5");
      expect(s1).assertEqual(s2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_5100
     * @tc.name decimalToPrecisionPart03Test051
     * @tc.desc Verify toPrecision(3) on new Decimal(new Decimal("1.2345") returns 2.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: Decimal = new Decimal(new Decimal("1.2345").toPrecision(3)).add(1);
      let r2: Decimal = new Decimal(new Decimal("1.2345").toPrecision(3, Decimal.ROUND_HALF_UP)).add(1);
      let actual: string = r1.toString();
      let expected: string = "2.23";
      expect(actual).assertEqual(expected);
      let actual2: string = r2.toString();
      let expected2: string = "2.23";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_5200
     * @tc.name decimalToPrecisionPart03Test052
     * @tc.desc Verify toPrecision(3) on new Decimal("8.8") returns 8.80 and digit length stays 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("8.8");
      let s1: string = d.toPrecision(3);
      let s2: string = d.toPrecision(3, Decimal.ROUND_HALF_UP);
      let actual: int = d.d!.length;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
      expect(s1).assertEqual("8.80");
      expect(s2).assertEqual(s1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_5300
     * @tc.name decimalToPrecisionPart03Test053
     * @tc.desc Verify toPrecision(3) on new Decimal("1.2345") returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.2345");
      let last1: string = '';
      let last2: string = '';
      for (let i: int = 0; i < 4; i++) {
        last1 = d.toPrecision(3);
        last2 = d.toPrecision(3, Decimal.ROUND_HALF_UP);
      }
      expect(last1).assertEqual("1.23");
      expect(last2).assertEqual("1.23");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_5400
     * @tc.name decimalToPrecisionPart03Test054
     * @tc.desc Verify chained toPrecision(3) then toPrecision(2, Decimal.ROUND_HALF_UP) on new Decimal("1.2345") returns 1.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mid: string = new Decimal("1.2345").toPrecision(3);
      let s: string = new Decimal(mid).toPrecision(2, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("1.2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_5500
     * @tc.name decimalToPrecisionPart03Test055
     * @tc.desc Verify toPrecision(2) on new Decimal("9.87") keeps toString as 9.87 and returns 9.9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("9.87");
      let before: string = d.toString();
      let s: string = d.toPrecision(2);
      let after: string = d.toString();
      expect(before).assertEqual("9.87");
      expect(after).assertEqual(before);
      expect(s).assertEqual("9.9");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_5600
     * @tc.name decimalToPrecisionPart03Test056
     * @tc.desc Verify toPrecision(2, Decimal.ROUND_HALF_UP) on new Decimal("1.25") returns 1.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.25").toPrecision(2, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("1.3");
      let cmp: double = new Decimal(s).comparedTo(new Decimal("1.25"));
      expect(cmp).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_5700
     * @tc.name decimalToPrecisionPart03Test057
     * @tc.desc Verify toPrecision(6) on new Decimal("123.456") returns a value equal to ROUND_HALF_UP result (comparedTo 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: string = new Decimal("123.456").toPrecision(6);
      let s2: string = new Decimal("123.456").toPrecision(6, Decimal.ROUND_HALF_UP);
      expect(s1).assertEqual("123.456");
      let cmp: double = new Decimal(s1).comparedTo(new Decimal(s2));
      expect(cmp).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_5800
     * @tc.name decimalToPrecisionPart03Test058
     * @tc.desc Verify new Decimal(toPrecision(3)).toPrecision(2) toPrecision(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nested: string = new Decimal(new Decimal("1.2345").toPrecision(3)).toPrecision(2);
      let direct: string = new Decimal("1.2345").toPrecision(2);
      expect(nested).assertEqual("1.2");
      expect(direct).assertEqual(nested);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_5900
     * @tc.name decimalToPrecisionPart03Test059
     * @tc.desc Verify toPrecision(2) on new Decimal("9.99") returns 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: string = new Decimal("9.99").toPrecision(2);
      expect(s1).assertEqual("10");
      let s2: string = new Decimal(s1).toPrecision(1);
      expect(s2).assertEqual("1e+1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_6000
     * @tc.name decimalToPrecisionPart03Test060
     * @tc.desc Verify toPrecision(3, Decimal.ROUND_DOWN) on new Decimal("1.2355") returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: string = new Decimal("1.2355").toPrecision(3, Decimal.ROUND_DOWN);
      let s2: string = new Decimal("1.2355").toPrecision(3, Decimal.ROUND_UP);
      expect(s1).assertEqual("1.23");
      expect(s2).assertEqual("1.24");
      let actual: boolean = s1 === s2;
      expect(actual).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_6100
     * @tc.name decimalToPrecisionPart03Test061
     * @tc.desc Verify toPrecision(9) on new Decimal("123456789") returns 123456789
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: string = new Decimal("123456789").toPrecision(9);
      expect(s1).assertEqual("123456789");
      let s2: string = new Decimal(s1).toPrecision(3);
      expect(s2).assertEqual("1.23e+8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_6200
     * @tc.name decimalToPrecisionPart03Test062
     * @tc.desc Verify toPrecision(5) on new Decimal("1.2345") returns 1.2345
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.2345").toPrecision(5);
      expect(s).assertEqual("1.2345");
      let actual: boolean = new Decimal(s).equals(new Decimal("1.2345"));
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_6300
     * @tc.name decimalToPrecisionPart03Test063
     * @tc.desc Verify toPrecision(3, Decimal.ROUND_HALF_UP) on new Decimal("1.2345") returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.2345").toPrecision(3, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("1.23");
      let cmp: double = new Decimal(s).comparedTo(new Decimal("1.2345"));
      expect(cmp).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_6400
     * @tc.name decimalToPrecisionPart03Test064
     * @tc.desc Verify toPrecision(3) on new Decimal("1.2345") returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart03Test064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = new Decimal("1.2345").toPrecision(3);
      expect(a).assertEqual("1.23");
      let b: string = new Decimal(a).toPrecision(2);
      expect(b).assertEqual("1.2");
      let c: string = new Decimal(b).toPrecision(1);
      expect(c).assertEqual('1');
    });
  });
}
