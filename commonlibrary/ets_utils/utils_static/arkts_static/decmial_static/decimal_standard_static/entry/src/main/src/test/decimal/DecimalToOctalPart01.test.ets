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

export default function decimalToOctalPart01Test(): void {
  describe("DecimalToOctalPart01Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_0100
     * @tc.name decimalToOctalPart01Test001
     * @tc.desc Verify toOctal() on new Decimal(64) returns 0o100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(64);
      let s: string = d.toOctal();
      expect(s).assertEqual("0o100");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_0200
     * @tc.name decimalToOctalPart01Test002
     * @tc.desc Verify toOctal(10) on new Decimal(64) returns 0o1p+6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(64);
      let s: string = d.toOctal(10);
      expect(s).assertEqual("0o1p+6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_0300
     * @tc.name decimalToOctalPart01Test003
     * @tc.desc Verify toOctal(10) on new Decimal(64) returns 0o1p+6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(64);
      let s: string = d.toOctal(10);
      expect(s).assertEqual("0o1p+6");
      let actual: string = d.toString();
      let expected: string = "64";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_0400
     * @tc.name decimalToOctalPart01Test004
     * @tc.desc Verify toOctal(1) on new Decimal(65535) returns 0o1p+16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(65535);
      let s: string = d.toOctal(1);
      expect(s).assertEqual("0o1p+16");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_0500
     * @tc.name decimalToOctalPart01Test005
     * @tc.desc Verify toOctal(2) on new Decimal(65) returns 0o1p+6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(65);
      let s: string = d.toOctal(2);
      expect(s).assertEqual("0o1p+6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_0600
     * @tc.name decimalToOctalPart01Test006
     * @tc.desc Verify toOctal(3) on new Decimal(9) returns 0o1.1p+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(9);
      let s: string = d.toOctal(3);
      expect(s).assertEqual("0o1.1p+3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_0700
     * @tc.name decimalToOctalPart01Test007
     * @tc.desc Verify toOctal(20) on new Decimal(1000) returns 0o1.75p+9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(1000);
      let s: string = d.toOctal(20);
      expect(s).assertEqual("0o1.75p+9");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_0800
     * @tc.name decimalToOctalPart01Test008
     * @tc.desc Verify toOctal(11) on new Decimal(1000000000) returns 0o1.6715312p+29
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(1000000000);
      let s: string = d.toOctal(11);
      expect(s).assertEqual("0o1.6715312p+29");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_0900
     * @tc.name decimalToOctalPart01Test009
     * @tc.desc Verify toOctal(3) returns 0o1p+6 and toOctal(4) returns 0o1.002p+6 on new Decimal(64.3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(64.3);
      let s3: string = d.toOctal(3);
      let s4: string = d.toOctal(4);
      expect(s3).assertEqual("0o1p+6");
      expect(s4).assertEqual("0o1.002p+6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_1000
     * @tc.name decimalToOctalPart01Test010
     * @tc.desc Verify toOctal(4) returns 0o1.002p+6 and toOctal(5) returns 0o1.0023p+6 on new Decimal(64.3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(64.3);
      let s4: string = d.toOctal(4);
      let s5: string = d.toOctal(5);
      expect(s4).assertEqual("0o1.002p+6");
      expect(s5).assertEqual("0o1.0023p+6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_1100
     * @tc.name decimalToOctalPart01Test011
     * @tc.desc Verify toOctal(10) on new Decimal(64.3) returns 0o1.002314632p+6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(64.3);
      let s: string = d.toOctal(10);
      expect(s).assertEqual("0o1.002314632p+6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_1200
     * @tc.name decimalToOctalPart01Test012
     * @tc.desc Verify toOctal(3) returns 0o1p+6 and toOctal(4) returns 0o1.003p+6 on new Decimal(64.4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(64.4);
      let s3: string = d.toOctal(3);
      let s4: string = d.toOctal(4);
      expect(s3).assertEqual("0o1p+6");
      expect(s4).assertEqual("0o1.003p+6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_1300
     * @tc.name decimalToOctalPart01Test013
     * @tc.desc Verify toOctal(4) returns 0o1.003p+6 and toOctal(5) returns 0o1.0032p+6 on new Decimal(64.4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(64.4);
      let s4: string = d.toOctal(4);
      let s5: string = d.toOctal(5);
      expect(s4).assertEqual("0o1.003p+6");
      expect(s5).assertEqual("0o1.0032p+6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_1400
     * @tc.name decimalToOctalPart01Test014
     * @tc.desc Verify toOctal(4) on new Decimal(0.3) returns 0o1.146p-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0.3);
      let s: string = d.toOctal(4);
      expect(s).assertEqual("0o1.146p-2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_1500
     * @tc.name decimalToOctalPart01Test015
     * @tc.desc Verify toOctal(2) on new Decimal(0.4) returns 0o1.5p-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0.4);
      let s: string = d.toOctal(2);
      expect(s).assertEqual("0o1.5p-2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_1600
     * @tc.name decimalToOctalPart01Test016
     * @tc.desc Verify toOctal(3) on new Decimal(0.7) returns 0o1.32p-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0.7);
      let s: string = d.toOctal(3);
      expect(s).assertEqual("0o1.32p-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_1700
     * @tc.name decimalToOctalPart01Test017
     * @tc.desc Verify toOctal(3) on new Decimal(8.48) returns 0o1.04p+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(8.48);
      let s: string = d.toOctal(3);
      expect(s).assertEqual("0o1.04p+3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_1800
     * @tc.name decimalToOctalPart01Test018
     * @tc.desc Verify toOctal(3) on new Decimal(63.9) returns 0o1p+6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(63.9);
      let s: string = d.toOctal(3);
      expect(s).assertEqual("0o1p+6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_1900
     * @tc.name decimalToOctalPart01Test019
     * @tc.desc Verify toOctal(4) on new Decimal(0.15) returns 0o1.146p-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0.15);
      let s: string = d.toOctal(4);
      expect(s).assertEqual("0o1.146p-3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_2000
     * @tc.name decimalToOctalPart01Test020
     * @tc.desc Verify toOctal(3) on new Decimal(0.45) returns 0o1.63p-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0.45);
      let s: string = d.toOctal(3);
      expect(s).assertEqual("0o1.63p-2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_2100
     * @tc.name decimalToOctalPart01Test021
     * @tc.desc Verify toOctal(5) on new Decimal(0.99) returns 0o1.7656p-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0.99);
      let s: string = d.toOctal(5);
      expect(s).assertEqual("0o1.7656p-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_2200
     * @tc.name decimalToOctalPart01Test022
     * @tc.desc Verify toOctal(12) on new Decimal(123.456) returns 0o1.73351361524p+6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(123.456);
      let s: string = d.toOctal(12);
      expect(s).assertEqual("0o1.73351361524p+6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_2300
     * @tc.name decimalToOctalPart01Test023
     * @tc.desc Verify toOctal(12) on new Decimal(0.0001) returns 0o1.50667056544p-14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0.0001);
      let s: string = d.toOctal(12);
      expect(s).assertEqual("0o1.50667056544p-14");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_2400
     * @tc.name decimalToOctalPart01Test024
     * @tc.desc Verify toOctal(12) on new Decimal(0.001) returns 0o1.01422335136p-10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0.001);
      let s: string = d.toOctal(12);
      expect(s).assertEqual("0o1.01422335136p-10");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_2500
     * @tc.name decimalToOctalPart01Test025
     * @tc.desc Verify toOctal(0) throws BusinessError(10200001)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(64);
      try {
        d.toOctal(0);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_2600
     * @tc.name decimalToOctalPart01Test026
     * @tc.desc Verify toOctal(-1) throws BusinessError(10200001)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(64);
      try {
        d.toOctal(-1);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_2700
     * @tc.name decimalToOctalPart01Test027
     * @tc.desc Verify toOctal(2.5) throws BusinessError(10200001)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(64);
      try {
        d.toOctal(2.5);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_2800
     * @tc.name decimalToOctalPart01Test028
     * @tc.desc Verify toOctal(1000000001) throws BusinessError(10200001)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(64);
      try {
        d.toOctal(1000000001);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_2900
     * @tc.name decimalToOctalPart01Test029
     * @tc.desc Verify toOctal(Double.NaN) throws BusinessError(10200001)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(64);
      try {
        d.toOctal(Double.NaN);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_3000
     * @tc.name decimalToOctalPart01Test030
     * @tc.desc Verify toOctal(Number.POSITIVE_INFINITY) throws BusinessError(10200001)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(64);
      try {
        d.toOctal(Number.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_3100
     * @tc.name decimalToOctalPart01Test031
     * @tc.desc Verify toOctal(Number.NEGATIVE_INFINITY) throws BusinessError(10200001)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(64);
      try {
        d.toOctal(Number.NEGATIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_3200
     * @tc.name decimalToOctalPart01Test032
     * @tc.desc Verify toOctal(10) on new Decimal(1) returns 0o1p+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(1);
      let s: string = d.toOctal(10);
      expect(s).assertEqual("0o1p+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_3300
     * @tc.name decimalToOctalPart01Test033
     * @tc.desc Verify toOctal(5) on new Decimal(531) returns 0o1.023p+9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(531);
      let s: string = d.toOctal(5);
      expect(s).assertEqual("0o1.023p+9");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_3400
     * @tc.name decimalToOctalPart01Test034
     * @tc.desc Verify toOctal(10) on new Decimal(100000) returns 0o1.4152p+16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(100000);
      let s: string = d.toOctal(10);
      expect(s).assertEqual("0o1.4152p+16");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_3500
     * @tc.name decimalToOctalPart01Test035
     * @tc.desc Verify toOctal(10) on new Decimal(123456) returns 0o1.7044p+16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(123456);
      let s: string = d.toOctal(10);
      expect(s).assertEqual("0o1.7044p+16");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_3600
     * @tc.name decimalToOctalPart01Test036
     * @tc.desc Verify toOctal(30) on new Decimal(1234567890) returns 0o1.1145401322p+30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(1234567890);
      let s: string = d.toOctal(30);
      expect(s).assertEqual("0o1.1145401322p+30");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_3700
     * @tc.name decimalToOctalPart01Test037
     * @tc.desc Verify toOctal(10) on new Decimal(65535) returns 0o1.77777p+15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(65535);
      let s: string = d.toOctal(10);
      expect(s).assertEqual("0o1.77777p+15");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_3800
     * @tc.name decimalToOctalPart01Test038
     * @tc.desc Verify toOctal(10) on new Decimal(127) returns 0o1.77p+6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(127);
      let s: string = d.toOctal(10);
      expect(s).assertEqual("0o1.77p+6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_3900
     * @tc.name decimalToOctalPart01Test039
     * @tc.desc Verify toOctal(10) on new Decimal(511) returns 0o1.776p+8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(511);
      let s: string = d.toOctal(10);
      expect(s).assertEqual("0o1.776p+8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_4000
     * @tc.name decimalToOctalPart01Test040
     * @tc.desc Verify toOctal(5) on new Decimal(0) returns 0o0p+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0);
      let s: string = d.toOctal(5);
      expect(s).assertEqual("0o0p+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_4100
     * @tc.name decimalToOctalPart01Test041
     * @tc.desc Verify toOctal(5) on new Decimal(-0) returns -0o0p+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-0);
      let s: string = d.toOctal(5);
      expect(s).assertEqual("-0o0p+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_4200
     * @tc.name decimalToOctalPart01Test042
     * @tc.desc Verify toOctal(10) on new Decimal("0123") returns 0o1.73p+6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("0123");
      let s: string = d.toOctal(10);
      expect(s).assertEqual("0o1.73p+6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_4300
     * @tc.name decimalToOctalPart01Test043
     * @tc.desc Verify toOctal(10) on new Decimal("1e3") returns 0o1.75p+9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1e3");
      let s: string = d.toOctal(10);
      expect(s).assertEqual("0o1.75p+9");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_4400
     * @tc.name decimalToOctalPart01Test044
     * @tc.desc Verify toOctal(10) on new Decimal("1e5") returns 0o1.4152p+16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1e5");
      let s: string = d.toOctal(10);
      expect(s).assertEqual("0o1.4152p+16");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_4500
     * @tc.name decimalToOctalPart01Test045
     * @tc.desc Verify toOctal(10) on new Decimal(64) returns 0o1p+6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Decimal = new Decimal(64);
      let d: Decimal = new Decimal(base);
      let s: string = d.toOctal(10);
      expect(s).assertEqual("0o1p+6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_4600
     * @tc.name decimalToOctalPart01Test046
     * @tc.desc Verify toOctal(5) on new Decimal(64.375) returns 0o1.003p+6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(64.375);
      let s: string = d.toOctal(5);
      expect(s).assertEqual("0o1.003p+6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_4700
     * @tc.name decimalToOctalPart01Test047
     * @tc.desc Verify toOctal(10) on new Decimal(0.03125) returns 0o1p-5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0.03125);
      let s: string = d.toOctal(10);
      expect(s).assertEqual("0o1p-5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_4800
     * @tc.name decimalToOctalPart01Test048
     * @tc.desc Verify toOctal(12) on new Decimal(0.0078125) returns 0o1p-7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0.0078125);
      let s: string = d.toOctal(12);
      expect(s).assertEqual("0o1p-7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_4900
     * @tc.name decimalToOctalPart01Test049
     * @tc.desc Verify toOctal(10) on new Decimal(0.0625) returns 0o1p-4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0.0625);
      let s: string = d.toOctal(10);
      expect(s).assertEqual("0o1p-4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_5000
     * @tc.name decimalToOctalPart01Test050
     * @tc.desc Verify toOctal(10) on new Decimal(0.015625) returns 0o1p-6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0.015625);
      let s: string = d.toOctal(10);
      expect(s).assertEqual("0o1p-6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_5100
     * @tc.name decimalToOctalPart01Test051
     * @tc.desc Verify toOctal(5) on new Decimal(0.5) returns 0o1p-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0.5);
      let s: string = d.toOctal(5);
      expect(s).assertEqual("0o1p-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_5200
     * @tc.name decimalToOctalPart01Test052
     * @tc.desc Verify toOctal(5) on new Decimal(0.25) returns 0o1p-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0.25);
      let s: string = d.toOctal(5);
      expect(s).assertEqual("0o1p-2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_5300
     * @tc.name decimalToOctalPart01Test053
     * @tc.desc Verify toOctal(5) on new Decimal(0.125) returns 0o1p-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0.125);
      let s: string = d.toOctal(5);
      expect(s).assertEqual("0o1p-3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_5400
     * @tc.name decimalToOctalPart01Test054
     * @tc.desc Verify toOctal(10) on new Decimal(0.1) returns 0o1.463146315p-4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0.1);
      let s: string = d.toOctal(10);
      expect(s).assertEqual("0o1.463146315p-4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_5500
     * @tc.name decimalToOctalPart01Test055
     * @tc.desc Verify toOctal(20) on new Decimal(0.1) returns 0o1.4631463146314631463p-4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0.1);
      let s: string = d.toOctal(20);
      expect(s).assertEqual("0o1.4631463146314631463p-4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_5600
     * @tc.name decimalToOctalPart01Test056
     * @tc.desc Verify toOctal(10) on new Decimal(0.2) returns 0o1.463146315p-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0.2);
      let s: string = d.toOctal(10);
      expect(s).assertEqual("0o1.463146315p-3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_5700
     * @tc.name decimalToOctalPart01Test057
     * @tc.desc Verify toOctal(20) on new Decimal(0.3) returns 0o1.1463146314631463146p-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0.3);
      let s: string = d.toOctal(20);
      expect(s).assertEqual("0o1.1463146314631463146p-2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_5800
     * @tc.name decimalToOctalPart01Test058
     * @tc.desc Verify toOctal(10) on new Decimal(9.9) returns 0o1.171463146p+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(9.9);
      let s: string = d.toOctal(10);
      expect(s).assertEqual("0o1.171463146p+3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_5900
     * @tc.name decimalToOctalPart01Test059
     * @tc.desc Verify toOctal(8) on new Decimal(0.05) returns 0o1.4631463p-5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0.05);
      let s: string = d.toOctal(8);
      expect(s).assertEqual("0o1.4631463p-5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_6000
     * @tc.name decimalToOctalPart01Test060
     * @tc.desc Verify toOctal(10) on new Decimal("1.23e-4") returns 0o1.003714372p-13
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.23e-4");
      let s: string = d.toOctal(10);
      expect(s).assertEqual("0o1.003714372p-13");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_6100
     * @tc.name decimalToOctalPart01Test061
     * @tc.desc Verify toOctal(5) on new Decimal(7.5) returns 0o1.7p+2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(7.5);
      let s: string = d.toOctal(5);
      expect(s).assertEqual("0o1.7p+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_6200
     * @tc.name decimalToOctalPart01Test062
     * @tc.desc Verify toOctal(5) on new Decimal(10.5) returns 0o1.24p+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(10.5);
      let s: string = d.toOctal(5);
      expect(s).assertEqual("0o1.24p+3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_6300
     * @tc.name decimalToOctalPart01Test063
     * @tc.desc Verify toOctal(5) on new Decimal(16.5) returns 0o1.02p+4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(16.5);
      let s: string = d.toOctal(5);
      expect(s).assertEqual("0o1.02p+4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_6400
     * @tc.name decimalToOctalPart01Test064
     * @tc.desc Verify toOctal(5) on new Decimal(64.5) returns 0o1.004p+6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(64.5);
      let s: string = d.toOctal(5);
      expect(s).assertEqual("0o1.004p+6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_6500
     * @tc.name decimalToOctalPart01Test065
     * @tc.desc Verify toOctal(8) on new Decimal(64.25) returns 0o1.002p+6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(64.25);
      let s: string = d.toOctal(8);
      expect(s).assertEqual("0o1.002p+6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_6600
     * @tc.name decimalToOctalPart01Test066
     * @tc.desc Verify toOctal(8) on new Decimal(512.5) returns 0o1.0004p+9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(512.5);
      let s: string = d.toOctal(8);
      expect(s).assertEqual("0o1.0004p+9");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_6700
     * @tc.name decimalToOctalPart01Test067
     * @tc.desc Verify toOctal(4) on new Decimal(1.5) returns 0o1.4p+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(1.5);
      let s: string = d.toOctal(4);
      expect(s).assertEqual("0o1.4p+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_6800
     * @tc.name decimalToOctalPart01Test068
     * @tc.desc Verify toOctal(3) on new Decimal(3.5) returns 0o1.6p+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(3.5);
      let s: string = d.toOctal(3);
      expect(s).assertEqual("0o1.6p+1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_6900
     * @tc.name decimalToOctalPart01Test069
     * @tc.desc Verify toOctal(5) on new Decimal(0.75) returns 0o1.4p-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0.75);
      let s: string = d.toOctal(5);
      expect(s).assertEqual("0o1.4p-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_7000
     * @tc.name decimalToOctalPart01Test070
     * @tc.desc Verify toOctal(5) on new Decimal(0.875) returns 0o1.6p-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0.875);
      let s: string = d.toOctal(5);
      expect(s).assertEqual("0o1.6p-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_7100
     * @tc.name decimalToOctalPart01Test071
     * @tc.desc Verify toOctal(5) on new Decimal(0.375) returns 0o1.4p-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0.375);
      let s: string = d.toOctal(5);
      expect(s).assertEqual("0o1.4p-2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_7200
     * @tc.name decimalToOctalPart01Test072
     * @tc.desc Verify toOctal(5) on new Decimal(0.625) returns 0o1.2p-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0.625);
      let s: string = d.toOctal(5);
      expect(s).assertEqual("0o1.2p-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_7300
     * @tc.name decimalToOctalPart01Test073
     * @tc.desc Verify toOctal(8) on new Decimal(0.3125) returns 0o1.2p-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0.3125);
      let s: string = d.toOctal(8);
      expect(s).assertEqual("0o1.2p-2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_7400
     * @tc.name decimalToOctalPart01Test074
     * @tc.desc Verify toOctal(8) on new Decimal(0.09375) returns 0o1.4p-4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0.09375);
      let s: string = d.toOctal(8);
      expect(s).assertEqual("0o1.4p-4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_7500
     * @tc.name decimalToOctalPart01Test075
     * @tc.desc Verify toOctal(10) on new Decimal(-8) returns -0o1p+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-8);
      let s: string = d.toOctal(10);
      expect(s).assertEqual("-0o1p+3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_7600
     * @tc.name decimalToOctalPart01Test076
     * @tc.desc Verify toOctal(10) on new Decimal(-128) returns -0o1p+7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-128);
      let s: string = d.toOctal(10);
      expect(s).assertEqual("-0o1p+7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_7700
     * @tc.name decimalToOctalPart01Test077
     * @tc.desc Verify toOctal(5) on new Decimal(-0.5) returns -0o1p-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-0.5);
      let s: string = d.toOctal(5);
      expect(s).assertEqual("-0o1p-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_7800
     * @tc.name decimalToOctalPart01Test078
     * @tc.desc Verify toOctal(10) on new Decimal(-64.5) returns -0o1.004p+6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-64.5);
      let s: string = d.toOctal(10);
      expect(s).assertEqual("-0o1.004p+6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_7900
     * @tc.name decimalToOctalPart01Test079
     * @tc.desc Verify toOctal(5) on new Decimal(-0.75) returns -0o1.4p-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-0.75);
      let s: string = d.toOctal(5);
      expect(s).assertEqual("-0o1.4p-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_8000
     * @tc.name decimalToOctalPart01Test080
     * @tc.desc Verify toOctal(4) on new Decimal(-1.5) returns -0o1.4p+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-1.5);
      let s: string = d.toOctal(4);
      expect(s).assertEqual("-0o1.4p+0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_OCTAL_PART01_8100
     * @tc.name decimalToOctalPart01Test081
     * @tc.desc Verify toOctal(5) on new Decimal(-8.5) returns -0o1.04p+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToOctalPart01Test081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-8.5);
      let s: string = d.toOctal(5);
      expect(s).assertEqual("-0o1.04p+3");
    });
  });
}
