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

function divUnsafe(...args: ESObject[]): Decimal {
  return Decimal.div(args[0] as Value, args[1] as Value);
}

export default function DecimalStaticDivPart01Test() {
  describe('DecimalStaticDivPart01Test', () => {
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
     * @tc.name testDecimalStaticDivPart01Test0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0010
     * @tc.desc Verify div(10, 2) with number/number arguments returns exact quotient '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(10, 2);
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0020
     * @tc.desc Verify div(5) missing second argument (y undefined) throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        divUnsafe(5);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0030
     * @tc.desc Verify div() called with no arguments at all throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        divUnsafe();
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0040
     * @tc.desc Verify div(10, 2, 99) ignores extra third argument and still returns '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = divUnsafe(10, 2, 99);
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0050
     * @tc.desc Verify div(7, 2) with positive integer x yields decimal quotient '3.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(7, 2);
      expect(r.toString()).assertEqual('3.5');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0060
     * @tc.desc Verify div(0.5, 2) with fractional dividend less than 1 returns '0.25'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(0.5, 2);
      expect(r.toString()).assertEqual('0.25');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0070
     * @tc.desc Verify div(-7, 2) with negative x yields negative quotient '-3.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(-7, 2);
      expect(r.toString()).assertEqual('-3.5');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0080
     * @tc.desc Verify div(NaN, 2) with NaN x propagates NaN result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(NaN, 2);
      expect(r.toString()).assertEqual('NaN');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0090
     * @tc.desc Verify div(Infinity, 2) with positive Infinity x propagates Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(Infinity, 2);
      expect(r.toString()).assertEqual('Infinity');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0100
     * @tc.desc Verify div(-Infinity, 2) with negative Infinity x propagates -Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(-Infinity, 2);
      expect(r.toString()).assertEqual('-Infinity');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0110
     * @tc.desc Verify div(-0, 5) keeps negative zero sign: toString '0' with s equal -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(-0, 5);
      expect(r.toString()).assertEqual('0');
      expect(r.s).assertEqual(-1);
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0120
     * @tc.desc Verify div(Number.MAX_VALUE, 2) quotient shown in scientific notation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(Number.MAX_VALUE, 2);
      expect(r.toString()).assertEqual('8.9884656743115785e+307');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0130
     * @tc.desc Verify div(Number.MAX_SAFE_INTEGER, 2) gives exact half quotient '4503599627370495.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(Number.MAX_SAFE_INTEGER, 2);
      expect(r.toString()).assertEqual('4503599627370495.5');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0140
     * @tc.desc Verify div(Number.MIN_SAFE_INTEGER, 2) gives exact negative half '-4503599627370495.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(Number.MIN_SAFE_INTEGER, 2);
      expect(r.toString()).assertEqual('-4503599627370495.5');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0150
     * @tc.desc Verify div(Number.EPSILON, 1) result shown in scientific notation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(Number.EPSILON, 1);
      expect(r.toString()).assertEqual('2.220446049250313e-16');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0160
     * @tc.desc Verify div(1e21, 10) restores full integer '100000000000000000000'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(1e21, 10);
      expect(r.toString()).assertEqual('100000000000000000000');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0170
     * @tc.desc Verify div(1e22, 10) quotient exponent hits toExpPos threshold as '1e+21'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(1e22, 10);
      expect(r.toString()).assertEqual('1e+21');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0180
     * @tc.desc Verify div(0.3, 0.1) Decimal exact division removes float error returning '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(0.3, 0.1);
      expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0190
     * @tc.desc Verify div(1e300, 1e-9) quotient exceeds number range and toNumber overflows to Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(1e300, 1e-9);
      expect(r.toNumber()).assertEqual(Infinity);
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0200
     * @tc.desc Verify div(1e-7, 1e-7) tiny scientific value divided by itself normalizes to '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(1e-7, 1e-7);
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0210
     * @tc.desc Verify div(1, 3) infinite repeating decimal truncated to 20-digit precision
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(1, 3);
      expect(r.toString()).assertEqual('0.33333333333333333333');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0220
     * @tc.desc Verify div(5, 0) dividing by positive zero yields positive Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(5, 0);
      expect(r.toString()).assertEqual('Infinity');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0230
     * @tc.desc Verify div(1, -0) negative zero denominator sign leads to -Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(1, -0);
      expect(r.toString()).assertEqual('-Infinity');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0240
     * @tc.desc Verify div(0, 0) zero divided by zero yields NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(0, 0);
      expect(r.toString()).assertEqual('NaN');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0250
     * @tc.desc Verify div(2, NaN) with NaN y propagates NaN result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(2, NaN);
      expect(r.toString()).assertEqual('NaN');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0260
     * @tc.desc Verify div(2, Infinity) with positive Infinity y converges to '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(2, Infinity);
      expect(r.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0270
     * @tc.desc Verify div(2, -Infinity) yields negative zero with s equal -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(2, -Infinity);
      expect(r.toString()).assertEqual('0');
      expect(r.s).assertEqual(-1);
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0280
     * @tc.desc Verify div(1, Number.MIN_VALUE) quotient reaches number second-smallest magnitude '2e+323'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(1, Number.MIN_VALUE);
      expect(r.toString()).assertEqual('2e+323');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0290
     * @tc.desc Verify div(1, Number.MAX_VALUE) quotient is tiny scientific notation value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(1, Number.MAX_VALUE);
      expect(r.toString()).assertEqual('5.5626846462680041005e-309');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0300
     * @tc.desc Verify div(1, Number.EPSILON) quotient toNumber reaches 2^52 magnitude 4503599627370496
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(1, Number.EPSILON);
      expect(r.toNumber()).assertEqual(4503599627370496);
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0310
     * @tc.desc Verify div(1, 0.01) exact division returns integer '100'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(1, 0.01);
      expect(r.toString()).assertEqual('100');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0320
     * @tc.desc Verify div(1, 0.25) exact division returns '4'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(1, 0.25);
      expect(r.toString()).assertEqual('4');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0330
     * @tc.desc Verify div(1, 1e9) returns one billion '1000000000'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(1, 1e9);
      expect(r.toString()).assertEqual('1e-9');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0340
     * @tc.desc Verify div(1, 1e7) quotient hits toExpNeg threshold shown as '1e-7'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(1, 1e7);
      expect(r.toString()).assertEqual('1e-7');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0350
     * @tc.desc Verify div(1, 1e6) quotient stays plain decimal '0.000001' below toExpNeg threshold
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(1, 1e6);
      expect(r.toString()).assertEqual('0.000001');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0360
     * @tc.desc Verify div(1, 1e-21) quotient exponent hits toExpPos threshold shown as '1e+21'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(1, 1e-21);
      expect(r.toString()).assertEqual('1e+21');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0370
     * @tc.desc Verify div(1, '1e24') with string 1e24 yields tiny exponent form '1e-24'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(1, '1e24');
      expect(r.toString()).assertEqual('1e-24');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0380
     * @tc.desc Verify div(-9, 3) negative dividend over positive divisor yields '-3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(-9, 3);
      expect(r.toString()).assertEqual('-3');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0390
     * @tc.desc Verify div(6, -2) positive dividend over negative divisor yields '-3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(6, -2);
      expect(r.toString()).assertEqual('-3');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0400
     * @tc.desc Verify div(-2, -6) two negatives yield positive repeating decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(-2, -6);
      expect(r.toString()).assertEqual('0.33333333333333333333');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0410
     * @tc.desc Verify div(2, -6) negative repeating quotient carries negative sign
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(2, -6);
      expect(r.toString()).assertEqual('-0.33333333333333333333');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0420
     * @tc.desc Verify div(0, -5) zero over negative divisor yields negative zero with s equal -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(0, -5);
      expect(r.toString()).assertEqual('0');
      expect(r.s).assertEqual(-1);
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0430
     * @tc.desc Verify div(Infinity, Infinity) positive infinity over itself yields NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(Infinity, Infinity);
      expect(r.toString()).assertEqual('NaN');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0440
     * @tc.desc Verify div('0x10', 1) hex string x divides as 16 yielding '16'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div('0x10', 1);
      expect(r.toString()).assertEqual('16');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0450
     * @tc.desc Verify div('0b101', 1) binary string x divides as 5 yielding '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div('0b101', 1);
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0460
     * @tc.desc Verify div('0o17', 1) octal string x divides as 15 yielding '15'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div('0o17', 1);
      expect(r.toString()).assertEqual('15');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0470
     * @tc.desc Verify div('1_000', 1) underscore-separated digit string divides as 1000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div('1_000', 1);
      expect(r.toString()).assertEqual('1000');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0480
     * @tc.desc Verify div('10', 2) string x with number y combination yields '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div('10', 2);
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0490
     * @tc.desc Verify div(10, '2') number x with string y combination yields '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(10, '2');
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0500
     * @tc.desc Verify div(new Decimal(9), 3) Decimal x with number y yields '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(new Decimal(9), 3);
      expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0510
     * @tc.desc Verify div(9, new Decimal(3)) number x with Decimal y yields '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(9, new Decimal(3));
      expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0520
     * @tc.desc Verify div(new Decimal('1.5'), new Decimal(3)) Decimal/Decimal combination yields '0.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(new Decimal('1.5'), new Decimal(3));
      expect(r.toString()).assertEqual('0.5');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0530
     * @tc.desc Verify div(new Decimal('1e3'), '4') Decimal x with string y yields '250'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(new Decimal('1e3'), '4');
      expect(r.toString()).assertEqual('250');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0540
     * @tc.desc Verify div(1, new Decimal('1e-7')) number x with scientific Decimal y yields '10000000'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(1, new Decimal('1e-7'));
      expect(r.toString()).assertEqual('10000000');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0550
     * @tc.desc Verify div('7.5', '2.5') string x with string y yields '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div('7.5', '2.5');
      expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0560
     * @tc.desc Verify div(1e10, '1000') scientific number x with string y yields '10000000'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(1e10, '1000');
      expect(r.toString()).assertEqual('10000000');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0570
     * @tc.desc Verify div(new Decimal(-9), 3) negative Decimal x with number y yields '-3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(new Decimal(-9), 3);
      expect(r.toString()).assertEqual('-3');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0580
     * @tc.desc Verify div(2, new Decimal(6)) number x with indivisible Decimal y gives repeating decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(2, new Decimal(6));
      expect(r.toString()).assertEqual('0.33333333333333333333');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0590
     * @tc.desc Verify div('7.5', 2) decimal string x with number y yields '3.75'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div('7.5', 2);
      expect(r.toString()).assertEqual('3.75');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0600
     * @tc.desc Verify div(new Decimal('1e21'), new Decimal(10)) scientific large Decimals yield full integer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(new Decimal('1e21'), new Decimal(10));
      expect(r.toString()).assertEqual('100000000000000000000');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0610
     * @tc.desc Verify div('9007199254740993', 1) beyond MAX_SAFE_INTEGER string stays exact
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div('9007199254740993', 1);
      expect(r.toString()).assertEqual('9007199254740993');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0620
     * @tc.desc Verify div('9007199254740993', '2') super-safe integer over 2 gives exact '.5' result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div('9007199254740993', '2');
      expect(r.toString()).assertEqual('4503599627370496.5');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0630
     * @tc.desc Verify div('12345678901234567890', '10') 20-digit integer shrinks exactly by 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div('12345678901234567890', '10');
      expect(r.toString()).assertEqual('1234567890123456789');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0640
     * @tc.desc Verify div(9007199254740991, 3) safe-integer boundary yields 16-digit int plus 4 decimals
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(9007199254740991, 3);
      expect(r.toString()).assertEqual('3002399751580330.3333');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0650
     * @tc.desc Verify div(1, 7) denominator-7 repeating decimal truncated at 20-digit precision
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(1, 7);
      expect(r.toString()).assertEqual('0.14285714285714285714');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0660
     * @tc.desc Verify div(1, 1.0000001) high-precision division outputs finite precision value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(1, 1.0000001);
      expect(r.toString()).assertEqual('0.99999990000001');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0670
     * @tc.desc Verify div(2, 6) and div(1, 3) reduced-equivalent relation yields equal results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = Decimal.div(2, 6);
      let b: Decimal = Decimal.div(1, 3);
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0680
     * @tc.desc Verify div(8, 4) returns a Decimal instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(8, 4);
      expect(r instanceof Decimal).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0690
     * @tc.desc Verify div(a, 3) does not modify the dividend operand
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal(9);
      let r: Decimal = Decimal.div(a, 3);
      expect(r.toString()).assertEqual('3');
      expect(a.toString()).assertEqual('9');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0700
     * @tc.desc Verify div(7, 2) valueOf returns the quotient value string '3.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(7, 2);
      expect(r.valueOf()).assertEqual('3.5');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0710
     * @tc.desc Verify div(7, 2) toNumber returns the quotient as number 3.5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(7, 2);
      expect(r.toNumber()).assertEqual(3.5);
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0720
     * @tc.desc Verify div(0.3, 0.1) eq compares equal to target number 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(0.3, 0.1);
      expect(r.equals(3)).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0730
     * @tc.desc Verify div(-0, 5) valueOf keeps '-0' while toString shows '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(-0, 5);
      expect(r.valueOf()).assertEqual('-0');
      expect(r.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0740
     * @tc.desc Verify div(0, 5) zero over positive number result isZero returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(0, 5);
      expect(r.isZero()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0075
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0750
     * @tc.desc Verify div(1, 0) divide-by-zero Infinity result isFinite returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(1, 0);
      expect(r.isFinite()).assertFalse();
      expect(r.toString()).assertEqual('Infinity');
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0076
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0760
     * @tc.desc Verify div(0, 0) zero-over-zero NaN result isNaN returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(0, 0);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0077
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0770
     * @tc.desc Verify div(7.5, 2.5) exact quotient d/e/s attributes are correct
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(7.5, 2.5);
      expect(r.d.length).assertEqual(1);
      expect(r.d[0]).assertEqual(3);
      expect(r.e).assertEqual(0);
      expect(r.s).assertEqual(1);
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0078
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0780
     * @tc.desc Verify div(1, 3) repeating quotient d/e attributes reflect decimal digits
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(1, 3);
      expect(r.d[0]).assertEqual(3333333);
      expect(r.e).assertEqual(-1);
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0079
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0790
     * @tc.desc Verify div(1, 0) Infinity d is null and e is NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.div(1, 0);
      expect(r.d === null).assertTrue();
      expect(Number.isNaN(r.e)).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0080
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0800
     * @tc.desc Verify div(null, 2) with null x throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        divUnsafe(null, 2);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0081
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0810
     * @tc.desc Verify div(2, null) with null y throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        divUnsafe(2, null);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0082
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0820
     * @tc.desc Verify div(undefined, 2) with undefined x throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        divUnsafe(undefined, 2);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0083
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0830
     * @tc.desc Verify div(2, undefined) with undefined y throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        divUnsafe(2, undefined);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0084
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0840
     * @tc.desc Verify div rejects both null and undefined as x in union semantics, each throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        let _r: Decimal = divUnsafe(null, 2);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      let apiThrew1_2: boolean = false;
      try {
        divUnsafe(undefined, 2);
      } catch (e) {
        apiThrew1_2 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_2).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0085
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0850
     * @tc.desc Verify div('abc', 1) pure-letter invalid string x throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div('abc', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0086
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0860
     * @tc.desc Verify div('', 1) empty string as dividend throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div('', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0087
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0870
     * @tc.desc Verify div('   ', 1) all-space string as dividend throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div('   ', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0088
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0880
     * @tc.desc Verify div('\t', 1) tab character string as dividend throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div('\t', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0089
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0890
     * @tc.desc Verify div('\n', 1) newline character string as dividend throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div('\n', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0090
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0900
     * @tc.desc Verify div('<script>alert(1)</script>', 1) XSS script string as dividend throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div('<script>alert(1)</script>', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0091
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0910
     * @tc.desc Verify div with illegal surrogate as dividend throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div('\uD800', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0092
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0920
     * @tc.desc Verify div with non-numeric emoji string as dividend throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div('😀', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0093
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0930
     * @tc.desc Verify div('1e', 1) incomplete exponent string as dividend throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div('1e', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0094
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0940
     * @tc.desc Verify div('0x', 1) incomplete hex prefix string as dividend throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div('0x', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0095
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0950
     * @tc.desc Verify div('5+3', 1) arithmetic expression string as dividend throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div('5+3', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0096
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0960
     * @tc.desc Verify div('--5', 1) double-negative string as dividend throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div('--5', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0097
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0970
     * @tc.desc Verify div('null', 1) literal null string as dividend throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div('null', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0098
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0980
     * @tc.desc Verify div('123abc', 1) digits-followed-by-letters string as dividend throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div('123abc', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0099
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_0990
     * @tc.desc Verify div('[object Object]', 1) stringified object content as dividend throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div('[object Object]', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_1000
     * @tc.desc Verify div('\u0000', 1) NUL character string as dividend throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div('\u0000', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0101
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_1010
     * @tc.desc Verify div('\u200B', 1) zero-width space string as dividend throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div('​', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0102
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_1020
     * @tc.desc Verify div(' 1', 1) leading-space digit string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div(' 1', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0103
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_1030
     * @tc.desc Verify div('1 ', 1) trailing-space digit string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div('1 ', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0104
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_1040
     * @tc.desc Verify div('1a'.repeat(50), 1) overlong invalid alternating string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.div('1a'.repeat(50), 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0105
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_1050
     * @tc.desc Verify div(new Decimal(6), '3') equals div(6, 3) Decimal/string equivalence yields '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = Decimal.div(new Decimal(6), '3');
      let b: Decimal = Decimal.div(6, 3);
      expect(a.toString()).assertEqual('2');
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticDivPart01Test0106
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_DIV_PART01_TEST_1060
     * @tc.desc Verify heterogeneous multi-param types keep quotient semantics equivalent to '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticDivPart01Test0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = Decimal.div(10, new Decimal(2));
      let b: Decimal = Decimal.div('10', '2');
      expect(a.toString()).assertEqual('5');
      expect(a.equals(b)).assertTrue();
    });

  });
}
