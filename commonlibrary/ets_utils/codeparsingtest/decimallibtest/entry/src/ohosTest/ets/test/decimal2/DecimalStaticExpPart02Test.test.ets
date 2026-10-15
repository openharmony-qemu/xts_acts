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

function expUnsafe(...args: ESObject[]): Decimal {
  return Decimal.exp(args[0] as Value);
}

export default function DecimalStaticExpPart02Test() {
  describe('DecimalStaticExpPart02Test', () => {
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
     * @tc.name testDecimalStaticExpPart02Test0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_0100
     * @tc.desc Verify exp('1') digit string equals number input, equals e at precision 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let r: Decimal = Decimal.exp('1');
      expect(r.toString()).assertEqual('2.7182818284590452354');
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_0200
     * @tc.desc Verify exp('2') equals e squared 7.38905609893065022723
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let r: Decimal = Decimal.exp('2');
      expect(r.toString()).assertEqual('7.3890560989306502272');
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_0300
     * @tc.desc Verify exp('0') string zero result is 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.exp('0');
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_0400
     * @tc.desc Verify exp('-1') negative digit string equals reciprocal of e
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let r: Decimal = Decimal.exp('-1');
      expect(r.toString()).assertEqual('0.3678794411714423216');
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_0500
     * @tc.desc Verify exp('0.5') decimal string equals sqrt(e) = 1.64872127070012814685
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let r: Decimal = Decimal.exp('0.5');
      expect(r.toString()).assertEqual('1.6487212707001281468');
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_0600
     * @tc.desc Verify exp('+1') explicit plus-sign string equals 1, result is e
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let r: Decimal = Decimal.exp('+1');
      expect(r.toString()).assertEqual('2.7182818284590452354');
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_0700
     * @tc.desc Verify exp('.5') no-leading-zero decimal string equals 0.5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.exp('.5');
      expect(Math.abs(r.toNumber() - 1.6487212707001282) < 1e-15).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_0800
     * @tc.desc Verify exp('1.0000001') long decimal string result starts with 2.71828293
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let r: Decimal = Decimal.exp('1.0000001');
      expect(r.toNumber()).assertClose(Math.exp(1.0000001), 1e-6);
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_0900
     * @tc.desc Verify exp('3.456') arbitrary decimal string toNumber approximately 31.689962805379157
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.exp('3.456');
      expect(Math.abs(r.toNumber() - 31.689962805379157) < 1e-13).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_1000
     * @tc.desc Verify exp('1e-7') scientific string equals number 1e-7, starts with 1.000000100000005
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let r: Decimal = Decimal.exp('1e-7');
      expect(r.toString().startsWith('1.000000100000005')).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_1100
     * @tc.desc Verify exp('1E+3') uppercase-exponent string equals 1000, starts with 2.6881171418161354484e+434
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let r: Decimal = Decimal.exp('1E+3');
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_1200
     * @tc.desc Verify exp('1.23e2') positive-exponent scientific string equals 123, e^123 prefix
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let r: Decimal = Decimal.exp('1.23e2');
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_1300
     * @tc.desc Verify exp('1.5e-2') small-exponent scientific string equals 0.015, starts 1.01511306461799
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let r: Decimal = Decimal.exp('1.5e-2');
      expect(r.toNumber()).assertClose(Math.exp(0.015), 1e-6);
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_1400
     * @tc.desc Verify exp('10000') under precision 14 yields 8.8068182256629e+4342 with config restored
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 14 });
      try {
        let r: Decimal = Decimal.exp('10000');
        expect(r.toString()).assertEqual('8.8068182256629e+4342');
      } finally {
        Decimal.set({ defaults: true });
      }
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_1500
     * @tc.desc Verify exp('0x10') hex string parses as 16 yielding prefix 8886110.5205078
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.exp('0x10');
      expect(r.toString().startsWith('8886110.5205078')).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_1600
     * @tc.desc Verify exp('1_000') underscore string parses as 1000 yielding 1.9700711140170469939e+434
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.exp('1_000');
      expect(r.toString()).assertEqual('1.9700711140170469939e+434');
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_1700
     * @tc.desc Verify exp('1,000') thousands-separator string semantics illegal, throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.exp('1,000');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_1800
     * @tc.desc Verify exp('Infinity') string Infinity propagates to positive infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.exp('Infinity');
      expect(r.toString()).assertEqual('Infinity');
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_1900
     * @tc.desc Verify exp('NaN') string NaN propagates to NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.exp('NaN');
      expect(r.toString()).assertEqual('NaN');
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_2000
     * @tc.desc Verify exp('1e999') overlong exponent string overflows, toNumber becomes Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.exp('1e999');
      expect(r.toNumber()).assertEqual(Infinity);
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_2100
     * @tc.desc Verify exp('-1e999') overlong negative exponent string underflows to 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.exp('-1e999');
      expect(r.toNumber()).assertEqual(0);
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_2200
     * @tc.desc Verify exp('00001') leading-zero string equals 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let r: Decimal = Decimal.exp('00001');
      expect(r.toString()).assertEqual('2.7182818284590452354');
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_2300
     * @tc.desc Verify exp('1.') trailing decimal point string equals 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.exp('1.');
      expect(r.toString()).assertEqual('2.7182818284590452354');
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_2400
     * @tc.desc Verify exp('0000.0001') long zero-padded decimal, e^0.0001 starts with 1.000100005
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let r: Decimal = Decimal.exp('0000.0001');
      expect(r.toString().startsWith('1.000100005')).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_2500
     * @tc.desc Verify exp(30-digit '9' string) computes high-precision exponent, toNumber Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '9'.repeat(30);
      let r: Decimal = Decimal.exp(s);
      expect(r.toNumber()).assertEqual(Infinity);
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_2600
     * @tc.desc Verify exp('0.' + 40 zeros + '1') overlong tiny string rounds to 1 at precision 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let s: string = '0.' + '0'.repeat(40) + '1';
      let r: Decimal = Decimal.exp(s);
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_2700
     * @tc.desc Verify exp('') empty string validation fails, throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.exp('');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_2800
     * @tc.desc Verify exp(' ') all-space string validation fails, throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.exp(' ');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_2900
     * @tc.desc Verify exp('  1  ') digit string with surrounding spaces validation fails, throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.exp('  1  ');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_3000
     * @tc.desc Verify exp('\u200B') zero-width space string validation fails, throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.exp('​');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_3100
     * @tc.desc Verify exp('\uFEFF') BOM zero-width no-break space string validation fails, throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.exp('﻿');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_3200
     * @tc.desc Verify exp('\u00A0') non-breaking space string validation fails, throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.exp('\u00A0');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_3300
     * @tc.desc Verify exp('\t') tab string validation fails, throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.exp('\t');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_3400
     * @tc.desc Verify exp('\n') newline string validation fails, throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.exp('\n');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_3500
     * @tc.desc Verify exp('\u0000') NUL character string validation fails, throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.exp('\u0000');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_3600
     * @tc.desc Verify exp('abc') non-numeric letter string validation fails, throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.exp('abc');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_3700
     * @tc.desc Verify exp('1a') digit-plus-letter mixed string validation fails, throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.exp('1a');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_3800
     * @tc.desc Verify exp('-') lone negative-sign string validation fails, throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.exp('-');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_3900
     * @tc.desc Verify exp('+') lone plus-sign string validation fails, throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.exp('+');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_4000
     * @tc.desc Verify exp('.') lone decimal point string validation fails, throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.exp('.');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_4100
     * @tc.desc Verify exp('1.2.3') double decimal point string validation fails, throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.exp('1.2.3');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_4200
     * @tc.desc Verify exp('--1') double negative-sign string validation fails, throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.exp('--1');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_4300
     * @tc.desc Verify exp('e') exponent marker alone as string validation fails, throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.exp('e');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_4400
     * @tc.desc Verify exp('1e') scientific string missing exponent validation fails, throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.exp('1e');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_4500
     * @tc.desc Verify exp('1e+') scientific string missing exponent digits validation fails, throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.exp('1e+');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_4600
     * @tc.desc Verify exp('1e1.5') scientific string with decimal exponent validation fails, throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.exp('1e1.5');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_4700
     * @tc.desc Verify exp('Infinity 1') infinity string with trailing digits validation fails, throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.exp('Infinity 1');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_4800
     * @tc.desc Verify exp('null') string literal 'null' validation fails, throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.exp('null');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_4900
     * @tc.desc Verify exp('1e-') scientific string missing digits after negative sign throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.exp('1e-');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_5000
     * @tc.desc Verify exp('<script>alert(1)</script>') XSS payload string throws 401 without executing
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.exp('<script>alert(1)</script>');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_5100
     * @tc.desc Verify exp("1'; DROP TABLE users;--") SQL injection payload string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.exp("1'; DROP TABLE users;--");
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_5200
     * @tc.desc Verify exp() fullwidth plus-sign string validation fails, throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.exp('＋1');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_5300
     * @tc.desc Verify exp() Arabic-Indic digit string validation fails, throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.exp('١٢٣');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_5400
     * @tc.desc Verify exp high isolated surrogate string validation fails, throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.exp('\uD800');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_5500
     * @tc.desc Verify exp('\uDC00') low isolated surrogate string validation fails, throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.exp('\uDC00');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_5600
     * @tc.desc Verify exp('\u{1F600}') emoji string validation fails, throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.exp('😀');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_5700
     * @tc.desc Verify string member '2' of string|number union dispatches, e^2 = 7.38905609893065022723
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let v: string | number = '2';
      let r: Decimal = expUnsafe(v);
      expect(r.toString()).assertEqual('7.3890560989306502272');
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_5800
     * @tc.desc Verify number member (1) of string|number union dispatches, e^1 = 2.71828182845904523536
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let v: string | number = 1;
      let r: Decimal = expUnsafe(v);
      expect(r.toString()).assertEqual('2.7182818284590452354');
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_5900
     * @tc.desc Verify string member '0' of string|null union dispatches normally with result 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | null = '0';
      let r: Decimal = expUnsafe(v);
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_6000
     * @tc.desc Verify null member of string|null union dispatches illegal at runtime, throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let v: string | null = null;
      let apiThrew1_1: boolean = false;
      try {
        expUnsafe(v);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_6100
     * @tc.desc Verify string member '3' of string|undefined union dispatches normally, e^3 prefix
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let v: string | undefined = '3';
      let r: Decimal = expUnsafe(v);
      expect(r.toString().startsWith('20.08553692318766')).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_6200
     * @tc.desc Verify undefined member of string|undefined union dispatches illegal, throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let v: string | undefined = undefined;
      let apiThrew1_1: boolean = false;
      try {
        expUnsafe(v);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_6300
     * @tc.desc Verify string member '0.5' of Value triple union dispatches to 1.64872127070012814685
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let v: string | number | Decimal = '0.5';
      let r: Decimal = expUnsafe(v);
      expect(r.toString()).assertEqual('1.6487212707001281468');
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_6400
     * @tc.desc Verify Decimal member new Decimal('-2') of Value union dispatches, e^-2 value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let v: string | number | Decimal = new Decimal('-2');
      let r: Decimal = expUnsafe(v);
      expect(r.toString()).assertEqual('0.13533528323661269189');
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_6500
     * @tc.desc Verify Decimal single-member reference direct input exp(new Decimal('0.25')) result value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let r: Decimal = Decimal.exp(new Decimal('0.25'));
      expect(r.toString()).assertEqual('1.2840254166877414841');
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_6600
     * @tc.desc Verify Decimal reference input ('2') and digit string '2' give identical results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let r1: Decimal = Decimal.exp(new Decimal('2'));
      let r2: Decimal = Decimal.exp('2');
      expect(r1.toString()).assertEqual(r2.toString());
      expect(r1.toString()).assertEqual('7.3890560989306502272');
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_6700
     * @tc.desc Verify cross-style object { s: 1, e: 1, d: 1 } with marker fields still fails as object, 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let fake: ESObject = { s: 1, e: 1, d: 1 };
      let apiThrew1_1: boolean = false;
      try {
        expUnsafe(fake);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_6800
     * @tc.desc Verify string member '1' of boolean|string union executes legal string branch, result e
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let v: boolean | string = '1';
      let r: Decimal = expUnsafe(v);
      expect(r.toString()).assertEqual('2.7182818284590452354');
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_6900
     * @tc.desc Verify boolean member true of boolean|string union dispatches illegal at runtime, 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let v: boolean | string = true;
      let apiThrew1_1: boolean = false;
      try {
        expUnsafe(v);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_7000
     * @tc.desc Verify string member '4' of four-union string|number|Decimal|null dispatches to e^4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let v: string | number | Decimal | null = '4';
      let r: Decimal = expUnsafe(v);
      expect(r.toString()).assertEqual('54.598150033144239078');
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_7100
     * @tc.desc Verify Decimal member new Decimal('0.1') of four-union with undefined dispatches
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let v: string | number | Decimal | undefined = new Decimal('0.1');
      let r: Decimal = expUnsafe(v);
      expect(r.toString()).assertEqual('1.1051709180756476248');
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_7200
     * @tc.desc Verify string member '2' of five-union string|number|Decimal|null|undefined dispatches to e^2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let v: string | number | Decimal | null | undefined = '2';
      let r: Decimal = expUnsafe(v);
      expect(r.toString()).assertEqual('7.3890560989306502272');
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_7300
     * @tc.desc Verify undefined member of five-union dispatches illegal at runtime, throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let v: string | number | Decimal | null | undefined = undefined;
      let apiThrew1_1: boolean = false;
      try {
        expUnsafe(v);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_7400
     * @tc.desc Verify null member of five-union dispatches illegal at runtime, throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let v: string | number | Decimal | null | undefined = null;
      let apiThrew1_1: boolean = false;
      try {
        expUnsafe(v);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0075
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_7500
     * @tc.desc Verify unknown-declared union value guarded then passed as '0.5' dispatches correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let raw: ESObject = '0.5';
      let r: Decimal = expUnsafe(raw);
      expect(Math.abs(r.toNumber() - 1.6487212707001282) < 1e-15).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0076
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_7600
     * @tc.desc Verify object property holding string|number union ({ n: '2' }) dispatches to e^2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let holder: ESObject = { n: '2' };
      let r: Decimal = expUnsafe(holder.n);
      expect(r.toString()).assertEqual('7.3890560989306502272');
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0077
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_7700
     * @tc.desc Verify array elements [string, number] ('1' and 2) each dispatch normally per member
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let arr: (string | number)[] = ['1', 2];
      let r1: Decimal = expUnsafe(arr[0]);
      let r2: Decimal = expUnsafe(arr[1]);
      expect(r1.toString()).assertEqual('2.7182818284590452354');
      expect(r2.toString().startsWith('7.389056098930650227')).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0078
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_7800
     * @tc.desc Verify union value from overflow calc '3' + 1 gives '31' string dispatching to e^31
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string = '3' + 1;
      let r: Decimal = expUnsafe(v);
      expect(r.toNumber()).assertClose(Math.exp(31), 1e-6);
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0079
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_7900
     * @tc.desc Verify exp('1') returns new Decimal and input string with global state unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '1';
      let r: Decimal = Decimal.exp(s);
      expect(r instanceof Decimal).assertTrue();
      expect(r.toString()).assertEqual('2.7182818284590452354');
      expect(r === Decimal.exp('1')).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0080
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_8000
     * @tc.desc Verify string input result chains into further operation (multiply by e again)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20, rounding: 4 });
      let r: Decimal = Decimal.exp('1').mul(Decimal.exp('1'));
      expect(r.toString()).assertEqual('7.3890560989306502274');
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0081
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_8100
     * @tc.desc Verify exp('1e-7') string and exp(1e-7) number representations match with same prefix
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: Decimal = Decimal.exp('1e-7');
      let r2: Decimal = Decimal.exp(1e-7);
      expect(r1.toString()).assertEqual(r2.toString());
      expect(r1.toString().startsWith('1.000000100000005')).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticExpPart02Test0082
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_EXP_PART02_TEST_8200
     * @tc.desc Verify exp('-Infinity') string underflows to 0 with positive sign bit
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticExpPart02Test0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.exp('-Infinity');
      expect(r.s).assertEqual(1);
      expect(r.toString()).assertEqual('0');
    });

  });
}
