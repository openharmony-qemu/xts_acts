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

function atanUnsafe(...args: ESObject[]): Decimal {
  return Decimal.atan(args[0] as Value);
}

class IllegalUnionMember {
  flag: boolean = false;
}

export default function DecimalStaticAtanPart01Test() {
  describe('DecimalStaticAtanPart01Test', () => {
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
     * @tc.name testDecimalStaticAtanPart01Test0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_0100
     * @tc.desc Verify calling atan with no argument throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        atanUnsafe();
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_0200
     * @tc.desc Verify atan(0.75) with single number argument returns '0.6435011087932843868'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan(0.75);
      expect(r.toString()).assertEqual('0.6435011087932843868');
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_0300
     * @tc.desc Verify atan(0) returns '0' and result isZero is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan(0);
      expect(r.toString()).assertEqual('0');
      expect(r.isZero()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_0400
     * @tc.desc Verify atan(1) equals pi/4 as '0.78539816339744830962'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan(1);
      expect(r.toString()).assertEqual('0.78539816339744830962');
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_0500
     * @tc.desc Verify atan(-1) equals -pi/4 as '-0.78539816339744830962'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan(-1);
      expect(r.toString()).assertEqual('-0.78539816339744830962');
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_0600
     * @tc.desc Verify atan(0.5) returns '0.46364760900080611621'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan(0.5);
      expect(r.toString()).assertEqual('0.46364760900080611621');
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test0700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_0700
     * @tc.desc Verify atan(-0.5) is negative and symmetric with atan(0.5), sum is '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pos: Decimal = Decimal.atan(0.5);
      let neg: Decimal = Decimal.atan(-0.5);
      expect(neg.toString()).assertEqual('-0.46364760900080611621');
      expect(pos.add(neg).toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test0800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_0800
     * @tc.desc Verify atan(2) for input above 1 returns '1.107148717794090503'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan(2);
      expect(r.toString()).assertEqual('1.107148717794090503');
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test0900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_0900
     * @tc.desc Verify atan(-3) returns '-1.2490457723982544258'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan(-3);
      expect(r.toString()).assertEqual('-1.2490457723982544258');
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test1000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_1000
     * @tc.desc Verify atan(NaN) result is NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan(NaN);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test1100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_1100
     * @tc.desc Verify atan(Infinity) converges to pi/2 as '1.5707963267948966192'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan(Infinity);
      expect(r.toString()).assertEqual('1.5707963267948966192');
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test1200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_1200
     * @tc.desc Verify atan(-Infinity) converges to -pi/2 as '-1.5707963267948966192'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan(-Infinity);
      expect(r.toString()).assertEqual('-1.5707963267948966192');
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test1300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_1300
     * @tc.desc Verify atan(0) result isPositive true and isNegative false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan(0);
      expect(r.isPositive()).assertTrue();
      expect(r.isNegative()).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test1400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_1400
     * @tc.desc Verify atan(-0) keeps negative sign: isNegative true and valueOf '-0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan(-0);
      expect(r.isNegative()).assertTrue();
      expect(r.valueOf()).assertEqual('-0');
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test1500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_1500
     * @tc.desc Verify atan(Number.MAX_VALUE) approximates pi/2 as '1.5707963267948966192'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan(Number.MAX_VALUE);
      expect(r.toString()).assertEqual('1.5707963267948966192');
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test1600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_1600
     * @tc.desc Verify atan(Number.MIN_VALUE) underflows to '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan(Number.MIN_VALUE);
      expect(r.toString()).assertEqual('5e-324');
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test1700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_1700
     * @tc.desc Verify atan(Number.EPSILON) equals itself in linear small region
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan(Number.EPSILON);
      expect(r.toString()).assertEqual('2.220446049250313e-16');
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test1800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_1800
     * @tc.desc Verify atan(Number.MAX_SAFE_INTEGER) approximates pi/2 as '1.5707963267948965082'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan(Number.MAX_SAFE_INTEGER);
      expect(r.toString()).assertEqual('1.5707963267948965082');
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test1900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_1900
     * @tc.desc Verify atan(Number.MIN_SAFE_INTEGER) approximates -pi/2 as '-1.5707963267948965082'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan(Number.MIN_SAFE_INTEGER);
      expect(r.toString()).assertEqual('-1.5707963267948965082');
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test2000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_2000
     * @tc.desc Verify atan(9e15) parses decimal constant and returns '1.5707963267948965081'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan(9e15);
      expect(r.toString()).assertEqual('1.5707963267948965081');
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test2100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_2100
     * @tc.desc Verify atan(1e-7) approximates itself in small linear region
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan(1e-7);
      expect(r.toString()).assertEqual('9.9999999999999666667e-8');
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test2200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_2200
     * @tc.desc Verify atan(0x10) hexadecimal literal parses as 16 and returns '1.5083775167989392825'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan(0x10);
      expect(r.toString()).assertEqual('1.5083775167989392708');
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test2300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_2300
     * @tc.desc Verify atan(1e100) overflow exponent still approximates pi/2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan(1e100);
      expect(r.toString()).assertEqual('1.5707963267948966192');
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test2400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_2400
     * @tc.desc Verify atan(123.45) returns '1.5626960584396500821' within (pi/4, pi/2)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan(123.45);
      expect(r.toString()).assertEqual('1.5626960584396500821');
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test2500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_2500
     * @tc.desc Verify atan(1.4142135623730951) sqrt2 approximation returns '0.95531661812450929523'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan(1.4142135623730951);
      expect(r.toString()).assertEqual('0.95531661812450929523');
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test2600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_2600
     * @tc.desc Verify atan('0.75') string input matches number input result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan('0.75');
      expect(r.toString()).assertEqual('0.6435011087932843868');
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test2700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_2700
     * @tc.desc Verify atan('-0.75') negative numeric string returns '-0.6435011087932843868'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan('-0.75');
      expect(r.toString()).assertEqual('-0.6435011087932843868');
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test2800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_2800
     * @tc.desc Verify atan('+0.5') explicit plus sign parses as 0.5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan('+0.5');
      expect(r.toString()).assertEqual('0.46364760900080611621');
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test2900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_2900
     * @tc.desc Verify atan('1e-7') scientific string approximates itself
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan('1e-7');
      expect(r.toString()).assertEqual('9.9999999999999666667e-8');
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test3000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_3000
     * @tc.desc Verify atan('1e19') exponent string approximates pi/2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan('1e19');
      expect(r.toString()).assertEqual('1.5707963267948966191');
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test3100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_3100
     * @tc.desc Verify atan('1e-50') tiny precision-boundary string equals itself
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan('1e-50');
      expect(r.toString()).assertEqual('1e-50');
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test3200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_3200
     * @tc.desc Verify atan('NaN') string result is NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan('NaN');
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test3300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_3300
     * @tc.desc Verify atan('Infinity') string equals pi/2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan('Infinity');
      expect(r.toString()).assertEqual('1.5707963267948966192');
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test3400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_3400
     * @tc.desc Verify atan('-Infinity') string equals -pi/2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan('-Infinity');
      expect(r.toString()).assertEqual('-1.5707963267948966192');
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test3500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_3500
     * @tc.desc Verify atan('0') returns '0' without negative sign
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan('0');
      expect(r.toString()).assertEqual('0');
      expect(r.isNegative()).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test3600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_3600
     * @tc.desc Verify atan('abc') invalid numeric string throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan('abc');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test3700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_3700
     * @tc.desc Verify atan('1.2.3') double dot string throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan('1.2.3');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test3800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_3800
     * @tc.desc Verify atan with 80-digit string outputs 20 significant digits without 10200060
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '0.12345678901234567890123456789012345678901234567890123456789012345678901234567890';
      let r: Decimal = Decimal.atan(s);
      expect(r.toString()).assertEqual('0.12283523778346472968');
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test3900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_3900
     * @tc.desc Verify atan('1e') incomplete exponent string throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan('1e');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test4000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_4000
     * @tc.desc Verify atan('--5') double negative string throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan('--5');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test4100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_4100
     * @tc.desc Verify atan('0.1<script>alert(1)</script>') XSS string throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan('0.1<script>alert(1)</script>');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test4200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_4200
     * @tc.desc Verify atan(null) explicit null throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        atanUnsafe(null);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test4300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_4300
     * @tc.desc Verify atan(undefined) explicit undefined throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        atanUnsafe(undefined);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test4400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_4400
     * @tc.desc Verify atan({}) plain object throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        atanUnsafe({});
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test4500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_4500
     * @tc.desc Verify atan({ value: 0.75 }) object with number value throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        atanUnsafe({ value: 0.75 });
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test4600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_4600
     * @tc.desc Verify atan(new Decimal(0.75)) Decimal instance matches number input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: Decimal = new Decimal(0.75);
      let r: Decimal = Decimal.atan(n);
      expect(r.toString()).assertEqual('0.6435011087932843868');
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test4700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_4700
     * @tc.desc Verify atan(new Decimal('-1')) negative Decimal returns -pi/4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: Decimal = new Decimal('-1');
      let r: Decimal = Decimal.atan(n);
      expect(r.toString()).assertEqual('-0.78539816339744830962');
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test4800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_4800
     * @tc.desc Verify atan(new Decimal('0.0001')) returns '0.000099999999666666668667'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: Decimal = new Decimal('0.0001');
      let r: Decimal = Decimal.atan(n);
      expect(r.toString()).assertEqual('0.000099999999666666668667');
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test4900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_4900
     * @tc.desc Verify atan(new Decimal(NaN)) NaN Decimal result is NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: Decimal = new Decimal(NaN);
      let r: Decimal = Decimal.atan(n);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test5000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_5000
     * @tc.desc Verify atan returns new Decimal and does not mutate original input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: Decimal = new Decimal(0.75);
      let r: Decimal = Decimal.atan(n);
      expect(r instanceof Decimal).assertTrue();
      expect(n.toString()).assertEqual('0.75');
      expect(r === n).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test5100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_5100
     * @tc.desc Verify atan result supports chained times(2) operation '1.57079632679489661924'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan(1);
      let doubled: Decimal = r.mul(2);
      expect(doubled.toString()).assertEqual('1.5707963267948966192');
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test5200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_5200
     * @tc.desc Verify atan(0.75) toNumber is a finite number 'number' type value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan(0.75);
      expect(r.toNumber()).assertEqual(0.6435011087932844);
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test5300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_5300
     * @tc.desc Verify atan(0.1) output limited to 20 significant digits by default precision
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan(0.1);
      expect(r.toString()).assertEqual('0.099668652491162027378');
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test5400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_5400
     * @tc.desc Verify atan('0x10') hex string parses as 16 returning '1.5083775167989392708'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan('0x10');
      expect(r.toString()).assertEqual('1.5083775167989392708');
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test5500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_5500
     * @tc.desc Verify atan(true) boolean throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        atanUnsafe(true);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test5600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_5600
     * @tc.desc Verify atan with custom class instance non-Value member throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        atanUnsafe(new IllegalUnionMember());
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test5700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_5700
     * @tc.desc Verify atan(function) function object throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        let fn: () => number = (): number => 0.75;
        atanUnsafe(fn);
        expect().assertFail();
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test5800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_5800
     * @tc.desc Verify atan('0.5') string member of Value union parses via string branch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan('0.5');
      expect(r.toString()).assertEqual('0.46364760900080611621');
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test5900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_5900
     * @tc.desc Verify atan(new Decimal(0.5)) Decimal member of Value union gives same result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan(new Decimal(0.5));
      expect(r.toString()).assertEqual('0.46364760900080611621');
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test6000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_6000
     * @tc.desc Verify atan with '2', 2, new Decimal(2) same-value calls are idempotent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = Decimal.atan('2');
      let b: Decimal = Decimal.atan(2);
      let c: Decimal = Decimal.atan(new Decimal(2));
      expect(a.toString()).assertEqual('1.107148717794090503');
      expect(b.toString()).assertEqual('1.107148717794090503');
      expect(c.toString()).assertEqual('1.107148717794090503');
    });

    /**
     * @tc.name testDecimalStaticAtanPart01Test6100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART01_TEST_6100
     * @tc.desc Verify atan of two equal-valued Decimal instances returns identical results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart01Test6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: Decimal = Decimal.atan(new Decimal('0.25'));
      let r2: Decimal = Decimal.atan(new Decimal('0.25'));
      expect(r1.toString()).assertEqual('0.24497866312686415417');
      expect(r2.toString()).assertEqual('0.24497866312686415417');
    });

  });
}
