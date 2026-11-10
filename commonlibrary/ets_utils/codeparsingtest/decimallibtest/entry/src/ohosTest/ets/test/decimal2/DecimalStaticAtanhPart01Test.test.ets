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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-dynamic';
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

function atanhUnsafe(...args: ESObject[]): Decimal {
  return Decimal.atanh(args[0] as Value);
}

export default function DecimalStaticAtanhPart01Test() {
  describe('DecimalStaticAtanhPart01Test', () => {
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
     * @tc.name testDecimalStaticAtanhPart01Test0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_0100
     * @tc.desc Verify calling atanh with no argument throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        atanhUnsafe();
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_0200
     * @tc.desc Verify extra argument is ignored and result equals single-argument call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = Decimal.atanh(0.5);
      let b = atanhUnsafe(0.5, 123);
      expect(b.toString()).assertEqual(a.toString());
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_0300
     * @tc.desc Verify atanh(0) returns '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = Decimal.atanh(0);
      expect(d.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_0400
     * @tc.desc Verify atanh(-0) keeps negative zero: toString '-0' and isNegative true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = Decimal.atanh(-0);
      expect(d.toString()).assertEqual('0');
      expect(d.isNegative()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_0500
     * @tc.desc Verify atanh(0.5) returns exact 20-digit decimal string at default precision
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = Decimal.atanh(0.5);
      expect(d.toString()).assertEqual('0.5493061443340548457');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_0600
     * @tc.desc Verify atanh(-0.5) returns negative exact string symmetric to positive input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = Decimal.atanh(-0.5);
      expect(d.toString()).assertEqual('-0.5493061443340548457');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test0700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_0700
     * @tc.desc Verify atanh(0.1) result lies within 0.10033 to 0.10034 interval
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = Decimal.atanh(0.1).toNumber();
      expect(n > 0.10033).assertTrue();
      expect(n < 0.10034).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test0800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_0800
     * @tc.desc Verify atanh(-0.1) result lies within -0.10034 to -0.10033 interval
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = Decimal.atanh(-0.1).toNumber();
      expect(n < -0.10033).assertTrue();
      expect(n > -0.10034).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test0900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_0900
     * @tc.desc Verify atanh(0.99) near domain upper bound returns about 2.64665
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = Decimal.atanh(0.99).toNumber();
      expect(n > 2.64).assertTrue();
      expect(n < 2.66).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test1000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_1000
     * @tc.desc Verify atanh(0.999) closer to 1 grows to about 3.8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = Decimal.atanh(0.999).toNumber();
      expect(n > 3.79).assertTrue();
      expect(n < 3.81).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test1100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_1100
     * @tc.desc Verify atanh(1) domain right endpoint returns +Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = Decimal.atanh(1);
      expect(d.toString()).assertEqual('Infinity');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test1200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_1200
     * @tc.desc Verify atanh(-1) domain left endpoint returns -Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = Decimal.atanh(-1);
      expect(d.toString()).assertEqual('-Infinity');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test1300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_1300
     * @tc.desc Verify atanh(0.9999999999999999) returns finite large value greater than 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = Decimal.atanh(0.9999999999999999).toNumber();
      expect(n > 10).assertTrue();
      expect(Number.isFinite(n)).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test1400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_1400
     * @tc.desc Verify atanh(1.0000000000000002) one ulp beyond domain returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = Decimal.atanh(1.0000000000000002);
      expect(d.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test1500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_1500
     * @tc.desc Verify atanh(2) out-of-domain typical value returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = Decimal.atanh(2);
      expect(d.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test1600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_1600
     * @tc.desc Verify atanh(-2) out-of-domain negative value returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = Decimal.atanh(-2);
      expect(d.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test1700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_1700
     * @tc.desc Verify atanh(1.5) out-of-domain non-integer returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = Decimal.atanh(1.5);
      expect(d.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test1800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_1800
     * @tc.desc Verify atanh(-1.5) out-of-domain negative non-integer returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = Decimal.atanh(-1.5);
      expect(d.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test1900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_1900
     * @tc.desc Verify atanh(NaN) propagates NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = Decimal.atanh(NaN);
      expect(d.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test2000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_2000
     * @tc.desc Verify atanh(Infinity) returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = Decimal.atanh(Infinity);
      expect(d.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test2100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_2100
     * @tc.desc Verify atanh(-Infinity) returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = Decimal.atanh(-Infinity);
      expect(d.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test2200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_2200
     * @tc.desc Verify atanh(Number.MAX_VALUE) largest finite double returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = Decimal.atanh(Number.MAX_VALUE);
      expect(d.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test2300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_2300
     * @tc.desc Verify atanh(-Number.MAX_VALUE) negative largest finite double returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = Decimal.atanh(-Number.MAX_VALUE);
      expect(d.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test2400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_2400
     * @tc.desc Verify atanh(Number.MAX_SAFE_INTEGER) safe integer upper bound returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = Decimal.atanh(Number.MAX_SAFE_INTEGER);
      expect(d.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test2500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_2500
     * @tc.desc Verify atanh(1e308) scientific notation extreme returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = Decimal.atanh(1e308);
      expect(d.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test2600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_2600
     * @tc.desc Verify atanh(Number.MIN_VALUE) returns tiny positive within 0 and 1e-300
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = Decimal.atanh(Number.MIN_VALUE).toNumber();
      expect(n > 0).assertTrue();
      expect(n < 1e-300).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test2700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_2700
     * @tc.desc Verify atanh(-Number.MIN_VALUE) returns tiny negative within -1e-300 and 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = Decimal.atanh(-Number.MIN_VALUE).toNumber();
      expect(n < 0).assertTrue();
      expect(n > -1e-300).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test2800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_2800
     * @tc.desc Verify atanh(Number.EPSILON) returns positive value below 1e-15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = Decimal.atanh(Number.EPSILON).toNumber();
      expect(n > 0).assertTrue();
      expect(n < 1e-15).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test2900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_2900
     * @tc.desc Verify atanh(-Number.EPSILON) returns negative value above -1e-15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = Decimal.atanh(-Number.EPSILON).toNumber();
      expect(n < 0).assertTrue();
      expect(n > -1e-15).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test3000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_3000
     * @tc.desc Verify atanh(1e-7) small scientific value approximates input itself
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = Decimal.atanh(1e-7).toNumber();
      expect(n > 0.999e-7).assertTrue();
      expect(n < 1.001e-7).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test3100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_3100
     * @tc.desc Verify atanh(-1e-7) small negative scientific value approximates -1e-7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = Decimal.atanh(-1e-7).toNumber();
      expect(n < -0.999e-7).assertTrue();
      expect(n > -1.001e-7).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test3200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_3200
     * @tc.desc Verify precision 50 makes atanh(0.5) result carry 50 significant digits
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 50 });
      let d = Decimal.atanh(0.5);
      Decimal.set({ precision: 20, rounding: 4 });
      expect(d.toString()).assertEqual('0.54930614433405484569762261846126285232374527891137');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test3300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_3300
     * @tc.desc Verify precision 1 with HALF_UP rounds atanh(0.5) to '0.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 1, rounding: 4 });
      let d = Decimal.atanh(0.5);
      Decimal.set({ precision: 20, rounding: 4 });
      expect(d.toString()).assertEqual('0.5');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test3400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_3400
     * @tc.desc Verify precision 5 ROUND_DOWN vs ROUND_UP produce different last-digit results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 5, rounding: 1 });
      expect(Decimal.atanh(0.5).toString()).assertEqual('0.5493');
      Decimal.set({ precision: 5, rounding: 0 });
      expect(Decimal.atanh(0.5).toString()).assertEqual('0.54931');
      Decimal.set({ precision: 20, rounding: 4 });
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test3500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_3500
     * @tc.desc Verify precision 10 truncates atanh(0.5) to '0.5493061443'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 10, rounding: 4 });
      let d = Decimal.atanh(0.5);
      Decimal.set({ precision: 20, rounding: 4 });
      expect(d.toString()).assertEqual('0.5493061443');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test3600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_3600
     * @tc.desc Verify atanh of Decimal '0.5' matches number input result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = Decimal.atanh(new Decimal('0.5'));
      expect(d.toString()).assertEqual('0.5493061443340548457');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test3700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_3700
     * @tc.desc Verify atanh of Decimal '-0.5' returns negative result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = Decimal.atanh(new Decimal('-0.5'));
      expect(d.toString()).assertEqual('-0.5493061443340548457');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test3800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_3800
     * @tc.desc Verify atanh of Decimal(NaN) propagates NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = Decimal.atanh(new Decimal(NaN));
      expect(d.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test3900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_3900
     * @tc.desc Verify atanh of Decimal('1') returns +Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = Decimal.atanh(new Decimal('1'));
      expect(d.toString()).assertEqual('Infinity');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test4000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_4000
     * @tc.desc Verify atanh of Decimal(0) returns '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = Decimal.atanh(new Decimal(0));
      expect(d.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test4100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_4100
     * @tc.desc Verify atanh of Decimal('-0') keeps negative zero semantics
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = Decimal.atanh(new Decimal('-0'));
      expect(d.toString()).assertEqual('0');
      expect(d.isNegative()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test4200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_4200
     * @tc.desc Verify atanh of Decimal('0.0001') result lies within (0.0001, 0.0001000001)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = Decimal.atanh(new Decimal('0.0001')).toNumber();
      expect(n > 0.0001).assertTrue();
      expect(n < 0.0001000001).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test4300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_4300
     * @tc.desc Verify number 0.5 and Decimal '0.5' inputs produce numerically equal results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = Decimal.atanh(0.5);
      let b = Decimal.atanh(new Decimal('0.5'));
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test4400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_4400
     * @tc.desc Verify explicit null input throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        atanhUnsafe(null);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test4500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_4500
     * @tc.desc Verify explicit undefined input throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        atanhUnsafe(undefined);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test4600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_4600
     * @tc.desc Verify library state unaffected after null throws: atanh(0.5) still succeeds
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        atanhUnsafe(null);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      expect(Decimal.atanh(0.5).toString()).assertEqual('0.5493061443340548457');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test4700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_4700
     * @tc.desc Verify NaN returns NaN silently while undefined throws 401 via different channels
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = Decimal.atanh(NaN);
      expect(a.isNaN()).assertTrue();
      let apiThrew1_1: boolean = false;
      try {
        atanhUnsafe(undefined);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test4800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_4800
     * @tc.desc Verify atanh(0.5) returns a Decimal instance instead of number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = Decimal.atanh(0.5);
      expect(d instanceof Decimal).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test4900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_4900
     * @tc.desc Verify two atanh(0.5) calls return different instances without caching
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = Decimal.atanh(0.5);
      let b = Decimal.atanh(0.5);
      expect(a !== b).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test5000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_5000
     * @tc.desc Verify atanh(-0.5) result isNegative returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = Decimal.atanh(-0.5);
      expect(d.isNegative()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test5100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_5100
     * @tc.desc Verify atanh(-0) result satisfies both isNegative and isZero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = Decimal.atanh(-0);
      expect(d.isNegative()).assertTrue();
      expect(d.isZero()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test5200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_5200
     * @tc.desc Verify atanh(1) result isFinite false and toNumber +Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = Decimal.atanh(1);
      expect(d.isFinite()).assertFalse();
      expect(d.toNumber()).assertEqual(Infinity);
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test5300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_5300
     * @tc.desc Verify atanh(0) result isZero true and isNegative false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = Decimal.atanh(0);
      expect(d.isZero()).assertTrue();
      expect(d.isNegative()).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test5400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_5400
     * @tc.desc Verify chained atanh(0.5).mul(2) approximates 1.0986
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = Decimal.atanh(0.5).mul(2).toNumber();
      expect(n > 1.0985).assertTrue();
      expect(n < 1.0987).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test5500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_5500
     * @tc.desc Verify atanh(0.5).toNumber() is close to double reference 0.5493061443340548
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = Decimal.atanh(0.5).toNumber();
      expect(n > 0.5493061443340547).assertTrue();
      expect(n < 0.5493061443340549).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test5600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_5600
     * @tc.desc Verify input Decimal object is not modified after atanh call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new Decimal('0.5');
      Decimal.atanh(x);
      expect(x.toString()).assertEqual('0.5');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test5700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_5700
     * @tc.desc Verify out-of-domain atanh(1.5) does not throw and silently returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw = false;
      let d: Decimal = new Decimal(0);
      try {
        d = Decimal.atanh(1.5);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
        threw = true;
      }
      expect(threw).assertFalse();
      expect(d.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test5800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_5800
     * @tc.desc Verify out-of-domain atanh(2) result toString is 'NaN'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = Decimal.atanh(2);
      expect(d.toString()).assertEqual('NaN');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test5900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_5900
     * @tc.desc Verify endpoint atanh(1) takes non-throwing path returning +Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw = false;
      let d: Decimal = new Decimal(0);
      try {
        d = Decimal.atanh(1);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
        threw = true;
      }
      expect(threw).assertFalse();
      expect(d.toString()).assertEqual('Infinity');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test6000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_6000
     * @tc.desc Verify in-domain call throws nothing and returned value is directly usable
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw = false;
      let n = -1;
      try {
        n = Decimal.atanh(0.25).toNumber();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
        threw = true;
      }
      expect(threw).assertFalse();
      expect(n > 0.25).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart01Test6100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART01_TEST_6100
     * @tc.desc Verify negative zero input triggers no error path and returns '-0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart01Test6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw = false;
      let d: Decimal = new Decimal(0);
      try {
        d = Decimal.atanh(-0);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
        threw = true;
      }
      expect(threw).assertFalse();
      expect(d.isZero()).assertTrue();
      expect(d.isNegative()).assertTrue();
    });
  });
}

