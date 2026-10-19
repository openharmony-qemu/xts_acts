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

export default function decimalRandomTest(): void {
  describe('DecimalRandomTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      Decimal.set({ defaults: true });
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_RANDOM_0100
     * @tc.name decimalRandomTest001
     * @tc.desc Coefficient digit array structure (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalRandomTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. random(10) exposes a coefficient array
      let s1R: Decimal = Decimal.random(10);
      let s1Actual: boolean = s1R.d instanceof Array;
      expect(s1Actual).assertTrue();

      // 2. sd=10 coefficient length at most 10
      let s2R: Decimal = Decimal.random(10);
      expect(s2R.d!.length).assertLessOrEqual(10);

      // 3. sd=1 and sd=20 coefficient length bounds
      for (let s3I: int = 0; s3I < 2; s3I++) {
        let s3A: Decimal = Decimal.random(1);
        let s3B: Decimal = Decimal.random(20);
        expect(s3A.d!.length).assertLessOrEqual(1);
        expect(s3B.d!.length).assertLessOrEqual(20);
      }

      // 4. sd=20 coefficient length greater than zero
      let s4R: Decimal = Decimal.random(20);
      expect(s4R.d!.length).assertLarger(0);

      // 5. random(1) coefficient not null and leading digit in base range
      let s5R: Decimal = Decimal.random(1);
      expect(s5R.d).not().assertNull();
      expect(s5R.d![0]).assertLargerOrEqual(0);
      expect(s5R.d![0]).assertLess(10000000);

      // 6. random(10) coefficient is an Array instance
      let s6R: Decimal = Decimal.random(10);
      expect(s6R.d).assertInstanceOf('Array');

      // 7. random(10) leading coefficient in the base-10000000 range
      for (let s7I: int = 0; s7I < 2; s7I++) {
        let s7R: Decimal = Decimal.random(10);
        let s7Dg: Array<double> | null = s7R.d;
        expect(s7Dg).not().assertNull();
        let s7Coeff: double = s7Dg![0];
        expect(s7Coeff).assertLargerOrEqual(0);
        expect(s7Coeff).assertLess(10000000);
      }

      // 8. random(10) full coefficient checks over 7 samples
      for (let s8I: int = 0; s8I < 7; s8I++) {
        let s8R: Decimal = Decimal.random(10);
        let s8Digits: Array<double> | null = s8R.d;
        expect(s8Digits).not().assertNull();
        expect(s8Digits!.length).assertLargerOrEqual(1);
        expect(s8Digits!.length).assertLessOrEqual(2);
        expect(s8R.decimalPlaces()).assertLessOrEqual(10);
        let s8Lower: boolean = s8R.greaterThanOrEqualTo(0);
        expect(s8Lower).assertTrue();
        let s8Upper: boolean = s8R.lessThan(1);
        expect(s8Upper).assertTrue();
      }

      // 9. random(1) coefficient length equals one
      let s9R: Decimal = Decimal.random(1);
      let s9Dg: Array<double> | null = s9R.d;
      expect(s9Dg).not().assertNull();
      if (s9Dg !== null) {
        let s9Actual: int = s9Dg.length;
        let s9Expected: int = 1;
        expect(s9Actual).assertEqual(s9Expected);
      }

      // 10. random(10) all coefficient digits in base range
      let s10R: Decimal = Decimal.random(10);
      let s10Dg: Array<double> | null = s10R.d;
      expect(s10Dg).not().assertNull();
      if (s10Dg !== null) {
        let s10All: boolean = true;
        for (let s10I: int = 0; s10I < s10Dg.length; s10I++) {
          if (s10Dg[s10I] < 0 || s10Dg[s10I] >= 10000000) {
            s10All = false;
            break;
          }
        }
        expect(s10All).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_RANDOM_0200
     * @tc.name decimalRandomTest002
     * @tc.desc State predicates (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalRandomTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. random(10) is not NaN and exponent at most -1 when non-zero
      let s1R: Decimal = Decimal.random(10);
      let s1NaN: boolean = s1R.isNaN();
      expect(s1NaN).assertFalse();
      if (!s1R.isZero()) {
        expect(s1R.e).assertLessOrEqual(-1);
      }

      // 2. random(10) is not NaN and is finite over 3 samples
      for (let s2I: int = 0; s2I < 3; s2I++) {
        let s2R: Decimal = Decimal.random(10);
        let s2NaN: boolean = s2R.isNaN();
        expect(s2NaN).assertFalse();
        let s2Finite: boolean = s2R.isFinite();
        expect(s2Finite).assertTrue();
      }

      // 3. sd=20 isNegative false
      let s3R: Decimal = Decimal.random(20);
      let s3Actual: boolean = s3R.isNegative();
      expect(s3Actual).assertFalse();

      // 4. sd=20 sign is non-negative
      let s4R: Decimal = Decimal.random(20);
      expect(s4R.s).assertLargerOrEqual(0);

      // 5. sd=100000 isFinite
      let s5R: Decimal = Decimal.random(100000);
      let s5Actual: boolean = s5R.isFinite();
      expect(s5Actual).assertTrue();

      // 6. random(10) sign equals one
      let s6R: Decimal = Decimal.random(10);
      let s6Actual: number = s6R.s;
      let s6Expected: int = 1;
      expect(s6Actual).assertEqual(s6Expected);

      // 7. random(10) exponent is negative
      let s7R: Decimal = Decimal.random(10);
      expect(s7R.e).assertLess(0);

      // 8. random(10) isPositive true
      let s8R: Decimal = Decimal.random(10);
      let s8Actual: boolean = s8R.isPositive();
      expect(s8Actual).assertTrue();

      // 9. random(10) isZero false
      let s9R: Decimal = Decimal.random(10);
      let s9Actual: boolean = s9R.isZero();
      expect(s9Actual).assertFalse();

      // 10. random(10) isNegative false
      let s10R: Decimal = Decimal.random(10);
      let s10Actual: boolean = s10R.isNegative();
      expect(s10Actual).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_RANDOM_0300
     * @tc.name decimalRandomTest003
     * @tc.desc Value bounds and arithmetic scaling (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalRandomTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. random(10) add(1) stays in [1, 2)
      let s1R: Decimal = Decimal.random(10).add(1);
      let s1Lower: boolean = s1R.greaterThanOrEqualTo(1);
      expect(s1Lower).assertTrue();
      let s1Upper: boolean = s1R.lessThan(2);
      expect(s1Upper).assertTrue();

      // 2. random(10) negated stays in (-1, 0]
      let s2R: Decimal = Decimal.random(10).negate();
      let s2Lower: boolean = s2R.greaterThan(-1);
      expect(s2Lower).assertTrue();
      let s2Upper: boolean = s2R.lessThanOrEqualTo(0);
      expect(s2Upper).assertTrue();

      // 3. sd=10 toNumber less than 1
      let s3R: Decimal = Decimal.random(10);
      expect(s3R.toNumber()).assertLess(1);

      // 4. sd=20 toNumber greater than or equal to 0
      let s4R: Decimal = Decimal.random(20);
      expect(s4R.toNumber()).assertLargerOrEqual(0);

      // 5. random(10) mul(1000) stays in [0, 1000)
      let s5R: Decimal = Decimal.random(10).mul(1000);
      let s5Lower: boolean = s5R.greaterThanOrEqualTo(0);
      expect(s5Lower).assertTrue();
      let s5Upper: boolean = s5R.lessThan(1000);
      expect(s5Upper).assertTrue();

      // 6. random(10) mul(1e10) stays in [0, 1e10)
      let s6R: Decimal = Decimal.random(10);
      let s6Scaled: Decimal = s6R.mul(1e10);
      let s6Lower: boolean = s6Scaled.greaterThanOrEqualTo(0);
      expect(s6Lower).assertTrue();
      let s6Upper: boolean = s6Scaled.lessThan(1e10);
      expect(s6Upper).assertTrue();

      // 7. random(10) comparedTo 0.5 is within [-1, 1]
      let s7R: Decimal = Decimal.random(10);
      let s7C: double = s7R.comparedTo(0.5);
      expect(s7C).assertLargerOrEqual(-1);
      expect(s7C).assertLessOrEqual(1);

      // 8. random(10) add(0.1) is not equal and original toString is preserved
      let s8R: Decimal = Decimal.random(10);
      let s8Before: string = s8R.toString();
      let s8Sum: Decimal = s8R.add(0.1);
      expect(s8Sum).not().assertEqual(s8R);
      let s8Actual: string = s8R.toString();
      let s8Expected: string = s8Before;
      expect(s8Actual).assertEqual(s8Expected);

      // 9. random(10) floor stays in [0, 1)
      let s9R: Decimal = Decimal.random(10);
      let s9F: Decimal = s9R.floor();
      let s9Lower: boolean = s9F.greaterThanOrEqualTo(0);
      expect(s9Lower).assertTrue();
      let s9Upper: boolean = s9F.lessThan(1);
      expect(s9Upper).assertTrue();

      // 10. random(10) ceil stays in [0, 1]
      let s10R: Decimal = Decimal.random(10);
      let s10C: Decimal = s10R.ceil();
      let s10Lower: boolean = s10C.greaterThanOrEqualTo(0);
      expect(s10Lower).assertTrue();
      let s10Upper: boolean = s10C.lessThanOrEqualTo(1);
      expect(s10Upper).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_RANDOM_0400
     * @tc.name decimalRandomTest004
     * @tc.desc String conversion and equality round-trip (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalRandomTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. random(1) toString length at most 3, bounds [0,1), at most one decimal place
      let s1R: Decimal = Decimal.random(1);
      let s1Len: int = s1R.toString().length;
      expect(s1Len).assertLessOrEqual(3);
      let s1Lower: boolean = s1R.greaterThanOrEqualTo(0);
      expect(s1Lower).assertTrue();
      let s1Upper: boolean = s1R.lessThan(1);
      expect(s1Upper).assertTrue();
      let s1Places: double = s1R.decimalPlaces();
      let s1MaxPlaces: int = 1;
      expect(s1Places).assertLessOrEqual(s1MaxPlaces);

      // 2. random(10) toString round-trip preserves value and toNumber
      let s2R: Decimal = Decimal.random(10);
      let s2N1: Decimal = new Decimal(s2R.toString());
      let s2Actual: double = s2N1.toNumber();
      let s2Expected: double = s2R.toNumber();
      expect(s2Actual).assertEqual(s2Expected);
      let s2Same: boolean = s2N1.equals(s2R);
      expect(s2Same).assertTrue();

      // 3. random(10) equals itself
      let s3R: Decimal = Decimal.random(10);
      let s3Actual: boolean = s3R.equals(s3R);
      expect(s3Actual).assertTrue();

      // 4. random(1) toString preserves zero or one decimal place and value
      let s4R: Decimal = Decimal.random(1);
      let s4Str: string = s4R.toString();
      let s4Parsed: Decimal = new Decimal(s4Str);
      let s4Places: number = s4Parsed.decimalPlaces();
      let s4Min: int = 0;
      let s4Max: int = 1;
      expect(s4Places).assertLargerOrEqual(s4Min);
      expect(s4Places).assertLessOrEqual(s4Max);
      let s4Same: boolean = s4Parsed.equals(s4R);
      expect(s4Same).assertTrue();

      // 5. random(10) toFixed(10) has 10 decimal places
      let s5R: Decimal = Decimal.random(10);
      let s5Str: string = s5R.toFixed(10);
      let s5Actual: number = s5Str.length - s5Str.indexOf('.') - 1;
      let s5Expected: int = 10;
      expect(s5Actual).assertEqual(s5Expected);

      // 6. random(20) toNumber round-trip error within epsilon
      let s6R: Decimal = Decimal.random(20);
      let s6R2: Decimal = new Decimal(s6R.toNumber());
      let s6Error: Decimal = s6R2.sub(s6R).abs();
      let s6Result: boolean = s6Error.lessThanOrEqualTo(Number.EPSILON);
      expect(s6Result).assertTrue();

      // 7. toString of an existing Decimal is unaffected by a random call
      let s7Before: Decimal = new Decimal('123.456');
      Decimal.random(10);
      let s7Actual: string = s7Before.toString();
      let s7Expected: string = '123.456';
      expect(s7Actual).assertEqual(s7Expected);

      // 8. random(10) toString called twice yields non-empty strings
      let s8R: Decimal = Decimal.random(10);
      let s8S1: string = s8R.toString();
      let s8S2: string = s8R.toString();
      expect(s8S1.length).assertLarger(0);
      expect(s8S2.length).assertLarger(0);

      // 9. new Decimal(random) equals the original random
      let s9R: Decimal = Decimal.random(10);
      let s9Copy: Decimal = new Decimal(s9R);
      let s9Actual: boolean = s9Copy.equals(s9R);
      expect(s9Actual).assertTrue();

      // 10. random(10) valueOf equals toString
      let s10R: Decimal = Decimal.random(10);
      let s10Actual: string = s10R.valueOf();
      let s10Expected: string = s10R.toString();
      expect(s10Actual).assertEqual(s10Expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_RANDOM_0500
     * @tc.name decimalRandomTest005
     * @tc.desc Precision, formatting and identity operations (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalRandomTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. two random(10) calls are not equal
      let s1A: Decimal = Decimal.random(10);
      let s1B: Decimal = Decimal.random(10);
      expect(s1A).not().assertEqual(s1B);

      // 2. Decimal.sign of random(10) equals one
      let s2R: Decimal = Decimal.random(10);
      let s2Actual: number = Decimal.sign(s2R);
      let s2Expected: int = 1;
      expect(s2Actual).assertEqual(s2Expected);

      // 3. random(10) precision is between 1 and 10
      let s3R: Decimal = Decimal.random(10);
      let s3Actual: number = s3R.precision();
      let s3Min: int = 1;
      let s3Max: int = 10;
      expect(s3Actual).assertLargerOrEqual(s3Min);
      expect(s3Actual).assertLessOrEqual(s3Max);

      // 4. random(10) decimalPlaces is between 0 and 10
      let s4R: Decimal = Decimal.random(10);
      let s4Actual: number = s4R.decimalPlaces();
      let s4Min: int = 0;
      let s4Max: int = 10;
      expect(s4Actual).assertLargerOrEqual(s4Min);
      expect(s4Actual).assertLessOrEqual(s4Max);

      // 5. random(10) comparedTo 0 and 1 over 5 samples
      for (let s5I: int = 0; s5I < 5; s5I++) {
        let s5R: Decimal = Decimal.random(10);
        let s5C1: double = s5R.comparedTo(0);
        let s5C2: double = s5R.comparedTo(1);
        expect(s5C1).assertLargerOrEqual(0);
        expect(s5C2).assertLess(0);
      }

      // 6. random(10) add(0) equals the original
      let s6R: Decimal = Decimal.random(10);
      let s6Plus0: Decimal = s6R.add(0);
      let s6Actual: boolean = s6Plus0.equals(s6R);
      expect(s6Actual).assertTrue();

      // 7. random(10) mul(1) equals the original
      let s7R: Decimal = Decimal.random(10);
      let s7M1: Decimal = s7R.mul(1);
      let s7Actual: boolean = s7M1.equals(s7R);
      expect(s7Actual).assertTrue();

      // 8. random(10) toPrecision(4) round-trips to toSignificantDigits(4)
      let s8R: Decimal = Decimal.random(10);
      let s8Str: string = s8R.toPrecision(4);
      let s8Rounded: Decimal = new Decimal(s8Str);
      let s8Result: boolean = s8Rounded.equals(s8R.toSignificantDigits(4));
      expect(s8Result).assertTrue();
      expect(s8Rounded.precision()).assertLessOrEqual(4);

      // 9. random(10) absoluteValue equals the original
      let s9R: Decimal = Decimal.random(10);
      let s9Abs: Decimal = s9R.abs();
      let s9Actual: boolean = s9Abs.equals(s9R);
      expect(s9Actual).assertTrue();

      // 10. random(10) trunc equals zero
      let s10R: Decimal = Decimal.random(10);
      let s10T: Decimal = s10R.trunc();
      let s10Actual: string = s10T.toString();
      let s10Expected: string = '0';
      expect(s10Actual).assertEqual(s10Expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_RANDOM_0600
     * @tc.name decimalRandomTest006
     * @tc.desc Decimal set configuration and toNumber round-trip (7 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalRandomTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. set rounding 4 preserves toFixed HALF_UP rounding
      Decimal.set({ rounding: 4 });
      Decimal.random(10);
      let s1R2: Decimal = new Decimal(1.5);
      let s1Str: string = s1R2.toFixed(0, Decimal.ROUND_HALF_UP);
      expect(s1Str).assertEqual('2');
      Decimal.set({ defaults: true });

      // 2. set precision 5 produces fixed-precision output
      Decimal.set({ precision: 5 });
      Decimal.random(10);
      let s2R2: Decimal = new Decimal(1.5);
      let s2Str: string = s2R2.toPrecision(5);
      expect(s2Str).assertEqual('1.5000');
      Decimal.set({ defaults: true });

      // 3. set modulo 1 yields standard modulo result
      Decimal.set({ modulo: 1 });
      Decimal.random(10);
      let s3Q: Decimal = new Decimal(8).mod(3);
      let s3Actual: string = s3Q.toString();
      let s3Expected: string = '2';
      expect(s3Actual).assertEqual(s3Expected);
      Decimal.set({ defaults: true });

      // 4. set minE/maxE preserves large exponent toString
      Decimal.set({ minE: -9e15, maxE: 9e15 });
      Decimal.random(10);
      let s4R2: Decimal = new Decimal('1e10');
      let s4Actual: string = s4R2.toString();
      let s4Expected: string = '10000000000';
      expect(s4Actual).assertEqual(s4Expected);
      Decimal.set({ defaults: true });

      // 5. precision=3 limits default random decimal places
      Decimal.set({ precision: 3 });
      let s5R: Decimal = Decimal.random(10);
      let s5Default: Decimal = Decimal.random();
      expect(s5R.decimalPlaces()).assertLessOrEqual(10);
      expect(s5Default.decimalPlaces()).assertLessOrEqual(3);
      Decimal.set({ defaults: true });

      // 6. crypto random round-trips or reports crypto unavailable
      try {
        Decimal.set({ crypto: true });
        let s6R: Decimal = Decimal.random(5);
        let s6Restored: Decimal = new Decimal(s6R.toString());
        let s6Same: boolean = s6Restored.equals(s6R);
        expect(s6Same).assertTrue();
        expect().assertFail();
      } catch (s6E) {
        expect(s6E.code).assertEqual(10200061);
      }
      Decimal.set({ defaults: true });

      // 7. random(10) toNumber round-trip preserves double value and toFixed(10)
      let s7Values: Array<Decimal> = [Decimal.random(10), new Decimal('0.4789709516'), new Decimal('0.0943392464')];
      for (const s7R of s7Values) {
        let s7ExpectedNum: double = s7R.toNumber();
        let s7Copy: Decimal = new Decimal(s7ExpectedNum);
        let s7ActualNum: double = s7Copy.toNumber();
        expect(s7ActualNum).assertEqual(s7ExpectedNum);
        let s7ActualStr: string = s7Copy.toFixed(10);
        let s7ExpectedStr: string = s7R.toFixed(10);
        expect(s7ActualStr).assertEqual(s7ExpectedStr);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_RANDOM_0700
     * @tc.name decimalRandomTest007
     * @tc.desc Invalid input and error handling (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalRandomTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. random(0) throws error 10200001
      try {
        Decimal.random(0);
        expect().assertFail();
      } catch (s1E) {
        expect(s1E.code).assertEqual(10200001);
      }

      // 2. random(-1) throws error 10200001
      try {
        Decimal.random(-1);
        expect().assertFail();
      } catch (s2E) {
        expect(s2E.code).assertEqual(10200001);
      }

      // 3. random(1e9+1) throws error 10200001
      try {
        Decimal.random(1e9 + 1);
        expect().assertFail();
      } catch (s3E) {
        expect(s3E.code).assertEqual(10200001);
      }

      // 4. random(NaN) throws error 10200001
      try {
        Decimal.random(Number.NaN);
        expect().assertFail();
      } catch (s4E) {
        expect(s4E.code).assertEqual(10200001);
      }

      // 5. random(undefined) rejects incompatible runtime type
      let s5V: InvalidDecimalInput = undefined;
      try {
        Decimal.random(s5V as double);
        expect().assertFail();
      } catch (s5E) {
        expect(s5E.code).assertEqual(0);
      }

      // 6. random(null) rejects incompatible runtime type
      let s6V: InvalidDecimalInput = null;
      try {
        Decimal.random(s6V as double);
        expect().assertFail();
      } catch (s6E) {
        expect(s6E.code).assertEqual(0);
      }

      // 7. random(true) rejects incompatible runtime type
      let s7V: InvalidDecimalInput = true;
      try {
        Decimal.random(s7V as double);
        expect().assertFail();
      } catch (s7E) {
        expect(s7E.code).assertEqual(0);
      }

      // 8. random('10') rejects incompatible runtime type
      let s8V: InvalidDecimalInput = '10';
      try {
        Decimal.random(s8V as double);
        expect().assertFail();
      } catch (s8E) {
        expect(s8E.code).assertEqual(0);
      }

      // 9. random(Object) rejects incompatible runtime type
      let s9V: InvalidDecimalInput = new Object();
      try {
        Decimal.random(s9V as double);
        expect().assertFail();
      } catch (s9E) {
        expect(s9E.code).assertEqual(0);
      }

      // 10. random([1]) rejects incompatible runtime type
      let s10V: InvalidDecimalInput = [1] as Array<int>;
      try {
        Decimal.random(s10V as double);
        expect().assertFail();
      } catch (s10E) {
        expect(s10E.code).assertEqual(0);
      }
    });
  });
}
