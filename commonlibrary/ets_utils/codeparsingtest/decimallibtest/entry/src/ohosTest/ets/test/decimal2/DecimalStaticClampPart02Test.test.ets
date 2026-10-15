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

export default function DecimalStaticClampPart02Test() {
  describe('DecimalStaticClampPart02Test', () => {
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
     * @tc.name testDecimalStaticClampPart02Test0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_0100
     * @tc.desc Verify clamp() with no arguments throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        clampUnsafe();
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_0200
     * @tc.desc Verify clamp(5) with only n throws 401 for missing min and max
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        clampUnsafe(5);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_0300
     * @tc.desc Verify clamp(5, 0) with missing max throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        clampUnsafe(5, 0);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_0400
     * @tc.desc Verify clamp(5, 0, 10, null) ignores null fourth argument returning '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = clampUnsafe(5, 0, 10, null);
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_0500
     * @tc.desc Verify clamp('123', 0, 1000) returns '123' for integer string inside range
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.clamp('123', 0, 1000);
      expect(r.toString()).assertEqual('123');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_0600
     * @tc.desc Verify clamp('-45', 0, 100) returns '0' for negative integer string below min
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.clamp('-45', 0, 100);
      expect(r.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_0700
     * @tc.desc Verify clamp('1e3', 0, 1000) returns '1000' when n equals max boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.clamp('1e3', 0, 1000);
      expect(r.toString()).assertEqual('1000');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_0800
     * @tc.desc Verify clamp('007', 0, 10) normalizes leading zeros to '7'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.clamp('007', 0, 10);
      expect(r.toString()).assertEqual('7');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_0900
     * @tc.desc Verify clamp('+5', 0, 10) parses explicit plus sign returning '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.clamp('+5', 0, 10);
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_1000
     * @tc.desc Verify clamp('2.5e-3', 0, 1) returns '0.0025' for negative exponent string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.clamp('2.5e-3', 0, 1);
      expect(r.toString()).assertEqual('0.0025');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_1100
     * @tc.desc Verify clamp('5.50', 0, 10) normalizes trailing zero to '5.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.clamp('5.50', 0, 10);
      expect(r.toString()).assertEqual('5.5');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_1200
     * @tc.desc Verify clamp 30-digit integer string keeps full precision inside range
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.clamp('123456789012345678901234567890', 0, '1e30');
      expect(r.toString()).assertEqual('1.2345678901234567890123456789e+29');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_1300
     * @tc.desc Verify clamp('123.4567890123456789', 0, 1000) keeps full precision
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.clamp('123.4567890123456789', 0, 1000);
      expect(r.toString()).assertEqual('123.4567890123456789');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_1400
     * @tc.desc Verify clamp('1e-7', 0, '1e-6') returns '1e-7' inside string bounds
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.clamp('1e-7', 0, '1e-6');
      expect(r.toString()).assertEqual('1e-7');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_1500
     * @tc.desc Verify clamp('-0', -1, 1) returns s=1 negative zero inside range
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.clamp('-0', -1, 1);
      expect(r.s).assertEqual(-1);
      expect(r.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_1600
     * @tc.desc Verify clamp('0.5', '.5', 1) treats equivalent representations returning '0.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.clamp('0.5', '.5', 1);
      expect(r.toString()).assertEqual('0.5');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_1700
     * @tc.desc Verify clamp('   ', 0, 10) throws 401 for all-whitespace string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.clamp('   ', 0, 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_1800
     * @tc.desc Verify clamp('12\n', 0, 100) throws 401 for trailing newline string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.clamp('12\n', 0, 100);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_1900
     * @tc.desc Verify clamp with emoji string n throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.clamp('🎯', 0, 100);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_2000
     * @tc.desc Verify clamp with lone low surrogate throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.clamp('\uD83D', 0, 100);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_2100
     * @tc.desc Verify clamp XSS payload string throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.clamp('<img src=x onerror=alert(1)>', 0, 100);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_2200
     * @tc.desc Verify clamp('0x10', 0, 100) hex string parses as 16 clamped to '16'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp('0x10', 0, 100);
      expect(r.toString()).assertEqual('16');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_2300
     * @tc.desc Verify clamp('1.2.3', 0, 100) throws 401 for double dot string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.clamp('1.2.3', 0, 100);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_2400
     * @tc.desc Verify clamp(5, '10', 100) converges to '10' below string lower bound
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.clamp(5, '10', 100);
      expect(r.toString()).assertEqual('10');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_2500
     * @tc.desc Verify clamp(200, 0, '100') converges to '100' above string upper bound
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.clamp(200, 0, '100');
      expect(r.toString()).assertEqual('100');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_2600
     * @tc.desc Verify clamp(500, '1e3', 1e4) converges to '1000' below scientific bound
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.clamp(500, '1e3', 1e4);
      expect(r.toString()).assertEqual('1000');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_2700
     * @tc.desc Verify clamp(6, 0, '5.5') converges to '5.5' below fractional string max
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.clamp(6, 0, '5.5');
      expect(r.toString()).assertEqual('5.5');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_2800
     * @tc.desc Verify clamp(5, '-Infinity', 10) returns '5' above string infinity bound
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.clamp(5, '-Infinity', 10);
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_2900
     * @tc.desc Verify clamp(5, 0, 'Infinity') returns '5' below string infinity bound
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.clamp(5, 0, 'Infinity');
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_3000
     * @tc.desc Verify clamp(5, 'NaN', 10) returns serializable result or throws, weak
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const r: Decimal = Decimal.clamp(5, 'NaN', 10);
        expect(typeof r.toString()).assertEqual('string');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_3100
     * @tc.desc Verify clamp(5, 0, 'NaN') returns serializable result or throws, weak
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const r: Decimal = Decimal.clamp(5, 0, 'NaN');
        expect(typeof r.toString()).assertEqual('string');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_3200
     * @tc.desc Verify clamp(7, '5', Decimal(10)) mixed three-member types returns '7'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.clamp(7, '5', new Decimal(10));
      expect(r.toString()).assertEqual('7');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_3300
     * @tc.desc Verify clamp('12', 5, Decimal(10)) converges to Decimal max '10'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.clamp('12', 5, new Decimal(10));
      expect(r.toString()).assertEqual('10');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_3400
     * @tc.desc Verify clamp(Decimal(-2), 0, '10') converges to number min '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.clamp(new Decimal(-2), 0, '10');
      expect(r.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_3500
     * @tc.desc Verify clamp(4.5, Decimal(4), '10') returns '4.5' inside mixed range
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.clamp(4.5, new Decimal(4), '10');
      expect(r.toString()).assertEqual('4.5');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_3600
     * @tc.desc Verify clamp('3', Decimal(5), 10) converges to Decimal min '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.clamp('3', new Decimal(5), 10);
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_3700
     * @tc.desc Verify clamp(Decimal(20), '0', 10) converges to number max '10'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.clamp(new Decimal(20), '0', 10);
      expect(r.toString()).assertEqual('10');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_3800
     * @tc.desc Verify clamp(6, 0, 10) all number params returns '6' inside range
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.clamp(6, 0, 10);
      expect(r.toString()).assertEqual('6');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_3900
     * @tc.desc Verify clamp('15', '0', '10') all string params converges to '10'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.clamp('15', '0', '10');
      expect(r.toString()).assertEqual('10');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_4000
     * @tc.desc Verify clamp all Decimal params returns '6' inside range
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.clamp(new Decimal(6), new Decimal(0), new Decimal(10));
      expect(r.toString()).assertEqual('6');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_4100
     * @tc.desc Verify clamp same content 5/'5'/Decimal(5) across params yields same '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Decimal = Decimal.clamp(5, 4, 6);
      const b: Decimal = Decimal.clamp('5', '4', '6');
      const c: Decimal = Decimal.clamp(new Decimal(5), new Decimal(4), new Decimal(6));
      expect(a.toString()).assertEqual('5');
      expect(b.toString()).assertEqual('5');
      expect(c.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_4200
     * @tc.desc Verify clamp(Decimal(5), Decimal(4), '6') returns '5' at lower boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.clamp(new Decimal(5), new Decimal(4), '6');
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_4300
     * @tc.desc Verify clamp(5, 10, 2) throws 10200001 with n between crossed bounds
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.clamp(5, 10, 2);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_4400
     * @tc.desc Verify clamp(50, 10, 2) throws 10200001 with n above both bounds
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.clamp(50, 10, 2);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_4500
     * @tc.desc Verify clamp(-50, 10, 2) throws 10200001 with n below both bounds
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.clamp(-50, 10, 2);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_4600
     * @tc.desc Verify clamp('5', '10', '2') throws 10200001 for all-string min > max
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.clamp('5', '10', '2');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_4700
     * @tc.desc Verify clamp all Decimal min > max throws 10200001 range error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.clamp(new Decimal(5), new Decimal(10), new Decimal(2));
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_4800
     * @tc.desc Verify clamp('5', 10, 2) throws 10200001 string n with crossed bounds
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.clamp('5', 10, 2);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_4900
     * @tc.desc Verify clamp(0, 1e300, -1.5) throws 10200001 for huge min negative max
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.clamp(0, 1e300, -1.5);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_5000
     * @tc.desc Verify clamp(20, 5, 5) converges to '5' above collapsed bound
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.clamp(20, 5, 5);
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_5100
     * @tc.desc Verify clamp(-20, 5, 5) converges to '5' below collapsed bound
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.clamp(-20, 5, 5);
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_5200
     * @tc.desc Verify clamp(5, '5', '5') with string equal bounds returns '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.clamp(5, '5', '5');
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_5300
     * @tc.desc Verify clamp(Decimal(3.5), 0, 10) returns '3.5' Decimal fractional n
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.clamp(new Decimal(3.5), 0, 10);
      expect(r.toString()).assertEqual('3.5');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_5400
     * @tc.desc Verify clamp(5, Decimal(7), 10) converges to Decimal min '7'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.clamp(5, new Decimal(7), 10);
      expect(r.toString()).assertEqual('7');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_5500
     * @tc.desc Verify clamp(5, 0, Decimal(3)) converges to Decimal max '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.clamp(5, 0, new Decimal(3));
      expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_5600
     * @tc.desc Verify clamp('5', 'abc', 10) throws 401 with illegal min first
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.clamp('5', 'abc', 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_5700
     * @tc.desc Verify clamp('5', 0, 'abc') throws 401 with illegal max first
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.clamp('5', 0, 'abc');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_5800
     * @tc.desc Verify clamp('5e1', 0, 50) returns '50' when n equals max boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.clamp('5e1', 0, 50);
      expect(r.toString()).assertEqual('50');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_5900
     * @tc.desc Verify clamp(2500, '2e3', 5000) returns '2500' inside range
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.clamp(2500, '2e3', 5000);
      expect(r.toString()).assertEqual('2500');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_6000
     * @tc.desc Verify clamp(20, 0, '1.5e1') converges to scientific string max '15'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.clamp(20, 0, '1.5e1');
      expect(r.toString()).assertEqual('15');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_6100
     * @tc.desc Verify clamp('8', 0, 20) returns Decimal instance with string toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.clamp('8', 0, 20);
      expect(r instanceof Decimal).assertTrue();
      expect(typeof r.toString()).assertEqual('string');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_6200
     * @tc.desc Verify clamp('9.9', 0, 5).toNumber() equals boundary value 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n: number = Decimal.clamp('9.9', 0, 5).toNumber();
      expect(n).assertEqual(5);
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_6300
     * @tc.desc Verify clamp keeps full precision of high-precision string inside range
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.clamp('123.4567890123456789', 0, '1e30');
      expect(r.toString()).assertEqual('123.4567890123456789');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_6400
     * @tc.desc Verify clamp does not mutate input Decimal n keeping original '50'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Decimal = new Decimal(50);
      const r: Decimal = Decimal.clamp(d, 0, 10);
      expect(r.toString()).assertEqual('10');
      expect(d.toString()).assertEqual('50');
    });

    /**
     * @tc.name testDecimalStaticClampPart02Test0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART02_TEST_6500
     * @tc.desc Verify clamp result supports chained Decimal method plus returning '15'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart02Test0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: string = Decimal.clamp(20, 0, 10).add(5).toString();
      expect(s).assertEqual('15');
    });
  });
}
