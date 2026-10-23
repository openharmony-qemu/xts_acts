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

function cbrtUnsafe(...args: ESObject[]): Decimal {
  return Decimal.cbrt(args[0] as Value);
}

export default function DecimalStaticCbrtPart01Test() {
  describe('DecimalStaticCbrtPart01Test', () => {
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
     * @tc.name testDecimalStaticCbrtPart01Test0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_0100
     * @tc.desc Verify calling cbrt with no argument throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw: boolean = false;
      try {
        cbrtUnsafe();
      } catch (e) {
        threw = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_0200
     * @tc.desc Verify cbrt(27, 5) extra argument is ignored and still returns '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = cbrtUnsafe(27, 5);
      expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_0300
     * @tc.desc Verify cbrt(8) positive integer perfect cube returns '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cbrt(8).toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_0400
     * @tc.desc Verify cbrt(1) identity element returns '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cbrt(1).toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_0500
     * @tc.desc Verify cbrt(0) zero value returns '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cbrt(0).toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_0600
     * @tc.desc Verify cbrt(1000) thousand-level integer cube returns '10'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cbrt(1000).toString()).assertEqual('10');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_0700
     * @tc.desc Verify cbrt(1000000) million-level integer cube returns '100'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cbrt(1000000).toString()).assertEqual('100');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_0800
     * @tc.desc Verify cbrt(0.125) decimal perfect cube returns '0.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cbrt(0.125).toString()).assertEqual('0.5');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_0900
     * @tc.desc Verify cbrt(0.001) one-thousandth cube returns '0.1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cbrt(0.001).toString()).assertEqual('0.1');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_1000
     * @tc.desc Verify cbrt(3.375) cube of 1.5 returns '1.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cbrt(3.375).toString()).assertEqual('1.5');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_1100
     * @tc.desc Verify cbrt(4.913) cube of 1.7 returns '1.7'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cbrt(4.913).toString()).assertEqual('1.7');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_1200
     * @tc.desc Verify cbrt(0.000125) tiny perfect cube returns '0.05'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cbrt(0.000125).toString()).assertEqual('0.05');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_1300
     * @tc.desc Verify cbrt(-27) negative integer perfect cube returns '-3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cbrt(-27).toString()).assertEqual('-3');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_1400
     * @tc.desc Verify cbrt(-8) negative integer perfect cube returns '-2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cbrt(-8).toString()).assertEqual('-2');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_1500
     * @tc.desc Verify cbrt(-1) negative identity element returns '-1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cbrt(-1).toString()).assertEqual('-1');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_1600
     * @tc.desc Verify cbrt(-64) negative integer cube returns '-4'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cbrt(-64).toString()).assertEqual('-4');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_1700
     * @tc.desc Verify cbrt(-0.125) negative decimal cube returns '-0.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cbrt(-0.125).toString()).assertEqual('-0.5');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_1800
     * @tc.desc Verify cbrt(-0.001) negative one-thousandth cube returns '-0.1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cbrt(-0.001).toString()).assertEqual('-0.1');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_1900
     * @tc.desc Verify cbrt(-1000) negative thousand-level cube returns '-10'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cbrt(-1000).toString()).assertEqual('-10');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_2000
     * @tc.desc Verify cbrt(-0.000125) negative tiny cube returns '-0.05'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cbrt(-0.000125).toString()).assertEqual('-0.05');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_2100
     * @tc.desc Verify cbrt(2) non-perfect cube toNumber approximates reference
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.cbrt(2).toNumber();
      expect(Math.abs(v - 1.2599210498948732) < 1e-9).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_2200
     * @tc.desc Verify cbrt(2) toString exact 20-digit precision string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cbrt(2).toString()).assertEqual('1.2599210498948731648');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_2300
     * @tc.desc Verify cbrt(10) non-perfect cube approximate value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.cbrt(10).toNumber();
      expect(Math.abs(v - 2.154434690031884) < 1e-9).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_2400
     * @tc.desc Verify cbrt(0.5) fractional non-perfect cube approximate value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.cbrt(0.5).toNumber();
      expect(Math.abs(v - 0.7937005259840997) < 1e-9).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_2500
     * @tc.desc Verify cbrt(1.5) decimal non-perfect cube approximate value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.cbrt(1.5).toNumber();
      expect(Math.abs(v - 1.1447142425533319) < 1e-9).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_2600
     * @tc.desc Verify cbrt(123456789) large integer non-perfect cube approximate value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.cbrt(123456789).toNumber();
      expect(Math.abs(v - 497.9338592181745) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_2700
     * @tc.desc Verify cbrt(-2) negative non-perfect cube approximate value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.cbrt(-2).toNumber();
      expect(Math.abs(v + 1.2599210498948732) < 1e-9).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_2800
     * @tc.desc Verify cbrt(-0.5) negative fraction non-perfect cube approximate value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.cbrt(-0.5).toNumber();
      expect(Math.abs(v + 0.7937005259840997) < 1e-9).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_2900
     * @tc.desc Verify cbrt(-123456789) negative large integer non-perfect cube approximation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.cbrt(-123456789).toNumber();
      expect(Math.abs(v + 497.9338592181745) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_3000
     * @tc.desc Verify cbrt(1e9) scientific 1e9 returns '1000'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cbrt(1e9).toString()).assertEqual('1000');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_3100
     * @tc.desc Verify cbrt(1e30) large scientific notation returns 1e10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cbrt(1e30).toNumber()).assertEqual(1e10);
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_3200
     * @tc.desc Verify cbrt(1e-18) tiny scientific notation returns 1e-6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cbrt(1e-18).toNumber()).assertEqual(1e-6);
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_3300
     * @tc.desc Verify cbrt(1e-9) scientific notation returns 1e-3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cbrt(1e-9).toNumber()).assertEqual(1e-3);
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_3400
     * @tc.desc Verify cbrt(1e-7) unaligned scientific notation approximate value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.cbrt(1e-7).toNumber();
      expect(Math.abs(v - 0.004641588833612778) < 1e-9).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_3500
     * @tc.desc Verify cbrt(-1e-9) negative scientific notation returns -1e-3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cbrt(-1e-9).toNumber()).assertEqual(-1e-3);
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_3600
     * @tc.desc Verify cbrt(0x10) hex literal 16 cube root approximate value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.cbrt(0x10).toNumber();
      expect(Math.abs(v - 2.5198420997897464) < 1e-9).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_3700
     * @tc.desc Verify cbrt(Number.MAX_VALUE) returns finite positive below 1e200
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.cbrt(Number.MAX_VALUE).toNumber();
      expect(v > 0).assertTrue();
      expect(v < 1e200).assertTrue();
      expect(Number.isFinite(v)).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_3800
     * @tc.desc Verify cbrt(Number.MIN_VALUE) smallest positive cube root is tiny positive
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.cbrt(Number.MIN_VALUE).toNumber();
      expect(v > 0).assertTrue();
      expect(v < 1e-100).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_3900
     * @tc.desc Verify cbrt(Number.EPSILON) machine epsilon cube root is tiny positive
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.cbrt(Number.EPSILON).toNumber();
      expect(v > 0).assertTrue();
      expect(v < 1e-3).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_4000
     * @tc.desc Verify cbrt(Number.MAX_SAFE_INTEGER) safe integer upper cube root about 2.08e5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.cbrt(Number.MAX_SAFE_INTEGER).toNumber();
      expect(Number.isFinite(v)).assertTrue();
      expect(v > 2e5).assertTrue();
      expect(v < 2.1e5).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_4100
     * @tc.desc Verify cbrt(Number.MIN_SAFE_INTEGER) safe integer lower cube root about -2.08e5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.cbrt(Number.MIN_SAFE_INTEGER).toNumber();
      expect(Number.isFinite(v)).assertTrue();
      expect(v < -2e5).assertTrue();
      expect(v > -2.1e5).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_4200
     * @tc.desc Verify cbrt(Infinity) positive infinity propagates as 'Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cbrt(Infinity).toString()).assertEqual('Infinity');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_4300
     * @tc.desc Verify cbrt(-Infinity) negative infinity propagates as '-Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cbrt(-Infinity).toString()).assertEqual('-Infinity');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_4400
     * @tc.desc Verify cbrt(NaN) NaN silently propagates as 'NaN' without throw
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cbrt(NaN).toString()).assertEqual('NaN');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_4500
     * @tc.desc Verify cbrt(-0) keeps negative sign with toString '0' and isNegative true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cbrt(-0);
      expect(r.toString()).assertEqual('0');
      expect(r.isNegative()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_4600
     * @tc.desc Verify cbrt(2.197) cube of 1.3 exactly returns '1.3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cbrt(2.197).toString()).assertEqual('1.3');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_4700
     * @tc.desc Verify cbrt(0.008) cube of 0.2 exactly returns '0.2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cbrt(0.008).toString()).assertEqual('0.2');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_4800
     * @tc.desc Verify cbrt(1.728) cube of 1.2 exactly returns '1.2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cbrt(1.728).toString()).assertEqual('1.2');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_4900
     * @tc.desc Verify cbrt(-0.008) cube of -0.2 exactly returns '-0.2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cbrt(-0.008).toString()).assertEqual('-0.2');
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_5000
     * @tc.desc Verify cbrt returns Decimal instance with toNumber and sign property
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cbrt(8);
      expect(r.toNumber()).assertEqual(2);
      expect(r.s).assertEqual(1);
      expect(typeof r.toString()).assertEqual('string');
      expect(r instanceof Decimal).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_5100
     * @tc.desc Verify cbrt return value supports chained plus operation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.cbrt(27).add(1).toNumber();
      expect(v).assertEqual(4);
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_5200
     * @tc.desc Verify cbrt(27) toString and toNumber results are consistent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cbrt(27);
      expect(r.toString()).assertEqual('3');
      expect(r.toNumber()).assertEqual(3);
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_5300
     * @tc.desc Verify cbrt(null) explicit null input throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw: boolean = false;
      try {
        cbrtUnsafe(null);
      } catch (e) {
        threw = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_5400
     * @tc.desc Verify cbrt(undefined) explicit undefined input throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw: boolean = false;
      try {
        cbrtUnsafe(undefined);
      } catch (e) {
        threw = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_5500
     * @tc.desc Verify cbrt(true) boolean true error type throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw: boolean = false;
      try {
        cbrtUnsafe(true);
      } catch (e) {
        threw = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_5600
     * @tc.desc Verify cbrt(false) boolean false error type throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw: boolean = false;
      try {
        cbrtUnsafe(false);
      } catch (e) {
        threw = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_5700
     * @tc.desc Verify cbrt(new Number(27)) boxed Number object throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw: boolean = false;
      try {
        cbrtUnsafe(new Number(27));
      } catch (e) {
        threw = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCbrtPart01Test0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CBRT_PART01_TEST_5800
     * @tc.desc Verify cbrt(function) function as input error type throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCbrtPart01Test0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: () => number = () => 27;
      let threw: boolean = false;
      try {
        cbrtUnsafe(f);
      } catch (e) {
        threw = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(threw).assertTrue();
    });
  });
}
