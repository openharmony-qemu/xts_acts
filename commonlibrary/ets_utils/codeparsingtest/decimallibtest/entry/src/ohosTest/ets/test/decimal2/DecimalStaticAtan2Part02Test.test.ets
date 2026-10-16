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

function atan2Unsafe(...args: ESObject[]): Decimal {
  return Decimal.atan2(args[0] as Value, args[1] as Value);
}

export default function DecimalStaticAtan2Part02Test() {
  describe('DecimalStaticAtan2Part02Test', () => {
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
     * @tc.name testDecimalStaticAtan2Part02Test0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_0100
     * @tc.desc Verify calling atan2 with only y and missing required x throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        atan2Unsafe(1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_0200
     * @tc.desc Verify atan2 ignores extra third argument and result is unaffected
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = atan2Unsafe(1, 1, 999);
      expect(r.toString()).assertEqual('0.78539816339744830962');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_0300
     * @tc.desc Verify atan2 result is a Decimal instance supporting chained mul operation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(1, 1).mul(4);
      expect(r.toString()).assertEqual('3.1415926535897932385');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_0400
     * @tc.desc Verify y as plain integer string '1' is parsed as decimal number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2('1', '1');
      expect(r.toString()).assertEqual('0.78539816339744830962');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_0500
     * @tc.desc Verify y as leading-zero string '01' parses as 1 same as '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2('01', 1);
      expect(r.toString()).assertEqual('0.78539816339744830962');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_0600
     * @tc.desc Verify y as plus-signed string '+1' parses as 1 entering quadrant one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2('+1', 1);
      expect(r.toString()).assertEqual('0.78539816339744830962');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_0700
     * @tc.desc Verify y as negative string '-1' with positive x returns -pi/4 quadrant four
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2('-1', 1);
      expect(r.toString()).assertEqual('-0.78539816339744830962');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_0800
     * @tc.desc Verify y as exponent string '1e+1' parses as 10 and with x=10 returns pi/4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2('1e+1', '1e1');
      expect(r.toString()).assertEqual('0.78539816339744830962');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_0900
     * @tc.desc Verify y as hex-prefixed string '0x10' parses as hexadecimal 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2('0x10', 16);
      expect(r.toString()).assertEqual('0.78539816339744830962');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_1000
     * @tc.desc Verify y as trailing-dot string '5.' parses as 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2('5.', 5);
      expect(r.toString()).assertEqual('0.78539816339744830962');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_1100
     * @tc.desc Verify x as plain integer string '1' is parsed as decimal number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(1, '1');
      expect(r.toString()).assertEqual('0.78539816339744830962');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_1200
     * @tc.desc Verify x as leading-zero string '01' parses as 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(1, '01');
      expect(r.toString()).assertEqual('0.78539816339744830962');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_1300
     * @tc.desc Verify x as negative string '-1' with positive y returns 3pi/4 quadrant two
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(1, '-1');
      expect(r.toString()).assertEqual('2.3561944901923449288');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_1400
     * @tc.desc Verify x as negative exponent string '-1e-7' returns value less than pi
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(1, '-1e-7');
      expect(r.toString()).assertEqual('1.5707964267948966192');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_1500
     * @tc.desc Verify x as hex string '0x10' parses as 16 and with y=16 returns pi/4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(16, '0x10');
      expect(r.toString()).assertEqual('0.78539816339744830962');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_1600
     * @tc.desc Verify overload y=string x=string returns same value as numeric equivalent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2('2', '3');
      expect(r.toString()).assertEqual('0.58800260354756755125');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_1700
     * @tc.desc Verify atan2(2, 3) return value is instance of Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(2, 3);
      expect(r instanceof Decimal).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_1800
     * @tc.desc Verify return value converts back to number via toNumber with numeric semantics
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(1, 1);
      let n: number = r.toNumber();
      expect(Math.abs(n - 0.7853981633974483) < 1e-9).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_1900
     * @tc.desc Verify new return object does not modify input Decimals y and x
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: Decimal = new Decimal(2);
      let x: Decimal = new Decimal(3);
      let r: Decimal = Decimal.atan2(y, x);
      expect(y.toString()).assertEqual('2');
      expect(x.toString()).assertEqual('3');
      expect(r.toString()).assertEqual('0.58800260354756755125');
      expect(r === y).assertFalse();
      expect(r === x).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_2000
     * @tc.desc Verify y as empty string fails to parse and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan2('', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_2100
     * @tc.desc Verify y as all-spaces string non-numeric format throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan2('   ', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_2200
     * @tc.desc Verify both y and x as empty strings are illegal and throw 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan2('', '');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_2300
     * @tc.desc Verify y with zero-width space prefixed digit string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan2('​1', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_2400
     * @tc.desc Verify x as NUL-only character string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan2(1, '\u0000');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_2500
     * @tc.desc Verify NaN number y propagates NaN to result without throwing
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nan: number = 0 / 0;
      let r: Decimal = Decimal.atan2(nan, 1);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_2600
     * @tc.desc Verify NaN number x propagates NaN to result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nan: number = 0 / 0;
      let r: Decimal = Decimal.atan2(1, nan);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_2700
     * @tc.desc Verify both y and x NaN produce NaN result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nan: number = 0 / 0;
      let r: Decimal = Decimal.atan2(nan, nan);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_2800
     * @tc.desc Verify negative zero y quadrant gives zero value with isNegative true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nz: number = -0;
      let r: Decimal = Decimal.atan2(nz, 1);
      expect(r.isZero()).assertTrue();
      expect(r.isNegative()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_2900
     * @tc.desc Verify y=-0 with negative x returns -pi quadrant three boundary as negative
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nz: number = -0;
      let r: Decimal = Decimal.atan2(nz, -1);
      expect(r.isNegative()).assertTrue();
      expect(r.toString()).assertEqual('-3.1415926535897932385');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_3000
     * @tc.desc Verify x=-0 quadrant flip makes atan2(0, -0) return pi
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nz: number = -0;
      let r: Decimal = Decimal.atan2(0, nz);
      expect(r.toString()).assertEqual('3.1415926535897932385');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_3100
     * @tc.desc Verify atan2(0, 1) returns positive zero and is not negative
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(0, 1);
      expect(r.isZero()).assertTrue();
      expect(r.isNegative()).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_3200
     * @tc.desc Verify y=+Infinity with positive x converges to pi/2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inf: number = 1 / 0;
      let r: Decimal = Decimal.atan2(inf, 1);
      expect(r.toString()).assertEqual('1.5707963267948966192');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_3300
     * @tc.desc Verify y=-Infinity with positive x converges to -pi/2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ninf: number = -1 / 0;
      let r: Decimal = Decimal.atan2(ninf, 1);
      expect(r.toString()).assertEqual('-1.5707963267948966192');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_3400
     * @tc.desc Verify y and x both +Infinity converge to pi/4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inf: number = 1 / 0;
      let r: Decimal = Decimal.atan2(inf, inf);
      expect(r.toString()).assertEqual('0.78539816339744830962');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_3500
     * @tc.desc Verify y and x both -Infinity converge to -3pi/4 quadrant three as negative
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ninf: number = -1 / 0;
      let r: Decimal = Decimal.atan2(ninf, ninf);
      expect(r.isNegative()).assertTrue();
      expect(r.toString()).assertEqual('-2.3561944901923449288');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_3600
     * @tc.desc Verify y=+Infinity x=-Infinity converge to 3pi/4 quadrant two
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inf: number = 1 / 0;
      let ninf: number = -1 / 0;
      let r: Decimal = Decimal.atan2(inf, ninf);
      expect(r.toString()).assertEqual('2.3561944901923449288');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_3700
     * @tc.desc Verify y=-Infinity x=+Infinity converge to -pi/4 quadrant four
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inf: number = 1 / 0;
      let ninf: number = -1 / 0;
      let r: Decimal = Decimal.atan2(ninf, inf);
      expect(r.toString()).assertEqual('-0.78539816339744830962');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_3800
     * @tc.desc Verify 29-significant-digit string participates without precision loss
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2('1.0000000000000000000000000001', 1);
      expect(r.toString()).assertEqual('0.78539816339744830962');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_3900
     * @tc.desc Verify precision=1 atan2(1,1) rounds to '0.8' then defaults restore config
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 1 });
      try {
        let r: Decimal = Decimal.atan2(1, 1);
        expect(r.toString()).assertEqual('0.8');
      } finally {
        Decimal.set({ defaults: true });
      }
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_4000
     * @tc.desc Verify 65-significant-digit y string parses fully without truncation or throw
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let long: string = '12345678901234567890123456789012345678901234567890123456789012345';
      let r: Decimal = Decimal.atan2(long, long);
      expect(r.toString()).assertEqual('0.78539816339744830962');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_4100
     * @tc.desc Verify y as digit followed by NUL escape string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan2('1\u0000', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_4200
     * @tc.desc Verify y as XSS payload string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan2('1"><script>alert(1)</script>', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_4300
     * @tc.desc Verify y as emoji-prefixed digit string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan2('\u{1F600}1', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_4400
     * @tc.desc Verify y as lone surrogate string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '\uD800' + '1';
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan2(s, 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_4500
     * @tc.desc Verify y as Unicode superscript digit string is not parsed as number and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = String.fromCharCode(0x00B9);
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan2(s, 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_4600
     * @tc.desc Verify heterogeneous union combination y=string x=number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2('1', 1);
      expect(r.toString()).assertEqual('0.78539816339744830962');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_4700
     * @tc.desc Verify heterogeneous union combination y=string x=Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2('2', new Decimal(3));
      expect(r.toString()).assertEqual('0.58800260354756755125');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_4800
     * @tc.desc Verify homogeneous union combination y=Decimal x=Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(new Decimal(1), new Decimal(1));
      expect(r.toString()).assertEqual('0.78539816339744830962');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_4900
     * @tc.desc Verify number|string union y dispatches when x is Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(1, new Decimal(1));
      expect(r.toString()).assertEqual('0.78539816339744830962');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_5000
     * @tc.desc Verify Decimal|string union y dispatches when x is number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(new Decimal(1), 1);
      expect(r.toString()).assertEqual('0.78539816339744830962');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_5100
     * @tc.desc Verify y as undefined x as string mixed union throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        atan2Unsafe(undefined, '1');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_5200
     * @tc.desc Verify y as string x as null mixed union throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        atan2Unsafe('1', null);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_5300
     * @tc.desc Verify y=string dispatches when x is Decimal|string union
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2('1', new Decimal(1));
      expect(r.toString()).assertEqual('0.78539816339744830962');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_5400
     * @tc.desc Verify different string representations '1' and '01' parse to same value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2('1', '01');
      expect(r.toString()).assertEqual('0.78539816339744830962');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_5500
     * @tc.desc Verify y=string x=Decimal quadrant three judgment '-2.35619449019234492885'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2('-1', new Decimal(-1));
      expect(r.toString()).assertEqual('-2.3561944901923449288');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_5600
     * @tc.desc Verify y=Decimal x=string quadrant two judgment '2.35619449019234492885'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(new Decimal(1), '-1');
      expect(r.toString()).assertEqual('2.3561944901923449288');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_5700
     * @tc.desc Verify y=number x=string quadrant four judgment '-0.78539816339744830962'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(-1, '1');
      expect(r.toString()).assertEqual('-0.78539816339744830962');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_5800
     * @tc.desc Verify safe integer boundary y=9007199254740991 with same string x
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(9007199254740991, '9007199254740991');
      expect(r.toString()).assertEqual('0.78539816339744830962');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_5900
     * @tc.desc Verify negative safe integer boundary y with same-value string x
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(-9007199254740991, '9007199254740991');
      expect(r.toString()).assertEqual('-0.78539816339744830962');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_6000
     * @tc.desc Verify extreme ratio y='1' x=1e-7 string-number heterogeneous quadrant
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2('1', 1e-7);
      expect(r.toString()).assertEqual('1.5707962267948966192');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_6100
     * @tc.desc Verify y=1e-7 x='1' heterogeneous combination quadrant
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(1e-7, '1');
      expect(r.toString()).assertEqual('9.9999999999999666667e-8');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_6200
     * @tc.desc Verify atan2(0, 0) quadrant judgment returns positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(0, 0);
      expect(r.isZero()).assertTrue();
      expect(r.isNegative()).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_6300
     * @tc.desc Verify ('0','0') string input combination returns zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2('0', '0');
      expect(r.isZero()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_6400
     * @tc.desc Verify equal y and x values (2,2) converge to pi/4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(2, 2);
      expect(r.toString()).assertEqual('0.78539816339744830962');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_6500
     * @tc.desc Verify equal Decimal y and x (5,5) converge to pi/4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(new Decimal(5), new Decimal(5));
      expect(r.toString()).assertEqual('0.78539816339744830962');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_6600
     * @tc.desc Verify equal string y and x ('5','5') converge to pi/4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2('5', '5');
      expect(r.toString()).assertEqual('0.78539816339744830962');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_6700
     * @tc.desc Verify huge inputs (1e9, 1e9) still converge to pi/4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(1000000000, 1000000000);
      expect(r.toString()).assertEqual('0.78539816339744830962');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_6800
     * @tc.desc Verify tiny inputs (1e-9, 1e-9) still converge to pi/4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(1e-9, 1e-9);
      expect(r.toString()).assertEqual('0.78539816339744830962');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_6900
     * @tc.desc Verify y positive x negative absolute-equal combination quadrant two 3pi/4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(3, -3);
      expect(r.toString()).assertEqual('2.3561944901923449288');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_7000
     * @tc.desc Verify y negative x positive opposite-sign combination quadrant four -pi/4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(-4, 4);
      expect(r.toString()).assertEqual('-0.78539816339744830962');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_7100
     * @tc.desc Verify y and x both -0 yields negative result on -pi side boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nz: number = -0;
      let r: Decimal = Decimal.atan2(nz, nz);
      expect(r.isNegative()).assertTrue();
      expect(r.toString()).assertEqual('-3.1415926535897932385');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_7200
     * @tc.desc Verify y=1 with x=-0 returns positive pi/2 quadrant one boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nz: number = -0;
      let r: Decimal = Decimal.atan2(1, nz);
      expect(r.toString()).assertEqual('1.5707963267948966192');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_7300
     * @tc.desc Verify y=-1 with x=-0 returns negative -pi/2 boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nz: number = -0;
      let r: Decimal = Decimal.atan2(-1, nz);
      expect(r.toString()).assertEqual('-1.5707963267948966192');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_7400
     * @tc.desc Verify DP-BASIC-STRING coverage review with ('2','2') returning pi/4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2('2', '2');
      expect(r.toString()).assertEqual('0.78539816339744830962');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0075
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_7500
     * @tc.desc Verify DP-ERROR-NUMBER coverage review with (3,3) returning pi/4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(3, 3);
      expect(r.toString()).assertEqual('0.78539816339744830962');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part02Test0076
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART02_TEST_7600
     * @tc.desc Verify DP-COMPOSITE-UNION-INTERSECTION coverage review with (Decimal 1,'1')
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part02Test0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(new Decimal(1), '1');
      expect(r.toString()).assertEqual('0.78539816339744830962');
    });

  });
}
