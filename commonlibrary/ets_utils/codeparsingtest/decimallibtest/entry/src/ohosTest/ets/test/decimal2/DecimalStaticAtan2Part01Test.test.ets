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

function atan2Unsafe(...args: ESObject[]): Decimal {
  return Decimal.atan2(args[0] as Value, args[1] as Value);
}

class IllegalUnionMember {
  flag: boolean = false;
}

export default function DecimalStaticAtan2Part01Test() {
  describe('DecimalStaticAtan2Part01Test', () => {
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
     * @tc.name testDecimalStaticAtan2Part01Test0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_0100
     * @tc.desc Verify calling atan2 with no arguments throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        atan2Unsafe();
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_0200
     * @tc.desc Verify calling atan2 with only y and missing x throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        atan2Unsafe(2);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_0300
     * @tc.desc Verify atan2(2, 3) normal two-argument arity returns quadrant one example value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(2, 3);
      expect(r.toString()).assertEqual('0.58800260354756755125');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_0400
     * @tc.desc Verify atan2 with both y and x as Decimal instances returns same example value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(new Decimal(2), new Decimal(3));
      expect(r.toString()).assertEqual('0.58800260354756755125');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_0500
     * @tc.desc Verify atan2(0, 5) on positive x axis returns '0' and is not negative
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(0, 5);
      expect(r.toString()).assertEqual('0');
      expect(r.isNegative()).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_0600
     * @tc.desc Verify atan2(-0, 5) keeps negative zero: isNegative true and valueOf '-0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(-0, 5);
      expect(r.isNegative()).assertTrue();
      expect(r.valueOf()).assertEqual('-0');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_0700
     * @tc.desc Verify atan2(1, 0) on positive y axis returns pi/2 '1.5707963267948966192'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(1, 0);
      expect(r.toString()).assertEqual('1.5707963267948966192');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_0800
     * @tc.desc Verify atan2(-1, 0) on negative y axis returns -pi/2 '-1.5707963267948966192'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(-1, 0);
      expect(r.toString()).assertEqual('-1.5707963267948966192');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_0900
     * @tc.desc Verify atan2(1, 1) on diagonal returns pi/4 '0.78539816339744830962'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(1, 1);
      expect(r.toString()).assertEqual('0.78539816339744830962');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_1000
     * @tc.desc Verify atan2(-1, 1) in quadrant four returns -pi/4 '-0.78539816339744830962'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(-1, 1);
      expect(r.toString()).assertEqual('-0.78539816339744830962');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_1100
     * @tc.desc Verify atan2(1, -1) in quadrant two returns 3pi/4 '2.3561944901923449288'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(1, -1);
      expect(r.toString()).assertEqual('2.3561944901923449288');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_1200
     * @tc.desc Verify atan2(-1, -1) in quadrant three returns -3pi/4 '-2.3561944901923449288'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(-1, -1);
      expect(r.toString()).assertEqual('-2.3561944901923449288');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_1300
     * @tc.desc Verify atan2(3, 4) pythagorean pair returns arctan(3/4) '0.6435011087932843868'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(3, 4);
      expect(r.toString()).assertEqual('0.6435011087932843868');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_1400
     * @tc.desc Verify atan2(3, 4) and atan2(6, 8) preserve the angle under positive scaling
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const baseline: Decimal = Decimal.atan2(3, 4);
      const baselineValue: string = baseline.toString();
      const scaled: Decimal = Decimal.atan2(6, 8);
      const scaledValue: string = scaled.toString();
      expect(baselineValue).assertEqual('0.6435011087932843868');
      expect(scaledValue).assertEqual(baselineValue);
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_1500
     * @tc.desc Verify atan2(-0.75, 1) negative decimal y in quadrant four returns '-0.6435011087932843868'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(-0.75, 1);
      expect(r.toString()).assertEqual('-0.6435011087932843868');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_1600
     * @tc.desc Verify atan2(1e100, 1) with huge y approaches pi/2 without exceeding it
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(1e100, 1);
      expect(r.toString()).assertEqual('1.5707963267948966192');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_1700
     * @tc.desc Verify atan2(1, 1e100) with huge x approaches 0 output in exponential form '1e-100'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(1, 1e100);
      expect(r.toString()).assertEqual('1e-100');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_1800
     * @tc.desc Verify atan2(Number.MIN_VALUE, 1) tiny positive y returns itself '5e-324'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(Number.MIN_VALUE, 1);
      expect(r.toString()).assertEqual('5e-324');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_1900
     * @tc.desc Verify atan2(Number.MAX_VALUE, 1) with huge y returns pi/2 precision value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(Number.MAX_VALUE, 1);
      expect(r.toString()).assertEqual('1.5707963267948966192');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_2000
     * @tc.desc Verify atan2(Number.EPSILON, 1) small y in linear region returns '2.220446049250313e-16'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(Number.EPSILON, 1);
      expect(r.toString()).assertEqual('2.220446049250313e-16');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_2100
     * @tc.desc Verify atan2(Number.MAX_SAFE_INTEGER, 1) near pi/2 returns '1.5707963267948965082'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(Number.MAX_SAFE_INTEGER, 1);
      expect(r.toString()).assertEqual('1.5707963267948965082');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_2200
     * @tc.desc Verify atan2(Number.MIN_SAFE_INTEGER, 1) near -pi/2 returns '-1.5707963267948965082'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(Number.MIN_SAFE_INTEGER, 1);
      expect(r.toString()).assertEqual('-1.5707963267948965082');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_2300
     * @tc.desc Verify atan2(9e15, 1) large number within config bounds returns '1.5707963267948965081'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(9e15, 1);
      expect(r.toString()).assertEqual('1.5707963267948965081');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_2400
     * @tc.desc Verify atan2(1e-7, 1) scientific literal small y returns '9.9999999999999666667e-8'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(1e-7, 1);
      expect(r.toString()).assertEqual('9.9999999999999666667e-8');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_2500
     * @tc.desc Verify atan2(0x10, 1) hexadecimal literal y parsed as decimal 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(0x10, 1);
      expect(r.toString()).assertEqual('1.5083775167989392708');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_2600
     * @tc.desc Verify atan2(123.45, 1) arbitrary decimal y close to pi/2 returns '1.5626960584396500821'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(123.45, 1);
      expect(r.toString()).assertEqual('1.5626960584396500821');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_2700
     * @tc.desc Verify atan2(0, -1) on negative x axis returns upper range boundary pi
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(0, -1);
      expect(r.toString()).assertEqual('3.1415926535897932385');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_2800
     * @tc.desc Verify atan2(1, 2) quadrant one steep slope returns arctan(1/2)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(1, 2);
      expect(r.toString()).assertEqual('0.46364760900080611621');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_2900
     * @tc.desc Verify atan2(1, 0.5) quadrant one gentle slope returns arctan(2)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(1, 0.5);
      expect(r.toString()).assertEqual('1.107148717794090503');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_3000
     * @tc.desc Verify atan2(1, 123.45) very small ratio returns '0.0081002683552465371282'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(1, 123.45);
      expect(r.toString()).assertEqual('0.0081002683552465371282');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_3100
     * @tc.desc Verify atan2(1, Number.MIN_VALUE) x underflow like x=0 returns pi/2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(1, Number.MIN_VALUE);
      expect(r.toString()).assertEqual('1.5707963267948966192');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_3200
     * @tc.desc Verify atan2(1, Number.MAX_VALUE) with huge x returns tiny exponential '5.5626846462680041005e-309'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(1, Number.MAX_VALUE);
      expect(r.toString()).assertEqual('5.5626846462680041005e-309');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_3300
     * @tc.desc Verify atan2(1, Number.EPSILON) tiny x approaches pi/2 '1.5707963267948963972'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(1, Number.EPSILON);
      expect(r.toString()).assertEqual('1.5707963267948963972');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_3400
     * @tc.desc Verify atan2(1, 1e-7) tiny x approaches pi/2 observable as '1.5707962267948966192'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(1, 1e-7);
      expect(r.toString()).assertEqual('1.5707962267948966192');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_3500
     * @tc.desc Verify atan2(1, 0x10) hexadecimal x parsed as 16 returns arctan(1/16)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(1, 0x10);
      expect(r.toString()).assertEqual('0.062418809995957348474');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_3600
     * @tc.desc Verify atan2(1, 9e15) huge x returns tiny exponential '1.1111111111111111111e-16'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(1, 9e15);
      expect(r.toString()).assertEqual('1.1111111111111111111e-16');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_3700
     * @tc.desc Verify atan2('2', 3) decimal string y matches number input result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2('2', 3);
      expect(r.toString()).assertEqual('0.58800260354756755125');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_3800
     * @tc.desc Verify atan2('-3', 4) negative numeric string y returns '-0.6435011087932843868'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2('-3', 4);
      expect(r.toString()).assertEqual('-0.6435011087932843868');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_3900
     * @tc.desc Verify atan2('+2', 3) plus-signed string y matches unsigned result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2('+2', 3);
      expect(r.toString()).assertEqual('0.58800260354756755125');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_4000
     * @tc.desc Verify atan2('1e-7', 1) scientific string y outputs exponential '9.9999999999999666667e-8'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2('1e-7', 1);
      expect(r.toString()).assertEqual('9.9999999999999666667e-8');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_4100
     * @tc.desc Verify atan2('1e19', 1) exponent string y approaches pi/2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2('1e19', 1);
      expect(r.toString()).assertEqual('1.5707963267948966191');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_4200
     * @tc.desc Verify atan2('0', 5) string zero y returns '0' without negative sign
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2('0', 5);
      expect(r.toString()).assertEqual('0');
      expect(r.isNegative()).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_4300
     * @tc.desc Verify atan2('abc', 1) invalid numeric string y throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan2('abc', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_4400
     * @tc.desc Verify atan2('1.2.3', 1) malformed multi-dot string y throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan2('1.2.3', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_4500
     * @tc.desc Verify atan2('0x10', 1) hex string y parses as 16 returning atan(16) value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2('0x10', 1);
      expect(r.toString()).assertEqual('1.5083775167989392708');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_4600
     * @tc.desc Verify atan2('1e', 1) incomplete exponent string y throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan2('1e', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_4700
     * @tc.desc Verify atan2(2, '3') decimal string x matches number input result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(2, '3');
      expect(r.toString()).assertEqual('0.58800260354756755125');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_4800
     * @tc.desc Verify atan2(2, '-3') negative string x enters quadrant two '2.5535900500422256872'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(2, '-3');
      expect(r.toString()).assertEqual('2.5535900500422256872');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_4900
     * @tc.desc Verify atan2(2, '+3') plus-signed string x matches unsigned result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(2, '+3');
      expect(r.toString()).assertEqual('0.58800260354756755125');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_5000
     * @tc.desc Verify atan2(1, '1e-7') scientific string x approaches pi/2 '1.5707962267948966192'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(1, '1e-7');
      expect(r.toString()).assertEqual('1.5707962267948966192');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_5100
     * @tc.desc Verify atan2(1, '0') string zero x returns pi/2 positive y axis boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(1, '0');
      expect(r.toString()).assertEqual('1.5707963267948966192');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_5200
     * @tc.desc Verify atan2(1, 'abc') invalid numeric string x throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan2(1, 'abc');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_5300
     * @tc.desc Verify atan2(1, '--3') double-dash invalid string x throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan2(1, '--3');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_5400
     * @tc.desc Verify atan2(1, '3e') incomplete exponent string x throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan2(1, '3e');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_5500
     * @tc.desc Verify atan2(null, 1) explicit null y throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        atan2Unsafe(null, 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_5600
     * @tc.desc Verify atan2(undefined, 1) explicit undefined y throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        atan2Unsafe(undefined, 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_5700
     * @tc.desc Verify atan2({}, 1) plain object literal y throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        atan2Unsafe({}, 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_5800
     * @tc.desc Verify atan2(true, 1) boolean y throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        atan2Unsafe(true, 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_5900
     * @tc.desc Verify atan2 with custom class instance y non-Value member throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        atan2Unsafe(new IllegalUnionMember(), 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_6000
     * @tc.desc Verify atan2(function, 1) function object y throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        let fn: () => number = (): number => 2;
        atan2Unsafe(fn, 1);
        expect().assertFail();
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_6100
     * @tc.desc Verify atan2([2], 1) array y throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        atan2Unsafe([2], 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_6200
     * @tc.desc Verify atan2(1, null) explicit null x throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        atan2Unsafe(1, null);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_6300
     * @tc.desc Verify atan2(1, undefined) explicit undefined x throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        atan2Unsafe(1, undefined);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_6400
     * @tc.desc Verify atan2(1, {}) plain object literal x throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        atan2Unsafe(1, {});
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_6500
     * @tc.desc Verify atan2(1, false) boolean x throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        atan2Unsafe(1, false);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_6600
     * @tc.desc Verify atan2(1, new Date(0)) Date object x throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        atan2Unsafe(1, new Date(0));
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_6700
     * @tc.desc Verify atan2(1, Map instance) Map x throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let m: Map<number, number> = new Map<number, number>();
      let apiThrew1_1: boolean = false;
      try {
        atan2Unsafe(1, m);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_6800
     * @tc.desc Verify atan2(new Decimal(2), 3) Decimal y matches number input result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(new Decimal(2), 3);
      expect(r.toString()).assertEqual('0.58800260354756755125');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_6900
     * @tc.desc Verify atan2(2, new Decimal(3)) Decimal x matches number input result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(2, new Decimal(3));
      expect(r.toString()).assertEqual('0.58800260354756755125');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_7000
     * @tc.desc Verify atan2(new Decimal('0.0001'), 1) high precision Decimal y returns tiny value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(new Decimal('0.0001'), 1);
      expect(r.toString()).assertEqual('0.000099999999666666668667');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_7100
     * @tc.desc Verify atan2(1, new Decimal('0.0001')) tiny Decimal x approaches pi/2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(1, new Decimal('0.0001'));
      expect(r.toString()).assertEqual('1.5706963267952299526');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_7200
     * @tc.desc Verify atan2(new Decimal('-3'), 4) negative Decimal y returns '-0.6435011087932843868'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(new Decimal('-3'), 4);
      expect(r.toString()).assertEqual('-0.6435011087932843868');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_7300
     * @tc.desc Verify atan2(new Decimal(-2), new Decimal(-3)) both negative Decimals enter quadrant three
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(new Decimal(-2), new Decimal(-3));
      expect(r.toString()).assertEqual('-2.5535900500422256872');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_7400
     * @tc.desc Verify atan2 returns new Decimal instance and original input Decimal stays unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: Decimal = new Decimal(2);
      let r: Decimal = Decimal.atan2(n, 3);
      expect(r instanceof Decimal).assertTrue();
      expect(n.toString()).assertEqual('2');
      expect(r === n).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0075
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_7500
     * @tc.desc Verify atan2 result supports chained Decimal operations via times
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(2, 3);
      let squared: Decimal = r.mul(r);
      expect(squared.toString()).assertEqual('0.34574706177871790021');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0076
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_7600
     * @tc.desc Verify atan2 result toNumber returns finite number 'number' type with expected value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(2, 3);
      expect(r.toNumber()).assertEqual(0.5880026035475675);
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0077
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_7700
     * @tc.desc Verify atan2 result isFinite returns true for normal inputs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(2, 3);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0078
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_7800
     * @tc.desc Verify atan2(0, 5) zero result satisfies isZero with positive x
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(0, 5);
      expect(r.isZero()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0079
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_7900
     * @tc.desc Verify atan2(null, null) both null arguments throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        atan2Unsafe(null, null);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0080
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_8000
     * @tc.desc Verify atan2(null, undefined) mixed nullish combination throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        atan2Unsafe(null, undefined);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0081
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_8100
     * @tc.desc Verify atan2 XSS script string y throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan2('0.1<script>alert(1)</script>', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0082
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_8200
     * @tc.desc Verify atan2 NUL character string y throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan2('\u0000', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0083
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_8300
     * @tc.desc Verify atan2(1, all-spaces string) x throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan2(1, '   ');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0084
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_8400
     * @tc.desc Verify atan2(1, zero-width space string) x throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan2(1, '​');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0085
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_8500
     * @tc.desc Verify union Decimal member y with string x enters Decimal parsing branch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan2(new Decimal(2), '3');
      expect(r.toString()).assertEqual('0.58800260354756755125');
    });

    /**
     * @tc.name testDecimalStaticAtan2Part01Test0086
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN2_PART01_TEST_8600
     * @tc.desc Verify same-value Decimal references produce identical results (reference equivalence)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtan2Part01Test0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Decimal = new Decimal('0.5');
      let d2: Decimal = new Decimal('0.5');
      let r1: Decimal = Decimal.atan2(d1, d1);
      let r2: Decimal = Decimal.atan2(d2, d2);
      expect(r1.toString()).assertEqual('0.78539816339744830962');
      expect(r2.toString()).assertEqual('0.78539816339744830962');
    });

  });
}
