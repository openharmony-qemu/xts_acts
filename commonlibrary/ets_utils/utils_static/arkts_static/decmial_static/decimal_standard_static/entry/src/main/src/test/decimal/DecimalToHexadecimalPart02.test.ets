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

export default function decimalToHexadecimalPart02Test(): void {
  describe("DecimalToHexadecimalPart02Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_0100
     * @tc.name decimalToHexadecimalPart02Test001
     * @tc.desc Verify toHexadecimal(20, 4) on new Decimal(255) returns "0x1.fep+7"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(255).toHexadecimal(20, 4);
      expect(s).assertEqual("0x1.fep+7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_0200
     * @tc.name decimalToHexadecimalPart02Test002
     * @tc.desc Verify toHexadecimal(1, Decimal.ROUND_HALF_UP) on new Decimal(1) returns 0x1p+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1).toHexadecimal(1, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0x1p+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_0300
     * @tc.name decimalToHexadecimalPart02Test003
     * @tc.desc Verify toHexadecimal(1, Decimal.ROUND_DOWN) on new Decimal(255) returns 0x1p+7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(255).toHexadecimal(1, Decimal.ROUND_DOWN);
      expect(s).assertEqual("0x1p+7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_0400
     * @tc.name decimalToHexadecimalPart02Test004
     * @tc.desc Verify toHexadecimal(1, Decimal.ROUND_UP) on new Decimal(255) returns 0x1p+8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(255).toHexadecimal(1, Decimal.ROUND_UP);
      expect(s).assertEqual("0x1p+8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_0500
     * @tc.name decimalToHexadecimalPart02Test005
     * @tc.desc Verify toHexadecimal(3, Decimal.ROUND_DOWN) on new Decimal(4095) returns 0x1.ffp+11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(4095).toHexadecimal(3, Decimal.ROUND_DOWN);
      expect(s).assertEqual("0x1.ffp+11");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_0600
     * @tc.name decimalToHexadecimalPart02Test006
     * @tc.desc Verify toHexadecimal(20) output longer than toHexadecimal(10) for 1/3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = new Decimal(1).div(3).toHexadecimal(20, Decimal.ROUND_HALF_UP);
      expect(a).assertEqual("0x1.5555555555555555166p-2");
      let b: string = new Decimal(1).div(3).toHexadecimal(10, Decimal.ROUND_HALF_UP);
      expect(b).assertEqual("0x1.555555555p-2");
      let actual: boolean = a.length > b.length;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_0700
     * @tc.name decimalToHexadecimalPart02Test007
     * @tc.desc Verify toHexadecimal(30) output longer than toHexadecimal(10) for 0.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = new Decimal("0.1").toHexadecimal(30, Decimal.ROUND_DOWN);
      expect(a).assertEqual("0x1.99999999999999999999999999999p-4");
      let b: string = new Decimal("0.1").toHexadecimal(10, Decimal.ROUND_DOWN);
      expect(b).assertEqual("0x1.999999999p-4");
      let actual: boolean = a.length > b.length;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_0800
     * @tc.name decimalToHexadecimalPart02Test008
     * @tc.desc Verify toHexadecimal(0, 4) on new Decimal(255) throws BusinessError with code 10200001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(255).toHexadecimal(0, 4);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_0900
     * @tc.name decimalToHexadecimalPart02Test009
     * @tc.desc Verify toHexadecimal(-1, 4) on new Decimal(255) throws BusinessError with code 10200001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(255).toHexadecimal(-1, 4);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_1000
     * @tc.name decimalToHexadecimalPart02Test010
     * @tc.desc Verify toHexadecimal(5.5, 4) on new Decimal(255) throws BusinessError with code 10200001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(255).toHexadecimal(5.5, 4);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_1100
     * @tc.name decimalToHexadecimalPart02Test011
     * @tc.desc Verify toHexadecimal(2e9, 4) on new Decimal(255) throws BusinessError with code 10200001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(255).toHexadecimal(2e9, 4);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_1200
     * @tc.name decimalToHexadecimalPart02Test012
     * @tc.desc Verify toHexadecimal(NaN, 4) on new Decimal(255) throws BusinessError with code 10200001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(255).toHexadecimal(Double.NaN, 4);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_1300
     * @tc.name decimalToHexadecimalPart02Test013
     * @tc.desc Verify toHexadecimal(POSITIVE_INFINITY, 4) on new Decimal(255) throws BusinessError with code 10200001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(255).toHexadecimal(Number.POSITIVE_INFINITY, 4);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_1400
     * @tc.name decimalToHexadecimalPart02Test014
     * @tc.desc Verify toHexadecimal(-POSITIVE_INFINITY, 4) on new Decimal(255) throws BusinessError with code 10200001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(255).toHexadecimal(-Number.POSITIVE_INFINITY, 4);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_1500
     * @tc.name decimalToHexadecimalPart02Test015
     * @tc.desc Verify toHexadecimal(1, Decimal.ROUND_UP) on new Decimal(1.5) returns 0x1p+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.5).toHexadecimal(1, Decimal.ROUND_UP);
      expect(s).assertEqual("0x1p+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_1600
     * @tc.name decimalToHexadecimalPart02Test016
     * @tc.desc Verify toHexadecimal(1, Decimal.ROUND_HALF_UP) on new Decimal(1.5) returns 0x1p+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.5).toHexadecimal(1, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0x1p+1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_1700
     * @tc.name decimalToHexadecimalPart02Test017
     * @tc.desc Verify toHexadecimal(1, Decimal.ROUND_HALF_EVEN) on new Decimal(1.5) returns 0x1p+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.5).toHexadecimal(1, Decimal.ROUND_HALF_EVEN);
      expect(s).assertEqual("0x1p+1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_1800
     * @tc.name decimalToHexadecimalPart02Test018
     * @tc.desc Verify toHexadecimal(1, Decimal.ROUND_HALF_CEILING) on new Decimal(1.5) returns 0x1p+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.5).toHexadecimal(1, Decimal.ROUND_HALF_CEILING);
      expect(s).assertEqual("0x1p+1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_1900
     * @tc.name decimalToHexadecimalPart02Test019
     * @tc.desc Verify toHexadecimal(1, Decimal.ROUND_UP) on new Decimal(-1.5) returns -0x1p+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-1.5).toHexadecimal(1, Decimal.ROUND_UP);
      expect(s).assertEqual("-0x1p+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_2000
     * @tc.name decimalToHexadecimalPart02Test020
     * @tc.desc Verify toHexadecimal(1, Decimal.ROUND_DOWN) on new Decimal(-1.5) returns -0x1p+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-1.5).toHexadecimal(1, Decimal.ROUND_DOWN);
      expect(s).assertEqual("-0x1p+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_2100
     * @tc.name decimalToHexadecimalPart02Test021
     * @tc.desc Verify toHexadecimal(1, Decimal.ROUND_CEILING) on new Decimal(-1.5) returns -0x1p+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-1.5).toHexadecimal(1, Decimal.ROUND_CEILING);
      expect(s).assertEqual("-0x1p+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_2200
     * @tc.name decimalToHexadecimalPart02Test022
     * @tc.desc Verify toHexadecimal(1, Decimal.ROUND_FLOOR) on new Decimal(-1.5) returns -0x1p+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-1.5).toHexadecimal(1, Decimal.ROUND_FLOOR);
      expect(s).assertEqual("-0x1p+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_2300
     * @tc.name decimalToHexadecimalPart02Test023
     * @tc.desc Verify toHexadecimal(1, Decimal.ROUND_HALF_UP) on new Decimal(-1.5) returns -0x1p+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-1.5).toHexadecimal(1, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("-0x1p+1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_2400
     * @tc.name decimalToHexadecimalPart02Test024
     * @tc.desc Verify toHexadecimal(1, Decimal.ROUND_HALF_DOWN) on new Decimal(-1.5) returns -0x1p+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-1.5).toHexadecimal(1, Decimal.ROUND_HALF_DOWN);
      expect(s).assertEqual("-0x1p+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_2500
     * @tc.name decimalToHexadecimalPart02Test025
     * @tc.desc Verify toHexadecimal(1, Decimal.ROUND_HALF_EVEN) on new Decimal(-1.5) returns -0x1p+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-1.5).toHexadecimal(1, Decimal.ROUND_HALF_EVEN);
      expect(s).assertEqual("-0x1p+1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_2600
     * @tc.name decimalToHexadecimalPart02Test026
     * @tc.desc Verify toHexadecimal(1, Decimal.ROUND_HALF_CEILING) on new Decimal(-1.5) returns -0x1p+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-1.5).toHexadecimal(1, Decimal.ROUND_HALF_CEILING);
      expect(s).assertEqual("-0x1p+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_2700
     * @tc.name decimalToHexadecimalPart02Test027
     * @tc.desc Verify toHexadecimal(1, Decimal.ROUND_HALF_FLOOR) on new Decimal(-1.5) returns -0x1p+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-1.5).toHexadecimal(1, Decimal.ROUND_HALF_FLOOR);
      expect(s).assertEqual("-0x1p+1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_2800
     * @tc.name decimalToHexadecimalPart02Test028
     * @tc.desc Verify toHexadecimal(1, Decimal.ROUND_UP) on new Decimal(255.5) returns 0x1p+8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(255.5).toHexadecimal(1, Decimal.ROUND_UP);
      expect(s).assertEqual("0x1p+8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_2900
     * @tc.name decimalToHexadecimalPart02Test029
     * @tc.desc Verify toHexadecimal(1, Decimal.ROUND_DOWN) on new Decimal(255.5) returns 0x1p+7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(255.5).toHexadecimal(1, Decimal.ROUND_DOWN);
      expect(s).assertEqual("0x1p+7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_3000
     * @tc.name decimalToHexadecimalPart02Test030
     * @tc.desc Verify toHexadecimal(1, Decimal.ROUND_CEILING) on new Decimal(255.5) returns 0x1p+8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(255.5).toHexadecimal(1, Decimal.ROUND_CEILING);
      expect(s).assertEqual("0x1p+8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_3100
     * @tc.name decimalToHexadecimalPart02Test031
     * @tc.desc Verify toHexadecimal(1, Decimal.ROUND_FLOOR) on new Decimal(255.5) returns 0x1p+7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(255.5).toHexadecimal(1, Decimal.ROUND_FLOOR);
      expect(s).assertEqual("0x1p+7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_3200
     * @tc.name decimalToHexadecimalPart02Test032
     * @tc.desc Verify toHexadecimal(1, Decimal.ROUND_HALF_UP) on new Decimal(255.5) returns 0x1p+8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(255.5).toHexadecimal(1, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0x1p+8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_3300
     * @tc.name decimalToHexadecimalPart02Test033
     * @tc.desc Verify toHexadecimal(1, Decimal.ROUND_UP) on new Decimal(-255.5) returns -0x1p+8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-255.5).toHexadecimal(1, Decimal.ROUND_UP);
      expect(s).assertEqual("-0x1p+8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_3400
     * @tc.name decimalToHexadecimalPart02Test034
     * @tc.desc Verify toHexadecimal(1, Decimal.ROUND_DOWN) on new Decimal(-255.5) returns -0x1p+7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-255.5).toHexadecimal(1, Decimal.ROUND_DOWN);
      expect(s).assertEqual("-0x1p+7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_3500
     * @tc.name decimalToHexadecimalPart02Test035
     * @tc.desc Verify toHexadecimal(1, Decimal.ROUND_CEILING) on new Decimal(-255.5) returns -0x1p+7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-255.5).toHexadecimal(1, Decimal.ROUND_CEILING);
      expect(s).assertEqual("-0x1p+7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_3600
     * @tc.name decimalToHexadecimalPart02Test036
     * @tc.desc Verify toHexadecimal(1, Decimal.ROUND_FLOOR) on new Decimal(-255.5) returns -0x1p+8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-255.5).toHexadecimal(1, Decimal.ROUND_FLOOR);
      expect(s).assertEqual("-0x1p+8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_3700
     * @tc.name decimalToHexadecimalPart02Test037
     * @tc.desc Verify toHexadecimal(1, Decimal.ROUND_HALF_UP) on new Decimal(-255.5) returns -0x1p+8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-255.5).toHexadecimal(1, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("-0x1p+8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_3800
     * @tc.name decimalToHexadecimalPart02Test038
     * @tc.desc Verify toHexadecimal(1, Decimal.ROUND_UP) on new Decimal(-65535) returns -0x1p+16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-65535).toHexadecimal(1, Decimal.ROUND_UP);
      expect(s).assertEqual("-0x1p+16");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_3900
     * @tc.name decimalToHexadecimalPart02Test039
     * @tc.desc Verify toHexadecimal(1, Decimal.ROUND_DOWN) on new Decimal(65535) returns 0x1p+15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(65535).toHexadecimal(1, Decimal.ROUND_DOWN);
      expect(s).assertEqual("0x1p+15");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_4000
     * @tc.name decimalToHexadecimalPart02Test040
     * @tc.desc Verify toHexadecimal(1, Decimal.ROUND_CEILING) on new Decimal(15) returns 0x1p+4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(15).toHexadecimal(1, Decimal.ROUND_CEILING);
      expect(s).assertEqual("0x1p+4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_4100
     * @tc.name decimalToHexadecimalPart02Test041
     * @tc.desc Verify toHexadecimal(1, Decimal.ROUND_FLOOR) on new Decimal(-15) returns -0x1p+4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-15).toHexadecimal(1, Decimal.ROUND_FLOOR);
      expect(s).assertEqual("-0x1p+4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_4200
     * @tc.name decimalToHexadecimalPart02Test042
     * @tc.desc Verify toHexadecimal(1, Decimal.ROUND_DOWN) on new Decimal(16) returns 0x1p+4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(16).toHexadecimal(1, Decimal.ROUND_DOWN);
      expect(s).assertEqual("0x1p+4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_4300
     * @tc.name decimalToHexadecimalPart02Test043
     * @tc.desc Verify toHexadecimal(20, -1) on new Decimal(255) throws BusinessError with code 10200001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(255).toHexadecimal(20, -1);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_4400
     * @tc.name decimalToHexadecimalPart02Test044
     * @tc.desc Verify toHexadecimal(20, 9) on new Decimal(255) throws BusinessError with code 10200001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(255).toHexadecimal(20, 9);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_4500
     * @tc.name decimalToHexadecimalPart02Test045
     * @tc.desc Verify toHexadecimal(20, Decimal.ROUND_HALF_UP) on new Decimal(255) returns 0x1.fep+7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(255).toHexadecimal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0x1.fep+7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_4600
     * @tc.name decimalToHexadecimalPart02Test046
     * @tc.desc Verify toHexadecimal(20, Decimal.ROUND_HALF_UP) on new Decimal(4096) returns 0x1p+12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(4096).toHexadecimal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0x1p+12");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_4700
     * @tc.name decimalToHexadecimalPart02Test047
     * @tc.desc Verify toHexadecimal(20, Decimal.ROUND_HALF_UP) on new Decimal(11259375) returns 0x1.579bdep+23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(11259375).toHexadecimal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0x1.579bdep+23");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_4800
     * @tc.name decimalToHexadecimalPart02Test048
     * @tc.desc Verify toHexadecimal(20, Decimal.ROUND_HALF_UP) on new Decimal(2147483647) returns 0x1.fffffffcp+30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(2147483647).toHexadecimal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0x1.fffffffcp+30");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_4900
     * @tc.name decimalToHexadecimalPart02Test049
     * @tc.desc Verify toHexadecimal(20, Decimal.ROUND_HALF_UP) on new Decimal(-255) returns -0x1.fep+7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-255).toHexadecimal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("-0x1.fep+7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_5000
     * @tc.name decimalToHexadecimalPart02Test050
     * @tc.desc Verify toHexadecimal(40, Decimal.ROUND_HALF_UP) on new Decimal(-2147483648) returns -0x1p+31
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-2147483648);
      let s: string = d.toHexadecimal(40, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("-0x1p+31");
      let actual: boolean = s.startsWith("-0x");
      expect(actual).assertTrue();
      let actual2: boolean = new Decimal(s.slice(1)).equals(d.abs());
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_5100
     * @tc.name decimalToHexadecimalPart02Test051
     * @tc.desc Verify toHexadecimal(20, Decimal.ROUND_HALF_UP) on new Decimal(0) returns 0x0p+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0).toHexadecimal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0x0p+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_5200
     * @tc.name decimalToHexadecimalPart02Test052
     * @tc.desc Verify toHexadecimal(20, Decimal.ROUND_HALF_UP) on new Decimal(-0) returns -0x0p+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-0).toHexadecimal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("-0x0p+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_5300
     * @tc.name decimalToHexadecimalPart02Test053
     * @tc.desc Verify toHexadecimal(20, Decimal.ROUND_HALF_UP) on new Decimal('0') returns 0x0p+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal('0').toHexadecimal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0x0p+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_5400
     * @tc.name decimalToHexadecimalPart02Test054
     * @tc.desc Verify toHexadecimal(20, Decimal.ROUND_HALF_UP) on new Decimal(0.5) returns 0x1p-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToHexadecimalPart02Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0.5).toHexadecimal(20, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("0x1p-1");
    });
  });
}
