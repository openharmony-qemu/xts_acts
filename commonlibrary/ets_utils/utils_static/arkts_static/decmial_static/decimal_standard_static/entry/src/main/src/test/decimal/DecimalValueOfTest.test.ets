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
import { BusinessError } from "@ohos.base";

export default function decimalValueOfTestTest(): void {
  describe("DecimalValueOfTestTest", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_0100
     * @tc.name decimalValueOfTest001
     * @tc.desc Verify valueOf() on new Decimal("123.45") returns 123.45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalValueOfTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("123.45");
      let r1: string = d.valueOf();
      let e1: string = "123.45";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_0200
     * @tc.name decimalValueOfTest002
     * @tc.desc Verify valueOf() on new Decimal("1e+5") returns 100000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalValueOfTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1e+5");
      let r1: string = d.valueOf();
      let e1: string = "100000";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_0300
     * @tc.name decimalValueOfTest003
     * @tc.desc Verify valueOf() on new Decimal("1e+21") returns 1e+21
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalValueOfTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1e+21");
      let r1: string = d.valueOf();
      let e1: string = "1e+21";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_0400
     * @tc.name decimalValueOfTest004
     * @tc.desc Verify valueOf() on new Decimal("1e-21") returns 1e-21
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalValueOfTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1e-21");
      let r1: string = d.valueOf();
      let e1: string = "1e-21";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_0500
     * @tc.name decimalValueOfTest005
     * @tc.desc Verify valueOf() on new Decimal("123.456e2") returns 12345.6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalValueOfTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("123.456e2");
      let r1: string = d.valueOf();
      let e1: string = "12345.6";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_0600
     * @tc.name decimalValueOfTest006
     * @tc.desc Verify valueOf() on new Decimal("0.5e1") returns 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalValueOfTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("0.5e1");
      let r1: string = d.valueOf();
      let e1: string = '5';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_0700
     * @tc.name decimalValueOfTest007
     * @tc.desc Verify valueOf() on new Decimal("1.2300e3") returns 1230
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalValueOfTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.2300e3");
      let r1: string = d.valueOf();
      let e1: string = "1230";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_0800
     * @tc.name decimalValueOfTest008
     * @tc.desc Verify valueOf() on new Decimal("-2.5e7") returns -25000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalValueOfTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("-2.5e7");
      let r1: string = d.valueOf();
      let e1: string = "-25000000";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_0900
     * @tc.name decimalValueOfTest009
     * @tc.desc Verify valueOf() on new Decimal("1E3") returns 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalValueOfTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1E3");
      let r1: string = d.valueOf();
      let e1: string = "1000";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_1000
     * @tc.name decimalValueOfTest010
     * @tc.desc Verify valueOf() on new Decimal("0.0000001") returns d2.valueOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalValueOfTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Decimal = new Decimal("0.0000001");
      let d2: Decimal = new Decimal("1e-7");
      let r1: string = d1.valueOf();
      let e1: string = d2.valueOf();
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_1100
     * @tc.name decimalValueOfTest011
     * @tc.desc Verify valueOf() on new Decimal(789) returns 789
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalValueOfTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(789);
      let r1: string = d.valueOf();
      let e1: string = "789";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_1200
     * @tc.name decimalValueOfTest012
     * @tc.desc Verify valueOf() on new Decimal("7.89") returns d1.valueOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalValueOfTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Decimal = new Decimal("7.89");
      let d2: Decimal = new Decimal(d1);
      let r1: string = d2.valueOf();
      let e1: string = d1.valueOf();
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_1300
     * @tc.name decimalValueOfTest013
     * @tc.desc Verify new Decimal("  1.5  ") throws hex/binary/octal type error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalValueOfTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal("  1.5  ");
        let r1: string = d.valueOf();
        let e1: string = "1.5";
        expect(r1).assertEqual(e1);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_1400
     * @tc.name decimalValueOfTest014
     * @tc.desc Verify valueOf() on new Decimal("0." + s) returns 10001 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalValueOfTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '';
      for (let i = 0; i < 9999; i++) {
        s = s + '9';
      }
      let d: Decimal = new Decimal("0." + s);
      let r1: int = d.valueOf().length;
      let e1: int = 10001;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_1500
     * @tc.name decimalValueOfTest015
     * @tc.desc Verify valueOf() on new Decimal('0') returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalValueOfTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('0');
      let r1: string = d.valueOf();
      let e1: string = '0';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_1600
     * @tc.name decimalValueOfTest016
     * @tc.desc Verify "-0" valueOf "-0" Decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalValueOfTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("-0");
      let r1: string = d.valueOf();
      let e1: string = "-0";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_1700
     * @tc.name decimalValueOfTest017
     * @tc.desc Verify valueOf() on new Decimal(-1) div 0 returns "-Infinity"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalValueOfTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-1);
      let q: Decimal = d.div(0);
      let r1: string = q.valueOf();
      let e1: string = "-Infinity";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_1800
     * @tc.name decimalValueOfTest018
     * @tc.desc Verify valueOf() on new Decimal(0) mul Infinity returns "NaN"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalValueOfTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal(0);
      let b: Decimal = new Decimal(Number.POSITIVE_INFINITY);
      let m: Decimal = a.mul(b);
      let r1: string = m.valueOf();
      let e1: string = "NaN";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_1900
     * @tc.name decimalValueOfTest019
     * @tc.desc Verify ln(0) valueOf "-Infinity"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalValueOfTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0);
      let r1: string = d.ln().valueOf();
      let e1: string = "-Infinity";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_2000
     * @tc.name decimalValueOfTest020
     * @tc.desc Verify "1.000000" valueOf '1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalValueOfTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.000000");
      let r1: string = d.valueOf();
      let e1: string = '1';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_2100
     * @tc.name decimalValueOfTest021
     * @tc.desc Verify "0.5000" valueOf "0.5"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalValueOfTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("0.5000");
      let r1: string = d.valueOf();
      let e1: string = "0.5";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_2200
     * @tc.name decimalValueOfTest022
     * @tc.desc Verify "+456" valueOf "456"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalValueOfTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("+456");
      let r1: string = d.valueOf();
      let e1: string = "456";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_2300
     * @tc.name decimalValueOfTest023
     * @tc.desc Verify valueOf() on new Decimal("-789") returns -789
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalValueOfTest023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("-789");
      let r1: string = d.valueOf();
      let e1: string = "-789";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_2400
     * @tc.name decimalValueOfTest024
     * @tc.desc Verify "000123" valueOf "123"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalValueOfTest024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("000123");
      let r1: string = d.valueOf();
      let e1: string = "123";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_2500
     * @tc.name decimalValueOfTest025
     * @tc.desc Verify valueOf() on new Decimal("0.0012300") returns 0.00123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalValueOfTest025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("0.0012300");
      let r1: string = d.valueOf();
      let e1: string = "0.00123";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_2600
     * @tc.name decimalValueOfTest026
     * @tc.desc Verify "0b101" valueOf '5'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalValueOfTest026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("0b101");
      let r1: string = d.valueOf();
      let e1: string = '5';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_2700
     * @tc.name decimalValueOfTest027
     * @tc.desc Verify "0123" valueOf "123"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalValueOfTest027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("0123");
      let r1: string = d.valueOf();
      let e1: string = "123";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_2800
     * @tc.name decimalValueOfTest028
     * @tc.desc Verify valueOf() throws BusinessError on invalid Decimal input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalValueOfTest028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal("浣犲ソ");
        let r1: string = d.valueOf();
        let e1: string = '';
        expect(r1).assertEqual(e1);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_2900
     * @tc.name decimalValueOfTest029
     * @tc.desc Verify valueOf string number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalValueOfTest029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("7.7");
      let r1: string = d.valueOf();
      let e1: string = "7.7";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_3000
     * @tc.name decimalValueOfTest030
     * @tc.desc Verify valueOf() on new Decimal("2.5") returns x2.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalValueOfTest030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("2.5");
      let r1: string = 'x' + d.valueOf();
      let e1: string = "x2.5";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_3100
     * @tc.name decimalValueOfTest031
     * @tc.desc Verify valueOf() on new Decimal("99.9") returns 99.9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalValueOfTest031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("99.9");
      let r1: string = d.valueOf();
      let e1: string = "99.9";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_3200
     * @tc.name decimalValueOfTest032
     * @tc.desc Verify d.add(1).valueOf() returns 2.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalValueOfTest032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.1");
      let r1: string = d.add(1).valueOf();
      let e1: string = "2.1";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_3300
     * @tc.name decimalValueOfTest033
     * @tc.desc Verify valueOf() on new Decimal("42") returns d.toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalValueOfTest033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("42");
      let r1: string = d.valueOf();
      let e1: string = d.toString();
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_3400
     * @tc.name decimalValueOfTest034
     * @tc.desc Verify precision=5 valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalValueOfTest034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 5 });
      let d: Decimal = new Decimal("12345.6789");
      let r1: string = d.valueOf();
      let e1: string = "12345.6789";
      expect(r1).assertEqual(e1);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_3500
     * @tc.name decimalValueOfTest035
     * @tc.desc Verify valueOf() on new Decimal("123456") returns 1.23456e+5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalValueOfTest035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ toExpPos: 0 });
      let d: Decimal = new Decimal("123456");
      let r1: string = d.valueOf();
      let e1: string = "1.23456e+5";
      expect(r1).assertEqual(e1);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_3600
     * @tc.name decimalValueOfTest036
     * @tc.desc Verify valueOf() on new Decimal("0.000001234") returns 0.000001234
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalValueOfTest036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ toExpNeg: -9 });
      let d: Decimal = new Decimal("0.000001234");
      let r1: string = d.valueOf();
      let e1: string = "0.000001234";
      expect(r1).assertEqual(e1);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_3700
     * @tc.name decimalValueOfTest037
     * @tc.desc Verify valueOf() on new Decimal("1.5") mul 3 returns 4.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalValueOfTest037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal("1.5");
      let r: Decimal = d.mul(3);
      let r1: string = r.valueOf();
      let e1: string = "4.5";
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_VALUE_OF_3800
     * @tc.name decimalValueOfTest038
     * @tc.desc Verify valueOf() throws BusinessError on invalid Decimal input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalValueOfTest038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal("invalid-object");
        let r1: string = d.valueOf();
        let e1: string = '';
        expect(r1).assertEqual(e1);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  });
}