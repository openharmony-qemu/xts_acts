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

function hypotUnsafe(...args: ESObject[]): Decimal {
  return Decimal.hypot(...args as Value[]);
}

export default function DecimalStaticHypotPart01Test() {
  describe('DecimalStaticHypotPart01Test', () => {
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
     * @tc.name testDecimalStaticHypotPart01Test0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_0100
     * @tc.desc Verify hypot() with no argument returns default 0 without throwing
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = hypotUnsafe();
      expect(r.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_0200
     * @tc.desc Verify hypot(-7) single negative number takes absolute value '7'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.hypot(-7);
      expect(r.toString()).assertEqual('7');
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_0300
     * @tc.desc Verify hypot(3, 4) two-arg 3-4-5 pythagorean triple returns '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.hypot(3, 4);
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_0400
     * @tc.desc Verify hypot(2, 3, 4) three-arg high precision result '5.3851648071345040313'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.hypot(2, 3, 4);
      expect(r.toString()).assertEqual('5.3851648071345040313');
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_0500
     * @tc.desc Verify hypot with ten args matches Math.sqrt(645) within 1e-9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.hypot(3, 4, 5, 6, 7, 8, 9, 10, 11, 12);
      expect(Math.abs(r.toNumber() - Math.sqrt(645)) < 1e-9).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_0600
     * @tc.desc Verify hypot spread of 100-element array of ones returns '10'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = Array<number>(100).fill(1);
      let r: Decimal = Decimal.hypot(...arr);
      expect(r.toString()).assertEqual('10');
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test0700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_0700
     * @tc.desc Verify hypot(5, 12) large 5-12-13 pythagorean triple returns '13'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.hypot(5, 12);
      expect(r.toString()).assertEqual('13');
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test0800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_0800
     * @tc.desc Verify hypot(1, 1) equal args return 20-digit precision sqrt(2)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.hypot(1, 1);
      expect(r.toString()).assertEqual('1.4142135623730950488');
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test0900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_0900
     * @tc.desc Verify hypot(0, 0) double zero args return '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.hypot(0, 0);
      expect(r.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test1000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_1000
     * @tc.desc Verify hypot(3, 4, 0) trailing zero arg does not change result '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.hypot(3, 4, 0);
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test1100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_1100
     * @tc.desc Verify hypot(-3, -4) double negative args give positive result '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.hypot(-3, -4);
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test1200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_1200
     * @tc.desc Verify hypot(123.456) single decimal arg keeps decimal representation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.hypot(123.456);
      expect(r.toString()).assertEqual('123.456');
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test1300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_1300
     * @tc.desc Verify hypot(-123456789) large negative toNumber is exact 123456789
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.hypot(-123456789);
      expect(r.toNumber()).assertEqual(123456789);
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test1400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_1400
     * @tc.desc Verify hypot(1e-7) hits toExpNeg boundary with scientific notation '1e-7'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.hypot(1e-7);
      expect(r.toString()).assertEqual('1e-7');
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test1500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_1500
     * @tc.desc Verify hypot(1e-4) below exponent threshold keeps plain decimal '0.0001'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.hypot(1e-4);
      expect(r.toString()).assertEqual('0.0001');
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test1600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_1600
     * @tc.desc Verify hypot(1e20) below toExpPos threshold expands fully to digits
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.hypot(1e20);
      expect(r.toString()).assertEqual('100000000000000000000');
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test1700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_1700
     * @tc.desc Verify hypot(1e21) at toExpPos threshold switches to scientific '1e+21'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.hypot(1e21);
      expect(r.toString()).assertEqual('1e+21');
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test1800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_1800
     * @tc.desc Verify hypot(1e100, 1e100) large pair does not overflow keeping coefficient precision
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.hypot(1e100, 1e100);
      expect(r.toString()).assertEqual('1.4142135623730950488e+100');
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test1900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_1900
     * @tc.desc Verify hypot(100, 100) hundred-scale result with 20-digit precision
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.hypot(100, 100);
      expect(r.toString()).assertEqual('141.42135623730950488');
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test2000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_2000
     * @tc.desc Verify hypot(Number.MAX_SAFE_INTEGER) single arg roundtrips toNumber exactly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.hypot(Number.MAX_SAFE_INTEGER);
      expect(r.toNumber()).assertEqual(9007199254740991);
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test2100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_2100
     * @tc.desc Verify hypot(Number.MIN_SAFE_INTEGER) absolute value returns safe integer upper bound
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.hypot(Number.MIN_SAFE_INTEGER);
      expect(r.toNumber()).assertEqual(9007199254740991);
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test2200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_2200
     * @tc.desc Verify hypot(Number.MAX_VALUE, 0) does not overflow and toNumber stays MAX_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.hypot(Number.MAX_VALUE, 0);
      expect(r.toNumber()).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test2300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_2300
     * @tc.desc Verify hypot(Number.MIN_VALUE, 0) keeps smallest nonzero number 5e-324
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.hypot(Number.MIN_VALUE, 0);
      expect(r.toNumber()).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test2400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_2400
     * @tc.desc Verify hypot(Number.EPSILON, 0) machine epsilon boundary roundtrip
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.hypot(Number.EPSILON, 0);
      expect(r.toNumber()).assertEqual(Number.EPSILON);
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test2500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_2500
     * @tc.desc Verify hypot(0.3, 0.4) decimal conversion gets exact '0.5' unlike Math.hypot
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.hypot(0.3, 0.4);
      expect(r.toString()).assertEqual('0.5');
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test2600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_2600
     * @tc.desc Verify hypot(0.1, 0.2) high precision result matches Math.sqrt(0.05)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.hypot(0.1, 0.2);
      expect(Math.abs(r.toNumber() - Math.sqrt(0.05)) < 1e-15).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test2700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_2700
     * @tc.desc Verify hypot of double MAX_SAFE_INTEGER stays finite within (1.27e16, 1.28e16)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.hypot(9007199254740991, 9007199254740991);
      let n: number = r.toNumber();
      expect(Number.isFinite(n)).assertTrue();
      expect(n > 1.27e16 && n < 1.28e16).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test2800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_2800
     * @tc.desc Verify hypot(1, 1e-10) toNumber rounds to 1 while string stays high precision
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.hypot(1, 1e-10);
      expect(r.toNumber()).assertEqual(1);
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test2900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_2900
     * @tc.desc Verify hypot(-0, 0) result sign is positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.hypot(-0, 0);
      expect(r.toNumber() === 0).assertTrue();
      expect(1 / r.toNumber() === Infinity).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test3000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_3000
     * @tc.desc Verify hypot(3, null) explicit null mixed with valid arg throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let nv: ESObject = null;
      let apiThrew1_1: boolean = false;
      try {
        hypotUnsafe(3, nv);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test3100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_3100
     * @tc.desc Verify hypot(3, undefined) explicit undefined mixed with valid arg throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let uv: ESObject = undefined;
      let apiThrew1_1: boolean = false;
      try {
        hypotUnsafe(3, uv);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test3200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_3200
     * @tc.desc Verify hypot(null) single null argument throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let nv: ESObject = null;
      let apiThrew1_1: boolean = false;
      try {
        hypotUnsafe(nv);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test3300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_3300
     * @tc.desc Verify hypot(undefined, 3) undefined in first position throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let uv: ESObject = undefined;
      let apiThrew1_1: boolean = false;
      try {
        hypotUnsafe(uv, 3);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test3400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_3400
     * @tc.desc Verify hypot(1, 2, null, 4) null in middle position throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let nv: ESObject = null;
      let apiThrew1_1: boolean = false;
      try {
        hypotUnsafe(1, 2, nv, 4);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test3500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_3500
     * @tc.desc Verify hypot(null, null) all null multi-args throw 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let nv: ESObject = null;
      let apiThrew1_1: boolean = false;
      try {
        hypotUnsafe(nv, nv);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test3600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_3600
     * @tc.desc Verify hypot(...[3, 4]) pure number array spread matches direct args result '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [3, 4];
      let r: Decimal = Decimal.hypot(...arr);
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test3700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_3700
     * @tc.desc Verify hypot(...[]) empty array spread equals no-arg call returning '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [];
      let r: Decimal = Decimal.hypot(...arr);
      expect(r.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test3800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_3800
     * @tc.desc Verify hypot(...[0]) single zero element array spread returns '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [0];
      let r: Decimal = Decimal.hypot(...arr);
      expect(r.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test3900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_3900
     * @tc.desc Verify hypot(...[3]) single positive element array spread returns original value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [3];
      let r: Decimal = Decimal.hypot(...arr);
      expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test4000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_4000
     * @tc.desc Verify hypot(...[-3]) single negative element array spread returns absolute value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [-3];
      let r: Decimal = Decimal.hypot(...arr);
      expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test4100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_4100
     * @tc.desc Verify hypot(...[3, 4, 12]) three-element array returns exact result '13'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [3, 4, 12];
      let r: Decimal = Decimal.hypot(...arr);
      expect(r.toString()).assertEqual('13');
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test4200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_4200
     * @tc.desc Verify hypot(...[3, , 4]) sparse array hole spreads to undefined throwing 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let arr: ESObject[] = [3, , 4];
      let apiThrew1_1: boolean = false;
      try {
        hypotUnsafe(...arr);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test4300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_4300
     * @tc.desc Verify hypot(...[3, null, 4]) array containing null element spread throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let arr: ESObject[] = [3, null, 4];
      let apiThrew1_1: boolean = false;
      try {
        hypotUnsafe(...arr);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test4400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_4400
     * @tc.desc Verify hypot(...[3, '4']) heterogeneous number|string array elements join operation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Value[] = [3, '4'];
      let r: Decimal = Decimal.hypot(...arr);
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test4500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_4500
     * @tc.desc Verify hypot(...[new Decimal(3), new Decimal(4)]) pure Decimal element array returns '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Decimal[] = [new Decimal(3), new Decimal(4)];
      let r: Decimal = Decimal.hypot(...arr);
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test4600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_4600
     * @tc.desc Verify hypot(...[3, new Decimal(4)]) number and Decimal mixed array elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Value[] = [3, new Decimal(4)];
      let r: Decimal = Decimal.hypot(...arr);
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test4700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_4700
     * @tc.desc Verify hypot(...[new Decimal(-3), new Decimal(4)]) negative Decimal array gives positive '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Decimal[] = [new Decimal(-3), new Decimal(4)];
      let r: Decimal = Decimal.hypot(...arr);
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test4800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_4800
     * @tc.desc Verify hypot spread of 20 ones returns 20-digit precision sqrt(20)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = Array<number>(20).fill(1);
      let r: Decimal = Decimal.hypot(...arr);
      expect(r.toString()).assertEqual('4.4721359549995793928');
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test4900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_4900
     * @tc.desc Verify hypot(...[1, 2, 3, 4, 5]) five increasing elements give 20-digit sqrt(55)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let r: Decimal = Decimal.hypot(...arr);
      expect(r.toString()).assertEqual('7.4161984870956629487');
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test5000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_5000
     * @tc.desc Verify hypot(...[new Decimal(2), '3', 6]) Decimal|string|number union array returns '7'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Value[] = [new Decimal(2), '3', 6];
      let r: Decimal = Decimal.hypot(...arr);
      expect(r.toString()).assertEqual('7');
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test5100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_5100
     * @tc.desc Verify hypot spread of pseudo-array object is not iterable and throws at runtime
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pseudo: Record<string, ESObject> = { '0': 3, 'length': 1 };
      try {
        hypotUnsafe(...(pseudo as ESObject as Value[]));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test5200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_5200
     * @tc.desc Verify hypot(...[Infinity]) array with Infinity element propagates to Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [Infinity];
      let r: Decimal = Decimal.hypot(...arr);
      expect(r.toNumber()).assertEqual(Infinity);
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test5300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_5300
     * @tc.desc Verify hypot(...[NaN, 3]) array with NaN element propagates to NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [NaN, 3];
      let r: Decimal = Decimal.hypot(...arr);
      expect(isNaN(r.toNumber())).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test5400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_5400
     * @tc.desc Verify hypot(...[3], ...[4]) multiple spread groups merge in one call returning '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number[] = [3];
      let b: number[] = [4];
      let r: Decimal = Decimal.hypot(...a, ...b);
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test5500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_5500
     * @tc.desc Verify hypot(3, 4) return value is a Decimal instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.hypot(3, 4);
      expect(r instanceof Decimal).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test5600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_5600
     * @tc.desc Verify hypot returns new object not sharing input Decimal reference
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(3);
      let r: Decimal = Decimal.hypot(d, 4);
      expect(r === d).assertFalse();
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test5700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_5700
     * @tc.desc Verify hypot(3, 4) valueOf primitive value equals numeric 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.hypot(3, 4);
      expect(r.valueOf()).assertEqual('5');
      expect(r.toNumber()).assertEqual(5);
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test5800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_5800
     * @tc.desc Verify hypot(NaN) single NaN argument propagates result to NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.hypot(NaN);
      expect(isNaN(r.toNumber())).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test5900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_5900
     * @tc.desc Verify hypot(3, NaN) NaN mixed with valid arg propagates to NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.hypot(3, NaN);
      expect(isNaN(r.toNumber())).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test6000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_6000
     * @tc.desc Verify hypot(Infinity) single Infinity argument result is Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.hypot(Infinity);
      expect(r.toNumber()).assertEqual(Infinity);
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test6100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_6100
     * @tc.desc Verify hypot(3, Infinity) Infinity dominates finite args returning Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.hypot(3, Infinity);
      expect(r.toNumber()).assertEqual(Infinity);
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test6200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_6200
     * @tc.desc Verify hypot(Infinity, NaN) Infinity dominates NaN per JS hypot semantics
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.hypot(Infinity, NaN);
      expect(r.toNumber()).assertEqual(Infinity);
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test6300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_6300
     * @tc.desc Verify hypot(MAX_VALUE, MAX_VALUE) toNumber overflows to Infinity while string stays finite
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.hypot(Number.MAX_VALUE, Number.MAX_VALUE);
      expect(r.toNumber()).assertEqual(Infinity);
      expect(r.toString() !== 'Infinity').assertTrue();
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test6400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_6400
     * @tc.desc Verify hypot(3, true) boolean wrong-type argument throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let bad: ESObject = true;
      let apiThrew1_1: boolean = false;
      try {
        hypotUnsafe(3, bad);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test6500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_6500
     * @tc.desc Verify hypot(3, {}) plain object wrong-type argument throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let bad: ESObject = {};
      let apiThrew1_1: boolean = false;
      try {
        hypotUnsafe(3, bad);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test6600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_6600
     * @tc.desc Verify hypot(3, [4]) array object wrong-type argument throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let bad: ESObject = [4];
      let apiThrew1_1: boolean = false;
      try {
        hypotUnsafe(3, bad);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test6700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_6700
     * @tc.desc Verify hypot(3, new Date()) Date object wrong-type argument throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let bad: ESObject = new Date();
      let apiThrew1_1: boolean = false;
      try {
        hypotUnsafe(3, bad);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test6800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_6800
     * @tc.desc Verify hypot(1, 2, /ab/) RegExp object wrong-type argument throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let bad: ESObject = /ab/;
      let apiThrew1_1: boolean = false;
      try {
        hypotUnsafe(1, 2, bad);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test6900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_6900
     * @tc.desc Verify hypot(3, fn) function value wrong-type argument throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        let bad: ESObject = (): number => {
        return 0;
        };
        hypotUnsafe(3, bad);
        expect().assertFail();
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticHypotPart01Test7000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_HYPOT_PART01_TEST_7000
     * @tc.desc Verify hypot(3, new Map<string, number>()) Map object wrong-type argument throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticHypotPart01Test7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let bad: ESObject = new Map<string, number>();
      let apiThrew1_1: boolean = false;
      try {
        hypotUnsafe(3, bad);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });
  });
}
