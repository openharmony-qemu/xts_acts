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

function coshUnsafe(...args: ESObject[]): Decimal {
  return Decimal.cosh(args[0] as Value);
}

export default function DecimalStaticCoshPart01Test() {
  describe('DecimalStaticCoshPart01Test', () => {
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
     * @tc.name testDecimalStaticCoshPart01Test0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_0100
     * @tc.desc Verify legal single-argument (standard arity 1) call succeeds with finite Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cosh(1);
      expect(Number.isFinite(r.toNumber())).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_0200
     * @tc.desc Verify missing-argument (0 args) call is rejected with 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        coshUnsafe();
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_0300
     * @tc.desc Verify extra second argument is ignored and cosh(2, 1) still computes cosh(2)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = coshUnsafe(2, 1);
      expect(Math.abs(r.toNumber() - 3.7621956910836314) < 1e-12).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_0400
     * @tc.desc Verify 0 value: cosh(0) exactly returns '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cosh(0).toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_0500
     * @tc.desc Verify -0 value: cosh(-0) returns '1' with positive sign s (no negative result)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cosh(-0);
      expect(r.toString()).assertEqual('1');
      expect(r.s).assertEqual(1);
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_0600
     * @tc.desc Verify 1 value: cosh(1) numeric precision approx 1.5430806348152438
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cosh(1);
      expect(Math.abs(r.toNumber() - 1.5430806348152438) < 1e-12).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test0700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_0700
     * @tc.desc Verify 2 value: cosh(2) numeric precision approx 3.7621956910836314
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cosh(2);
      expect(Math.abs(r.toNumber() - 3.7621956910836314) < 1e-12).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test0800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_0800
     * @tc.desc Verify 0.5 value: cosh(0.5) numeric precision approx 1.1276259652063807
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cosh(0.5);
      expect(Math.abs(r.toNumber() - 1.1276259652063807) < 1e-12).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test0900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_0900
     * @tc.desc Verify 10 value: cosh(10) large finite value approx 11013.232920103324
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cosh(10);
      expect(Math.abs(r.toNumber() - 11013.232920103324) < 1e-9).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test1000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_1000
     * @tc.desc Verify -1 value: cosh(-1) equals cosh(1) (even function symmetry)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = Decimal.cosh(-1).toNumber();
      let b: number = Decimal.cosh(1).toNumber();
      expect(Math.abs(a - b) < 1e-12).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test1100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_1100
     * @tc.desc Verify -2 value: cosh(-2) equals cosh(2) (even function symmetry)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = Decimal.cosh(-2).toNumber();
      let b: number = Decimal.cosh(2).toNumber();
      expect(Math.abs(a - b) < 1e-12).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test1200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_1200
     * @tc.desc Verify -0.5 value: cosh(-0.5) equals cosh(0.5) (even function symmetry)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = Decimal.cosh(-0.5).toNumber();
      let b: number = Decimal.cosh(0.5).toNumber();
      expect(Math.abs(a - b) < 1e-12).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test1300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_1300
     * @tc.desc Verify -10 value: cosh(-10) equals cosh(10) (large-value even symmetry)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = Decimal.cosh(-10).toNumber();
      let b: number = Decimal.cosh(10).toNumber();
      expect(Math.abs(a - b) < 1e-9).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test1400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_1400
     * @tc.desc Verify hex literal 0x10 computes cosh as decimal 16 approx 8886110.520523872
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cosh(0x10);
      expect(Math.abs(r.toNumber() - Math.cosh(16)) < 1e-3).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test1500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_1500
     * @tc.desc Verify scientific 1e-7: cosh result is exactly '1' (tiny value approximation)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cosh(1e-7).toString()).assertEqual('1.000000000000005');
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test1600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_1600
     * @tc.desc Verify scientific -1e-7: cosh result is exactly '1' (tiny negative value)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cosh(-1e-7).toString()).assertEqual('1.000000000000005');
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test1700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_1700
     * @tc.desc Verify scientific 1e-9 tiny value: cosh result is exactly '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cosh(1e-9).toString()).assertEqual('1.0000000000000000005');
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test1800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_1800
     * @tc.desc Verify Number.MIN_VALUE (smallest positive 5e-324): cosh result is exactly '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cosh(Number.MIN_VALUE).toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test1900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_1900
     * @tc.desc Verify Number.EPSILON (2.220446049250313e-16): cosh result is exactly '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cosh(Number.EPSILON).toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test2000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_2000
     * @tc.desc Verify explicit null input is rejected with 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        coshUnsafe(null);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test2100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_2100
     * @tc.desc Verify explicit undefined input is rejected with 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        coshUnsafe(undefined);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test2200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_2200
     * @tc.desc Verify number|undefined typed variable carrying undefined is rejected with 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let v: number | undefined = undefined;
      let apiThrew1_1: boolean = false;
      try {
        coshUnsafe(v);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test2300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_2300
     * @tc.desc Verify number|null typed variable carrying null is rejected with 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let v: number | null = null;
      let apiThrew1_1: boolean = false;
      try {
        coshUnsafe(v);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test2400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_2400
     * @tc.desc Verify Map missing-key get returning undefined is rejected with 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let m: Map<string, number> = new Map<string, number>();
      let v: number | undefined = m.get('absent');
      let apiThrew1_1: boolean = false;
      try {
        coshUnsafe(v);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test2500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_2500
     * @tc.desc Verify null and undefined inputs throw the same error code 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let code1: number = 0;
      let code2: number = 0;
      try {
        coshUnsafe(null);
      } catch (e) {
        code1 = (e as BusinessError).code;
      }
      try {
        coshUnsafe(undefined);
      } catch (e) {
        code2 = (e as BusinessError).code;
      }
      expect(code1).assertEqual(401);
      expect(code2).assertEqual(401);
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test2600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_2600
     * @tc.desc Verify missing-arg (0 args) and explicit undefined throw the same error code 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let code1: number = 0;
      let code2: number = 0;
      try {
        coshUnsafe();
      } catch (e) {
        code1 = (e as BusinessError).code;
      }
      try {
        coshUnsafe(undefined);
      } catch (e) {
        code2 = (e as BusinessError).code;
      }
      expect(code1).assertEqual(401);
      expect(code2).assertEqual(401);
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test2700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_2700
     * @tc.desc Verify cosh returns a Decimal instance (instanceof assertion)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cosh(1);
      expect(r instanceof Decimal).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test2800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_2800
     * @tc.desc Verify idempotency: two calls with same input give identical result strings
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = Decimal.cosh(1).toString();
      let r2: string = Decimal.cosh(1).toString();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test2900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_2900
     * @tc.desc Verify exponent property e of cosh(1) is 0 (1.5430... has 1 integer digit)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cosh(1);
      expect(r.e).assertEqual(0);
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test3000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_3000
     * @tc.desc Verify exponent property e of cosh(10) is 4 (11013 approx 1.1013e4)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cosh(10);
      expect(r.e).assertEqual(4);
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test3100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_3100
     * @tc.desc Verify digit array d of cosh(1) is non-null (significant digits exist)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cosh(1);
      expect(r.d === null).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test3200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_3200
     * @tc.desc Verify sign s of cosh result is always 1 (cosh non-negative for real input)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cosh(0.5);
      expect(r.s).assertEqual(1);
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test3300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_3300
     * @tc.desc Verify cosh(-0).valueOf() returns 1 without leaking -0 (1 / v is Infinity)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.cosh(-0).toNumber();
      expect(v).assertEqual(1);
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test3400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_3400
     * @tc.desc Verify cosh(1) result is not less than 1 (cosh range lower bound)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cosh(1).toNumber() >= 1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test3500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_3500
     * @tc.desc Verify cosh(NaN) propagates NaN with string 'NaN'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cosh(NaN).toString()).assertEqual('NaN');
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test3600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_3600
     * @tc.desc Verify cosh(Infinity) returns 'Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cosh(Infinity).toString()).assertEqual('Infinity');
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test3700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_3700
     * @tc.desc Verify cosh(-Infinity) returns 'Infinity' (negative infinity also propagates)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cosh(-Infinity).toString()).assertEqual('Infinity');
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test3800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_3800
     * @tc.desc Verify sign s of cosh(Infinity) result is 1 (positive infinity)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cosh(Infinity).s).assertEqual(1);
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test3900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_3900
     * @tc.desc Verify digit array d of cosh(NaN) result is null (NaN has no significant digits)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cosh(NaN).d === null).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test4000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_4000
     * @tc.desc Verify 710 input: cosh(710) toNumber is finite large value greater than 1e308
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: number = Decimal.cosh(710).toNumber();
      expect(Number.isFinite(r)).assertTrue();
      expect(r > 1e308).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test4100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_4100
     * @tc.desc Verify 711 input: cosh(711) toNumber overflows to Infinity (beyond double limit)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cosh(711).toNumber()).assertEqual(Infinity);
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test4200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_4200
     * @tc.desc Verify -711 input: cosh(-711) toNumber also overflows to Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cosh(-711).toNumber()).assertEqual(Infinity);
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test4300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_4300
     * @tc.desc Verify boolean true input (non-Value member) is rejected with 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        coshUnsafe(true);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test4400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_4400
     * @tc.desc Verify boolean false input (non-Value member) is rejected with 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        coshUnsafe(false);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test4500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_4500
     * @tc.desc Verify empty array [] input (non-Value member) is rejected with 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        coshUnsafe([]);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test4600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_4600
     * @tc.desc Verify single-element array [1] input (non-Value member) is rejected with 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        coshUnsafe([1]);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test4700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_4700
     * @tc.desc Verify nested array [[]] input (non-Value member) is rejected with 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        coshUnsafe([[]]);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test4800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_4800
     * @tc.desc Verify plain empty object {} input (non-Value member) is rejected with 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        coshUnsafe({});
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test4900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_4900
     * @tc.desc Verify object with property { a: 1 } input (non-Value member) is rejected with 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        coshUnsafe({ a: 1 });
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test5000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_5000
     * @tc.desc Verify Date object input (non-Value member despite valueOf) is rejected with 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        coshUnsafe(new Date());
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test5100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_5100
     * @tc.desc Verify RegExp object input (non-Value member) is rejected with 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        coshUnsafe(/x/);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test5200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_5200
     * @tc.desc Verify function input (non-Value member) is rejected with 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        let _r: Decimal = coshUnsafe((): number => {
        return 0;
        });
        expect().assertFail();
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCoshPart01Test5300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COSH_PART01_TEST_5300
     * @tc.desc Verify returned Decimal from cosh can participate in plus operation (reusable)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCoshPart01Test5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cosh(1).add(1);
      expect(Math.abs(r.toNumber() - 2.5430806348152438) < 1e-12).assertTrue();
    });
  });
}
