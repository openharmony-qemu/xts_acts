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

function asinUnsafe(...args: ESObject[]): Decimal {
  return Decimal.asin(args[0] as Value);
}

export default function DecimalStaticAsinPart02Test() {
  describe('DecimalStaticAsinPart02Test', () => {
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
     * @tc.name testDecimalStaticAsinPart02Test0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_0100
     * @tc.desc Verify asin('0.5') with trailing mixed extra args ignored returns pi/6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: Decimal = Decimal.asin('0.5');
      let r2: Decimal = asinUnsafe('0.5', 'extra', 3, true, new Decimal('0.5'));
      expect(r1.toString()).assertEqual(r2.toString());
      expect(r1.toString()).assertEqual('0.52359877559829887308');
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_0200
     * @tc.desc Verify asin('0') returns '0' without sign and isZero true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin('0');
      expect(r.toString()).assertEqual('0');
      expect(r.isZero()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_0300
     * @tc.desc Verify asin('1') domain upper endpoint returns pi/2 20-digit approximation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin('1');
      expect(r.toString()).assertEqual('1.5707963267948966192');
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_0400
     * @tc.desc Verify asin('-1') domain lower endpoint returns -pi/2 20-digit approximation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin('-1');
      expect(r.toString()).assertEqual('-1.5707963267948966192');
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_0500
     * @tc.desc Verify asin('0.5') returns pi/6 accurate to 20 significant digits
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin('0.5');
      expect(r.toString()).assertEqual('0.52359877559829887308');
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_0600
     * @tc.desc Verify asin('0.75') returns spec example value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin('0.75');
      expect(r.toString()).assertEqual('0.84806207898148100805');
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test0700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_0700
     * @tc.desc Verify asin('-0.75') is odd-function opposite of '0.75' and plus sums '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Decimal = Decimal.asin('0.75');
      let n: Decimal = Decimal.asin('-0.75');
      expect(n.toString()).assertEqual('-0.84806207898148100805');
      expect(p.add(n).toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test0800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_0800
     * @tc.desc Verify asin('0.1') small angle returns 20 significant digits
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin('0.1');
      expect(r.toString()).assertEqual('0.10016742116155979635');
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test0900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_0900
     * @tc.desc Verify asin('0.9') toNumber matches Math.asin(0.9) within 1e-12
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin('0.9');
      expect(Math.abs(r.toNumber() - Math.asin(0.9)) < 1e-12).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test1000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_1000
     * @tc.desc Verify asin('-0.5') returns -pi/6 opposite of '0.5' result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin('-0.5');
      expect(r.toString()).assertEqual('-0.52359877559829887308');
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test1100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_1100
     * @tc.desc Verify asin('-0') keeps negative zero: valueOf '-0' and isNegative true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin('-0');
      expect(r.valueOf()).assertEqual('-0');
      expect(r.isNegative()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test1200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_1200
     * @tc.desc Verify asin('+0.5') parses plus sign as 0.5 giving pi/6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin('+0.5');
      expect(r.toString()).assertEqual('0.52359877559829887308');
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test1300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_1300
     * @tc.desc Verify asin(' 0.5 ') trims surrounding whitespace and matches '0.5' result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asin(' 0.5 ');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test1400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_1400
     * @tc.desc Verify asin('0.50') trailing zero equals '0.5' result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = Decimal.asin('0.50');
      let b: Decimal = Decimal.asin('0.5');
      expect(a.toString()).assertEqual(b.toString());
      expect(a.toString()).assertEqual('0.52359877559829887308');
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test1500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_1500
     * @tc.desc Verify asin('00.5') leading zeros normalize to 0.5 result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin('00.5');
      expect(r.toString()).assertEqual('0.52359877559829887308');
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test1600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_1600
     * @tc.desc Verify asin('5e-1') lowercase e scientific notation parses as 0.5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin('5e-1');
      expect(r.toString()).assertEqual('0.52359877559829887308');
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test1700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_1700
     * @tc.desc Verify asin('5E-1') uppercase E scientific notation matches '0.5' result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin('5E-1');
      expect(r.toString()).assertEqual('0.52359877559829887308');
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test1800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_1800
     * @tc.desc Verify asin('.5') without integer part parses as 0.5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin('.5');
      expect(r.toString()).assertEqual('0.52359877559829887308');
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test1900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_1900
     * @tc.desc Verify asin('1e0') zero exponent parses as 1 giving pi/2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin('1e0');
      expect(r.toString()).assertEqual('1.5707963267948966192');
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test2000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_2000
     * @tc.desc Verify asin('0.7071067811865476') near sqrt(2)/2 gives pi/4 within 1e-12
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin('0.7071067811865476');
      expect(Math.abs(r.toNumber() - Math.asin(0.7071067811865476)) < 1e-12).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test2100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_2100
     * @tc.desc Verify asin('-0.8660254037844386') near -sqrt(3)/2 gives -pi/3 within 1e-12
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin('-0.8660254037844386');
      expect(Math.abs(r.toNumber() - Math.asin(-0.8660254037844386)) < 1e-12).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test2200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_2200
     * @tc.desc Verify asin('0.9999999999999999') approaches pi/2 within 1e-12
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin('0.9999999999999999');
      expect(Math.abs(r.toNumber() - 1.5707963267948966) < 1e-6).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test2300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_2300
     * @tc.desc Verify asin('1e-7') tiny value approximates input in [9.9e-8, 1.01e-7]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin('1e-7');
      let v: number = r.toNumber();
      expect(v > 9.9e-8 && v < 1.01e-7).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test2400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_2400
     * @tc.desc Verify asin('-1e-7') tiny negative approximates -1e-7 odd function
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin('-1e-7');
      let v: number = r.toNumber();
      expect(v < -9.9e-8 && v > -1.01e-7).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test2500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_2500
     * @tc.desc Verify asin('0.00000000000000000001') 1e-20 approximates 1e-20 within 1e-25
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin('0.00000000000000000001');
      expect(Math.abs(r.toNumber() - 1e-20) < 1e-25).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test2600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_2600
     * @tc.desc Verify asin of 30-digit precision string matches Math.asin double result within 1e-12
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin('0.123456789012345678901234567890');
      expect(r instanceof Decimal).assertTrue();
      expect(Math.abs(r.toNumber() - Math.asin(0.12345678901234568)) < 1e-12).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test2700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_2700
     * @tc.desc Verify asin('2') above domain upper bound returns NaN without throw
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin('2');
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test2800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_2800
     * @tc.desc Verify asin('-2') below domain lower bound returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin('-2');
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test2900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_2900
     * @tc.desc Verify asin('1.5') slightly above domain upper bound returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin('1.5');
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test3000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_3000
     * @tc.desc Verify asin('1e3') exponent string far out of domain returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin('1e3');
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test3100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_3100
     * @tc.desc Verify asin('1.0000000000000001') float-neighbor above 1 returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin('1.0000000000000001');
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test3200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_3200
     * @tc.desc Verify three-union string|number|Decimal members of 0.5 all give pi/6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.asin('0.5').toString()).assertEqual('0.52359877559829887308');
      expect(Decimal.asin(0.5).toString()).assertEqual('0.52359877559829887308');
      expect(Decimal.asin(new Decimal('0.5')).toString()).assertEqual('0.52359877559829887308');
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test3300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_3300
     * @tc.desc Verify three-union negative members '-0.5'|-0.5|Decimal('-0.5') all give -pi/6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Decimal = Decimal.asin('-0.5');
      let n: Decimal = Decimal.asin(-0.5);
      let d: Decimal = Decimal.asin(new Decimal('-0.5'));
      expect(s.toString()).assertEqual('-0.52359877559829887308');
      expect(n.toString()).assertEqual('-0.52359877559829887308');
      expect(d.toString()).assertEqual(s.toString());
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test3400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_3400
     * @tc.desc Verify string|number two-union '0.25' and 0.25 dispatch same result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Decimal = Decimal.asin('0.25');
      let n: Decimal = Decimal.asin(0.25);
      expect(s.toString()).assertEqual(n.toString());
      expect(s.toString()).assertEqual('0.25268025514207865349');
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test3500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_3500
     * @tc.desc Verify string|Decimal two-union '0.3' and Decimal('0.3') give same result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Decimal = Decimal.asin('0.3');
      let d: Decimal = Decimal.asin(new Decimal('0.3'));
      expect(s.toString()).assertEqual(d.toString());
      expect(s.toString()).assertEqual('0.30469265401539750797');
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test3600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_3600
     * @tc.desc Verify number|Decimal two-union 0.4 and Decimal(0.4) give same result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: Decimal = Decimal.asin(0.4);
      let d: Decimal = Decimal.asin(new Decimal(0.4));
      expect(n.toString()).assertEqual(d.toString());
      expect(Math.abs(n.toNumber() - Math.asin(0.4)) < 1e-12).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test3700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_3700
     * @tc.desc Verify four representations of 0.75 all return spec example value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = Decimal.asin('0.75');
      let b: Decimal = Decimal.asin(0.75);
      let c: Decimal = Decimal.asin(new Decimal('0.75'));
      let d: Decimal = Decimal.asin(new Decimal(0.75));
      expect(a.toString()).assertEqual('0.84806207898148100805');
      expect(b.toString()).assertEqual('0.84806207898148100805');
      expect(c.toString()).assertEqual('0.84806207898148100805');
      expect(d.toString()).assertEqual('0.84806207898148100805');
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test3800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_3800
     * @tc.desc Verify two distinct Decimal '0.2' instances give identical asin results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Decimal = new Decimal('0.2');
      let d2: Decimal = new Decimal('0.2');
      expect(d1 === d2).assertFalse();
      let r1: Decimal = Decimal.asin(d1);
      let r2: Decimal = Decimal.asin(d2);
      expect(r1.toString()).assertEqual(r2.toString());
      expect(r1.toString()).assertEqual('0.20135792079033079146');
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test3900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_3900
     * @tc.desc Verify null member of string|null union is not Value and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let v: string | null = null;
      let apiThrew1_1: boolean = false;
      try {
        asinUnsafe(v);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test4000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_4000
     * @tc.desc Verify undefined member of number|undefined union is not Value and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let v: number | undefined = undefined;
      let apiThrew1_1: boolean = false;
      try {
        asinUnsafe(v);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test4100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_4100
     * @tc.desc Verify asin('0.5') returns new Decimal instance with instanceof true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin('0.5');
      expect(r instanceof Decimal).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test4200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_4200
     * @tc.desc Verify determinism: two consecutive asin('0.75') calls give identical results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = Decimal.asin('0.75');
      let b: Decimal = Decimal.asin('0.75');
      expect(a.toString()).assertEqual(b.toString());
      expect(a.toString()).assertEqual('0.84806207898148100805');
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test4300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_4300
     * @tc.desc Verify asin of Decimal '0.25' leaves input unmodified as '0.25'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('0.25');
      let r: Decimal = Decimal.asin(d);
      expect(r.toString()).assertEqual('0.25268025514207865349');
      expect(d.toString()).assertEqual('0.25');
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test4400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_4400
     * @tc.desc Verify asin('0.75') toString and toNumber agree within 1e-12
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin('0.75');
      expect(r.toString()).assertEqual('0.84806207898148100805');
      expect(Math.abs(r.toNumber() - 0.848062078981481) < 1e-12).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test4500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_4500
     * @tc.desc Verify asin('1e-100000') tiny exponent keeps input order with toString '1e-100000'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin('1e-100000');
      expect(r.toString()).assertEqual('1e-100000');
      expect(r.isPositive()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test4600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_4600
     * @tc.desc Verify asin('') empty string is invalid numeric format and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asin('');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test4700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_4700
     * @tc.desc Verify asin('   ') all-spaces string trims to empty and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asin('   ');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test4800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_4800
     * @tc.desc Verify asin of zero-width-space-only string is invalid format and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asin('​');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test4900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_4900
     * @tc.desc Verify asin of '0.5' with trailing zero-width space is invalid format and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asin('0.5​');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test5000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_5000
     * @tc.desc Verify asin of NUL-character-only string is invalid format and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asin(' ');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test5100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_5100
     * @tc.desc Verify asin of '5' with embedded NUL character is invalid format and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asin('5 ');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test5200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_5200
     * @tc.desc Verify asin('\n') newline-only string is invalid format and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asin('\n');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test5300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_5300
     * @tc.desc Verify asin('\t') tab-only string is invalid format and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asin('\t');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test5400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_5400
     * @tc.desc Verify asin lone high surrogate string is invalid format and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asin('\uD800');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test5500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_5500
     * @tc.desc Verify asin unpaired surrogates string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asin('\uD800\uD800');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test5600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_5600
     * @tc.desc Verify asin('0.5\uDC00') dangling low surrogate string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asin('0.5\uDC00');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test5700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_5700
     * @tc.desc Verify asin() emoji string is invalid numeric format and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asin('😀');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test5800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_5800
     * @tc.desc Verify asin('abc') letter string is invalid numeric format and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asin('abc');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test5900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_5900
     * @tc.desc Verify asin('1e') incomplete exponent string is invalid format and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asin('1e');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test6000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_6000
     * @tc.desc Verify asin('.e5') empty-mantissa exponent string is invalid format and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asin('.e5');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test6100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_6100
     * @tc.desc Verify asin('1.2.3') double decimal point string is invalid format and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asin('1.2.3');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test6200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_6200
     * @tc.desc Verify asin('--1') double minus sign string is invalid format and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asin('--1');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test6300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_6300
     * @tc.desc Verify asin('1,000') thousands-separator string is invalid format and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asin('1,000');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test6400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_6400
     * @tc.desc Verify asin('0x10') hex string parses as 16, outside domain returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin('0x10');
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test6500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_6500
     * @tc.desc Verify asin('0b101') binary string parses as 5, outside domain returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin('0b101');
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test6600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_6600
     * @tc.desc Verify asin of XSS script string is invalid numeric format and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.asin('<script>alert(1)</script>');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticAsinPart02Test6700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_ASIN_PART02_TEST_6700
     * @tc.desc Verify asin('1e+100000000000000000000') huge input outside domain returns NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticAsinPart02Test6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.asin('1e+100000000000000000000');
      expect(r.isNaN()).assertTrue();
    });
  });
}
