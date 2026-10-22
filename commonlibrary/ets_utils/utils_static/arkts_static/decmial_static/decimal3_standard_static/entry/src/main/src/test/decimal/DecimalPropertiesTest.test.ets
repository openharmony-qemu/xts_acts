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

export default function decimalPropertiesTest(): void {
  describe('DecimalPropertiesTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      Decimal.set({ defaults: true });
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_0100
     * @tc.name decimalPropertiesTest001
     * @tc.desc d coefficient array contents from basic construction (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalPropertiesTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // A1. '0.05' coefficient d[0] equals 500000
      let a1D: Decimal = new Decimal('0.05');
      let a1Digits: Array<double> | null = a1D.d;
      expect(a1Digits).not().assertNull();
      let a1Actual: number = a1Digits![0];
      let a1Expected: int = 500000;
      expect(a1Actual).assertEqual(a1Expected);

      // A2. '123.45' coefficient digits [123,4500000], e=2, s=1
      let a2D: Decimal = new Decimal('123.45');
      let a2Digits: Array<double> | null = a2D.d;
      expect(a2Digits).not().assertNull();
      let a2ExpectedDigits: double[] = [123, 4500000];
      let a2LenActual: int = a2Digits!.length;
      let a2LenExpected: int = a2ExpectedDigits.length;
      expect(a2LenActual).assertEqual(a2LenExpected);
      for (let a2Idx: int = 0; a2Idx < a2ExpectedDigits.length; a2Idx++) {
        let a2V1: double = a2Digits![a2Idx];
        let a2V2: double = a2ExpectedDigits[a2Idx];
        expect(a2V1).assertEqual(a2V2);
      }
      let a2E: double = a2D.e;
      expect(a2E).assertEqual(2);
      let a2S: double = a2D.s;
      expect(a2S).assertEqual(1);

      // A3. number 123.45 coefficient digits [123,4500000], e=2, s=1
      let a3D: Decimal = new Decimal(123.45);
      let a3Digits: Array<double> | null = a3D.d;
      expect(a3Digits).not().assertNull();
      let a3ExpectedDigits: double[] = [123, 4500000];
      let a3LenActual: int = a3Digits!.length;
      let a3LenExpected: int = a3ExpectedDigits.length;
      expect(a3LenActual).assertEqual(a3LenExpected);
      for (let a3Idx: int = 0; a3Idx < a3ExpectedDigits.length; a3Idx++) {
        let a3V1: double = a3Digits![a3Idx];
        let a3V2: double = a3ExpectedDigits[a3Idx];
        expect(a3V1).assertEqual(a3V2);
      }
      let a3E: double = a3D.e;
      expect(a3E).assertEqual(2);
      let a3S: double = a3D.s;
      expect(a3S).assertEqual(1);

      // A4. '123' coefficient digits [123], e=2, s=1
      let a4D: Decimal = new Decimal('123');
      let a4Digits: Array<double> | null = a4D.d;
      expect(a4Digits).not().assertNull();
      let a4ExpectedDigits: double[] = [123];
      let a4LenActual: int = a4Digits!.length;
      let a4LenExpected: int = a4ExpectedDigits.length;
      expect(a4LenActual).assertEqual(a4LenExpected);
      for (let a4Idx: int = 0; a4Idx < a4ExpectedDigits.length; a4Idx++) {
        let a4V1: double = a4Digits![a4Idx];
        let a4V2: double = a4ExpectedDigits[a4Idx];
        expect(a4V1).assertEqual(a4V2);
      }
      let a4E: double = a4D.e;
      expect(a4E).assertEqual(2);
      let a4S: double = a4D.s;
      expect(a4S).assertEqual(1);

      // A5. '7' coefficient length 1 and d[0]=7
      let a5D: Decimal = new Decimal('7');
      let a5Digits: Array<double> | null = a5D.d;
      expect(a5Digits).not().assertNull();
      let a5LenActual: int = a5Digits!.length;
      expect(a5LenActual).assertEqual(1);
      let a5ValActual: number = a5Digits![0];
      expect(a5ValActual).assertEqual(7);

      // A6. '0.00123' coefficient digits [12300], e=-3, s=1
      let a6D: Decimal = new Decimal('0.00123');
      let a6Digits: Array<double> | null = a6D.d;
      expect(a6Digits).not().assertNull();
      let a6ExpectedDigits: double[] = [12300];
      let a6LenActual: int = a6Digits!.length;
      let a6LenExpected: int = a6ExpectedDigits.length;
      expect(a6LenActual).assertEqual(a6LenExpected);
      for (let a6Idx: int = 0; a6Idx < a6ExpectedDigits.length; a6Idx++) {
        let a6V1: double = a6Digits![a6Idx];
        let a6V2: double = a6ExpectedDigits[a6Idx];
        expect(a6V1).assertEqual(a6V2);
      }
      let a6E: double = a6D.e;
      expect(a6E).assertEqual(-3);
      let a6S: double = a6D.s;
      expect(a6S).assertEqual(1);

      // A7. '1e5' coefficient length 1, d[0]=100000, e=5
      let a7D: Decimal = new Decimal('1e5');
      let a7Digits: Array<double> | null = a7D.d;
      expect(a7Digits).not().assertNull();
      let a7LenActual: int = a7Digits!.length;
      expect(a7LenActual).assertEqual(1);
      let a7ValActual: number = a7Digits![0];
      expect(a7ValActual).assertEqual(100000);
      let a7E: number = a7D.e;
      expect(a7E).assertEqual(5);

      // A8. 0.1+0.2 coefficient digits [3000000,0,40000], e=-1, s=1
      let a8Sum: double = 0.1 + 0.2;
      let a8D: Decimal = new Decimal(a8Sum);
      let a8Digits: Array<double> | null = a8D.d;
      expect(a8Digits).not().assertNull();
      let a8ExpectedDigits: double[] = [3000000, 0, 40000];
      let a8LenActual: int = a8Digits!.length;
      let a8LenExpected: int = a8ExpectedDigits.length;
      expect(a8LenActual).assertEqual(a8LenExpected);
      for (let a8Idx: int = 0; a8Idx < a8ExpectedDigits.length; a8Idx++) {
        let a8V1: double = a8Digits![a8Idx];
        let a8V2: double = a8ExpectedDigits[a8Idx];
        expect(a8V1).assertEqual(a8V2);
      }
      let a8E: double = a8D.e;
      expect(a8E).assertEqual(-1);
      let a8S: double = a8D.s;
      expect(a8S).assertEqual(1);

      // A9. '123.45' repeated d[0] access equal and equals 123
      let a9D: Decimal = new Decimal('123.45');
      let a9A1: double = a9D.d![0];
      let a9A2: double = a9D.d![0];
      expect(a9A1).assertEqual(a9A2);
      expect(a9A1).assertEqual(123);

      // A10. '123.45' d is Array, digits [123,4500000], toString '123.45'
      let a10Dec: Decimal = new Decimal('123.45');
      expect(a10Dec.d).assertInstanceOf('Array');
      let a10Digits: Array<double> = a10Dec.d!;
      let a10Expected: Array<double> = [123, 4500000];
      let a10Len: int = a10Digits.length;
      let a10ExpectedLen: int = a10Expected.length;
      expect(a10Len).assertEqual(a10ExpectedLen);
      for (let a10Idx: int = 0; a10Idx < a10ExpectedLen; a10Idx++) {
        let a10V1: double = a10Digits[a10Idx];
        let a10V2: double = a10Expected[a10Idx];
        expect(a10V1).assertEqual(a10V2);
      }
      let a10Str: string = a10Dec.toString();
      expect(a10Str).assertEqual('123.45');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_0200
     * @tc.name decimalPropertiesTest002
     * @tc.desc d coefficient array length and null/NaN/Infinity edge and large numbers (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalPropertiesTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // B1. large integer '12345678901234567890' coefficient length 3 and e=19
      let b1D: Decimal = new Decimal('12345678901234567890');
      let b1Digits: Array<double> | null = b1D.d;
      expect(b1Digits).not().assertNull();
      let b1LenActual: int = b1Digits!.length;
      expect(b1LenActual).assertEqual(3);
      let b1EActual: number = b1D.e;
      expect(b1EActual).assertEqual(19);

      // B2. large integer '123456789012345678901' coefficient length 3
      let b2D: Decimal = new Decimal('123456789012345678901');
      let b2Digits: Array<double> | null = b2D.d;
      expect(b2Digits).not().assertNull();
      let b2LenActual: int = b2Digits!.length;
      expect(b2LenActual).assertEqual(3);

      // B3. NaN coefficient is null while finite '123.45' d[0]=123
      let b3Nan: Decimal = new Decimal(Number.NaN);
      let b3Fin: Decimal = new Decimal('123.45');
      expect(b3Nan.d).assertNull();
      let b3Actual: number = b3Fin.d![0];
      expect(b3Actual).assertEqual(123);

      // B4. -Infinity coefficient is null while finite '123.45' d[0]=123
      let b4Inf: Decimal = new Decimal(-Number.POSITIVE_INFINITY);
      let b4Fin: Decimal = new Decimal('123.45');
      expect(b4Inf.d).assertNull();
      let b4Actual: number = b4Fin.d![0];
      expect(b4Actual).assertEqual(123);

      // B5. +Infinity coefficient null and e is NaN
      let b5D: Decimal = new Decimal(Number.POSITIVE_INFINITY);
      expect(b5D.d).assertNull();
      let b5ENan: boolean = isNaN(b5D.e);
      expect(b5ENan).assertTrue();

      // B6. number 0 d is Array, digits [0], toString '0'
      let b6Dec: Decimal = new Decimal(0);
      expect(b6Dec.d).assertInstanceOf('Array');
      let b6Digits: Array<double> = b6Dec.d!;
      let b6Expected: Array<double> = [0];
      let b6Len: int = b6Digits.length;
      let b6ExpectedLen: int = b6Expected.length;
      expect(b6Len).assertEqual(b6ExpectedLen);
      for (let b6Idx: int = 0; b6Idx < b6ExpectedLen; b6Idx++) {
        let b6V1: double = b6Digits[b6Idx];
        let b6V2: double = b6Expected[b6Idx];
        expect(b6V1).assertEqual(b6V2);
      }
      let b6Str: string = b6Dec.toString();
      expect(b6Str).assertEqual('0');

      // B7. '123' coefficient length 1
      let b7Dec: Decimal = new Decimal('123');
      let b7D: Array<double> | null = b7Dec.d;
      expect(b7D).not().assertNull();
      let b7LenActual: int = b7D!.length;
      expect(b7LenActual).assertEqual(1);

      // B8. '999999.9' coefficient length 2 and d[1]=9000000
      let b8Dec: Decimal = new Decimal('999999.9');
      let b8D: Array<double> | null = b8Dec.d;
      expect(b8D).not().assertNull();
      let b8LenActual: int = b8D!.length;
      expect(b8LenActual).assertEqual(2);
      let b8Actual: number = b8D![1];
      expect(b8Actual).assertEqual(9000000);

      // B9. '123456789' coefficient length 2 and d[1]=3456789
      let b9Dec: Decimal = new Decimal('123456789');
      let b9D: Array<double> | null = b9Dec.d;
      expect(b9D).not().assertNull();
      let b9LenActual: int = b9D!.length;
      expect(b9LenActual).assertEqual(2);
      let b9Actual: number = b9D![1];
      expect(b9Actual).assertEqual(3456789);

      // B10. '1.23e-4' coefficient length 1 and d[0]=1230
      let b10Dec: Decimal = new Decimal('1.23e-4');
      let b10D: Array<double> | null = b10Dec.d;
      expect(b10D).not().assertNull();
      let b10LenActual: int = b10D!.length;
      expect(b10LenActual).assertEqual(1);
      let b10Actual: number = b10D![0];
      expect(b10Actual).assertEqual(1230);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_0300
     * @tc.name decimalPropertiesTest003
     * @tc.desc e exponent value across inputs including NaN/Infinity (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalPropertiesTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // C1. '0.05' exponent equals -2 (repeated read consistent)
      let c1D: Decimal = new Decimal('0.05');
      let c1First: double = c1D.e;
      let c1Second: double = c1D.e;
      expect(c1First).assertEqual(c1Second);
      expect(c1Second).assertEqual(-2);

      // C2. '1.23e-4' and '0.000123' exponents equal and equal -4
      let c2A: Decimal = new Decimal('1.23e-4');
      let c2B: Decimal = new Decimal('0.000123');
      let c2LenA: int = c2A.d!.length;
      expect(c2LenA).assertEqual(1);
      let c2LenB: int = c2B.d!.length;
      expect(c2LenB).assertEqual(1);
      let c2EActual: number = c2A.e;
      let c2EExpected: number = c2B.e;
      expect(c2EActual).assertEqual(c2EExpected);
      let c2EValue: number = c2A.e;
      expect(c2EValue).assertEqual(-4);

      // C3. '0.1' exponent equals -1
      let c3D: Decimal = new Decimal('0.1');
      let c3Actual: number = c3D.e;
      expect(c3Actual).assertEqual(-1);

      // C4. '1.5' exponent equals 0
      let c4D: Decimal = new Decimal('1.5');
      let c4Actual: number = c4D.e;
      expect(c4Actual).assertEqual(0);

      // C5. '-123.45' exponent equals 2
      let c5D: Decimal = new Decimal('-123.45');
      let c5Actual: number = c5D.e;
      expect(c5Actual).assertEqual(2);

      // C6. '-0.0001' exponent equals -4
      let c6D: Decimal = new Decimal('-0.0001');
      let c6Actual: number = c6D.e;
      expect(c6Actual).assertEqual(-4);

      // C7. -Infinity exponent is NaN
      let c7D: Decimal = new Decimal(-Number.POSITIVE_INFINITY);
      let c7Actual: boolean = isNaN(c7D.e);
      expect(c7Actual).assertTrue();

      // C8. NaN exponent and sign are NaN
      let c8D: Decimal = new Decimal(Number.NaN);
      let c8ENan: boolean = isNaN(c8D.e);
      expect(c8ENan).assertTrue();
      let c8SActual: number = c8D.s;
      let c8SNan: boolean = isNaN(c8SActual);
      expect(c8SNan).assertTrue();

      // C9. '0.001' exponent equals -3
      let c9Dec: Decimal = new Decimal('0.001');
      let c9Actual: number = c9Dec.e;
      expect(c9Actual).assertEqual(-3);

      // C10. '100' exponent equals 2
      let c10Dec: Decimal = new Decimal('100');
      let c10Actual: number = c10Dec.e;
      expect(c10Actual).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_0400
     * @tc.name decimalPropertiesTest004
     * @tc.desc s sign value across inputs including NaN/Infinity/zero (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalPropertiesTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // D1. '-0.05' sign equals -1
      let d1D: Decimal = new Decimal('-0.05');
      let d1Actual: number = d1D.s;
      expect(d1Actual).assertEqual(-1);

      // D2. number -5 sign equals -1
      let d2D: Decimal = new Decimal(-5);
      let d2Actual: number = d2D.s;
      expect(d2Actual).assertEqual(-1);

      // D3. Decimal copy of '-5' sign equals -1
      let d3Src: Decimal = new Decimal('-5');
      let d3Cp: Decimal = new Decimal(d3Src);
      let d3Actual: number = d3Cp.s;
      expect(d3Actual).assertEqual(-1);

      // D4. '0.1' sign equals 1
      let d4D: Decimal = new Decimal('0.1');
      let d4Actual: number = d4D.s;
      expect(d4Actual).assertEqual(1);

      // D5. +Infinity sign equals 1
      let d5D: Decimal = new Decimal(Number.POSITIVE_INFINITY);
      let d5Actual: number = d5D.s;
      expect(d5Actual).assertEqual(1);

      // D6. -Infinity sign equals -1
      let d6D: Decimal = new Decimal(-Number.POSITIVE_INFINITY);
      let d6Actual: number = d6D.s;
      expect(d6Actual).assertEqual(-1);

      // D7. '0' and '-0' coefficient d[0]=0, exponents equal, signs opposite, '0'.s=1
      let d7P: Decimal = new Decimal('0');
      let d7N: Decimal = new Decimal('-0');
      let d7PActual: number = d7P.d![0];
      expect(d7PActual).assertEqual(0);
      let d7NActual: number = d7N.d![0];
      expect(d7NActual).assertEqual(0);
      let d7PE: number = d7P.e;
      let d7NE: number = d7N.e;
      expect(d7PE).assertEqual(d7NE);
      let d7PS: number = d7P.s;
      let d7NS: number = -d7N.s;
      expect(d7PS).assertEqual(d7NS);
      let d7PSelf: number = d7P.s;
      expect(d7PSelf).assertEqual(1);

      // Scientific-notation value '1e5' has a positive sign
      let scientificNotationValue: Decimal = new Decimal('1e5');
      let scientificNotationSign: number = scientificNotationValue.s;
      expect(scientificNotationSign).assertEqual(1);

      // D9. '-1e5' sign equals -1
      let d9Dec: Decimal = new Decimal('-1e5');
      let d9Actual: number = d9Dec.s;
      expect(d9Actual).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_0500
     * @tc.name decimalPropertiesTest005
     * @tc.desc cross-input equivalence string vs number vs Decimal copy (7 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalPropertiesTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // E1. Decimal copy of '123.45' preserves coefficient [123,4500000], e=2, s=1
      let e1Src: Decimal = new Decimal('123.45');
      let e1Cp: Decimal = new Decimal(e1Src);
      let e1Digits: Array<double> | null = e1Cp.d;
      expect(e1Digits).not().assertNull();
      let e1ExpectedDigits: double[] = [123, 4500000];
      let e1LenActual: int = e1Digits!.length;
      let e1LenExpected: int = e1ExpectedDigits.length;
      expect(e1LenActual).assertEqual(e1LenExpected);
      for (let e1Idx: int = 0; e1Idx < e1ExpectedDigits.length; e1Idx++) {
        let e1V1: double = e1Digits![e1Idx];
        let e1V2: double = e1ExpectedDigits[e1Idx];
        expect(e1V1).assertEqual(e1V2);
      }
      let e1E: double = e1Cp.e;
      expect(e1E).assertEqual(2);
      let e1S: double = e1Cp.s;
      expect(e1S).assertEqual(1);

      // E2. '123.45' and '-123.45' coefficients equal, lengths 2, signs +1/-1
      let e2Pos: Decimal = new Decimal('123.45');
      let e2Neg: Decimal = new Decimal('-123.45');
      let e2NegD0: number = e2Neg.d![0];
      let e2PosD0: number = e2Pos.d![0];
      expect(e2NegD0).assertEqual(e2PosD0);
      let e2PosLen: int = e2Pos.d!.length;
      expect(e2PosLen).assertEqual(2);
      let e2NegLen: int = e2Neg.d!.length;
      expect(e2NegLen).assertEqual(2);
      let e2NegD1: number = e2Neg.d![1];
      let e2PosD1: number = e2Pos.d![1];
      expect(e2NegD1).assertEqual(e2PosD1);
      let e2NegS: number = e2Neg.s;
      expect(e2NegS).assertEqual(-1);
      let e2PosS: number = e2Pos.s;
      expect(e2PosS).assertEqual(1);

      // E3. number -2.5 d is Array, digits [2,5000000], toString '-2.5'
      let e3Dec: Decimal = new Decimal(-2.5);
      expect(e3Dec.d).assertInstanceOf('Array');
      let e3Digits: Array<double> = e3Dec.d!;
      let e3Expected: Array<double> = [2, 5000000];
      let e3Len: int = e3Digits.length;
      let e3ExpectedLen: int = e3Expected.length;
      expect(e3Len).assertEqual(e3ExpectedLen);
      for (let e3Idx: int = 0; e3Idx < e3ExpectedLen; e3Idx++) {
        let e3V1: double = e3Digits[e3Idx];
        let e3V2: double = e3Expected[e3Idx];
        expect(e3V1).assertEqual(e3V2);
      }
      let e3Str: string = e3Dec.toString();
      expect(e3Str).assertEqual('-2.5');

      // E4. string '123' and number 123 share equal d[0]
      let e4A: Decimal = new Decimal('123');
      let e4B: Decimal = new Decimal(123);
      let e4Da: Array<double> | null = e4A.d;
      let e4Db: Array<double> | null = e4B.d;
      expect(e4Da).not().assertNull();
      expect(e4Db).not().assertNull();
      let e4Actual: number = e4Da![0];
      let e4Expected: number = e4Db![0];
      expect(e4Actual).assertEqual(e4Expected);

      // E5. number 7 and string '7' share equal exponent
      let e5A: Decimal = new Decimal(7);
      let e5B: Decimal = new Decimal('7');
      let e5Actual: number = e5A.e;
      let e5Expected: number = e5B.e;
      expect(e5Actual).assertEqual(e5Expected);

      // E6. string '0' and number 0 share equal sign
      let e6A: Decimal = new Decimal('0');
      let e6B: Decimal = new Decimal(0);
      let e6Actual: number = e6A.s;
      let e6Expected: number = e6B.s;
      expect(e6Actual).assertEqual(e6Expected);

      // E7. number -7 and string '-7' share equal sign
      let e7A: Decimal = new Decimal(-7);
      let e7B: Decimal = new Decimal('-7');
      let e7Actual: number = e7A.s;
      let e7Expected: number = e7B.s;
      expect(e7Actual).assertEqual(e7Expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_0600
     * @tc.name decimalPropertiesTest006
     * @tc.desc mutation and immutability of source and operations (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalPropertiesTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // F1. '1.5'.add('1') yields '2.5' while source d[0]=1, e=0, s=1 unchanged
      let f1D: Decimal = new Decimal('1.5');
      let f1R: Decimal = f1D.add('1');
      let f1StrActual: string = f1R.toString();
      expect(f1StrActual).assertEqual('2.5');
      let f1DigitsActual: number = f1D.d![0];
      expect(f1DigitsActual).assertEqual(1);
      let f1EActual: number = f1D.e;
      expect(f1EActual).assertEqual(0);
      let f1SActual: number = f1D.s;
      expect(f1SActual).assertEqual(1);

      // F2. '123.45'.toSignificantDigits(3) yields '123' while source d.length=2, e=2
      let f2D: Decimal = new Decimal('123.45');
      let f2R: Decimal = f2D.toSignificantDigits(3);
      let f2StrActual: string = f2R.toString();
      expect(f2StrActual).assertEqual('123');
      let f2LenActual: int = f2D.d!.length;
      expect(f2LenActual).assertEqual(2);
      let f2EActual: number = f2D.e;
      expect(f2EActual).assertEqual(2);

      // F3. pushing 9 onto '123.45' coefficient makes length 3
      let f3D: Decimal = new Decimal('123.45');
      let f3Digits: Array<double> | null = f3D.d;
      if (f3Digits !== null) {
        f3Digits.push(9);
      }
      let f3Digits2: Array<double> | null = f3D.d;
      expect(f3Digits2).not().assertNull();
      let f3LenActual: int = f3Digits2!.length;
      expect(f3LenActual).assertEqual(3);

      // F4. Decimal.add('0.1','0.2') result coefficient d[0]=3000000
      let f4Sum: Decimal = Decimal.add('0.1', '0.2');
      let f4D: Array<double> | null = f4Sum.d;
      expect(f4D).not().assertNull();
      let f4Actual: number = f4D![0];
      expect(f4Actual).assertEqual(3000000);

      // F5. mutating '123.45' d[0]=9 yields toString '945'
      let f5Dec: Decimal = new Decimal('123.45');
      let f5D: Array<double> | null = f5Dec.d;
      expect(f5D).not().assertNull();
      f5D![0] = 9;
      let f5StrActual: string = f5Dec.toString();
      expect(f5StrActual).assertEqual('945');

      // F6. '10.5'.add(1) leaves source exponent unchanged
      let f6Dec: Decimal = new Decimal('10.5');
      let f6Before: double = f6Dec.e;
      f6Dec.add(1);
      let f6Actual: number = f6Dec.e;
      expect(f6Actual).assertEqual(f6Before);

      // F7. '10.5'.add(1) leaves source coefficient d[0] unchanged
      let f7Dec: Decimal = new Decimal('10.5');
      let f7D1: Array<double> | null = f7Dec.d;
      f7Dec.add(1);
      let f7D2: Array<double> | null = f7Dec.d;
      expect(f7D1).not().assertNull();
      expect(f7D2).not().assertNull();
      let f7Actual: number = f7D1![0];
      let f7Expected: number = f7D2![0];
      expect(f7Actual).assertEqual(f7Expected);

      // F8. '2.5'.add('2.5') result toString equals '5'
      let f8Dec: Decimal = new Decimal('2.5');
      let f8D: Array<double> | null = f8Dec.d;
      expect(f8D).not().assertNull();
      let f8Sum: Decimal = f8Dec.add('2.5');
      let f8StrActual: string = f8Sum.toString();
      expect(f8StrActual).assertEqual('5');

      // F9. mutating '123.45' d[0]=9 is observable via second d read as 9
      let f9Dec: Decimal = new Decimal('123.45');
      let f9D1: Array<double> | null = f9Dec.d;
      expect(f9D1).not().assertNull();
      f9D1![0] = 9;
      let f9D2: Array<double> | null = f9Dec.d;
      expect(f9D2).not().assertNull();
      let f9Actual: number = f9D2![0];
      expect(f9Actual).assertEqual(9);

      // F10. mutating '123.45' d[0]=9 leaves exponent unchanged at 2
      let f10Dec: Decimal = new Decimal('123.45');
      let f10D: Array<double> | null = f10Dec.d;
      expect(f10D).not().assertNull();
      f10D![0] = 9;
      let f10Actual: number = f10Dec.e;
      expect(f10Actual).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_0700
     * @tc.name decimalPropertiesTest007
     * @tc.desc precision/set effects on coefficient and toString (5 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalPropertiesTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // G1. big 10000-char '1' string with precision 20000 yields coefficient length 1429
      let g1Big: string = '';
      for (let g1I: int = 0; g1I < 10000; g1I++) {
        g1Big = g1Big + '1';
      }
      Decimal.set({ precision: 20000 });
      let g1D: Decimal = new Decimal(g1Big);
      let g1Digits: Array<double> | null = g1D.d;
      expect(g1Digits).not().assertNull();
      let g1LenActual: int = g1Digits!.length;
      expect(g1LenActual).assertEqual(1429);
      Decimal.set({ defaults: true });

      // G2. '123.456' coefficient length 2 unaffected by precision 3, e=2
      let g2D: Decimal = new Decimal('123.456');
      let g2Digits: Array<double> | null = g2D.d;
      expect(g2Digits).not().assertNull();
      let g2LenActual: int = g2Digits!.length;
      expect(g2LenActual).assertEqual(2);
      Decimal.set({ precision: 3 });
      let g2Digits2: Array<double> | null = g2D.d;
      expect(g2Digits2).not().assertNull();
      let g2LenActual2: int = g2Digits2!.length;
      expect(g2LenActual2).assertEqual(2);
      let g2EActual: number = g2D.e;
      expect(g2EActual).assertEqual(2);
      Decimal.set({ defaults: true });

      // G3. precision 3 then '12.3456789' coefficient length 2
      Decimal.set({ precision: 3 });
      let g3Dec: Decimal = new Decimal('12.3456789');
      Decimal.set({ defaults: true });
      let g3D: Array<double> | null = g3Dec.d;
      expect(g3D).not().assertNull();
      let g3LenActual: int = g3D!.length;
      expect(g3LenActual).assertEqual(2);

      // G4. precision 1 then '12.5' coefficient d[0]=12
      Decimal.set({ precision: 1 });
      let g4Dec: Decimal = new Decimal('12.5');
      Decimal.set({ defaults: true });
      let g4D: Array<double> | null = g4Dec.d;
      expect(g4D).not().assertNull();
      let g4Actual: number = g4D![0];
      expect(g4Actual).assertEqual(12);

      // G5. precision 3 keeps '12.3456789' toString '12.3456789', default length 2
      Decimal.set({ precision: 3 });
      let g5Trunc: Decimal = new Decimal('12.3456789');
      let g5StrActual: string = g5Trunc.toString();
      expect(g5StrActual).assertEqual('12.3456789');
      Decimal.set({ defaults: true });
      let g5Full: Decimal = new Decimal('12.3456789');
      let g5Df: Array<double> | null = g5Full.d;
      expect(g5Df).not().assertNull();
      let g5DigitsActual: int = g5Df!.length;
      expect(g5DigitsActual).assertEqual(2);
    });
  });
}
