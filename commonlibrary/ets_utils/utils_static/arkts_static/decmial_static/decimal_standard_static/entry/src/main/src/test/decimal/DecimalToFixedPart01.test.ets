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
import { BusinessError } from "@ohos.base";

export default function decimalToFixedPart01Test(): void {
  describe("DecimalToFixedPart01Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_0100
     * @tc.name decimalToFixedPart01Test001
     * @tc.desc Verify toFixed(0) on new Decimal(1.5) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.5).toFixed(0);
      expect(s).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_0200
     * @tc.name decimalToFixedPart01Test002
     * @tc.desc Verify toFixed(10) on new Decimal("1.23456789012345") returns 1.2345678901
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.23456789012345").toFixed(10);
      expect(s).assertEqual("1.2345678901");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_0300
     * @tc.name decimalToFixedPart01Test003
     * @tc.desc Verify toFixed(20) on new Decimal(Double.NaN) returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(Double.NaN).toFixed(20);
      expect(s).assertEqual("NaN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_0400
     * @tc.name decimalToFixedPart01Test004
     * @tc.desc Verify toFixed(5) on new Decimal(1.2) returns 1.20000 and length 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.2).toFixed(5);
      expect(s).assertEqual("1.20000");
      let actual: int = s.length;
      let expected: int = 7;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_0500
     * @tc.name decimalToFixedPart01Test005
     * @tc.desc Verify toFixed(1) on new Decimal("123.456") returns 123.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("123.456").toFixed(1);
      expect(s).assertEqual("123.5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_0600
     * @tc.name decimalToFixedPart01Test006
     * @tc.desc Verify toFixed(0) on new Decimal(5) returns 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(5).toFixed(0);
      expect(s).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_0700
     * @tc.name decimalToFixedPart01Test007
     * @tc.desc Verify toFixed(2) on new Decimal(5) returns 5.00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(5).toFixed(2);
      expect(s).assertEqual("5.00");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_0800
     * @tc.name decimalToFixedPart01Test008
     * @tc.desc Verify toFixed(3) on new Decimal(0) returns 0.000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0).toFixed(3);
      expect(s).assertEqual("0.000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_0900
     * @tc.name decimalToFixedPart01Test009
     * @tc.desc Verify toFixed(2) on new Decimal(-0) returns 0.00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-0).toFixed(2);
      expect(s).assertEqual("0.00");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_1000
     * @tc.name decimalToFixedPart01Test010
     * @tc.desc Verify toFixed(2) on new Decimal(-1.2345) returns -1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-1.2345).toFixed(2);
      expect(s).assertEqual("-1.23");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_1100
     * @tc.name decimalToFixedPart01Test011
     * @tc.desc Verify toFixed(2) on new Decimal(-5) returns -5.00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-5).toFixed(2);
      expect(s).assertEqual("-5.00");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_1200
     * @tc.name decimalToFixedPart01Test012
     * @tc.desc Verify toFixed(2) on new Decimal("123456.789") returns 123456.79
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("123456.789").toFixed(2);
      expect(s).assertEqual("123456.79");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_1300
     * @tc.name decimalToFixedPart01Test013
     * @tc.desc Verify toFixed(2) on new Decimal("1e21") returns 1000000000000000000000.00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1e21").toFixed(2);
      expect(s).assertEqual("1000000000000000000000.00");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_1400
     * @tc.name decimalToFixedPart01Test014
     * @tc.desc Verify toFixed(2) on new Decimal("-1e21") returns -1000000000000000000000.00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("-1e21").toFixed(2);
      expect(s).assertEqual("-1000000000000000000000.00");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_1500
     * @tc.name decimalToFixedPart01Test015
     * @tc.desc Verify toFixed(2) on new Decimal("9.9e20") returns 990000000000000000000.00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("9.9e20").toFixed(2);
      expect(s).assertEqual("990000000000000000000.00");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_1600
     * @tc.name decimalToFixedPart01Test016
     * @tc.desc Verify toFixed(1) on new Decimal(5e-324) returns 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(5e-324).toFixed(1);
      expect(s).assertEqual("0.0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_1700
     * @tc.name decimalToFixedPart01Test017
     * @tc.desc Verify toFixed(7) on new Decimal("1e-7") returns 0.0000001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1e-7").toFixed(7);
      expect(s).assertEqual("0.0000001");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_1800
     * @tc.name decimalToFixedPart01Test018
     * @tc.desc Verify toFixed(7) on new Decimal("-1e-7") returns -0.0000001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("-1e-7").toFixed(7);
      expect(s).assertEqual("-0.0000001");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_1900
     * @tc.name decimalToFixedPart01Test019
     * @tc.desc Verify toFixed(2) on new Decimal(0.1) returns 0.10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0.1).toFixed(2);
      expect(s).assertEqual("0.10");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_2000
     * @tc.name decimalToFixedPart01Test020
     * @tc.desc Verify toFixed(1) on new Decimal(0.1 + 0.2) returns 0.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(0.1 + 0.2).toFixed(1);
      expect(s).assertEqual("0.3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_2100
     * @tc.name decimalToFixedPart01Test021
     * @tc.desc Verify toFixed(2) on new Decimal("1.005") returns 1.01
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.005").toFixed(2);
      expect(s).assertEqual("1.01");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_2200
     * @tc.name decimalToFixedPart01Test022
     * @tc.desc Verify toFixed(2) on new Decimal("1.004") returns 1.00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.004").toFixed(2);
      expect(s).assertEqual("1.00");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_2300
     * @tc.name decimalToFixedPart01Test023
     * @tc.desc Verify toFixed(2) on new Decimal("2.675") returns 2.68
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("2.675").toFixed(2);
      expect(s).assertEqual("2.68");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_2400
     * @tc.name decimalToFixedPart01Test024
     * @tc.desc Verify toFixed(0) on new Decimal("0.5") returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("0.5").toFixed(0);
      expect(s).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_2500
     * @tc.name decimalToFixedPart01Test025
     * @tc.desc Verify toFixed(0) on new Decimal("-0.5") returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("-0.5").toFixed(0);
      expect(s).assertEqual("-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_2600
     * @tc.name decimalToFixedPart01Test026
     * @tc.desc Verify toFixed(1) on new Decimal("0.05") returns 0.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("0.05").toFixed(1);
      expect(s).assertEqual("0.1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_2700
     * @tc.name decimalToFixedPart01Test027
     * @tc.desc Verify toFixed(1) on new Decimal("0.04") returns 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("0.04").toFixed(1);
      expect(s).assertEqual("0.0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_2800
     * @tc.name decimalToFixedPart01Test028
     * @tc.desc Verify toFixed(1) on new Decimal("-0.05") returns -0.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("-0.05").toFixed(1);
      expect(s).assertEqual("-0.1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_2900
     * @tc.name decimalToFixedPart01Test029
     * @tc.desc Verify toFixed(2) on new Decimal("0.999") returns 1.00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("0.999").toFixed(2);
      expect(s).assertEqual("1.00");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_3000
     * @tc.name decimalToFixedPart01Test030
     * @tc.desc Verify toFixed(0) on new Decimal("999999.9") returns 1000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("999999.9").toFixed(0);
      expect(s).assertEqual("1000000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_3100
     * @tc.name decimalToFixedPart01Test031
     * @tc.desc Verify toFixed(0) on new Decimal("-999999.9") returns -1000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("-999999.9").toFixed(0);
      expect(s).assertEqual("-1000000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_3200
     * @tc.name decimalToFixedPart01Test032
     * @tc.desc Verify toFixed(4) on new Decimal("999999.99999") returns 1000000.0000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("999999.99999").toFixed(4);
      expect(s).assertEqual("1000000.0000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_3300
     * @tc.name decimalToFixedPart01Test033
     * @tc.desc Verify toFixed(2) on new Decimal(Math.PI) returns 3.14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(Math.PI).toFixed(2);
      expect(s).assertEqual("3.14");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_3400
     * @tc.name decimalToFixedPart01Test034
     * @tc.desc Verify toFixed(0) on new Decimal(9007199254740991) returns 9007199254740991
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(9007199254740991).toFixed(0);
      expect(s).assertEqual("9007199254740991");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_3500
     * @tc.name decimalToFixedPart01Test035
     * @tc.desc Verify toFixed(2) on new Decimal(1.7976931348623157e+308) returns fixed notation ending with .00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = new Decimal(1.7976931348623157e308).toFixed(2);
      let actual: int = r.indexOf("e+308");
      expect(actual).assertEqual(-1);
      let actual2: string = r.substring(r.length - 3);
      expect(actual2).assertEqual(".00");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_3600
     * @tc.name decimalToFixedPart01Test036
     * @tc.desc Verify toFixed(20) on new Decimal("1.23456789e-20") returns 0.00000000000000000001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.23456789e-20").toFixed(20);
      expect(s).assertEqual("0.00000000000000000001");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_3700
     * @tc.name decimalToFixedPart01Test037
     * @tc.desc Verify toFixed(2) on new Decimal("2.500") returns 2.50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("2.500").toFixed(2);
      expect(s).assertEqual("2.50");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_3800
     * @tc.name decimalToFixedPart01Test038
     * @tc.desc Verify toFixed(2) on new Decimal(-0.1) returns -0.10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-0.1).toFixed(2);
      expect(s).assertEqual("-0.10");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_3900
     * @tc.name decimalToFixedPart01Test039
     * @tc.desc Verify toFixed(2) on new Decimal(1.2345) returns 1.23 and toString() round-trips to 1.2345
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(1.2345);
      let s: string = d.toFixed(2);
      expect(s).assertEqual("1.23");
      let actual: string = d.toString();
      let expected: string = "1.2345";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_4000
     * @tc.name decimalToFixedPart01Test040
     * @tc.desc Verify toFixed(2) on new Decimal(new Decimal("2.345")) double-wrapped construction returns 2.35
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: Decimal = new Decimal("2.345");
      let s: string = new Decimal(inner).toFixed(2);
      expect(s).assertEqual("2.35");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_4100
     * @tc.name decimalToFixedPart01Test041
     * @tc.desc Verify toFixed(0) on new Decimal("1e5") returns 100000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1e5").toFixed(0);
      expect(s).assertEqual("100000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_4200
     * @tc.name decimalToFixedPart01Test042
     * @tc.desc Verify toFixed(0) on new Decimal("0123") returns 123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("0123").toFixed(0);
      expect(s).assertEqual("123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_4300
     * @tc.name decimalToFixedPart01Test043
     * @tc.desc Verify toFixed(0) on new Decimal("0x10") returns 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("0x10").toFixed(0);
      expect(s).assertEqual("16");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_4400
     * @tc.name decimalToFixedPart01Test044
     * @tc.desc Verify toFixed(0) on new Decimal("5.") returns 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("5.").toFixed(0);
      expect(s).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_4500
     * @tc.name decimalToFixedPart01Test045
     * @tc.desc Verify toFixed(0) on new Decimal(".5") returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(".5").toFixed(0);
      expect(s).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_4600
     * @tc.name decimalToFixedPart01Test046
     * @tc.desc Verify toFixed(1) on new Decimal("+1.25") returns 1.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("+1.25").toFixed(1);
      expect(s).assertEqual("1.3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_4700
     * @tc.name decimalToFixedPart01Test047
     * @tc.desc Verify toFixed(20) on new Decimal("1.234567890123456789012345678901234567890") returns 1.23456789012345678901
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.234567890123456789012345678901234567890").toFixed(20);
      expect(s).assertEqual("1.23456789012345678901");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_4800
     * @tc.name decimalToFixedPart01Test048
     * @tc.desc Verify toFixed(2) on new Decimal(long) returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longVal: string = "1.23";
      for (let i: int = 0; i < 10000; i++) {
        longVal = longVal + '0';
      }
      let s: string = new Decimal(longVal).toFixed(2);
      expect(s).assertEqual("1.23");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_4900
     * @tc.name decimalToFixedPart01Test049
     * @tc.desc Verify toFixed(2) on new Decimal("1.231") returns 1.24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_UP });
      let s: string = new Decimal("1.231").toFixed(2);
      expect(s).assertEqual("1.24");
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_5000
     * @tc.name decimalToFixedPart01Test050
     * @tc.desc Verify toFixed(2) on new Decimal("1.239") returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let s: string = new Decimal("1.239").toFixed(2);
      expect(s).assertEqual("1.23");
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_5100
     * @tc.name decimalToFixedPart01Test051
     * @tc.desc Verify toFixed(2) on new Decimal("-1.234") returns -1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_CEILING });
      let s: string = new Decimal("-1.234").toFixed(2);
      expect(s).assertEqual("-1.23");
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_5200
     * @tc.name decimalToFixedPart01Test052
     * @tc.desc Verify toFixed(2) on new Decimal("-1.234") returns -1.24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_FLOOR });
      let s: string = new Decimal("-1.234").toFixed(2);
      expect(s).assertEqual("-1.24");
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_5300
     * @tc.name decimalToFixedPart01Test053
     * @tc.desc Verify toFixed(2) on new Decimal("1.239") returns 1.24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_HALF_UP });
      let s: string = new Decimal("1.239").toFixed(2);
      expect(s).assertEqual("1.24");
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_5400
     * @tc.name decimalToFixedPart01Test054
     * @tc.desc Verify toFixed(2) on new Decimal("1.235") returns 1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_HALF_DOWN });
      let s: string = new Decimal("1.235").toFixed(2);
      expect(s).assertEqual("1.23");
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_5500
     * @tc.name decimalToFixedPart01Test055
     * @tc.desc Verify toFixed(2) on new Decimal("2.245") returns 2.24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_HALF_EVEN });
      let s: string = new Decimal("2.245").toFixed(2);
      expect(s).assertEqual("2.24");
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_5600
     * @tc.name decimalToFixedPart01Test056
     * @tc.desc Verify toFixed(2) on new Decimal("-1.235") returns -1.23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_HALF_CEILING });
      let s: string = new Decimal("-1.235").toFixed(2);
      expect(s).assertEqual("-1.23");
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_5700
     * @tc.name decimalToFixedPart01Test057
     * @tc.desc Verify toFixed(2) on new Decimal("-1.235") returns -1.24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_HALF_FLOOR });
      let s: string = new Decimal("-1.235").toFixed(2);
      expect(s).assertEqual("-1.24");
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_5800
     * @tc.name decimalToFixedPart01Test058
     * @tc.desc Verify toFixed(2) on new Decimal("12.345") with precision set returns 12.35
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 2 });
      let s: string = new Decimal("12.345").toFixed(2);
      expect(s).assertEqual("12.35");
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_5900
     * @tc.name decimalToFixedPart01Test059
     * @tc.desc Verify toFixed(2) on new Decimal("1.239") returns 1.23 under ROUND_DOWN and 1.24 after defaults reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let a: string = new Decimal("1.239").toFixed(2);
      expect(a).assertEqual("1.23");
      Decimal.set({ defaults: true });
      let b: string = new Decimal("1.239").toFixed(2);
      expect(b).assertEqual("1.24");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_6000
     * @tc.name decimalToFixedPart01Test060
     * @tc.desc Verify toFixed(-1) on new Decimal(1) throws BusinessError with code 10200001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = new Decimal(1).toFixed(-1);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_6100
     * @tc.name decimalToFixedPart01Test061
     * @tc.desc Verify toFixed(1000000001) on new Decimal(1) throws BusinessError with code 10200001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = new Decimal(1).toFixed(1000000001);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_6200
     * @tc.name decimalToFixedPart01Test062
     * @tc.desc Verify toFixed(Double.NaN) on new Decimal(1) throws BusinessError with code 10200001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = new Decimal(1).toFixed(Double.NaN);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_FIXED_PART01_6300
     * @tc.name decimalToFixedPart01Test063
     * @tc.desc Verify toFixed(2.5) on new Decimal(1) throws BusinessError with code 10200001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToFixedPart01Test063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = new Decimal(1).toFixed(2.5);
        expect().assertFail();
      } catch (e) {
        let actual: number = (e as BusinessError).code;
        let expected: int = 10200001;
        expect(actual).assertEqual(expected);
      }
    });
  });
}