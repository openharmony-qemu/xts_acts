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

export default function decimalSqrtTest(): void {
  describe('DecimalSqrtTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      Decimal.set({ defaults: true });
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_0100
     * @tc.name decimalSqrtTest001
     * @tc.desc Perfect squares yield exact integer results (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSqrtTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. sqrt(81) equals '9'
      let d1: Decimal = new Decimal(81);
      let r1: Decimal = d1.sqrt();
      let act1: string = r1.toString();
      let exp1: string = '9';
      expect(act1).assertEqual(exp1);

      // 2. sqrt(4) equals '2'
      let d2: Decimal = new Decimal(4);
      let act2: string = d2.sqrt().toString();
      let exp2: string = '2';
      expect(act2).assertEqual(exp2);

      // 3. sqrt('12345678987654321') equals '111111111'
      let d3: Decimal = new Decimal('12345678987654321');
      let act3: string = d3.sqrt().toString();
      let exp3: string = '111111111';
      expect(act3).assertEqual(exp3);

      // 4. sqrt(40000) e 2 and toString '200'
      let d4: Decimal = new Decimal(40000);
      let r4: Decimal = d4.sqrt();
      let act4: number = r4.e;
      let exp4: int = 2;
      expect(act4).assertEqual(exp4);
      let act4B: string = r4.toString();
      let exp4B: string = '200';
      expect(act4B).assertEqual(exp4B);

      // 5. sqrt('12345678987654321') equals Decimal(111111111)
      let d5: Decimal = new Decimal('12345678987654321');
      let act5: boolean = d5.sqrt().equals(new Decimal(111111111));
      expect(act5).assertTrue();

      // 6. Decimal.sqrt('9') equals '3'
      let r6: Decimal = Decimal.sqrt('9');
      let act6: string = r6.toString();
      let exp6: string = '3';
      expect(act6).assertEqual(exp6);

      // 7. Decimal.sqrt(new Decimal(16)) equals '4'
      let src7: Decimal = new Decimal(16);
      let r7: Decimal = Decimal.sqrt(src7);
      let act7: string = r7.toString();
      let exp7: string = '4';
      expect(act7).assertEqual(exp7);

      // 8. Decimal.sqrt(new Decimal('2.25')) equals '1.5'
      let src8: Decimal = new Decimal('2.25');
      let r8: Decimal = Decimal.sqrt(src8);
      let act8: string = r8.toString();
      let exp8: string = '1.5';
      expect(act8).assertEqual(exp8);

      // 9. Decimal.sqrt(144) equals '12'
      let act9: string = Decimal.sqrt(144).toString();
      let exp9: string = '12';
      expect(act9).assertEqual(exp9);

      // 10. Decimal.sqrt(1000000) toString length 4 and value '1000'
      let act10: int = Decimal.sqrt(1000000).toString().length;
      let exp10: int = 4;
      expect(act10).assertEqual(exp10);
      let act10B: string = Decimal.sqrt(1000000).toString();
      let exp10B: string = '1000';
      expect(act10B).assertEqual(exp10B);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_0200
     * @tc.name decimalSqrtTest002
     * @tc.desc Nested sqrt and chained arithmetic operations (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSqrtTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. sqrt(81).sqrt() equals '3'
      let d1: Decimal = new Decimal(81);
      let r1: Decimal = d1.sqrt().sqrt();
      let act1: string = r1.toString();
      let exp1: string = '3';
      expect(act1).assertEqual(exp1);

      // 2. sqrt(2).mul(sqrt(2)) equals '2'
      let d2: Decimal = new Decimal(2);
      let r2: Decimal = d2.sqrt().mul(d2.sqrt());
      let act2: string = r2.toString();
      let exp2: string = '2';
      expect(act2).assertEqual(exp2);

      // 3. sqrt(4).add(1) equals '3'
      let d3: Decimal = new Decimal(4);
      let r3: Decimal = d3.sqrt().add(new Decimal(1));
      let act3: string = r3.toString();
      let exp3: string = '3';
      expect(act3).assertEqual(exp3);

      // 4. sqrt(4).mul(3) equals '6'
      let d4: Decimal = new Decimal(4);
      let r4: Decimal = d4.sqrt().mul(new Decimal(3));
      let act4: string = r4.toString();
      let exp4: string = '6';
      expect(act4).assertEqual(exp4);

      // 5. sqrt(4).div(2) equals '1'
      let d5: Decimal = new Decimal(4);
      let r5: Decimal = d5.sqrt().div(new Decimal(2));
      let act5: string = r5.toString();
      let exp5: string = '1';
      expect(act5).assertEqual(exp5);

      // 6. sqrt(4).pow(2) equals '4'
      let d6: Decimal = new Decimal(4);
      let r6: Decimal = d6.sqrt().pow(new Decimal(2));
      let act6: string = r6.toString();
      let exp6: string = '4';
      expect(act6).assertEqual(exp6);

      // 7. sqrt(4).negate() equals '-2'
      let d7: Decimal = new Decimal(4);
      let r7: Decimal = d7.sqrt().negate();
      let act7: string = r7.toString();
      let exp7: string = '-2';
      expect(act7).assertEqual(exp7);

      // 8. sqrt(4).abs() equals '2'
      let positiveInput: Decimal = new Decimal(4);
      let r8: Decimal = positiveInput.sqrt().abs();
      let act8: string = r8.toString();
      let exp8: string = '2';
      expect(act8).assertEqual(exp8);

      // 9. Decimal.sqrt(9).add(1) equals '4'
      let r9: Decimal = Decimal.sqrt(9).add(1);
      let act9: string = r9.toString();
      let exp9: string = '4';
      expect(act9).assertEqual(exp9);

      // 10. Decimal.sqrt(16).sqrt() equals '2'
      let act10: string = Decimal.sqrt(16).sqrt().toString();
      let exp10: string = '2';
      expect(act10).assertEqual(exp10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_0300
     * @tc.name decimalSqrtTest003
     * @tc.desc Static method chained operations and numeric conversions (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSqrtTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. Decimal.sqrt(2).mul(Decimal.sqrt(2)) comparedTo 2 equals 0
      let act1: number = Decimal.sqrt(2).mul(Decimal.sqrt(2)).comparedTo(new Decimal(2));
      let exp1: int = 0;
      expect(act1).assertEqual(exp1);

      // 2. Decimal.sqrt(2).toSignificantDigits(10) equals '1.414213562'
      let act2: string = Decimal.sqrt(2).toSignificantDigits(10).toString();
      let exp2: string = '1.414213562';
      expect(act2).assertEqual(exp2);

      // 3. Decimal.sqrt(2).toPrecision(5) equals '1.4142'
      let act3: string = Decimal.sqrt(2).toPrecision(5).toString();
      let exp3: string = '1.4142';
      expect(act3).assertEqual(exp3);

      // 4. Decimal.sqrt(144).negate() equals '-12'
      let act4: string = Decimal.sqrt(144).negate().toString();
      let exp4: string = '-12';
      expect(act4).assertEqual(exp4);

      // 5. Decimal.sqrt(0.0001).mul(100) equals '1'
      let act5: string = Decimal.sqrt(0.0001).mul(100).toString();
      let exp5: string = '1';
      expect(act5).assertEqual(exp5);

      // 6. Decimal.sqrt(2).abs() equals Decimal.sqrt(2)
      let act6: boolean = Decimal.sqrt(2).abs().equals(Decimal.sqrt(2));
      expect(act6).assertTrue();

      // 7. sqrt(4).toNumber() equals 2
      let d7: Decimal = new Decimal(4);
      let act7: number = d7.sqrt().toNumber();
      let exp7: int = 2;
      expect(act7).assertEqual(exp7);

      // 8. sqrt(4).comparedTo(2) equals 0
      let comparisonInput: Decimal = new Decimal(4);
      let cmp8: double = comparisonInput.sqrt().comparedTo(new Decimal(2));
      expect(cmp8).assertEqual(0);

      // 9. new Decimal(Decimal.sqrt(2).toString()).equals(Decimal.sqrt(2))
      let r9: Decimal = Decimal.sqrt(2);
      let act9: boolean = new Decimal(r9.toString()).equals(r9);
      expect(act9).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_0400
     * @tc.name decimalSqrtTest004
     * @tc.desc Zero, negative-zero handling and identity equality (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSqrtTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. sqrt(0) equals '0' and isZero
      let d1: Decimal = new Decimal(0);
      let r1: Decimal = d1.sqrt();
      let act1: string = r1.toString();
      let exp1: string = '0';
      expect(act1).assertEqual(exp1);
      let act1B: boolean = r1.isZero();
      expect(act1B).assertTrue();

      // 2. sqrt(-0) equals sqrt(0)
      let a2: Decimal = new Decimal(-0).sqrt();
      let b2: Decimal = new Decimal(0).sqrt();
      let act2: boolean = a2.equals(b2);
      expect(act2).assertTrue();

      // 3. sqrt('-0.0') isZero and isNegative
      let d3: Decimal = new Decimal('-0.0');
      let r3: Decimal = d3.sqrt();
      let act3: boolean = r3.isZero();
      expect(act3).assertTrue();
      let act3B: boolean = r3.isNegative();
      expect(act3B).assertTrue();

      // 4. Decimal.sqrt('-0') equals '0'
      let act4: string = Decimal.sqrt('-0').toString();
      let exp4: string = '0';
      expect(act4).assertEqual(exp4);

      // 5. Decimal.sqrt(-0) equals new Decimal(-0).sqrt()
      let act5: string = Decimal.sqrt(-0).toString();
      let exp5: string = new Decimal(-0).sqrt().toString();
      expect(act5).assertEqual(exp5);

      // 6. sqrt(9) not equal to input d
      let d6: Decimal = new Decimal(9);
      let r6: Decimal = d6.sqrt();
      expect(r6).not().assertEqual(d6);

      // 7. Decimal.sqrt(new Decimal(144)) not equal to input d
      let d7: Decimal = new Decimal(144);
      let r7: Decimal = Decimal.sqrt(d7);
      expect(r7).not().assertEqual(d7);

      // 8. new Decimal(Decimal.sqrt(2)).equals(Decimal.sqrt(2))
      let r8a: Decimal = Decimal.sqrt(2);
      let r8b: Decimal = new Decimal(r8a);
      let act8: boolean = r8a.equals(r8b);
      expect(act8).assertTrue();

      // 9. sqrt(9).isPositive()
      let d9: Decimal = new Decimal(9);
      let act9: boolean = d9.sqrt().isPositive();
      expect(act9).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_0500
     * @tc.name decimalSqrtTest005
     * @tc.desc Negative and NaN inputs produce NaN result (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSqrtTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. sqrt(-16) isNaN and input toString '-16'
      let d1: Decimal = new Decimal(-16);
      let r1: Decimal = d1.sqrt();
      let act1: boolean = r1.isNaN();
      expect(act1).assertTrue();
      let act1B: string = d1.toString();
      let exp1B: string = '-16';
      expect(act1B).assertEqual(exp1B);

      // 2. sqrt(-4) isNaN
      let d2: Decimal = new Decimal(-4);
      let r2: Decimal = d2.sqrt();
      let act2: boolean = r2.isNaN();
      expect(act2).assertTrue();

      // 3. sqrt(-0.01) isNaN
      let d3: Decimal = new Decimal(-0.01);
      let act3: boolean = d3.sqrt().isNaN();
      expect(act3).assertTrue();

      // 4. sqrt('-123456789012345678901234567890') isNaN
      let d4: Decimal = new Decimal('-123456789012345678901234567890');
      let act4: boolean = d4.sqrt().isNaN();
      expect(act4).assertTrue();

      // 5. sqrt(-Infinity) isNaN
      let d5: Decimal = new Decimal(-Number.POSITIVE_INFINITY);
      let act5: boolean = d5.sqrt().isNaN();
      expect(act5).assertTrue();

      // 6. sqrt('-Infinity') isNaN
      let d6: Decimal = new Decimal('-Infinity');
      let act6: boolean = d6.sqrt().isNaN();
      expect(act6).assertTrue();

      // 7. Decimal.sqrt('-9') isNaN
      let act7: boolean = Decimal.sqrt('-9').isNaN();
      expect(act7).assertTrue();

      // 8. sqrt(NaN) isNaN and not isFinite
      let nanInput: Decimal = new Decimal(Number.NaN);
      let r8: Decimal = nanInput.sqrt();
      let act8: boolean = r8.isNaN();
      expect(act8).assertTrue();
      let act8B: boolean = r8.isFinite();
      expect(act8B).assertFalse();

      // 9. sqrt('NaN') isNaN
      let d9: Decimal = new Decimal('NaN');
      let act9: boolean = d9.sqrt().isNaN();
      expect(act9).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_0600
     * @tc.name decimalSqrtTest006
     * @tc.desc Infinity and extreme finite value handling (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSqrtTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. sqrt(Infinity) isFinite false
      let d1: Decimal = new Decimal(Number.POSITIVE_INFINITY);
      let act1: boolean = d1.sqrt().isFinite();
      expect(act1).assertFalse();

      // 2. sqrt(Infinity) toString 'Infinity'
      let d2: Decimal = new Decimal(Number.POSITIVE_INFINITY);
      let act2: string = d2.sqrt().toString();
      let exp2: string = 'Infinity';
      expect(act2).assertEqual(exp2);

      // 3. sqrt('Infinity') toString 'Infinity' and not isNegative
      let d3: Decimal = new Decimal('Infinity');
      let r3: Decimal = d3.sqrt();
      let act3: string = r3.toString();
      let exp3: string = 'Infinity';
      expect(act3).assertEqual(exp3);
      let act3B: boolean = r3.isNegative();
      expect(act3B).assertFalse();

      // 4. sqrt(1.7976931348623157e308) isFinite and isPositive
      let d4: Decimal = new Decimal(1.7976931348623157e308);
      let r4: Decimal = d4.sqrt();
      let act4: boolean = r4.isFinite();
      expect(act4).assertTrue();
      let act4B: boolean = r4.isPositive();
      expect(act4B).assertTrue();

      // 5. sqrt(5e-324) e -162 and isPositive
      let d5: Decimal = new Decimal(5e-324);
      let r5: Decimal = d5.sqrt();
      let act5: number = r5.e;
      let exp5: int = -162;
      expect(act5).assertEqual(exp5);
      let act5B: boolean = r5.isPositive();
      expect(act5B).assertTrue();

      // 6. Decimal.sqrt(1.7976931348623157e308) e 154 and s 1
      let r6: Decimal = Decimal.sqrt(1.7976931348623157e308);
      let act6: number = r6.e;
      let exp6: int = 154;
      expect(act6).assertEqual(exp6);
      let act6B: number = r6.s;
      let exp6B: int = 1;
      expect(act6B).assertEqual(exp6B);

      // 7. Decimal.sqrt(1.7976931348623157e308) isNaN false
      let act7: boolean = Decimal.sqrt(1.7976931348623157e308).isNaN();
      expect(act7).assertFalse();

      // 8. sqrt('1e-4001') e -2001 and isFinite
      let tinyPositiveInput: Decimal = new Decimal('1e-4001');
      let r8: Decimal = tinyPositiveInput.sqrt();
      let act8: number = r8.e;
      let exp8: int = -2001;
      expect(act8).assertEqual(exp8);
      let act8B: boolean = r8.isFinite();
      expect(act8B).assertTrue();

      // 9. sqrt('1e-9') e -5 and isPositive
      let d9: Decimal = new Decimal('1e-9');
      let r9: Decimal = d9.sqrt();
      let act9: number = r9.e;
      let exp9: int = -5;
      expect(act9).assertEqual(exp9);
      let act9B: boolean = r9.isPositive();
      expect(act9B).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_0700
     * @tc.name decimalSqrtTest007
     * @tc.desc Invalid and special-form string input handling (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSqrtTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. Decimal.sqrt('   ') throws 401
      try {
        Decimal.sqrt('   ');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(401);
      }

      // 2. Decimal.sqrt('-') throws 401
      try {
        Decimal.sqrt('-');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(401);
      }

      // 3. Decimal.sqrt('.') throws 401
      try {
        Decimal.sqrt('.');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(401);
      }

      // 4. Decimal.sqrt('0x10') equals '4'
      let res4: Decimal = Decimal.sqrt('0x10');
      let act4: string = res4.toString();
      let exp4: string = '4';
      expect(act4).assertEqual(exp4);

      // 5. Decimal.sqrt('0b101') equals '2.2360679774997896964'
      let res5: Decimal = Decimal.sqrt('0b101');
      let act5: string = res5.toString();
      let exp5: string = '2.2360679774997896964';
      expect(act5).assertEqual(exp5);

      // 6. Decimal.sqrt('中文') throws 401
      try {
        Decimal.sqrt('中文');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(401);
      }

      // 7. Decimal.sqrt('😀') throws 401
      try {
        Decimal.sqrt('😀');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(401);
      }

      // 8. Decimal.sqrt zero-width-space + '123' throws 401
      try {
        Decimal.sqrt('\u200B123');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(401);
      }

      // 9. Decimal.sqrt('<script>alert(1)</script>') throws 401
      try {
        Decimal.sqrt('<script>alert(1)</script>');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(401);
      }

      // 10. Decimal.sqrt('12a') throws 401
      try {
        Decimal.sqrt('12a');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_0800
     * @tc.name decimalSqrtTest008
     * @tc.desc Precision configuration and rounding modes (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSqrtTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. precision 5 sqrt('123456789') equals '11111'
      Decimal.set({ precision: 5 });
      let d1: Decimal = new Decimal('123456789');
      let act1: string = d1.sqrt().toString();
      let exp1: string = '11111';
      expect(act1).assertEqual(exp1);
      Decimal.set({ defaults: true });

      // 2. sqrt(2) d length 4 at default precision
      let d2: Decimal = new Decimal(2);
      let r2: Decimal = d2.sqrt();
      let act2: int = r2.d!.length;
      let exp2: int = 4;
      expect(act2).assertEqual(exp2);

      // 3. sqrt(2) toString at precisions 10, 5, 1
      let prec3: int[] = [10, 5, 1];
      let exp3: string[] = ['1.414213562', '1.4142', '1'];
      for (let index3: int = 0; index3 < prec3.length; index3++) {
        Decimal.set({ precision: prec3[index3] });
        let d3: Decimal = new Decimal(2);
        let act3: string = d3.sqrt().toString();
        expect(act3).assertEqual(exp3[index3]);
        Decimal.set({ defaults: true });
      }

      // 4. sqrt(2) d length at precisions 30, 100
      let prec4: int[] = [30, 100];
      let exp4: int[] = [6, 16];
      for (let index4: int = 0; index4 < prec4.length; index4++) {
        Decimal.set({ precision: prec4[index4] });
        let d4: Decimal = new Decimal(2);
        let act4: int = d4.sqrt().d!.length;
        expect(act4).assertEqual(exp4[index4]);
        Decimal.set({ defaults: true });
      }

      // 5. precision 3 ROUND_UP sqrt(2) equals '1.42'
      Decimal.set({ precision: 3, rounding: 0 });
      let d5: Decimal = new Decimal(2);
      let act5: string = d5.sqrt().toString();
      let exp5: string = '1.42';
      expect(act5).assertEqual(exp5);
      Decimal.set({ defaults: true });

      // 6. precision 3 ROUND_DOWN sqrt(2) equals '1.41'
      Decimal.set({ precision: 3, rounding: 1 });
      let d6: Decimal = new Decimal(2);
      let act6: string = d6.sqrt().toString();
      let exp6: string = '1.41';
      expect(act6).assertEqual(exp6);
      Decimal.set({ defaults: true });

      // 7. precision 3 ROUND_HALF_UP sqrt(2) equals '1.41'
      Decimal.set({ precision: 3, rounding: Decimal.ROUND_HALF_UP });
      let d7: Decimal = new Decimal(2);
      let act7: string = d7.sqrt().toString();
      let exp7: string = '1.41';
      expect(act7).assertEqual(exp7);
      Decimal.set({ defaults: true });

      // 8. precision 5 sqrt(0.5) equals '0.70711'
      Decimal.set({ precision: 5 });
      let fractionalInput: Decimal = new Decimal(0.5);
      let act8: string = fractionalInput.sqrt().toString();
      let exp8: string = '0.70711';
      expect(act8).assertEqual(exp8);
      Decimal.set({ defaults: true });

      // 9. precision 3 sqrt(2).mul(sqrt(2)) equals '1.99'
      Decimal.set({ precision: 3 });
      let d9: Decimal = new Decimal(2);
      let r9: Decimal = d9.sqrt().mul(d9.sqrt());
      let act9: string = r9.toString();
      let exp9: string = '1.99';
      expect(act9).assertEqual(exp9);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_0900
     * @tc.name decimalSqrtTest009
     * @tc.desc Rounding continuation, float arithmetic and internal digit structure (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSqrtTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. precision 5 ROUND_DOWN sqrt(0.5) equals '0.7071'
      Decimal.set({ precision: 5, rounding: 1 });
      let d1: Decimal = new Decimal(0.5);
      let act1: string = d1.sqrt().toString();
      let exp1: string = '0.7071';
      expect(act1).assertEqual(exp1);
      Decimal.set({ defaults: true });

      // 2. Decimal.sqrt(0.1 + 0.2) equals '0.54772255750516614997'
      let act2: string = Decimal.sqrt(0.1 + 0.2).toString();
      let exp2: string = '0.54772255750516614997';
      expect(act2).assertEqual(exp2);

      // 3. precision 10 Decimal.sqrt(2) d length 3
      Decimal.set({ precision: 10 });
      let r3: Decimal = Decimal.sqrt(2);
      Decimal.set({ defaults: true });
      let act3: int = r3.d!.length;
      let exp3: int = 3;
      expect(act3).assertEqual(exp3);

      // 4. sqrt(4) d[0] equals 2
      let d4: Decimal = new Decimal(4);
      let r4: Decimal = d4.sqrt();
      let act4: number = r4.d![0];
      let exp4: int = 2;
      expect(act4).assertEqual(exp4);

      // 5. sqrt(49) s equals 1
      let d5: Decimal = new Decimal(49);
      let r5: Decimal = d5.sqrt();
      let act5: number = r5.s;
      let exp5: int = 1;
      expect(act5).assertEqual(exp5);

      // 6. Decimal.sqrt(144) s equals 1
      let act6: number = Decimal.sqrt(144).s;
      let exp6: int = 1;
      expect(act6).assertEqual(exp6);

      // 7. Decimal.sqrt(2) d[0] equals 1
      let act7: number = Decimal.sqrt(2).d![0];
      let exp7: int = 1;
      expect(act7).assertEqual(exp7);

      // 8. Decimal.sqrt(144) d length 1 and d[0] 12
      let digits8: Array<double> = Decimal.sqrt(144).d!;
      let obs8: int = digits8.length;
      let exp8: int = 1;
      expect(obs8).assertEqual(exp8);
      let act8: number = digits8[0];
      let exp8B: int = 12;
      expect(act8).assertEqual(exp8B);

      // 9. Decimal.sqrt(0.25) d length 1
      let act9: int = Decimal.sqrt(0.25).d!.length;
      let exp9: int = 1;
      expect(act9).assertEqual(exp9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_1000
     * @tc.name decimalSqrtTest010
     * @tc.desc Exponent extremes, magnitude and instance equivalence (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSqrtTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. sqrt('1e-2000') e -1000 and toString '1e-1000'
      let d1: Decimal = new Decimal('1e-2000');
      let r1: Decimal = d1.sqrt();
      let act1: number = r1.e;
      let exp1: int = -1000;
      expect(act1).assertEqual(exp1);
      let act1B: string = r1.toString();
      let exp1B: string = '1e-1000';
      expect(act1B).assertEqual(exp1B);

      // 2. sqrt('1e400') e 200 and toString '1e+200'
      let d2: Decimal = new Decimal('1e400');
      let r2: Decimal = d2.sqrt();
      let act2: number = r2.e;
      let exp2: int = 200;
      expect(act2).assertEqual(exp2);
      let act2B: string = r2.toString();
      let exp2B: string = '1e+200';
      expect(act2B).assertEqual(exp2B);

      // 3. sqrt('1e9') e 4 and d length 3
      let d3: Decimal = new Decimal('1e9');
      let r3: Decimal = d3.sqrt();
      let act3: number = r3.e;
      let exp3: int = 4;
      expect(act3).assertEqual(exp3);
      let act3B: int = r3.d!.length;
      let exp3B: int = 3;
      expect(act3B).assertEqual(exp3B);

      // 4. Decimal.sqrt(1e100) comparedTo '1e50' equals 0
      let act4: number = Decimal.sqrt(1e100).comparedTo(new Decimal('1e50'));
      let exp4: int = 0;
      expect(act4).assertEqual(exp4);

      // 5. Decimal.sqrt(10000).e > 0
      let act5: boolean = Decimal.sqrt(10000).e > 0;
      expect(act5).assertTrue();

      // 6. Decimal.sqrt(0.0001).e < 0
      let act6: boolean = Decimal.sqrt(0.0001).e < 0;
      expect(act6).assertTrue();

      // 7. Decimal.sqrt(2).e >= 0
      let act7: boolean = Decimal.sqrt(2).e >= 0;
      expect(act7).assertTrue();

      // 8. Decimal.sqrt huge '1' + 1000 zeros equals '1e+5000'
      let s8: string = '1' + '0000000000'.repeat(1000);
      let r8: Decimal = Decimal.sqrt(s8);
      let act8: string = r8.toString();
      let exp8: string = '1e+5000';
      expect(act8).assertEqual(exp8);

      // 9. Decimal.sqrt(2) comparedTo new Decimal(2).sqrt() equals 0
      let act9: number = Decimal.sqrt(2).comparedTo(new Decimal(2).sqrt());
      let exp9: int = 0;
      expect(act9).assertEqual(exp9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SQRT_1100
     * @tc.name decimalSqrtTest011
     * @tc.desc Immutability and input-type equivalence (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSqrtTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. Decimal.sqrt(d) does not mutate input - toString '144'
      let d1: Decimal = new Decimal(144);
      Decimal.sqrt(d1);
      let act1: string = d1.toString();
      let exp1: string = '144';
      expect(act1).assertEqual(exp1);

      // 2. Decimal.sqrt(d) does not mutate input - toNumber 144
      let d2: Decimal = new Decimal(144);
      Decimal.sqrt(d2);
      let act2: number = d2.toNumber();
      let exp2: int = 144;
      expect(act2).assertEqual(exp2);

      // 3. Decimal.sqrt(d) does not mutate input - equals Decimal(144)
      let d3: Decimal = new Decimal(144);
      Decimal.sqrt(d3);
      let act3: boolean = d3.equals(new Decimal(144));
      expect(act3).assertTrue();

      // 4. Decimal.sqrt(d) does not mutate input - full snapshot unchanged
      let d4: Decimal = new Decimal(144);
      let originalValueSnapshot4: string = d4.toString();
      let expectedOriginalValue4: string = '144';
      expect(originalValueSnapshot4).assertEqual(expectedOriginalValue4);
      let originalDigitsSnapshot4: Array<double> = d4.d!.slice(0);
      let originalLengthSnapshot4: int = originalDigitsSnapshot4.length;
      let originalSignSnapshot4: double = d4.s;
      let originalExponentSnapshot4: double = d4.e;
      Decimal.sqrt(d4);
      let actualValue4: int = d4.d!.length;
      let expectedValue4: int = 1;
      expect(actualValue4).assertEqual(expectedValue4);
      let actualOriginalValue4: string = d4.toString();
      expect(actualOriginalValue4).assertEqual(expectedOriginalValue4);
      let actualOriginalDigits4: Array<double> = d4.d!;
      let actualOriginalLength4: int = actualOriginalDigits4.length;
      expect(actualOriginalLength4).assertEqual(originalLengthSnapshot4);
      for (let coefficientIndex4: int = 0; coefficientIndex4 < originalLengthSnapshot4; coefficientIndex4++) {
        let actualCoefficient4: double = actualOriginalDigits4[coefficientIndex4];
        let expectedCoefficient4: double = originalDigitsSnapshot4[coefficientIndex4];
        expect(actualCoefficient4).assertEqual(expectedCoefficient4);
      }
      let actualOriginalSign4: double = d4.s;
      expect(actualOriginalSign4).assertEqual(originalSignSnapshot4);
      let actualOriginalExponent4: double = d4.e;
      expect(actualOriginalExponent4).assertEqual(originalExponentSnapshot4);

      // 5. Decimal.sqrt(9) equals new Decimal(9).sqrt()
      let act5: string = Decimal.sqrt(9).toString();
      let exp5: string = new Decimal(9).sqrt().toString();
      expect(act5).assertEqual(exp5);

      // 6. Decimal.sqrt('2') equals new Decimal('2').sqrt()
      let act6: string = Decimal.sqrt('2').toString();
      let exp6: string = new Decimal('2').sqrt().toString();
      expect(act6).assertEqual(exp6);

      // 7. Decimal.sqrt(new Decimal(5)) equals src.sqrt()
      let src7: Decimal = new Decimal(5);
      let act7: string = Decimal.sqrt(src7).toString();
      let exp7: string = src7.sqrt().toString();
      expect(act7).assertEqual(exp7);

      // 8. Decimal.sqrt('2') comparedTo Decimal.sqrt(2) equals 0
      let act8: number = Decimal.sqrt('2').comparedTo(Decimal.sqrt(2));
      let exp8: int = 0;
      expect(act8).assertEqual(exp8);

      // 9. Decimal.sqrt(new Decimal(0.5)) comparedTo Decimal.sqrt('0.5') equals 0
      let d9: Decimal = new Decimal(0.5);
      let act9: number = Decimal.sqrt(d9).comparedTo(Decimal.sqrt('0.5'));
      let exp9: int = 0;
      expect(act9).assertEqual(exp9);
    });
  });
}
