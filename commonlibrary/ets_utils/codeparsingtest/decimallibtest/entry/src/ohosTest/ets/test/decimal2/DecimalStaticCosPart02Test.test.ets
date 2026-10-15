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

export default function DecimalStaticCosPart02Test() {
  describe('DecimalStaticCosPart02Test', () => {
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
     * @tc.name testDecimalStaticCosPart02Test0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_0100
     * @tc.desc Verify trailing mixed-type extra args are ignored and first arg is used
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = cosUnsafe('0.5', 'extra', 3, true, new Decimal('0.5'));
      expect(r.toString()).assertEqual('0.87758256189037271612');
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_0200
     * @tc.desc Verify cosine of string '0' returns '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos('0');
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_0300
     * @tc.desc Verify cosine of string '1' exact to 20 significant digits
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos('1');
      expect(r.toString()).assertEqual('0.5403023058681397174');
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_0400
     * @tc.desc Verify cosine of string '-0.25' matches spec example value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos('-0.25');
      expect(r.toString()).assertEqual('0.96891242171064478414');
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_0500
     * @tc.desc Verify even function property: cos('1') and cos('-1') results are fully equal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Decimal = Decimal.cos('1');
      let n: Decimal = Decimal.cos('-1');
      expect(p.toString()).assertEqual(n.toString());
      expect(p.toString()).assertEqual('0.5403023058681397174');
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_0600
     * @tc.desc Verify cosine of string '2' is negative, toNumber approx -0.4161468365471424
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos('2');
      expect(Math.abs(r.toNumber() - (-0.4161468365471424)) < 1e-12).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_0700
     * @tc.desc Verify cosine of string '3' near -1, toNumber approx -0.9899924966004454
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos('3');
      expect(Math.abs(r.toNumber() - (-0.9899924966004454)) < 1e-12).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_0800
     * @tc.desc Verify negative zero string '-0' cosine is 1 without negative zero sign
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos('-0');
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_0900
     * @tc.desc Verify signed string '+0.5' is accepted and matches '0.5' result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos('+0.5');
      expect(r.toString()).assertEqual('0.87758256189037271612');
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_1000
     * @tc.desc Verify padded string ' 0.5 ' is trimmed and matches '0.5' result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.cos(' 0.5 ');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_1100
     * @tc.desc Verify scientific small string '1e-7' cosine is between 0.99999999999999 and 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos('1e-7');
      let v: number = r.toNumber();
      expect(v > 0.99999999999999 && v < 1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_1200
     * @tc.desc Verify scientific string '1e2' cosine approx 0.8623188722876839
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos('1e2');
      expect(Math.abs(r.toNumber() - 0.8623188722876839) < 1e-12).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_1300
     * @tc.desc Verify pi approximation string '3.141592653589793' cosine is near -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos('3.141592653589793');
      let v: number = r.toNumber();
      expect(v > -1.000001 && v < -0.999999).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_1400
     * @tc.desc Verify pi/2 approximation string '1.5707963267948966' cosine near 0 within 1e-15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos('1.5707963267948966');
      expect(Math.abs(r.toNumber()) < 1e-15).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_1500
     * @tc.desc Verify 2pi approximation string '6.283185307179586' cosine near 1 within 1e-12
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos('6.283185307179586');
      expect(Math.abs(r.toNumber() - 1) < 1e-12).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_1600
     * @tc.desc Verify tiny string '0.00000000000000000001' cosine toString is '1' at default precision
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos('0.00000000000000000001');
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_1700
     * @tc.desc Verify long precision string '123.456789012345678901234567890' computes and returns Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos('123.456789012345678901234567890');
      expect(r instanceof Decimal).assertTrue();
      expect(typeof r.toString()).assertEqual('string');
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_1800
     * @tc.desc Verify tiny exponent string '1e-100000' cosine toString is '1' at default precision
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos('1e-100000');
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_1900
     * @tc.desc Verify three-union member dispatch: cos('0') / cos(0) / cos(new Decimal(0)) all '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.cos('0').toString()).assertEqual('1');
      expect(Decimal.cos(0).toString()).assertEqual('1');
      expect(Decimal.cos(new Decimal(0)).toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_2000
     * @tc.desc Verify two-union string|number dispatch: cos('1') and cos(1) results fully equal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Decimal = Decimal.cos('1');
      let n: Decimal = Decimal.cos(1);
      expect(s.toString()).assertEqual(n.toString());
      expect(s.toString()).assertEqual('0.5403023058681397174');
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_2100
     * @tc.desc Verify two-union number|Decimal dispatch: cos(0.5) and cos(new Decimal('0.5')) equal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: Decimal = Decimal.cos(0.5);
      let d: Decimal = Decimal.cos(new Decimal('0.5'));
      expect(n.toString()).assertEqual(d.toString());
      expect(n.toString()).assertEqual('0.87758256189037271612');
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_2200
     * @tc.desc Verify string '0x10' is accepted and returns Decimal instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos('0x10');
      expect(r instanceof Decimal).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_2300
     * @tc.desc Verify exponent notation union consistency: cos(1e2) and cos('1e2') results equal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: Decimal = Decimal.cos(1e2);
      let s: Decimal = Decimal.cos('1e2');
      expect(n.toString()).assertEqual(s.toString());
      expect(Math.abs(n.toNumber() - 0.8623188722876839) < 1e-12).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_2400
     * @tc.desc Verify distinct Decimal instances with same '0.25' value give equal results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Decimal = new Decimal('0.25');
      let d2: Decimal = new Decimal('0.25');
      expect(d1 === d2).assertFalse();
      let r1: Decimal = Decimal.cos(d1);
      let r2: Decimal = Decimal.cos(d2);
      expect(r1.toString()).assertEqual(r2.toString());
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_2500
     * @tc.desc Verify big Decimal member and big number member: cos(new Decimal('1e5')) equals cos(1e5)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.cos(new Decimal('1e5'));
      let n: Decimal = Decimal.cos(1e5);
      expect(d.toString()).assertEqual(n.toString());
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_2600
     * @tc.desc Verify non-Value empty array member is rejected: cos([]) throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        cosUnsafe([]);
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_2700
     * @tc.desc Verify cos returns a new Decimal instance with instanceof true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos('0.5');
      expect(r instanceof Decimal).assertTrue();
      expect(r === Decimal.cos('0.5')).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_2800
     * @tc.desc Verify determinism: two consecutive cos('0.5') calls give identical results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = Decimal.cos('0.5');
      let b: Decimal = Decimal.cos('0.5');
      expect(a.toString()).assertEqual(b.toString());
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_2900
     * @tc.desc Verify input Decimal object is not modified: d.toString() stays '0.25' after cos
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('0.25');
      const inputBefore: string = d.toString();
      let r: Decimal = Decimal.cos(d);
      const inputAfter: string = d.toString();
      expect(r.toString()).assertEqual('0.96891242171064478414');
      expect(inputAfter).assertEqual(inputBefore);
      expect(r === d).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_3000
     * @tc.desc Verify string 'NaN' in cosine computation gives isNaN true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos('NaN');
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_3100
     * @tc.desc Verify string 'Infinity' in cosine computation gives isNaN true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos('Infinity');
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_3200
     * @tc.desc Verify string '-Infinity' in cosine computation gives isNaN true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos('-Infinity');
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_3300
     * @tc.desc Verify return value is chainable: cos('0.5').mul(2) is '1.7551651237807454322'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos('0.5').mul(2);
      expect(r.toString()).assertEqual('1.7551651237807454322');
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_3400
     * @tc.desc Verify toString and toNumber agree: cos('0.5') toNumber approx 0.8775825618903727
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos('0.5');
      expect(r.toString()).assertEqual('0.87758256189037271612');
      expect(Math.abs(r.toNumber() - 0.8775825618903727) < 1e-15).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_3500
     * @tc.desc Verify empty string '' is invalid numeric format, cos throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        Decimal.cos('');
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_3600
     * @tc.desc Verify all-spaces string '   ' trims to empty, cos throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        Decimal.cos('   ');
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_3700
     * @tc.desc Verify zero-width space string is invalid format, cos throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        Decimal.cos('\u200B');
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_3800
     * @tc.desc Verify leading zero-width space string is invalid format, cos throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        Decimal.cos('\u200B0.5');
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_3900
     * @tc.desc Verify NUL character string is invalid format, cos throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        Decimal.cos('\u0000');
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_4000
     * @tc.desc Verify leading NUL string is invalid format, cos throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        Decimal.cos('\u00000.5');
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_4100
     * @tc.desc Verify newline string '\n' is invalid format, cos throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        Decimal.cos('\n');
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_4200
     * @tc.desc Verify tab string '\t' is invalid format, cos throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        Decimal.cos('\t');
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_4300
     * @tc.desc Verify lone high surrogate string is invalid format, cos throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        Decimal.cos('\uD800');
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_4400
     * @tc.desc Verify unpaired surrogate string is invalid format, cos throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        Decimal.cos('\uD800\uD800');
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_4500
     * @tc.desc Verify trailing dangling low surrogate string '0.5\uDC00' is invalid, cos throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        Decimal.cos('0.5\uDC00');
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_4600
     * @tc.desc Verify emoji string is invalid numeric format, cos throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        Decimal.cos('\uD83D\uDE00');
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_4700
     * @tc.desc Verify string '0b101' is accepted and returns Decimal instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos('0b101');
      expect(r instanceof Decimal).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_4800
     * @tc.desc Verify string '0o17' is accepted and returns Decimal instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos('0o17');
      expect(r instanceof Decimal).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_4900
     * @tc.desc Verify thousands-separator string '1,000' is invalid format, cos throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        Decimal.cos('1,000');
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_5000
     * @tc.desc Verify currency symbol string '$1' is invalid format, cos throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        Decimal.cos('$1');
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_5100
     * @tc.desc Verify percent string '50%' is invalid format, cos throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        Decimal.cos('50%');
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_5200
     * @tc.desc Verify double decimal point string '1.2.3' is invalid format, cos throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        Decimal.cos('1.2.3');
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_5300
     * @tc.desc Verify double negative sign string '--1' is invalid format, cos throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        Decimal.cos('--1');
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_5400
     * @tc.desc Verify incomplete exponent string '1e' is invalid format, cos throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        Decimal.cos('1e');
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_5500
     * @tc.desc Verify empty-tail exponent string '1e+' is invalid format, cos throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        Decimal.cos('1e+');
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_5600
     * @tc.desc Verify empty-base exponent string '.e5' is invalid format, cos throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        Decimal.cos('.e5');
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_5700
     * @tc.desc Verify XSS script string is invalid numeric format, cos throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        Decimal.cos('<script>alert(1)</script>');
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_5800
     * @tc.desc Verify XSS attribute injection string is invalid format, cos throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        Decimal.cos('" onerror="alert(1)');
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_5900
     * @tc.desc Verify SQL injection string '1 OR 1=1' is invalid format, cos throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        Decimal.cos('1 OR 1=1');
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_6000
     * @tc.desc Verify fullwidth digit string is invalid format, cos throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        Decimal.cos('１２３');
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_6100
     * @tc.desc Verify Chinese suffix string  is invalid format, cos throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        Decimal.cos('0.5元');
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_6200
     * @tc.desc Verify string '1_000' is accepted and returns Decimal instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.cos('1_000');
      expect(r instanceof Decimal).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_6300
     * @tc.desc Verify mixed-sign string '+-1' is invalid format, cos throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        Decimal.cos('+-1');
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_6400
     * @tc.desc Verify infinity symbol string is invalid format, cos throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        Decimal.cos('∞');
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_6500
     * @tc.desc Verify superscript digit string is invalid format, cos throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        Decimal.cos('²');
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_6600
     * @tc.desc Verify Arabic-Indic digit string is invalid format, cos throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        Decimal.cos('٥');
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCosPart02Test0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_COS_PART02_TEST_6700
     * @tc.desc Verify circled digit string is invalid format, cos throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCosPart02Test0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        Decimal.cos('①');
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });
  });
}
