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

export default function decimalSubTest(): void {
  describe('DecimalSubTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      Decimal.set({ defaults: true });
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SUB_0100
     * @tc.name decimalSubTest001
     * @tc.desc Instance sub basic operands (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSubTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. new Decimal('50').sub('9') equals '41'
      let d1: Decimal = new Decimal('50').sub('9');
      let av1: string = d1.toString();
      let ev1: string = '41';
      expect(av1).assertEqual(ev1);

      // 2. new Decimal('0.1').sub('0.3') equals '-0.2'
      let d2: Decimal = new Decimal('0.1').sub('0.3');
      let av2: string = d2.toString();
      let ev2: string = '-0.2';
      expect(av2).assertEqual(ev2);

      // 3. new Decimal('-1.5').sub('0.5') equals '-2'
      let d3: Decimal = new Decimal('-1.5').sub('0.5');
      let av3: string = d3.toString();
      let ev3: string = '-2';
      expect(av3).assertEqual(ev3);

      // 4. new Decimal('1').sub('-1') equals '2'
      let d4: Decimal = new Decimal('1').sub('-1');
      let av4: string = d4.toString();
      let ev4: string = '2';
      expect(av4).assertEqual(ev4);

      // 5. new Decimal(5).sub(3) equals '2'
      let d5: Decimal = new Decimal(5).sub(3);
      let av5: string = d5.toString();
      let ev5: string = '2';
      expect(av5).assertEqual(ev5);

      // 6. new Decimal('1').sub(2.5) equals '-1.5'
      let d6: Decimal = new Decimal('1').sub(2.5);
      let av6: string = d6.toString();
      let ev6: string = '-1.5';
      expect(av6).assertEqual(ev6);

      // 7. self subtraction d.sub(d) equals '0'
      let s7: Decimal = new Decimal('7');
      let r7: Decimal = s7.sub(s7);
      let av7: string = r7.toString();
      let ev7: string = '0';
      expect(av7).assertEqual(ev7);

      // 8. new Decimal('5').sub(Decimal('-3')) equals '8'
      let m8: Decimal = new Decimal('-3');
      let difference: Decimal = new Decimal('5').sub(m8);
      let actualNegativeOperandDifference: string = difference.toString();
      let expectedNegativeOperandDifference: string = '8';
      expect(actualNegativeOperandDifference).assertEqual(expectedNegativeOperandDifference);

      // 9. new Decimal(5).sub(-3) equals '8'
      let d9: Decimal = new Decimal(5).sub(-3);
      let av9: string = d9.toString();
      let ev9: string = '8';
      expect(av9).assertEqual(ev9);

      // 10. new Decimal(10).sub(4) toNumber equals 6
      let r10: Decimal = new Decimal(10).sub(4);
      let av10: number = r10.toNumber();
      let ev10: int = 6;
      expect(av10).assertEqual(ev10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SUB_0200
     * @tc.name decimalSubTest002
     * @tc.desc Special string formats hex/binary/scientific/prefix (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSubTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. new Decimal('0x10').sub('5') equals '11'
      let d1: Decimal = new Decimal('0x10').sub('5');
      let av1: string = d1.toString();
      let ev1: string = '11';
      expect(av1).assertEqual(ev1);

      // 2. new Decimal('0b101').sub('2') equals '3'
      let d2: Decimal = new Decimal('0b101').sub('2');
      let av2: string = d2.toString();
      let ev2: string = '3';
      expect(av2).assertEqual(ev2);

      // 3. new Decimal(1000).sub('1e2') equals '900'
      let d3: Decimal = new Decimal(1000).sub('1e2');
      let av3: string = d3.toString();
      let ev3: string = '900';
      expect(av3).assertEqual(ev3);

      // 4. Decimal.sub('+5', 1) equals '4'
      let r4: Decimal = Decimal.sub('+5', 1);
      let av4: string = r4.toString();
      let ev4: string = '4';
      expect(av4).assertEqual(ev4);

      // 5. Decimal.sub('-5', 1) equals '-6'
      let r5: Decimal = Decimal.sub('-5', 1);
      let av5: string = r5.toString();
      let ev5: string = '-6';
      expect(av5).assertEqual(ev5);

      // 6. Decimal.sub('0.05', 1) equals '-0.95'
      let r6: Decimal = Decimal.sub('0.05', 1);
      let av6: string = r6.toString();
      let ev6: string = '-0.95';
      expect(av6).assertEqual(ev6);

      // 7. Decimal.sub(1, '+5') equals '-4'
      let r7: Decimal = Decimal.sub(1, '+5');
      let av7: string = r7.toString();
      let ev7: string = '-4';
      expect(av7).assertEqual(ev7);

      // 8. Decimal.sub(1, '-5') equals '6'
      let r8: Decimal = Decimal.sub(1, '-5');
      let actualStringOperandDifference: string = r8.toString();
      let expectedStringOperandDifference: string = '6';
      expect(actualStringOperandDifference).assertEqual(expectedStringOperandDifference);

      // 9. Decimal.sub(1, '0.5') equals '0.5'
      let r9: Decimal = Decimal.sub(1, '0.5');
      let av9: string = r9.toString();
      let ev9: string = '0.5';
      expect(av9).assertEqual(ev9);

      // 10. Decimal.sub(1, '0x10') equals '-15'
      let r10: Decimal = Decimal.sub(1, '0x10');
      let av10: string = r10.toString();
      let ev10: string = '-15';
      expect(av10).assertEqual(ev10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SUB_0300
     * @tc.name decimalSubTest003
     * @tc.desc Instance sub NaN and Infinity handling (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSubTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. new Decimal('5').sub('NaN') equals 'NaN'
      let d1: Decimal = new Decimal('5').sub('NaN');
      let av1: string = d1.toString();
      let ev1: string = 'NaN';
      expect(av1).assertEqual(ev1);

      // 2. new Decimal('5').sub('Infinity') equals '-Infinity'
      let d2: Decimal = new Decimal('5').sub('Infinity');
      let av2: string = d2.toString();
      let ev2: string = '-Infinity';
      expect(av2).assertEqual(ev2);

      // 3. new Decimal('5').sub('-Infinity') equals 'Infinity'
      let d3: Decimal = new Decimal('5').sub('-Infinity');
      let av3: string = d3.toString();
      let ev3: string = 'Infinity';
      expect(av3).assertEqual(ev3);

      // 4. new Decimal('Infinity').sub('Infinity') equals 'NaN'
      let d4: Decimal = new Decimal('Infinity').sub('Infinity');
      let av4: string = d4.toString();
      let ev4: string = 'NaN';
      expect(av4).assertEqual(ev4);

      // 5. new Decimal(5).sub(Number.NaN) isNaN true
      let r5: Decimal = new Decimal(5).sub(Number.NaN);
      let av5: boolean = r5.isNaN();
      expect(av5).assertTrue();

      // 6. new Decimal(Number.NaN).sub(5) isNaN true
      let r6: Decimal = new Decimal(Number.NaN).sub(5);
      let av6: boolean = r6.isNaN();
      expect(av6).assertTrue();

      // 7. new Decimal(5).sub(Number.POSITIVE_INFINITY) equals '-Infinity'
      let r7: Decimal = new Decimal(5).sub(Number.POSITIVE_INFINITY);
      let av7: string = r7.toString();
      let ev7: string = '-Infinity';
      expect(av7).assertEqual(ev7);

      // 8. new Decimal(5).sub(-Number.POSITIVE_INFINITY) equals 'Infinity'
      let r8: Decimal = new Decimal(5).sub(-Number.POSITIVE_INFINITY);
      let actualInfiniteDifference: string = r8.toString();
      let expectedInfiniteDifference: string = 'Infinity';
      expect(actualInfiniteDifference).assertEqual(expectedInfiniteDifference);

      // 9. new Decimal(Number.POSITIVE_INFINITY).sub(5) equals 'Infinity'
      let r9: Decimal = new Decimal(Number.POSITIVE_INFINITY).sub(5);
      let av9: string = r9.toString();
      let ev9: string = 'Infinity';
      expect(av9).assertEqual(ev9);

      // 10. new Decimal(POSITIVE_INFINITY).sub(POSITIVE_INFINITY) isNaN true
      let r10: Decimal = new Decimal(Number.POSITIVE_INFINITY).sub(Number.POSITIVE_INFINITY);
      let av10: boolean = r10.isNaN();
      expect(av10).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SUB_0400
     * @tc.name decimalSubTest004
     * @tc.desc Static sub NaN and Infinity handling (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSubTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. Decimal.sub('NaN', 1) isNaN true
      let r1: Decimal = Decimal.sub('NaN', 1);
      let av1: boolean = r1.isNaN();
      expect(av1).assertTrue();

      // 2. Decimal.sub('Infinity', 1) equals 'Infinity'
      let r2: Decimal = Decimal.sub('Infinity', 1);
      let av2: string = r2.toString();
      let ev2: string = 'Infinity';
      expect(av2).assertEqual(ev2);

      // 3. Decimal.sub('-Infinity', 1) equals '-Infinity'
      let r3: Decimal = Decimal.sub('-Infinity', 1);
      let av3: string = r3.toString();
      let ev3: string = '-Infinity';
      expect(av3).assertEqual(ev3);

      // 4. Decimal.sub(1, 'NaN') isNaN true
      let r4: Decimal = Decimal.sub(1, 'NaN');
      let av4: boolean = r4.isNaN();
      expect(av4).assertTrue();

      // 5. Decimal.sub(1, 'Infinity') equals '-Infinity'
      let r5: Decimal = Decimal.sub(1, 'Infinity');
      let av5: string = r5.toString();
      let ev5: string = '-Infinity';
      expect(av5).assertEqual(ev5);

      // 6. Decimal.sub(1, '-Infinity') equals 'Infinity'
      let r6: Decimal = Decimal.sub(1, '-Infinity');
      let av6: string = r6.toString();
      let ev6: string = 'Infinity';
      expect(av6).assertEqual(ev6);

      // 7. Decimal.sub(NaN,1) and new Decimal(NaN).sub(1) both isNaN
      let a7: Decimal = Decimal.sub(Number.NaN, 1);
      let b7: Decimal = new Decimal(Number.NaN).sub(1);
      let av7a: boolean = a7.isNaN();
      expect(av7a).assertTrue();
      let av7b: boolean = b7.isNaN();
      expect(av7b).assertTrue();

      // 8. Decimal.sub(-Infinity,1) equals new Decimal(-Infinity).sub(1)
      let staticInfiniteDifference: string = Decimal.sub(-Number.POSITIVE_INFINITY, 1).toString();
      let instanceInfiniteDifference: string = new Decimal(-Number.POSITIVE_INFINITY).sub(1).toString();
      expect(staticInfiniteDifference).assertEqual(instanceInfiniteDifference);

      // 9. Decimal.sub(Infinity, -Infinity) equals 'Infinity'
      let r9: Decimal = Decimal.sub(Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY);
      let av9: string = r9.toString();
      let ev9: string = 'Infinity';
      expect(av9).assertEqual(ev9);

      // 10. Decimal.sub(-Infinity, Infinity) equals '-Infinity'
      let r10: Decimal = Decimal.sub(-Number.POSITIVE_INFINITY, Number.POSITIVE_INFINITY);
      let av10: string = r10.toString();
      let ev10: string = '-Infinity';
      expect(av10).assertEqual(ev10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SUB_0500
     * @tc.name decimalSubTest005
     * @tc.desc Invalid input throws error 401 (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSubTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. new Decimal('5').sub('<script>alert(1)</script>') throws 401
      try {
        new Decimal('5').sub('<script>alert(1)</script>');
        expect().assertFail();
      } catch (e1) {
        expect(e1.code).assertEqual(401);
      }

      // 2. new Decimal('5').sub(zero-width space) throws 401
      try {
        new Decimal('5').sub('​');
        expect().assertFail();
      } catch (e2) {
        expect(e2.code).assertEqual(401);
      }

      // 3. new Decimal('5').sub('😀') throws 401
      try {
        new Decimal('5').sub('😀');
        expect().assertFail();
      } catch (e3) {
        expect(e3.code).assertEqual(401);
      }

      // 4. new Decimal('5').sub('中') throws 401
      try {
        new Decimal('5').sub('中');
        expect().assertFail();
      } catch (e4) {
        expect(e4.code).assertEqual(401);
      }

      // 5. Decimal.sub(spaces, 1) throws 401
      let ws5: string = ' ';
      let sp5: string = ws5 + ws5 + ws5;
      try {
        Decimal.sub(sp5, 1);
        expect().assertFail();
      } catch (e5) {
        expect(e5.code).assertEqual(401);
      }

      // 6. Decimal.sub(1, '中文') throws 401
      try {
        Decimal.sub(1, '中文');
        expect().assertFail();
      } catch (e6) {
        expect(e6.code).assertEqual(401);
      }

      // 7. Decimal.sub(1, '😀') throws 401
      try {
        Decimal.sub(1, '😀');
        expect().assertFail();
      } catch (e7) {
        expect(e7.code).assertEqual(401);
      }

      // 8. Decimal.sub(zero-width '123', 1) throws 401
      try {
        Decimal.sub('​123', 1);
        expect().assertFail();
      } catch (e8) {
        expect(e8.code).assertEqual(401);
      }

      // 9. Decimal.sub(1, '<script>alert(1)</script>') throws 401
      try {
        Decimal.sub(1, '<script>alert(1)</script>');
        expect().assertFail();
      } catch (e9) {
        expect(e9.code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SUB_0600
     * @tc.name decimalSubTest006
     * @tc.desc Double precision and extreme values (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSubTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. new Decimal(0.1).sub(0.2) equals '-0.1'
      let d1: Decimal = new Decimal(0.1).sub(0.2);
      let av1: string = d1.toString();
      let ev1: string = '-0.1';
      expect(av1).assertEqual(ev1);

      // 2. long repeat 10000 minus itself equals '0'
      let lv2: string = '9'.repeat(10000);
      let d2: Decimal = new Decimal(lv2).sub(lv2);
      let av2: string = d2.toString();
      let ev2: string = '0';
      expect(av2).assertEqual(ev2);

      // 3. tiny decimals comparedTo '9e-23' equals 0
      let d3: Decimal = new Decimal('0.0000000000000000000001').sub('0.00000000000000000000001');
      let av3: number = d3.comparedTo('9e-23');
      let ev3: int = 0;
      expect(av3).assertEqual(ev3);

      // 4. new Decimal(0.3).sub(0.1) comparedTo 0.2 equals 0
      let r4: Decimal = new Decimal(0.3).sub(0.1);
      let av4: number = r4.comparedTo(0.2);
      let ev4: int = 0;
      expect(av4).assertEqual(ev4);

      // 5. string '0.1' vs double 0.1 produce same toString
      let a5: Decimal = new Decimal(0.3).sub('0.1');
      let b5: Decimal = new Decimal(0.3).sub(0.1);
      let av5: string = a5.toString();
      let ev5: string = b5.toString();
      expect(av5).assertEqual(ev5);

      // 6. Decimal.sub(0.5, 1) equals '-0.5'
      let r6: Decimal = Decimal.sub(0.5, 1);
      let av6: string = r6.toString();
      let ev6: string = '-0.5';
      expect(av6).assertEqual(ev6);

      // 7. Decimal.sub(MAX_VALUE, 1) e equals 308 and s equals 1
      let r7: Decimal = Decimal.sub(1.7976931348623157e308, 1);
      let av7a: number = r7.e;
      let ev7a: int = 308;
      expect(av7a).assertEqual(ev7a);
      let av7b: number = r7.s;
      let ev7b: int = 1;
      expect(av7b).assertEqual(ev7b);

      // 8. Decimal.sub(0.1+0.2, 0.3) equals '4e-17'
      let r8: Decimal = Decimal.sub(0.1 + 0.2, 0.3);
      let actualFloatingPointResidual: string = r8.toString();
      let expectedFloatingPointResidual: string = '4e-17';
      expect(actualFloatingPointResidual).assertEqual(expectedFloatingPointResidual);

      // 9. Decimal.sub(1, MAX_VALUE) e equals 308 and s equals -1
      let r9: Decimal = Decimal.sub(1, 1.7976931348623157e308);
      let av9a: number = r9.e;
      let ev9a: int = 308;
      expect(av9a).assertEqual(ev9a);
      let av9b: number = r9.s;
      let ev9b: int = -1;
      expect(av9b).assertEqual(ev9b);

      // 10. Decimal.sub('2e-28', '1e-28') e equals -28 and toString equals '1e-28'
      let r10: Decimal = Decimal.sub('2e-28', '1e-28');
      let av10a: number = r10.e;
      let ev10a: int = -28;
      expect(av10a).assertEqual(ev10a);
      let av10b: string = r10.toString();
      let ev10b: string = '1e-28';
      expect(av10b).assertEqual(ev10b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SUB_0700
     * @tc.name decimalSubTest007
     * @tc.desc Operand type equivalence and static vs instance (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSubTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. new Decimal(5).sub(3) vs new Decimal(5).sub(new Decimal(3)) comparedTo equals 0
      let a1: Decimal = new Decimal(5).sub(3);
      let b1: Decimal = new Decimal(5).sub(new Decimal(3));
      let av1: number = a1.comparedTo(b1);
      let ev1: int = 0;
      expect(av1).assertEqual(ev1);

      // 2. Decimal.sub(new Decimal(7), new Decimal(2)) equals '5'
      let r2: Decimal = Decimal.sub(new Decimal(7), new Decimal(2));
      let av2: string = r2.toString();
      let ev2: string = '5';
      expect(av2).assertEqual(ev2);

      // 3. Decimal.sub('7', new Decimal(2)) equals '5'
      let r3: Decimal = Decimal.sub('7', new Decimal(2));
      let av3: string = r3.toString();
      let ev3: string = '5';
      expect(av3).assertEqual(ev3);

      // 4. Decimal.sub(new Decimal(7), '2') equals '5'
      let r4: Decimal = Decimal.sub(new Decimal(7), '2');
      let av4: string = r4.toString();
      let ev4: string = '5';
      expect(av4).assertEqual(ev4);

      // 5. Decimal.sub(7, new Decimal(2)) equals '5'
      let r5: Decimal = Decimal.sub(7, new Decimal(2));
      let av5: string = r5.toString();
      let ev5: string = '5';
      expect(av5).assertEqual(ev5);

      // 6. Decimal.sub(new Decimal(7), 2) equals '5'
      let r6: Decimal = Decimal.sub(new Decimal(7), 2);
      let av6: string = r6.toString();
      let ev6: string = '5';
      expect(av6).assertEqual(ev6);

      // 7. Decimal.sub(3,1).toString() equals new Decimal(3).sub(1).toString()
      let av7: string = Decimal.sub(3, 1).toString();
      let ev7: string = new Decimal(3).sub(1).toString();
      expect(av7).assertEqual(ev7);

      // 8. Decimal.sub(src,2).toString() equals src.sub(2).toString()
      let src8: Decimal = new Decimal('-4.5');
      let staticDifferenceText: string = Decimal.sub(src8, 2).toString();
      let instanceDifferenceText: string = src8.sub(2).toString();
      expect(staticDifferenceText).assertEqual(instanceDifferenceText);

      // 9. Decimal.sub('5',2) vs Decimal.sub(5,2) comparedTo equals 0
      let a9: Decimal = Decimal.sub('5', 2);
      let b9: Decimal = Decimal.sub(5, 2);
      let av9: number = a9.comparedTo(b9);
      let ev9: int = 0;
      expect(av9).assertEqual(ev9);

      // 10. Decimal.sub(0.3,0.1) vs new Decimal(0.3).sub(0.1) toString equal
      let a10: Decimal = Decimal.sub(0.3, 0.1);
      let b10: Decimal = new Decimal(0.3).sub(0.1);
      let av10: string = a10.toString();
      let ev10: string = b10.toString();
      expect(av10).assertEqual(ev10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SUB_0800
     * @tc.name decimalSubTest008
     * @tc.desc Sign and boolean predicate methods (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSubTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. new Decimal(1).sub(1) Decimal.sign equals 0
      let r1: Decimal = new Decimal(1).sub(1);
      let av1: number = Decimal.sign(r1);
      let ev1: int = 0;
      expect(av1).assertEqual(ev1);

      // 2. new Decimal(1).sub(5) Decimal.sign equals -1
      let r2: Decimal = new Decimal(1).sub(5);
      let av2: number = Decimal.sign(r2);
      let ev2: int = -1;
      expect(av2).assertEqual(ev2);

      // 3. new Decimal(1).sub(5) isNegative true
      let r3: Decimal = new Decimal(1).sub(5);
      let av3: boolean = r3.isNegative();
      expect(av3).assertTrue();

      // 4. new Decimal(5).sub(2) isPositive true
      let r4: Decimal = new Decimal(5).sub(2);
      let av4: boolean = r4.isPositive();
      expect(av4).assertTrue();

      // 5. new Decimal(1).sub(1) isZero true
      let r5: Decimal = new Decimal(1).sub(1);
      let av5: boolean = r5.isZero();
      expect(av5).assertTrue();

      // 6. new Decimal(5).sub(2) isInteger true
      let r6: Decimal = new Decimal(5).sub(2);
      let av6: boolean = r6.isInteger();
      expect(av6).assertTrue();

      // 7. new Decimal(5).sub(2.5) isInteger false
      let r7: Decimal = new Decimal(5).sub(2.5);
      let av7: boolean = r7.isInteger();
      expect(av7).assertFalse();

      // 8. Decimal.sub(1, 5) s equals -1
      let r8: Decimal = Decimal.sub(1, 5);
      let actualDifferenceSign: number = r8.s;
      let expectedDifferenceSign: int = -1;
      expect(actualDifferenceSign).assertEqual(expectedDifferenceSign);

      // 9. Decimal.sub(5, 5) Decimal.sign equals 0
      let r9: Decimal = Decimal.sub(5, 5);
      let av9: number = Decimal.sign(r9);
      let ev9: int = 0;
      expect(av9).assertEqual(ev9);

      // 10. Decimal.sub(5, 2) isFinite true
      let r10: Decimal = Decimal.sub(5, 2);
      let av10: boolean = r10.isFinite();
      expect(av10).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SUB_0900
     * @tc.name decimalSubTest009
     * @tc.desc Immutability sub does not mutate operands (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSubTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. d.sub(3) does not mutate d equals '5'
      let d1: Decimal = new Decimal(5);
      d1.sub(3);
      let av1: string = d1.toString();
      let ev1: string = '5';
      expect(av1).assertEqual(ev1);

      // 2. new Decimal(5).sub(b) does not mutate b equals '3'
      let b2: Decimal = new Decimal(3);
      new Decimal(5).sub(b2);
      let av2: string = b2.toString();
      let ev2: string = '3';
      expect(av2).assertEqual(ev2);

      // 3. d.sub(1).sub(1) does not mutate d equals '5'
      let d3: Decimal = new Decimal(5);
      d3.sub(1);
      d3.sub(1);
      let av3: string = d3.toString();
      let ev3: string = '5';
      expect(av3).assertEqual(ev3);

      // 4. r.sub(1) does not mutate r equals '3'
      let r4: Decimal = new Decimal(5).sub(2);
      r4.sub(1);
      let av4: string = r4.toString();
      let ev4: string = '3';
      expect(av4).assertEqual(ev4);

      // 5. d.sub(1).sub(1) chained does not mutate d equals '5'
      let d5: Decimal = new Decimal(5);
      d5.sub(1).sub(1);
      let av5: string = d5.toString();
      let ev5: string = '5';
      expect(av5).assertEqual(ev5);

      // 6. r.add(10) does not mutate operand b equals '3'
      let b6: Decimal = new Decimal(3);
      let r6: Decimal = new Decimal(5).sub(b6);
      r6.add(10);
      let av6: string = b6.toString();
      let ev6: string = '3';
      expect(av6).assertEqual(ev6);

      // 7. Decimal.sub(src,1) twice does not mutate src
      let src7: Decimal = new Decimal('-9.5');
      let r7a: Decimal = Decimal.sub(src7, 1);
      let r7b: Decimal = Decimal.sub(src7, 1);
      let av7a: string = r7a.toString();
      let ev7a: string = '-10.5';
      expect(av7a).assertEqual(ev7a);
      let av7b: string = r7b.toString();
      let ev7b: string = '-10.5';
      expect(av7b).assertEqual(ev7b);
      let av7c: string = src7.toString();
      let ev7c: string = '-9.5';
      expect(av7c).assertEqual(ev7c);

      // 8. Decimal.sub(a,b) twice does not mutate a or b
      let a8: Decimal = new Decimal(5);
      let b8: Decimal = new Decimal(1);
      Decimal.sub(a8, b8);
      Decimal.sub(a8, b8);
      let actualMinuendText: string = a8.toString();
      let expectedMinuendText: string = '5';
      expect(actualMinuendText).assertEqual(expectedMinuendText);
      let actualSubtrahendText: string = b8.toString();
      let expectedSubtrahendText: string = '1';
      expect(actualSubtrahendText).assertEqual(expectedSubtrahendText);

      // 9. Decimal.sub(a,2).sub(1) does not mutate a equals '5'
      let a9: Decimal = new Decimal(5);
      let r9: Decimal = Decimal.sub(a9, 2);
      r9.sub(1);
      let av9: string = a9.toString();
      let ev9: string = '5';
      expect(av9).assertEqual(ev9);

      // 10. Decimal.sub(Decimal.sub(a,b),b) does not mutate a or b
      let a10: Decimal = new Decimal(5);
      let b10: Decimal = new Decimal(1);
      Decimal.sub(Decimal.sub(a10, b10), b10);
      let av10a: string = a10.toString();
      let ev10a: string = '5';
      expect(av10a).assertEqual(ev10a);
      let av10b: string = b10.toString();
      let ev10b: string = '1';
      expect(av10b).assertEqual(ev10b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SUB_1000
     * @tc.name decimalSubTest010
     * @tc.desc Static basic results and zero/reference edge cases (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSubTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. new Decimal('3').sub(-0) equals '3'
      let d1: Decimal = new Decimal('3').sub(-0);
      let av1: string = d1.toString();
      let ev1: string = '3';
      expect(av1).assertEqual(ev1);

      // 2. Decimal.sub(Decimal.sub(9,4), Decimal.sub(3,1)) equals '3'
      let r2: Decimal = Decimal.sub(Decimal.sub(9, 4), Decimal.sub(3, 1));
      let av2: string = r2.toString();
      let ev2: string = '3';
      expect(av2).assertEqual(ev2);

      // 3. Decimal.sub(Decimal.sub(100,40), 30) equals '30'
      let r3: Decimal = Decimal.sub(Decimal.sub(100, 40), 30);
      let av3: string = r3.toString();
      let ev3: string = '30';
      expect(av3).assertEqual(ev3);

      // 4. Decimal.sub(long string, 0) equals '1.234567890123456789e+9999'
      let s4: string = '';
      for (let i4: int = 0; i4 < 1000; i4++) {
        s4 = s4 + (i4 >= 0 ? '1234567890' : '1234567890');
      }
      let r4: Decimal = Decimal.sub(s4, 0);
      let av4: string = r4.toString();
      let ev4: string = '1.234567890123456789e+9999';
      expect(av4).assertEqual(ev4);

      // 5. Decimal.sub(new Decimal('-0'), 1) equals '-1'
      let src5: Decimal = new Decimal('-0');
      let r5: Decimal = Decimal.sub(src5, 1);
      let av5: string = r5.toString();
      let ev5: string = '-1';
      expect(av5).assertEqual(ev5);

      // 6. Decimal.sub('123.456','123.456') equals '0'
      let r6: Decimal = Decimal.sub('123.456', '123.456');
      let av6: string = r6.toString();
      let ev6: string = '0';
      expect(av6).assertEqual(ev6);

      // 7. Decimal.sub(-2, -5) equals '3'
      let r7: Decimal = Decimal.sub(-2, -5);
      let av7: string = r7.toString();
      let ev7: string = '3';
      expect(av7).assertEqual(ev7);

      // 8. Decimal.sub(a,3) is not the same reference as a
      let a8: Decimal = new Decimal(5);
      let r8: Decimal = Decimal.sub(a8, 3);
      expect(r8).not().assertEqual(a8);

      // 9. Decimal.sub(0, -0) isZero true
      let d9: Decimal = Decimal.sub(0, -0);
      let av9: boolean = d9.isZero();
      expect(av9).assertTrue();

      // 10. Decimal.sub(10, 4) valueOf equals '6'
      let r10: Decimal = Decimal.sub(10, 4);
      let av10: string = r10.valueOf();
      let ev10: string = '6';
      expect(av10).assertEqual(ev10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SUB_1100
     * @tc.name decimalSubTest011
     * @tc.desc Config precision and rounding modes (5 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSubTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. precision=2 ROUND_HALF_UP 100-0.005 equals '100'
      Decimal.set({ precision: 2, rounding: Decimal.ROUND_HALF_UP });
      let r1: Decimal = new Decimal(100).sub(0.005);
      let av1: string = r1.toString();
      let ev1: string = '100';
      expect(av1).assertEqual(ev1);
      Decimal.set({ defaults: true });

      // 2. precision=2 ROUND_DOWN 100-0.005 equals '99'
      Decimal.set({ precision: 2, rounding: Decimal.ROUND_DOWN });
      let r2: Decimal = new Decimal(100).sub(0.005);
      let av2: string = r2.toString();
      let ev2: string = '99';
      expect(av2).assertEqual(ev2);
      Decimal.set({ defaults: true });

      // 3. precision=2 ROUND_UP -100-(-0.005) equals '-100'
      Decimal.set({ precision: 2, rounding: Decimal.ROUND_UP });
      let r3: Decimal = new Decimal(-100).sub(-0.005);
      let av3: string = r3.toString();
      let ev3: string = '-100';
      expect(av3).assertEqual(ev3);
      Decimal.set({ defaults: true });

      // 4. precision=3 1-0.0001 equals '1'
      Decimal.set({ precision: 3 });
      let r4: Decimal = new Decimal(1).sub(0.0001);
      let av4: string = r4.toString();
      let ev4: string = '1';
      expect(av4).assertEqual(ev4);
      Decimal.set({ defaults: true });

      // 5. precision=2 then defaults: 100-0.005 equals '100' and 0.3-0.1 equals '0.2'
      Decimal.set({ precision: 2 });
      let a5: Decimal = new Decimal(100).sub(0.005);
      Decimal.set({ defaults: true });
      let b5: Decimal = new Decimal(0.3).sub(0.1);
      let av5a: string = a5.toString();
      let ev5a: string = '100';
      expect(av5a).assertEqual(ev5a);
      let av5b: string = b5.toString();
      let ev5b: string = '0.2';
      expect(av5b).assertEqual(ev5b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SUB_1200
     * @tc.name decimalSubTest012
     * @tc.desc Method chaining sub/add/mul (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSubTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. new Decimal(5).sub(1).sub(1) equals '3'
      let r1: Decimal = new Decimal(5).sub(1).sub(1);
      let av1: string = r1.toString();
      let ev1: string = '3';
      expect(av1).assertEqual(ev1);

      // 2. new Decimal(5).sub(1).add(2) equals '6'
      let r2: Decimal = new Decimal(5).sub(1).add(2);
      let av2: string = r2.toString();
      let ev2: string = '6';
      expect(av2).assertEqual(ev2);

      // 3. new Decimal(10).sub(2).sub(3).sub(4) equals '1'
      let r3: Decimal = new Decimal(10).sub(2).sub(3).sub(4);
      let av3: string = r3.toString();
      let ev3: string = '1';
      expect(av3).assertEqual(ev3);

      // 4. new Decimal(10).sub(2).mul(3).sub(1) equals '23'
      let r4: Decimal = new Decimal(10).sub(2).mul(3).sub(1);
      let av4: string = r4.toString();
      let ev4: string = '23';
      expect(av4).assertEqual(ev4);

      // 5. new Decimal(5).sub('1').sub(0.5) equals '3.5'
      let r5: Decimal = new Decimal(5).sub('1').sub(0.5);
      let av5: string = r5.toString();
      let ev5: string = '3.5';
      expect(av5).assertEqual(ev5);

      // 6. Decimal.sub(10,3).mul(2) equals '14'
      let r6: Decimal = Decimal.sub(10, 3).mul(2);
      let av6: string = r6.toString();
      let ev6: string = '14';
      expect(av6).assertEqual(ev6);

      // 7. Decimal.sub(10,3).sub(1) equals '6'
      let r7: Decimal = Decimal.sub(10, 3).sub(1);
      let av7: string = r7.toString();
      let ev7: string = '6';
      expect(av7).assertEqual(ev7);

      // 8. Decimal.sub(Decimal.add(5,2), 1) equals '6'
      let r8: Decimal = Decimal.sub(Decimal.add(5, 2), 1);
      let actualChainedDifference: string = r8.toString();
      let expectedChainedDifference: string = '6';
      expect(actualChainedDifference).assertEqual(expectedChainedDifference);

      // 9. Decimal.sub(5,1).add(2) equals '6'
      let r9: Decimal = Decimal.sub(5, 1).add(2);
      let av9: string = r9.toString();
      let ev9: string = '6';
      expect(av9).assertEqual(ev9);
    });
  });
}
