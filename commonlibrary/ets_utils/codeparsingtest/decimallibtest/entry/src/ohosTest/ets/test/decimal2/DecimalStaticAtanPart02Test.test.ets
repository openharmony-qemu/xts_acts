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

function atanUnsafe(...args: ESObject[]): Decimal {
  return Decimal.atan(args[0] as Value);
}

export default function DecimalStaticAtanPart02Test() {
  describe('DecimalStaticAtanPart02Test', () => {
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
     * @tc.name testDecimalStaticAtanPart02Test0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_0100
     * @tc.desc Verify extra second string argument is ignored and result matches single call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = Decimal.atan('0.75');
      const r2: Decimal = atanUnsafe('0.75', 'ignored');
      expect(r1.toString()).assertEqual(r2.toString());
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_0200
     * @tc.desc Verify atan('-0') equals atan('0') in value semantics
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.atan('-0').toString()).assertEqual(Decimal.atan('0').toString());
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_0300
     * @tc.desc Verify atan('1') equals pi/4 20-digit '0.78539816339744830962'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.atan('1').toString()).assertEqual('0.78539816339744830962');
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_0400
     * @tc.desc Verify atan('-1') equals -pi/4 20-digit '-0.78539816339744830962'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.atan('-1').toString()).assertEqual('-0.78539816339744830962');
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_0500
     * @tc.desc Verify atan('0.5') differs from Math.atan(0.5) by less than 1e-15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const diff: number = Math.abs(Decimal.atan('0.5').toNumber() - Math.atan(0.5));
      expect(diff < 1e-15).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_0600
     * @tc.desc Verify atan('-0.5') differs from Math.atan(-0.5) by less than 1e-15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const diff: number = Math.abs(Decimal.atan('-0.5').toNumber() - Math.atan(-0.5));
      expect(diff < 1e-15).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_0700
     * @tc.desc Verify atan('2') differs from Math.atan(2) by less than 1e-15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const diff: number = Math.abs(Decimal.atan('2').toNumber() - Math.atan(2));
      expect(diff < 1e-15).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_0800
     * @tc.desc Verify atan('-2') differs from Math.atan(-2) by less than 1e-15 symmetric
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const diff: number = Math.abs(Decimal.atan('-2').toNumber() - Math.atan(-2));
      expect(diff < 1e-15).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_0900
     * @tc.desc Verify atan('10') near pi/2 differs from Math.atan(10) by less than 1e-15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const diff: number = Math.abs(Decimal.atan('10').toNumber() - Math.atan(10));
      expect(diff < 1e-15).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_1000
     * @tc.desc Verify atan('0.7071067811865476') sqrt2/2 differs from Math.atan by 1e-15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const diff: number = Math.abs(Decimal.atan('0.7071067811865476').toNumber() - Math.atan(0.7071067811865476));
      expect(diff < 1e-15).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_1100
     * @tc.desc Verify atan('0.9') near range upper differs from Math.atan(0.9) by 1e-15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const diff: number = Math.abs(Decimal.atan('0.9').toNumber() - Math.atan(0.9));
      expect(diff < 1e-15).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_1200
     * @tc.desc Verify trailing-zero string '0.750' result equals '0.75' result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.atan('0.750').toString()).assertEqual(Decimal.atan('0.75').toString());
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_1300
     * @tc.desc Verify leading-zero string '00.75' normalizes to 0.75 result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.atan('00.75').toString()).assertEqual('0.6435011087932843868');
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_1400
     * @tc.desc Verify plus-sign string '+0.75' parses as 0.75 same as '0.75'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.atan('+0.75').toString()).assertEqual('0.6435011087932843868');
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_1500
     * @tc.desc Verify scientific string '7.5e-1' result equals '0.75' result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.atan('7.5e-1').toString()).assertEqual('0.6435011087932843868');
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_1600
     * @tc.desc Verify uppercase-E string '7.5E-1' result equals '0.75' result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.atan('7.5E-1').toString()).assertEqual('0.6435011087932843868');
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_1700
     * @tc.desc Verify no-integer-part string '.75' parses as 0.75 same as '0.75'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.atan('.75').toString()).assertEqual('0.6435011087932843868');
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_1800
     * @tc.desc Verify hex string '0x10' parses as 16 matching atan(16) result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.atan('0x10').toString()).assertEqual(Decimal.atan(16).toString());
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_1900
     * @tc.desc Verify multi-trailing-zero string '0.7500000000000000000' result equals '0.75'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.atan('0.7500000000000000000').toString()).assertEqual('0.6435011087932843868');
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_2000
     * @tc.desc Verify large '1e3' atan near pi/2 differs from Math.atan(1000) by 1e-15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const diff: number = Math.abs(Decimal.atan('1e3').toNumber() - Math.atan(1000));
      expect(diff < 1e-15).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_2100
     * @tc.desc Verify negative large '-1e3' atan near -pi/2 differs from Math.atan by 1e-15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const diff: number = Math.abs(Decimal.atan('-1e3').toNumber() - Math.atan(-1000));
      expect(diff < 1e-15).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_2200
     * @tc.desc Verify huge '1e20' atan saturates to pi/2 within 1e-15 of Math.atan(1e20)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const diff: number = Math.abs(Decimal.atan('1e20').toNumber() - Math.atan(1e20));
      expect(diff < 1e-15).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_2300
     * @tc.desc Verify extreme '1e308' atan is finite no-throw and matches Math.atan(1e308)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.atan('1e308');
      expect(r.isFinite()).assertTrue();
      expect(Math.abs(r.toNumber() - Math.atan(1e308)) < 1e-15).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_2400
     * @tc.desc Verify tiny '1e-7' atan differs from Math.atan(1e-7) by less than 1e-15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const diff: number = Math.abs(Decimal.atan('1e-7').toNumber() - Math.atan(1e-7));
      expect(diff < 1e-15).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_2500
     * @tc.desc Verify empty string '' invalid throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan('');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_2600
     * @tc.desc Verify all-spaces string '   ' invalid throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan('   ');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_2700
     * @tc.desc Verify zero-width-space-only string invalid throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan('​');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_2800
     * @tc.desc Verify NUL-character-only string invalid throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan('\u0000');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_2900
     * @tc.desc Verify atan('5') plain digit string parses as 5 within Math.atan tolerance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan('5');
      expect(Math.abs(r.toNumber() - Math.atan(5)) < 1e-15).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_3000
     * @tc.desc Verify escaped control characters '\t\n' invalid throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan('\t\n');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_3100
     * @tc.desc Verify Unicode fraction character  invalid throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan('½');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_3200
     * @tc.desc Verify emoji-only string invalid throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan('😀');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_3300
     * @tc.desc Verify lone surrogate invalid string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan('\uD800');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_3400
     * @tc.desc Verify XSS script string '<script>alert(1)</script>' invalid throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan('<script>alert(1)</script>');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_3500
     * @tc.desc Verify HTML attribute injection string invalid throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan('"><img src=x onerror=alert(1)>');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_3600
     * @tc.desc Verify multi-sign string '+-5' invalid throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan('+-5');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_3700
     * @tc.desc Verify digit-with-suffix string '5a' invalid throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan('5a');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_3800
     * @tc.desc Verify binary-prefix string '0b10' parses as 2 returning '1.107148717794090503'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan('0b10');
      expect(r.toString()).assertEqual('1.107148717794090503');
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_3900
     * @tc.desc Verify exponent-overflow string saturates atan to pi/2 value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atan('1e+100000000000000000000');
      expect(r.toString()).assertEqual('1.5707963267948966192');
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_4000
     * @tc.desc Verify Arabic-Indic digit string is non-decimal format and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan('٠١٢');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_4100
     * @tc.desc Verify string|number union same value '0.75' and 0.75 give equal results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.atan('0.75').toString()).assertEqual(Decimal.atan(0.75).toString());
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_4200
     * @tc.desc Verify string|Decimal union same value '0.75' and Decimal give equal results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.atan('0.75').toString()).assertEqual(Decimal.atan(new Decimal('0.75')).toString());
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_4300
     * @tc.desc Verify number|Decimal union 0.75 and new Decimal(0.75) give equal results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.atan(0.75).toString()).assertEqual(Decimal.atan(new Decimal(0.75)).toString());
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_4400
     * @tc.desc Verify three-union members of 0.75 give identical results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Decimal = Decimal.atan('0.75');
      const b: Decimal = Decimal.atan(0.75);
      const c: Decimal = Decimal.atan(new Decimal('0.75'));
      expect(a.toString()).assertEqual(b.toString());
      expect(b.toString()).assertEqual(c.toString());
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_4500
     * @tc.desc Verify three-union negative members '-1', -1, Decimal('-1') give equal results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.atan('-1').toString()).assertEqual(Decimal.atan(-1).toString());
      expect(Decimal.atan(-1).toString()).assertEqual(Decimal.atan(new Decimal('-1')).toString());
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_4600
     * @tc.desc Verify four representations of 0.5 all give identical atan results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: Decimal = Decimal.atan('0.5');
      const v2: Decimal = Decimal.atan(0.5);
      const v3: Decimal = Decimal.atan(new Decimal('0.5'));
      const v4: Decimal = Decimal.atan(new Decimal(0.5));
      expect(v1.toString()).assertEqual(v2.toString());
      expect(v2.toString()).assertEqual(v3.toString());
      expect(v3.toString()).assertEqual(v4.toString());
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_4700
     * @tc.desc Verify computed Decimal 0.5+0.25 equals direct '0.75' input result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const viaComputed: Decimal = new Decimal('0.5').add('0.25');
      expect(Decimal.atan(viaComputed).toString()).assertEqual(Decimal.atan('0.75').toString());
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_4800
     * @tc.desc Verify non-union Date object member is rejected with 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        atanUnsafe(new Date());
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_4900
     * @tc.desc Verify non-union Array [0.75] member is rejected with 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        atanUnsafe([0.75]);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_5000
     * @tc.desc Verify non-union Map object member is rejected with 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        atanUnsafe(new Map<string, number>());
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_5100
     * @tc.desc Verify non-union RegExp member is rejected with 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        atanUnsafe(new RegExp('^0.75$'));
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_5200
     * @tc.desc Verify non-union Error instance member is rejected with 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        atanUnsafe(new Error('boom'));
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_5300
     * @tc.desc Verify atan(Decimal) keeps source object unchanged and returns new value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Decimal = new Decimal('0.75');
      const r: Decimal = Decimal.atan(src);
      expect(src.toString()).assertEqual('0.75');
      expect(r.toString()).assertEqual('0.6435011087932843868');
      expect(r === src).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_5400
     * @tc.desc Verify two consecutive atan calls return different objects with equal values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = Decimal.atan('0.75');
      const r2: Decimal = Decimal.atan('0.75');
      expect(r1 === r2).assertFalse();
      expect(r1.toString()).assertEqual(r2.toString());
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_5500
     * @tc.desc Verify NUL plus zero-width-space mixed string invalid throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan('\u0000\u200b');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_5600
     * @tc.desc Verify padded '  0.75  ' either throws 401 or parses as 0.75 weak assertion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw: boolean = false;
      try {
        Decimal.atan('  0.75  ');
      } catch (e) {
        threw = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(threw || Decimal.atan('  0.75  ').toNumber() === 0.75).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_5700
     * @tc.desc Verify lone dot '.' without digits invalid throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan('.');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_5800
     * @tc.desc Verify lone exponent 'e' without coefficient invalid throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atan('e');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanPart02Test0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATAN_PART02_TEST_5900
     * @tc.desc Verify string|Decimal union endpoint Decimal('-1') equals '-1' result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanPart02Test0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.atan(new Decimal('-1')).toString()).assertEqual(Decimal.atan('-1').toString());
    });
  });
}
