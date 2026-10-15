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

function ceilUnsafe(...args: ESObject[]): Decimal {
  return Decimal.ceil(args[0] as Value);
}

function pick(v: number | null | undefined): Decimal {
  if (v === null) {
    return Decimal.ceil(1.5);
  }
  if (v === undefined) {
    return Decimal.ceil(2.5);
  }
  return Decimal.ceil(v);
}
function fn(v: number | null): Decimal {
  if (v === null) {
    return Decimal.ceil(0.5);
  }
  return Decimal.ceil(v);
}
function fu(v: number | undefined): Decimal {
  if (v === undefined) {
    return Decimal.ceil(3.5);
  }
  return Decimal.ceil(v);
}
function fm(v: number | undefined): Decimal {
  if (v === undefined) {
    return Decimal.ceil(1.5);
  }
  return Decimal.ceil(v);
}
function fb(v: number | undefined): Decimal {
  if (v === undefined) {
    return Decimal.ceil(2.5);
  }
  return Decimal.ceil(v);
}

export default function DecimalStaticCeilPart01Test() {
  describe('DecimalStaticCeilPart01Test', () => {
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
     * @tc.name testDecimalStaticCeilPart01Test0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_0100
     * @tc.desc Verify ceil(1.8) with single number argument returns '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data: Decimal = Decimal.ceil(1.8);
      expect(data.toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_0200
     * @tc.desc Verify ceil with dynamic number value 2.5 returns '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = 2.5;
      let r: Decimal = Decimal.ceil(v);
      expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_0300
     * @tc.desc Verify ceil with number taken from array element 3.5 returns '4'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [3.5];
      let r: Decimal = Decimal.ceil(arr[0]);
      expect(r.toString()).assertEqual('4');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_0400
     * @tc.desc Verify ceil with no argument throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        ceilUnsafe();
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_0500
     * @tc.desc Verify ceil(0.5) rounds positive half up to '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil(0.5).toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_0600
     * @tc.desc Verify ceil(0.1) rounds positive decimal below 1 up to '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil(0.1).toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_0700
     * @tc.desc Verify ceil(1.0001) slightly above integer rounds up to '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil(1.0001).toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_0800
     * @tc.desc Verify ceil(2.9999) slightly below integer rounds up to '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil(2.9999).toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_0900
     * @tc.desc Verify ceil(5) keeps integer value unchanged as '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil(5).toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_1000
     * @tc.desc Verify ceil(123.45) rounds two-decimal fraction up to '124'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil(123.45).toString()).assertEqual('124');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_1100
     * @tc.desc Verify ceil(123456.789) rounds large-integer fraction up to '123457'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil(123456.789).toString()).assertEqual('123457');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_1200
     * @tc.desc Verify ceil(0.1 + 0.2) double representation 0.30000000000000004 rounds to '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil(0.1 + 0.2).toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_1300
     * @tc.desc Verify ceil(-1.8) rounds toward positive infinity to '-1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil(-1.8).toString()).assertEqual('-1');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_1400
     * @tc.desc Verify ceil(-0.5) rounds to negative zero with valueOf '-0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil(-0.5).valueOf()).assertEqual('-0');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_1500
     * @tc.desc Verify ceil(-0.1) rounds toward positive infinity to negative zero '-0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil(-0.1).valueOf()).assertEqual('-0');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_1600
     * @tc.desc Verify ceil(-1.0001) slightly below negative integer rounds to '-1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil(-1.0001).toString()).assertEqual('-1');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_1700
     * @tc.desc Verify ceil(-2.9999) rounds toward positive infinity to '-2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil(-2.9999).toString()).assertEqual('-2');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_1800
     * @tc.desc Verify ceil(-5) keeps negative integer unchanged as '-5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil(-5).toString()).assertEqual('-5');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_1900
     * @tc.desc Verify ceil(-123.45) rounds negative fraction toward positive infinity to '-123'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil(-123.45).toString()).assertEqual('-123');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_2000
     * @tc.desc Verify ceil(0) returns '0' with isPositive true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ceil(0);
      expect(r.toString()).assertEqual('0');
      expect(r.isPositive()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_2100
     * @tc.desc Verify ceil(-0) keeps negative zero with s=1 and valueOf '-0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ceil(-0);
      expect(r.s).assertEqual(-1);
      expect(r.valueOf()).assertEqual('-0');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_2200
     * @tc.desc Verify ceil(-0.0) literal keeps isNegative true and valueOf '-0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ceil(-0.0);
      expect(r.isNegative()).assertTrue();
      expect(r.valueOf()).assertEqual('-0');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_2300
     * @tc.desc Verify ceil(NaN) propagates NaN as 'NaN'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil(NaN).toString()).assertEqual('NaN');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_2400
     * @tc.desc Verify ceil(Infinity) propagates positive infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil(Infinity).toString()).assertEqual('Infinity');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_2500
     * @tc.desc Verify ceil(-Infinity) propagates negative infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil(-Infinity).toString()).assertEqual('-Infinity');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_2600
     * @tc.desc Verify ceil(Number.MIN_SAFE_INTEGER) keeps exact negative safe integer value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil(Number.MIN_SAFE_INTEGER).toString()).assertEqual('-9007199254740991');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_2700
     * @tc.desc Verify ceil(Number.MAX_VALUE) keeps exponential form '1.7976931348623157e+308'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil(Number.MAX_VALUE).toString()).assertEqual('1.7976931348623157e+308');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_2800
     * @tc.desc Verify ceil(Number.MIN_VALUE) rounds smallest positive double up to '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil(Number.MIN_VALUE).toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_2900
     * @tc.desc Verify ceil(-Number.MIN_VALUE) rounds toward positive infinity to '-0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil(-Number.MIN_VALUE).valueOf()).assertEqual('-0');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_3000
     * @tc.desc Verify ceil(Number.EPSILON) rounds tiny positive value up to '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil(Number.EPSILON).toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_3100
     * @tc.desc Verify ceil(-Number.EPSILON) rounds toward positive infinity to '-0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil(-Number.EPSILON).valueOf()).assertEqual('-0');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_3200
     * @tc.desc Verify ceil(1e21) keeps exponential representation '1e+21'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil(1e21).toString()).assertEqual('1e+21');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_3300
     * @tc.desc Verify ceil(1e-7) rounds tiny positive scientific value up to '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil(1e-7).toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_3400
     * @tc.desc Verify ceil(-1e-7) rounds toward positive infinity to '-0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil(-1e-7).valueOf()).assertEqual('-0');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_3500
     * @tc.desc Verify ceil(1e3) scientific integer returns decimal integer '1000'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil(1e3).toString()).assertEqual('1000');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_3600
     * @tc.desc Verify ceil(1e10) keeps large exponential integer as '10000000000'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil(1e10).toString()).assertEqual('10000000000');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_3700
     * @tc.desc Verify ceil(0x10) hexadecimal literal normalizes to '16'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil(0x10).toString()).assertEqual('16');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_3800
     * @tc.desc Verify ceil(0b101) binary literal normalizes to '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil(0b101).toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_3900
     * @tc.desc Verify ceil(0o17) octal literal normalizes to '15'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil(0o17).toString()).assertEqual('15');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_4000
     * @tc.desc Verify ceil(1.96875) fraction rounds up to '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil(1.96875).toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_4100
     * @tc.desc Verify ceil(1e400) overflow literal becomes Infinity with toNumber Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ceil(1e400);
      expect(r.toString()).assertEqual('Infinity');
      expect(r.toNumber()).assertEqual(Infinity);
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_4200
     * @tc.desc Verify ceil(-1e400) negative overflow literal propagates '-Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ceil(-1e400);
      expect(r.toString()).assertEqual('-Infinity');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_4300
     * @tc.desc Verify ceil(2.0000000000000004) one ulp above integer rounds up to '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil(2.0000000000000004).toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_4400
     * @tc.desc Verify adjacent doubles 2^53-1 and 2^53 keep their own values under ceil
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil(9007199254740991).toString()).assertEqual('9007199254740991');
      expect(Decimal.ceil(9007199254740992).toString()).assertEqual('9007199254740992');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_4500
     * @tc.desc Verify two Decimal references with same content produce same ceil result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('2.5');
      let b: Decimal = new Decimal('2.5');
      expect(Decimal.ceil(a).toString()).assertEqual('3');
      expect(Decimal.ceil(b).toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_4600
     * @tc.desc Verify ceil does not modify source Decimal object (reference isolation)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Decimal = new Decimal('1.8');
      let cp: Decimal = Decimal.ceil(src);
      expect(cp.toString()).assertEqual('2');
      expect(src.toString()).assertEqual('1.8');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_4700
     * @tc.desc Verify ceil of negative Decimal '-0.5' yields negative zero '-0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ceil(new Decimal('-0.5'));
      expect(r.valueOf()).assertEqual('-0');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_4800
     * @tc.desc Verify explicit null argument throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        ceilUnsafe(null);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_4900
     * @tc.desc Verify explicit undefined argument throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        ceilUnsafe(undefined);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_5000
     * @tc.desc Verify null and undefined hit different guard branches before entering ceil
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(pick(null).toString()).assertEqual('2');
      expect(pick(undefined).toString()).assertEqual('3');
      expect(pick(1.5).toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_5100
     * @tc.desc Verify number|null union: null takes guard branch and number takes ceil branch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fn(null).toString()).assertEqual('1');
      expect(fn(0.5).toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_5200
     * @tc.desc Verify number|undefined union: undefined takes guard branch and number ceil branch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fu(undefined).toString()).assertEqual('4');
      expect(fu(3.5).toString()).assertEqual('4');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_5300
     * @tc.desc Verify missing arg via any[] index yields undefined and guard default applies
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let args: number[] = [];
      expect(fm(args[0]).toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_5400
     * @tc.desc Verify missing object property yields undefined and guard default branch applies
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      interface Box { v?: number; }
      let box: Box = {};
      expect(fb(box.v).toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_5500
     * @tc.desc Verify ceil returns object type (Decimal instance)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ceil(2.5);
      expect(typeof r).assertEqual('object');
      expect(r instanceof Decimal).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_5600
     * @tc.desc Verify ceil returns new object not same reference as Decimal input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Decimal = new Decimal(2.5);
      let r: Decimal = Decimal.ceil(rec);
      expect(r === rec).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_5700
     * @tc.desc Verify toNumber outputs numeric result 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ceil(2.5);
      expect(r.toNumber()).assertEqual(3);
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_5800
     * @tc.desc Verify valueOf outputs string result '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil(2.5).valueOf()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_5900
     * @tc.desc Verify negative result isNegative true and positive result isPositive true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil(-1.5).isNegative()).assertTrue();
      expect(Decimal.ceil(1.5).isPositive()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_6000
     * @tc.desc Verify ceil(2.5) coefficients d=[3], e=0, s=0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ceil(2.5);
      expect(r.d.length).assertEqual(1);
      expect(r.d[0]).assertEqual(3);
      expect(r.e).assertEqual(0);
      expect(r.s).assertEqual(1);
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_6100
     * @tc.desc Verify ceil(-1.5) sign s=1, d=[1] and toString '-1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ceil(-1.5);
      expect(r.s).assertEqual(-1);
      expect(r.d[0]).assertEqual(1);
      expect(r.toString()).assertEqual('-1');
      expect(r.d.length).assertEqual(1);
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_6200
     * @tc.desc Verify ceil result supports chained operation plus(1) giving '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ceil(1.8).add(1);
      expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_6300
     * @tc.desc Verify ceil with NaN and signed Infinity does not throw
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw: boolean = false;
      try {
        Decimal.ceil(NaN);
        Decimal.ceil(Infinity);
        Decimal.ceil(-Infinity);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
        threw = true;
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_6400
     * @tc.desc Verify ceil of divide-by-zero Infinity stays Infinity without throw
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ceil(new Decimal(1).div(0));
      expect(r.toString()).assertEqual('Infinity');
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_6500
     * @tc.desc Verify object argument fails validation and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        ceilUnsafe({});
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_6600
     * @tc.desc Verify array argument fails validation and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        ceilUnsafe([1, 2]);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_6700
     * @tc.desc Verify boolean argument fails validation and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        ceilUnsafe(true);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_6800
     * @tc.desc Verify ceil(Number.MAX_VALUE) toNumber stays finite 1.7976931348623157e308
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ceil(Number.MAX_VALUE);
      expect(r.toNumber()).assertEqual(1.7976931348623157e308);
    });

    /**
     * @tc.name testDecimalStaticCeilPart01Test0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART01_TEST_6900
     * @tc.desc Verify negative overflow -1e400 ceil toNumber is -Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart01Test0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ceil(-1e400);
      expect(r.toNumber()).assertEqual(-Infinity);
    });
  });
}
