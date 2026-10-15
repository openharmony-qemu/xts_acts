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

function clampUnsafe(...args: ESObject[]): Decimal {
  return Decimal.clamp(args[0] as Value, args[1] as Value, args[2] as Value);
}

export default function DecimalStaticClampPart01Test() {
  describe('DecimalStaticClampPart01Test', () => {
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
     * @tc.name testDecimalStaticClampPart01Test0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_0100
     * @tc.desc Verify clamp(-5, 0, 10) returns min '0' when n is below min
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(-5, 0, 10);
      expect(r.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_0200
     * @tc.desc Verify clamp(10.1, 0, 10) returns max '10' when n is above max
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(10.1, 0, 10);
      expect(r.toString()).assertEqual('10');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_0300
     * @tc.desc Verify clamp(7.5, 0, 10) returns '7.5' when n is inside range
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(7.5, 0, 10);
      expect(r.toString()).assertEqual('7.5');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_0400
     * @tc.desc Verify clamp(0, 0, 10) returns n '0' when n equals min boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(0, 0, 10);
      expect(r.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_0500
     * @tc.desc Verify clamp(10, 0, 10) returns n '10' when n equals max boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(10, 0, 10);
      expect(r.toString()).assertEqual('10');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_0600
     * @tc.desc Verify clamp(5, 5, 5) returns '5' when min equals max collapses to single point
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(5, 5, 5);
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test0700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_0700
     * @tc.desc Verify clamp(9e15, 0, 100000000) returns max when huge n exceeds finite max
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(9e15, 0, 100000000);
      expect(r.toString()).assertEqual('100000000');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test0800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_0800
     * @tc.desc Verify clamp(Number.MAX_VALUE, 0, 10) returns max '10' for huge n
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(Number.MAX_VALUE, 0, 10);
      expect(r.toString()).assertEqual('10');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test0900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_0900
     * @tc.desc Verify clamp(Number.MIN_VALUE, 0, 1) returns '5e-324' unchanged inside range
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(Number.MIN_VALUE, 0, 1);
      expect(r.toString()).assertEqual('5e-324');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test1000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_1000
     * @tc.desc Verify clamp(Number.EPSILON, 0, 1) returns '2.220446049250313e-16' unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(Number.EPSILON, 0, 1);
      expect(r.toString()).assertEqual('2.220446049250313e-16');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test1100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_1100
     * @tc.desc Verify clamp(MAX_SAFE_INTEGER, 0, 10) returns max '10' beyond upper bound
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(Number.MAX_SAFE_INTEGER, 0, 10);
      expect(r.toString()).assertEqual('10');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test1200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_1200
     * @tc.desc Verify clamp(MAX_SAFE_INTEGER, 0, MAX_SAFE_INTEGER) returns '9007199254740991'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(Number.MAX_SAFE_INTEGER, 0, Number.MAX_SAFE_INTEGER);
      expect(r.toString()).assertEqual('9007199254740991');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test1300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_1300
     * @tc.desc Verify clamp(MIN_SAFE_INTEGER, -100, 100) returns min '-100' below lower bound
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(Number.MIN_SAFE_INTEGER, -100, 100);
      expect(r.toString()).assertEqual('-100');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test1400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_1400
     * @tc.desc Verify clamp(1e30, 1, 2e30) returns scientific '1e+30' inside range
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(1e30, 1, 2e30);
      expect(r.toString()).assertEqual('1e+30');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test1500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_1500
     * @tc.desc Verify clamp(1e-7, 0, 1e-6) returns plain '0.0000001' inside range
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(1e-7, 0, 1e-6);
      expect(r.toString()).assertEqual('1e-7');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test1600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_1600
     * @tc.desc Verify clamp(Infinity, 0, 10) returns max '10' for positive infinity n
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(Infinity, 0, 10);
      expect(r.toString()).assertEqual('10');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test1700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_1700
     * @tc.desc Verify clamp(-Infinity, -5, 5) returns min '-5' for negative infinity n
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(-Infinity, -5, 5);
      expect(r.toString()).assertEqual('-5');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test1800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_1800
     * @tc.desc Verify clamp(NaN, 0, 10) returns 'NaN' without throwing, weak assertion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let r: Decimal = Decimal.clamp(NaN, 0, 10);
        expect(r.toString()).assertEqual('NaN');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test1900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_1900
     * @tc.desc Verify clamp(-0, -1, 1) keeps negative zero sign inside range
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(-0, -1, 1);
      expect(r.isNegative()).assertTrue();
      expect(r.isZero()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test2000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_2000
     * @tc.desc Verify clamp(0, MAX_SAFE_INTEGER, 1e16) returns min '9007199254740991'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(0, Number.MAX_SAFE_INTEGER, 1e16);
      expect(r.toString()).assertEqual('9007199254740991');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test2100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_2100
     * @tc.desc Verify clamp(0, Number.MIN_VALUE, 1) returns min '5e-324'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(0, Number.MIN_VALUE, 1);
      expect(r.toString()).assertEqual('5e-324');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test2200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_2200
     * @tc.desc Verify clamp(-1, -0, 0) returns min keeping negative zero sign
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(-1, -0, 0);
      expect(r.isNegative()).assertTrue();
      expect(r.isZero()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test2300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_2300
     * @tc.desc Verify clamp(-1, 0, 0) with plus zero bounds returns non-negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(-1, 0, 0);
      expect(r.isNegative()).assertFalse();
      expect(r.isZero()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test2400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_2400
     * @tc.desc Verify clamp(-50, -100, -10) returns '-50' inside all-negative range
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(-50, -100, -10);
      expect(r.toString()).assertEqual('-50');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test2500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_2500
     * @tc.desc Verify clamp(-100, -Infinity, 100) returns '-100' with negative infinity min
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(-100, -Infinity, 100);
      expect(r.toString()).assertEqual('-100');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test2600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_2600
     * @tc.desc Verify clamp(100, 0, Infinity) returns '100' with positive infinity max
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(100, 0, Infinity);
      expect(r.toString()).assertEqual('100');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test2700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_2700
     * @tc.desc Verify clamp(1, Infinity, 10) throws 10200001 for positive infinity min
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.clamp(1, Infinity, 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test2800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_2800
     * @tc.desc Verify clamp(0, -10, -Infinity) throws 10200001 for negative infinity max
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.clamp(0, -10, -Infinity);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test2900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_2900
     * @tc.desc Verify clamp('7.5', 0, 10) returns '7.5' for string n inside range
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp('7.5', 0, 10);
      expect(r.toString()).assertEqual('7.5');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test3000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_3000
     * @tc.desc Verify clamp('-3', 0, 10) returns min '0' for negative string below min
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp('-3', 0, 10);
      expect(r.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test3100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_3100
     * @tc.desc Verify clamp('99', 0, 10) returns max '10' for string above max
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp('99', 0, 10);
      expect(r.toString()).assertEqual('10');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test3200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_3200
     * @tc.desc Verify clamp('1e2', 0, 10) returns max '10' for scientific string decoded
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp('1e2', 0, 10);
      expect(r.toString()).assertEqual('10');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test3300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_3300
     * @tc.desc Verify clamp(5, '0', 10) returns '5' with string min '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(5, '0', 10);
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test3400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_3400
     * @tc.desc Verify clamp(50, 0, '10') returns max '10' with string max
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(50, 0, '10');
      expect(r.toString()).assertEqual('10');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test3500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_3500
     * @tc.desc Verify clamp(1, 0, '1.5') returns '1' with fractional string max
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(1, 0, '1.5');
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test3600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_3600
     * @tc.desc Verify clamp('5.00', 0, 10) returns normalized '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp('5.00', 0, 10);
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test3700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_3700
     * @tc.desc Verify clamp('-0', 0, 10) keeps negative zero sign for string input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp('-0', 0, 10);
      expect(r.isNegative()).assertTrue();
      expect(r.isZero()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test3800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_3800
     * @tc.desc Verify clamp(Decimal('5.5'), 0, 10) returns '5.5' for Decimal n inside
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(new Decimal('5.5'), 0, 10);
      expect(r.toString()).assertEqual('5.5');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test3900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_3900
     * @tc.desc Verify clamp(Decimal('-1'), -0.5, 1) returns min '-0.5' for Decimal below
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(new Decimal('-1'), -0.5, 1);
      expect(r.toString()).assertEqual('-0.5');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test4000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_4000
     * @tc.desc Verify clamp(Decimal(50), 0, 10) returns max '10' for Decimal above max
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(new Decimal(50), 0, 10);
      expect(r.toString()).assertEqual('10');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test4100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_4100
     * @tc.desc Verify clamp(5, Decimal(0), 10) returns '5' with Decimal min
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(5, new Decimal(0), 10);
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test4200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_4200
     * @tc.desc Verify clamp(50, 0, Decimal(10)) returns max '10' with Decimal max
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(50, 0, new Decimal(10));
      expect(r.toString()).assertEqual('10');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test4300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_4300
     * @tc.desc Verify clamp with all Decimal params returns Decimal max '10'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(new Decimal(100), new Decimal(0), new Decimal(10));
      expect(r.toString()).assertEqual('10');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test4400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_4400
     * @tc.desc Verify clamp(Decimal(0), 0, 10) returns '0' when Decimal n equals min
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(new Decimal(0), 0, 10);
      expect(r.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test4500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_4500
     * @tc.desc Verify clamp with equal-content Decimal bounds from different references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: Decimal = Decimal.clamp(5, new Decimal('0'), new Decimal('10'));
      let r2: Decimal = Decimal.clamp(5, new Decimal(0), new Decimal(10));
      expect(r1.toString()).assertEqual('5');
      expect(r2.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test4600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_4600
     * @tc.desc Verify clamp leaves input Decimal object unchanged after clamping
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal('10.5');
      Decimal.clamp(x, 0, 5);
      expect(x.toString()).assertEqual('10.5');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test4700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_4700
     * @tc.desc Verify clamp('7.5', 0, Decimal(10)) mixed types returns '7.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp('7.5', 0, new Decimal(10));
      expect(r.toString()).assertEqual('7.5');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test4800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_4800
     * @tc.desc Verify clamp(2, '5', Decimal(10)) returns string min '5' below bound
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(2, '5', new Decimal(10));
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test4900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_4900
     * @tc.desc Verify clamp(Decimal(50), 0, '10') returns string max '10' above bound
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(new Decimal(50), 0, '10');
      expect(r.toString()).assertEqual('10');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test5000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_5000
     * @tc.desc Verify clamp('-9', '-5', 0) returns string min value '-5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp('-9', '-5', 0);
      expect(r.toString()).assertEqual('-5');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test5100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_5100
     * @tc.desc Verify clamp(Decimal(3), Decimal(2), 4) returns '3' inside range
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(new Decimal(3), new Decimal(2), 4);
      expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test5200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_5200
     * @tc.desc Verify clamp(1, Decimal('0.5'), '1.5') returns '1' inside range
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(1, new Decimal('0.5'), '1.5');
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test5300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_5300
     * @tc.desc Verify clamp(100, '0', '10') returns string max '10' above bound
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(100, '0', '10');
      expect(r.toString()).assertEqual('10');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test5400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_5400
     * @tc.desc Verify clamp('6', Decimal('5'), Decimal('7')) returns '6' inside range
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp('6', new Decimal('5'), new Decimal('7'));
      expect(r.toString()).assertEqual('6');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test5500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_5500
     * @tc.desc Verify clamp(5, 10) with missing max throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        clampUnsafe(5, 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test5600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_5600
     * @tc.desc Verify clamp(5, 0, 10, 'extra') ignores fourth argument returning '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = clampUnsafe(5, 0, 10, 'extra');
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test5700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_5700
     * @tc.desc Verify clamp('abc', 0, 10) throws 401 for non-numeric string n
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.clamp('abc', 0, 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test5800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_5800
     * @tc.desc Verify clamp('', 0, 10) throws 401 for empty string n
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.clamp('', 0, 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test5900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_5900
     * @tc.desc Verify clamp zero-width space string throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.clamp('​', 0, 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test6000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_6000
     * @tc.desc Verify clamp(' ', 0, 10) throws 401 for all-space string n
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.clamp(' ', 0, 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test6100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_6100
     * @tc.desc Verify clamp with emoji string n throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.clamp('😀', 0, 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test6200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_6200
     * @tc.desc Verify clamp('--5', 0, 10) throws 401 for double minus string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.clamp('--5', 0, 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test6300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_6300
     * @tc.desc Verify clamp('0x10', 0, 10) hex string parses as 16 and clamps to '10'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp('0x10', 0, 10);
      expect(r.toString()).assertEqual('10');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test6400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_6400
     * @tc.desc Verify clamp XSS script string throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.clamp('<script>alert(1)</script>', 0, 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test6500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_6500
     * @tc.desc Verify clamp(5, 'abc', 10) throws 401 for illegal min string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.clamp(5, 'abc', 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test6600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_6600
     * @tc.desc Verify clamp('1e309', 0, 10) decodes Infinity and clamps to '10'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp('1e309', 0, 10);
      expect(r.toString()).assertEqual('10');
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test6700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_6700
     * @tc.desc Verify clamp(5, 10, 1) throws 10200001 when all numbers min > max
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.clamp(5, 10, 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test6800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_6800
     * @tc.desc Verify clamp(-100, 0, -1) throws 10200001 with n below both bounds
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.clamp(-100, 0, -1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test6900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_6900
     * @tc.desc Verify clamp('5', '10', '1') throws 10200001 for all-string min > max
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.clamp('5', '10', '1');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test7000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_7000
     * @tc.desc Verify clamp(5, Decimal(10), Decimal(1)) throws 10200001 all Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.clamp(5, new Decimal(10), new Decimal(1));
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test7100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_7100
     * @tc.desc Verify clamp(5, Decimal('2e5'), '100') throws 10200001 mixed min > max
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.clamp(5, new Decimal('2e5'), '100');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test7200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_7200
     * @tc.desc Verify clamp(5, '2e5', 100) throws 10200001 for string min > number max
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.clamp(5, '2e5', 100);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test7300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_7300
     * @tc.desc Verify clamp(5, 0, 10) returns real Decimal with s=1 and e=0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(5, 0, 10);
      expect(r.s).assertEqual(1);
      expect(r.e).assertEqual(0);
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test7400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_7400
     * @tc.desc Verify clamp(7.5, 0, 10).toNumber() equals 7.5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.clamp(7.5, 0, 10).toNumber()).assertEqual(7.5);
    });

    /**
     * @tc.name testDecimalStaticClampPart01Test7500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART01_TEST_7500
     * @tc.desc Verify clamp returns new object not referencing min/max Decimal inputs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart01Test7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mn: Decimal = new Decimal(0);
      let mx: Decimal = new Decimal(10);
      let r: Decimal = Decimal.clamp(50, mn, mx);
      expect(r === mn).assertFalse();
      expect(r === mx).assertFalse();
    });
  });
}
