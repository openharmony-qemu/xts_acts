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

export default function decimalToPrecisionPart01Test(): void {
  describe("DecimalToPrecisionPart01Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_0100
     * @tc.name decimalToPrecisionPart01Test001
     * @tc.desc Verify toPrecision(2) on new Decimal("6.66") returns 6.7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("6.66").toPrecision(2);
      expect(s).assertEqual("6.7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_0200
     * @tc.name decimalToPrecisionPart01Test002
     * @tc.desc Verify toPrecision(1) on new Decimal("123.45") returns 1e+2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("123.45").toPrecision(1);
      expect(s).assertEqual("1e+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_0300
     * @tc.name decimalToPrecisionPart01Test003
     * @tc.desc Verify toPrecision(1) on new Decimal("0.00099") returns 0.001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("0.00099").toPrecision(1);
      expect(s).assertEqual("0.001");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_0400
     * @tc.name decimalToPrecisionPart01Test004
     * @tc.desc Verify toPrecision(2) on new Decimal("1.2345") returns 1.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.2345").toPrecision(2);
      expect(s).assertEqual("1.2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_0500
     * @tc.name decimalToPrecisionPart01Test005
     * @tc.desc Verify toPrecision(2) on new Decimal("9.95") returns 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("9.95").toPrecision(2);
      expect(s).assertEqual("10");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_0600
     * @tc.name decimalToPrecisionPart01Test006
     * @tc.desc Verify toPrecision(3) on new Decimal("1.2345") returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.2345").toPrecision(3);
      expect(s).assertEqual("1.23");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_0700
     * @tc.name decimalToPrecisionPart01Test007
     * @tc.desc Verify toPrecision(4) on new Decimal("1.2345") returns 1.235
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.2345").toPrecision(4);
      expect(s).assertEqual("1.235");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_0800
     * @tc.name decimalToPrecisionPart01Test008
     * @tc.desc Verify toPrecision(5) on new Decimal("1.2345") returns 1.2345
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.2345").toPrecision(5);
      expect(s).assertEqual("1.2345");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_0900
     * @tc.name decimalToPrecisionPart01Test009
     * @tc.desc Verify toPrecision(6) on new Decimal("1.2345") returns 1.23450
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.2345").toPrecision(6);
      expect(s).assertEqual("1.23450");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_1000
     * @tc.name decimalToPrecisionPart01Test010
     * @tc.desc Verify toPrecision(10) on new Decimal("1.2345") returns 1.234500000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.2345").toPrecision(10);
      expect(s).assertEqual("1.234500000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_1100
     * @tc.name decimalToPrecisionPart01Test011
     * @tc.desc Verify toPrecision(20) on new Decimal("1.2345") returns 1.2345000000000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.2345").toPrecision(20);
      expect(s).assertEqual("1.2345000000000000000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_1200
     * @tc.name decimalToPrecisionPart01Test012
     * @tc.desc Verify toPrecision(100) on new Decimal("123.456") returns 123.456 followed by 94 zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("123.456").toPrecision(100);
      let expected: string = "123.456" + '0'.repeat(94);
      expect(s).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_1300
     * @tc.name decimalToPrecisionPart01Test013
     * @tc.desc Verify toPrecision(1000) on new Decimal("1e-999999999") returns 1. followed by 999 zeros then e-999999999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1e-999999999").toPrecision(1000);
      let expected: string = "1." + '0'.repeat(999) + "e-999999999";
      expect(s).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_1400
     * @tc.name decimalToPrecisionPart01Test014
     * @tc.desc Verify toPrecision(0) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("88.88");
      try {
        d.toPrecision(0);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_1500
     * @tc.name decimalToPrecisionPart01Test015
     * @tc.desc Verify toPrecision(-1) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("88.88");
      try {
        d.toPrecision(-1);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_1600
     * @tc.name decimalToPrecisionPart01Test016
     * @tc.desc Verify toPrecision(2.5) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("88.88");
      try {
        d.toPrecision(2.5);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_1700
     * @tc.name decimalToPrecisionPart01Test017
     * @tc.desc Verify toPrecision(1e9 + 1) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("88.88");
      try {
        d.toPrecision(1e9 + 1);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_1800
     * @tc.name decimalToPrecisionPart01Test018
     * @tc.desc Verify toPrecision(Number.POSITIVE_INFINITY) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("88.88");
      try {
        d.toPrecision(Number.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_1900
     * @tc.name decimalToPrecisionPart01Test019
     * @tc.desc Verify toPrecision(Number.NEGATIVE_INFINITY) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("88.88");
      try {
        d.toPrecision(Number.NEGATIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_2000
     * @tc.name decimalToPrecisionPart01Test020
     * @tc.desc Verify toPrecision(Double.NaN) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("88.88");
      try {
        d.toPrecision(Double.NaN);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_2100
     * @tc.name decimalToPrecisionPart01Test021
     * @tc.desc Verify toPrecision(3) on new Decimal("1e5") returns 1.00e+5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1e5").toPrecision(3);
      expect(s).assertEqual("1.00e+5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_2200
     * @tc.name decimalToPrecisionPart01Test022
     * @tc.desc Verify toPrecision(3) on new Decimal("1.23e-4") returns 0.000123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.23e-4").toPrecision(3);
      expect(s).assertEqual("0.000123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_2300
     * @tc.name decimalToPrecisionPart01Test023
     * @tc.desc Verify toPrecision(3) on new Decimal("9.999e-7") returns 0.00000100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("9.999e-7").toPrecision(3);
      expect(s).assertEqual("0.00000100");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_2400
     * @tc.name decimalToPrecisionPart01Test024
     * @tc.desc Verify toPrecision(3) on new Decimal("1e9000000000000000") returns 1e+9000000000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1e9000000000000000").toPrecision(3);
      expect(s).assertEqual("1.00e+9000000000000000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_2500
     * @tc.name decimalToPrecisionPart01Test025
     * @tc.desc Verify toPrecision(3) on new Decimal("1e-9000000000000000") returns 1e-9000000000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1e-9000000000000000").toPrecision(3);
      expect(s).assertEqual("1.00e-9000000000000000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_2600
     * @tc.name decimalToPrecisionPart01Test026
     * @tc.desc Verify toPrecision(4) on new Decimal("-123.456") returns -123.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("-123.456").toPrecision(4);
      expect(s).assertEqual("-123.5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_2700
     * @tc.name decimalToPrecisionPart01Test027
     * @tc.desc Verify toPrecision(2) on new Decimal("-9.95") returns -10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("-9.95").toPrecision(2);
      expect(s).assertEqual("-10");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_2800
     * @tc.name decimalToPrecisionPart01Test028
     * @tc.desc Verify toPrecision(3) on new Decimal(long) returns 1.23e+9999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longVal: string = "1234567890".repeat(1000);
      let s: string = new Decimal(longVal).toPrecision(3);
      expect(s).assertEqual("1.23e+9999");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_2900
     * @tc.name decimalToPrecisionPart01Test029
     * @tc.desc Verify toPrecision(3) on new Decimal(0) returns 0.00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0).toPrecision(3);
      expect(s).assertEqual("0.00");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_3000
     * @tc.name decimalToPrecisionPart01Test030
     * @tc.desc Verify toPrecision(3) on new Decimal(-0) returns 0.00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-0).toPrecision(3);
      expect(s).assertEqual("0.00");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_3100
     * @tc.name decimalToPrecisionPart01Test031
     * @tc.desc Verify toPrecision(3) on new Decimal(1) returns 1.00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1).toPrecision(3);
      expect(s).assertEqual("1.00");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_3200
     * @tc.name decimalToPrecisionPart01Test032
     * @tc.desc Verify toPrecision(3) on new Decimal(-1) returns -1.00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-1).toPrecision(3);
      expect(s).assertEqual("-1.00");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_3300
     * @tc.name decimalToPrecisionPart01Test033
     * @tc.desc Verify toPrecision(3) on new Decimal(Double.NaN) returns Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(Double.NaN).toPrecision(3);
      expect(s).assertEqual("NaN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_3400
     * @tc.name decimalToPrecisionPart01Test034
     * @tc.desc Verify toPrecision(3) on new Decimal(Number.POSITIVE_INFINITY) returns Number.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(Number.POSITIVE_INFINITY).toPrecision(3);
      expect(s).assertEqual("Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_3500
     * @tc.name decimalToPrecisionPart01Test035
     * @tc.desc Verify toPrecision(3) on new Decimal(Number.NEGATIVE_INFINITY) returns -Number.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(Number.NEGATIVE_INFINITY).toPrecision(3);
      expect(s).assertEqual("-Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_3600
     * @tc.name decimalToPrecisionPart01Test036
     * @tc.desc Verify toPrecision(1) on new Decimal(1.7976931348623157e+308) returns 2e+308
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.7976931348623157e308).toPrecision(1);
      expect(s).assertEqual("2e+308");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_3700
     * @tc.name decimalToPrecisionPart01Test037
     * @tc.desc Verify toPrecision(1) on new Decimal(5e-324) returns 5e-324
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(5e-324).toPrecision(1);
      expect(s).assertEqual("5e-324");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_3800
     * @tc.name decimalToPrecisionPart01Test038
     * @tc.desc Verify toPrecision(3) on new Decimal(0.1 + 0.2) returns 0.300
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0.1 + 0.2);
      let s: string = d.toPrecision(3);
      expect(s).assertEqual("0.300");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_3900
     * @tc.name decimalToPrecisionPart01Test039
     * @tc.desc Verify toPrecision(2) on new Decimal("1.25") returns 1.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.25").toPrecision(2);
      expect(s).assertEqual("1.3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_4000
     * @tc.name decimalToPrecisionPart01Test040
     * @tc.desc Verify toPrecision(3) on new Decimal("123456789") returns 1.23e+8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("123456789").toPrecision(3);
      expect(s).assertEqual("1.23e+8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_4100
     * @tc.name decimalToPrecisionPart01Test041
     * @tc.desc Verify toPrecision(3) on new Decimal("999999999") returns 1.00e+9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("999999999").toPrecision(3);
      expect(s).assertEqual("1.00e+9");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_4200
     * @tc.name decimalToPrecisionPart01Test042
     * @tc.desc Verify toPrecision(2) on new Decimal("999.99") returns 1.0e+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("999.99").toPrecision(2);
      expect(s).assertEqual("1.0e+3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_4300
     * @tc.name decimalToPrecisionPart01Test043
     * @tc.desc Verify toPrecision(3) on new Decimal("1e22") returns 1.00e+22
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1e22").toPrecision(3);
      expect(s).assertEqual("1.00e+22");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_4400
     * @tc.name decimalToPrecisionPart01Test044
     * @tc.desc Verify toPrecision(3) on new Decimal("0.0000001") returns 1.00e-7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("0.0000001").toPrecision(3);
      expect(s).assertEqual("1.00e-7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_4500
     * @tc.name decimalToPrecisionPart01Test045
     * @tc.desc Verify toPrecision(4) on new Decimal("1.2300") returns 1.230
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.2300").toPrecision(4);
      expect(s).assertEqual("1.230");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_4600
     * @tc.name decimalToPrecisionPart01Test046
     * @tc.desc Verify toPrecision(3) on new Decimal("150.00") returns 150
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("150.00").toPrecision(3);
      expect(s).assertEqual("150");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_4700
     * @tc.name decimalToPrecisionPart01Test047
     * @tc.desc Verify toPrecision(5) on new Decimal("150") returns 150.00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("150").toPrecision(5);
      expect(s).assertEqual("150.00");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_4800
     * @tc.name decimalToPrecisionPart01Test048
     * @tc.desc Verify toPrecision(2) on new Decimal("0.9999") returns 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("0.9999").toPrecision(2);
      expect(s).assertEqual("1.0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_4900
     * @tc.name decimalToPrecisionPart01Test049
     * @tc.desc Verify toPrecision(3) on new Decimal("0.0000123456") returns 0.0000123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("0.0000123456").toPrecision(3);
      expect(s).assertEqual("0.0000123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_5000
     * @tc.name decimalToPrecisionPart01Test050
     * @tc.desc Verify toPrecision(5) on new Decimal("123456789012345678901234567890") returns 1.2346e+29
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("123456789012345678901234567890").toPrecision(5);
      expect(s).assertEqual("1.2346e+29");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_5100
     * @tc.name decimalToPrecisionPart01Test051
     * @tc.desc Verify toPrecision(16) on new Decimal("1.9999999999999999") returns 2.000000000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.9999999999999999").toPrecision(16);
      expect(s).assertEqual("2.000000000000000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_5200
     * @tc.name decimalToPrecisionPart01Test052
     * @tc.desc Verify toPrecision(3) on new Decimal("10000") returns 1.00e+4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("10000").toPrecision(3);
      expect(s).assertEqual("1.00e+4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_5300
     * @tc.name decimalToPrecisionPart01Test053
     * @tc.desc Verify toPrecision(3) on new Decimal("10000.5") returns 1.00e+4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("10000.5").toPrecision(3);
      expect(s).assertEqual("1.00e+4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_5400
     * @tc.name decimalToPrecisionPart01Test054
     * @tc.desc Verify toPrecision(20) on new Decimal("12345678901234567890") returns 12345678901234567890
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("12345678901234567890").toPrecision(20);
      expect(s).assertEqual("12345678901234567890");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_5500
     * @tc.name decimalToPrecisionPart01Test055
     * @tc.desc Verify toPrecision(19) on new Decimal("12345678901234567890") returns 1.234567890123456789e+19
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("12345678901234567890").toPrecision(19);
      expect(s).assertEqual("1.234567890123456789e+19");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_5600
     * @tc.name decimalToPrecisionPart01Test056
     * @tc.desc Verify toPrecision(5) on new Decimal("0.000123456789") returns 0.00012346
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("0.000123456789").toPrecision(5);
      expect(s).assertEqual("0.00012346");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_5700
     * @tc.name decimalToPrecisionPart01Test057
     * @tc.desc Verify toPrecision(20) on new Decimal("1.000000000000000000001") returns 1.00000000000000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.000000000000000000001").toPrecision(20);
      expect(s).assertEqual("1.0000000000000000000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_5800
     * @tc.name decimalToPrecisionPart01Test058
     * @tc.desc Verify toPrecision(3) on new Decimal("1.23499999") returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.23499999").toPrecision(3);
      expect(s).assertEqual("1.23");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_5900
     * @tc.name decimalToPrecisionPart01Test059
     * @tc.desc Verify toPrecision(2) on new Decimal("9.9999e-9") returns 1.0e-8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("9.9999e-9").toPrecision(2);
      expect(s).assertEqual("1.0e-8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_6000
     * @tc.name decimalToPrecisionPart01Test060
     * @tc.desc Verify toPrecision(3) on new Decimal("9.9999e5") returns 1.00e+6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("9.9999e5").toPrecision(3);
      expect(s).assertEqual("1.00e+6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_6100
     * @tc.name decimalToPrecisionPart01Test061
     * @tc.desc Verify toPrecision(6) on new Decimal("1.23450") returns 1.2345
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.23450");
      let s: string = d.toPrecision(6);
      let actual: string = new Decimal(s).toString();
      let expected: string = "1.2345";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_6200
     * @tc.name decimalToPrecisionPart01Test062
     * @tc.desc Verify toPrecision(1) on new Decimal("0.5000001") returns 0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("0.5000001").toPrecision(1);
      expect(s).assertEqual("0.5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_6300
     * @tc.name decimalToPrecisionPart01Test063
     * @tc.desc Verify toPrecision(2) on new Decimal('7') returns 7.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal('7').toPrecision(2);
      expect(s).assertEqual("7.0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_6400
     * @tc.name decimalToPrecisionPart01Test064
     * @tc.desc Verify toPrecision(3) on new Decimal("-9.999e-9") returns -1.00e-8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("-9.999e-9").toPrecision(3);
      expect(s).assertEqual("-1.00e-8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_6500
     * @tc.name decimalToPrecisionPart01Test065
     * @tc.desc Verify toPrecision(2) on new Decimal("1.26") returns 1.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.set({ rounding: Decimal.ROUND_DOWN });
        let s: string = new Decimal("1.26").toPrecision(2);
        expect(s).assertEqual("1.2");
      } finally {
        Decimal.set({ defaults: true });
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_6600
     * @tc.name decimalToPrecisionPart01Test066
     * @tc.desc Verify toPrecision(2) on new Decimal("1.21") returns 1.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.set({ rounding: Decimal.ROUND_UP });
        let s: string = new Decimal("1.21").toPrecision(2);
        expect(s).assertEqual("1.3");
      } finally {
        Decimal.set({ defaults: true });
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_6700
     * @tc.name decimalToPrecisionPart01Test067
     * @tc.desc Verify toPrecision(3) on new Decimal("123456789012") returns 1.23e+11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToPrecisionPart01Test067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.set({ toExpPos: 10 });
        let s: string = new Decimal("123456789012").toPrecision(3);
        expect(s).assertEqual("1.23e+11");
      } finally {
        Decimal.set({ defaults: true });
      }
    });
  });
}