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

export default function decimalToFixedPart02Test(): void {
  describe("DecimalToFixedPart02Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_0100
     * @tc.name decimalToFixedPart02Test001
     * @tc.desc Verify toFixed(2, Decimal.ROUND_HALF_UP) on new Decimal(1.235) returns 1.24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.235).toFixed(2, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("1.24");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_0200
     * @tc.name decimalToFixedPart02Test002
     * @tc.desc Verify toFixed(0, Decimal.ROUND_HALF_UP) on new Decimal(5.5) returns 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(5.5).toFixed(0, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual('6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_0300
     * @tc.name decimalToFixedPart02Test003
     * @tc.desc Verify toFixed(0, Decimal.ROUND_DOWN) on new Decimal(5.5) returns 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(5.5).toFixed(0, Decimal.ROUND_DOWN);
      expect(s).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_0400
     * @tc.name decimalToFixedPart02Test004
     * @tc.desc Verify toFixed(1, Decimal.ROUND_HALF_UP) on new Decimal(3.14159) returns 3.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(3.14159).toFixed(1, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("3.1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_0500
     * @tc.name decimalToFixedPart02Test005
     * @tc.desc Verify toFixed(2, Decimal.ROUND_HALF_UP) on new Decimal(1.2345) returns 1.23 and round-trips through new Decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.2345).toFixed(2, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("1.23");
      let back: Decimal = new Decimal(s);
      let actual: string = back.toString();
      let expected: string = "1.23";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_0600
     * @tc.name decimalToFixedPart02Test006
     * @tc.desc Verify toFixed(2, Decimal.ROUND_DOWN) on new Decimal(1.5) returns 1.50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.5).toFixed(2, Decimal.ROUND_DOWN);
      expect(s).assertEqual("1.50");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_0700
     * @tc.name decimalToFixedPart02Test007
     * @tc.desc Verify toFixed(3, Decimal.ROUND_DOWN) on new Decimal(1.2) returns 1.200
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.2).toFixed(3, Decimal.ROUND_DOWN);
      expect(s).assertEqual("1.200");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_0800
     * @tc.name decimalToFixedPart02Test008
     * @tc.desc Verify toFixed(10, Decimal.ROUND_DOWN) on new Decimal("0.5") returns 0.5000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("0.5").toFixed(10, Decimal.ROUND_DOWN);
      expect(s).assertEqual("0.5000000000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_0900
     * @tc.name decimalToFixedPart02Test009
     * @tc.desc Verify toFixed(10, Decimal.ROUND_DOWN) on new Decimal("1e-7") returns 0.0000001000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1e-7").toFixed(10, Decimal.ROUND_DOWN);
      expect(s).assertEqual("0.0000001000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_1000
     * @tc.name decimalToFixedPart02Test010
     * @tc.desc Verify toFixed(2, Decimal.ROUND_DOWN) on new Decimal("123.456") returns 123.45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("123.456").toFixed(2, Decimal.ROUND_DOWN);
      expect(s).assertEqual("123.45");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_1100
     * @tc.name decimalToFixedPart02Test011
     * @tc.desc Verify toFixed(0, Decimal.ROUND_HALF_UP) on new Decimal(-2.5) returns -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-2.5).toFixed(0, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("-3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_1200
     * @tc.name decimalToFixedPart02Test012
     * @tc.desc Verify toFixed(0, Decimal.ROUND_CEILING) on new Decimal(-0.4) returns -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-0.4).toFixed(0, Decimal.ROUND_CEILING);
      expect(s).assertEqual("-0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_1300
     * @tc.name decimalToFixedPart02Test013
     * @tc.desc Verify toFixed(0, Decimal.ROUND_DOWN) on new Decimal("0.4") returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("0.4").toFixed(0, Decimal.ROUND_DOWN);
      expect(s).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_1400
     * @tc.name decimalToFixedPart02Test014
     * @tc.desc Verify toFixed(0, Decimal.ROUND_HALF_UP) on new Decimal("0.6") returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("0.6").toFixed(0, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_1500
     * @tc.name decimalToFixedPart02Test015
     * @tc.desc Verify toFixed(1, Decimal.ROUND_UP) on new Decimal("1.99") returns 2.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.99").toFixed(1, Decimal.ROUND_UP);
      expect(s).assertEqual("2.0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_1600
     * @tc.name decimalToFixedPart02Test016
     * @tc.desc Verify toFixed(1, Decimal.ROUND_DOWN) on new Decimal("1.99") returns 1.9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.99").toFixed(1, Decimal.ROUND_DOWN);
      expect(s).assertEqual("1.9");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_1700
     * @tc.name decimalToFixedPart02Test017
     * @tc.desc Verify toFixed(2, Decimal.ROUND_HALF_UP) on new Decimal("0.999") returns 1.00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("0.999").toFixed(2, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("1.00");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_1800
     * @tc.name decimalToFixedPart02Test018
     * @tc.desc Verify toFixed(5, Decimal.ROUND_HALF_UP) on new Decimal("0.00001") returns 0.00001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("0.00001").toFixed(5, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0.00001");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_1900
     * @tc.name decimalToFixedPart02Test019
     * @tc.desc Verify toFixed(4, Decimal.ROUND_DOWN) on new Decimal("0.00001") returns 0.0000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("0.00001").toFixed(4, Decimal.ROUND_DOWN);
      expect(s).assertEqual("0.0000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_2000
     * @tc.name decimalToFixedPart02Test020
     * @tc.desc Verify toFixed(6, Decimal.ROUND_HALF_UP) on new Decimal("0.000001") returns 0.000001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("0.000001").toFixed(6, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0.000001");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_2100
     * @tc.name decimalToFixedPart02Test021
     * @tc.desc Verify toFixed(10, Decimal.ROUND_HALF_UP) on new Decimal("1.999999999999") returns 2.0000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.999999999999").toFixed(10, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("2.0000000000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_2200
     * @tc.name decimalToFixedPart02Test022
     * @tc.desc Verify toFixed(1000, Decimal.ROUND_DOWN) on new Decimal('1') returns 1.0000... length 1002
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal('1').toFixed(1000, Decimal.ROUND_DOWN);
      let actual: int = s.length;
      let expected: int = 1002;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_2300
     * @tc.name decimalToFixedPart02Test023
     * @tc.desc Verify toFixed(2, Decimal.ROUND_DOWN) on new Decimal("1e-2") returns 0.01
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1e-2").toFixed(2, Decimal.ROUND_DOWN);
      expect(s).assertEqual("0.01");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_2400
     * @tc.name decimalToFixedPart02Test024
     * @tc.desc Verify toFixed(2, Decimal.ROUND_DOWN) on new Decimal("5e-1") returns 0.50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("5e-1").toFixed(2, Decimal.ROUND_DOWN);
      expect(s).assertEqual("0.50");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_2500
     * @tc.name decimalToFixedPart02Test025
     * @tc.desc Verify toFixed(-1, ROUND_UP) on new Decimal(1) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(1).toFixed(-1, Decimal.ROUND_UP);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_2600
     * @tc.name decimalToFixedPart02Test026
     * @tc.desc Verify toFixed(1000000001, ROUND_UP) on new Decimal(1) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(1).toFixed(1000000001, Decimal.ROUND_UP);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_2700
     * @tc.name decimalToFixedPart02Test027
     * @tc.desc Verify toFixed(Double.NaN, ROUND_UP) on new Decimal(1) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(1).toFixed(Double.NaN, Decimal.ROUND_UP);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_2800
     * @tc.name decimalToFixedPart02Test028
     * @tc.desc Verify toFixed(2, Decimal.ROUND_UP) on new Decimal(1.2345) returns 1.24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.2345).toFixed(2, Decimal.ROUND_UP);
      expect(s).assertEqual("1.24");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_2900
     * @tc.name decimalToFixedPart02Test029
     * @tc.desc Verify toFixed(2, Decimal.ROUND_DOWN) on new Decimal(1.2345) returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.2345).toFixed(2, Decimal.ROUND_DOWN);
      expect(s).assertEqual("1.23");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_3000
     * @tc.name decimalToFixedPart02Test030
     * @tc.desc Verify toFixed(2, Decimal.ROUND_CEILING) on new Decimal(-1.2345) returns -1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-1.2345).toFixed(2, Decimal.ROUND_CEILING);
      expect(s).assertEqual("-1.23");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_3100
     * @tc.name decimalToFixedPart02Test031
     * @tc.desc Verify toFixed(2, Decimal.ROUND_FLOOR) on new Decimal(-1.2345) returns -1.24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-1.2345).toFixed(2, Decimal.ROUND_FLOOR);
      expect(s).assertEqual("-1.24");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_3200
     * @tc.name decimalToFixedPart02Test032
     * @tc.desc Verify toFixed(2, Decimal.ROUND_HALF_DOWN) on new Decimal(1.235) returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.235).toFixed(2, Decimal.ROUND_HALF_DOWN);
      expect(s).assertEqual("1.23");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_3300
     * @tc.name decimalToFixedPart02Test033
     * @tc.desc Verify toFixed(2, Decimal.ROUND_HALF_EVEN) on new Decimal(1.245) returns 1.24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.245).toFixed(2, Decimal.ROUND_HALF_EVEN);
      expect(s).assertEqual("1.24");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_3400
     * @tc.name decimalToFixedPart02Test034
     * @tc.desc Verify toFixed(2, Decimal.ROUND_HALF_EVEN) on new Decimal(1.235) returns 1.24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.235).toFixed(2, Decimal.ROUND_HALF_EVEN);
      expect(s).assertEqual("1.24");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_3500
     * @tc.name decimalToFixedPart02Test035
     * @tc.desc Verify toFixed(2, Decimal.ROUND_HALF_CEILING) on new Decimal(-1.235) returns -1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-1.235).toFixed(2, Decimal.ROUND_HALF_CEILING);
      expect(s).assertEqual("-1.23");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_3600
     * @tc.name decimalToFixedPart02Test036
     * @tc.desc Verify toFixed(2, Decimal.ROUND_HALF_FLOOR) on new Decimal(-1.235) returns -1.24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-1.235).toFixed(2, Decimal.ROUND_HALF_FLOOR);
      expect(s).assertEqual("-1.24");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_3700
     * @tc.name decimalToFixedPart02Test037
     * @tc.desc Verify toFixed(2, Decimal.ROUND_HALF_UP) on new Decimal(-1.235) returns -1.24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-1.235).toFixed(2, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("-1.24");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_3800
     * @tc.name decimalToFixedPart02Test038
     * @tc.desc Verify toFixed(2, Decimal.ROUND_HALF_DOWN) on new Decimal(-1.235) returns -1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-1.235).toFixed(2, Decimal.ROUND_HALF_DOWN);
      expect(s).assertEqual("-1.23");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_3900
     * @tc.name decimalToFixedPart02Test039
     * @tc.desc Verify toFixed(2, Decimal.ROUND_HALF_FLOOR) on new Decimal(1.235) returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.235).toFixed(2, Decimal.ROUND_HALF_FLOOR);
      expect(s).assertEqual("1.23");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_4000
     * @tc.name decimalToFixedPart02Test040
     * @tc.desc Verify toFixed(0, Decimal.ROUND_UP) on new Decimal("1.9") returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.9").toFixed(0, Decimal.ROUND_UP);
      expect(s).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_4100
     * @tc.name decimalToFixedPart02Test041
     * @tc.desc Verify toFixed(0, Decimal.ROUND_DOWN) on new Decimal("1.9") returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.9").toFixed(0, Decimal.ROUND_DOWN);
      expect(s).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_4200
     * @tc.name decimalToFixedPart02Test042
     * @tc.desc Verify toFixed(0, Decimal.ROUND_CEILING) on new Decimal("1.01") returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.01").toFixed(0, Decimal.ROUND_CEILING);
      expect(s).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_4300
     * @tc.name decimalToFixedPart02Test043
     * @tc.desc Verify toFixed(0, Decimal.ROUND_FLOOR) on new Decimal("1.01") returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.01").toFixed(0, Decimal.ROUND_FLOOR);
      expect(s).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_4400
     * @tc.name decimalToFixedPart02Test044
     * @tc.desc Verify toFixed(2, Decimal.ROUND_HALF_UP) on new Decimal("2.135") returns 2.14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("2.135").toFixed(2, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("2.14");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_4500
     * @tc.name decimalToFixedPart02Test045
     * @tc.desc Verify toFixed(2, Decimal.ROUND_HALF_DOWN) on new Decimal("2.135") returns 2.13
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("2.135").toFixed(2, Decimal.ROUND_HALF_DOWN);
      expect(s).assertEqual("2.13");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_4600
     * @tc.name decimalToFixedPart02Test046
     * @tc.desc Verify toFixed(2, Decimal.ROUND_CEILING) on new Decimal("0.999") returns 1.00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("0.999").toFixed(2, Decimal.ROUND_CEILING);
      expect(s).assertEqual("1.00");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_4700
     * @tc.name decimalToFixedPart02Test047
     * @tc.desc Verify toFixed(2, Decimal.ROUND_FLOOR) on new Decimal("0.999") returns 0.99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("0.999").toFixed(2, Decimal.ROUND_FLOOR);
      expect(s).assertEqual("0.99");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_4800
     * @tc.name decimalToFixedPart02Test048
     * @tc.desc Verify toFixed(2, -1) on new Decimal(1.235) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(1.235).toFixed(2, -1);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_4900
     * @tc.name decimalToFixedPart02Test049
     * @tc.desc Verify toFixed(2, Decimal.ROUND_UP) on new Decimal(1.235) returns 1.24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let s: string = new Decimal(1.235).toFixed(2, Decimal.ROUND_UP);
      expect(s).assertEqual("1.24");
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_5000
     * @tc.name decimalToFixedPart02Test050
     * @tc.desc Verify toFixed(2, Decimal.ROUND_HALF_UP) on new Decimal(-5) returns -5.00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-5).toFixed(2, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("-5.00");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_5100
     * @tc.name decimalToFixedPart02Test051
     * @tc.desc Verify toFixed(2, Decimal.ROUND_HALF_UP) on new Decimal(7) returns 7.00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(7).toFixed(2, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("7.00");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_5200
     * @tc.name decimalToFixedPart02Test052
     * @tc.desc Verify toFixed(2, Decimal.ROUND_DOWN) on new Decimal("-123.456") returns -123.45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("-123.456").toFixed(2, Decimal.ROUND_DOWN);
      expect(s).assertEqual("-123.45");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_5300
     * @tc.name decimalToFixedPart02Test053
     * @tc.desc Verify toFixed(2, Decimal.ROUND_HALF_UP) does not mutate the Decimal("1.2345"); toString() still returns 1.2345
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.2345");
      d.toFixed(2, Decimal.ROUND_HALF_UP);
      let actual: string = d.toString();
      let expected: string = "1.2345";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_5400
     * @tc.name decimalToFixedPart02Test054
     * @tc.desc Verify toFixed(2, Decimal.ROUND_HALF_UP) on new Decimal("9.999") returns 10.00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("9.999").toFixed(2, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("10.00");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_5500
     * @tc.name decimalToFixedPart02Test055
     * @tc.desc Verify toFixed(1, Decimal.ROUND_UP) on new Decimal("9.99") returns 10.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("9.99").toFixed(1, Decimal.ROUND_UP);
      expect(s).assertEqual("10.0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_5600
     * @tc.name decimalToFixedPart02Test056
     * @tc.desc Verify toFixed(2, Decimal.ROUND_DOWN) on new Decimal("1e10") returns 10000000000.00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1e10").toFixed(2, Decimal.ROUND_DOWN);
      expect(s).assertEqual("10000000000.00");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_5700
     * @tc.name decimalToFixedPart02Test057
     * @tc.desc Verify toFixed(20, Decimal.ROUND_DOWN) on new Decimal("1e-20") returns 0.00000000000000000001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1e-20").toFixed(20, Decimal.ROUND_DOWN);
      expect(s).assertEqual("0.00000000000000000001");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_5800
     * @tc.name decimalToFixedPart02Test058
     * @tc.desc Verify toFixed(2, ROUND_HALF_UP) on new Decimal(Double.NaN) returns string "NaN"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(Double.NaN).toFixed(2, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("NaN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_5900
     * @tc.name decimalToFixedPart02Test059
     * @tc.desc Verify toFixed(2, ROUND_HALF_UP) on new Decimal(Number.POSITIVE_INFINITY) returns string "Infinity"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(Number.POSITIVE_INFINITY).toFixed(2, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_6000
     * @tc.name decimalToFixedPart02Test060
     * @tc.desc Verify toFixed(2, ROUND_HALF_UP) on new Decimal(-Number.POSITIVE_INFINITY) returns string "-Infinity"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-Number.POSITIVE_INFINITY).toFixed(2, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("-Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_6100
     * @tc.name decimalToFixedPart02Test061
     * @tc.desc Verify toFixed(2, Decimal.ROUND_HALF_UP) on new Decimal(-0) returns 0.00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-0).toFixed(2, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0.00");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_6200
     * @tc.name decimalToFixedPart02Test062
     * @tc.desc Verify toFixed(1, Decimal.ROUND_DOWN) on new Decimal("2.50") returns 2.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("2.50").toFixed(1, Decimal.ROUND_DOWN);
      expect(s).assertEqual("2.5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_6300
     * @tc.name decimalToFixedPart02Test063
     * @tc.desc Verify toFixed(2, Decimal.ROUND_DOWN) on new Decimal("1.2300") returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.2300").toFixed(2, Decimal.ROUND_DOWN);
      expect(s).assertEqual("1.23");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_6400
     * @tc.name decimalToFixedPart02Test064
     * @tc.desc Verify toFixed(2, Decimal.ROUND_HALF_UP) on new Decimal("+1.2345") returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("+1.2345").toFixed(2, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("1.23");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_6500
     * @tc.name decimalToFixedPart02Test065
     * @tc.desc Verify toFixed(2, Decimal.ROUND_HALF_UP) on new Decimal("-1.2345") returns -1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("-1.2345").toFixed(2, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("-1.23");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_6600
     * @tc.name decimalToFixedPart02Test066
     * @tc.desc Verify toFixed(2, Decimal.ROUND_HALF_UP) on new Decimal(new Decimal("1.2345")) returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: Decimal = new Decimal("1.2345");
      let outer: Decimal = new Decimal(inner);
      let s: string = outer.toFixed(2, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("1.23");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_6700
     * @tc.name decimalToFixedPart02Test067
     * @tc.desc Verify toFixed(2, Decimal.ROUND_DOWN) on new Decimal(0.1) returns 0.10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0.1).toFixed(2, Decimal.ROUND_DOWN);
      expect(s).assertEqual("0.10");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_6800
     * @tc.name decimalToFixedPart02Test068
     * @tc.desc Verify toFixed(2, Decimal.ROUND_DOWN) on new Decimal("12345678901234567890.123") returns 12345678901234567890.12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("12345678901234567890.123").toFixed(2, Decimal.ROUND_DOWN);
      expect(s).assertEqual("12345678901234567890.12");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_6900
     * @tc.name decimalToFixedPart02Test069
     * @tc.desc Verify toFixed(6, Decimal.ROUND_DOWN) on new Decimal("1.23e-4") returns 0.000123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.23e-4").toFixed(6, Decimal.ROUND_DOWN);
      expect(s).assertEqual("0.000123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_7000
     * @tc.name decimalToFixedPart02Test070
     * @tc.desc Verify toFixed(1, Decimal.ROUND_DOWN) on new Decimal("0x10") returns 16.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("0x10").toFixed(1, Decimal.ROUND_DOWN);
      expect(s).assertEqual("16.0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART02_7100
     * @tc.name decimalToFixedPart02Test071
     * @tc.desc Verify toFixed(0, Decimal.ROUND_DOWN) on new Decimal(9007199254740991) returns 9007199254740991
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart02Test071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(9007199254740991).toFixed(0, Decimal.ROUND_DOWN);
      expect(s).assertEqual("9007199254740991");
    });
  });
}