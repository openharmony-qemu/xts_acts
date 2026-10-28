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

function addUnsafe(...args: ESObject[]): Decimal {
  return Decimal.add(args[0] as Value, args[1] as Value);
}

export default function DecimalStaticAddPart01Test() {
  describe('DecimalStaticAddPart01Test', () => {
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
     * @tc.name testDecimalStaticAddPart01Test0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_0100
     * @tc.desc Verify add(0.5, 0.5) with two number arguments returns '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(0.5, 0.5);
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_0200
     * @tc.desc Verify add('1', '2') with two string arguments returns '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('1', '2');
      expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_0300
     * @tc.desc Verify add(1, 2, 3) ignores extra third argument and returns '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = addUnsafe(1, 2, 3);
      expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_0400
     * @tc.desc Verify add(5) with missing y argument throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        addUnsafe(5);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_0500
     * @tc.desc Verify add() with no arguments throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        addUnsafe();
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_0600
     * @tc.desc Verify add(NaN, 5) propagates NaN with isNaN true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(NaN, 5);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test0700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_0700
     * @tc.desc Verify add(Infinity, 1) keeps result 'Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(Infinity, 1);
      expect(r.toString()).assertEqual('Infinity');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test0800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_0800
     * @tc.desc Verify add(-Infinity, 1) keeps result '-Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(-Infinity, 1);
      expect(r.toString()).assertEqual('-Infinity');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test0900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_0900
     * @tc.desc Verify add(Infinity, -Infinity) cancels to NaN with isNaN true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(Infinity, -Infinity);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test1000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_1000
     * @tc.desc Verify add(-0, -0) returns '0' with isNegative true keeping -0 sign
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(-0, -0);
      expect(r.toString()).assertEqual('0');
      expect(r.isNegative()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test1100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_1100
     * @tc.desc Verify add(0, -0) returns '0' with isNegative false, positive zero wins
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(0, -0);
      expect(r.toString()).assertEqual('0');
      expect(r.isNegative()).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test1200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_1200
     * @tc.desc Verify add(-0, 5) returns '5' with isNegative false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(-0, 5);
      expect(r.toString()).assertEqual('5');
      expect(r.isNegative()).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test1300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_1300
     * @tc.desc Verify add(MAX_VALUE, MAX_VALUE) sums to '3.5953862697246314e+308' without overflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(Number.MAX_VALUE, Number.MAX_VALUE);
      expect(r.toString()).assertEqual('3.5953862697246314e+308');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test1400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_1400
     * @tc.desc Verify add(MIN_VALUE, MIN_VALUE) sums to '1e-323'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(Number.MIN_VALUE, Number.MIN_VALUE);
      expect(r.toString()).assertEqual('1e-323');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test1500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_1500
     * @tc.desc Verify add(1, EPSILON) keeps exact '1.000000000000000222'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(1, Number.EPSILON);
      expect(r.toString()).assertEqual('1.000000000000000222');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test1600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_1600
     * @tc.desc Verify add(MAX_SAFE_INTEGER, 1) returns exact '9007199254740992'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(Number.MAX_SAFE_INTEGER, 1);
      expect(r.toString()).assertEqual('9007199254740992');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test1700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_1700
     * @tc.desc Verify add(MAX_SAFE_INTEGER, 2) returns exact '9007199254740993'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(Number.MAX_SAFE_INTEGER, 2);
      expect(r.toString()).assertEqual('9007199254740993');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test1800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_1800
     * @tc.desc Verify add(MAX_SAFE_INTEGER, MAX_SAFE_INTEGER) returns '18014398509481982'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(Number.MAX_SAFE_INTEGER, Number.MAX_SAFE_INTEGER);
      expect(r.toString()).assertEqual('18014398509481982');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test1900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_1900
     * @tc.desc Verify add(MIN_SAFE_INTEGER, MIN_SAFE_INTEGER) returns '-18014398509481982' negative
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(Number.MIN_SAFE_INTEGER, Number.MIN_SAFE_INTEGER);
      expect(r.toString()).assertEqual('-18014398509481982');
      expect(r.isNegative()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test2000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_2000
     * @tc.desc Verify add(9e15, 9e15) returns integer '18000000000000000'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(9e15, 9e15);
      expect(r.toString()).assertEqual('18000000000000000');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test2100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_2100
     * @tc.desc Verify add(-9e15, -9e15) returns '-18000000000000000' with isNegative true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(-9e15, -9e15);
      expect(r.toString()).assertEqual('-18000000000000000');
      expect(r.isNegative()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test2200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_2200
     * @tc.desc Verify add(0.1, 0.2) fixes float tail error and returns '0.3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(0.1, 0.2);
      expect(r.toString()).assertEqual('0.3');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test2300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_2300
     * @tc.desc Verify add(123.456, 7.89) returns exact sum '131.346'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(123.456, 7.89);
      expect(r.toString()).assertEqual('131.346');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test2400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_2400
     * @tc.desc Verify add(-123.456, -7.89) returns '-131.346' with isNegative true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(-123.456, -7.89);
      expect(r.toString()).assertEqual('-131.346');
      expect(r.isNegative()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test2500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_2500
     * @tc.desc Verify add(123.456, -7.89) positive and negative offset returns '115.566'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(123.456, -7.89);
      expect(r.toString()).assertEqual('115.566');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test2600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_2600
     * @tc.desc Verify add(-123.456, 7.89) returns '-115.566' with isNegative true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(-123.456, 7.89);
      expect(r.toString()).assertEqual('-115.566');
      expect(r.isNegative()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test2700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_2700
     * @tc.desc Verify add(123.456, -123.456) cancels exactly to '0' with isNegative false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(123.456, -123.456);
      expect(r.toString()).assertEqual('0');
      expect(r.isNegative()).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test2800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_2800
     * @tc.desc Verify add(-1.5, 2.5) crosses zero and returns '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(-1.5, 2.5);
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test2900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_2900
     * @tc.desc Verify add(1e15, 1e15) returns integer '2000000000000000' without sci notation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(1e15, 1e15);
      expect(r.toString()).assertEqual('2000000000000000');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test3000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_3000
     * @tc.desc Verify add(1e6, 1e6) returns integer '2000000'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(1e6, 1e6);
      expect(r.toString()).assertEqual('2000000');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test3100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_3100
     * @tc.desc Verify add(1e20, 1) outputs 21-digit integer '100000000000000000000'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(1e20, 1);
      expect(r.toString()).assertEqual('100000000000000000000');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test3200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_3200
     * @tc.desc Verify add(1e21, 1) beyond toExpPos outputs scientific '1e+21'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(1e21, 1);
      expect(r.toString()).assertEqual('1e+21');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test3300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_3300
     * @tc.desc Verify add(MAX_VALUE, MIN_VALUE) with huge magnitude gap returns '1.7976931348623157e+308'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(Number.MAX_VALUE, Number.MIN_VALUE);
      expect(r.toString()).assertEqual('1.7976931348623157e+308');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test3400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_3400
     * @tc.desc Verify add(-MAX_VALUE, MAX_VALUE) cancels to '0' with isNegative false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(-Number.MAX_VALUE, Number.MAX_VALUE);
      expect(r.toString()).assertEqual('0');
      expect(r.isNegative()).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test3500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_3500
     * @tc.desc Verify add('0x10', '0x10') parses hex strings and returns '32'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('0x10', '0x10');
      expect(r.toString()).assertEqual('32');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test3600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_3600
     * @tc.desc Verify add('0b101', '1') parses binary string and returns '6'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('0b101', '1');
      expect(r.toString()).assertEqual('6');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test3700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_3700
     * @tc.desc Verify add('0o17', '1') parses octal string and returns '16'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('0o17', '1');
      expect(r.toString()).assertEqual('16');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test3800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_3800
     * @tc.desc Verify add('0X1F', '0X1F') parses uppercase hex prefix and returns '62'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('0X1F', '0X1F');
      expect(r.toString()).assertEqual('62');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test3900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_3900
     * @tc.desc Verify add('1_000', '1') parses underscore separator and returns '1001'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('1_000', '1');
      expect(r.toString()).assertEqual('1001');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test4000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_4000
     * @tc.desc Verify add('+5', '3') parses leading plus sign and returns '8'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('+5', '3');
      expect(r.toString()).assertEqual('8');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test4100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_4100
     * @tc.desc Verify add('-5', '+3') mixes signs returning '-2' with isNegative true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('-5', '+3');
      expect(r.toString()).assertEqual('-2');
      expect(r.isNegative()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test4200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_4200
     * @tc.desc Verify add('1.5e+3', '0') parses positive exponent string returning '1500'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('1.5e+3', '0');
      expect(r.toString()).assertEqual('1500');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test4300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_4300
     * @tc.desc Verify add('0.1e2', '3') parses fractional mantissa sci notation returning '13'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('0.1e2', '3');
      expect(r.toString()).assertEqual('13');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test4400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_4400
     * @tc.desc Verify add('1e-7', '1e-7') outputs exponential form '2e-7' per toExpNeg
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('1e-7', '1e-7');
      expect(r.toString()).assertEqual('2e-7');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test4500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_4500
     * @tc.desc Verify add('1e-6', '1e-6') within toExpNeg threshold outputs plain '0.000002'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('1e-6', '1e-6');
      expect(r.toString()).assertEqual('0.000002');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test4600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_4600
     * @tc.desc Verify add('0.0000001', '0.0000001') output follows magnitude not input form '2e-7'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('0.0000001', '0.0000001');
      expect(r.toString()).assertEqual('2e-7');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test4700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_4700
     * @tc.desc Verify add('9999999999999999999999', '1') 22-digit sum beyond toExpPos outputs '1e+22'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('9999999999999999999999', '1');
      expect(r.toString()).assertEqual('1e+22');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test4800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_4800
     * @tc.desc Verify add('99999999999999999999', '1') 20-digit sum returns exact integer '100000000000000000000'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('99999999999999999999', '1');
      expect(r.toString()).assertEqual('100000000000000000000');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test4900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_4900
     * @tc.desc Verify add('1e-1000000', '1e-1000000') tiny exponent sums to '2e-1000000'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('1e-1000000', '1e-1000000');
      expect(r.toString()).assertEqual('2e-1000000');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test5000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_5000
     * @tc.desc Verify add('1e-1000000', '1') absorbs tiny addend returning '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('1e-1000000', '1');
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test5100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_5100
     * @tc.desc Verify add('0001', '1') parses leading zeros returning '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('0001', '1');
      expect(r.toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test5200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_5200
     * @tc.desc Verify add('.5', '1') parses leading dot returning '1.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('.5', '1');
      expect(r.toString()).assertEqual('1.5');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test5300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_5300
     * @tc.desc Verify add('5.', '1') parses trailing dot returning '6'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('5.', '1');
      expect(r.toString()).assertEqual('6');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test5400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_5400
     * @tc.desc Verify add('001.5', '1') parses leading zero decimal returning '2.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('001.5', '1');
      expect(r.toString()).assertEqual('2.5');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test5500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_5500
     * @tc.desc Verify add('0.30000000000000004', '0') keeps all 17 significant digits
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('0.30000000000000004', '0');
      expect(r.toString()).assertEqual('0.30000000000000004');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test5600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_5600
     * @tc.desc Verify add('10', 10) with string x and number y returns '20'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('10', 10);
      expect(r.toString()).assertEqual('20');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test5700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_5700
     * @tc.desc Verify add(10, '0.5') with number x and string y returns '10.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(10, '0.5');
      expect(r.toString()).assertEqual('10.5');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test5800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_5800
     * @tc.desc Verify add(new Decimal('1.5'), 2.5) with Decimal x and number y returns '4'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(new Decimal('1.5'), 2.5);
      expect(r.toString()).assertEqual('4');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test5900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_5900
     * @tc.desc Verify add(-10, new Decimal('3.5')) with negative number x and Decimal y returns '-6.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(-10, new Decimal('3.5'));
      expect(r.toString()).assertEqual('-6.5');
      expect(r.isNegative()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test6000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_6000
     * @tc.desc Verify add(new Decimal('1.5'), '2.5') with Decimal x and string y returns '4'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(new Decimal('1.5'), '2.5');
      expect(r.toString()).assertEqual('4');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test6100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_6100
     * @tc.desc Verify add(new Decimal('1e100'), new Decimal('1e100')) huge Decimals sum to '2e+100'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(new Decimal('1e100'), new Decimal('1e100'));
      expect(r.toString()).assertEqual('2e+100');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test6200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_6200
     * @tc.desc Verify add('-5', new Decimal('3')) with negative string x and Decimal y returns '-2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('-5', new Decimal('3'));
      expect(r.toString()).assertEqual('-2');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test6300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_6300
     * @tc.desc Verify add('5', NaN) with NaN y propagates NaN with isNaN true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('5', NaN);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test6400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_6400
     * @tc.desc Verify add('1', Infinity) with Infinity y keeps 'Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('1', Infinity);
      expect(r.toString()).assertEqual('Infinity');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test6500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_6500
     * @tc.desc Verify add('5', -0) returns '5' with isNegative false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('5', -0);
      expect(r.toString()).assertEqual('5');
      expect(r.isNegative()).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test6600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_6600
     * @tc.desc Verify add(0.2, new Decimal('0.1')) cross-type float compensation returns '0.3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(0.2, new Decimal('0.1'));
      expect(r.toString()).assertEqual('0.3');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test6700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_6700
     * @tc.desc Verify add(1, 2) returns Decimal object with typeof 'object' and isDecimal true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(1, 2);
      expect(typeof r).assertEqual('object');
      expect(r instanceof Decimal).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test6800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_6800
     * @tc.desc Verify add(1, 2) each call returns new instance with different references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: Decimal = Decimal.add(1, 2);
      let r2: Decimal = Decimal.add(1, 2);
      expect(r1 === r2).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test6900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_6900
     * @tc.desc Verify add(3, 5) fields d=[8], e=0, s=1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(3, 5);
      expect(r.d[0]).assertEqual(8);
      expect(r.e).assertEqual(0);
      expect(r.s).assertEqual(1);
      expect(r.d.length).assertEqual(1);
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test7000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_7000
     * @tc.desc Verify add(1, 1) valueOf returns numeric string '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(1, 1);
      expect(r.valueOf()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test7100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_7100
     * @tc.desc Verify add(1, 2) toNumber returns number value 3 of type 'number'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(1, 2);
      expect(r.toNumber()).assertEqual(3);
      expect(typeof r.toNumber()).assertEqual('number');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test7200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_7200
     * @tc.desc Verify add(1, 2) finite result has isFinite true and isNaN false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(1, 2);
      expect(r.isFinite()).assertTrue();
      expect(r.isNaN()).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test7300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_7300
     * @tc.desc Verify add immutability: operand Decimal keeps '1.5' while result is '4'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let op: Decimal = new Decimal('1.5');
      let r: Decimal = Decimal.add(op, new Decimal('2.5'));
      expect(op.toString()).assertEqual('1.5');
      expect(r.toString()).assertEqual('4');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test7400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_7400
     * @tc.desc Verify add(1, 2).add(add(1, 1)) chained nested computation returns '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(1, 2).add(Decimal.add(1, 1));
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test7500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_7500
     * @tc.desc Verify add(null, 1) with explicit null x throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        addUnsafe(null, 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test7600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_7600
     * @tc.desc Verify add(undefined, 1) with explicit undefined x throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        addUnsafe(undefined, 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test7700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_7700
     * @tc.desc Verify add(1, null) with explicit null y throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        addUnsafe(1, null);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test7800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_7800
     * @tc.desc Verify add(1, undefined) with explicit undefined y throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        addUnsafe(1, undefined);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test7900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_7900
     * @tc.desc Verify add(null, null) with both null arguments throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        addUnsafe(null, null);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test8000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_8000
     * @tc.desc Verify add(null, undefined) mixed null and undefined throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        addUnsafe(null, undefined);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test8100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_8100
     * @tc.desc Verify add('', 1) with empty string x throws 401 invalid numeric string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add('', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test8200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_8200
     * @tc.desc Verify add('  ', 1) with all-whitespace string x throws 401 invalid numeric string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add('  ', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test8300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_8300
     * @tc.desc Verify add('  123', 1) with leading whitespace string x throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add('  123', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test8400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_8400
     * @tc.desc Verify add('123  ', 1) with trailing whitespace string x throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add('123  ', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test8500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_8500
     * @tc.desc Verify add('abc', 1) with alphabetic string x throws 401 invalid numeric string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add('abc', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test8600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_8600
     * @tc.desc Verify add('5.5.5', 1) with double dot string x throws 401 invalid format
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add('5.5.5', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test8700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_8700
     * @tc.desc Verify add('1e', 1) with incomplete exponent string x throws 401 invalid format
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add('1e', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test8800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_8800
     * @tc.desc Verify add('--5', 1) with double sign string x throws 401 invalid format
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add('--5', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test8900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_8900
     * @tc.desc Verify add('+', 1) with lone sign string x throws 401 invalid format
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add('+', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test9000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_9000
     * @tc.desc Verify add with zero-width space string x throws 401 invalid invisible char
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add('​', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test9100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_9100
     * @tc.desc Verify add(' ', 1) with NUL character string x throws 401 invalid control char
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add('\u0000', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test9200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_9200
     * @tc.desc Verify add('<script>alert(1)</script>', 1) XSS string throws 401 numeric rejection
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add('<script>alert(1)</script>', 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test9300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_9300
     * @tc.desc Verify add(1, 'abc') with invalid string in y position throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.add(1, 'abc');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test9400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_9400
     * @tc.desc Verify precision 6 sums '1.0000001'+1 truncated to '2' then restores precision 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 6, rounding: 4 });
      let r: Decimal = Decimal.add('1.0000001', 1);
      expect(r.toString()).assertEqual('2');
      Decimal.set({ precision: 20, rounding: 4 });
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test9500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_9500
     * @tc.desc Verify default precision 20 keeps full precision: add(1, '1e-7') returns '1.0000001'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add(1, '1e-7');
      expect(r.toString()).assertEqual('1.0000001');
    });

    /**
     * @tc.name testDecimalStaticAddPart01Test9600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ADD_PART01_TEST_9600
     * @tc.desc Verify add('1e400', '1e400') Decimal stays finite '2e+400' while toNumber overflows Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAddPart01Test9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.add('1e400', '1e400');
      expect(r.toString()).assertEqual('2e+400');
      expect(r.isFinite()).assertTrue();
      expect(r.toNumber()).assertEqual(Infinity);
    });
  });
}
