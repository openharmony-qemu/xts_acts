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

export default function decimalSumTest(): void {
  describe('DecimalSumTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      Decimal.set({ defaults: true });
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SUM_0100
     * @tc.name decimalSumTest001
     * @tc.desc Basic integer sum (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSumTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. sum(5) returns '5'
      let d01: Decimal = Decimal.sum(5);
      let actualValue01: string = d01.toString();
      let expectedValue01: string = '5';
      expect(actualValue01).assertEqual(expectedValue01);

      // 2. sum('7') returns '7'
      let d02: Decimal = Decimal.sum('7');
      let actualValue02: string = d02.toString();
      let expectedValue02: string = '7';
      expect(actualValue02).assertEqual(expectedValue02);

      // 3. sum(new Decimal(9)) returns '9'
      let n03: Decimal = new Decimal(9);
      let d03: Decimal = Decimal.sum(n03);
      let actualValue03: string = d03.toString();
      let expectedValue03: string = '9';
      expect(actualValue03).assertEqual(expectedValue03);

      // 4. sum(1, 2) returns '3'
      let d04: Decimal = Decimal.sum(1, 2);
      let actualValue04: string = d04.toString();
      let expectedValue04: string = '3';
      expect(actualValue04).assertEqual(expectedValue04);

      // 5. sum('1', '2', '3') returns '6'
      let d05: Decimal = Decimal.sum('1', '2', '3');
      let actualValue05: string = d05.toString();
      let expectedValue05: string = '6';
      expect(actualValue05).assertEqual(expectedValue05);

      // 6. sum(1, 2, 3, 4, 5) returns '15'
      let d06: Decimal = Decimal.sum(1, 2, 3, 4, 5);
      let actualValue06: string = d06.toString();
      let expectedValue06: string = '15';
      expect(actualValue06).assertEqual(expectedValue06);

      // 7. sum of 100 ones returns '100'
      let d07: Decimal = Decimal.sum(
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      );
      let actualValue07: string = d07.toString();
      let expectedValue07: string = '100';
      expect(actualValue07).assertEqual(expectedValue07);

      // 8. sum(0, 0, 0) returns '0'
      let d08: Decimal = Decimal.sum(0, 0, 0);
      let actualValue08: string = d08.toString();
      let expectedValue08: string = '0';
      expect(actualValue08).assertEqual(expectedValue08);

      // 9. sum(7, 8, 9) returns '24'
      let d09: Decimal = Decimal.sum(7, 8, 9);
      let actualValue09: string = d09.toString();
      let expectedValue09: string = '24';
      expect(actualValue09).assertEqual(expectedValue09);

      // 10. sum('100', '200', '300') returns '600'
      let d10: Decimal = Decimal.sum('100', '200', '300');
      let actualValue10: string = d10.toString();
      let expectedValue10: string = '600';
      expect(actualValue10).assertEqual(expectedValue10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SUM_0200
     * @tc.name decimalSumTest002
     * @tc.desc String numeric literals (8 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSumTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. sum(1, '0x10') returns '17' (hex literal)
      let d01: Decimal = Decimal.sum(1, '0x10');
      let actualValue01: string = d01.toString();
      let expectedValue01: string = '17';
      expect(actualValue01).assertEqual(expectedValue01);

      // 2. sum(1, '0b101') returns '6' (binary literal)
      let d02: Decimal = Decimal.sum(1, '0b101');
      let actualValue02: string = d02.toString();
      let expectedValue02: string = '6';
      expect(actualValue02).assertEqual(expectedValue02);

      // 3. sum(1, '0o17') returns '16' (octal literal)
      let d03: Decimal = Decimal.sum(1, '0o17');
      let actualValue03: string = d03.toString();
      let expectedValue03: string = '16';
      expect(actualValue03).assertEqual(expectedValue03);

      // 4. sum of 10000-char '9' string plus '1' returns '1e+10000'
      let longValue04: string = '9'.repeat(10000);
      let d04: Decimal = Decimal.sum(longValue04, '1');
      let actualValue04: string = d04.toString();
      let expectedValue04: string = '1e+10000';
      expect(actualValue04).assertEqual(expectedValue04);

      // 5. sum('9007199254740991', 1) returns '9007199254740992' (MAX_SAFE_INTEGER + 1)
      let d05: Decimal = Decimal.sum('9007199254740991', 1);
      let actualValue05: string = d05.toString();
      let expectedValue05: string = '9007199254740992';
      expect(actualValue05).assertEqual(expectedValue05);

      // 6. sum('9.999999999999999999', '0.000000000000000001') returns '10'
      let d06: Decimal = Decimal.sum('9.999999999999999999', '0.000000000000000001');
      let actualValue06: string = d06.toString();
      let expectedValue06: string = '10';
      expect(actualValue06).assertEqual(expectedValue06);

      // 7. sum of ten '0.1' strings returns '1'
      let d07: Decimal = Decimal.sum('0.1', '0.1', '0.1', '0.1', '0.1', '0.1', '0.1', '0.1', '0.1', '0.1');
      let actualValue07: string = d07.toString();
      let expectedValue07: string = '1';
      expect(actualValue07).assertEqual(expectedValue07);

      // 8. sum(a, a) where a = new Decimal('0.12345678901234567890') returns '0.2469135780246913578'
      let a08: Decimal = new Decimal('0.12345678901234567890');
      let d08: Decimal = Decimal.sum(a08, a08);
      let actualValue08: string = d08.toString();
      let expectedValue08: string = '0.2469135780246913578';
      expect(actualValue08).assertEqual(expectedValue08);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SUM_0300
     * @tc.name decimalSumTest003
     * @tc.desc Mixed type args (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSumTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. sum(1, '42') returns '43' (int + string)
      let d01: Decimal = Decimal.sum(1, '42');
      let actualValue01: string = d01.toString();
      let expectedValue01: string = '43';
      expect(actualValue01).assertEqual(expectedValue01);

      // 2. sum(1, new Decimal(0.5)) returns '1.5' (int + Decimal)
      let n02: Decimal = new Decimal(0.5);
      let d02: Decimal = Decimal.sum(1, n02);
      let actualValue02: string = d02.toString();
      let expectedValue02: string = '1.5';
      expect(actualValue02).assertEqual(expectedValue02);

      // 3. sum(1, new Decimal(new Decimal('4'))) returns '5' (int + nested Decimal)
      let n03: Decimal = new Decimal(new Decimal('4'));
      let d03: Decimal = Decimal.sum(1, n03);
      let actualValue03: string = d03.toString();
      let expectedValue03: string = '5';
      expect(actualValue03).assertEqual(expectedValue03);

      // 4. sum('1', 2, new Decimal(3)) returns '6' (string + int + Decimal)
      let d04: Decimal = Decimal.sum('1', 2, new Decimal(3));
      let actualValue04: string = d04.toString();
      let expectedValue04: string = '6';
      expect(actualValue04).assertEqual(expectedValue04);

      // 5. sum(new Decimal('2.5'), new Decimal('3.5')) returns '6' (two Decimals)
      let actualValue05: string = Decimal.sum(new Decimal('2.5'), new Decimal('3.5')).toString();
      let expectedValue05: string = '6';
      expect(actualValue05).assertEqual(expectedValue05);

      // 6. sum('1.1', new Decimal('2.2')) returns '3.3' (string + Decimal)
      let actualValue06: string = Decimal.sum('1.1', new Decimal('2.2')).toString();
      let expectedValue06: string = '3.3';
      expect(actualValue06).assertEqual(expectedValue06);

      // 7. sum(5, '6.5') returns '11.5' (int + decimal string)
      let actualValue07: string = Decimal.sum(5, '6.5').toString();
      let expectedValue07: string = '11.5';
      expect(actualValue07).assertEqual(expectedValue07);

      // 8. sum('1.25', '1.75') returns '3' (two decimal strings)
      let actualValue08: string = Decimal.sum('1.25', '1.75').toString();
      let expectedValue08: string = '3';
      expect(actualValue08).assertEqual(expectedValue08);

      // 9. sum('9999999999999999', '1').comparedTo('10000000000000000') returns 0
      let actualValue09: number = Decimal.sum('9999999999999999', '1').comparedTo('10000000000000000');
      let expectedValue09: int = 0;
      expect(actualValue09).assertEqual(expectedValue09);

      // 10. sum('1.5', '2.5', '3.5').comparedTo(7.5) returns 0
      let actualValue10: number = Decimal.sum('1.5', '2.5', '3.5').comparedTo(7.5);
      let expectedValue10: int = 0;
      expect(actualValue10).assertEqual(expectedValue10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SUM_0400
     * @tc.name decimalSumTest004
     * @tc.desc Negative numbers and value equality (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSumTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. sum(1, '-7') returns '-6'
      let d01: Decimal = Decimal.sum(1, '-7');
      let actualValue01: string = d01.toString();
      let expectedValue01: string = '-6';
      expect(actualValue01).assertEqual(expectedValue01);

      // 2. sum(1, '-0.25') returns '0.75'
      let d02: Decimal = Decimal.sum(1, '-0.25');
      let actualValue02: string = d02.toString();
      let expectedValue02: string = '0.75';
      expect(actualValue02).assertEqual(expectedValue02);

      // 3. sum(3, -1) returns '2'
      let d03: Decimal = Decimal.sum(3, -1);
      let actualValue03: string = d03.toString();
      let expectedValue03: string = '2';
      expect(actualValue03).assertEqual(expectedValue03);

      // 4. sum(1, new Decimal('-3')) returns '-2'
      let n04: Decimal = new Decimal('-3');
      let d04: Decimal = Decimal.sum(1, n04);
      let actualValue04: string = d04.toString();
      let expectedValue04: string = '-2';
      expect(actualValue04).assertEqual(expectedValue04);

      // 5. sum('5', -3, new Decimal('2')) returns '4'
      let d05: Decimal = Decimal.sum('5', -3, new Decimal('2'));
      let actualValue05: string = d05.toString();
      let expectedValue05: string = '4';
      expect(actualValue05).assertEqual(expectedValue05);

      // 6. sum('-10', '-3', '-7') returns '-20'
      let actualValue06: string = Decimal.sum('-10', '-3', '-7').toString();
      let expectedValue06: string = '-20';
      expect(actualValue06).assertEqual(expectedValue06);

      // 7. sum('3', '-8', '10') returns '5'
      let actualValue07: string = Decimal.sum('3', '-8', '10').toString();
      let expectedValue07: string = '5';
      expect(actualValue07).assertEqual(expectedValue07);

      // 8. sum('3', '4', '5').equals('12') returns true
      let actualValue08: boolean = Decimal.sum('3', '4', '5').equals('12');
      expect(actualValue08).assertTrue();

      // 9. Two separate sum('5', '5') calls produce different object identities
      const r1_09: Decimal = Decimal.sum('5', '5');
      const r2_09: Decimal = Decimal.sum('5', '5');
      expect(r1_09).not().assertEqual(r2_09);

      // 10. Two separate sum('5', '5') calls produce value-equal results
      const r1_10: Decimal = Decimal.sum('5', '5');
      const r2_10: Decimal = Decimal.sum('5', '5');
      let actualValue10: boolean = r1_10.equals(r2_10);
      expect(actualValue10).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SUM_0500
     * @tc.name decimalSumTest005
     * @tc.desc Nested sum and sum-vs-add equivalence (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSumTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. sum(sum(1, 2), 3) returns '6'
      let d01: Decimal = Decimal.sum(Decimal.sum(1, 2), 3);
      let actualValue01: string = d01.toString();
      let expectedValue01: string = '6';
      expect(actualValue01).assertEqual(expectedValue01);

      // 2. sum(sum('1', '2'), '3') returns '6'
      let actualValue02: string = Decimal.sum(Decimal.sum('1', '2'), '3').toString();
      let expectedValue02: string = '6';
      expect(actualValue02).assertEqual(expectedValue02);

      // 3. sum('1', '2').add('3') returns '6'
      let actualValue03: string = Decimal.sum('1', '2').add('3').toString();
      let expectedValue03: string = '6';
      expect(actualValue03).assertEqual(expectedValue03);

      // 4. sum(sum('4', 5), new Decimal('6')) returns '15'
      let actualValue04: string = Decimal.sum(Decimal.sum('4', 5), new Decimal('6')).toString();
      let expectedValue04: string = '15';
      expect(actualValue04).assertEqual(expectedValue04);

      // 5. sum(sum(sum('1', '2'), '3'), '4') returns '10'
      let actualValue05: string = Decimal.sum(Decimal.sum(Decimal.sum('1', '2'), '3'), '4').toString();
      let expectedValue05: string = '10';
      expect(actualValue05).assertEqual(expectedValue05);

      // 6. sum is associative: sum(sum('1','2'),'3').equals(sum('1',sum('2','3'))) returns true
      let actualValue06: boolean = Decimal.sum(Decimal.sum('1', '2'), '3').equals(
        Decimal.sum('1', Decimal.sum('2', '3')),
      );
      expect(actualValue06).assertTrue();

      // 7. sum('2.5', '1.5') equals new Decimal('2.5').add('1.5') toString
      const st07: Decimal = Decimal.sum('2.5', '1.5');
      const inst07: Decimal = new Decimal('2.5').add('1.5');
      let actualValue07: string = st07.toString();
      let expectedValue07: string = inst07.toString();
      expect(actualValue07).assertEqual(expectedValue07);

      // 8. sum('0.1', '0.2', '0.3') equals chained add toString
      const st08: Decimal = Decimal.sum('0.1', '0.2', '0.3');
      const inst08: Decimal = new Decimal('0.1').add('0.2').add('0.3');
      let actualValue08: string = st08.toString();
      let expectedValue08: string = inst08.toString();
      expect(actualValue08).assertEqual(expectedValue08);

      // 9. sum(x, y).equals(x.add(y)) returns true for x='3.14', y='1.86'
      const x09: Decimal = new Decimal('3.14');
      const y09: Decimal = new Decimal('1.86');
      let actualValue09: boolean = Decimal.sum(x09, y09).equals(x09.add(y09));
      expect(actualValue09).assertTrue();

      // 10. sum(3, 4).toNumber() equals new Decimal(3).add(4).toNumber()
      const st10: Decimal = Decimal.sum(3, 4);
      const inst10: Decimal = new Decimal(3).add(4);
      let actualValue10: number = st10.toNumber();
      let expectedValue10: number = inst10.toNumber();
      expect(actualValue10).assertEqual(expectedValue10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SUM_0600
     * @tc.name decimalSumTest006
     * @tc.desc Coefficient exponent and sign internals (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSumTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. sum('2', '3', '4') produces Array-backed coefficient and value '9'
      let actualValue01: boolean = Decimal.sum('2', '3', '4').d instanceof Array;
      expect(actualValue01).assertTrue();
      const actualSum01: string = Decimal.sum('2', '3', '4').toString();
      const expectedSum01: string = '9';
      expect(actualSum01).assertEqual(expectedSum01);

      // 2. sum(10, 20, 30).toNumber() returns 60
      let actualValue02: number = Decimal.sum(10, 20, 30).toNumber();
      let expectedValue02: int = 60;
      expect(actualValue02).assertEqual(expectedValue02);

      // 3. sum('100', '200').e returns 2
      let actualValue03: number = Decimal.sum('100', '200').e;
      let expectedValue03: int = 2;
      expect(actualValue03).assertEqual(expectedValue03);

      // 4. sum('0.1', '0.2').e returns -1
      let actualValue04: number = Decimal.sum('0.1', '0.2').e;
      let expectedValue04: int = -1;
      expect(actualValue04).assertEqual(expectedValue04);

      // 5. sum('123', '456').d!.length returns 1
      let actualValue05: int = Decimal.sum('123', '456').d!.length;
      let expectedValue05: int = 1;
      expect(actualValue05).assertEqual(expectedValue05);

      // 6. sum('123', '456').d![0] returns 579
      let actualValue06: number = Decimal.sum('123', '456').d![0];
      let expectedValue06: int = 579;
      expect(actualValue06).assertEqual(expectedValue06);

      // 7. sum('12.5', '0.5').d! has length 1 and d![0] is 13
      const digits07: Array<double> = Decimal.sum('12.5', '0.5').d!;
      let observed07: int = digits07.length;
      let expectedLength07: int = 1;
      expect(observed07).assertEqual(expectedLength07);
      let actualValue07: number = digits07[0];
      let expectedValue07: int = 13;
      expect(actualValue07).assertEqual(expectedValue07);

      // 8. Decimal.sign(sum('1', '2', '3')) returns 1
      let actualValue08: number = Decimal.sign(Decimal.sum('1', '2', '3'));
      let expectedValue08: int = 1;
      expect(actualValue08).assertEqual(expectedValue08);

      // 9. Decimal.sign(sum('-1', '-2', '-3')) returns -1
      let actualValue09: number = Decimal.sign(Decimal.sum('-1', '-2', '-3'));
      let expectedValue09: int = -1;
      expect(actualValue09).assertEqual(expectedValue09);

      // 10. Decimal.sign(sum('9', '-9', '0')) returns 0
      let actualValue10: number = Decimal.sign(Decimal.sum('9', '-9', '0'));
      let expectedValue10: int = 0;
      expect(actualValue10).assertEqual(expectedValue10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SUM_0700
     * @tc.name decimalSumTest007
     * @tc.desc Predicate methods and minus-zero handling (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSumTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. sum('0', '0').isZero() returns true
      let actualValue01: boolean = Decimal.sum('0', '0').isZero();
      expect(actualValue01).assertTrue();

      // 2. sum('3', '-8', '-1').isNegative() returns true
      let actualValue02: boolean = Decimal.sum('3', '-8', '-1').isNegative();
      expect(actualValue02).assertTrue();

      // 3. sum('3', '8', '1').isPositive() returns true
      let actualValue03: boolean = Decimal.sum('3', '8', '1').isPositive();
      expect(actualValue03).assertTrue();

      // 4. sum('1.5', '2.5', '1.0').isInteger() returns true
      let actualValue04: boolean = Decimal.sum('1.5', '2.5', '1.0').isInteger();
      expect(actualValue04).assertTrue();

      // 5. sum('0.1', '0.2', '0.1').isInteger() returns false
      let actualValue05: boolean = Decimal.sum('0.1', '0.2', '0.1').isInteger();
      expect(actualValue05).assertFalse();

      // 6. sum('0.1', '0.2').isFinite() returns true
      let actualValue06: boolean = Decimal.sum('0.1', '0.2').isFinite();
      expect(actualValue06).assertTrue();

      // 7. sum('-0', '0', '1').isNegative() returns false (SameValueZero)
      let actualValue07: boolean = Decimal.sum('-0', '0', '1').isNegative();
      expect(actualValue07).assertFalse();

      // 8. sum(0, -0).isNegative() returns false (SameValueZero for double -0)
      let d08: Decimal = Decimal.sum(0, -0);
      let actualValue08: boolean = d08.isNegative();
      expect(actualValue08).assertFalse();

      // 9. sum(Number.POSITIVE_INFINITY, '1', '2').isFinite() returns false
      let actualValue09: boolean = Decimal.sum(Number.POSITIVE_INFINITY, '1', '2').isFinite();
      expect(actualValue09).assertFalse();

      // 10. sum('1', -Number.POSITIVE_INFINITY, '2').isFinite() returns false
      let actualValue10: boolean = Decimal.sum('1', -Number.POSITIVE_INFINITY, '2').isFinite();
      expect(actualValue10).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SUM_0800
     * @tc.name decimalSumTest008
     * @tc.desc Invalid inputs and immutability (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSumTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. sum(1, ' ') throws error code 401 (whitespace string)
      let ws01: string = ' ';
      try {
        Decimal.sum(1, ws01);
        expect().assertFail();
      } catch (err01) {
        expect(err01.code).assertEqual(401);
      }

      // 2. sum(1, zero-width-space) throws error code 401
      try {
        Decimal.sum(1, '​');
        expect().assertFail();
      } catch (err02) {
        expect(err02.code).assertEqual(401);
      }

      // 3. sum(1, '一二三') throws error code 401 (CJK characters)
      try {
        Decimal.sum(1, '一二三');
        expect().assertFail();
      } catch (err03) {
        expect(err03.code).assertEqual(401);
      }

      // 4. sum(1, '1.5😀') throws error code 401 (emoji in numeric string)
      try {
        Decimal.sum(1, '1.5😀');
        expect().assertFail();
      } catch (err04) {
        expect(err04.code).assertEqual(401);
      }

      // 5. sum(1, '<script>alert(1)</script>') throws error code 401 (XSS payload)
      try {
        Decimal.sum(1, '<script>alert(1)</script>');
        expect().assertFail();
      } catch (err05) {
        expect(err05.code).assertEqual(401);
      }

      // 6. sum('1', y) does not mutate y where y is new Decimal('4.5')
      const y06: Decimal = new Decimal('4.5');
      Decimal.sum('1', y06);
      let actualValue06: string = y06.toString();
      let expectedValue06: string = '4.5';
      expect(actualValue06).assertEqual(expectedValue06);

      // 7. sum(x, '1') does not mutate x where x is new Decimal('-9'); x stays negative
      const x07: Decimal = new Decimal('-9');
      const originalValueSnapshot07: string = x07.toString();
      const expectedOriginalValue07: string = '-9';
      expect(originalValueSnapshot07).assertEqual(expectedOriginalValue07);
      const originalDigitsSnapshot07: Array<double> = x07.d!.slice(0);
      const originalLengthSnapshot07: int = originalDigitsSnapshot07.length;
      const originalSignSnapshot07: double = x07.s;
      const originalExponentSnapshot07: double = x07.e;
      Decimal.sum(x07, '1');
      let actualValue07: boolean = x07.isNegative();
      expect(actualValue07).assertTrue();
      const actualOriginalValue07: string = x07.toString();
      expect(actualOriginalValue07).assertEqual(expectedOriginalValue07);
      const actualOriginalDigits07: Array<double> = x07.d!;
      const actualOriginalLength07: int = actualOriginalDigits07.length;
      expect(actualOriginalLength07).assertEqual(originalLengthSnapshot07);
      for (let coefficientIndex07: int = 0; coefficientIndex07 < originalLengthSnapshot07; coefficientIndex07++) {
        const actualCoefficient07: double = actualOriginalDigits07[coefficientIndex07];
        const expectedCoefficient07: double = originalDigitsSnapshot07[coefficientIndex07];
        expect(actualCoefficient07).assertEqual(expectedCoefficient07);
      }
      const actualOriginalSign07: double = x07.s;
      expect(actualOriginalSign07).assertEqual(originalSignSnapshot07);
      const actualOriginalExponent07: double = x07.e;
      expect(actualOriginalExponent07).assertEqual(originalExponentSnapshot07);

      // 8. sum('1', y) does not mutate y where y is new Decimal('250'); y.e stays 2
      const y08: Decimal = new Decimal('250');
      const originalValueSnapshot08: string = y08.toString();
      const expectedOriginalValue08: string = '250';
      expect(originalValueSnapshot08).assertEqual(expectedOriginalValue08);
      const originalDigitsSnapshot08: Array<double> = y08.d!.slice(0);
      const originalLengthSnapshot08: int = originalDigitsSnapshot08.length;
      const originalSignSnapshot08: double = y08.s;
      const originalExponentSnapshot08: double = y08.e;
      Decimal.sum('1', y08);
      let actualValue08: number = y08.e;
      let expectedValue08: int = 2;
      expect(actualValue08).assertEqual(expectedValue08);
      const actualOriginalValue08: string = y08.toString();
      expect(actualOriginalValue08).assertEqual(expectedOriginalValue08);
      const actualOriginalDigits08: Array<double> = y08.d!;
      const actualOriginalLength08: int = actualOriginalDigits08.length;
      expect(actualOriginalLength08).assertEqual(originalLengthSnapshot08);
      for (let coefficientIndex08: int = 0; coefficientIndex08 < originalLengthSnapshot08; coefficientIndex08++) {
        const actualCoefficient08: double = actualOriginalDigits08[coefficientIndex08];
        const expectedCoefficient08: double = originalDigitsSnapshot08[coefficientIndex08];
        expect(actualCoefficient08).assertEqual(expectedCoefficient08);
      }
      const actualOriginalSign08: double = y08.s;
      expect(actualOriginalSign08).assertEqual(originalSignSnapshot08);
      const actualOriginalExponent08: double = y08.e;
      expect(actualOriginalExponent08).assertEqual(originalExponentSnapshot08);

      // 9. sum(x, '1') does not mutate x where x is new Decimal('1234.56'); d!.length unchanged
      const x09: Decimal = new Decimal('1234.56');
      const before09: number = x09.d!.length;
      const originalValueSnapshot09: string = x09.toString();
      const expectedOriginalValue09: string = '1234.56';
      expect(originalValueSnapshot09).assertEqual(expectedOriginalValue09);
      const originalDigitsSnapshot09: Array<double> = x09.d!.slice(0);
      const originalLengthSnapshot09: int = originalDigitsSnapshot09.length;
      const originalSignSnapshot09: double = x09.s;
      const originalExponentSnapshot09: double = x09.e;
      Decimal.sum(x09, '1');
      let actualValue09: int = x09.d!.length;
      let expectedValue09: number = before09;
      expect(actualValue09).assertEqual(expectedValue09);
      const actualOriginalValue09: string = x09.toString();
      expect(actualOriginalValue09).assertEqual(expectedOriginalValue09);
      const actualOriginalDigits09: Array<double> = x09.d!;
      const actualOriginalLength09: int = actualOriginalDigits09.length;
      expect(actualOriginalLength09).assertEqual(originalLengthSnapshot09);
      for (let coefficientIndex09: int = 0; coefficientIndex09 < originalLengthSnapshot09; coefficientIndex09++) {
        const actualCoefficient09: double = actualOriginalDigits09[coefficientIndex09];
        const expectedCoefficient09: double = originalDigitsSnapshot09[coefficientIndex09];
        expect(actualCoefficient09).assertEqual(expectedCoefficient09);
      }
      const actualOriginalSign09: double = x09.s;
      expect(actualOriginalSign09).assertEqual(originalSignSnapshot09);
      const actualOriginalExponent09: double = x09.e;
      expect(actualOriginalExponent09).assertEqual(originalExponentSnapshot09);

      // 10. sum(x, '1') does not mutate x where x is new Decimal('555'); d![0] unchanged
      const x10: Decimal = new Decimal('555');
      const digit0Snapshot10: number = x10.d![0];
      const originalValueSnapshot10: string = x10.toString();
      const expectedOriginalValue10: string = '555';
      expect(originalValueSnapshot10).assertEqual(expectedOriginalValue10);
      const originalDigitsSnapshot10: Array<double> = x10.d!.slice(0);
      const originalLengthSnapshot10: int = originalDigitsSnapshot10.length;
      const originalSignSnapshot10: double = x10.s;
      const originalExponentSnapshot10: double = x10.e;
      Decimal.sum(x10, '1');
      let actualValue10: number = x10.d![0];
      let expectedValue10: number = digit0Snapshot10;
      expect(actualValue10).assertEqual(expectedValue10);
      const actualOriginalValue10: string = x10.toString();
      expect(actualOriginalValue10).assertEqual(expectedOriginalValue10);
      const actualOriginalDigits10: Array<double> = x10.d!;
      const actualOriginalLength10: int = actualOriginalDigits10.length;
      expect(actualOriginalLength10).assertEqual(originalLengthSnapshot10);
      for (let coefficientIndex10: int = 0; coefficientIndex10 < originalLengthSnapshot10; coefficientIndex10++) {
        const actualCoefficient10: double = actualOriginalDigits10[coefficientIndex10];
        const expectedCoefficient10: double = originalDigitsSnapshot10[coefficientIndex10];
        expect(actualCoefficient10).assertEqual(expectedCoefficient10);
      }
      const actualOriginalSign10: double = x10.s;
      expect(actualOriginalSign10).assertEqual(originalSignSnapshot10);
      const actualOriginalExponent10: double = x10.e;
      expect(actualOriginalExponent10).assertEqual(originalExponentSnapshot10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SUM_0900
     * @tc.name decimalSumTest009
     * @tc.desc NaN and Infinity special values (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSumTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. sum(1, 'NaN') returns 'NaN'
      let d01: Decimal = Decimal.sum(1, 'NaN');
      let actualValue01: string = d01.toString();
      let expectedValue01: string = 'NaN';
      expect(actualValue01).assertEqual(expectedValue01);

      // 2. sum(1, 'Infinity') returns 'Infinity'
      let d02: Decimal = Decimal.sum(1, 'Infinity');
      let actualValue02: string = d02.toString();
      let expectedValue02: string = 'Infinity';
      expect(actualValue02).assertEqual(expectedValue02);

      // 3. sum(1, '-Infinity') returns '-Infinity'
      let d03: Decimal = Decimal.sum(1, '-Infinity');
      let actualValue03: string = d03.toString();
      let expectedValue03: string = '-Infinity';
      expect(actualValue03).assertEqual(expectedValue03);

      // 4. sum(Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY).isNaN() returns true
      let d04: Decimal = Decimal.sum(Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY);
      let actualValue04: boolean = d04.isNaN();
      expect(actualValue04).assertTrue();

      // 5. sum('1', 2, Number.NaN) returns 'NaN'
      let d05: Decimal = Decimal.sum('1', 2, Number.NaN);
      let actualValue05: string = d05.toString();
      let expectedValue05: string = 'NaN';
      expect(actualValue05).assertEqual(expectedValue05);

      // 6. sum(1, '2', Number.POSITIVE_INFINITY, 4) returns 'Infinity'
      let d06: Decimal = Decimal.sum(1, '2', Number.POSITIVE_INFINITY, 4);
      let actualValue06: string = d06.toString();
      let expectedValue06: string = 'Infinity';
      expect(actualValue06).assertEqual(expectedValue06);

      // 7. sum(1, '2', -Number.POSITIVE_INFINITY, 4) returns '-Infinity'
      let d07: Decimal = Decimal.sum(1, '2', -Number.POSITIVE_INFINITY, 4);
      let actualValue07: string = d07.toString();
      let expectedValue07: string = '-Infinity';
      expect(actualValue07).assertEqual(expectedValue07);

      // 8. sum(Number.POSITIVE_INFINITY, 1, -Number.POSITIVE_INFINITY).isNaN() returns true
      let d08: Decimal = Decimal.sum(Number.POSITIVE_INFINITY, 1, -Number.POSITIVE_INFINITY);
      let actualValue08: boolean = d08.isNaN();
      expect(actualValue08).assertTrue();

      // 9. sum(Number.NaN, '1').isNaN() returns true
      let actualValue09: boolean = Decimal.sum(Number.NaN, '1').isNaN();
      expect(actualValue09).assertTrue();

      // 10. sum('Infinity', '-Infinity').isNaN() returns true
      let actualValue10: boolean = Decimal.sum('Infinity', '-Infinity').isNaN();
      expect(actualValue10).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SUM_1000
     * @tc.name decimalSumTest010
     * @tc.desc NaN Infinity conversions and double limits (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSumTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. sum(new Decimal(Number.NaN), '1').isNaN() returns true
      let actualValue01: boolean = Decimal.sum(new Decimal(Number.NaN), '1').isNaN();
      expect(actualValue01).assertTrue();

      // 2. sum(Number.NaN, '5').toString() returns 'NaN'
      let actualValue02: string = Decimal.sum(Number.NaN, '5').toString();
      let expectedValue02: string = 'NaN';
      expect(actualValue02).assertEqual(expectedValue02);

      // 3. sum('-Infinity', '0').toNumber() returns -Infinity
      let actualValue03: number = Decimal.sum('-Infinity', '0').toNumber();
      let expectedValue03: number = -Number.POSITIVE_INFINITY;
      expect(actualValue03).assertEqual(expectedValue03);

      // 4. sum(0.1 + 0.2) returns '0.30000000000000004' (float precision)
      let v04: double = 0.1 + 0.2;
      let d04: Decimal = Decimal.sum(v04);
      let actualValue04: string = d04.toString();
      let expectedValue04: string = '0.30000000000000004';
      expect(actualValue04).assertEqual(expectedValue04);

      // 5. sum(1.7976931348623157e308 x2) comparedTo('3.5953862697246314e+308') returns 0 (MAX_DOUBLE)
      let r05: Decimal = Decimal.sum(1.7976931348623157e308, 1.7976931348623157e308);
      let actualValue05: number = r05.comparedTo(new Decimal('3.5953862697246314e+308'));
      let expectedValue05: int = 0;
      expect(actualValue05).assertEqual(expectedValue05);

      // 6. sum(5e-324, 5e-324).equals(new Decimal('1e-323')) returns true (MIN_DOUBLE)
      let r06: Decimal = Decimal.sum(5e-324, 5e-324);
      let actualValue06: boolean = r06.equals(new Decimal('1e-323'));
      expect(actualValue06).assertTrue();

      // 7. sum('9.99e+9000000000000000', '9.99e+9000000000000000').isFinite() returns false (overflow)
      let d07: Decimal = Decimal.sum('9.99e+9000000000000000', '9.99e+9000000000000000');
      let actualValue07: boolean = d07.isFinite();
      expect(actualValue07).assertFalse();

      // 8. sum('0.0000000001', '0.0000000002', '0.0000000003').comparedTo('0.0000000006') returns 0
      let actualValue08: number = Decimal.sum('0.0000000001', '0.0000000002', '0.0000000003').comparedTo('0.0000000006');
      let expectedValue08: int = 0;
      expect(actualValue08).assertEqual(expectedValue08);

      // 9. sum('1e10', '2e10', '3e10').toNumber() returns 60000000000
      let actualValue09: number = Decimal.sum('1e10', '2e10', '3e10').toNumber();
      let expectedValue09: long = 60000000000;
      expect(actualValue09).assertEqual(expectedValue09);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SUM_1100
     * @tc.name decimalSumTest011
     * @tc.desc Decimal set precision and rounding config (5 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSumTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. Decimal.set({ precision: 5 }) affects subsequent div probe; sum does not leak config
      Decimal.set({ precision: 5 });
      Decimal.sum('1', '2', '3');
      const probe01: Decimal = new Decimal('1').div(3);
      let actualValue01: string = probe01.toString();
      let expectedValue01: string = '0.33333';
      expect(actualValue01).assertEqual(expectedValue01);
      Decimal.set({ defaults: true });

      // 2. precision 3, rounding ROUND_DOWN: sum('124.44', '0.01') returns '124'
      Decimal.set({ precision: 3, rounding: 1 });
      const r02: Decimal = Decimal.sum('124.44', '0.01');
      let actualValue02: string = r02.toString();
      let expectedValue02: string = '124';
      expect(actualValue02).assertEqual(expectedValue02);
      Decimal.set({ defaults: true });

      // 3. precision 3, rounding ROUND_UP: sum('124.44', '0.01') returns '125'
      Decimal.set({ precision: 3, rounding: 0 });
      const r03: Decimal = Decimal.sum('124.44', '0.01');
      let actualValue03: string = r03.toString();
      let expectedValue03: string = '125';
      expect(actualValue03).assertEqual(expectedValue03);
      Decimal.set({ defaults: true });

      // 4. set precision 3 then defaults; sum('0.1', '0.2') returns '0.3' (config reset)
      Decimal.set({ precision: 3 });
      Decimal.sum('1', '2');
      Decimal.set({ defaults: true });
      const r04: Decimal = Decimal.sum('0.1', '0.2');
      let actualValue04: string = r04.toString();
      let expectedValue04: string = '0.3';
      expect(actualValue04).assertEqual(expectedValue04);

      // 5. precision 2, rounding ROUND_HALF_UP: sum('0.125', '0.001') returns '0.13'
      Decimal.set({ precision: 2, rounding: 4 });
      const r05: Decimal = Decimal.sum('0.125', '0.001');
      let actualValue05: string = r05.toString();
      let expectedValue05: string = '0.13';
      expect(actualValue05).assertEqual(expectedValue05);
      Decimal.set({ defaults: true });
    });
  });
}
