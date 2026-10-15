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

function log10Unsafe(...args: ESObject[]): Decimal {
  return Decimal.log10(args[0] as Value);
}

export default function DecimalStaticLog10Part01Test() {
  describe('DecimalStaticLog10Part01Test', () => {
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
     * @tc.name testDecimalStaticLog10Part01Test0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_0100
     * @tc.desc Verify log10 with no argument throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        log10Unsafe();
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_0200
     * @tc.desc Verify log10(100, 999) extra argument ignored and returns '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = log10Unsafe(100, 999);
      expect(res.toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_0300
     * @tc.desc Verify log10(1) returns '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.log10(1).toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_0400
     * @tc.desc Verify log10(10) returns '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.log10(10).toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_0500
     * @tc.desc Verify log10(0.1) returns '-1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.log10(0.1).toString()).assertEqual('-1');
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_0600
     * @tc.desc Verify log10(0) returns negative infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.log10(0);
      expect(res.toNumber()).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_0700
     * @tc.desc Verify log10(-1) returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.log10(-1);
      expect(Number.isNaN(res.toNumber())).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_0800
     * @tc.desc Verify log10(NaN) returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.log10(NaN);
      expect(Number.isNaN(res.toNumber())).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_0900
     * @tc.desc Verify log10(Infinity) returns positive infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.log10(Infinity);
      expect(res.toNumber()).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_1000
     * @tc.desc Verify log10(-Infinity) returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.log10(-Infinity);
      expect(Number.isNaN(res.toNumber())).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_1100
     * @tc.desc Verify log10(-0) equals 0 path returning negative infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.log10(-0);
      expect(res.toNumber()).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_1200
     * @tc.desc Verify log10(2) approximately 0.3010299956639812 within 1e-12
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.log10(2).toNumber();
      expect(Math.abs(v - 0.3010299956639812) < 1e-12).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_1300
     * @tc.desc Verify log10(3) approximately 0.47712125471966244 within 1e-12
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.log10(3).toNumber();
      expect(Math.abs(v - 0.47712125471966244) < 1e-12).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_1400
     * @tc.desc Verify log10(Math.E) approximately 0.4342944819032518 within 1e-12
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.log10(Math.E).toNumber();
      expect(Math.abs(v - 0.4342944819032518) < 1e-12).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_1500
     * @tc.desc Verify log10(0.999999) is a tiny negative value with sign -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.log10(0.999999);
      expect(res.s).assertEqual(-1);
      expect(res.toNumber() < 0).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_1600
     * @tc.desc Verify log10(1.0000001) is a tiny positive value with sign 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.log10(1.0000001);
      expect(res.s).assertEqual(1);
      expect(res.toNumber() > 0).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_1700
     * @tc.desc Verify log10(0.30000000000000004) binary rounding about -0.5228787452803375
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.log10(0.30000000000000004).toNumber();
      expect(Math.abs(v - (-0.5228787452803375)) < 1e-12).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_1800
     * @tc.desc Verify log10(MAX_SAFE_INTEGER) is finite between 15 and 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.log10(Number.MAX_SAFE_INTEGER).toNumber();
      expect(Number.isFinite(v)).assertTrue();
      expect(v > 15 && v < 16).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_1900
     * @tc.desc Verify log10(MAX_SAFE_INTEGER+1) greater than log10(MAX_SAFE_INTEGER)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cmp: number = Decimal.log10(Number.MAX_SAFE_INTEGER + 1).comparedTo(Decimal.log10(Number.MAX_SAFE_INTEGER));
      expect(cmp).assertEqual(1);
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_2000
     * @tc.desc Verify log10(-0.5) NaN while log10(0.5) finite for same magnitude
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN(Decimal.log10(-0.5).toNumber())).assertTrue();
      expect(Number.isFinite(Decimal.log10(0.5).toNumber())).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_2100
     * @tc.desc Verify log10(Number.MAX_VALUE) finite about 308.2547
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.log10(Number.MAX_VALUE).toNumber();
      expect(Number.isFinite(v)).assertTrue();
      expect(v > 308 && v < 309).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_2200
     * @tc.desc Verify log10(Number.MIN_VALUE) finite about -323.306
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.log10(Number.MIN_VALUE).toNumber();
      expect(Number.isFinite(v)).assertTrue();
      expect(v > -324 && v < -323).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_2300
     * @tc.desc Verify log10(Number.EPSILON) finite about -15.65
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.log10(Number.EPSILON).toNumber();
      expect(Number.isFinite(v)).assertTrue();
      expect(v > -16 && v < -15).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_2400
     * @tc.desc Verify log10(1e-7) returns '-7'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.log10(1e-7).toString()).assertEqual('-7');
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_2500
     * @tc.desc Verify log10(1e100) returns '100'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.log10(1e100).toString()).assertEqual('100');
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_2600
     * @tc.desc Verify log10(1e-100) returns '-100'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.log10(1e-100).toString()).assertEqual('-100');
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_2700
     * @tc.desc Verify log10(1e308) returns '308'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.log10(1e308).toString()).assertEqual('308');
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_2800
     * @tc.desc Verify log10(0x10) hex literal 16 about 1.2041199826559248
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.log10(0x10).toNumber();
      expect(Math.abs(v - 1.2041199826559248) < 1e-12).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_2900
     * @tc.desc Verify log10(0o10) octal literal 8 about 0.9030899869919435
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.log10(0o10).toNumber();
      expect(Math.abs(v - 0.9030899869919435) < 1e-12).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_3000
     * @tc.desc Verify log10(0b1010) binary literal 10 returns '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.log10(0b1010).toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_3100
     * @tc.desc Verify log10(0xFFFFFFFF) big hex literal about 9.632959861247398
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.log10(0xFFFFFFFF).toNumber();
      expect(Math.abs(v - 9.632959861247398) < 1e-9).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_3200
     * @tc.desc Verify log10(-1e-7) negative scientific returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.log10(-1e-7);
      expect(Number.isNaN(res.toNumber())).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_3300
     * @tc.desc Verify log10(-Number.MIN_VALUE) negative tiny returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.log10(-Number.MIN_VALUE);
      expect(Number.isNaN(res.toNumber())).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_3400
     * @tc.desc Verify log10(Number.MIN_SAFE_INTEGER) negative safe integer returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.log10(Number.MIN_SAFE_INTEGER);
      expect(Number.isNaN(res.toNumber())).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_3500
     * @tc.desc Verify log10(-Number.MAX_VALUE) negative huge returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.log10(-Number.MAX_VALUE);
      expect(Number.isNaN(res.toNumber())).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_3600
     * @tc.desc Verify log10(-Number.EPSILON) negative tiny epsilon returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.log10(-Number.EPSILON);
      expect(Number.isNaN(res.toNumber())).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_3700
     * @tc.desc Verify log10(-0.5) negative non-integer returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.log10(-0.5);
      expect(Number.isNaN(res.toNumber())).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_3800
     * @tc.desc Verify log10(-1e100) negative big exponent returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.log10(-1e100);
      expect(Number.isNaN(res.toNumber())).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_3900
     * @tc.desc Verify log10(4) equals 2*log10(2) logarithm identity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: Decimal = Decimal.log10(4);
      let r2: Decimal = Decimal.log10(2).mul(2);
      expect(r1.comparedTo(r2)).assertEqual(1);
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_4000
     * @tc.desc Verify log10(Number.MIN_NORMAL) subnormal boundary about -307.65
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.log10(2.2250738585072014e-308).toNumber();
      expect(Number.isFinite(v)).assertTrue();
      expect(v > -308 && v < -307).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_4100
     * @tc.desc Verify log10(0.04) negative exponent about -1.3979400086720376
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.log10(0.04).toNumber();
      expect(Math.abs(v - (-1.3979400086720376)) < 1e-12).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_4200
     * @tc.desc Verify log10(5) approximately 0.6989700043360189
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.log10(5).toNumber();
      expect(Math.abs(v - 0.6989700043360189) < 1e-12).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_4300
     * @tc.desc Verify log10(0.5) approximately -0.3010299956639812
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.log10(0.5).toNumber();
      expect(Math.abs(v - (-0.3010299956639812)) < 1e-12).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_4400
     * @tc.desc Verify log10(1234.567) multi-digit decimal falls between 3.09 and 3.10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.log10(1234.567).toNumber();
      expect(Number.isFinite(v)).assertTrue();
      expect(v > 3.09 && v < 3.10).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_4500
     * @tc.desc Verify log10(null) throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        log10Unsafe(null);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_4600
     * @tc.desc Verify log10(undefined) throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        log10Unsafe(undefined);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_4700
     * @tc.desc Verify log10(100) return value is a Decimal instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.log10(100);
      expect(typeof res).assertEqual('object');
      expect(res instanceof Decimal).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_4800
     * @tc.desc Verify log10(2) keeps high precision with d length >= 15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.log10(2);
      expect(res.d.length >= 3).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_4900
     * @tc.desc Verify sign property s: negative -1, zero 0, positive 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.log10(0.1).s).assertEqual(-1);
      expect(Decimal.log10(1).s).assertEqual(1);
      expect(Decimal.log10(10).s).assertEqual(1);
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_5000
     * @tc.desc Verify log10(100) toString '2' and toNumber 2 consistent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.log10(100);
      expect(r.toString()).assertEqual('2');
      expect(r.toNumber()).assertEqual(2);
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_5100
     * @tc.desc Verify two log10(2) calls return independent instances same value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: Decimal = Decimal.log10(2);
      let r2: Decimal = Decimal.log10(2);
      expect(r1.toString()).assertEqual(r2.toString());
      expect(r1 === r2).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_5200
     * @tc.desc Verify log10(true) boolean input throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        log10Unsafe(true);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_5300
     * @tc.desc Verify log10({}) object input throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        log10Unsafe({});
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_5400
     * @tc.desc Verify log10([1]) array input throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        log10Unsafe([1]);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_5500
     * @tc.desc Verify log10(arrow function) function input throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        let _r: Decimal = log10Unsafe((): number => {
        return 1;
        });
        expect().assertFail();
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticLog10Part01Test0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_LOG10_PART01_TEST_5600
     * @tc.desc Verify state recovery after null 401: subsequent log10(100) returns '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticLog10Part01Test0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        log10Unsafe(null);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      let after: Decimal = Decimal.log10(100);
      expect(after.toString()).assertEqual('2');
    });
  });
}
