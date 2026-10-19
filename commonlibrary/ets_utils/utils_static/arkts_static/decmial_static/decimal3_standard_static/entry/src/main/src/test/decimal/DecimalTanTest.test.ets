'use static';

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

import {
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';
import { Decimal } from '@kit.ArkTS';
type InvalidDecimalInput = string
  | double
  | boolean
  | BigInt
  | Object
  | Array<int>
  | Array<double>
  | (() => undefined)
  | undefined
  | null;
type DecimalValue = string | double | Decimal;

export default function decimalTanTest(): void {
  describe('DecimalTanTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      Decimal.set({ defaults: true });
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TAN_0100
     * @tc.name decimalTanTest001
     * @tc.desc Zero & negative-zero (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalTanTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. tan('0') returns '0'
      let d1: Decimal = new Decimal('0');
      let r1: Decimal = d1.tan();
      let a1_1: string = r1.toString();
      let e1_1: string = '0';
      expect(a1_1).assertEqual(e1_1);

      // 2. tan(0 number) returns '0'
      let a2_1: string = new Decimal(0).tan().toString();
      let e2_1: string = '0';
      expect(a2_1).assertEqual(e2_1);

      // 3. tan(-0 number) returns '0'
      let a3_1: string = new Decimal(-0).tan().toString();
      let e3_1: string = '0';
      expect(a3_1).assertEqual(e3_1);

      // 4. tan('-0') is negative zero
      let b4_1: boolean = new Decimal('-0').tan().isNegative();
      expect(b4_1).assertTrue();

      // 5. tan('-0') comparedTo tan('0') equals 0
      let n5_1: number = new Decimal('-0').tan().comparedTo(new Decimal('0').tan());
      let e5_1: int = 0;
      expect(n5_1).assertEqual(e5_1);

      // 6. tan('0.0000') returns '0'
      let a6_1: string = new Decimal('0.0000').tan().toString();
      let e6_1: string = '0';
      expect(a6_1).assertEqual(e6_1);

      // 7. static Decimal.tan(0).negate() returns '0'
      let r7: Decimal = Decimal.tan(0).negate();
      let a7_1: string = r7.toString();
      let e7_1: string = '0';
      expect(a7_1).assertEqual(e7_1);

      // 8. static Decimal.tan(Decimal '-0') returns '0' and isZero
      let src8: Decimal = new Decimal('-0');
      let r8: Decimal = Decimal.tan(src8);
      let a8_1: string = r8.toString();
      let e8_1: string = '0';
      expect(a8_1).assertEqual(e8_1);
      let b8_1: boolean = r8.isZero();
      expect(b8_1).assertTrue();

      // 9. static Decimal.tan(0).e equals 0
      let r9: Decimal = Decimal.tan(0);
      let n9_1: number = r9.e;
      let e9_1: int = 0;
      expect(n9_1).assertEqual(e9_1);

      // 10. static Decimal.tan(0).isZero() is true
      let b10_1: boolean = Decimal.tan(0).isZero();
      expect(b10_1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TAN_0200
     * @tc.name decimalTanTest002
     * @tc.desc Special angles pi/4 pi/2 3pi/2 (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalTanTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. tan(pi/4) matches Math.tan
      let c1: double = new Decimal('0.7853981633974483').tan().toNumber();
      expect(Math.abs(c1 - Math.tan(0.7853981633974483))).assertLess(1e-15);

      // 2. tan(pi/4 extended) close to 1
      let n2_1: number = new Decimal('0.7853981633974483096').tan().sub(1).abs().comparedTo(new Decimal('1e-19'));
      let e2_1: int = -1;
      expect(n2_1).assertEqual(e2_1);

      // 3. tan(pi/4) is positive
      let b3_1: boolean = new Decimal('0.7853981633974483').tan().isPositive();
      expect(b3_1).assertTrue();

      // 4. tan(-pi/4) close to -1
      let n4_1: number = new Decimal('-0.7853981633974483').tan().add(1).abs().comparedTo(new Decimal('1e-15'));
      let e4_1: int = -1;
      expect(n4_1).assertEqual(e4_1);

      // 5. tan(pi/2) greater than 1e10
      let n5_1: number = new Decimal('1.5707963267948966').tan().comparedTo(new Decimal('1e10'));
      let e5_1: int = 1;
      expect(n5_1).assertEqual(e5_1);

      // 6. tan(pi/2) is finite
      let b6_1: boolean = !new Decimal('1.5707963267948966').tan().isFinite();
      expect(b6_1).assertFalse();

      // 7. tan(-pi/2) less than -1e10
      let n7_1: number = new Decimal('-1.5707963267948966').tan().comparedTo(new Decimal('-1e10'));
      let e7_1: int = -1;
      expect(n7_1).assertEqual(e7_1);

      // 8. tan(3pi/2) less than -1e12
      let n8_1: number = new Decimal('4.71238898038469').tan().comparedTo(new Decimal('-1e12'));
      let e8_1: int = -1;
      expect(n8_1).assertEqual(e8_1);

      // 9. static Decimal.tan(-pi/4) toString '-0.99999999999999998077'
      let r9: Decimal = Decimal.tan('-0.7853981633974483');
      let a9_1: string = r9.toString();
      let e9_1: string = '-0.99999999999999998077';
      expect(a9_1).assertEqual(e9_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TAN_0300
     * @tc.name decimalTanTest003
     * @tc.desc Sign & state checks (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalTanTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. tan(2) is negative
      let b1_1: boolean = new Decimal('2').tan().isNegative();
      expect(b1_1).assertTrue();

      // 2. tan(0.7) is not negative
      let b2_1: boolean = new Decimal('0.7').tan().isNegative();
      expect(b2_1).assertFalse();

      // 3. static Decimal.tan(1) is finite
      let b3_1: boolean = Decimal.tan(1).isFinite();
      expect(b3_1).assertTrue();

      // 4. static Decimal.tan(pi/4) is not integer
      let b4_1: boolean = Decimal.tan('0.7853981633974483').isInteger();
      expect(b4_1).assertFalse();

      // 5. static Decimal.tan(0.5) is positive
      let b5_1: boolean = Decimal.tan(0.5).isPositive();
      expect(b5_1).assertTrue();

      // 6. static Decimal.tan(2) is negative
      let b6_1: boolean = Decimal.tan(2).isNegative();
      expect(b6_1).assertTrue();

      // 7. static Decimal.tan(-pi/4) is negative
      let b7_1: boolean = Decimal.tan('-0.7853981633974483').isNegative();
      expect(b7_1).assertTrue();

      // 8. static Decimal.tan('0.25') is not NaN
      let r8: Decimal = Decimal.tan('0.25');
      let b8_1: boolean = r8.isNaN();
      expect(b8_1).assertFalse();

      // 9. static Decimal.tan('4') is finite
      let r9: Decimal = Decimal.tan('4');
      let b9_1: boolean = r9.isFinite();
      expect(b9_1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TAN_0400
     * @tc.name decimalTanTest004
     * @tc.desc Internal properties s/e/d (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalTanTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. static Decimal.tan(0.5).s equals 1
      let r1: Decimal = Decimal.tan(0.5);
      let n1_1: number = r1.s;
      let e1_1: int = 1;
      expect(n1_1).assertEqual(e1_1);

      // 2. static Decimal.tan(2).s equals -1
      let r2: Decimal = Decimal.tan(2);
      let n2_1: number = r2.s;
      let e2_1: int = -1;
      expect(n2_1).assertEqual(e2_1);

      // 3. static Decimal.tan('0.5').d[0] equals 5463024
      let r3: Decimal = Decimal.tan('0.5');
      let n3_1: number = r3.d![0];
      let e3_1: int = 5463024;
      expect(n3_1).assertEqual(e3_1);

      // 4. static Decimal.tan('0.5').d.length equals 3
      let r4: Decimal = Decimal.tan('0.5');
      let n4_1: int = r4.d!.length;
      let e4_1: int = 3;
      expect(n4_1).assertEqual(e4_1);

      // 5. static Decimal.tan('1.5').e equals 1
      let r5: Decimal = Decimal.tan('1.5');
      let n5_1: number = r5.e;
      let e5_1: int = 1;
      expect(n5_1).assertEqual(e5_1);

      // 6. static Decimal.tan('0.25').e equals -1
      let r6: Decimal = Decimal.tan('0.25');
      let n6_1: number = r6.e;
      let e6_1: int = -1;
      expect(n6_1).assertEqual(e6_1);

      // 7. static Decimal.tan('10').s equals 1
      let r7: Decimal = Decimal.tan('10');
      let n7_1: number = r7.s;
      let e7_1: int = 1;
      expect(n7_1).assertEqual(e7_1);

      // 8. static Decimal.tan('50').s equals -1
      let r8: Decimal = Decimal.tan('50');
      let n8_1: number = r8.s;
      let e8_1: int = -1;
      expect(n8_1).assertEqual(e8_1);

      // 9. static Decimal.tan('0.2500...').d.length equals 3
      let src9: Decimal = new Decimal('0.2500000000000000000000000');
      let r9: Decimal = Decimal.tan(src9);
      let n9_1: int = r9.d!.length;
      let e9_1: int = 3;
      expect(n9_1).assertEqual(e9_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TAN_0500
     * @tc.name decimalTanTest005
     * @tc.desc Trigonometric identities & periodicity (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalTanTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. tan(0.5) equals tan(0.5+pi) (periodicity)
      let n1_1: number = new Decimal('0.5').tan().sub(new Decimal('3.641592653589793').tan()).abs().comparedTo(new Decimal('1e-15'));
      let e1_1: int = -1;
      expect(n1_1).assertEqual(e1_1);

      // 2. tan(pi) close to 0
      let n2_1: number = new Decimal('3.141592653589793').tan().abs().comparedTo(new Decimal('1e-15'));
      let e2_1: int = -1;
      expect(n2_1).assertEqual(e2_1);

      // 3. tan(tan(0)) equals tan(0)
      let n3_1: number = new Decimal('0').tan().tan().comparedTo(new Decimal('0').tan());
      let e3_1: int = 0;
      expect(n3_1).assertEqual(e3_1);

      // 4. tan(abs(-0.5)) equals tan(0.5)
      let n4_1: number = new Decimal('-0.5').abs().tan().comparedTo(new Decimal('0.5').tan());
      let e4_1: int = 0;
      expect(n4_1).assertEqual(e4_1);

      // 5. tan(x) equals sin(x)/cos(x) for x=0.7
      let x5: Decimal = new Decimal('0.7');
      let q5: Decimal = x5.sin().div(x5.cos());
      let n5_1: number = x5.tan().sub(q5).abs().comparedTo(new Decimal('1e-16'));
      let e5_1: int = -1;
      expect(n5_1).assertEqual(e5_1);

      // 6. tan(2x) equals 2tan(x)/(1-tan(x)^2) for x=0.5
      let t6: Decimal = new Decimal('0.5').tan();
      let rhs6: Decimal = t6.mul(2).div(new Decimal('1').sub(t6.pow(2)));
      let n6_1: number = new Decimal('1').tan().sub(rhs6).abs().comparedTo(new Decimal('1e-14'));
      let e6_1: int = -1;
      expect(n6_1).assertEqual(e6_1);

      // 7. tan(a+b) equals (tan a + tan b)/(1 - tan a tan b) for a=0.3,b=0.4
      let ta7: Decimal = new Decimal('0.3').tan();
      let tb7: Decimal = new Decimal('0.4').tan();
      let rhs7: Decimal = ta7.add(tb7).div(new Decimal('1').sub(ta7.mul(tb7)));
      let n7_1: number = new Decimal('0.7').tan().sub(rhs7).abs().comparedTo(new Decimal('1e-14'));
      let e7_1: int = -1;
      expect(n7_1).assertEqual(e7_1);

      // 8. tan(pi/2 - 0.9) equals 1/tan(0.9)
      let complementaryAngleTangent: Decimal = new Decimal('0.6707963267948966').tan();
      let reciprocalTangent: Decimal = new Decimal('1').div(new Decimal('0.9').tan());
      let n8_1: number = complementaryAngleTangent.sub(reciprocalTangent).abs().comparedTo(new Decimal('1e-14'));
      let e8_1: int = -1;
      expect(n8_1).assertEqual(e8_1);

      // 9. static Decimal.tan(100) and tan(100+pi) periodicity bounds
      let a9: Decimal = Decimal.tan('100');
      let b9: Decimal = Decimal.tan('103.141592653589793');
      let a9_1: string = a9.toString();
      let e9_1: string = '-0.58721391515692907668';
      expect(a9_1).assertEqual(e9_1);
      let a9_2: string = b9.toString();
      let e9_2: string = '-0.58721391515692939737';
      expect(a9_2).assertEqual(e9_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TAN_0600
     * @tc.name decimalTanTest006
     * @tc.desc Small large edge values & finiteness (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalTanTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. tan(5e-324) close to 5e-324 (subnormal)
      let n1_1: number = new Decimal('5e-324').tan().abs().sub(new Decimal('5e-324')).abs().comparedTo(new Decimal('1e-323'));
      let e1_1: int = -1;
      expect(n1_1).assertEqual(e1_1);

      // 2. tan('1e18') is not NaN
      let b2_1: boolean = new Decimal('1e18').tan().isNaN();
      expect(b2_1).assertFalse();

      // 3. tan('1e100') is not NaN and is finite
      let r3: Decimal = new Decimal('1e100').tan();
      let b3_1: boolean = r3.isNaN();
      expect(b3_1).assertFalse();
      let b3_2: boolean = !r3.isFinite();
      expect(b3_2).assertFalse();

      // 4. static Decimal.tan('1e10') is finite and not NaN
      let r4: Decimal = Decimal.tan('1e10');
      let b4_1: boolean = r4.isFinite();
      expect(b4_1).assertTrue();
      let b4_2: boolean = r4.isNaN();
      expect(b4_2).assertFalse();

      // 5. static Decimal.tan(10000-digit zeros) returns '0'
      let digits5: string = '0';
      let i5: number = 0;
      while (i5 < 9999) {
        digits5 += '0';
        i5 = i5 + 1;
      }
      let r5: Decimal = Decimal.tan(digits5);
      let a5_1: string = r5.toString();
      let e5_1: string = '0';
      expect(a5_1).assertEqual(e5_1);

      // 6. static Decimal.tan(max double) is finite and not NaN
      let r6: Decimal = Decimal.tan(1.7976931348623157e308);
      let b6_1: boolean = !r6.isFinite();
      expect(b6_1).assertFalse();
      let b6_2: boolean = r6.isNaN();
      expect(b6_2).assertFalse();

      // 7. static Decimal.tan(9007199254740993) is finite
      let r7: Decimal = Decimal.tan(9007199254740993);
      let b7_1: boolean = r7.isFinite();
      expect(b7_1).assertTrue();

      // 8. static Decimal.tan(MAX_SAFE_INTEGER) is not NaN
      let r8: Decimal = Decimal.tan(Number.MAX_SAFE_INTEGER);
      let b8_1: boolean = r8.isNaN();
      expect(b8_1).assertFalse();

      // 9. static Decimal.tan('1e6') is finite
      let b9_1: boolean = Decimal.tan('1e6').isFinite();
      expect(b9_1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TAN_0700
     * @tc.name decimalTanTest007
     * @tc.desc Formatting & rounding methods (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalTanTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. Decimal.round(Decimal.tan('1.5')) returns '14'
      let r1: Decimal = Decimal.round(Decimal.tan('1.5'));
      let a1_1: string = r1.toString();
      let e1_1: string = '14';
      expect(a1_1).assertEqual(e1_1);

      // 2. Decimal.tan('1.5').trunc() returns '14'
      let r2: Decimal = Decimal.tan('1.5').trunc();
      let a2_1: string = r2.toString();
      let e2_1: string = '14';
      expect(a2_1).assertEqual(e2_1);

      // 3. Decimal.tan('0.25').toFixed(4) returns '0.2553'
      let a3_1: string = Decimal.tan('0.25').toFixed(4);
      expect(a3_1).assertEqual('0.2553');

      // 4. Decimal.tan('0.25').toPrecision(6) returns '0.255342'
      let a4_1: string = Decimal.tan('0.25').toPrecision(6);
      expect(a4_1).assertEqual('0.255342');

      // 5. Decimal.tan('0.25').toExponential(3) returns '2.553e-1'
      let a5_1: string = Decimal.tan('0.25').toExponential(3);
      expect(a5_1).assertEqual('2.553e-1');

      // 6. Decimal.tan('0.25').toDecimalPlaces(3) returns '0.255'
      let d6: Decimal = Decimal.tan('0.25').toDecimalPlaces(3);
      let a6_1: string = d6.toString();
      let e6_1: string = '0.255';
      expect(a6_1).assertEqual(e6_1);

      // 7. Decimal.tan('0.25').toSignificantDigits(10) returns '0.2553419212'
      let sd7: Decimal = Decimal.tan('0.25').toSignificantDigits(10);
      let a7_1: string = sd7.toString();
      let e7_1: string = '0.2553419212';
      expect(a7_1).assertEqual(e7_1);

      // 8. Decimal.tan('-0.25').toFixed(4) returns '-0.2553'
      let a8_1: string = Decimal.tan('-0.25').toFixed(4);
      expect(a8_1).assertEqual('-0.2553');

      // 9. Decimal.tan('0.25').toNearest(0.01) returns '0.26'
      let n9: Decimal = Decimal.tan('0.25').toNearest(new Decimal('0.01'));
      let a9_1: string = n9.toString();
      let e9_1: string = '0.26';
      expect(a9_1).assertEqual(e9_1);

      // 10. Decimal.round(Decimal.tan('-0.5')) returns '-1'
      let r10: Decimal = Decimal.round(Decimal.tan('-0.5'));
      let a10_1: string = r10.toString();
      let e10_1: string = '-1';
      expect(a10_1).assertEqual(e10_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TAN_0800
     * @tc.name decimalTanTest008
     * @tc.desc Precision & rounding modes (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalTanTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. tan(1) toString at precisions 10, 8, 25, 1
      let prec1: int[] = [10, 8, 25, 1];
      let expv1: string[] = ['1.557407725', '1.5574077', '1.557407724654902230506975', '2'];
      for (let idx1: int = 0; idx1 < prec1.length; idx1++) {
        Decimal.set({ precision: prec1[idx1] });
        let a1_1: string = new Decimal('1').tan().toString();
        expect(a1_1).assertEqual(expv1[idx1]);
        Decimal.set({ defaults: true });
      }

      // 2. precision=100 tan(0.5) starts with extended digits
      Decimal.set({ precision: 100 });
      let s2: string = new Decimal('0.5').tan().toString();
      let b2_1: boolean = s2.startsWith('0.546302489843790513255179465780');
      expect(b2_1).assertTrue();
      Decimal.set({ defaults: true });

      // 3. precision=5 tan(pi/4) returns '1'
      Decimal.set({ precision: 5 });
      let a3_1: string = new Decimal('0.7853981633974483').tan().toString();
      let e3_1: string = '1';
      expect(a3_1).assertEqual(e3_1);
      Decimal.set({ defaults: true });

      // 4. precision=5 ROUND_HALF_UP tan(1) returns '1.5574'
      Decimal.set({ precision: 5, rounding: Decimal.ROUND_HALF_UP });
      let a4_1: string = new Decimal('1').tan().toString();
      let e4_1: string = '1.5574';
      expect(a4_1).assertEqual(e4_1);
      Decimal.set({ defaults: true });

      // 5. precision=5 ROUND_UP tan(1) returns '1.5575'
      Decimal.set({ precision: 5, rounding: Decimal.ROUND_UP });
      let a5_1: string = new Decimal('1').tan().toString();
      let e5_1: string = '1.5575';
      expect(a5_1).assertEqual(e5_1);
      Decimal.set({ defaults: true });

      // 6. precision=5 ROUND_HALF_UP tan(2) returns '-2.185'
      Decimal.set({ precision: 5, rounding: Decimal.ROUND_HALF_UP });
      let a6_1: string = new Decimal('2').tan().toString();
      let e6_1: string = '-2.185';
      expect(a6_1).assertEqual(e6_1);
      Decimal.set({ defaults: true });

      // 7. static Decimal.tan('1') toString at precisions 5, 8
      let prec7: int[] = [5, 8];
      let expv7: string[] = ['1.5574', '1.5574077'];
      for (let idx7: int = 0; idx7 < prec7.length; idx7++) {
        Decimal.set({ precision: prec7[idx7] });
        let r7: Decimal = Decimal.tan('1');
        let a7_1: string = r7.toString();
        expect(a7_1).assertEqual(expv7[idx7]);
        Decimal.set({ defaults: true });
      }

      // 8. precision=50 static Decimal.tan('0.5').d.length equals 8
      Decimal.set({ precision: 50 });
      let r8: Decimal = Decimal.tan('0.5');
      let n8_1: int = r8.d!.length;
      let e8_1: int = 8;
      expect(n8_1).assertEqual(e8_1);
      Decimal.set({ defaults: true });

      // 9. defaults static Decimal.tan('1').d.length equals 4
      Decimal.set({ precision: 5 });
      Decimal.set({ defaults: true });
      let r9: Decimal = Decimal.tan('1');
      let n9_1: int = r9.d!.length;
      let e9_1: int = 4;
      expect(n9_1).assertEqual(e9_1);

      // 10. precision=8 static Decimal.tan('-0.5') returns '-0.54630249'
      Decimal.set({ precision: 8 });
      let r10: Decimal = Decimal.tan('-0.5');
      let a10_1: string = r10.toString();
      let e10_1: string = '-0.54630249';
      expect(a10_1).assertEqual(e10_1);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TAN_0900
     * @tc.name decimalTanTest009
     * @tc.desc Odd function & static/instance equivalence (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalTanTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. tan(-1) equals -tan(1) (odd function)
      let n1_1: number = new Decimal('-1').tan().comparedTo(new Decimal('1').tan().negate());
      let e1_1: int = 0;
      expect(n1_1).assertEqual(e1_1);

      // 2. tan(0.7).negate() equals tan(-0.7)
      let n2_1: number = new Decimal('0.7').tan().negate().comparedTo(new Decimal('-0.7').tan());
      let e2_1: int = 0;
      expect(n2_1).assertEqual(e2_1);

      // 3. tan(0.9) + tan(-0.9) close to 0 (odd function)
      let n3_1: number = new Decimal('0.9').tan().add(new Decimal('-0.9').tan()).abs().comparedTo(new Decimal('1e-19'));
      let e3_1: int = -1;
      expect(n3_1).assertEqual(e3_1);

      // 4. static Decimal.tan(-pi) equals -Decimal.tan(pi)
      let a4_1: string = Decimal.tan('-3.141592653589793').toString();
      let e4_1: string = Decimal.tan('3.141592653589793').negate().toString();
      expect(a4_1).assertEqual(e4_1);

      // 5. static Decimal.tan('0.25').negate() equals Decimal.tan('-0.25')
      let b5_1: boolean = Decimal.tan('0.25').negate().equals(Decimal.tan('-0.25'));
      expect(b5_1).assertTrue();

      // 6. static Decimal.tan('-0.25').abs() equals Decimal.tan('0.25')
      let b6_1: boolean = Decimal.tan('-0.25').abs().equals(Decimal.tan('0.25'));
      expect(b6_1).assertTrue();

      // 7. static Decimal.tan(1) equals new Decimal(1).tan()
      let a7_1: string = Decimal.tan(1).toString();
      let e7_1: string = new Decimal(1).tan().toString();
      expect(a7_1).assertEqual(e7_1);

      // 8. static Decimal.tan('2') equals new Decimal('2').tan()
      let a8_1: string = Decimal.tan('2').toString();
      let e8_1: string = new Decimal('2').tan().toString();
      expect(a8_1).assertEqual(e8_1);

      // 9. static Decimal.tan(-0) equals new Decimal(-0).tan()
      let a9_1: string = Decimal.tan(-0).toString();
      let e9_1: string = new Decimal(-0).tan().toString();
      expect(a9_1).assertEqual(e9_1);

      // 10. static Decimal.tan(src) equals src.tan() (Decimal input)
      let src10: Decimal = new Decimal('0.5');
      let a10_1: string = Decimal.tan(src10).toString();
      let e10_1: string = src10.tan().toString();
      expect(a10_1).assertEqual(e10_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TAN_1000
     * @tc.name decimalTanTest010
     * @tc.desc NaN Infinity & basic value (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalTanTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. tan('NaN') is NaN
      let b1_1: boolean = new Decimal('NaN').tan().isNaN();
      expect(b1_1).assertTrue();

      // 2. tan(Infinity) is NaN
      let b2_1: boolean = new Decimal(Number.POSITIVE_INFINITY).tan().isNaN();
      expect(b2_1).assertTrue();

      // 3. tan('Infinity') is NaN
      let b3_1: boolean = new Decimal('Infinity').tan().isNaN();
      expect(b3_1).assertTrue();

      // 4. tan('-Infinity') is NaN
      let b4_1: boolean = new Decimal('-Infinity').tan().isNaN();
      expect(b4_1).assertTrue();

      // 5. static Decimal.tan(NaN) and new Decimal(NaN).tan() are NaN
      let d5_1: Decimal = Decimal.tan(Number.NaN);
      let d5_2: Decimal = new Decimal(Number.NaN).tan();
      let b5_1: boolean = d5_1.isNaN();
      expect(b5_1).assertTrue();
      let b5_2: boolean = d5_2.isNaN();
      expect(b5_2).assertTrue();

      // 6. static Decimal.tan(-Infinity) and new Decimal(-Infinity).tan() are NaN
      let d6_1: Decimal = Decimal.tan(-Number.POSITIVE_INFINITY);
      let d6_2: Decimal = new Decimal(-Number.POSITIVE_INFINITY).tan();
      let b6_1: boolean = d6_1.isNaN();
      expect(b6_1).assertTrue();
      let b6_2: boolean = d6_2.isNaN();
      expect(b6_2).assertTrue();

      // 7. tan(0.5) basic value and source unchanged
      let d7: Decimal = new Decimal('0.5');
      let r7: Decimal = d7.tan();
      let a7_1: string = d7.toString();
      let e7_1: string = '0.5';
      expect(a7_1).assertEqual(e7_1);
      let a7_2: string = r7.toString();
      let e7_2: string = '0.54630248984379051326';
      expect(a7_2).assertEqual(e7_2);

      // 8. static Decimal.tan('2') basic value '-2.1850398632615189916'
      let r8: Decimal = Decimal.tan('2');
      let a8_1: string = r8.toString();
      let e8_1: string = '-2.1850398632615189916';
      expect(a8_1).assertEqual(e8_1);

      // 9. static Decimal.tan('-0.5') basic value '-0.54630248984379051326'
      let a9_1: string = Decimal.tan('-0.5').toString();
      let e9_1: string = '-0.54630248984379051326';
      expect(a9_1).assertEqual(e9_1);

      // 10. static Decimal.tan('3') comparedTo '-0.1425465430742778053' equals 0
      let c10: double = Decimal.tan('3').comparedTo(new Decimal('-0.1425465430742778053'));
      expect(c10).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TAN_1100
     * @tc.name decimalTanTest011
     * @tc.desc Math.tan comparison & arithmetic (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalTanTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. tan(-1) matches Math.tan(-1)
      let c1: double = new Decimal('-1').tan().toNumber();
      expect(Math.abs(c1 - Math.tan(-1))).assertLess(1e-15);

      // 2. tan(0.1+0.2) matches Math.tan (float arithmetic)
      let c2: double = new Decimal(0.1).add(0.2).tan().toNumber();
      expect(Math.abs(c2 - Math.tan(0.30000000000000004))).assertLess(1e-15);

      // 3. tan(0.7+0) matches Math.tan(0.7)
      let c3: double = new Decimal('0.7').add(0).tan().toNumber();
      expect(Math.abs(c3 - Math.tan(0.7))).assertLess(1e-15);

      // 4. static Decimal.tan('1e-6') matches Math.tan(1e-6)
      let c4: double = Decimal.tan('1e-6').toNumber();
      expect(Math.abs(c4 - Math.tan(1e-6))).assertLess(1e-19);

      // 5. static Decimal.tan(0.1+0.2) matches Math.tan (float arithmetic)
      let c5: double = Decimal.tan(0.1 + 0.2).toNumber();
      expect(Math.abs(c5 - Math.tan(0.1 + 0.2))).assertLess(1e-15);

      // 6. precision=5 ROUND_UP tan(2) returns '-2.1851'
      Decimal.set({ precision: 5, rounding: Decimal.ROUND_UP });
      let a6_1: string = new Decimal('2').tan().toString();
      let e6_1: string = '-2.1851';
      expect(a6_1).assertEqual(e6_1);
      Decimal.set({ defaults: true });

      // 7. precision=6 ROUND_HALF_UP tan(0.5) then defaults restore
      Decimal.set({ precision: 6, rounding: Decimal.ROUND_HALF_UP });
      let a7_1: string = new Decimal('0.5').tan().toString();
      let e7_1: string = '0.546302';
      expect(a7_1).assertEqual(e7_1);
      Decimal.set({ defaults: true });
      let a7_2: string = new Decimal('0.5').tan().toString();
      let e7_2: string = '0.54630248984379051326';
      expect(a7_2).assertEqual(e7_2);

      // 8. tan(0.5).mul(2) basic value '1.0926049796875810265'
      let a8_1: string = new Decimal('0.5').tan().mul(2).toString();
      let e8_1: string = '1.0926049796875810265';
      expect(a8_1).assertEqual(e8_1);

      // 9. static Decimal.tan('0.25').add(1) close to 1.2553...
      let s9: Decimal = Decimal.tan('0.25').add(new Decimal('1'));
      let n9_1: number = s9.sub(new Decimal('1.2553419212210362665')).abs().comparedTo(new Decimal('1e-19'));
      let e9_1: int = -1;
      expect(n9_1).assertEqual(e9_1);

      // 10. static Decimal.tan('0.25').mul(2) close to 0.5106...
      let t10: Decimal = Decimal.tan('0.25').mul(new Decimal('2'));
      let n10_1: number = t10.sub(new Decimal('0.510683842442072533')).abs().comparedTo(new Decimal('1e-19'));
      let e10_1: int = -1;
      expect(n10_1).assertEqual(e10_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TAN_1200
     * @tc.name decimalTanTest012
     * @tc.desc Immutability & arithmetic (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalTanTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. static Decimal.tan(Decimal '0.5000...') basic value
      let src1: Decimal = new Decimal('0.50000000000000000000');
      let r1: Decimal = Decimal.tan(src1);
      let a1_1: string = r1.toString();
      let e1_1: string = '0.54630248984379051326';
      expect(a1_1).assertEqual(e1_1);

      // 2. static Decimal.tan(src) twice returns same value, src unchanged
      let src2: Decimal = new Decimal('0.5');
      let r2_1: Decimal = Decimal.tan(src2);
      let r2_2: Decimal = Decimal.tan(src2);
      let a2_1: string = r2_1.toString();
      let e2_1: string = '0.54630248984379051326';
      expect(a2_1).assertEqual(e2_1);
      let a2_2: string = r2_2.toString();
      let e2_2: string = '0.54630248984379051326';
      expect(a2_2).assertEqual(e2_2);
      let a2_3: string = src2.toString();
      let e2_3: string = '0.5';
      expect(a2_3).assertEqual(e2_3);

      // 3. static Decimal.tan(Decimal '0.75') basic value, src unchanged
      let src3: Decimal = new Decimal('0.75');
      let r3: Decimal = Decimal.tan(src3);
      let a3_1: string = r3.toString();
      let e3_1: string = '0.93159645994407246117';
      expect(a3_1).assertEqual(e3_1);
      let a3_2: string = src3.toString();
      let e3_2: string = '0.75';
      expect(a3_2).assertEqual(e3_2);

      // 4. static Decimal.tan(src) result is not same reference as src
      let src4: Decimal = new Decimal('0.25');
      let r4: Decimal = Decimal.tan(src4);
      expect(r4).not().assertEqual(src4);

      // 5. static Decimal.tan('0.25') twice: distinct refs but equal
      let r5_1: Decimal = Decimal.tan('0.25');
      let r5_2: Decimal = Decimal.tan('0.25');
      expect(r5_1).not().assertEqual(r5_2);
      let b5_1: boolean = r5_1.equals(r5_2);
      expect(b5_1).assertTrue();

      // 6. static Decimal.tan(src) does not mutate src s/e
      let src6: Decimal = new Decimal('0.25');
      let se6: number = src6.s;
      let ee6: number = src6.e;
      let r6: Decimal = Decimal.tan(src6);
      let b6_1: boolean = r6.isNaN();
      expect(b6_1).assertFalse();
      let n6_1: number = src6.s;
      expect(n6_1).assertEqual(se6);
      let n6_2: number = src6.e;
      expect(n6_2).assertEqual(ee6);

      // 7. static Decimal.tan(Decimal '-3') basic value, src unchanged
      let src7: Decimal = new Decimal('-3');
      let r7: Decimal = Decimal.tan(src7);
      let a7_1: string = r7.toString();
      let e7_1: string = '0.1425465430742778053';
      expect(a7_1).assertEqual(e7_1);
      let a7_2: string = src7.toString();
      let e7_2: string = '-3';
      expect(a7_2).assertEqual(e7_2);

      // 8. static Decimal.tan('0.25').add(1).mul(2) close to 2.5106...
      let r8: Decimal = Decimal.tan('0.25').add(new Decimal('1')).mul(new Decimal('2'));
      let n8_1: number = r8.sub(new Decimal('2.510683842442072533')).abs().comparedTo(new Decimal('1e-19'));
      let e8_1: int = -1;
      expect(n8_1).assertEqual(e8_1);

      // 9. static Decimal.tan('0.25').div(2) basic value '0.12767096061051813325'
      let q9: Decimal = Decimal.tan('0.25').div(new Decimal('2'));
      let a9_1: string = q9.toString();
      let e9_1: string = '0.12767096061051813325';
      expect(a9_1).assertEqual(e9_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TAN_1300
     * @tc.name decimalTanTest013
     * @tc.desc String parsing & invalid inputs (8 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalTanTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. static Decimal.tan('+1') equals Decimal.tan('1') (sign prefix)
      let a1_1: string = Decimal.tan('+1').toString();
      let e1_1: string = Decimal.tan('1').toString();
      expect(a1_1).assertEqual(e1_1);

      // 2. static Decimal.tan(spaces) throws error 401
      let ws2: string = ' ';
      let spaces2: string = ws2 + ws2 + ws2;
      try {
        Decimal.tan(spaces2);
        expect().assertFail();
      } catch (excp2) {
        expect(excp2.code).assertEqual(401);
      }

      // 3. static Decimal.tan('0x10') hex parse basic value
      let r3: Decimal = Decimal.tan('0x10');
      let a3_1: string = r3.toString();
      let e3_1: string = '0.30063224202390336579';
      expect(a3_1).assertEqual(e3_1);

      // 4. static Decimal.tan('0b101') binary parse basic value
      let r4: Decimal = Decimal.tan('0b101');
      let a4_1: string = r4.toString();
      let e4_1: string = '-3.380515006246585637';
      expect(a4_1).assertEqual(e4_1);

      // 5. static Decimal.tan('中文') throws error 401
      try {
        Decimal.tan('中文');
        expect().assertFail();
      } catch (excp5) {
        expect(excp5.code).assertEqual(401);
      }

      // 6. static Decimal.tan('😀') throws error 401
      try {
        Decimal.tan('😀');
        expect().assertFail();
      } catch (excp6) {
        expect(excp6.code).assertEqual(401);
      }

      // 7. static Decimal.tan('​123' with zero-width space) throws error 401
      try {
        Decimal.tan('​123');
        expect().assertFail();
      } catch (excp7) {
        expect(excp7.code).assertEqual(401);
      }

      // 8. static Decimal.tan('<script>...') XSS string throws error 401
      try {
        Decimal.tan('<script>alert(1)</script>');
        expect().assertFail();
      } catch (excp8) {
        expect(excp8.code).assertEqual(401);
      }
    });
  });
}
