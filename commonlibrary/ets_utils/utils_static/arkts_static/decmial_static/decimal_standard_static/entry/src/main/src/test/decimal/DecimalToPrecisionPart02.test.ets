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

export default function decimalToPrecisionPart02Test(): void {
  describe("DecimalToPrecisionPart02Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_0100
     * @tc.name decimalToPrecisionPart02Test001
     * @tc.desc Verify toPrecision(3, Decimal.ROUND_HALF_UP) on new Decimal(1.2345) returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.2345).toPrecision(3, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("1.23");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_0200
     * @tc.name decimalToPrecisionPart02Test002
     * @tc.desc Verify toPrecision(sd, rm) on new Decimal(1.2345) returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sd: double = 3;
      let rm: int = Decimal.ROUND_HALF_UP;
      let s: string = new Decimal(1.2345).toPrecision(sd, rm);
      expect(s).assertEqual("1.23");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_0300
     * @tc.name decimalToPrecisionPart02Test003
     * @tc.desc Verify toPrecision(1, Decimal.ROUND_HALF_UP) on new Decimal(1.2345) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.2345).toPrecision(1, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_0400
     * @tc.name decimalToPrecisionPart02Test004
     * @tc.desc Verify toPrecision(1, Decimal.ROUND_HALF_UP) on new Decimal(9.5) returns 1e+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(9.5).toPrecision(1, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("1e+1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_0500
     * @tc.name decimalToPrecisionPart02Test005
     * @tc.desc Verify toPrecision(2, Decimal.ROUND_HALF_UP) on new Decimal(1.2345) returns 1.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.2345).toPrecision(2, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("1.2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_0600
     * @tc.name decimalToPrecisionPart02Test006
     * @tc.desc Verify toPrecision(4, Decimal.ROUND_HALF_UP) on new Decimal(1.2345) returns 1.235
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.2345).toPrecision(4, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("1.235");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_0700
     * @tc.name decimalToPrecisionPart02Test007
     * @tc.desc Verify toPrecision(5, Decimal.ROUND_HALF_UP) on new Decimal(1.2345) returns 1.2345
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.2345).toPrecision(5, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("1.2345");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_0800
     * @tc.name decimalToPrecisionPart02Test008
     * @tc.desc Verify toPrecision(6, Decimal.ROUND_HALF_UP) on new Decimal(1.2345) returns 1.23450
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.2345).toPrecision(6, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("1.23450");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_0900
     * @tc.name decimalToPrecisionPart02Test009
     * @tc.desc Verify toPrecision(10, Decimal.ROUND_HALF_UP) on new Decimal(1.2345) returns 1.234500000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.2345).toPrecision(10, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("1.234500000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_1000
     * @tc.name decimalToPrecisionPart02Test010
     * @tc.desc Verify toPrecision(20, Decimal.ROUND_HALF_UP) on new Decimal(123456789) returns 123456789.00000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(123456789).toPrecision(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("123456789.00000000000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_1100
     * @tc.name decimalToPrecisionPart02Test011
     * @tc.desc Verify toPrecision(1000, Decimal.ROUND_HALF_UP) on new Decimal("0.5") returns 0.5 followed by 999 zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("0.5").toPrecision(1000, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0.5" + '0'.repeat(999));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_1200
     * @tc.name decimalToPrecisionPart02Test012
     * @tc.desc Verify toPrecision(7, Decimal.ROUND_HALF_UP) on new Decimal(12345) returns 12345.00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(12345).toPrecision(7, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("12345.00");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_1300
     * @tc.name decimalToPrecisionPart02Test013
     * @tc.desc Verify toPrecision(3, Decimal.ROUND_HALF_UP) on new Decimal(12345) returns 1.23e+4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(12345).toPrecision(3, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("1.23e+4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_1400
     * @tc.name decimalToPrecisionPart02Test014
     * @tc.desc Verify toPrecision(3, Decimal.ROUND_HALF_UP) on new Decimal(123.45) returns 123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(123.45).toPrecision(3, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_1500
     * @tc.name decimalToPrecisionPart02Test015
     * @tc.desc Verify toPrecision(2, Decimal.ROUND_HALF_UP) on new Decimal(99) returns 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(99).toPrecision(2, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("99");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_1600
     * @tc.name decimalToPrecisionPart02Test016
     * @tc.desc Verify toPrecision(3, Decimal.ROUND_HALF_UP) on new Decimal(999.9) returns 1.00e+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(999.9).toPrecision(3, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("1.00e+3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_1700
     * @tc.name decimalToPrecisionPart02Test017
     * @tc.desc Verify toPrecision(2, Decimal.ROUND_HALF_UP) on new Decimal("9.99") returns 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("9.99").toPrecision(2, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("10");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_1800
     * @tc.name decimalToPrecisionPart02Test018
     * @tc.desc Verify toPrecision(1, Decimal.ROUND_HALF_UP) on new Decimal(0.5) returns 0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0.5).toPrecision(1, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0.5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_1900
     * @tc.name decimalToPrecisionPart02Test019
     * @tc.desc Verify toPrecision(2, Decimal.ROUND_HALF_UP) on new Decimal(0.001234) returns 0.0012
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0.001234).toPrecision(2, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0.0012");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_2000
     * @tc.name decimalToPrecisionPart02Test020
     * @tc.desc Verify toPrecision(1, Decimal.ROUND_HALF_UP) on new Decimal(0.000012345) returns 0.00001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0.000012345).toPrecision(1, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0.00001");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_2100
     * @tc.name decimalToPrecisionPart02Test021
     * @tc.desc Verify toPrecision(2, Decimal.ROUND_HALF_UP) on new Decimal(0.0000012345) returns 0.0000012
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0.0000012345).toPrecision(2, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0.0000012");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_2200
     * @tc.name decimalToPrecisionPart02Test022
     * @tc.desc Verify toPrecision(3, Decimal.ROUND_HALF_UP) on new Decimal(-0.5) returns -0.500
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-0.5).toPrecision(3, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("-0.500");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_2300
     * @tc.name decimalToPrecisionPart02Test023
     * @tc.desc Verify toPrecision(3, Decimal.ROUND_HALF_UP) on new Decimal(-0.12345) returns -0.123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-0.12345).toPrecision(3, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("-0.123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_2400
     * @tc.name decimalToPrecisionPart02Test024
     * @tc.desc Verify toPrecision(0, Decimal.ROUND_HALF_UP) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(1.2345).toPrecision(0, Decimal.ROUND_HALF_UP);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_2500
     * @tc.name decimalToPrecisionPart02Test025
     * @tc.desc Verify toPrecision(-1, Decimal.ROUND_HALF_UP) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(1.2345).toPrecision(-1, Decimal.ROUND_HALF_UP);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_2600
     * @tc.name decimalToPrecisionPart02Test026
     * @tc.desc Verify toPrecision(2.5, Decimal.ROUND_HALF_UP) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(1.2345).toPrecision(2.5, Decimal.ROUND_HALF_UP);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_2700
     * @tc.name decimalToPrecisionPart02Test027
     * @tc.desc Verify toPrecision(1e9 + 1, Decimal.ROUND_HALF_UP) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(1.2345).toPrecision(1e9 + 1, Decimal.ROUND_HALF_UP);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_2800
     * @tc.name decimalToPrecisionPart02Test028
     * @tc.desc Verify toPrecision(Double.NaN, Decimal.ROUND_HALF_UP) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanSd: double = Double.NaN;
      try {
        new Decimal(1.2345).toPrecision(nanSd, Decimal.ROUND_HALF_UP);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_2900
     * @tc.name decimalToPrecisionPart02Test029
     * @tc.desc Verify toPrecision(3, Decimal.ROUND_UP) on new Decimal(1.2351) returns 1.24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.2351).toPrecision(3, Decimal.ROUND_UP);
      expect(s).assertEqual("1.24");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_3000
     * @tc.name decimalToPrecisionPart02Test030
     * @tc.desc Verify toPrecision(3, Decimal.ROUND_UP) on new Decimal(-1.2351) returns -1.24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-1.2351).toPrecision(3, Decimal.ROUND_UP);
      expect(s).assertEqual("-1.24");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_3100
     * @tc.name decimalToPrecisionPart02Test031
     * @tc.desc Verify toPrecision(3, Decimal.ROUND_DOWN) on new Decimal(1.2399) returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.2399).toPrecision(3, Decimal.ROUND_DOWN);
      expect(s).assertEqual("1.23");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_3200
     * @tc.name decimalToPrecisionPart02Test032
     * @tc.desc Verify toPrecision(3, Decimal.ROUND_DOWN) on new Decimal(-1.2399) returns -1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-1.2399).toPrecision(3, Decimal.ROUND_DOWN);
      expect(s).assertEqual("-1.23");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_3300
     * @tc.name decimalToPrecisionPart02Test033
     * @tc.desc Verify toPrecision(3, Decimal.ROUND_CEILING) on new Decimal(1.2311) returns 1.24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.2311).toPrecision(3, Decimal.ROUND_CEILING);
      expect(s).assertEqual("1.24");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_3400
     * @tc.name decimalToPrecisionPart02Test034
     * @tc.desc Verify toPrecision(3, Decimal.ROUND_CEILING) on new Decimal(-1.2311) returns -1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-1.2311).toPrecision(3, Decimal.ROUND_CEILING);
      expect(s).assertEqual("-1.23");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_3500
     * @tc.name decimalToPrecisionPart02Test035
     * @tc.desc Verify toPrecision(3, Decimal.ROUND_FLOOR) on new Decimal(1.2399) returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.2399).toPrecision(3, Decimal.ROUND_FLOOR);
      expect(s).assertEqual("1.23");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_3600
     * @tc.name decimalToPrecisionPart02Test036
     * @tc.desc Verify toPrecision(3, Decimal.ROUND_FLOOR) on new Decimal(-1.2399) returns -1.24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-1.2399).toPrecision(3, Decimal.ROUND_FLOOR);
      expect(s).assertEqual("-1.24");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_3700
     * @tc.name decimalToPrecisionPart02Test037
     * @tc.desc Verify toPrecision(3, Decimal.ROUND_HALF_UP) on new Decimal(1.2355) returns 1.24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.2355).toPrecision(3, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("1.24");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_3800
     * @tc.name decimalToPrecisionPart02Test038
     * @tc.desc Verify toPrecision(3, Decimal.ROUND_HALF_EVEN) on new Decimal(2.345) returns 2.34
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(2.345).toPrecision(3, Decimal.ROUND_HALF_EVEN);
      expect(s).assertEqual("2.34");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_3900
     * @tc.name decimalToPrecisionPart02Test039
     * @tc.desc Verify toPrecision(3, Decimal.ROUND_HALF_EVEN) on new Decimal(2.355) returns 2.36
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(2.355).toPrecision(3, Decimal.ROUND_HALF_EVEN);
      expect(s).assertEqual("2.36");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_4000
     * @tc.name decimalToPrecisionPart02Test040
     * @tc.desc Verify toPrecision(3, Decimal.ROUND_HALF_CEILING) on new Decimal(-1.2355) returns -1.24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-1.2355).toPrecision(3, Decimal.ROUND_HALF_CEILING);
      expect(s).assertEqual("-1.24");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_4100
     * @tc.name decimalToPrecisionPart02Test041
     * @tc.desc Verify toPrecision(3, Decimal.ROUND_HALF_FLOOR) on new Decimal(-1.2355) returns -1.24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-1.2355).toPrecision(3, Decimal.ROUND_HALF_FLOOR);
      expect(s).assertEqual("-1.24");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_4200
     * @tc.name decimalToPrecisionPart02Test042
     * @tc.desc Verify toPrecision(3, -1) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(1.2345).toPrecision(3, -1);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_4300
     * @tc.name decimalToPrecisionPart02Test043
     * @tc.desc Verify toPrecision(3, 9) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(1.2345).toPrecision(3, 9);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_4400
     * @tc.name decimalToPrecisionPart02Test044
     * @tc.desc Verify toPrecision does not mutate source Decimal(1.2345), source remains 1.2345
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(1.2345);
      d.toPrecision(3, Decimal.ROUND_HALF_UP);
      let actual: string = d.toString();
      let expected: string = "1.2345";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_4500
     * @tc.name decimalToPrecisionPart02Test045
     * @tc.desc Verify toPrecision(3, Decimal.ROUND_HALF_UP) on new Decimal(1.2345) returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = new Decimal(1.2345).toPrecision(3, Decimal.ROUND_HALF_UP);
      let re: Decimal = new Decimal(r);
      let actual: string = re.toString();
      let expected: string = "1.23";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_4600
     * @tc.name decimalToPrecisionPart02Test046
     * @tc.desc Verify chained toPrecision(3, Decimal.ROUND_DOWN) then toPrecision(2, Decimal.ROUND_HALF_UP) on new Decimal(1.2345) returns 1.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: string = new Decimal(1.2345).toPrecision(3, Decimal.ROUND_DOWN);
      let outer: string = new Decimal(inner).toPrecision(2, Decimal.ROUND_HALF_UP);
      expect(outer).assertEqual("1.2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_4700
     * @tc.name decimalToPrecisionPart02Test047
     * @tc.desc Verify toPrecision throws BusinessError and source stays usable, toPrecision(3) returns 1.23 after recovery
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(1.2345);
      try {
        d.toPrecision(0, Decimal.ROUND_HALF_UP);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
        expect(e.name).assertEqual("BusinessError");
      }
      let actual2: string = d.toPrecision(3, Decimal.ROUND_HALF_UP);
      let expected2: string = "1.23";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_4800
     * @tc.name decimalToPrecisionPart02Test048
     * @tc.desc Verify toPrecision(4, Decimal.ROUND_HALF_UP) on new Decimal(123456.789) returns 1.235e+5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(123456.789).toPrecision(4, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("1.235e+5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_4900
     * @tc.name decimalToPrecisionPart02Test049
     * @tc.desc Verify toPrecision(3, Decimal.ROUND_HALF_UP) on new Decimal(987654321) returns 9.88e+8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(987654321).toPrecision(3, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("9.88e+8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_5000
     * @tc.name decimalToPrecisionPart02Test050
     * @tc.desc Verify toPrecision(3, Decimal.ROUND_HALF_UP) on new Decimal(999999) returns 1.00e+6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(999999).toPrecision(3, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("1.00e+6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_5100
     * @tc.name decimalToPrecisionPart02Test051
     * @tc.desc Verify toPrecision(3, Decimal.ROUND_HALF_UP) on new Decimal(0.0000001234) returns 1.23e-7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0.0000001234).toPrecision(3, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("1.23e-7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_5200
     * @tc.name decimalToPrecisionPart02Test052
     * @tc.desc Verify toPrecision(3, Decimal.ROUND_UP) on new Decimal(0.0000001234) returns 1.24e-7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0.0000001234).toPrecision(3, Decimal.ROUND_UP);
      expect(s).assertEqual("1.24e-7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_5300
     * @tc.name decimalToPrecisionPart02Test053
     * @tc.desc Verify toPrecision(3, Decimal.ROUND_HALF_UP) on new Decimal("1.2345e10") returns 1.23e+10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.2345e10").toPrecision(3, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("1.23e+10");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_5400
     * @tc.name decimalToPrecisionPart02Test054
     * @tc.desc Verify toPrecision(3, Decimal.ROUND_HALF_UP) on new Decimal("1e-8") returns 1.00e-8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1e-8").toPrecision(3, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("1.00e-8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_5500
     * @tc.name decimalToPrecisionPart02Test055
     * @tc.desc Verify toPrecision(5, Decimal.ROUND_HALF_UP) on new Decimal("123456789012345678901234567890") returns 1.2346e+29
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("123456789012345678901234567890").toPrecision(5, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("1.2346e+29");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_5600
     * @tc.name decimalToPrecisionPart02Test056
     * @tc.desc Verify toPrecision(3, Decimal.ROUND_HALF_UP) on new Decimal(-1.2345) returns -1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-1.2345).toPrecision(3, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("-1.23");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_5700
     * @tc.name decimalToPrecisionPart02Test057
     * @tc.desc Verify toPrecision(3, Decimal.ROUND_HALF_UP) on new Decimal(-12345) returns -1.23e+4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-12345).toPrecision(3, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("-1.23e+4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_5800
     * @tc.name decimalToPrecisionPart02Test058
     * @tc.desc Verify toPrecision(3, Decimal.ROUND_HALF_UP) on new Decimal(0) returns 0.00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0).toPrecision(3, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0.00");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_5900
     * @tc.name decimalToPrecisionPart02Test059
     * @tc.desc Verify toPrecision(3, Decimal.ROUND_HALF_UP) on new Decimal(-0) returns 0.00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-0).toPrecision(3, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0.00");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_6000
     * @tc.name decimalToPrecisionPart02Test060
     * @tc.desc Verify toPrecision(3, Decimal.ROUND_HALF_UP) on new Decimal(Double.NaN) returns Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(Double.NaN).toPrecision(3, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("NaN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_6100
     * @tc.name decimalToPrecisionPart02Test061
     * @tc.desc Verify toPrecision(3, Decimal.ROUND_HALF_UP) on new Decimal(Number.POSITIVE_INFINITY) returns Number.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(Number.POSITIVE_INFINITY).toPrecision(3, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_6200
     * @tc.name decimalToPrecisionPart02Test062
     * @tc.desc Verify toPrecision(3, Decimal.ROUND_HALF_UP) on new Decimal(-Number.POSITIVE_INFINITY) returns -Number.POSITIVE_INF...
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-Number.POSITIVE_INFINITY).toPrecision(3, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("-Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_6300
     * @tc.name decimalToPrecisionPart02Test063
     * @tc.desc Verify toPrecision(5, Decimal.ROUND_HALF_UP) on new Decimal(100) returns 100.00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(100).toPrecision(5, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("100.00");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_6400
     * @tc.name decimalToPrecisionPart02Test064
     * @tc.desc Verify toPrecision(2, Decimal.ROUND_HALF_UP) on new Decimal("0.1").add("0.2") returns 0.30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: Decimal = new Decimal("0.1").add("0.2");
      let s: string = sum.toPrecision(2, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0.30");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_6500
     * @tc.name decimalToPrecisionPart02Test065
     * @tc.desc Verify toPrecision(3, Decimal.ROUND_HALF_UP) on new Decimal("1.7976931348623157e308") returns 1.80e+308
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.7976931348623157e308").toPrecision(3, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("1.80e+308");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_6600
     * @tc.name decimalToPrecisionPart02Test066
     * @tc.desc Verify toPrecision(5, Decimal.ROUND_HALF_UP) on new Decimal("1.2345") returns 1.2345 after Decimal.set({ precision: 2 })
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        Decimal.set({ precision: 2 });
        let s: string = new Decimal("1.2345").toPrecision(5, Decimal.ROUND_HALF_UP);
        expect(s).assertEqual("1.2345");

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_6700
     * @tc.name decimalToPrecisionPart02Test067
     * @tc.desc Verify toPrecision(3, Decimal.ROUND_UP) on new Decimal("1.2345") returns 1.24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        Decimal.set({ rounding: Decimal.ROUND_DOWN });
        let s: string = new Decimal("1.2345").toPrecision(3, Decimal.ROUND_UP);
        expect(s).assertEqual("1.24");

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_6800
     * @tc.name decimalToPrecisionPart02Test068
     * @tc.desc Verify defaults toPrecision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart02Test068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        Decimal.set({ rounding: Decimal.ROUND_UP });
        Decimal.set({ defaults: true });
        let s: string = new Decimal("1.2345").toPrecision(3, Decimal.ROUND_HALF_UP);
        expect(s).assertEqual("1.23");

    });
  });
}
