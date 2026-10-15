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

function asinhUnsafe(...args: ESObject[]): Decimal {
  return Decimal.asinh(args[0] as Value);
}

export default function DecimalStaticAsinhPart01Test() {
  describe('DecimalStaticAsinhPart01Test', () => {
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
     * @tc.name testDecimalStaticAsinhPart01Test0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_0100
     * @tc.desc Verify asinh(50) single number argument returns spec example '4.6052701709914238266'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(50);
      expect(d.toString()).assertEqual('4.6052701709914238266');
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_0200
     * @tc.desc Verify asinh(1, 999, 888) extra number args are ignored matching single-arg result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = Decimal.asinh(1);
      let b: Decimal = asinhUnsafe(1, 999, 888);
      expect(a.toString()).assertEqual(b.toString());
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_0300
     * @tc.desc Verify asinh() missing argument fails parameter check and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        asinhUnsafe();
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_0400
     * @tc.desc Verify asinh(0) returns zero with toString '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(0);
      expect(d.toString()).assertEqual('0');
      expect(d.isZero()).assertTrue();
      expect(d.isNegative()).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_0500
     * @tc.desc Verify asinh(-0) keeps negative zero sign and 1/x is -Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(-0);
      expect(1 / d.toNumber() === -Infinity).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_0600
     * @tc.desc Verify asinh(1) approximates 0.881373587019543 within 1e-6 of Math.asinh(1)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(1);
      expect(Math.abs(d.toNumber() - Math.asinh(1)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_0700
     * @tc.desc Verify asinh(-1) approximates -0.881373587019543 matching Math.asinh(-1)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(-1);
      expect(Math.abs(d.toNumber() - Math.asinh(-1)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_0800
     * @tc.desc Verify asinh(2) approximates 1.4436354751788103
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(2);
      expect(Math.abs(d.toNumber() - Math.asinh(2)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_0900
     * @tc.desc Verify asinh(-2) approximates -1.4436354751788103 with negative symmetry
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(-2);
      expect(Math.abs(d.toNumber() - Math.asinh(-2)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_1000
     * @tc.desc Verify asinh(3) approximates 1.8184464592320668
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(3);
      expect(Math.abs(d.toNumber() - Math.asinh(3)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_1100
     * @tc.desc Verify asinh(10) approximates 2.99822295029797
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(10);
      expect(Math.abs(d.toNumber() - Math.asinh(10)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_1200
     * @tc.desc Verify asinh(0.5) decimal value approximates 0.48121182505960347
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(0.5);
      expect(Math.abs(d.toNumber() - Math.asinh(0.5)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_1300
     * @tc.desc Verify asinh(-0.5) negative decimal approximates -0.48121182505960347
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(-0.5);
      expect(Math.abs(d.toNumber() - Math.asinh(-0.5)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_1400
     * @tc.desc Verify asinh(0.1) small decimal approximates 0.09983407889920763
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(0.1);
      expect(Math.abs(d.toNumber() - Math.asinh(0.1)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_1500
     * @tc.desc Verify asinh(0.01) tiny positive decimal approximates 0.009999833334166665
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(0.01);
      expect(Math.abs(d.toNumber() - Math.asinh(0.01)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_1600
     * @tc.desc Verify asinh(1.5) fractional positive approximates 1.1947632172871094
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(1.5);
      expect(Math.abs(d.toNumber() - Math.asinh(1.5)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_1700
     * @tc.desc Verify asinh(123.456) three-decimal mixed number approximates 5.5094401402202925
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(123.456);
      expect(Math.abs(d.toNumber() - Math.asinh(123.456)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_1800
     * @tc.desc Verify asinh(0.9999999999) just below 1 boundary approximates 0.8813735870209308
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(0.9999999999);
      expect(Math.abs(d.toNumber() - Math.asinh(0.9999999999)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_1900
     * @tc.desc Verify asinh(1.0000000001) just above 1 boundary approximates 0.8813735870190967
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(1.0000000001);
      expect(Math.abs(d.toNumber() - Math.asinh(1.0000000001)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_2000
     * @tc.desc Verify asinh(-0.0000001) tiny negative decimal approximates -1e-7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(-0.0000001);
      expect(Math.abs(d.toNumber() - Math.asinh(-0.0000001)) < 1e-20).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_2100
     * @tc.desc Verify asinh(0.00001) tiny positive decimal approximates 9.999999999999998e-6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(0.00001);
      expect(Math.abs(d.toNumber() - Math.asinh(0.00001)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_2200
     * @tc.desc Verify asinh(7) medium integer approximates 2.644120761058629
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(7);
      expect(Math.abs(d.toNumber() - Math.asinh(7)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_2300
     * @tc.desc Verify asinh(123456789) large integer approximates 19.3239015832078
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(123456789);
      expect(Math.abs(d.toNumber() - Math.asinh(123456789)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_2400
     * @tc.desc Verify asinh(-123456789) negative large integer approximates -19.3239015832078
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(-123456789);
      expect(Math.abs(d.toNumber() - Math.asinh(-123456789)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_2500
     * @tc.desc Verify asinh(9999999999) 1e10 magnitude integer approximates 23.7189981105004
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(9999999999);
      expect(Math.abs(d.toNumber() - Math.asinh(9999999999)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_2600
     * @tc.desc Verify asinh(1000000) 1e6 magnitude approximates 14.508657738524
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(1000000);
      expect(Math.abs(d.toNumber() - Math.asinh(1000000)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_2700
     * @tc.desc Verify asinh(-1000000) negative million approximates -14.508657738524
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(-1000000);
      expect(Math.abs(d.toNumber() - Math.asinh(-1000000)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_2800
     * @tc.desc Verify asinh(Number.MAX_VALUE) largest finite gives finite ~709.78 not Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(Number.MAX_VALUE);
      expect(Math.abs(d.toNumber() - Math.asinh(Number.MAX_VALUE)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_2900
     * @tc.desc Verify asinh(-Number.MAX_VALUE) negative largest finite stays finite ~-709.78
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(-Number.MAX_VALUE);
      expect(Math.abs(d.toNumber() - Math.asinh(-Number.MAX_VALUE)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_3000
     * @tc.desc Verify asinh(Number.MIN_VALUE) smallest subnormal keeps tiny positive not collapsing 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(Number.MIN_VALUE);
      expect(d.isZero()).assertFalse();
      expect(d.isNegative()).assertFalse();
      expect(d.toNumber() > 0).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_3100
     * @tc.desc Verify asinh(-Number.MIN_VALUE) smallest negative subnormal keeps tiny negative
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(-Number.MIN_VALUE);
      expect(d.isNegative()).assertTrue();
      expect(d.toNumber() < 0).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_3200
     * @tc.desc Verify asinh(Number.EPSILON) machine epsilon gives tiny positive near input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(Number.EPSILON);
      expect(d.isZero()).assertFalse();
      expect(d.isNegative()).assertFalse();
      expect(Math.abs(d.toNumber() - Number.EPSILON) < Number.EPSILON).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_3300
     * @tc.desc Verify asinh(-Number.EPSILON) negative machine epsilon gives tiny negative
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(-Number.EPSILON);
      expect(d.isNegative()).assertTrue();
      expect(Math.abs(d.toNumber() + Number.EPSILON) < Number.EPSILON).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_3400
     * @tc.desc Verify asinh(Number.MAX_SAFE_INTEGER) safe integer upper bound approximates 37.42994775023704
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(Number.MAX_SAFE_INTEGER);
      expect(Math.abs(d.toNumber() - Math.asinh(Number.MAX_SAFE_INTEGER)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_3500
     * @tc.desc Verify asinh(Number.MIN_SAFE_INTEGER) safe integer lower bound approximates -37.42994775023704
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(Number.MIN_SAFE_INTEGER);
      expect(Math.abs(d.toNumber() - Math.asinh(Number.MIN_SAFE_INTEGER)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_3600
     * @tc.desc Verify asinh at 2^53 first unsafe integer boundary approximates 37.42994775023705
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(Number.MAX_SAFE_INTEGER + 1);
      expect(Math.abs(d.toNumber() - Math.asinh(Number.MAX_SAFE_INTEGER + 1)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_3700
     * @tc.desc Verify asinh(1e16) beyond safe integer magnitude approximates 37.53450866846468
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(1e16);
      expect(Math.abs(d.toNumber() - Math.asinh(1e16)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_3800
     * @tc.desc Verify asinh(1e308) near max finite keeps finite ~709.1962089052264
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(1e308);
      expect(Math.abs(d.toNumber() - Math.asinh(1e308)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_3900
     * @tc.desc Verify asinh(1e309) literal overflow Infinity propagates result 'Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(1e309);
      expect(d.toString()).assertEqual('Infinity');
      expect(d.isNegative()).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_4000
     * @tc.desc Verify asinh(-1e309) literal overflow -Infinity propagates '-Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(-1e309);
      expect(d.toString()).assertEqual('-Infinity');
      expect(d.isNegative()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_4100
     * @tc.desc Verify asinh(0x10) hex literal 16 approximates 3.464757906675861
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(0x10);
      expect(Math.abs(d.toNumber() - Math.asinh(16)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_4200
     * @tc.desc Verify asinh(0b1010) binary literal 10 approximates 2.99822295029797
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(0b1010);
      expect(Math.abs(d.toNumber() - Math.asinh(10)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_4300
     * @tc.desc Verify asinh(0o17) octal literal 15 approximates 3.4023062384801044
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(0o17);
      expect(Math.abs(d.toNumber() - Math.asinh(15)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_4400
     * @tc.desc Verify asinh(1e-7) tiny scientific value approximates 1e-7 without precision loss
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(1e-7);
      expect(Math.abs(d.toNumber() - Math.asinh(1e-7)) < 1e-20).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_4500
     * @tc.desc Verify asinh(1e-21) extreme tiny scientific keeps non-zero positive
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(1e-21);
      expect(Math.abs(d.toNumber() - Math.asinh(1e-21)) < 1e-30).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_4600
     * @tc.desc Verify asinh(1e21) huge scientific magnitude approximates 49.0615596312433
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(1e21);
      expect(Math.abs(d.toNumber() - Math.asinh(1e21)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_4700
     * @tc.desc Verify asinh(-1e21) negative huge scientific approximates -49.0615596312433
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(-1e21);
      expect(Math.abs(d.toNumber() - Math.asinh(-1e21)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_4800
     * @tc.desc Verify asinh(5e2) scientific 500 approximates 6.907755278982137
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(5e2);
      expect(Math.abs(d.toNumber() - Math.asinh(500)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_4900
     * @tc.desc Verify asinh(undefined) explicit undefined throws 401 separate from null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        asinhUnsafe(undefined);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_5000
     * @tc.desc Verify asinh(null) always throws instead of returning 0, no implicit conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw: boolean = false;
      try {
        asinhUnsafe(null);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_5100
     * @tc.desc Verify asinh(2) returns Decimal instance supporting toString/isNegative methods
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(2);
      expect(d instanceof Decimal).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_5200
     * @tc.desc Verify asinh passes number by value and does not modify original variable
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 2;
      let d: Decimal = Decimal.asinh(x);
      expect(x).assertEqual(2);
      expect(Math.abs(d.toNumber() - Math.asinh(2)) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_5300
     * @tc.desc Verify asinh result can feed Decimal constructor again for further composition
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asinh(2);
      let d: Decimal = new Decimal(r.toString());
      expect(d instanceof Decimal).assertTrue();
      expect(d.toString()).assertEqual(Decimal.asinh(2).toString());
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_5400
     * @tc.desc Verify asinh(NaN) propagates NaN with toString 'NaN'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(NaN);
      expect(d.isNaN()).assertTrue();
      expect(d.toString()).assertEqual('NaN');
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_5500
     * @tc.desc Verify asinh(NaN) propagates NaN silently without throwing
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw: boolean = false;
      try {
        Decimal.asinh(NaN);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
        threw = true;
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_5600
     * @tc.desc Verify asinh(Infinity) propagates Infinity with toString 'Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(Infinity);
      expect(d.toString()).assertEqual('Infinity');
      expect(d.isNegative()).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_5700
     * @tc.desc Verify asinh(-Infinity) propagates -Infinity with toString '-Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.asinh(-Infinity);
      expect(d.toString()).assertEqual('-Infinity');
      expect(d.isNegative()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_5800
     * @tc.desc Verify asinh(true) boolean error type triggers 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        asinhUnsafe(true);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_5900
     * @tc.desc Verify asinh(false) boolean error type triggers 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        asinhUnsafe(false);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_6000
     * @tc.desc Verify asinh({}) plain object error type triggers 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        asinhUnsafe({});
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_6100
     * @tc.desc Verify asinh([]) array error type triggers 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        asinhUnsafe([]);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_6200
     * @tc.desc Verify asinh(new Date()) date object error type triggers 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        asinhUnsafe(new Date());
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinhPart01Test0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASINH_PART01_TEST_6300
     * @tc.desc Verify asinh(/ab+/) RegExp error type triggers 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinhPart01Test0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        asinhUnsafe(/ab+/);
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
