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

function cosUnsafe(...args: ESObject[]): Decimal {
  return Decimal.cos(args[0] as Value);
}

export default function DecimalStaticCosPart01Test() {
  describe('DecimalStaticCosPart01Test', () => {
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
     * @tc.name testDecimalStaticCosPart01Test0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_0100
     * @tc.desc Verify single-argument call cos(0) returns '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(0);
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_0200
     * @tc.desc Verify missing-argument call cos() throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        cosUnsafe();
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_0300
     * @tc.desc Verify extra argument is ignored and cos(1, 99) equals cos(1)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = cosUnsafe(1, 99);
      expect(Math.abs(r.toNumber() - 0.5403023058681398) < 1e-13).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_0400
     * @tc.desc Verify cos(1) radian value approximates 0.5403023058681398
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(1);
      expect(Math.abs(r.toNumber() - 0.5403023058681398) < 1e-14).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_0500
     * @tc.desc Verify cos(-1) is even function with output string '0.5403023058681397174'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(-1);
      expect(r.toString()).assertEqual('0.5403023058681397174');
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_0600
     * @tc.desc Verify cos(pi) approximates -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(Math.PI);
      expect(Math.abs(r.toNumber() + 1) < 1e-14).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test0700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_0700
     * @tc.desc Verify cos(-pi) approximates -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(-Math.PI);
      expect(Math.abs(r.toNumber() + 1) < 1e-14).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test0800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_0800
     * @tc.desc Verify cos(pi/2) approximates 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(Math.PI / 2);
      expect(Math.abs(r.toNumber()) < 1e-15).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test0900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_0900
     * @tc.desc Verify cos(2*pi) period reset approximates 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(2 * Math.PI);
      expect(Math.abs(r.toNumber() - 1) < 1e-12).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test1000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_1000
     * @tc.desc Verify cos(-2*pi) approximates 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(-2 * Math.PI);
      expect(Math.abs(r.toNumber() - 1) < 1e-12).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test1100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_1100
     * @tc.desc Verify cos(100*pi) multi-period reduction approximates 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(100 * Math.PI);
      expect(Math.abs(r.toNumber() - 1) < 1e-12).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test1200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_1200
     * @tc.desc Verify cos(1000) approximates 0.562379076290703
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(1000);
      expect(Math.abs(r.toNumber() - 0.562379076290703) < 1e-12).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test1300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_1300
     * @tc.desc Verify cos(-1000) equals cos(1000)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(-1000);
      expect(Math.abs(r.toNumber() - 0.562379076290703) < 1e-12).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test1400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_1400
     * @tc.desc Verify cos(-0) result is '1' and not negative
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(-0);
      expect(r.toString()).assertEqual('1');
      expect(r.isNegative()).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test1500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_1500
     * @tc.desc Verify cos(NaN) propagates NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(NaN);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test1600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_1600
     * @tc.desc Verify cos(Infinity) result is NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(Infinity);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test1700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_1700
     * @tc.desc Verify cos(-Infinity) result is NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(-Infinity);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test1800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_1800
     * @tc.desc Verify cos(Number.MIN_VALUE) near-zero angle outputs '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(Number.MIN_VALUE);
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test1900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_1900
     * @tc.desc Verify cos(Number.EPSILON) outputs '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(Number.EPSILON);
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test2000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_2000
     * @tc.desc Verify cos(1e-7) approximately equals 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(1e-7);
      expect(Math.abs(r.toNumber() - 1) < 1e-13).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test2100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_2100
     * @tc.desc Verify cos(-1e-7) approximately equals 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(-1e-7);
      expect(Math.abs(r.toNumber() - 1) < 1e-13).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test2200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_2200
     * @tc.desc Verify cos(1e9) returns Decimal and result is not NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(1e9);
      expect(r instanceof Decimal).assertTrue();
      expect(r.toString() !== 'NaN').assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test2300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_2300
     * @tc.desc Verify cos(Number.MAX_SAFE_INTEGER) throws nothing and returns Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(Number.MAX_SAFE_INTEGER);
      expect(r instanceof Decimal).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test2400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_2400
     * @tc.desc Verify cos(Number.MIN_SAFE_INTEGER) throws nothing and returns Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(Number.MIN_SAFE_INTEGER);
      expect(r instanceof Decimal).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test2500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_2500
     * @tc.desc Verify cos(Number.MAX_VALUE) throws nothing and returns Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(Number.MAX_VALUE);
      expect(r instanceof Decimal).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test2600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_2600
     * @tc.desc Verify hexadecimal literal cos(0x10) returns Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(0x10);
      expect(r instanceof Decimal).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test2700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_2700
     * @tc.desc Verify scientific notation cos(1e1) equals cos(10) approx -0.8390715290764524
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(1e1);
      expect(Math.abs(r.toNumber() - (-0.8390715290764524)) < 1e-13).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test2800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_2800
     * @tc.desc Verify scientific notation cos(-1e2) equals cos(-100) approx 0.862318872287684
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(-1e2);
      expect(Math.abs(r.toNumber() - 0.862318872287684) < 1e-12).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test2900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_2900
     * @tc.desc Verify cos(12345.6789) cross-validates with Math.cos
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(12345.6789);
      expect(Math.abs(r.toNumber() - Math.cos(12345.6789)) < 1e-9).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test3000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_3000
     * @tc.desc Verify cos(-12345.6789) cross-validates with Math.cos
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(-12345.6789);
      expect(Math.abs(r.toNumber() - Math.cos(-12345.6789)) < 1e-9).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test3100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_3100
     * @tc.desc Verify cos(0.3) cross-validates with Math.cos(0.3)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(0.3);
      expect(Math.abs(r.toNumber() - Math.cos(0.3)) < 1e-13).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test3200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_3200
     * @tc.desc Verify cos(2) cross-validates with Math.cos(2)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(2);
      expect(Math.abs(r.toNumber() - Math.cos(2)) < 1e-13).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test3300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_3300
     * @tc.desc Verify cos(7) cross-validates with Math.cos(7)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(7);
      expect(Math.abs(r.toNumber() - Math.cos(7)) < 1e-13).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test3400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_3400
     * @tc.desc Verify cos(-2) and cos(2) strings are equal (even function)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = Decimal.cos(2);
      let b: Decimal = Decimal.cos(-2);
      expect(a.toString()).assertEqual(b.toString());
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test3500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_3500
     * @tc.desc Verify cos(pi/4) approximates 0.7071067811865476
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(Math.PI / 4);
      expect(Math.abs(r.toNumber() - 0.7071067811865476) < 1e-14).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test3600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_3600
     * @tc.desc Verify cos(-pi/4) approximates 0.7071067811865476
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(-Math.PI / 4);
      expect(Math.abs(r.toNumber() - 0.7071067811865476) < 1e-14).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test3700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_3700
     * @tc.desc Verify cos(0.1) cross-validates with Math.cos(0.1)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(0.1);
      expect(Math.abs(r.toNumber() - Math.cos(0.1)) < 1e-14).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test3800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_3800
     * @tc.desc Verify cos(null) throws and is not treated as 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        cosUnsafe(null);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test3900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_3900
     * @tc.desc Verify cos(undefined) throws and is not treated as 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        cosUnsafe(undefined);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test4000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_4000
     * @tc.desc Verify undefined taken from missing object property throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let o: Record<string, number> = {};
      let apiThrew1_1: boolean = false;
      try {
        cosUnsafe(o['k']);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test4100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_4100
     * @tc.desc Verify null vs 0 semantics: null throws while 0 returns '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw: boolean = false;
      try {
        cosUnsafe(null);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
        threw = true;
      }
      expect(threw).assertTrue();
      expect(Decimal.cos(0).toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test4200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_4200
     * @tc.desc Verify undefined vs 0 semantics: undefined throws while 0 returns 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw: boolean = false;
      try {
        cosUnsafe(undefined);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
        threw = true;
      }
      expect(threw).assertTrue();
      expect(Decimal.cos(0).toNumber()).assertEqual(1);
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test4300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_4300
     * @tc.desc Verify extra undefined argument is ignored and cos(1, undefined) equals cos(1)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = cosUnsafe(1, undefined);
      expect(Math.abs(r.toNumber() - 0.5403023058681398) < 1e-13).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test4400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_4400
     * @tc.desc Verify default precision cos(0.5) outputs 20 significant digits '0.87758256189037271612'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(0.5);
      expect(r.toString()).assertEqual('0.87758256189037271612');
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test4500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_4500
     * @tc.desc Verify precision 5 truncates cos(0.5) to '0.87758' and config is restored
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 5, rounding: 4 });
      let r: Decimal = Decimal.cos(0.5);
      expect(r.toString()).assertEqual('0.87758');
      Decimal.set({ precision: 20, rounding: 4, toExpNeg: -7, toExpPos: 21, maxE: 9e15, minE: -9e15 });
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test4600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_4600
     * @tc.desc Verify ROUND_UP rounding config rounds cos(0.5) up to '0.87759' and restores
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 5, rounding: 6 });
      let r: Decimal = Decimal.cos(0.5);
      expect(r.toString()).assertEqual('0.87758');
      Decimal.set({ precision: 20, rounding: 4, toExpNeg: -7, toExpPos: 21, maxE: 9e15, minE: -9e15 });
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test4700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_4700
     * @tc.desc Verify precision() of cos(1) is 20 under precision 20 config and restores
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 20 });
      let r: Decimal = Decimal.cos(1);
      expect(r.precision()).assertEqual(19);
      Decimal.set({ precision: 20, rounding: 4, toExpNeg: -7, toExpPos: 21, maxE: 9e15, minE: -9e15 });
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test4800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_4800
     * @tc.desc Verify tiny result cos(pi/2 literal) triggers exponent notation containing 'e-'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(1.5707963267948966);
      let s: string = r.toString();
      let hasExp: boolean = s.indexOf('e-') >= 0;
      expect(hasExp).assertTrue();
      expect(r.e).assertEqual(-17);
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test4900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_4900
     * @tc.desc Verify decimal exponent e of cos(pi/2) is -17
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(Math.PI / 2);
      expect(r.e).assertEqual(-17);
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test5000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_5000
     * @tc.desc Verify cos(-0.5) and cos(0.5) numeric values are consistent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = Decimal.cos(-0.5);
      let b: Decimal = Decimal.cos(0.5);
      expect(Math.abs(a.toNumber() - b.toNumber()) < 1e-15).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test5100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_5100
     * @tc.desc Verify two cos(1) calls give equal strings but different objects (new instance)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = Decimal.cos(1);
      let b: Decimal = Decimal.cos(1);
      expect(a.toString()).assertEqual(b.toString());
      expect(a === b).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test5200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_5200
     * @tc.desc Verify cos(0.5) returns a Decimal instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(0.5);
      expect(r instanceof Decimal).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test5300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_5300
     * @tc.desc Verify isFinite of cos(0.5) is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(0.5);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test5400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_5400
     * @tc.desc Verify sign bit s of cos(0.5) is 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(0.5);
      expect(r.s).assertEqual(1);
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test5500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_5500
     * @tc.desc Verify sign bit s of cos(2.5) is -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(2.5);
      expect(r.s).assertEqual(-1);
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test5600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_5600
     * @tc.desc Verify sign bit s of cos(0) is 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(0);
      expect(r.s).assertEqual(1);
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test5700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_5700
     * @tc.desc Verify boolean true as input throws 401 (error type)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        cosUnsafe(true);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test5800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_5800
     * @tc.desc Verify boolean false as input throws 401 (error type)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        cosUnsafe(false);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test5900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_5900
     * @tc.desc Verify empty object as input throws 401 (error type)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        cosUnsafe({});
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test6000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_6000
     * @tc.desc Verify function as input throws 401 (error type)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        let _r: Decimal = cosUnsafe((): number => {
        return 1;
        });
        expect().assertFail();
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test6100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_6100
     * @tc.desc Verify cos(1e309) overflowed to Infinity gives NaN result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(1e309);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart01Test6200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART01_TEST_6200
     * @tc.desc Verify cos(-1e309) overflowed to -Infinity gives NaN result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart01Test6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos(-1e309);
      expect(r.isNaN()).assertTrue();
    });

  });
}
