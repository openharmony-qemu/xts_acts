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
} from '@ohos/hypium-static/src/main/indexStatic';
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

export default function decimalPowTest(): void {
  describe('DecimalPowTest', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      Decimal.set({ defaults: true });
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_0100
     * @tc.name decimalPowTest001
     * @tc.desc Instance pow basic exact results with integer and numeric-string exponents (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalPowTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. 2.pow('10') returns '1024'
      let d1: Decimal = new Decimal(2).pow('10');
      let av1: string = d1.toString();
      let ev1: string = '1024';
      expect(av1).assertEqual(ev1);

      // 2. 2.pow(10) returns '1024'
      let d2: Decimal = new Decimal(2).pow(10);
      let av2: string = d2.toString();
      let ev2: string = '1024';
      expect(av2).assertEqual(ev2);

      // 3. 2.pow(Decimal('10')) returns '1024'
      let e3: Decimal = new Decimal('10');
      let d3: Decimal = new Decimal(2).pow(e3);
      let av3: string = d3.toString();
      let ev3: string = '1024';
      expect(av3).assertEqual(ev3);

      // 4. '3'.pow(Decimal('3')) returns '27'
      let b4: Decimal = new Decimal('3');
      let d4: Decimal = b4.pow(b4);
      let av4: string = d4.toString();
      let ev4: string = '27';
      expect(av4).assertEqual(ev4);

      // 5. 3.pow(Decimal('4').sqrt()) returns '9'
      let e5: Decimal = new Decimal('4').sqrt();
      let d5: Decimal = new Decimal(3).pow(e5);
      let av5: string = d5.toString();
      let ev5: string = '9';
      expect(av5).assertEqual(ev5);

      // 6. 5.pow('0x10') returns '152587890625'
      let r6: Decimal = new Decimal(5).pow('0x10');
      let av6: string = r6.toString();
      let ev6: string = '152587890625';
      expect(av6).assertEqual(ev6);

      // 7. 5.pow('0b101') returns '3125'
      let r7: Decimal = new Decimal(5).pow('0b101');
      let av7: string = r7.toString();
      let ev7: string = '3125';
      expect(av7).assertEqual(ev7);

      // 8. 3.pow(4).toNumber() returns 81
      let r8: Decimal = new Decimal(3).pow(4);
      let avn8: number = r8.toNumber();
      let evi8: int = 81;
      expect(avn8).assertEqual(evi8);

      // 9. 7.pow(3).toPrecision(4) returns '343.0'
      let r9: Decimal = new Decimal(7).pow(3);
      let av9: string = r9.toPrecision(4);
      let ev9: string = '343.0';
      expect(av9).assertEqual(ev9);

      // 10. 6.pow(2).valueOf() returns '36'
      let r10: Decimal = new Decimal(6).pow(2);
      let av10: string = r10.valueOf();
      let ev10: string = '36';
      expect(av10).assertEqual(ev10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_0200
     * @tc.name decimalPowTest002
     * @tc.desc Instance pow with negative exponent and negative base (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalPowTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. 2.pow('-2') returns '0.25'
      let d1: Decimal = new Decimal(2).pow('-2');
      let av1: string = d1.toString();
      let ev1: string = '0.25';
      expect(av1).assertEqual(ev1);

      // 2. 8.pow(-2) returns '0.015625'
      let d2: Decimal = new Decimal(8).pow(-2);
      let av2: string = d2.toString();
      let ev2: string = '0.015625';
      expect(av2).assertEqual(ev2);

      // 3. 4.pow(Decimal('-2')) returns '0.0625'
      let e3: Decimal = new Decimal('-2');
      let d3: Decimal = new Decimal(4).pow(e3);
      let av3: string = d3.toString();
      let ev3: string = '0.0625';
      expect(av3).assertEqual(ev3);

      // 4. -2.pow(3) returns '-8'
      let d4: Decimal = new Decimal(-2).pow(3);
      let av4: string = d4.toString();
      let ev4: string = '-8';
      expect(av4).assertEqual(ev4);

      // 5. -2.pow(2) returns '4'
      let d5: Decimal = new Decimal(-2).pow(2);
      let av5: string = d5.toString();
      let ev5: string = '4';
      expect(av5).assertEqual(ev5);

      // 6. -1.pow(-2) returns '1'
      let d6: Decimal = new Decimal(-1).pow(-2);
      let av6: string = d6.toString();
      let ev6: string = '1';
      expect(av6).assertEqual(ev6);

      // 7. 2.pow(-3).toNumber() returns 0.125
      let r7: Decimal = new Decimal(2).pow(-3);
      let avn7: number = r7.toNumber();
      let evn7: number = 0.125;
      expect(avn7).assertEqual(evn7);

      // 8. -2.pow(2).toNumber() returns 4
      let r8: Decimal = new Decimal(-2).pow(2);
      let avn8: number = r8.toNumber();
      let evi8: int = 4;
      expect(avn8).assertEqual(evi8);

      // 9. 10.pow(-2).comparedTo(0.01) returns 0
      let r9: Decimal = new Decimal(10).pow(-2);
      let avn9: number = r9.comparedTo(0.01);
      let evi9: int = 0;
      expect(avn9).assertEqual(evi9);

      // 10. 5.pow(0).comparedTo(1) returns 0
      let r10: Decimal = new Decimal(5).pow(0);
      let avn10: number = r10.comparedTo(1);
      let evi10: int = 0;
      expect(avn10).assertEqual(evi10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_0300
     * @tc.name decimalPowTest003
     * @tc.desc Instance pow with special-value string and numeric exponents (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalPowTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. 5.pow('0'.repeat(10000)) returns '1'
      let lv1: string = '0'.repeat(10000);
      let d1: Decimal = new Decimal(5).pow(lv1);
      let av1: string = d1.toString();
      let ev1: string = '1';
      expect(av1).assertEqual(ev1);

      // 2. 10.pow('-1e1').toFixed(10) returns '0.0000000001'
      let d2: Decimal = new Decimal(10).pow('-1e1');
      let av2: string = d2.toFixed(10);
      let ev2: string = '0.0000000001';
      expect(av2).assertEqual(ev2);

      // 3. 5.pow('NaN') returns 'NaN'
      let d3: Decimal = new Decimal(5).pow('NaN');
      let av3: string = d3.toString();
      let ev3: string = 'NaN';
      expect(av3).assertEqual(ev3);

      // 4. 2.pow('Infinity') returns 'Infinity'
      let d4: Decimal = new Decimal(2).pow('Infinity');
      let av4: string = d4.toString();
      let ev4: string = 'Infinity';
      expect(av4).assertEqual(ev4);

      // 5. 2.pow('-Infinity') returns '0'
      let d5: Decimal = new Decimal(2).pow('-Infinity');
      let av5: string = d5.toString();
      let ev5: string = '0';
      expect(av5).assertEqual(ev5);

      // 6. 2.pow('2'.repeat(100)) returns 'Infinity'
      let big6: string = '2'.repeat(100);
      let d6: Decimal = new Decimal(2).pow(big6);
      let av6: string = d6.toString();
      let ev6: string = 'Infinity';
      expect(av6).assertEqual(ev6);

      // 7. 5.pow(Number.NaN) returns 'NaN'
      let d7: Decimal = new Decimal(5).pow(Number.NaN);
      let av7: string = d7.toString();
      let ev7: string = 'NaN';
      expect(av7).assertEqual(ev7);

      // 8. 2.pow(Number.POSITIVE_INFINITY) returns 'Infinity'
      let positiveInfinitePower: Decimal = new Decimal(2).pow(Number.POSITIVE_INFINITY);
      let actualInfinitePower: string = positiveInfinitePower.toString();
      let expectedInfinitePower: string = 'Infinity';
      expect(actualInfinitePower).assertEqual(expectedInfinitePower);

      // 9. 2.pow(-Number.POSITIVE_INFINITY) returns '0'
      let d9: Decimal = new Decimal(2).pow(-Number.POSITIVE_INFINITY);
      let av9: string = d9.toString();
      let ev9: string = '0';
      expect(av9).assertEqual(ev9);

      // 10. 3.pow(1.7976931348623157e308) returns 'Infinity'
      let d10: Decimal = new Decimal(3).pow(1.7976931348623157e308);
      let av10: string = d10.toString();
      let ev10: string = 'Infinity';
      expect(av10).assertEqual(ev10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_0400
     * @tc.name decimalPowTest004
     * @tc.desc Instance pow with Decimal special-value exponents and edge cases (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalPowTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. 5.pow(Decimal('NaN')) returns 'NaN'
      let e1: Decimal = new Decimal('NaN');
      let d1: Decimal = new Decimal(5).pow(e1);
      let av1: string = d1.toString();
      let ev1: string = 'NaN';
      expect(av1).assertEqual(ev1);

      // 2. 4.pow(Decimal('Infinity')) returns 'Infinity'
      let e2: Decimal = new Decimal('Infinity');
      let d2: Decimal = new Decimal(4).pow(e2);
      let av2: string = d2.toString();
      let ev2: string = 'Infinity';
      expect(av2).assertEqual(ev2);

      // 3. 4.pow(Decimal('-Infinity')) returns '0'
      let e3: Decimal = new Decimal('-Infinity');
      let d3: Decimal = new Decimal(4).pow(e3);
      let av3: string = d3.toString();
      let ev3: string = '0';
      expect(av3).assertEqual(ev3);

      // 4. 0.pow(-1) returns 'Infinity'
      let d4: Decimal = new Decimal(0).pow(-1);
      let av4: string = d4.toString();
      let ev4: string = 'Infinity';
      expect(av4).assertEqual(ev4);

      // 5. -1.pow(0.5) returns 'NaN'
      let d5: Decimal = new Decimal(-1).pow(0.5);
      let av5: string = d5.toString();
      let ev5: string = 'NaN';
      expect(av5).assertEqual(ev5);

      // 6. -0.pow(-1) returns '-Infinity'
      let d6: Decimal = new Decimal(-0).pow(-1);
      let av6: string = d6.toString();
      let ev6: string = '-Infinity';
      expect(av6).assertEqual(ev6);

      // 7. 2.pow(8).isFinite() returns true
      let r7: Decimal = new Decimal(2).pow(8);
      let avb7: boolean = r7.isFinite();
      expect(avb7).assertTrue();

      // 8. 0.pow(-2).isFinite() returns false
      let r8: Decimal = new Decimal(0).pow(-2);
      let avb8: boolean = r8.isFinite();
      expect(avb8).assertFalse();

      // 9. -8.pow(0.3333333333333333).isNaN() returns true
      let r9: Decimal = new Decimal(-8).pow(0.3333333333333333);
      let avb9: boolean = r9.isNaN();
      expect(avb9).assertTrue();

      // 10. 0.pow(5).isZero() returns true
      let r10: Decimal = new Decimal(0).pow(5);
      let avb10: boolean = r10.isZero();
      expect(avb10).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_0500
     * @tc.name decimalPowTest005
     * @tc.desc Instance pow result structural properties and predicate checks (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalPowTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. 2.pow(4).s returns 1
      let r1: Decimal = new Decimal(2).pow(4);
      let avn1: number = r1.s;
      let evi1: int = 1;
      expect(avn1).assertEqual(evi1);

      // 2. -2.pow(3).s returns -1
      let r2: Decimal = new Decimal(-2).pow(3);
      let avn2: number = r2.s;
      let evi2: int = -1;
      expect(avn2).assertEqual(evi2);

      // 3. 2.pow(10).e returns 3
      let r3: Decimal = new Decimal(2).pow(10);
      let avn3: number = r3.e;
      let evi3: int = 3;
      expect(avn3).assertEqual(evi3);

      // 4. 2.pow(-1).e returns -1
      let r4: Decimal = new Decimal(2).pow(-1);
      let avn4: number = r4.e;
      let evi4: int = -1;
      expect(avn4).assertEqual(evi4);

      // 5. 2.pow(-2).d.length returns 1
      let r5: Decimal = new Decimal(2).pow(-2);
      let avi5: int = r5.d!.length;
      let evi5: int = 1;
      expect(avi5).assertEqual(evi5);

      // 6. 6.pow(3).d.length returns 1
      let r6: Decimal = new Decimal(6).pow(3);
      let avi6: int = r6.d!.length;
      let evi6: int = 1;
      expect(avi6).assertEqual(evi6);

      // 7. 4.pow(2).isInteger() returns true
      let r7: Decimal = new Decimal(4).pow(2);
      let avb7: boolean = r7.isInteger();
      expect(avb7).assertTrue();

      // 8. 2.pow(-2).isInteger() returns false
      let r8: Decimal = new Decimal(2).pow(-2);
      let avb8: boolean = r8.isInteger();
      expect(avb8).assertFalse();

      // 9. 3.pow(3).isNaN() returns false
      let r9: Decimal = new Decimal(3).pow(3);
      let avb9: boolean = r9.isNaN();
      expect(avb9).assertFalse();

      // 10. 2.pow(3).isZero() returns false
      let r10: Decimal = new Decimal(2).pow(3);
      let avb10: boolean = r10.isZero();
      expect(avb10).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_0600
     * @tc.name decimalPowTest006
     * @tc.desc Instance pow result predicates, comparison, identity, and formatting (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalPowTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. -3.pow(3).isNegative() returns true
      let r1: Decimal = new Decimal(-3).pow(3);
      let avb1: boolean = r1.isNegative();
      expect(avb1).assertTrue();

      // 2. -3.pow(2).isNegative() returns false
      let r2: Decimal = new Decimal(-3).pow(2);
      let avb2: boolean = r2.isNegative();
      expect(avb2).assertFalse();

      // 3. 2.pow(4).isPositive() returns true
      let r3: Decimal = new Decimal(2).pow(4);
      let avb3: boolean = r3.isPositive();
      expect(avb3).assertTrue();

      // 4. 2.pow(100).comparedTo('1.2676506002282294015e+30') returns 0
      let r4: Decimal = new Decimal(2).pow(100);
      let avn4: number = r4.comparedTo('1.2676506002282294015e+30');
      let evi4: int = 0;
      expect(avn4).assertEqual(evi4);

      // 5. -2.pow(5).comparedTo(-32) returns 0
      let r5: Decimal = new Decimal(-2).pow(5);
      let avn5: number = r5.comparedTo(-32);
      let evi5: int = 0;
      expect(avn5).assertEqual(evi5);

      // 6. 3.pow(2) not equal to base Decimal(3)
      let d6: Decimal = new Decimal(3);
      let r6: Decimal = d6.pow(2);
      expect(r6).not().assertEqual(d6);

      // 7. 4.pow(Decimal('2')) not equal to exponent Decimal('2')
      let e7: Decimal = new Decimal('2');
      let r7: Decimal = new Decimal(4).pow(e7);
      expect(r7).not().assertEqual(e7);

      // 8. d.pow(2) not equal to d.pow(3) for d=Decimal(2)
      let sharedBase: Decimal = new Decimal(2);
      let r8a: Decimal = sharedBase.pow(2);
      let r8b: Decimal = sharedBase.pow(3);
      expect(r8a).not().assertEqual(r8b);

      // 9. 5.pow(-3).toFixed(6) returns '0.008000'
      let r9: Decimal = new Decimal(5).pow(-3);
      let av9: string = r9.toFixed(6);
      let ev9: string = '0.008000';
      expect(av9).assertEqual(ev9);

      // 10. 10.pow(-6).toFixed() returns '0.000001'
      let r10: Decimal = new Decimal(10).pow(-6);
      let av10: string = r10.toFixed();
      let ev10: string = '0.000001';
      expect(av10).assertEqual(ev10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_0700
     * @tc.name decimalPowTest007
     * @tc.desc Instance pow result formatting and chained arithmetic (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalPowTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. 2.pow(10).toExponential(2) returns '1.02e+3'
      let r1: Decimal = new Decimal(2).pow(10);
      let av1: string = r1.toExponential(2);
      let ev1: string = '1.02e+3';
      expect(av1).assertEqual(ev1);

      // 2. 2.pow(10).toSignificantDigits(2).toString() returns '1000'
      let r2: Decimal = new Decimal(2).pow(10);
      let s2: Decimal = r2.toSignificantDigits(2);
      let av2: string = s2.toString();
      let ev2: string = '1000';
      expect(av2).assertEqual(ev2);

      // 3. 2.pow(-3).toExponential() returns '1.25e-1'
      let r3: Decimal = new Decimal(2).pow(-3);
      let av3: string = r3.toExponential();
      let ev3: string = '1.25e-1';
      expect(av3).assertEqual(ev3);

      // 4. 2.pow(-2).toFraction()[0].toString() returns '1'
      let r4: Decimal = new Decimal(2).pow(-2);
      let av4: string = r4.toFraction()[0].toString();
      let ev4: string = '1';
      expect(av4).assertEqual(ev4);

      // 5. 2.pow(-2).toFraction()[1].toString() returns '4'
      let r5: Decimal = new Decimal(2).pow(-2);
      let av5: string = r5.toFraction()[1].toString();
      let ev5: string = '4';
      expect(av5).assertEqual(ev5);

      // 6. 2.pow(3).negate().toString() returns '-8'
      let r6: Decimal = new Decimal(2).pow(3);
      let av6: string = r6.negate().toString();
      let ev6: string = '-8';
      expect(av6).assertEqual(ev6);

      // 7. 2.pow(2).pow(3).toString() returns '64'
      let r7: Decimal = new Decimal(2).pow(2).pow(3);
      let av7: string = r7.toString();
      let ev7: string = '64';
      expect(av7).assertEqual(ev7);

      // 8. 2.pow(3).add(1).toString() returns '9'
      let r8: Decimal = new Decimal(2).pow(3).add(1);
      let actualChainedPower: string = r8.toString();
      let expectedChainedPower: string = '9';
      expect(actualChainedPower).assertEqual(expectedChainedPower);

      // 9. 2.pow(3).mul(5).toString() returns '40'
      let r9: Decimal = new Decimal(2).pow(3).mul(5);
      let av9: string = r9.toString();
      let ev9: string = '40';
      expect(av9).assertEqual(ev9);

      // 10. 10.pow(2).div(4).toString() returns '25'
      let r10: Decimal = new Decimal(10).pow(2).div(4);
      let av10: string = r10.toString();
      let ev10: string = '25';
      expect(av10).assertEqual(ev10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_0800
     * @tc.name decimalPowTest008
     * @tc.desc Instance pow chained arithmetic and operand immutability (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalPowTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. 3.pow(2).sub(1).toString() returns '8'
      let r1: Decimal = new Decimal(3).pow(2).sub(1);
      let av1: string = r1.toString();
      let ev1: string = '8';
      expect(av1).assertEqual(ev1);

      // 2. 9.pow(2).sqrt().toString() returns '9'
      let r2: Decimal = new Decimal(9).pow(2).sqrt();
      let av2: string = r2.toString();
      let ev2: string = '9';
      expect(av2).assertEqual(ev2);

      // 3. -2.pow(3).abs().toString() returns '8'
      let r3: Decimal = new Decimal(-2).pow(3).abs();
      let av3: string = r3.toString();
      let ev3: string = '8';
      expect(av3).assertEqual(ev3);

      // 4. 3.pow(Decimal('2')).pow(2).toString() returns '81'
      let e4: Decimal = new Decimal('2');
      let r4: Decimal = new Decimal(3).pow(e4).pow(2);
      let av4: string = r4.toString();
      let ev4: string = '81';
      expect(av4).assertEqual(ev4);

      // 5. 2.pow(4).mod(3).toString() returns '1'
      let r5: Decimal = new Decimal(2).pow(4).mod(3);
      let av5: string = r5.toString();
      let ev5: string = '1';
      expect(av5).assertEqual(ev5);

      // 6. d=Decimal(2), d.pow(10), d.toString() returns '2'
      let d6: Decimal = new Decimal(2);
      d6.pow(10);
      let av6: string = d6.toString();
      let ev6: string = '2';
      expect(av6).assertEqual(ev6);

      // 7. e=Decimal('3'), new Decimal(2).pow(e), e.toString() returns '3'
      let e7: Decimal = new Decimal('3');
      new Decimal(2).pow(e7);
      let av7: string = e7.toString();
      let ev7: string = '3';
      expect(av7).assertEqual(ev7);

      // 8. d=Decimal(2), three pow calls, d.toString() returns '2'
      let unchangedBase: Decimal = new Decimal(2);
      unchangedBase.pow(2);
      unchangedBase.pow(3);
      unchangedBase.pow(4);
      let actualBaseAfterPowers: string = unchangedBase.toString();
      let expectedUnchangedBase: string = '2';
      expect(actualBaseAfterPowers).assertEqual(expectedUnchangedBase);

      // 9. d.pow(3).add(100), d.pow(2).toString() returns '4'
      let d9: Decimal = new Decimal(2);
      d9.pow(3).add(100);
      let av9: string = d9.pow(2).toString();
      let ev9: string = '4';
      expect(av9).assertEqual(ev9);

      // 10. Decimal '0.5' value, coefficient, length, sign and exponent preserved after pow(3)
      let d10: Decimal = new Decimal('0.5');
      let ovs10: string = d10.toString();
      let eov10: string = '0.5';
      expect(ovs10).assertEqual(eov10);
      let ods10: Array<double> = d10.d!.slice(0);
      let ols10: int = ods10.length;
      let oss10: double = d10.s;
      let oes10: double = d10.e;
      d10.pow(3);
      let avi10: int = d10.d!.length;
      let evi10: int = 1;
      expect(avi10).assertEqual(evi10);
      let aov10: string = d10.toString();
      expect(aov10).assertEqual(eov10);
      let aod10: Array<double> = d10.d!;
      let aol10: int = aod10.length;
      expect(aol10).assertEqual(ols10);
      for (let ci10: int = 0; ci10 < ols10; ci10++) {
        let ac10: double = aod10[ci10];
        let ec10: double = ods10[ci10];
        expect(ac10).assertEqual(ec10);
      }
      let aos10: double = d10.s;
      expect(aos10).assertEqual(oss10);
      let aoe10: double = d10.e;
      expect(aoe10).assertEqual(oes10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_0900
     * @tc.name decimalPowTest009
     * @tc.desc Instance pow immutability, precision/rounding, and invalid exponent rejection (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalPowTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. Decimal '1234' value, coefficient, length, sign and exponent preserved after pow(2)
      let d1: Decimal = new Decimal('1234');
      let ovs1: string = d1.toString();
      let eov1: string = '1234';
      expect(ovs1).assertEqual(eov1);
      let ods1: Array<double> = d1.d!.slice(0);
      let ols1: int = ods1.length;
      let oss1: double = d1.s;
      let oes1: double = d1.e;
      d1.pow(2);
      let avn1: number = d1.e;
      let evi1: int = 3;
      expect(avn1).assertEqual(evi1);
      let aov1: string = d1.toString();
      expect(aov1).assertEqual(eov1);
      let aod1: Array<double> = d1.d!;
      let aol1: int = aod1.length;
      expect(aol1).assertEqual(ols1);
      for (let ci1: int = 0; ci1 < ols1; ci1++) {
        let ac1: double = aod1[ci1];
        let ec1: double = ods1[ci1];
        expect(ac1).assertEqual(ec1);
      }
      let aos1: double = d1.s;
      expect(aos1).assertEqual(oss1);
      let aoe1: double = d1.e;
      expect(aoe1).assertEqual(oes1);

      // 2. Decimal -2 value, coefficient, length, sign and exponent preserved after pow(4)
      let d2: Decimal = new Decimal(-2);
      let ovs2: string = d2.toString();
      let eov2: string = '-2';
      expect(ovs2).assertEqual(eov2);
      let ods2: Array<double> = d2.d!.slice(0);
      let ols2: int = ods2.length;
      let oss2: double = d2.s;
      let oes2: double = d2.e;
      d2.pow(4);
      let avn2: number = d2.s;
      let evi2: int = -1;
      expect(avn2).assertEqual(evi2);
      let aov2: string = d2.toString();
      expect(aov2).assertEqual(eov2);
      let aod2: Array<double> = d2.d!;
      let aol2: int = aod2.length;
      expect(aol2).assertEqual(ols2);
      for (let ci2: int = 0; ci2 < ols2; ci2++) {
        let ac2: double = aod2[ci2];
        let ec2: double = ods2[ci2];
        expect(ac2).assertEqual(ec2);
      }
      let aos2: double = d2.s;
      expect(aos2).assertEqual(oss2);
      let aoe2: double = d2.e;
      expect(aoe2).assertEqual(oes2);

      // 3. precision 20, 2.pow(0.1).d.length returns 4
      Decimal.set({ precision: 20 });
      let r3: Decimal = new Decimal(2).pow(0.1);
      Decimal.set({ defaults: true });
      let avi3: int = r3.d!.length;
      let evi3: int = 4;
      expect(avi3).assertEqual(evi3);

      // 4. precision 4, 2.pow(0.1).toString() returns '1.072'
      Decimal.set({ precision: 4 });
      let r4: Decimal = new Decimal(2).pow(0.1);
      Decimal.set({ defaults: true });
      let av4: string = r4.toString();
      let ev4: string = '1.072';
      expect(av4).assertEqual(ev4);

      // 5. precision 10, 2.pow(-0.1).d.length returns 2
      Decimal.set({ precision: 10 });
      let r5: Decimal = new Decimal(2).pow(-0.1);
      Decimal.set({ defaults: true });
      let avi5: int = r5.d!.length;
      let evi5: int = 2;
      expect(avi5).assertEqual(evi5);

      // 6. precision 3 ROUND_DOWN, 2.pow(0.5).toString() returns '1.41'
      Decimal.set({ precision: 3, rounding: Decimal.ROUND_DOWN });
      let r6: Decimal = new Decimal(2).pow(0.5);
      Decimal.set({ defaults: true });
      let av6: string = r6.toString();
      let ev6: string = '1.41';
      expect(av6).assertEqual(ev6);

      // 7. precision 3 ROUND_UP, 2.pow(0.5).toString() returns '1.42'
      Decimal.set({ precision: 3, rounding: Decimal.ROUND_UP });
      let r7: Decimal = new Decimal(2).pow(0.5);
      Decimal.set({ defaults: true });
      let av7: string = r7.toString();
      let ev7: string = '1.42';
      expect(av7).assertEqual(ev7);

      // 8. precision 3 ROUND_HALF_UP, 2.pow(0.5).toString() returns '1.41'
      Decimal.set({ precision: 3, rounding: Decimal.ROUND_HALF_UP });
      let r8: Decimal = new Decimal(2).pow(0.5);
      Decimal.set({ defaults: true });
      let actualRoundedPower: string = r8.toString();
      let expectedRoundedPower: string = '1.41';
      expect(actualRoundedPower).assertEqual(expectedRoundedPower);

      // 9. 5.pow(' ') rejects with error code 401
      try {
        new Decimal(5).pow(' ');
        expect().assertFail();
      } catch (e9) {
        expect(e9.code).assertEqual(401);
      }

      // 10. 5.pow('<script>alert(1)</script>') rejects with error code 401
      try {
        new Decimal(5).pow('<script>alert(1)</script>');
        expect().assertFail();
      } catch (e10) {
        expect(e10.code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_1000
     * @tc.name decimalPowTest010
     * @tc.desc Instance pow invalid exponent rejection and type-cast errors (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalPowTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. 5.pow(ZWSP) rejects with error code 401
      try {
        new Decimal(5).pow('​');
        expect().assertFail();
      } catch (e1) {
        expect(e1.code).assertEqual(401);
      }

      // 2. 5.pow('😀') rejects with error code 401
      try {
        new Decimal(5).pow('😀');
        expect().assertFail();
      } catch (e2) {
        expect(e2.code).assertEqual(401);
      }

      // 3. 5.pow('中') rejects with error code 401
      try {
        new Decimal(5).pow('中');
        expect().assertFail();
      } catch (e3) {
        expect(e3.code).assertEqual(401);
      }

      // 4. 5.pow('1e') rejects with error code 401
      try {
        new Decimal(5).pow('1e');
        expect().assertFail();
      } catch (e4) {
        expect(e4.code).assertEqual(401);
      }

      // 5. 5.pow(undefined as Object as string) rejects with ClassCastError code 0
      try {
        new Decimal(5).pow(undefined as Object as string);
        expect().assertFail();
      } catch (e5) {
        expect(e5.code).assertEqual(0);
      }

      // 6. 5.pow(null as Object as string) rejects with ClassCastError code 0
      try {
        new Decimal(5).pow(null as Object as string);
        expect().assertFail();
      } catch (e6) {
        expect(e6.code).assertEqual(0);
      }

      // 7. 5.pow(true as Object as string) rejects with ClassCastError code 0
      try {
        new Decimal(5).pow(true as Object as string);
        expect().assertFail();
      } catch (e7) {
        expect(e7.code).assertEqual(0);
      }

      // 8. 5.pow(BigInt(10) as Object as string) rejects with ClassCastError code 0
      try {
        new Decimal(5).pow(BigInt(10) as Object as string);
        expect().assertFail();
      } catch (e8) {
        expect(e8.code).assertEqual(0);
      }

      // 9. 5.pow(new Object() as Object as string) rejects with ClassCastError code 0
      try {
        new Decimal(5).pow(new Object() as Object as string);
        expect().assertFail();
      } catch (e9) {
        expect(e9.code).assertEqual(0);
      }

      // 10. 5.pow(number[] as Object as string) rejects with ClassCastError code 0
      let arr10: number[] = [1];
      try {
        new Decimal(5).pow(arr10 as Object as string);
        expect().assertFail();
      } catch (e10) {
        expect(e10.code).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_1100
     * @tc.name decimalPowTest011
     * @tc.desc Static pow basic exact results and numeric-string base (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalPowTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. Decimal.pow('3','4') returns '81'
      let r1: Decimal = Decimal.pow('3', '4');
      let av1: string = r1.toString();
      let ev1: string = '81';
      expect(av1).assertEqual(ev1);

      // 2. Decimal.pow(9,3) returns '729'
      let r2: Decimal = Decimal.pow(9, 3);
      let av2: string = r2.toString();
      let ev2: string = '729';
      expect(av2).assertEqual(ev2);

      // 3. Decimal.pow('1',-5) returns '1'
      let r3: Decimal = Decimal.pow('1', -5);
      let av3: string = r3.toString();
      let ev3: string = '1';
      expect(av3).assertEqual(ev3);

      // 4. Decimal.pow('-2','0') returns '1'
      let r4: Decimal = Decimal.pow('-2', '0');
      let av4: string = r4.toString();
      let ev4: string = '1';
      expect(av4).assertEqual(ev4);

      // 5. Decimal.pow(Decimal(2),10) returns '1024'
      let r5: Decimal = Decimal.pow(new Decimal(2), 10);
      let av5: string = r5.toString();
      let ev5: string = '1024';
      expect(av5).assertEqual(ev5);

      // 6. Decimal.pow(2,Decimal(10)) returns '1024'
      let r6: Decimal = Decimal.pow(2, new Decimal(10));
      let av6: string = r6.toString();
      let ev6: string = '1024';
      expect(av6).assertEqual(ev6);

      // 7. Decimal.pow(1,5).toString() returns '1'
      let av7: string = Decimal.pow(1, 5).toString();
      let ev7: string = '1';
      expect(av7).assertEqual(ev7);

      // 8. Decimal.pow('0x10',2) returns '256'
      let r8: Decimal = Decimal.pow('0x10', 2);
      let actualHexBasePower: string = r8.toString();
      let expectedHexBasePower: string = '256';
      expect(actualHexBasePower).assertEqual(expectedHexBasePower);

      // 9. Decimal.pow('0b101',2) returns '25'
      let r9: Decimal = Decimal.pow('0b101', 2);
      let av9: string = r9.toString();
      let ev9: string = '25';
      expect(av9).assertEqual(ev9);

      // 10. Decimal.pow('0o10',2) returns '64'
      let r10: Decimal = Decimal.pow('0o10', 2);
      let av10: string = r10.toString();
      let ev10: string = '64';
      expect(av10).assertEqual(ev10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_1200
     * @tc.name decimalPowTest012
     * @tc.desc Static pow arity combinations and fractional exponents (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalPowTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. Decimal.pow(Decimal('5'),Decimal('2')) returns '25'
      let x1: Decimal = new Decimal('5');
      let y1: Decimal = new Decimal('2');
      let r1: Decimal = Decimal.pow(x1, y1);
      let av1: string = r1.toString();
      let ev1: string = '25';
      expect(av1).assertEqual(ev1);

      // 2. Decimal.pow('6',2) returns '36'
      let r2: Decimal = Decimal.pow('6', 2);
      let av2: string = r2.toString();
      let ev2: string = '36';
      expect(av2).assertEqual(ev2);

      // 3. Decimal.pow(7,'2') returns '49'
      let r3: Decimal = Decimal.pow(7, '2');
      let av3: string = r3.toString();
      let ev3: string = '49';
      expect(av3).assertEqual(ev3);

      // 4. Decimal.pow('8',Decimal('2')) returns '64'
      let y4: Decimal = new Decimal('2');
      let r4: Decimal = Decimal.pow('8', y4);
      let av4: string = r4.toString();
      let ev4: string = '64';
      expect(av4).assertEqual(ev4);

      // 5. Decimal.pow(Decimal('10'),'2') returns '100'
      let x5: Decimal = new Decimal('10');
      let r5: Decimal = Decimal.pow(x5, '2');
      let av5: string = r5.toString();
      let ev5: string = '100';
      expect(av5).assertEqual(ev5);

      // 6. Decimal.pow(11,Decimal('2')) returns '121'
      let y6: Decimal = new Decimal('2');
      let r6: Decimal = Decimal.pow(11, y6);
      let av6: string = r6.toString();
      let ev6: string = '121';
      expect(av6).assertEqual(ev6);

      // 7. Decimal.pow(Decimal('12'),2) returns '144'
      let x7: Decimal = new Decimal('12');
      let r7: Decimal = Decimal.pow(x7, 2);
      let av7: string = r7.toString();
      let ev7: string = '144';
      expect(av7).assertEqual(ev7);

      // 8. Decimal.pow(10,0.5) greaterThan 3.16 and lessThan 3.17
      let r8: Decimal = Decimal.pow(10, 0.5);
      let avb8a: boolean = r8.greaterThan(new Decimal('3.16'));
      expect(avb8a).assertTrue();
      let avb8b: boolean = r8.lessThan(new Decimal('3.17'));
      expect(avb8b).assertTrue();

      // 9. Decimal.pow(4,Decimal('0.5')) returns '2'
      let r9: Decimal = Decimal.pow(4, new Decimal('0.5'));
      let av9: string = r9.toString();
      let ev9: string = '2';
      expect(av9).assertEqual(ev9);

      // 10. Decimal.pow('1e2',0.5).toString() returns '10'
      let av10: string = Decimal.pow('1e2', 0.5).toString();
      let ev10: string = '10';
      expect(av10).assertEqual(ev10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_1300
     * @tc.name decimalPowTest013
     * @tc.desc Static pow with negative base and negative exponent (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalPowTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. Decimal.pow('-2',5) returns '-32'
      let r1: Decimal = Decimal.pow('-2', 5);
      let av1: string = r1.toString();
      let ev1: string = '-32';
      expect(av1).assertEqual(ev1);

      // 2. Decimal.pow('-2',4) returns '16'
      let r2: Decimal = Decimal.pow('-2', 4);
      let av2: string = r2.toString();
      let ev2: string = '16';
      expect(av2).assertEqual(ev2);

      // 3. Decimal.pow('-0.5','3') returns '-0.125'
      let r3: Decimal = Decimal.pow('-0.5', '3');
      let av3: string = r3.toString();
      let ev3: string = '-0.125';
      expect(av3).assertEqual(ev3);

      // 4. Decimal.pow(-2,4) returns '16'
      let r4: Decimal = Decimal.pow(-2, 4);
      let av4: string = r4.toString();
      let ev4: string = '16';
      expect(av4).assertEqual(ev4);

      // 5. Decimal.pow(Decimal('-2'),3) returns '-8'
      let r5: Decimal = Decimal.pow(new Decimal('-2'), 3);
      let av5: string = r5.toString();
      let ev5: string = '-8';
      expect(av5).assertEqual(ev5);

      // 6. Decimal.pow(Decimal('0.5'),2) returns '0.25'
      let r6: Decimal = Decimal.pow(new Decimal('0.5'), 2);
      let av6: string = r6.toString();
      let ev6: string = '0.25';
      expect(av6).assertEqual(ev6);

      // 7. Decimal.pow(Decimal('2'),-3) returns '0.125'
      let r7: Decimal = Decimal.pow(new Decimal('2'), -3);
      let av7: string = r7.toString();
      let ev7: string = '0.125';
      expect(av7).assertEqual(ev7);

      // 8. Decimal.pow(2,'-1') returns '0.5'
      let r8: Decimal = Decimal.pow(2, '-1');
      let actualReciprocalPower: string = r8.toString();
      let expectedReciprocalPower: string = '0.5';
      expect(actualReciprocalPower).assertEqual(expectedReciprocalPower);

      // 9. Decimal.pow(2,-1) returns '0.5'
      let r9: Decimal = Decimal.pow(2, -1);
      let av9: string = r9.toString();
      let ev9: string = '0.5';
      expect(av9).assertEqual(ev9);

      // 10. Decimal.pow(2,Decimal(-1)) returns '0.5'
      let r10: Decimal = Decimal.pow(2, new Decimal(-1));
      let av10: string = r10.toString();
      let ev10: string = '0.5';
      expect(av10).assertEqual(ev10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_1400
     * @tc.name decimalPowTest014
     * @tc.desc Static pow negative exponent, negative-base fractional NaN, and static-vs-instance equivalence (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalPowTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. Decimal.pow(2,Decimal('-3')) returns '0.125'
      let r1: Decimal = Decimal.pow(2, new Decimal('-3'));
      let av1: string = r1.toString();
      let ev1: string = '0.125';
      expect(av1).assertEqual(ev1);

      // 2. Decimal.pow(2,-3).toString() returns '0.125'
      let av2: string = Decimal.pow(2, -3).toString();
      let ev2: string = '0.125';
      expect(av2).assertEqual(ev2);

      // 3. Decimal.pow(-2,0.5).isNaN() returns true
      let rs3: Decimal = Decimal.pow(-2, 0.5);
      let avb3: boolean = rs3.isNaN();
      expect(avb3).assertTrue();

      // 4. Decimal.pow(Decimal('-4'),0.5).isNaN() returns true
      let rs4: Decimal = Decimal.pow(new Decimal('-4'), 0.5);
      let avb4: boolean = rs4.isNaN();
      expect(avb4).assertTrue();

      // 5. Decimal.pow('-2',Decimal('0.5')).isNaN() returns true
      let rs5: Decimal = Decimal.pow('-2', new Decimal('0.5'));
      let avb5: boolean = rs5.isNaN();
      expect(avb5).assertTrue();

      // 6. Decimal.pow('-2','0.5').isNaN() returns true
      let rs6: Decimal = Decimal.pow('-2', '0.5');
      let avb6: boolean = rs6.isNaN();
      expect(avb6).assertTrue();

      // 7. Decimal.pow('-2',2.5).isNaN() returns true
      let rs7: Decimal = Decimal.pow('-2', 2.5);
      let avb7: boolean = rs7.isNaN();
      expect(avb7).assertTrue();

      // 8. Decimal.pow('-2','0.333...').isNaN() returns true
      let frac8: string = '0.333333333333333333333333333333';
      let rs8: Decimal = Decimal.pow('-2', frac8);
      let avb8: boolean = rs8.isNaN();
      expect(avb8).assertTrue();

      // 9. Decimal.pow(2,10) equals new Decimal(2).pow(10)
      let a9: Decimal = Decimal.pow(2, 10);
      let b9: Decimal = new Decimal(2).pow(10);
      let av9: string = a9.toString();
      let ev9: string = b9.toString();
      expect(av9).assertEqual(ev9);

      // 10. Decimal.pow('-3',3) equals new Decimal('-3').pow(3)
      let a10: Decimal = Decimal.pow('-3', 3);
      let b10: Decimal = new Decimal('-3').pow(3);
      let av10: string = a10.toString();
      let ev10: string = b10.toString();
      expect(av10).assertEqual(ev10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_1500
     * @tc.name decimalPowTest015
     * @tc.desc Static pow vs instance pow equivalence and special-value base/exponent (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalPowTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. Decimal.pow('0.5','4') equals new Decimal('0.5').pow(4)
      let a1: Decimal = Decimal.pow('0.5', '4');
      let b1: Decimal = new Decimal('0.5').pow(4);
      let av1: string = a1.toString();
      let ev1: string = b1.toString();
      expect(av1).assertEqual(ev1);

      // 2. Decimal.pow('-2',0.5) and new Decimal('-2').pow(0.5) both isNaN
      let rs2a: Decimal = Decimal.pow('-2', 0.5);
      let avb2a: boolean = rs2a.isNaN();
      expect(avb2a).assertTrue();
      let rs2b: Decimal = new Decimal('-2').pow(0.5);
      let avb2b: boolean = rs2b.isNaN();
      expect(avb2b).assertTrue();

      // 3. Decimal.pow(Decimal(5),3) equals new Decimal(5).pow(3)
      let a3: Decimal = Decimal.pow(new Decimal(5), 3);
      let b3: Decimal = new Decimal(5).pow(3);
      let av3: string = a3.toString();
      let ev3: string = b3.toString();
      expect(av3).assertEqual(ev3);

      // 4. Decimal.pow(2,'-2') equals new Decimal(2).pow('-2')
      let a4: Decimal = Decimal.pow(2, '-2');
      let b4: Decimal = new Decimal(2).pow('-2');
      let av4: string = a4.toString();
      let ev4: string = b4.toString();
      expect(av4).assertEqual(ev4);

      // 5. Decimal.pow('Infinity',2) and new Decimal('Infinity').pow(2) both not finite
      let a5: Decimal = Decimal.pow('Infinity', 2);
      let avb5a: boolean = a5.isFinite();
      expect(avb5a).assertFalse();
      let b5: Decimal = new Decimal('Infinity').pow(2);
      let avb5b: boolean = b5.isFinite();
      expect(avb5b).assertFalse();

      // 6. Decimal.pow(2,Decimal(10)) equals new Decimal(2).pow(Decimal(10))
      let a6: Decimal = Decimal.pow(2, new Decimal(10));
      let b6: Decimal = new Decimal(2).pow(new Decimal(10));
      let av6: string = a6.toString();
      let ev6: string = b6.toString();
      expect(av6).assertEqual(ev6);

      // 7. Decimal.pow('NaN',2).isNaN() returns true
      let r7: Decimal = Decimal.pow('NaN', 2);
      let avb7: boolean = r7.isNaN();
      expect(avb7).assertTrue();

      // 8. Decimal.pow('-Infinity',3).isFinite() returns false
      let r8: Decimal = Decimal.pow('-Infinity', 3);
      let avb8: boolean = r8.isFinite();
      expect(avb8).assertFalse();

      // 9. Decimal.pow('-0',3).isZero() returns true
      let r9: Decimal = Decimal.pow('-0', 3);
      let avb9: boolean = r9.isZero();
      expect(avb9).assertTrue();

      // 10. Decimal.pow('0',-1).isFinite() returns false
      let r10: Decimal = Decimal.pow('0', -1);
      let avb10: boolean = r10.isFinite();
      expect(avb10).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_1600
     * @tc.name decimalPowTest016
     * @tc.desc Static pow with special-value base and exponent (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalPowTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. Decimal.pow('9'.repeat(10000),'0') returns '1'
      let lv1: string = '9'.repeat(10000);
      let r1: Decimal = Decimal.pow(lv1, '0');
      let av1: string = r1.toString();
      let ev1: string = '1';
      expect(av1).assertEqual(ev1);

      // 2. Decimal.pow(0,-1).isFinite() returns false
      let r2: Decimal = Decimal.pow(0, -1);
      let avb2: boolean = r2.isFinite();
      expect(avb2).assertFalse();

      // 3. Decimal.pow(-0,3).isZero() returns true
      let r3: Decimal = Decimal.pow(-0, 3);
      let avb3: boolean = r3.isZero();
      expect(avb3).assertTrue();

      // 4. Decimal.pow(Decimal('NaN'),2).isNaN() returns true
      let r4: Decimal = Decimal.pow(new Decimal('NaN'), 2);
      let avb4: boolean = r4.isNaN();
      expect(avb4).assertTrue();

      // 5. Decimal.pow(Decimal('Infinity'),2).isFinite() returns false
      let r5: Decimal = Decimal.pow(new Decimal('Infinity'), 2);
      let avb5: boolean = r5.isFinite();
      expect(avb5).assertFalse();

      // 6. Decimal.pow(Decimal('-0'),3).isZero() returns true
      let r6: Decimal = Decimal.pow(new Decimal('-0'), 3);
      let avb6: boolean = r6.isZero();
      expect(avb6).assertTrue();

      // 7. Decimal.pow(1,'0.333...') returns '1'
      let frac7: string = '0.333333333333333333333333333333';
      let r7: Decimal = Decimal.pow(1, frac7);
      let av7: string = r7.toString();
      let ev7: string = '1';
      expect(av7).assertEqual(ev7);

      // 8. Decimal.pow(2,'Infinity').isFinite() returns false
      let r8: Decimal = Decimal.pow(2, 'Infinity');
      let avb8: boolean = r8.isFinite();
      expect(avb8).assertFalse();

      // 9. Decimal.pow(2,'NaN').isNaN() returns true
      let r9: Decimal = Decimal.pow(2, 'NaN');
      let avb9: boolean = r9.isNaN();
      expect(avb9).assertTrue();

      // 10. Decimal.pow(2,'1e17').isFinite() returns false
      let r10: Decimal = Decimal.pow(2, '1e17');
      let avb10: boolean = r10.isFinite();
      expect(avb10).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_1700
     * @tc.name decimalPowTest017
     * @tc.desc Static pow special-value exponent and invalid string exponent rejection (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalPowTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. Decimal.pow(2,Number.NaN).isNaN() returns true
      let r1: Decimal = Decimal.pow(2, Number.NaN);
      let avb1: boolean = r1.isNaN();
      expect(avb1).assertTrue();

      // 2. Decimal.pow(2,Number.POSITIVE_INFINITY).isFinite() returns false
      let r2: Decimal = Decimal.pow(2, Number.POSITIVE_INFINITY);
      let avb2: boolean = r2.isFinite();
      expect(avb2).assertFalse();

      // 3. Decimal.pow(2,Decimal('NaN')).isNaN() returns true
      let r3: Decimal = Decimal.pow(2, new Decimal('NaN'));
      let avb3: boolean = r3.isNaN();
      expect(avb3).assertTrue();

      // 4. Decimal.pow(2,Decimal('Infinity')).isFinite() returns false
      let r4: Decimal = Decimal.pow(2, new Decimal('Infinity'));
      let avb4: boolean = r4.isFinite();
      expect(avb4).assertFalse();

      // 5. Decimal.pow(2,-Number.POSITIVE_INFINITY).isZero() returns true
      let avb5: boolean = Decimal.pow(2, -Number.POSITIVE_INFINITY).isZero();
      expect(avb5).assertTrue();

      // 6. Decimal.pow(spaces,1) rejects with error code 401
      let ws6: string = ' ';
      let spaces6: string = ws6 + ws6 + ws6;
      try {
        Decimal.pow(spaces6, 1);
        expect().assertFail();
      } catch (e6) {
        expect(e6.code).assertEqual(401);
      }

      // 7. Decimal.pow(ZWSP,1) rejects with error code 401
      try {
        Decimal.pow('​', 1);
        expect().assertFail();
      } catch (e7) {
        expect(e7.code).assertEqual(401);
      }

      // 8. Decimal.pow('中文',1) rejects with error code 401
      try {
        Decimal.pow('中文', 1);
        expect().assertFail();
      } catch (e8) {
        expect(e8.code).assertEqual(401);
      }

      // 9. Decimal.pow('😀abc',1) rejects with error code 401
      try {
        Decimal.pow('😀abc', 1);
        expect().assertFail();
      } catch (e9) {
        expect(e9.code).assertEqual(401);
      }

      // 10. Decimal.pow('<script>alert(1)</script>',1) rejects with error code 401
      try {
        Decimal.pow('<script>alert(1)</script>', 1);
        expect().assertFail();
      } catch (e10) {
        expect(e10.code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_1800
     * @tc.name decimalPowTest018
     * @tc.desc Static pow special-value base and invalid string exponent rejection (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalPowTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. Decimal.pow(Number.POSITIVE_INFINITY,2).isFinite() returns false
      let avb1: boolean = Decimal.pow(Number.POSITIVE_INFINITY, 2).isFinite();
      expect(avb1).assertFalse();

      // 2. Decimal.pow(-Number.POSITIVE_INFINITY,3).s returns -1
      let avn2: number = Decimal.pow(-Number.POSITIVE_INFINITY, 3).s;
      let evi2: int = -1;
      expect(avn2).assertEqual(evi2);

      // 3. Decimal.pow(1.7976931348623157e308,2).isFinite() returns true
      let avb3: boolean = Decimal.pow(1.7976931348623157e308, 2).isFinite();
      expect(avb3).assertTrue();

      // 4. Decimal.pow(5e-324,2).isZero() returns false
      let avb4: boolean = Decimal.pow(5e-324, 2).isZero();
      expect(avb4).assertFalse();

      // 5. Decimal.pow('12a',1) rejects with error code 401
      try {
        Decimal.pow('12a', 1);
        expect().assertFail();
      } catch (e5) {
        expect(e5.code).assertEqual(401);
      }

      // 6. Decimal.pow('1.2.3',1) rejects with error code 401
      try {
        Decimal.pow('1.2.3', 1);
        expect().assertFail();
      } catch (e6) {
        expect(e6.code).assertEqual(401);
      }

      // 7. Decimal.pow(2,spaces) rejects with error code 401
      let ws7: string = ' ';
      let spaces7: string = ws7 + ws7 + ws7;
      try {
        Decimal.pow(2, spaces7);
        expect().assertFail();
      } catch (e7) {
        expect(e7.code).assertEqual(401);
      }

      // 8. Decimal.pow(2,ZWSP) rejects with error code 401
      try {
        Decimal.pow(2, '​');
        expect().assertFail();
      } catch (e8) {
        expect(e8.code).assertEqual(401);
      }

      // 9. Decimal.pow(2,'中文') rejects with error code 401
      try {
        Decimal.pow(2, '中文');
        expect().assertFail();
      } catch (e9) {
        expect(e9.code).assertEqual(401);
      }

      // 10. Decimal.pow(2,'abc') rejects with error code 401
      try {
        Decimal.pow(2, 'abc');
        expect().assertFail();
      } catch (e10) {
        expect(e10.code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_1900
     * @tc.name decimalPowTest019
     * @tc.desc Static pow type-cast error, identity, equals, and comparedTo (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalPowTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. Decimal.pow(new Object() as string,1) rejects with ClassCastError code 0
      let pending1: Object = new Object();
      try {
        Decimal.pow(pending1 as string, 1);
        expect().assertFail();
      } catch (e1) {
        expect(e1.code).assertEqual(0);
      }

      // 2. Decimal.pow(Decimal(2),10) not equal to base
      let b2: Decimal = new Decimal(2);
      let r2: Decimal = Decimal.pow(b2, 10);
      expect(r2).not().assertEqual(b2);

      // 3. Decimal.pow(2,3), new Decimal(r1).equals(r1) returns true
      let r3a: Decimal = Decimal.pow(2, 3);
      let r3b: Decimal = new Decimal(r3a);
      let avb3: boolean = r3a.equals(r3b);
      expect(avb3).assertTrue();

      // 4. Decimal.pow(2,0.5), new Decimal(r.toString()).equals(r) returns true
      let r4: Decimal = Decimal.pow(2, 0.5);
      let avb4: boolean = new Decimal(r4.toString()).equals(r4);
      expect(avb4).assertTrue();

      // 5. Decimal.pow('2',2).comparedTo(Decimal.pow(2,2)) returns 0
      let avn5: number = Decimal.pow('2', 2).comparedTo(Decimal.pow(2, 2));
      let evi5: int = 0;
      expect(avn5).assertEqual(evi5);

      // 6. Decimal.pow(Decimal(3),3).comparedTo(Decimal.pow('3',3)) returns 0
      let b6: Decimal = new Decimal(3);
      let avn6: number = Decimal.pow(b6, 3).comparedTo(Decimal.pow('3', 3));
      let evi6: int = 0;
      expect(avn6).assertEqual(evi6);

      // 7. Decimal.pow(2,3).mul(Decimal.pow(2,-3)).comparedTo(Decimal(1)) returns 0
      let avn7: number = Decimal.pow(2, 3).mul(Decimal.pow(2, -3)).comparedTo(new Decimal(1));
      let evi7: int = 0;
      expect(avn7).assertEqual(evi7);

      // 8. Decimal.pow(-2,3).comparedTo(new Decimal(-2).pow(3)) returns 0
      let avn8: number = Decimal.pow(-2, 3).comparedTo(new Decimal(-2).pow(3));
      let evi8: int = 0;
      expect(avn8).assertEqual(evi8);

      // 9. Decimal.pow(2,-2).comparedTo(new Decimal(2).pow(-2)) returns 0
      let avn9: number = Decimal.pow(2, -2).comparedTo(new Decimal(2).pow(-2));
      let evi9: int = 0;
      expect(avn9).assertEqual(evi9);

      // 10. Decimal.pow('2','3').comparedTo(new Decimal('2').pow('3')) returns 0
      let avn10: number = Decimal.pow('2', '3').comparedTo(new Decimal('2').pow('3'));
      let evi10: int = 0;
      expect(avn10).assertEqual(evi10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_2000
     * @tc.name decimalPowTest020
     * @tc.desc Static pow structural properties, precision, and operand immutability (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalPowTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. Decimal.pow(2,10).s returns 1
      let avn1: number = Decimal.pow(2, 10).s;
      let evi1: int = 1;
      expect(avn1).assertEqual(evi1);

      // 2. Decimal.pow(2,10).e > 0 returns true
      let avb2: boolean = Decimal.pow(2, 10).e > 0;
      expect(avb2).assertTrue();

      // 3. Decimal.pow(2,-3).e < 0 returns true
      let avb3: boolean = Decimal.pow(2, -3).e < 0;
      expect(avb3).assertTrue();

      // 4. Decimal.pow(2,10).d.length returns 1
      let avi4: int = Decimal.pow(2, 10).d!.length;
      let evi4: int = 1;
      expect(avi4).assertEqual(evi4);

      // 5. Decimal.pow(2,-3).d.length returns 1
      let avi5: int = Decimal.pow(2, -3).d!.length;
      let evi5: int = 1;
      expect(avi5).assertEqual(evi5);

      // 6. precision 10, Decimal.pow(2,0.5).d.length returns 3
      Decimal.set({ precision: 10 });
      let r6: Decimal = Decimal.pow(2, 0.5);
      Decimal.set({ defaults: true });
      let avi6: int = r6.d!.length;
      let evi6: int = 3;
      expect(avi6).assertEqual(evi6);

      // 7. Decimal.pow(b,10), b.toNumber() returns 2
      let b7: Decimal = new Decimal(2);
      Decimal.pow(b7, 10);
      let avn7: number = b7.toNumber();
      let evi7: int = 2;
      expect(avn7).assertEqual(evi7);

      // 8. Decimal.pow(b,10), b.equals(Decimal(2)) returns true
      let b8: Decimal = new Decimal(2);
      Decimal.pow(b8, 10);
      let avb8: boolean = b8.equals(new Decimal(2));
      expect(avb8).assertTrue();

      // 9. Static pow operand Decimal(2) value, coefficient, length, sign and exponent preserved
      let b9: Decimal = new Decimal(2);
      let ovs9: string = b9.toString();
      let eov9: string = '2';
      expect(ovs9).assertEqual(eov9);
      let ods9: Array<double> = b9.d!.slice(0);
      let ols9: int = ods9.length;
      let oss9: double = b9.s;
      let oes9: double = b9.e;
      Decimal.pow(b9, 10);
      let avi9: int = b9.d!.length;
      let evi9: int = 1;
      expect(avi9).assertEqual(evi9);
      let aov9: string = b9.toString();
      expect(aov9).assertEqual(eov9);
      let aod9: Array<double> = b9.d!;
      let aol9: int = aod9.length;
      expect(aol9).assertEqual(ols9);
      for (let ci9: int = 0; ci9 < ols9; ci9++) {
        let ac9: double = aod9[ci9];
        let ec9: double = ods9[ci9];
        expect(ac9).assertEqual(ec9);
      }
      let aos9: double = b9.s;
      expect(aos9).assertEqual(oss9);
      let aoe9: double = b9.e;
      expect(aoe9).assertEqual(oes9);

      // 10. Static pow operand Decimal(2) sign and full state preserved after pow
      let b10: Decimal = new Decimal(2);
      let ovs10: string = b10.toString();
      let eov10: string = '2';
      expect(ovs10).assertEqual(eov10);
      let ods10: Array<double> = b10.d!.slice(0);
      let ols10: int = ods10.length;
      let oss10: double = b10.s;
      let oes10: double = b10.e;
      Decimal.pow(b10, 10);
      let avn10: number = b10.s;
      let evi10: int = 1;
      expect(avn10).assertEqual(evi10);
      let aov10: string = b10.toString();
      expect(aov10).assertEqual(eov10);
      let aod10: Array<double> = b10.d!;
      let aol10: int = aod10.length;
      expect(aol10).assertEqual(ols10);
      for (let ci10: int = 0; ci10 < ols10; ci10++) {
        let ac10: double = aod10[ci10];
        let ec10: double = ods10[ci10];
        expect(ac10).assertEqual(ec10);
      }
      let aos10: double = b10.s;
      expect(aos10).assertEqual(oss10);
      let aoe10: double = b10.e;
      expect(aoe10).assertEqual(oes10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_POW_2100
     * @tc.name decimalPowTest021
     * @tc.desc Static pow chained operations and result formatting (5 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalPowTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. Decimal.pow(2,3).pow(2).toString() returns '64'
      let av1: string = Decimal.pow(2, 3).pow(2).toString();
      let ev1: string = '64';
      expect(av1).assertEqual(ev1);

      // 2. Decimal.pow(2,3).mul(2).toString() returns '16'
      let av2: string = Decimal.pow(2, 3).mul(2).toString();
      let ev2: string = '16';
      expect(av2).assertEqual(ev2);

      // 3. Decimal.pow(2,3).div(2).toString() returns '4'
      let av3: string = Decimal.pow(2, 3).div(2).toString();
      let ev3: string = '4';
      expect(av3).assertEqual(ev3);

      // 4. Decimal.pow(2,0.5).toSignificantDigits(10).toString() returns '1.414213562'
      let av4: string = Decimal.pow(2, 0.5).toSignificantDigits(10).toString();
      let ev4: string = '1.414213562';
      expect(av4).assertEqual(ev4);

      // 5. Decimal.pow(2,0.5).toPrecision(5).toString() returns '1.4142'
      let av5: string = Decimal.pow(2, 0.5).toPrecision(5).toString();
      let ev5: string = '1.4142';
      expect(av5).assertEqual(ev5);
    });
  });
}
