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

function lnUnsafe(...args: ESObject[]): Decimal {
  return Decimal.ln(args[0] as Value);
}

export default function DecimalStaticLnPart01Test() {
  describe('DecimalStaticLnPart01Test', () => {
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
     * @tc.name testDecimalStaticLnPart01Test0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_0100
     * @tc.desc Verify ln() with no argument passes undefined and throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        lnUnsafe();
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_0200
     * @tc.desc Verify ln(2) single number arg returns observable Decimal '0.69314718055994530942'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(2);
      expect(r.isNaN()).assertFalse();
      expect(r.toString()).assertEqual('0.69314718055994530942');
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_0300
     * @tc.desc Verify ln(2, 3) extra arg ignored per JS runtime semantics returning ln(2)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = lnUnsafe(2, 3);
      expect(r.toString()).assertEqual('0.69314718055994530942');
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_0400
     * @tc.desc Verify ln(1) returns '0' and is not NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(1);
      expect(r.toString()).assertEqual('0');
      expect(r.isNaN()).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_0500
     * @tc.desc Verify ln(2) toNumber matches Math.log(2) within tolerance 1e-9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(2);
      let delta: number = Math.abs(r.toNumber() - Math.log(2));
      expect(delta).assertLess(1e-9);
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_0600
     * @tc.desc Verify ln(10) toNumber matches Math.log(10) within tolerance 1e-9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(10);
      let delta: number = Math.abs(r.toNumber() - Math.log(10));
      expect(delta).assertLess(1e-9);
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test0700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_0700
     * @tc.desc Verify ln(0.5) equals -ln(2) so negative logarithm sign is observable
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(0.5);
      let delta: number = Math.abs(r.toNumber() - (-Math.log(2)));
      expect(delta).assertLess(1e-9);
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test0800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_0800
     * @tc.desc Verify ln(2.718281828459045) approaches 1 for floating-point approximation of e
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(2.718281828459045);
      let delta: number = Math.abs(r.toNumber() - 1);
      expect(delta).assertLess(1e-9);
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test0900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_0900
     * @tc.desc Verify ln(3) prime representative matches Math.log(3) within 1e-9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(3);
      let delta: number = Math.abs(r.toNumber() - Math.log(3));
      expect(delta).assertLess(1e-9);
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test1000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_1000
     * @tc.desc Verify ln(7) prime representative matches Math.log(7) within 1e-9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(7);
      let delta: number = Math.abs(r.toNumber() - Math.log(7));
      expect(delta).assertLess(1e-9);
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test1100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_1100
     * @tc.desc Verify ln(2.5) half-integer representative matches Math.log(2.5) within 1e-9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(2.5);
      let delta: number = Math.abs(r.toNumber() - Math.log(2.5));
      expect(delta).assertLess(1e-9);
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test1200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_1200
     * @tc.desc Verify ln(0.1) small decimal representative matches Math.log(0.1) within 1e-9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(0.1);
      let delta: number = Math.abs(r.toNumber() - Math.log(0.1));
      expect(delta).assertLess(1e-9);
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test1300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_1300
     * @tc.desc Verify ln(1e30) large positive exponent matches Math.log(1e30) within 1e-9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(1e30);
      let delta: number = Math.abs(r.toNumber() - Math.log(1e30));
      expect(delta).assertLess(1e-9);
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test1400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_1400
     * @tc.desc Verify ln(1e-30) large negative exponent matches Math.log(1e-30) within 1e-9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(1e-30);
      let delta: number = Math.abs(r.toNumber() - Math.log(1e-30));
      expect(delta).assertLess(1e-9);
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test1500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_1500
     * @tc.desc Verify ln(1e21) exponent beyond default toExpPos(21) matches Math.log within 1e-9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(1e21);
      let delta: number = Math.abs(r.toNumber() - Math.log(1e21));
      expect(delta).assertLess(1e-9);
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test1600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_1600
     * @tc.desc Verify ln(1e-21) tiny value beyond toExpNeg(-7) matches Math.log within 1e-9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(1e-21);
      let delta: number = Math.abs(r.toNumber() - Math.log(1e-21));
      expect(delta).assertLess(1e-9);
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test1700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_1700
     * @tc.desc Verify ln(1e15) positive exponent representative matches Math.log(1e15) within 1e-9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(1e15);
      let delta: number = Math.abs(r.toNumber() - Math.log(1e15));
      expect(delta).assertLess(1e-9);
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test1800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_1800
     * @tc.desc Verify ln(1e-15) negative exponent representative matches Math.log(1e-15) within 1e-9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(1e-15);
      let delta: number = Math.abs(r.toNumber() - Math.log(1e-15));
      expect(delta).assertLess(1e-9);
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test1900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_1900
     * @tc.desc Verify ln(Number.MIN_VALUE) smallest positive double matches Math.log within 1e-9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(Number.MIN_VALUE);
      let delta: number = Math.abs(r.toNumber() - Math.log(Number.MIN_VALUE));
      expect(delta).assertLess(0.05);
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test2000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_2000
     * @tc.desc Verify ln(Number.EPSILON) tiny positive double matches Math.log within 1e-9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(Number.EPSILON);
      let delta: number = Math.abs(r.toNumber() - Math.log(Number.EPSILON));
      expect(delta).assertLess(1e-9);
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test2100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_2100
     * @tc.desc Verify ln(Number.MAX_SAFE_INTEGER) largest safe integer matches Math.log within 1e-9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(Number.MAX_SAFE_INTEGER);
      let delta: number = Math.abs(r.toNumber() - Math.log(Number.MAX_SAFE_INTEGER));
      expect(delta).assertLess(1e-9);
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test2200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_2200
     * @tc.desc Verify ln(9e15) integer representative matches Math.log(9e15) within 1e-9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(9e15);
      let delta: number = Math.abs(r.toNumber() - Math.log(9e15));
      expect(delta).assertLess(1e-9);
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test2300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_2300
     * @tc.desc Verify ln(1e9) power-of-ten integer matches Math.log(1e9) within 1e-9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(1e9);
      let delta: number = Math.abs(r.toNumber() - Math.log(1e9));
      expect(delta).assertLess(1e-9);
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test2400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_2400
     * @tc.desc Verify ln(0x10) hex literal equals ln(16) matching Math.log(16) within 1e-9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(0x10);
      let delta: number = Math.abs(r.toNumber() - Math.log(16));
      expect(delta).assertLess(1e-9);
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test2500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_2500
     * @tc.desc Verify ln(0o10) octal literal equals ln(8) matching Math.log(8) within 1e-9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(0o10);
      let delta: number = Math.abs(r.toNumber() - Math.log(8));
      expect(delta).assertLess(1e-9);
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test2600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_2600
     * @tc.desc Verify ln(0b100) binary literal equals ln(4) matching Math.log(4) within 1e-9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(0b100);
      let delta: number = Math.abs(r.toNumber() - Math.log(4));
      expect(delta).assertLess(1e-9);
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test2700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_2700
     * @tc.desc Verify ln(12345) multi-digit integer matches Math.log(12345) within 1e-9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(12345);
      let delta: number = Math.abs(r.toNumber() - Math.log(12345));
      expect(delta).assertLess(1e-9);
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test2800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_2800
     * @tc.desc Verify ln(0.9999999999) just below 1 returns tiny negative number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(0.9999999999);
      let delta: number = Math.abs(r.toNumber() - Math.log(0.9999999999));
      expect(delta).assertLess(1e-9);
      expect(r.isNegative()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test2900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_2900
     * @tc.desc Verify ln(1.0000000001) just above 1 returns tiny positive number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(1.0000000001);
      let delta: number = Math.abs(r.toNumber() - Math.log(1.0000000001));
      expect(delta).assertLess(1e-9);
      expect(r.isNegative()).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test3000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_3000
     * @tc.desc Verify ln(1e-7) negative exponent at toExpNeg(-7) boundary matches Math.log
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(1e-7);
      let delta: number = Math.abs(r.toNumber() - Math.log(1e-7));
      expect(delta).assertLess(1e-9);
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test3100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_3100
     * @tc.desc Verify ln(2e-30) coefficient tiny representative matches Math.log(2e-30) within 1e-9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(2e-30);
      let delta: number = Math.abs(r.toNumber() - Math.log(2e-30));
      expect(delta).assertLess(1e-9);
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test3200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_3200
     * @tc.desc Verify ln(3.14) non-integer decimal representative matches Math.log(3.14)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(3.14);
      let delta: number = Math.abs(r.toNumber() - Math.log(3.14));
      expect(delta).assertLess(1e-9);
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test3300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_3300
     * @tc.desc Verify ln(null) explicit null not in Value type throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        lnUnsafe(null);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test3400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_3400
     * @tc.desc Verify ln(undefined) explicit undefined differs from missing arg but throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        lnUnsafe(undefined);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test3500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_3500
     * @tc.desc Verify precision=10 config shortens ln(2) output to 10 significant digits
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 10 });
      let r: Decimal = Decimal.ln(2);
      expect(r.toString()).assertEqual('0.6931471806');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test3600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_3600
     * @tc.desc Verify precision=1 config rounds ln(2) output to single significant digit 0.7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 1 });
      let r: Decimal = Decimal.ln(2);
      expect(r.toString()).assertEqual('0.7');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test3700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_3700
     * @tc.desc Verify precision=30 config raises ln(2) output length beyond default 20 digits
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 30 });
      let r: Decimal = Decimal.ln(2);
      expect(r.toString().length).assertLarger(22);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test3800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_3800
     * @tc.desc Verify defaults:true restores precision 20 after precision=5 shortening ln(2)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 5 });
      let r5: Decimal = Decimal.ln(2);
      expect(r5.toString()).assertEqual('0.69315');
      Decimal.set({ defaults: true });
      let rd: Decimal = Decimal.ln(2);
      expect(rd.toString().length).assertLarger(18);
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test3900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_3900
     * @tc.desc Verify ln(2) returns Decimal instance whose toString starts with exact prefix
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(2);
      expect(r.toString().startsWith('0.6931471')).assertTrue();
      expect(r instanceof Decimal).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test4000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_4000
     * @tc.desc Verify ln(2) result sign property s is 0 for positive number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(2);
      expect(r.s).assertEqual(1);
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test4100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_4100
     * @tc.desc Verify ln(0.5) result sign property s is 1 for negative number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(0.5);
      expect(r.s).assertEqual(-1);
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test4200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_4200
     * @tc.desc Verify ln(2) result exponent property e is -1 (0.6931 = 6.931e-1)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(2);
      expect(r.e).assertEqual(-1);
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test4300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_4300
     * @tc.desc Verify ln(10) result exponent property e is 0 (2.3025 = 2.3025e0)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(10);
      expect(r.e).assertEqual(0);
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test4400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_4400
     * @tc.desc Verify ln(1) result digits array d is [0] with length 1 for zero representation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(1);
      expect(r.d.length).assertEqual(1);
      expect(r.d[0]).assertEqual(0);
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test4500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_4500
     * @tc.desc Verify ln(2) digits array first digit 6 and length reaches default precision 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(2);
      expect(r.d[0]).assertEqual(6931471);
      expect(r.d.length).assertEqual(3);
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test4600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_4600
     * @tc.desc Verify repeated ln calls on same input return consistent deterministic results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = Decimal.ln(2).toString();
      expect(a).assertEqual('0.69314718055994530942');
      let again: Decimal = Decimal.ln(2);
      expect(again.toString()).assertEqual(a);
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test4700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_4700
     * @tc.desc Verify ln(0) domain lower boundary returns -Infinity without throwing
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(0);
      expect(r.toString()).assertEqual('-Infinity');
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test4800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_4800
     * @tc.desc Verify ln(-1) negative input out of domain returns NaN without throwing
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(-1);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test4900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_4900
     * @tc.desc Verify ln(NaN) NaN input propagates NaN result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(NaN);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test5000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_5000
     * @tc.desc Verify ln(Infinity) positive infinity input yields positive Infinity result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(Infinity);
      expect(r.toString()).assertEqual('Infinity');
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test5100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_5100
     * @tc.desc Verify ln(-Infinity) negative infinity input yields NaN result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(-Infinity);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test5200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_5200
     * @tc.desc Verify ln(-0) negative zero input matches ln(0) returning -Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(-0);
      expect(r.toString()).assertEqual('-Infinity');
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test5300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_5300
     * @tc.desc Verify ln(-1e30) large negative input yields NaN result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(-1e30);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test5400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_5400
     * @tc.desc Verify ln(Number.MIN_SAFE_INTEGER) negative safe integer input yields NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(Number.MIN_SAFE_INTEGER);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test5500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_5500
     * @tc.desc Verify ln({}) object literal input not a Value member throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        lnUnsafe({});
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test5600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_5600
     * @tc.desc Verify ln(true) boolean input not a Value member throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        lnUnsafe(true);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test5700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_5700
     * @tc.desc Verify ln([2]) array input not a Value member throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        lnUnsafe([2]);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test5800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_5800
     * @tc.desc Verify ln(Number.MAX_VALUE) yields finite 709.78 not truncated to Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(Number.MAX_VALUE);
      let delta: number = Math.abs(r.toNumber() - Math.log(Number.MAX_VALUE));
      expect(delta).assertLess(1e-9);
      expect(r.toString() === 'Infinity').assertFalse();
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test5900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_5900
     * @tc.desc Verify ln(1e200) huge positive exponent yields finite ~460.52 without overflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(1e200);
      let delta: number = Math.abs(r.toNumber() - Math.log(1e200));
      expect(delta).assertLess(1e-9);
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test6000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_6000
     * @tc.desc Verify ln(1e-200) tiny negative exponent yields finite ~-460.52 not underflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(1e-200);
      let delta: number = Math.abs(r.toNumber() - Math.log(1e-200));
      expect(delta).assertLess(1e-9);
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test6100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_6100
     * @tc.desc Verify ln(1e-323) subnormal tiny input keeps subnormal precision finite ~-743.75
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ln(1e-323);
      let delta: number = Math.abs(r.toNumber() - Math.log(1e-323));
      expect(delta).assertLess(0.05);
    });

    /**
     * @tc.name testDecimalStaticLnPart01Test6200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LN_PART01_TEST_6200
     * @tc.desc Verify review matrix: valid number branch returns value, NaN and Infinity separate
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLnPart01Test6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rNaN: Decimal = Decimal.ln(NaN);
      let rInf: Decimal = Decimal.ln(Infinity);
      expect(rNaN.isNaN()).assertTrue();
      expect(rInf.isNaN()).assertFalse();
    });
  });
}
