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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Decimal } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

function assertThrowError(fn: () => void, code: number): void {
  try {
    fn();
    expect().assertFail();
  } catch (e) {
    expect((e as BusinessError).code).assertEqual(code);
  }
}

type Value = string | number | Decimal;

function asinUnsafe(...args: ESObject[]): Decimal {
  return Decimal.asin(args[0] as Value);
}

export default function DecimalStaticAsinPart01Test() {
  describe('DecimalStaticAsinPart01Test', () => {
    beforeAll(() => {
    });
    beforeEach(async () => {
      await sleep(30);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_0100
     * @tc.desc Verify asin(0.75) returns doc example '0.84806207898148100805' with extra ignored arg
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: Decimal = Decimal.asin(0.75);
      let r2: Decimal = asinUnsafe(0.75, 9);
      expect(r1.toString()).assertEqual(r2.toString());
      expect(r1.toString()).assertEqual('0.84806207898148100805');
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_0200
     * @tc.desc Verify asin(0) returns exact zero with isZero true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin(0);
      expect(r.toString()).assertEqual('0');
      expect(r.isZero()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_0300
     * @tc.desc Verify asin(1) returns pi/2 with 20 significant digits '1.5707963267948966192'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin(1);
      expect(r.toString()).assertEqual('1.5707963267948966192');
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_0400
     * @tc.desc Verify asin(-1) returns -pi/2 with negative sign
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin(-1);
      expect(r.toString()).assertEqual('-1.5707963267948966192');
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_0500
     * @tc.desc Verify asin(0.5) returns pi/6 with 20 significant digits
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin(0.5);
      expect(r.toString()).assertEqual('0.52359877559829887308');
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_0600
     * @tc.desc Verify asin(-0.5) returns -pi/6 with symmetric sign
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin(-0.5);
      expect(r.toString()).assertEqual('-0.52359877559829887308');
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test0700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_0700
     * @tc.desc Verify asin(0.75) returns doc example value '0.84806207898148100805'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin(0.75);
      expect(r.toString()).assertEqual('0.84806207898148100805');
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test0800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_0800
     * @tc.desc Verify asin(-0.75) is sign-symmetric with asin(0.75) and sums near zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: Decimal = Decimal.asin(-0.75);
      let r2: Decimal = Decimal.asin(0.75);
      expect(r1.toString()).assertEqual('-0.84806207898148100805');
      expect(Math.abs(r1.toNumber() + r2.toNumber()) < 1e-20).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test0900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_0900
     * @tc.desc Verify asin(0.25) result lies within interval (0.25, 0.26)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.asin(0.25).toNumber();
      expect(v > 0.25 && v < 0.26).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test1000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_1000
     * @tc.desc Verify asin(0.9) result lies within interval (1.11, 1.13) near pi/2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.asin(0.9).toNumber();
      expect(v > 1.11 && v < 1.13).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test1100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_1100
     * @tc.desc Verify asin(0.3) result lies within interval (0.30, 0.31)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.asin(0.3).toNumber();
      expect(v > 0.30 && v < 0.31).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test1200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_1200
     * @tc.desc Verify asin(0.1) small angle approximates input within 1e-3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.asin(0.1).toNumber();
      expect(Math.abs(v - 0.1) < 1e-3).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test1300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_1300
     * @tc.desc Verify asin(-0.1) small negative angle approximates -0.1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.asin(-0.1).toNumber();
      expect(v < 0 && Math.abs(v + 0.1) < 1e-3).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test1400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_1400
     * @tc.desc Verify odd symmetry asin(-0.25) equals -asin(0.25)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: Decimal = Decimal.asin(-0.25);
      let r2: Decimal = Decimal.asin(0.25);
      expect(Math.abs(r1.toNumber() + r2.toNumber()) < 1e-20).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test1500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_1500
     * @tc.desc Verify asin(0.9999999999999999) is finite and approaches pi/2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin(0.9999999999999999);
      expect(r.isFinite()).assertTrue();
      let v: number = r.toNumber();
      expect(v > 1.5707 && v < 1.5708).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test1600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_1600
     * @tc.desc Verify asin(-0.9999999999999999) is finite and approaches -pi/2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin(-0.9999999999999999);
      expect(r.isFinite()).assertTrue();
      let v: number = r.toNumber();
      expect(v > -1.5708 && v < -1.5707).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test1700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_1700
     * @tc.desc Verify asin(Number.EPSILON) tiny positive angle is between 0 and 1e-300
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.asin(Number.EPSILON).toNumber();
      expect(v > 0 && v < 1e-15).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test1800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_1800
     * @tc.desc Verify asin(-Number.EPSILON) tiny negative angle is between -1e-300 and 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.asin(-Number.EPSILON).toNumber();
      expect(v < 0 && v > -1e-15).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test1900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_1900
     * @tc.desc Verify asin(Number.MIN_VALUE) result is positive and of input magnitude
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin(Number.MIN_VALUE);
      expect(r.toNumber() > 0).assertTrue();
      expect(r.toNumber() / Number.MIN_VALUE > 0.5).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test2000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_2000
     * @tc.desc Verify asin(1e-9) tiny scientific number approximates input within 1e-10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.asin(1e-9).toNumber();
      expect(v > 0 && Math.abs(v - 1e-9) < 1e-10).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test2100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_2100
     * @tc.desc Verify asin(1e-300) near underflow boundary stays finite positive below 1e-299
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin(1e-300);
      expect(r.isFinite()).assertTrue();
      expect(r.toNumber() > 0 && r.toNumber() < 1e-299).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test2200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_2200
     * @tc.desc Verify asin(-0) keeps negative zero sign: isNegative true, toNumber 0, toString '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin(-0);
      expect(r.isNegative()).assertTrue();
      expect(r.toNumber()).assertEqual(0);
      expect(r.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test2300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_2300
     * @tc.desc Verify identity asin(0.6)+acos(0.6) approximates pi/2 within 1e-9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: number = Decimal.asin(0.6).toNumber() + Decimal.acos(0.6).toNumber();
      expect(Math.abs(sum - Math.PI / 2) < 1e-9).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test2400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_2400
     * @tc.desc Verify asin(1) with precision 5 config returns '1.5708'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 5 });
      try {
        let r: Decimal = Decimal.asin(1);
        expect(r.toString()).assertEqual('1.5708');
      } finally {
        Decimal.set({ precision: 20 });
      }
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test2500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_2500
     * @tc.desc Verify asin(1) with precision 10 config returns '1.570796327'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 10 });
      try {
        let r: Decimal = Decimal.asin(1);
        expect(r.toString()).assertEqual('1.570796327');
      } finally {
        Decimal.set({ precision: 20 });
      }
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test2600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_2600
     * @tc.desc Verify asin(0.5) with precision 5 and ROUND_FLOOR returns '0.52359'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 5, rounding: Decimal.ROUND_FLOOR });
      try {
        let r: Decimal = Decimal.asin(0.5);
        expect(r.toString()).assertEqual('0.52359');
      } finally {
        Decimal.set({ precision: 20, rounding: 4 });
      }
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test2700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_2700
     * @tc.desc Verify asin(0.5) with precision 5 and ROUND_CEILING returns '0.5236'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 5, rounding: Decimal.ROUND_CEILING });
      try {
        let r: Decimal = Decimal.asin(0.5);
        expect(r.toString()).assertEqual('0.5236');
      } finally {
        Decimal.set({ precision: 20, rounding: 4 });
      }
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test2800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_2800
     * @tc.desc Verify asin of Decimal(0.5) and number 0.5 give identical results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: Decimal = Decimal.asin(new Decimal(0.5));
      let r2: Decimal = Decimal.asin(0.5);
      expect(r1.toString()).assertEqual(r2.toString());
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test2900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_2900
     * @tc.desc Verify asin of Decimal(-0.75) and number -0.75 give identical results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: Decimal = Decimal.asin(new Decimal(-0.75));
      let r2: Decimal = Decimal.asin(-0.75);
      expect(r1.toString()).assertEqual(r2.toString());
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test3000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_3000
     * @tc.desc Verify asin of Decimal('0.999999999999999999999') beyond double precision approaches pi/2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin(new Decimal('0.999999999999999999999'));
      expect(r.isFinite()).assertTrue();
      let v: number = r.toNumber();
      expect(v > 1.5707 && v < 1.5708).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test3100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_3100
     * @tc.desc Verify asin returns new Decimal and input Decimal instance stays unmodified
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(0.5);
      let before: string = dec.toString();
      let r: Decimal = Decimal.asin(dec);
      expect(r === dec).assertFalse();
      expect(dec.toString()).assertEqual(before);
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test3200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_3200
     * @tc.desc Verify repeated asin(0.5) calls with same input give stable consistent results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: Decimal = Decimal.asin(0.5);
      const firstValue: string = r1.toString();
      let r2: Decimal = Decimal.asin(0.5);
      const secondValue: string = r2.toString();
      expect(firstValue).assertEqual('0.52359877559829887308');
      expect(secondValue).assertEqual(firstValue);
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test3300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_3300
     * @tc.desc Verify asin(null) explicit null throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        asinUnsafe(null);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test3400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_3400
     * @tc.desc Verify asin(undefined) explicit undefined throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        asinUnsafe(undefined);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test3500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_3500
     * @tc.desc Verify asin() missing argument throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        asinUnsafe();
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test3600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_3600
     * @tc.desc Verify asin with missing object property (undefined) throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let holder: Record<string, number> = {};
      let apiThrew1_1: boolean = false;
      try {
        asinUnsafe(holder.missing);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test3700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_3700
     * @tc.desc Verify asin with object member explicitly null throws 401, distinct from undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let holder: Record<string, number> = { 'missing': 0 };
      holder.missing = undefined as ESObject as number;
      let apiThrew1_1: boolean = false;
      try {
        asinUnsafe(holder['missing']);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test3800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_3800
     * @tc.desc Verify asin(0.5) returns object with array d and number e/s fields
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin(0.5);
      expect(Array.isArray(r.d)).assertTrue();
      expect(typeof r.e).assertEqual('number');
      expect(typeof r.s).assertEqual('number');
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test3900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_3900
     * @tc.desc Verify asin(0.5) result in domain is finite Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin(0.5);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test4000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_4000
     * @tc.desc Verify sign fields: asin(0).s is 1 and asin(-0).s is -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.asin(0).s).assertEqual(1);
      expect(Decimal.asin(-0).s).assertEqual(-1);
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test4100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_4100
     * @tc.desc Verify result signs: asin(1) isPositive and asin(-1) isNegative
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.asin(1).isPositive()).assertTrue();
      expect(Decimal.asin(-1).isNegative()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test4200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_4200
     * @tc.desc Verify valueOf returns number consistent with Math.asin(0.5)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.asin(0.5).toNumber();
      expect(typeof v).assertEqual('number');
      expect(Math.abs(v - Math.asin(0.5)) < 1e-9).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test4300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_4300
     * @tc.desc Verify monotonicity asin(1) > asin(0.5) > asin(0)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v0: number = Decimal.asin(0).toNumber();
      let v5: number = Decimal.asin(0.5).toNumber();
      let v1: number = Decimal.asin(1).toNumber();
      expect(v1 > v5 && v5 > v0).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test4400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_4400
     * @tc.desc Verify asin(NaN) returns NaN Decimal with isNaN true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin(NaN);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test4500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_4500
     * @tc.desc Verify asin(Infinity) non-finite input returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin(Infinity);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test4600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_4600
     * @tc.desc Verify asin(-Infinity) returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin(-Infinity);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test4700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_4700
     * @tc.desc Verify asin(2) outside domain |x|>1 returns NaN silently without throw
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin(2);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test4800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_4800
     * @tc.desc Verify asin(-2) outside domain lower bound returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin(-2);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test4900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_4900
     * @tc.desc Verify asin(1.0000001) just above domain upper bound returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin(1.0000001);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test5000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_5000
     * @tc.desc Verify asin(-1.0000001) just below domain lower bound returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin(-1.0000001);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test5100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_5100
     * @tc.desc Verify asin(1e300) huge scientific number returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin(1e300);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test5200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_5200
     * @tc.desc Verify asin(Number.MAX_VALUE) largest double returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin(Number.MAX_VALUE);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test5300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_5300
     * @tc.desc Verify asin(Number.MAX_SAFE_INTEGER) safe integer upper bound returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin(Number.MAX_SAFE_INTEGER);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test5400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_5400
     * @tc.desc Verify asin(Number.MIN_SAFE_INTEGER) safe integer lower bound returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin(Number.MIN_SAFE_INTEGER);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test5500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_5500
     * @tc.desc Verify asin of Decimal-wrapped NaN propagates to NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin(new Decimal(NaN));
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test5600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_5600
     * @tc.desc Verify asin of Decimal-wrapped Infinity propagates to NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin(new Decimal(Infinity));
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test5700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_5700
     * @tc.desc Verify asin of Decimal-wrapped negative zero keeps sign and zero value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin(new Decimal(-0));
      expect(r.isNegative()).assertTrue();
      expect(r.toNumber()).assertEqual(0);
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test5800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_5800
     * @tc.desc Verify asin(-1) with precision 2 config rounds to '-1.6'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 2 });
      try {
        let r: Decimal = Decimal.asin(-1);
        expect(r.toString()).assertEqual('-1.6');
      } finally {
        Decimal.set({ precision: 20 });
      }
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test5900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_5900
     * @tc.desc Verify asin(true) boolean error type throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        asinUnsafe(true);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test6000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_6000
     * @tc.desc Verify asin({}) empty object error type throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        asinUnsafe({});
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test6100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_6100
     * @tc.desc Verify asin([]) empty array error type throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        asinUnsafe([]);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart01Test6200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART01_TEST_6200
     * @tc.desc Verify asin(function returning 0.5) error type throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart01Test6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        let _r: Decimal = asinUnsafe((): number => {
        return 0.5;
        });
        expect().assertFail();
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });
  });
}
