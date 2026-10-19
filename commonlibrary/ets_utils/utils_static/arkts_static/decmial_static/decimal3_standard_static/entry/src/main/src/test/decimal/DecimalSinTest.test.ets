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
import { DecimalConfig } from '@arkts.math.Decimal';

type DecimalValue = string | double | Decimal;
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

export default function decimalSinTest(): void {
  describe('DecimalSinTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      Decimal.set({ defaults: true });
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_0100
     * @tc.name decimalSinTest001
     * @tc.desc sin basic values - simple exact results (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSinTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. sin(0) returns "0"
      const d1: Decimal = new Decimal(0).sin();
      let av1: string = d1.toString();
      let ev1: string = '0';
      expect(av1).assertEqual(ev1);

      // 2. sin(π/2) returns "1"
      const d2: Decimal = new Decimal('1.5707963267948966').sin();
      let av2: string = d2.toString();
      let ev2: string = '1';
      expect(av2).assertEqual(ev2);

      // 3. sin(-π/2) returns "-1"
      const d3: Decimal = new Decimal('-1.5707963267948966').sin();
      let av3: string = d3.toString();
      let ev3: string = '-1';
      expect(av3).assertEqual(ev3);

      // 4. sin(-1) returns "-0.84147098480789650665"
      const d4: Decimal = new Decimal(-1).sin();
      let av4: string = d4.toString();
      let ev4: string = '-0.84147098480789650665';
      expect(av4).assertEqual(ev4);

      // 5. sin(4) returns "-0.75680249530792825137"
      const d5: Decimal = new Decimal(4).sin();
      let av5: string = d5.toString();
      let ev5: string = '-0.75680249530792825137';
      expect(av5).assertEqual(ev5);

      // 6. sin('0.5') string equals sin(0.5) double
      const ds6: Decimal = new Decimal('0.5').sin();
      const dd6: Decimal = new Decimal(0.5).sin();
      let av6: string = ds6.toString();
      let ev6: string = dd6.toString();
      expect(av6).assertEqual(ev6);

      // 7. sin(1).toNumber() returns 0.8414709848078965
      const d7: Decimal = new Decimal(1).sin();
      let av7: number = d7.toNumber();
      let ev7: number = 0.8414709848078965;
      expect(av7).assertEqual(ev7);

      // 8. sin('π/2').negate() returns "-1"
      let r8: Decimal = Decimal.sin('1.5707963267948966').negate();
      let av8: string = r8.toString();
      let ev8: string = '-1';
      expect(av8).assertEqual(ev8);

      // 9. sin('-0.5') returns "-0.47942553860420300027"
      let r9: Decimal = Decimal.sin('-0.5');
      let av9: string = r9.toString();
      let ev9: string = '-0.47942553860420300027';
      expect(av9).assertEqual(ev9);

      // 10. sin('+1') equals sin('1')
      let av10: string = Decimal.sin('+1').toString();
      let ev10: string = Decimal.sin('1').toString();
      expect(av10).assertEqual(ev10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_0200
     * @tc.name decimalSinTest002
     * @tc.desc sin basic values - near-zero, large & float inputs (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSinTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. sin(2π) returns near-zero "-4.7692528676655900577e-16"
      const d1: Decimal = new Decimal('6.283185307179586').sin();
      let av1: string = d1.toString();
      let ev1: string = '-4.7692528676655900577e-16';
      expect(av1).assertEqual(ev1);

      // 2. sin(-2π) returns near-zero "4.7692528676655900577e-16"
      const d2: Decimal = new Decimal('-6.283185307179586').sin();
      let av2: string = d2.toString();
      let ev2: string = '4.7692528676655900577e-16';
      expect(av2).assertEqual(ev2);

      // 3. sin(0.1+0.2) equals sin('0.30000000000000004')
      const ds3: Decimal = new Decimal(0.1 + 0.2).sin();
      const dd3: Decimal = new Decimal('0.30000000000000004').sin();
      let av3: string = ds3.toString();
      let ev3: string = dd3.toString();
      expect(av3).assertEqual(ev3);

      // 4. sin(Number.MAX_SAFE_INTEGER) returns "-0.013949324588032910842"
      const d4: Decimal = new Decimal(Number.MAX_SAFE_INTEGER).sin();
      let av4: string = d4.toString();
      let ev4: string = '-0.013949324588032910842';
      expect(av4).assertEqual(ev4);

      // 5. sin(1) round-trip through toString
      const d5: Decimal = new Decimal(1).sin();
      const round5: Decimal = new Decimal(d5.toString());
      let av5: string = round5.toString();
      let ev5: string = d5.toString();
      expect(av5).assertEqual(ev5);

      // 6. sin('1e-6') approximates Math.sin(1e-6)
      let c6: double = Decimal.sin('1e-6').toNumber();
      expect(Math.abs(c6 - Math.sin(1e-6))).assertLess(1e-18);

      // 7. sin('1e10') absolute value less than 1
      expect(Decimal.sin('1e10').abs().comparedTo(new Decimal('1'))).assertLess(1);

      // 8. sin(0.1+0.2) approximates Math.sin(0.1+0.2)
      let c8: double = Decimal.sin(0.1 + 0.2).toNumber();
      expect(Math.abs(c8 - Math.sin(0.1 + 0.2))).assertLess(1e-15);

      // 9. sin(9007199254740993) absolute value less than 1
      let r9: Decimal = Decimal.sin(9007199254740993);
      expect(r9.abs().comparedTo(new Decimal('1'))).assertLess(1);

      // 10. sin(Number.MAX_SAFE_INTEGER) is not NaN
      let r10: Decimal = Decimal.sin(Number.MAX_SAFE_INTEGER);
      let av10: boolean = r10.isNaN();
      expect(av10).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_0300
     * @tc.name decimalSinTest003
     * @tc.desc sin special values NaN/±Infinity/±0 (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSinTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. sin(-0) returns "0" and isZero is true
      const d1: Decimal = new Decimal(-0).sin();
      let av1a: string = d1.toString();
      let ev1a: string = '0';
      expect(av1a).assertEqual(ev1a);
      let av1b: boolean = d1.isZero();
      expect(av1b).assertTrue();

      // 2. sin(Infinity) isNaN is true
      const d2: Decimal = new Decimal(Number.POSITIVE_INFINITY).sin();
      let av2: boolean = d2.isNaN();
      expect(av2).assertTrue();

      // 3. sin('NaN') isNaN is true
      const d3: Decimal = new Decimal('NaN').sin();
      let av3: boolean = d3.isNaN();
      expect(av3).assertTrue();

      // 4. sin('Infinity') isNaN is true
      const d4: Decimal = new Decimal('Infinity').sin();
      let av4: boolean = d4.isNaN();
      expect(av4).assertTrue();

      // 5. sin('-Infinity') isNaN is true
      const d5: Decimal = new Decimal('-Infinity').sin();
      let av5: boolean = d5.isNaN();
      expect(av5).assertTrue();

      // 6. sin(-0) static method, isNegative is true
      let r6: Decimal = Decimal.sin(-0);
      let av6a: string = r6.toString();
      let ev6a: string = '0';
      expect(av6a).assertEqual(ev6a);
      let av6b: boolean = r6.isNegative();
      expect(av6b).assertTrue();

      // 7. sin(Decimal(NaN)) isNaN is true
      let src7: Decimal = new Decimal(Number.NaN);
      let r7: Decimal = Decimal.sin(src7);
      let av7: boolean = r7.isNaN();
      expect(av7).assertTrue();

      // 8. sin('-0') isZero is true
      let r8: Decimal = Decimal.sin('-0');
      let av8: boolean = r8.isZero();
      expect(av8).assertTrue();

      // 9. sin('-0') isNegative is true
      let r9: Decimal = Decimal.sin('-0');
      let av9: boolean = r9.isNegative();
      expect(av9).assertTrue();

      // 10. sin('-0') comparedTo(0) equals 0
      let r10: Decimal = Decimal.sin('-0');
      let av10: number = r10.comparedTo(0);
      let ev10: int = 0;
      expect(av10).assertEqual(ev10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_0400
     * @tc.name decimalSinTest004
     * @tc.desc sin precision/rounding config & input consistency (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSinTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. sin(1) at precisions 5, 10 and 50
      let precs1: int[] = [5, 10, 50];
      let expVals1: string[] = [
        '0.84147',
        '0.8414709848',
        '0.84147098480789650665250232163029899962256306079837',
      ];
      for (let idx1: int = 0; idx1 < precs1.length; idx1++) {
        Decimal.set({ precision: precs1[idx1] });
        const d1: Decimal = new Decimal(1).sin();
        let av1: string = d1.toString();
        expect(av1).assertEqual(expVals1[idx1]);
        Decimal.set({ defaults: true });
      }

      // 2. precision=6 rounding=ROUND_DOWN sin(1)
      Decimal.set({ precision: 6, rounding: Decimal.ROUND_DOWN });
      const d2: Decimal = new Decimal(1).sin();
      let av2: string = d2.toString();
      let ev2: string = '0.84147';
      expect(av2).assertEqual(ev2);
      Decimal.set({ defaults: true });

      // 3. precision=6 rounding=ROUND_HALF_UP sin(1)
      Decimal.set({ precision: 6, rounding: Decimal.ROUND_HALF_UP });
      const d3: Decimal = new Decimal(1).sin();
      let av3: string = d3.toString();
      let ev3: string = '0.841471';
      expect(av3).assertEqual(ev3);
      Decimal.set({ defaults: true });

      // 4. precision=5 rounding=ROUND_CEILING sin(-1)
      Decimal.set({ precision: 5, rounding: Decimal.ROUND_CEILING });
      const d4: Decimal = new Decimal(-1).sin();
      let av4: string = d4.toString();
      let ev4: string = '-0.84147';
      expect(av4).assertEqual(ev4);
      Decimal.set({ defaults: true });

      // 5. precision=5 rounding=ROUND_FLOOR sin(-1)
      Decimal.set({ precision: 5, rounding: Decimal.ROUND_FLOOR });
      const d5: Decimal = new Decimal(-1).sin();
      let av5: string = d5.toString();
      let ev5: string = '-0.84148';
      expect(av5).assertEqual(ev5);
      Decimal.set({ defaults: true });

      // 6. precision=5 then defaults sin(1)
      Decimal.set({ precision: 5 });
      let d6: Decimal = new Decimal(1).sin();
      let av6a: string = d6.toString();
      let ev6a: string = '0.84147';
      expect(av6a).assertEqual(ev6a);
      Decimal.set({ defaults: true });
      d6 = new Decimal(1).sin();
      let av6b: string = d6.toString();
      let ev6b: string = '0.84147098480789650665';
      expect(av6b).assertEqual(ev6b);

      // 7. sin('3.141592653589793') equals sin(Math.PI)
      let av7: string = Decimal.sin('3.141592653589793').toString();
      let ev7: string = Decimal.sin(Math.PI).toString();
      expect(av7).assertEqual(ev7);

      // 8. precision=20 sin('0.5') approximates 0.47942553860420300027
      Decimal.set({ precision: 20 });
      let r8: Decimal = Decimal.sin('0.5');
      let av8: boolean = r8
        .sub(new Decimal('0.47942553860420300027'))
        .abs()
        .lessThanOrEqualTo(new Decimal('1e-18'));
      expect(av8).assertTrue();
      Decimal.set({ defaults: true });

      // 9. precision=30 sin('0.5') d.length equals 5
      Decimal.set({ precision: 30 });
      let r9: Decimal = Decimal.sin('0.5');
      let av9: int = r9.d!.length;
      let ev9: int = 5;
      expect(av9).assertEqual(ev9);
      Decimal.set({ defaults: true });

      // 10. sin('0.5') exponent equals -1
      let r10: Decimal = Decimal.sin('0.5');
      let av10: number = r10.e;
      let ev10: int = -1;
      expect(av10).assertEqual(ev10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_0500
     * @tc.name decimalSinTest005
     * @tc.desc sin immutability & argument handling (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSinTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. sin(Decimal) equals sin(copy of Decimal)
      const base1: Decimal = new Decimal(0.7);
      const copy1: Decimal = new Decimal(base1);
      let av1: string = base1.sin().toString();
      let ev1: string = copy1.sin().toString();
      expect(av1).assertEqual(ev1);

      // 2. Decimal.sign(sin(0.5)) equals 1
      const d2: Decimal = new Decimal(0.5).sin();
      let av2: number = Decimal.sign(d2);
      let ev2: int = 1;
      expect(av2).assertEqual(ev2);

      // 3. sin(sin(0)) comparedTo 0 equals 0
      let r3: Decimal = Decimal.sin(Decimal.sin(0));
      let av3: number = r3.comparedTo(new Decimal(0));
      let ev3: int = 0;
      expect(av3).assertEqual(ev3);

      // 4. sin('0.5') called twice, source unchanged
      let src4: Decimal = new Decimal('0.5');
      let r4a: Decimal = Decimal.sin(src4);
      let r4b: Decimal = Decimal.sin(src4);
      let av4a: string = r4a.toString();
      let ev4a: string = '0.47942553860420300027';
      expect(av4a).assertEqual(ev4a);
      let av4b: string = r4b.toString();
      let ev4b: string = '0.47942553860420300027';
      expect(av4b).assertEqual(ev4b);
      let av4c: string = src4.toString();
      let ev4c: string = '0.5';
      expect(av4c).assertEqual(ev4c);

      // 5. sin('0.25') returns a new instance each call (=== false)
      let r5: Decimal = Decimal.sin('0.25');
      let av5: boolean = r5 === Decimal.sin('0.25');
      expect(av5).assertFalse();

      // 6. sin(src) does not change src toString
      let src6: Decimal = new Decimal('0.3');
      let before6: string = src6.toString();
      Decimal.sin(src6);
      let av6: string = src6.toString();
      let ev6: string = before6;
      expect(av6).assertEqual(ev6);

      // 7. sin(src) preserves src digits, length, sign and exponent
      let src7: Decimal = new Decimal('0.3');
      let before7: int = src7.d!.length;
      const origVal7: string = src7.toString();
      const expOrigVal7: string = '0.3';
      expect(origVal7).assertEqual(expOrigVal7);
      const origDig7: Array<double> = src7.d!.slice(0);
      const origLen7: int = origDig7.length;
      const origSign7: double = src7.s;
      const origExp7: double = src7.e;
      Decimal.sin(src7);
      let av7a: int = src7.d!.length;
      let ev7a: number = before7;
      expect(av7a).assertEqual(ev7a);
      const actVal7: string = src7.toString();
      expect(actVal7).assertEqual(expOrigVal7);
      const actDig7: Array<double> = src7.d!;
      const actLen7: int = actDig7.length;
      expect(actLen7).assertEqual(origLen7);
      for (let ci7: int = 0; ci7 < origLen7; ci7++) {
        const ac7: double = actDig7[ci7];
        const ec7: double = origDig7[ci7];
        expect(ac7).assertEqual(ec7);
      }
      const actSign7: double = src7.s;
      expect(actSign7).assertEqual(origSign7);
      const actExp7: double = src7.e;
      expect(actExp7).assertEqual(origExp7);

      // 8. sin('-0.7') preserves source value, coefficient, length, sign and exponent
      let src8: Decimal = new Decimal('-0.7');
      let se8: number = src8.s;
      let ee8: number = src8.e;
      const origVal8: string = src8.toString();
      const expOrigVal8: string = '-0.7';
      expect(origVal8).assertEqual(expOrigVal8);
      const origDig8: Array<double> = src8.d!.slice(0);
      const origLen8: int = origDig8.length;
      const origSign8: double = src8.s;
      const origExp8: double = src8.e;
      Decimal.sin(src8);
      let av8a: number = src8.s;
      let ev8a: number = se8;
      expect(av8a).assertEqual(ev8a);
      let av8b: number = src8.e;
      let ev8b: number = ee8;
      expect(av8b).assertEqual(ev8b);
      const actVal8: string = src8.toString();
      expect(actVal8).assertEqual(expOrigVal8);
      const actDig8: Array<double> = src8.d!;
      const actLen8: int = actDig8.length;
      expect(actLen8).assertEqual(origLen8);
      for (let ci8: int = 0; ci8 < origLen8; ci8++) {
        const ac8: double = actDig8[ci8];
        const ec8: double = origDig8[ci8];
        expect(ac8).assertEqual(ec8);
      }
      const actSign8: double = src8.s;
      expect(actSign8).assertEqual(origSign8);
      const actExp8: double = src8.e;
      expect(actExp8).assertEqual(origExp8);

      // 9. sin('0.5') result snapshot, add(1) does not mutate
      let r9: Decimal = Decimal.sin('0.5');
      let snap9: string = r9.toString();
      r9.add(new Decimal('1'));
      let av9: string = r9.toString();
      let ev9: string = snap9;
      expect(av9).assertEqual(ev9);

      // 10. sin(src) called twice, results comparedTo 0
      let src10: Decimal = new Decimal('0.3');
      let first10: Decimal = Decimal.sin(src10);
      let second10: Decimal = Decimal.sin(src10);
      let av10: number = first10.comparedTo(second10);
      let ev10: int = 0;
      expect(av10).assertEqual(ev10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_0600
     * @tc.name decimalSinTest006
     * @tc.desc sin identities (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSinTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. sin(-0.8) = -sin(0.8) (odd function)
      const pos1: Decimal = new Decimal(0.8).sin();
      let av1a: string = pos1.toString();
      let ev1a: string = '0.71735609089952276163';
      expect(av1a).assertEqual(ev1a);
      const neg1: Decimal = new Decimal(-0.8).sin();
      let av1b: string = neg1.toString();
      let ev1b: string = '-0.71735609089952276163';
      expect(av1b).assertEqual(ev1b);

      // 2. sin(x) = cos(π/2 - x) (cofunction identity)
      const s2: Decimal = new Decimal(0.5).sin();
      const c2: Decimal = new Decimal('1.07079632679489661923').cos();
      let av2a: string = s2.toString();
      let ev2a: string = '0.47942553860420300027';
      expect(av2a).assertEqual(ev2a);
      let av2b: string = c2.toString();
      let ev2b: string = '0.47942553860420300027';
      expect(av2b).assertEqual(ev2b);

      // 3. sin(-1).negate() comparedTo sin(1) equals 0 (odd function)
      let neg3: Decimal = Decimal.sin(-1).negate();
      let av3: number = neg3.comparedTo(Decimal.sin(1));
      let ev3: int = 0;
      expect(av3).assertEqual(ev3);

      // 4. sin(-2).negate() comparedTo sin(2) equals 0 (odd function)
      let neg4: Decimal = new Decimal('-2');
      let pos4: Decimal = new Decimal('2');
      let r4: Decimal = Decimal.sin(neg4).negate();
      let av4: number = r4.comparedTo(Decimal.sin(pos4));
      let ev4: int = 0;
      expect(av4).assertEqual(ev4);

      // 5. sin(Math.PI) returns "2.3846264338327950288e-16" (near-zero)
      let res5: Decimal = Decimal.sin(Math.PI);
      let av5: string = res5.toString();
      let ev5: string = '2.3846264338327950288e-16';
      expect(av5).assertEqual(ev5);

      // 6. sin('-0.9').negate() comparedTo sin('0.9') equals 0 (odd function)
      let neg6: Decimal = Decimal.sin('-0.9').negate();
      let av6: number = neg6.comparedTo(Decimal.sin('0.9'));
      let ev6: int = 0;
      expect(av6).assertEqual(ev6);

      // 7. sin(0.3) ≈ cos(π/2 - 0.3) (cofunction identity)
      let s7: Decimal = Decimal.sin('0.3');
      let c7: Decimal = Decimal.cos('1.2707963267948966');
      let av7a: string = s7.toString();
      let ev7a: string = '0.29552020666133957511';
      expect(av7a).assertEqual(ev7a);
      let av7b: string = c7.toString();
      let ev7b: string = '0.29552020666133959348';
      expect(av7b).assertEqual(ev7b);

      // 8. sin(2x) = 2·sin(x)·cos(x) (double-angle identity)
      let lhs8: Decimal = Decimal.sin('1.2');
      let rhs8: Decimal = Decimal.sin('0.6').mul(2).mul(Decimal.cos('0.6'));
      let av8: number = lhs8.comparedTo(rhs8);
      let ev8: int = 0;
      expect(av8).assertEqual(ev8);

      // 9. sin(-0.4) + sin(0.4) ≈ 0 (odd function)
      let r9: Decimal = Decimal.sin('-0.4').add(Decimal.sin('0.4'));
      let av9: boolean = r9.abs().lessThanOrEqualTo(new Decimal('1e-18'));
      expect(av9).assertTrue();

      // 10. sin(x + 2π) = sin(x) (periodicity) at precision 20
      Decimal.set({ precision: 20 });
      let x10: Decimal = new Decimal('3.141592653589793238462643383279').div(4);
      let r10: Decimal = Decimal.sin(x10.add(new Decimal('3.141592653589793238462643383279').mul(2)));
      let av10: boolean = r10.sub(Decimal.sin(x10)).abs().lessThanOrEqualTo(new Decimal('1e-12'));
      expect(av10).assertTrue();
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_0700
     * @tc.name decimalSinTest007
     * @tc.desc sin identities with high precision & extreme bounds (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSinTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. sin(π/2) ≈ 1 at precision 20
      Decimal.set({ precision: 20 });
      let r1: Decimal = Decimal.sin(new Decimal('3.141592653589793238462643383279').div(2));
      let av1: boolean = r1.sub(new Decimal('1')).abs().lessThanOrEqualTo(new Decimal('1e-18'));
      expect(av1).assertTrue();
      Decimal.set({ defaults: true });

      // 2. sin(π) ≈ 0 at precision 20
      Decimal.set({ precision: 20 });
      let r2: Decimal = Decimal.sin(new Decimal('3.141592653589793238462643383279'));
      let av2: boolean = r2.abs().lessThanOrEqualTo(new Decimal('1e-18'));
      expect(av2).assertTrue();
      Decimal.set({ defaults: true });

      // 3. sin(π/3) ≈ √3/2 at precision 20
      Decimal.set({ precision: 20 });
      let r3: Decimal = Decimal.sin(new Decimal('3.141592653589793238462643383279').div(3));
      let half3: Decimal = Decimal.sqrt(3).div(2);
      let av3: boolean = r3.sub(half3).abs().lessThanOrEqualTo(new Decimal('1e-18'));
      expect(av3).assertTrue();
      Decimal.set({ defaults: true });

      // 4. sin(-π/6) ≈ -0.5 at precision 20
      Decimal.set({ precision: 20 });
      let r4: Decimal = Decimal.sin(new Decimal('3.141592653589793238462643383279').div(6).negate());
      let av4: boolean = r4.add(new Decimal('0.5')).abs().lessThanOrEqualTo(new Decimal('1e-18'));
      expect(av4).assertTrue();
      Decimal.set({ defaults: true });

      // 5. sin(2π) ≈ 0 at precision 20
      Decimal.set({ precision: 20 });
      let r5: Decimal = Decimal.sin(new Decimal('3.141592653589793238462643383279').mul(2));
      let av5: boolean = r5.abs().lessThanOrEqualTo(new Decimal('1e-18'));
      expect(av5).assertTrue();
      Decimal.set({ defaults: true });

      // 6. sin('0.001') ≈ 0.001 (small angle)
      let r6: Decimal = Decimal.sin('0.001');
      let av6: boolean = r6.sub(new Decimal('0.001')).abs().lessThanOrEqualTo(new Decimal('1e-9'));
      expect(av6).assertTrue();

      // 7. sin('1e5') absolute value ≤ 1
      let r7: Decimal = Decimal.sin('1e5');
      let av7: boolean = r7.abs().lessThanOrEqualTo(new Decimal('1'));
      expect(av7).assertTrue();

      // 8. sin('-1e30') isFinite is true
      let r8: Decimal = Decimal.sin('-1e30');
      let av8: boolean = r8.isFinite();
      expect(av8).assertTrue();

      // 9. sin('-1e30') absolute value ≤ 1
      let r9: Decimal = Decimal.sin('-1e30');
      let av9: boolean = r9.abs().lessThanOrEqualTo(new Decimal('1'));
      expect(av9).assertTrue();

      // 10. sin(π/6)·2 ≈ 1 at precision 20
      Decimal.set({ precision: 20 });
      let r10: Decimal = Decimal.sin(new Decimal('3.141592653589793238462643383279').div(6)).mul(2);
      let av10: boolean = r10.sub(new Decimal('1')).abs().lessThanOrEqualTo(new Decimal('1e-18'));
      expect(av10).assertTrue();
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_0800
     * @tc.name decimalSinTest008
     * @tc.desc sin error paths (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSinTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. sin(undefined) rejects with ClassCastError (code 0)
      const v1: string | undefined = undefined;
      try {
        new Decimal(v1 as string).sin();
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(0);
      }

      // 2. sin rejects precision beyond available PI digits (error 10200060)
      Decimal.set({ precision: 1000000000 });
      try {
        new Decimal(1).sin();
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200060);
      }
      Decimal.set({ defaults: true });

      // 3. Decimal.set(123 as DecimalConfig) rejects with ClassCastError (code 0)
      try {
        Decimal.set(123 as Object as DecimalConfig);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(0);
      }
      Decimal.set({ defaults: true });

      // 4. sin('   ') (spaces) throws error 401
      let ws4: string = ' ';
      let spaces4: string = ws4 + ws4 + ws4;
      try {
        Decimal.sin(spaces4);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(401);
      }

      // 5. sin('中文') throws error 401
      try {
        Decimal.sin('中文');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(401);
      }

      // 6. sin('😀') throws error 401
      try {
        Decimal.sin('😀');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(401);
      }

      // 7. sin('​123') (zero-width char) throws error 401
      try {
        Decimal.sin('​123');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(401);
      }

      // 8. sin('<script>alert(1)</script>') (XSS) throws error 401
      try {
        Decimal.sin('<script>alert(1)</script>');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(401);
      }

      // 9. sin(Record) rejects with ClassCastError (code 0)
      let rec9: Record<string, number> = { 'k': 3 };
      try {
        Decimal.sin(rec9 as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_0900
     * @tc.name decimalSinTest009
     * @tc.desc sin string syntax, extreme values & formatting (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSinTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. sin('0x10') (hex string) returns "-0.28790331666506529478"
      let r1: Decimal = Decimal.sin('0x10');
      let av1: string = r1.toString();
      let ev1: string = '-0.28790331666506529478';
      expect(av1).assertEqual(ev1);

      // 2. sin('0123') (octal-like string) returns "-0.45990349068959125129"
      let r2: Decimal = Decimal.sin('0123');
      let av2: string = r2.toString();
      let ev2: string = '-0.45990349068959125129';
      expect(av2).assertEqual(ev2);

      // 3. sin('0b101') (binary string) returns "-0.95892427466313846889"
      let r3: Decimal = Decimal.sin('0b101');
      let av3: string = r3.toString();
      let ev3: string = '-0.95892427466313846889';
      expect(av3).assertEqual(ev3);

      // 4. sin('0' + 9999 zeros) returns "0"
      let digits4: string = '0';
      let i4: number = 0;
      while (i4 < 9999) {
        digits4 += '0';
        i4 = i4 + 1;
      }
      let r4: Decimal = Decimal.sin(digits4);
      let av4: string = r4.toString();
      let ev4: string = '0';
      expect(av4).assertEqual(ev4);

      // 5. sin(1.7976931348623157e308) is finite and not NaN
      let r5: Decimal = Decimal.sin(1.7976931348623157e308);
      let av5a: boolean = !r5.isFinite();
      expect(av5a).assertFalse();
      let av5b: boolean = r5.isNaN();
      expect(av5b).assertFalse();

      // 6. sin(5e-324) is not NaN and |result| < 1
      let r6: Decimal = Decimal.sin(5e-324);
      let av6a: boolean = r6.isNaN();
      expect(av6a).assertFalse();
      expect(r6.abs().comparedTo(new Decimal('1'))).assertLess(1);

      // 7. sin('0.5').toFixed(5) returns "0.47943"
      let r7: Decimal = Decimal.sin('0.5');
      let av7: string = r7.toFixed(5);
      let ev7: string = '0.47943';
      expect(av7).assertEqual(ev7);

      // 8. sin('0').add('0.5') returns "0.5"
      let r8: Decimal = Decimal.sin('0').add('0.5');
      let av8: string = r8.toString();
      let ev8: string = '0.5';
      expect(av8).assertEqual(ev8);

      // 9. sin('0.5').toFixed(2) returns "0.48"
      let r9: string = Decimal.sin('0.5').toFixed(2);
      expect(r9).assertEqual('0.48');

      // 10. sin('0').sqrt() returns "0"
      let r10: Decimal = Decimal.sin('0').sqrt();
      let av10: string = r10.toString();
      let ev10: string = '0';
      expect(av10).assertEqual(ev10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_1000
     * @tc.name decimalSinTest010
     * @tc.desc sin result properties & internal structure (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSinTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. Decimal.sign(sin(-0.5)) equals -1
      const d1: Decimal = new Decimal(-0.5).sin();
      let av1: number = Decimal.sign(d1);
      let ev1: int = -1;
      expect(av1).assertEqual(ev1);

      // 2. sin(0).s equals 1
      let r2: Decimal = Decimal.sin(0);
      let av2: number = r2.s;
      let ev2: int = 1;
      expect(av2).assertEqual(ev2);

      // 3. sin(-1).s equals -1
      let r3: Decimal = Decimal.sin(-1);
      let av3: number = r3.s;
      let ev3: int = -1;
      expect(av3).assertEqual(ev3);

      // 4. sin(0).e equals 0
      let r4: Decimal = Decimal.sin(0);
      let av4: number = r4.e;
      let ev4: int = 0;
      expect(av4).assertEqual(ev4);

      // 5. sin('0.5').d[0] equals 4794255
      let r5: Decimal = Decimal.sin('0.5');
      let av5: number = r5.d![0];
      let ev5: int = 4794255;
      expect(av5).assertEqual(ev5);

      // 6. sin('0.5').d.length equals 3
      let r6: Decimal = Decimal.sin('0.5');
      let av6: int = r6.d!.length;
      let ev6: int = 3;
      expect(av6).assertEqual(ev6);

      // 7. sin(0).isZero() is true
      let av7: boolean = Decimal.sin(0).isZero();
      expect(av7).assertTrue();

      // 8. sin(-1).isNegative() is true
      let av8: boolean = Decimal.sin(-1).isNegative();
      expect(av8).assertTrue();

      // 9. sin(1) comparedTo 0.84147098480789650665 equals 0
      let cmp9: double = Decimal.sin(1).comparedTo(new Decimal('0.84147098480789650665'));
      expect(cmp9).assertEqual(0);

      // 10. sin('1e6').isFinite() is true
      let av10: boolean = Decimal.sin('1e6').isFinite();
      expect(av10).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_1100
     * @tc.name decimalSinTest011
     * @tc.desc sin static vs instance equivalence & result properties (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSinTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. sin(0).isInteger() is true
      let av1: boolean = Decimal.sin(0).isInteger();
      expect(av1).assertTrue();

      // 2. sin('1.5707963267948966').isInteger() is true
      let av2: boolean = Decimal.sin('1.5707963267948966').isInteger();
      expect(av2).assertTrue();

      // 3. Decimal.sin(1) equals new Decimal(1).sin()
      let av3: string = Decimal.sin(1).toString();
      let ev3: string = new Decimal(1).sin().toString();
      expect(av3).assertEqual(ev3);

      // 4. Decimal.sin('2') equals new Decimal('2').sin()
      let av4: string = Decimal.sin('2').toString();
      let ev4: string = new Decimal('2').sin().toString();
      expect(av4).assertEqual(ev4);

      // 5. Decimal.sin(-0) equals new Decimal(-0).sin()
      let av5: string = Decimal.sin(-0).toString();
      let ev5: string = new Decimal(-0).sin().toString();
      expect(av5).assertEqual(ev5);

      // 6. Decimal.sin(src) equals src.sin()
      let src6: Decimal = new Decimal('0.5');
      let av6: string = Decimal.sin(src6).toString();
      let ev6: string = src6.sin().toString();
      expect(av6).assertEqual(ev6);

      // 7. sin('0').comparedTo(0) equals 0
      let r7: Decimal = Decimal.sin('0');
      let av7: number = r7.comparedTo(0);
      let ev7: int = 0;
      expect(av7).assertEqual(ev7);

      // 8. new Decimal('0.3').sin() equals Decimal.sin('0.3')
      let r8: Decimal = new Decimal('0.3').sin();
      let av8: number = r8.comparedTo(Decimal.sin('0.3'));
      let ev8: int = 0;
      expect(av8).assertEqual(ev8);

      // 9. new Decimal('-0.7').sin() equals Decimal.sin('-0.7')
      let r9: Decimal = new Decimal('-0.7').sin();
      let av9: number = r9.comparedTo(Decimal.sin('-0.7'));
      let ev9: int = 0;
      expect(av9).assertEqual(ev9);

      // 10. new Decimal('0.25').sin() equals Decimal.sin('0.25')
      let r10: Decimal = new Decimal('0.25').sin();
      let av10: string = r10.toString();
      let ev10: string = Decimal.sin('0.25').toString();
      expect(av10).assertEqual(ev10);
    });
  });
}
