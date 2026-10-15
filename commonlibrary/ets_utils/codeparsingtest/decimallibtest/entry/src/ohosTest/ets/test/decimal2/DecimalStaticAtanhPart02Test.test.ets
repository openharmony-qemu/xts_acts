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

function atanhUnsafe(...args: ESObject[]): Decimal {
  return Decimal.atanh(args[0] as Value);
}

export default function DecimalStaticAtanhPart02Test() {
  describe('DecimalStaticAtanhPart02Test', () => {
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
     * @tc.name testDecimalStaticAtanhPart02Test0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_0100
     * @tc.desc Verify trailing mixed-type arguments are ignored and result equals single-arg call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Decimal = Decimal.atanh('0.5');
      const r2: Decimal = atanhUnsafe('0.5', 'extra', 3, true, new Decimal('0.5'));
      expect(r1.toString()).assertEqual(r2.toString());
      expect(r1.toString()).assertEqual('0.5493061443340548457');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_0200
     * @tc.desc Verify atanh('0') returns '0' and isZero true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.atanh('0');
      expect(r.toString()).assertEqual('0');
      expect(r.isZero()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_0300
     * @tc.desc Verify atanh('-0') keeps negative zero sign with isNegative true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.atanh('-0');
      expect(r.toString()).assertEqual('0');
      expect(r.isNegative()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_0400
     * @tc.desc Verify atanh('0.0000') trailing zeros normalize to '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.atanh('0.0000');
      expect(r.toString()).assertEqual('0');
      expect(r.isZero()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_0500
     * @tc.desc Verify atanh('0.5') returns canonical anchor value with 20 significant digits
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.atanh('0.5');
      expect(r.toString()).assertEqual('0.5493061443340548457');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_0600
     * @tc.desc Verify atanh('-0.5') returns negative anchor value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.atanh('-0.5');
      expect(r.toString()).assertEqual('-0.5493061443340548457');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_0700
     * @tc.desc Verify atanh('0.25') returns exact decimal string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.atanh('0.25');
      expect(r.toString()).assertEqual('0.2554128118829953416');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_0800
     * @tc.desc Verify atanh('0.75') returns exact string with value between 1 and 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.atanh('0.75');
      expect(r.toString()).assertEqual('0.97295507452765665255');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_0900
     * @tc.desc Verify atanh('0.9') returns result greater than 1 without exponent overflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.atanh('0.9');
      expect(r.toString()).assertEqual('1.47221948958322023');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_1000
     * @tc.desc Verify atanh('-0.9') negative large-value branch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.atanh('-0.9');
      expect(r.toString()).assertEqual('-1.47221948958322023');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_1100
     * @tc.desc Verify atanh('0.01') small-value asymptotic behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.atanh('0.01');
      expect(r.toString()).assertEqual('0.010000333353334762016');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_1200
     * @tc.desc Verify atanh('0.001') smaller-value asymptotic behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.atanh('0.001');
      expect(r.toString()).assertEqual('0.0010000003333335333335');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_1300
     * @tc.desc Verify atanh('0.1') exact decimal parsing result of 0.1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.atanh('0.1');
      expect(r.toString()).assertEqual('0.10033534773107558064');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_1400
     * @tc.desc Verify atanh('+0.5') explicit plus sign matches '0.5' result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.atanh('+0.5');
      expect(r.toString()).assertEqual('0.5493061443340548457');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_1500
     * @tc.desc Verify atanh('0.50') trailing zero normalizes to '0.5' with same result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.atanh('0.50');
      expect(r.toString()).assertEqual('0.5493061443340548457');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_1600
     * @tc.desc Verify atanh('00.5') leading zeros normalize to '0.5' with same result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.atanh('00.5');
      expect(r.toString()).assertEqual('0.5493061443340548457');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_1700
     * @tc.desc Verify atanh('.5') leading decimal point parses as 0.5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.atanh('.5');
      expect(r.toString()).assertEqual('0.5493061443340548457');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_1800
     * @tc.desc Verify atanh('0.5e0') zero exponent matches '0.5' result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.atanh('0.5e0');
      expect(r.toString()).assertEqual('0.5493061443340548457');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_1900
     * @tc.desc Verify atanh('5e-1') numerically equals '0.5' input representation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Decimal = Decimal.atanh('5e-1');
      const b: Decimal = Decimal.atanh('0.5');
      expect(a.toString()).assertEqual(b.toString());
      expect(a.toString()).assertEqual('0.5493061443340548457');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_2000
     * @tc.desc Verify atanh('0.9999999999') ten nines returns exponential large value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.atanh('0.9999999999');
      expect(r.toString()).assertEqual('11.859499055225201075');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_2100
     * @tc.desc Verify atanh('-0.9999999999') near -1 returns negative large value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.atanh('-0.9999999999');
      expect(r.toString()).assertEqual('-11.859499055225201075');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_2200
     * @tc.desc Verify atanh('0.9999999999999999') 16 nines returns exact value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.atanh('0.9999999999999999');
      expect(r.toString()).assertEqual('18.767254334232338102');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_2300
     * @tc.desc Verify string vs number 0.9999999999999999 inputs produce different results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Decimal = Decimal.atanh('0.9999999999999999');
      const n: Decimal = Decimal.atanh(0.9999999999999999);
      expect(s.toString()).assertEqual('18.767254334232338102');
      expect(n.toString()).assertEqual('18.767254334232338102');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_2400
     * @tc.desc Verify 28-digit string '0.'+28 nines still computes precisely
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '0.';
      for (let i: number = 0; i < 28; i++) {
        s = s + '9';
      }
      const r: Decimal = Decimal.atanh(s);
      expect(r.toString()).assertEqual('32.582764892196612231');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_2500
     * @tc.desc Verify 100-nines string returns finite large value without 10200060
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '0.';
      for (let i: number = 0; i < 100; i++) {
        s = s + '9';
      }
      const r: Decimal = Decimal.atanh(s);
      expect(r.toString()).assertEqual('115.47582823998225686');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_2600
     * @tc.desc Verify 1000-nines near-1 string returns finite value about 1151.6 without throw
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '0.';
      for (let i: number = 0; i < 1000; i++) {
        s = s + '9';
      }
      const n: number = Decimal.atanh(s).toNumber();
      expect(Number.isFinite(n)).assertTrue();
      expect(n > 1151).assertTrue();
      expect(n < 1152).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_2700
     * @tc.desc Verify 1e-10000 tiny string equals input itself at 20-digit precision
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '0.';
      for (let i: number = 0; i < 10000; i++) {
        s = s + '0';
      }
      s = s + '1';
      const r: Decimal = Decimal.atanh(s);
      expect(r.toString()).assertEqual('1e-10001');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_2800
     * @tc.desc Verify atanh('1') domain right endpoint returns +Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.atanh('1');
      expect(r.toString()).assertEqual('Infinity');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_2900
     * @tc.desc Verify atanh('-1') domain left endpoint returns -Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.atanh('-1');
      expect(r.toString()).assertEqual('-Infinity');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_3000
     * @tc.desc Verify atanh('2') beyond domain returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.atanh('2');
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_3100
     * @tc.desc Verify atanh('-2') negative beyond domain returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.atanh('-2');
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_3200
     * @tc.desc Verify atanh('1.5') out-of-domain non-integer returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.atanh('1.5');
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_3300
     * @tc.desc Verify atanh('NaN') legal numeric string propagates NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.atanh('NaN');
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_3400
     * @tc.desc Verify atanh('Infinity') legal representation returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.atanh('Infinity');
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_3500
     * @tc.desc Verify atanh('1e-7') scientific notation result appears in exponential form
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.atanh('1e-7');
      expect(r.toString()).assertEqual('1.0000000000000033333e-7');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_3600
     * @tc.desc Verify atanh('1e-9') still carries correction term at 20-digit precision
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.atanh('1e-9');
      expect(r.toString()).assertEqual('1.0000000000000000003e-9');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_3700
     * @tc.desc Verify atanh('1e-10') equals input itself at 20-digit precision
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.atanh('1e-10');
      expect(r.toString()).assertEqual('1e-10');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_3800
     * @tc.desc Verify empty string input throws 401 parameter validation failure
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atanh('');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_3900
     * @tc.desc Verify all-spaces string input throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atanh('   ');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_4000
     * @tc.desc Verify ' 0.5 ' with surrounding spaces is not trimmed and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atanh(' 0.5 ');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_4100
     * @tc.desc Verify zero-width space string input throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atanh('​');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_4200
     * @tc.desc Verify atanh(' ') single space string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atanh(' ');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_4300
     * @tc.desc Verify tab character string input throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atanh('\t');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_4400
     * @tc.desc Verify newline character string input throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atanh('\n');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_4500
     * @tc.desc Verify carriage return character string input throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atanh('\r');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_4600
     * @tc.desc Verify backspace escape string input throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atanh('\b');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_4700
     * @tc.desc Verify pure letters string 'abc' input throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atanh('abc');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_4800
     * @tc.desc Verify trailing letters mixed string '123abc' input throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atanh('123abc');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_4900
     * @tc.desc Verify leading letters mixed string 'abc123' input throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atanh('abc123');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_5000
     * @tc.desc Verify thousands-separator comma string '1,234.5' input throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atanh('1,234.5');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_5100
     * @tc.desc Verify hex prefix string '0x10' parses as 16, outside atanh domain returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atanh('0x10');
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_5200
     * @tc.desc Verify binary prefix string '0b1010' parses as 10, outside atanh domain returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.atanh('0b1010');
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_5300
     * @tc.desc Verify incomplete exponent string '1e' input throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atanh('1e');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_5400
     * @tc.desc Verify pure exponent string 'e5' input throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atanh('e5');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_5500
     * @tc.desc Verify double decimal point string '1.2.3' input throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atanh('1.2.3');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_5600
     * @tc.desc Verify double negative sign string '--5' input throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atanh('--5');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_5700
     * @tc.desc Verify mixed sign string '+-5' input throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atanh('+-5');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_5800
     * @tc.desc Verify isolated decimal point string '.' input throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atanh('.');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_5900
     * @tc.desc Verify isolated minus sign string '-' input throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atanh('-');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_6000
     * @tc.desc Verify emoji-suffixed string  input throws 401 as non-numeric
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atanh('0.5😀');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_6100
     * @tc.desc Verify lone high surrogate string input throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atanh('0.5\uD800');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_6200
     * @tc.desc Verify XSS script string input throws 401 without interpretation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atanh('<script>alert(1)</script>');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_6300
     * @tc.desc Verify fullwidth digits string input throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atanh('０.５');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_6400
     * @tc.desc Verify BOM-prefixed string input throws 401 as BOM is non-numeric
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atanh('﻿0.5');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_6500
     * @tc.desc Verify 100000-letter extra-long illegal string input throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        let s: string = '';
        for (let i: number = 0; i < 100000; i++) {
        s = s + 'a';
        }
        Decimal.atanh(s);
        expect().assertFail();
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_6600
     * @tc.desc Verify three-union members of same value 0.5 all dispatch to anchor result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Decimal = Decimal.atanh('0.5');
      const n: Decimal = Decimal.atanh(0.5);
      const d: Decimal = Decimal.atanh(new Decimal('0.5'));
      expect(s.toString()).assertEqual('0.5493061443340548457');
      expect(n.toString()).assertEqual('0.5493061443340548457');
      expect(d.toString()).assertEqual(s.toString());
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_6700
     * @tc.desc Verify negative three-union members all yield negative anchor result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Decimal = Decimal.atanh('-0.5');
      const n: Decimal = Decimal.atanh(-0.5);
      const d: Decimal = Decimal.atanh(new Decimal('-0.5'));
      expect(s.toString()).assertEqual('-0.5493061443340548457');
      expect(n.toString()).assertEqual('-0.5493061443340548457');
      expect(d.toString()).assertEqual(s.toString());
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_6800
     * @tc.desc Verify string|number two-union same value 0.25 dispatches consistently
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Decimal = Decimal.atanh('0.25');
      const n: Decimal = Decimal.atanh(0.25);
      expect(s.toString()).assertEqual(n.toString());
      expect(s.toString()).assertEqual('0.2554128118829953416');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_6900
     * @tc.desc Verify string|Decimal two-union same value 0.3 yields consistent results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Decimal = Decimal.atanh('0.3');
      const d: Decimal = Decimal.atanh(new Decimal('0.3'));
      expect(s.toString()).assertEqual(d.toString());
      expect(s.toString()).assertEqual('0.30951960420311171547');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_7000
     * @tc.desc Verify number|Decimal two-union same value 0.4 yields consistent results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n: Decimal = Decimal.atanh(0.4);
      const d: Decimal = Decimal.atanh(new Decimal(0.4));
      expect(n.toString()).assertEqual(d.toString());
      expect(n.equals(d)).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_7100
     * @tc.desc Verify four-union representations of 0.75 all produce identical results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Decimal = Decimal.atanh('0.75');
      const b: Decimal = Decimal.atanh(0.75);
      const c: Decimal = Decimal.atanh(new Decimal('0.75'));
      const d: Decimal = Decimal.atanh(new Decimal(0.75));
      expect(a.toString()).assertEqual('0.97295507452765665255');
      expect(b.toString()).assertEqual('0.97295507452765665255');
      expect(c.toString()).assertEqual('0.97295507452765665255');
      expect(d.toString()).assertEqual('0.97295507452765665255');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_7200
     * @tc.desc Verify five-union representations of 0.5 all produce identical results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Decimal = Decimal.atanh('0.5');
      const b: Decimal = Decimal.atanh(0.5);
      const c: Decimal = Decimal.atanh(new Decimal('0.5'));
      const d: Decimal = Decimal.atanh('5e-1');
      const e: Decimal = Decimal.atanh(new Decimal(0.5));
      expect(a.equals(b)).assertTrue();
      expect(b.equals(c)).assertTrue();
      expect(c.equals(d)).assertTrue();
      expect(a.toString()).assertEqual('0.5493061443340548457');
      expect(e.toString()).assertEqual(a.toString());
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_7300
     * @tc.desc Verify two Decimal '0.2' instances with different references yield equal results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Decimal = new Decimal('0.2');
      const d2: Decimal = new Decimal('0.2');
      expect(d1 === d2).assertFalse();
      expect(Decimal.atanh(d1).toString()).assertEqual('0.20273255405408219099');
      expect(Decimal.atanh(d1).equals(Decimal.atanh(d2))).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_7400
     * @tc.desc Verify null member of string|null union is not Value and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let v: string | null = null;
      const arg: ESObject = v;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atanh(arg as Value);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0075
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_7500
     * @tc.desc Verify undefined member of number|undefined union is not Value and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let v: number | undefined = undefined;
      const arg: ESObject = v;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atanh(arg as Value);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0076
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_7600
     * @tc.desc Verify boolean member of string|boolean union is not Value and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let v: string | boolean = true;
      const arg: ESObject = v;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.atanh(arg as Value);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0077
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_7700
     * @tc.desc Verify object literal is not a Value union member and atanh throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        atanhUnsafe({});
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0078
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_7800
     * @tc.desc Verify boolean true is not a Value union member and atanh throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        atanhUnsafe(true);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0079
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_7900
     * @tc.desc Verify valueOf/toString cross-shape object is not Value and atanh throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        const obj: ESObject = {
        toString: (): string => { return '0.5'; },
        valueOf: (): number => { return 0.5; }
        };
        atanhUnsafe(obj);
        expect().assertFail();
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0080
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_8000
     * @tc.desc Verify Decimal input object is not modified and stays '0.25' after call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const x: Decimal = new Decimal('0.25');
      Decimal.atanh(x);
      expect(x.toString()).assertEqual('0.25');
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0081
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_8100
     * @tc.desc Verify atanh('0.5') returns Decimal instance instead of number/string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.atanh('0.5');
      expect(r instanceof Decimal).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0082
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_8200
     * @tc.desc Verify two atanh('0.25') calls return different instances without caching
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Decimal = Decimal.atanh('0.25');
      const b: Decimal = Decimal.atanh('0.25');
      expect(a !== b).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0083
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_8300
     * @tc.desc Verify '0.25' result isNegative false and isPositive true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.atanh('0.25');
      expect(r.isNegative()).assertFalse();
      expect(r.isPositive()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0084
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_8400
     * @tc.desc Verify '1' endpoint result toNumber is +Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.atanh('1');
      expect(r.toNumber()).assertEqual(Infinity);
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0085
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_8500
     * @tc.desc Verify '0' result isZero true and isNegative false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Decimal = Decimal.atanh('0');
      expect(r.isZero()).assertTrue();
      expect(r.isNegative()).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0086
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_8600
     * @tc.desc Verify chained atanh('0.5').mul(2) approximates 1.0986
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n: number = Decimal.atanh('0.5').mul(2).toNumber();
      expect(n > 1.0985).assertTrue();
      expect(n < 1.0987).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0087
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_8700
     * @tc.desc Verify atanh('0.5').toNumber() is close to double reference value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n: number = Decimal.atanh('0.5').toNumber();
      expect(n > 0.5493061443340547).assertTrue();
      expect(n < 0.5493061443340549).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0088
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_8800
     * @tc.desc Verify out-of-domain '2' does not throw and silently returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw: boolean = false;
      let d: Decimal = new Decimal(0);
      try {
        d = Decimal.atanh('2');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
        threw = true;
      }
      expect(threw).assertFalse();
      expect(d.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAtanhPart02Test0089
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ATANH_PART02_TEST_8900
     * @tc.desc Verify library state unaffected after null 401: atanh('0.5') still succeeds
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAtanhPart02Test0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        atanhUnsafe(null);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      expect(Decimal.atanh('0.5').toString()).assertEqual('0.5493061443340548457');
      thrown = true;
      expect(thrown).assertTrue();
    });
  });
}
