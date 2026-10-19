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
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from './../Util.test';

export default function shortDivTest(): void {
  describe('ShortDivTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_DIV_0100
     * @tc.name testShortDiv_merged1
     * @tc.desc BasicValue: covers 10 merged test points for Short.div, including division and modulo, positive values, negative values, zero values, and equality consistency.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortDiv_merged1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dividend: Short = new Short(8 as short);
        let divisor: Short = new Short(4 as short);
        let result: Short = dividend.div(divisor);
        expect(result.toShort()).assertEqual(2 as short);
        expect(dividend.toShort()).assertEqual(8 as short);
        expect(divisor.toShort()).assertEqual(4 as short);
      }

      {
        let dividend: Short = new Short(8 as short);
        let divisor: Short = new Short((-4) as short);
        let result: Short = dividend.div(divisor);
        expect(result.toShort()).assertEqual((-2) as short);
        expect(dividend.toShort()).assertEqual(8 as short);
        expect(divisor.toShort()).assertEqual((-4) as short);
      }

      {
        let dividend: Short = new Short(0 as short);
        let divisor: Short = new Short(4 as short);
        let quotient: short = dividend.div(divisor).toShort();
        expect(quotient).assertEqual(0 as short);
        expect(divisor.toShort()).assertEqual(4 as short);
      }

      {
        let exactPairs: [short, short, short][] = [
          [120 as short, 6 as short, 20 as short],
          [144 as short, 12 as short, 12 as short],
          [1000 as short, 25 as short, 40 as short],
          [32766 as short, 6 as short, 5461 as short],
          [(-120) as short, 6 as short, (-20) as short],
          [(-144) as short, 12 as short, (-12) as short],
          [120 as short, (-6) as short, (-20) as short],
          [(-144) as short, (-12) as short, 12 as short]
        ];
        let pairCount: int = 8;
        for (let i: int = 0; i < pairCount; i++) {
          let dividend: Short = new Short(exactPairs[i][0]);
          let divisor: Short = new Short(exactPairs[i][1]);
          let result: Short = dividend.div(divisor);
          expect(result.toShort()).assertEqual(exactPairs[i][2]);
          let product: Short = result.mul(divisor);
          expect(product.toShort()).assertEqual(dividend.toShort());
        }
      }

      {
        let negativeOne: Short = new Short((-1) as short);
        let inputs: short[] = [
          1 as short,
          50 as short,
          256 as short,
          1000 as short,
          32766 as short
        ];
        let expectedOutputs: short[] = [
          (-1) as short,
          (-50) as short,
          (-256) as short,
          (-1000) as short,
          (-32766) as short
        ];
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          let dividend: Short = new Short(inputs[i]);
          let result: Short = dividend.div(negativeOne);
          expect(result.toShort()).assertEqual(expectedOutputs[i]);
        }
      }

      {
        let value: Short = new Short(1024 as short);
        let two: Short = new Short(2 as short);
        let expectedSequence: short[] = [
          1024 as short, 512 as short, 256 as short, 128 as short, 64 as short,
          32 as short, 16 as short, 8 as short, 4 as short, 2 as short, 1 as short, 0 as short
        ];
        let seqLen: int = 12;
        for (let step: int = 0; step < seqLen; step++) {
          expect(value.toShort()).assertEqual(expectedSequence[step]);
          value = value.div(two);
        }
      }

      {
        let pairs: [short, short][] = [
          [15 as short, 4 as short],
          [30 as short, 6 as short],
          [100 as short, 3 as short],
          [200 as short, 7 as short]
        ];
        for (let i: int = 0; i < pairs.length; i++) {
          let posDividend: Short = new Short(pairs[i][0]);
          let posDivisor: Short = new Short(pairs[i][1]);
          let negDividend: Short = new Short(Int.toShort(-pairs[i][0]));
          let negDivisor: Short = new Short(Int.toShort(-pairs[i][1]));
          let resultPos: Short = posDividend.div(posDivisor);
          let resultNeg: Short = negDividend.div(negDivisor);
          expect(resultPos.toShort()).assertEqual(resultNeg.toShort());
        }
      }

      {
        let pairs: [short, short][] = [
          [1 as short, 2 as short],
          [2 as short, 5 as short],
          [5 as short, 100 as short],
          [(-1) as short, 3 as short],
          [(-3) as short, 10 as short],
          [1 as short, (-4) as short],
          [(-2) as short, (-7) as short],
          [10 as short, 100 as short],
          [(-5) as short, 50 as short],
          [3 as short, (-100) as short]
        ];
        for (let i: int = 0; i < pairs.length; i++) {
          let dividend: Short = new Short(pairs[i][0]);
          let divisor: Short = new Short(pairs[i][1]);
          expect(dividend.div(divisor).toShort()).assertEqual(0 as short);
        }
      }

      {
        let pairs: [short, short][] = [
          [10 as short, 3 as short],
          [100 as short, 7 as short],
          [50 as short, 8 as short],
          [255 as short, 16 as short],
          [1000 as short, 33 as short]
        ];
        for (let i: int = 0; i < pairs.length; i++) {
          let dividend: Short = new Short(pairs[i][0]);
          let divisor: Short = new Short(pairs[i][1]);
          let quotient: Short = dividend.div(divisor);
          let product: Short = quotient.mul(divisor);
          let remainder: Short = dividend.sub(product);
          expect(remainder.toShort() >= 0).assertTrue();
          expect(remainder.toShort() < divisor.toShort()).assertTrue();
        }
      }

      {
        let dividend: Short = new Short(100 as short);
        let divisor: Short = new Short(4 as short);
        let quotient: Short = dividend.div(divisor);
        let expected: Short = new Short(25 as short);
        expect(quotient.toShort()).assertEqual(25 as short);
        expect(quotient.equals(expected)).assertTrue();
        expect(quotient.compareTo(expected)).assertEqual(0);
        expect(quotient.isLessThan(expected)).assertFalse();
        expect(quotient.isGreaterThan(expected)).assertFalse();
        expect(quotient.isLessEqualThan(expected)).assertTrue();
        expect(quotient.isGreaterEqualThan(expected)).assertTrue();
        expect(quotient.isLessThan(new Short(26 as short))).assertTrue();
        expect(quotient.isGreaterThan(new Short(24 as short))).assertTrue();
        let negDividend: Short = new Short((-100) as short);
        let negQuotient: Short = negDividend.div(divisor);
        let negExpected: Short = new Short((-25) as short);
        expect(negQuotient.toShort()).assertEqual((-25) as short);
        expect(negQuotient.equals(negExpected)).assertTrue();
        expect(negQuotient.compareTo(negExpected)).assertEqual(0);
        expect(negQuotient.isLessThan(new Short(0 as short))).assertTrue();
        expect(negQuotient.isGreaterThan(new Short((-26) as short))).assertTrue();
        expect(negQuotient.isLessEqualThan(negExpected)).assertTrue();
        expect(negQuotient.isGreaterEqualThan(negExpected)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_DIV_0200
     * @tc.name testShortDiv_merged2
     * @tc.desc BasicValue / BoundaryOverflow: covers 10 merged test points for Short.div, including division and modulo, negative values, zero values, positive values, and algebraic properties.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortDiv_merged2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let divisor: Short = new Short(3 as short);
        let negativeDividends: short[] = [(-5) as short, (-7) as short, (-10) as short, (-100) as short];
        let expectedTrunc: short[] = [(-1) as short, (-2) as short, (-3) as short, (-33) as short];
        let expectedFloor: int[] = [-2, -3, -4, -34];
        let valCount: int = 4;
        for (let i: int = 0; i < valCount; i++) {
          let dividend: Short = new Short(negativeDividends[i]);
          let truncResult: Short = dividend.div(divisor);
          expect(truncResult.toShort()).assertEqual(expectedTrunc[i]);
          let floorResult: int = Double.toInt(Math.trunc(Math.floor(dividend.toDouble() / divisor.toDouble())));
          expect(floorResult).assertEqual(expectedFloor[i]);
          expect(truncResult.toInt() >= floorResult).assertTrue();
        }
      }

      {
        let divisor: Short = new Short(5 as short);
        let dividends: short[] = [1 as short, 5 as short, 10 as short, 50 as short, 100 as short, 500 as short, 1000 as short];
        let divCount: int = 7;
        let prevQuotient: short = (-1) as short;
        for (let i: int = 0; i < divCount; i++) {
          let dividend: Short = new Short(dividends[i]);
          let quotient: Short = dividend.div(divisor);
          expect(quotient.toShort() >= prevQuotient).assertTrue();
          prevQuotient = quotient.toShort();
        }
      }

      {
        let zero: Short = new Short(0 as short);
        let divisors: short[] = [
          1 as short, 2 as short, 100 as short, Short.MAX_VALUE,
          (-1) as short, (-2) as short, (-100) as short, Short.MIN_VALUE
        ];
        let divCount: int = 8;
        for (let i: int = 0; i < divCount; i++) {
          let divisor: Short = new Short(divisors[i]);
          let result: Short = zero.div(divisor);
          expect(result.toShort()).assertEqual(0 as short);
          expect(zero.toShort()).assertEqual(0 as short);
        }
      }

      {
        let bases: short[] = [1 as short, 2 as short, 5 as short, 10 as short, 20 as short,
        50 as short, 100 as short, (-3) as short, (-7) as short, (-12) as short];
        let baseCount: int = 10;
        for (let i: int = 0; i < baseCount; i++) {
          let base: Short = new Short(bases[i]);
          let square: Short = base.mul(base);
          let quotient: Short = square.div(base);
          expect(quotient.toShort()).assertEqual(base.toShort());
        }
        let largeBase: Short = new Short(180 as short);
        let largeSquare: Short = largeBase.mul(largeBase);
        expect(largeSquare.div(largeBase).toShort()).assertEqual(180 as short);
      }

      {
        let negPows: short[] = [(-1024) as short, (-2048) as short, (-4096) as short, (-8192) as short, (-16384) as short];
        let divisor: Short = new Short(4 as short);
        let expected: short[] = [(-256) as short, (-512) as short, (-1024) as short, (-2048) as short, (-4096) as short];
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          let dividend: Short = new Short(negPows[i]);
          let result: Short = dividend.div(divisor);
          expect(result.toShort()).assertEqual(expected[i]);
          let reconstructed: Short = result.mul(divisor);
          expect(reconstructed.toShort()).assertEqual(dividend.toShort());
        }
        let largeNegDiv: Short = new Short((-1000) as short);
        let largeResult: Short = largeNegDiv.div(divisor);
        expect(largeResult.toShort()).assertEqual((-250) as short);
      }

      {
        let dividend: Short = new Short(120 as short);
        let negDivisors: short[] = [(-2) as short, (-3) as short, (-4) as short, (-5) as short, (-6) as short, (-10) as short];
        let expected: short[] = [(-60) as short, (-40) as short, (-30) as short, (-24) as short, (-20) as short, (-12) as short];
        let divCount: int = 6;
        for (let i: int = 0; i < divCount; i++) {
          let divisor: Short = new Short(negDivisors[i]);
          let result: Short = dividend.div(divisor);
          expect(result.toShort()).assertEqual(expected[i]);
        }
        for (let i: int = 1; i < divCount; i++) {
          let divisor: Short = new Short(negDivisors[i]);
          let result: Short = dividend.div(divisor);
          expect(result.toShort() >= expected[i - 1]).assertTrue();
        }
      }

      {
        let dividend: Short = new Short(7 as short);
        let divisor: Short = new Short(2 as short);
        expect(dividend.div(divisor).toShort()).assertEqual(3 as short);
        expect(dividend.toShort()).assertEqual(7 as short);
      }

      {
        let dividend: Short = new Short((-7) as short);
        let divisor: Short = new Short(2 as short);
        let result: Short = dividend.div(divisor);
        expect(result.toShort()).assertEqual((-3) as short);
        expect(dividend.toShort()).assertEqual((-7) as short);
        expect(divisor.toShort()).assertEqual(2 as short);
      }

      {
        let dividend: Short = new Short((-7) as short);
        let divisor: Short = new Short((-2) as short);
        let result: Short = dividend.div(divisor);
        expect(result.toShort()).assertEqual(3 as short);
        expect(dividend.toShort()).assertEqual((-7) as short);
        expect(divisor.toShort()).assertEqual((-2) as short);
      }

      {
        let maxValue: Short = new Short(Short.MAX_VALUE);
        let minValue: Short = new Short(Short.MIN_VALUE);
        let one: Short = new Short(1 as short);
        let maxResult: Short = maxValue.div(one);
        let minResult: Short = minValue.div(one);
        expect(maxResult.toShort()).assertEqual(Short.MAX_VALUE);
        expect(minResult.toShort()).assertEqual(Short.MIN_VALUE);
        expect(maxValue.toShort()).assertEqual(Short.MAX_VALUE);
        expect(minValue.toShort()).assertEqual(Short.MIN_VALUE);
        expect(one.toShort()).assertEqual(1 as short);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_DIV_0300
     * @tc.name testShortDiv_merged3
     * @tc.desc BoundaryOverflow: covers 10 merged test points for Short.div, including division and modulo, boundary values, fractions and rounding, type conversion, and loop accumulation.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortDiv_merged3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let nearMax: Short = new Short(32766 as short);
        let nearMin: Short = new Short((-32767) as short);
        let one: Short = new Short(1 as short);
        let nearMaxResult: Short = nearMax.div(one);
        let nearMinResult: Short = nearMin.div(one);
        expect(nearMaxResult.toShort()).assertEqual(32766 as short);
        expect(nearMinResult.toShort()).assertEqual((-32767) as short);
        expect(nearMax.toShort()).assertEqual(32766 as short);
        expect(nearMin.toShort()).assertEqual((-32767) as short);
        expect(one.toShort()).assertEqual(1 as short);
      }

      {
        let dividend: Short = new Short(32766 as short);
        let divisor: Short = new Short(1 as short);
        let result: Short = dividend.div(divisor);
        expect(result.toShort()).assertEqual(32766 as short);
        expect(result.toInt()).assertEqual(32766);
        expect(result.toLong()).assertEqual(Long.toLong(32766));
        expect(dividend.toShort()).assertEqual(32766 as short);
        expect(divisor.toShort()).assertEqual(1 as short);
      }

      {
        let dividend: Short = new Short((-32767) as short);
        let divisor: Short = new Short(1 as short);
        let result: Short = dividend.div(divisor);
        expect(result.toShort()).assertEqual((-32767) as short);
        expect(result.toInt()).assertEqual(-32767);
        expect(result.toLong()).assertEqual(Long.toLong(-32767));
        expect(dividend.toShort()).assertEqual((-32767) as short);
        expect(divisor.toShort()).assertEqual(1 as short);
      }

      {
        let dividends: short[] = [10 as short, 7 as short, 6 as short, 1 as short, 100 as short];
        let divisors: short[] = [3 as short, 3 as short, 3 as short, 5 as short, 7 as short];
        let expectedCeils: short[] = [4 as short, 3 as short, 2 as short, 1 as short, 15 as short];
        let caseCount: int = 5;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let dividendInt: int = Short.toInt(dividends[caseIndex]);
          let divisorInt: int = Short.toInt(divisors[caseIndex]);
          let computedCeil: short = Int.toShort((dividendInt + divisorInt - 1) / divisorInt);
          let truncQuotient: short = new Short(dividends[caseIndex]).div(new Short(divisors[caseIndex])).toShort();
          expect(computedCeil).assertEqual(expectedCeils[caseIndex]);
          expect(truncQuotient <= computedCeil).assertTrue();
        }
      }

      {
        let pairs: [short, short][] = [
          [100 as short, 7 as short],
          [1000 as short, 64 as short],
          [12345 as short, 100 as short],
          [32767 as short, 256 as short]
        ];
        let pairCount: int = 4;
        for (let i: int = 0; i < pairCount; i++) {
          let dividend: Short = new Short(pairs[i][0]);
          let divisor: Short = new Short(pairs[i][1]);
          let quotient: Short = dividend.div(divisor);
          let product: Short = quotient.mul(divisor);
          let remainder: Short = dividend.sub(product);
          let reconstructed: Short = product.add(remainder);
          expect(quotient.toInt() >= 0).assertTrue();
          expect(remainder.toShort() >= 0 as short).assertTrue();
          expect(remainder.toShort() < divisor.toShort()).assertTrue();
          expect(reconstructed.toShort()).assertEqual(dividend.toShort());
        }
      }

      {
        let dividend: Short = new Short(6500 as short);
        let divisor: Short = new Short(64 as short);
        let quotient: Short = dividend.div(divisor);
        expect(quotient.toShort()).assertEqual(101 as short);
        expect(quotient.toChar()).assertEqual(c'e');
      }

      {
        let maxValue: Short = new Short(Short.MAX_VALUE);
        let result: Short = maxValue.div(maxValue);
        expect(result.toShort()).assertEqual(1 as short);
        expect(maxValue.toShort()).assertEqual(Short.MAX_VALUE);
      }

      {
        let dividends: short[] = [256 as short, 1024 as short, 1000 as short, (-256) as short, (-1024) as short, (-1000) as short];
        let powersOfTwo: short[] = [2 as short, 4 as short, 8 as short, 16 as short, 32 as short];
        let shifts: short[] = [1 as short, 2 as short, 3 as short, 4 as short, 5 as short];
        let divCount: int = 6;
        let powCount: int = 5;
        for (let d: int = 0; d < divCount; d++) {
          let dividend: Short = new Short(dividends[d]);
          for (let p: int = 0; p < powCount; p++) {
            let divisor: Short = new Short(powersOfTwo[p]);
            let result: Short = dividend.div(divisor);
            let shifted: short = Int.toShort(Double.toInt(dividends[d] / Double.toInt(Math.pow(2, shifts[p]))));
            expect(result.toShort()).assertEqual(shifted);
          }
        }
      }

      {
        let dividend: Short = new Short(Short.MIN_VALUE);
        let divisor: Short = new Short(2 as short);
        let result: Short = dividend.div(divisor);
        expect(result.toShort()).assertEqual((-16384) as short);
        expect(dividend.toShort()).assertEqual(Short.MIN_VALUE);
        expect(divisor.toShort()).assertEqual(2 as short);
      }

      {
        let dividend: Short = new Short(Short.MAX_VALUE);
        let divisor: Short = new Short(2 as short);
        let result: Short = dividend.div(divisor);
        expect(result.toShort()).assertEqual(16383 as short);
        expect(dividend.toShort()).assertEqual(Short.MAX_VALUE);
        expect(divisor.toShort()).assertEqual(2 as short);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_DIV_0400
     * @tc.name testShortDiv_merged4
     * @tc.desc BoundaryOverflow: covers 10 merged test points for Short.div, including division and modulo, boundary values, fractions and rounding, zero values, and negative values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortDiv_merged4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dividend: Short = new Short(Short.MAX_VALUE);
        let divisor: Short = new Short((-1) as short);
        let result: Short = dividend.div(divisor);
        expect(result.toShort()).assertEqual((-32767) as short);
        expect(dividend.toShort()).assertEqual(Short.MAX_VALUE);
        expect(divisor.toShort()).assertEqual((-1) as short);
      }

      {
        let one: Short = new Short(1 as short);
        let maxValue: Short = new Short(Short.MAX_VALUE);
        let result: Short = one.div(maxValue);
        expect(result.toShort()).assertEqual(0 as short);
        expect(one.toShort()).assertEqual(1 as short);
        expect(maxValue.toShort()).assertEqual(Short.MAX_VALUE);
      }

      {
        let a: Short = new Short(1000 as short);
        let b: Short = new Short(3 as short);
        let c: Short = new Short(4 as short);
        let mid: Short = a.div(b);
        expect(mid.toShort()).assertEqual(333 as short);
        let finalResult: Short = mid.div(c);
        expect(finalResult.toShort()).assertEqual(83 as short);
        expect(a.toShort()).assertEqual(1000 as short);
      }

      {
        let dividend: Short = new Short(Short.MIN_VALUE);
        let divisor: Short = new Short((-2) as short);
        let result: Short = dividend.div(divisor);
        expect(result.toShort()).assertEqual(16384 as short);
        expect(dividend.toShort()).assertEqual(Short.MIN_VALUE);
        expect(divisor.toShort()).assertEqual((-2) as short);
      }

      {
        let dividend: Short = new Short(Short.MAX_VALUE);
        let divisor: Short = new Short(Short.MIN_VALUE);
        let result: Short = dividend.div(divisor);
        expect(result.toShort()).assertEqual(0 as short);
        expect(dividend.toShort()).assertEqual(Short.MAX_VALUE);
        expect(divisor.toShort()).assertEqual(Short.MIN_VALUE);
      }

      {
        let dividend: Short = new Short(Short.MIN_VALUE);
        let divisor: Short = new Short(Short.MAX_VALUE);
        let result: Short = dividend.div(divisor);
        expect(result.toShort()).assertEqual((-1) as short);
        expect(dividend.toShort()).assertEqual(Short.MIN_VALUE);
        expect(divisor.toShort()).assertEqual(Short.MAX_VALUE);
      }

      {
        let q1: Short = new Short(7 as short).div(new Short(2 as short));
        expect(q1.toShort()).assertEqual(Double.toShort(7.0 / 2.0));
        expect(q1.toInt()).assertEqual(3);
        let q2: Short = new Short((-7) as short).div(new Short(2 as short));
        expect(q2.toShort()).assertEqual(Double.toShort(-7.0 / 2.0));
        expect(q2.toInt()).assertEqual((-3));
        let q3: Short = new Short(7 as short).div(new Short((-2) as short));
        expect(q3.toShort()).assertEqual(Double.toShort(7.0 / -2.0));
        expect(q3.toInt()).assertEqual((-3));
        let q4: Short = new Short((-7) as short).div(new Short((-2) as short));
        expect(q4.toShort()).assertEqual(Double.toShort(-7.0 / -2.0));
        expect(q4.toInt()).assertEqual(3);
        let q5: Short = new Short(100 as short).div(new Short(3 as short));
        expect(q5.toShort()).assertEqual(Double.toShort(100.0 / 3.0));
        expect(q5.toInt()).assertEqual(33);
      }

      {
        let exactDividend: Short = new Short(144 as short);
        let exactDivisor: Short = new Short(12 as short);
        let exactResult: Short = exactDividend.div(exactDivisor);
        expect(exactResult.toShort()).assertEqual(12 as short);
        expect(exactResult.toInt()).assertEqual(12);
        let truncDividend: Short = new Short(145 as short);
        let truncResult: Short = truncDividend.div(exactDivisor);
        expect(truncResult.toShort()).assertEqual(12 as short);
        expect(truncResult.toInt()).assertEqual(12);
        let negExactDividend: Short = new Short((-144) as short);
        let negExactResult: Short = negExactDividend.div(exactDivisor);
        expect(negExactResult.toShort()).assertEqual((-12) as short);
        expect(negExactResult.toInt()).assertEqual(-12);
      }

      {
        let maxVal: Short = new Short(Short.MAX_VALUE);
        let divisor1: Short = new Short(4 as short);
        let result1: Short = maxVal.div(divisor1);
        expect(result1.toShort()).assertEqual(8191 as short);
        let divisor2: Short = new Short(8 as short);
        let result2: Short = maxVal.div(divisor2);
        expect(result2.toShort()).assertEqual(4095 as short);
        let divisor3: Short = new Short(16 as short);
        let result3: Short = maxVal.div(divisor3);
        expect(result3.toShort()).assertEqual(2047 as short);
        let divisor4: Short = new Short(32 as short);
        let result4: Short = maxVal.div(divisor4);
        expect(result4.toShort()).assertEqual(1023 as short);
        expect(maxVal.toShort()).assertEqual(Short.MAX_VALUE);
      }

      {
        let divisor: Short = new Short(3 as short);
        let dividends: short[] = [
          (32760 as short),
          (32761 as short),
          (32762 as short),
          (32763 as short),
          (32764 as short),
          (32765 as short),
          (32766 as short),
          Short.MAX_VALUE
        ];
        let expectedQuotients: short[] = [
          (10920 as short),
          (10920 as short),
          (10920 as short),
          (10921 as short),
          (10921 as short),
          (10921 as short),
          (10922 as short),
          (10922 as short)
        ];
        let count: int = 8;
        for (let i: int = 0; i < count; i++) {
          let dividend: Short = new Short(dividends[i]);
          let result: Short = dividend.div(divisor);
          expect(result.toShort()).assertEqual(expectedQuotients[i]);
          expect(dividend.toShort()).assertEqual(dividends[i]);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_DIV_0500
     * @tc.name testShortDiv_merged5
     * @tc.desc BoundaryOverflow: covers 10 merged test points for Short.div, including division and modulo, fractions and rounding, boundary values, equality consistency, and business scenarios.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortDiv_merged5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let divisor: Short = new Short(3 as short);
        let dividends: short[] = [
          ((-32760) as short),
          ((-32761) as short),
          ((-32762) as short),
          ((-32763) as short),
          ((-32764) as short),
          ((-32765) as short),
          ((-32766) as short),
          ((-32767) as short),
          Short.MIN_VALUE
        ];
        let expectedQuotients: short[] = [
          ((-10920) as short),
          ((-10920) as short),
          ((-10920) as short),
          ((-10921) as short),
          ((-10921) as short),
          ((-10921) as short),
          ((-10922) as short),
          ((-10922) as short),
          ((-10922) as short)
        ];
        let count: int = 9;
        for (let i: int = 0; i < count; i++) {
          let dividend: Short = new Short(dividends[i]);
          let result: Short = dividend.div(divisor);
          expect(result.toShort()).assertEqual(expectedQuotients[i]);
          expect(dividend.toShort()).assertEqual(dividends[i]);
        }
      }

      {
        let pixel16: Short = new Short(32767 as short);
  
        let pixel8: Short = pixel16.div(new Short(256 as short));
        expect(pixel8.toInt()).assertEqual(127);
  
        let restored: Short = pixel8.mul(new Short(256 as short));
        expect(restored.toInt()).assertEqual(32512);
        expect(pixel16.equals(restored)).assertFalse();
      }

      {
        let maxVal: Short = new Short(Short.MAX_VALUE);
        let dividends: short[] = [
          Short.MAX_VALUE,
          (16384 as short),
          (0 as short),
          ((-16384) as short),
          Short.MIN_VALUE
        ];
        let expected: short[] = [
          (1 as short),
          (0 as short),
          (0 as short),
          (0 as short),
          ((-1) as short)
        ];
        for (let i: int = 0; i < dividends.length; i++) {
          let d: Short = new Short(dividends[i]);
          expect(d.div(maxVal).toShort()).assertEqual(expected[i]);
        }
      }

      {
        let minVal: Short = new Short(Short.MIN_VALUE);
        let dividends: short[] = [
          Short.MAX_VALUE,
          (16384 as short),
          (0 as short),
          ((-16384) as short),
          Short.MIN_VALUE
        ];
        let expected: short[] = [
          (0 as short),
          (0 as short),
          (0 as short),
          (0 as short),
          (1 as short)
        ];
        for (let i: int = 0; i < dividends.length; i++) {
          let d: Short = new Short(dividends[i]);
          expect(d.div(minVal).toShort()).assertEqual(expected[i]);
        }
      }

      {
        let value: Short = new Short((-1000) as short);
        let two: Short = new Short(2 as short);
        let expectedSteps: short[] = [
          (-1000) as short, (-500) as short, (-250) as short, (-125) as short,
          (-62) as short, (-31) as short, (-15) as short, (-7) as short,
          (-3) as short, (-1) as short, 0 as short
        ];
        let stepCount: int = 11;
        for (let step: int = 0; step < stepCount; step++) {
          expect(value.toShort()).assertEqual(expectedSteps[step]);
          value = value.div(two);
        }
      }

      {
        let dividends: int[] = [100, 200, 300, 400, 500, 7, 15, 25, (-100), (-7)];
        let divisors: int[] = [3, 7, 11, 3, 7, 2, 4, 3, 3, 2];
        let count: int = 10;
        for (let i: int = 0; i < count; i++) {
          let sd: Short = new Short(Double.toShort(dividends[i]));
          let sv: Short = new Short(Double.toShort(divisors[i]));
          let shortResult: int = sd.div(sv).toInt();
          let jsResult: double = Math.trunc(dividends[i] / divisors[i]);
          expect(shortResult).assertEqual(jsResult);
        }
      }

      {
        let testDividends: int[] = [32767, -32768, 32766, -32767];
        let testDivisors: int[] = [2, 3, 5, 10, 100, -2, -3];
        for (let d of testDividends) {
          for (let r of testDivisors) {
            let sd: Short = new Short(Double.toShort(d));
            let sv: Short = new Short(Double.toShort(r));
            let shortResult: int = sd.div(sv).toInt();
            let jsResult: double = Math.trunc(d / r);
            expect(shortResult).assertEqual(jsResult);
          }
        }
      }

      {
        let distance: Short = new Short(500 as short);
        let time: Short = new Short(30 as short);
        let speed: Short = distance.div(time);
        expect(speed.toShort()).assertEqual(16 as short);
        let totalDist: Short = speed.mul(time);
        expect(totalDist.toShort() <= distance.toShort()).assertTrue();
        let distance2: Short = new Short(1000 as short);
        let time2: Short = new Short(8 as short);
        let speed2: Short = distance2.div(time2);
        expect(speed2.toShort()).assertEqual(125 as short);
      }

      {
        let meters: Short = new Short(15250 as short);
        let thousand: Short = new Short(1000 as short);
        let kilometers: Short = meters.div(thousand);
        expect(kilometers.toShort()).assertEqual(15 as short);
        let remainder: Short = meters.sub(kilometers.mul(thousand));
        expect(remainder.toShort()).assertEqual(250 as short);
        let meters2: Short = new Short(500 as short);
        let km2: Short = meters2.div(thousand);
        expect(km2.toShort()).assertEqual(0 as short);
        let meters3: Short = new Short(32000 as short);
        let km3: Short = meters3.div(thousand);
        expect(km3.toShort()).assertEqual(32 as short);
      }

      {
        let values: Short[] = [
          new Short(10 as short), new Short(20 as short), new Short(30 as short)
        ];
        let sum: Short = new Short(0 as short);
        let valCount: int = 3;
        for (let i: int = 0; i < valCount; i++) {
          sum = sum.add(values[i]);
        }
        expect(sum.toShort()).assertEqual(60 as short);
        let count: Short = new Short(Int.toShort(valCount));
        let simpleAvg: Short = sum.div(count);
        expect(simpleAvg.toShort()).assertEqual(20 as short);
        let values2: Short[] = [
          new Short(7 as short), new Short(8 as short), new Short(9 as short)
        ];
        let sum2: Short = new Short(0 as short);
        for (let i: int = 0; i < valCount; i++) {
          sum2 = sum2.add(values2[i]);
        }
        expect(sum2.toShort()).assertEqual(24 as short);
        let simpleAvg2: Short = sum2.div(count);
        expect(simpleAvg2.toShort()).assertEqual(8 as short);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_DIV_0600
     * @tc.name testShortDiv_merged6
     * @tc.desc BoundaryOverflow: covers 10 merged test points for Short.div, including division and modulo, fractions and rounding, equality consistency, positive values, and negative values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortDiv_merged6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let testPairs: [short, short, short, short][] = [
          [10 as short, 3 as short, 3 as short, 1 as short],
          [(-10) as short, 3 as short, (-3) as short, (-1) as short],
          [10 as short, (-3) as short, (-3) as short, 1 as short],
          [(-10) as short, (-3) as short, 3 as short, (-1) as short],
          [25 as short, 7 as short, 3 as short, 4 as short],
          [(-25) as short, 7 as short, (-3) as short, (-4) as short]
        ];
        let pairCount: int = 6;
        for (let i: int = 0; i < pairCount; i++) {
          let dividend: Short = new Short(testPairs[i][0]);
          let divisor: Short = new Short(testPairs[i][1]);
          let quotient: Short = dividend.div(divisor);
          let product: Short = quotient.mul(divisor);
          let remainder: Short = dividend.sub(product);
          expect(quotient.toShort()).assertEqual(testPairs[i][2]);
          expect(remainder.toShort()).assertEqual(testPairs[i][3]);
          let reconstructed: Short = product.add(remainder);
          expect(reconstructed.toShort()).assertEqual(dividend.toShort());
        }
      }

      {
        let negOne: Short = new Short((-1) as short);
        let posVal: Short = new Short(100 as short);
        let negViaDiv: Short = posVal.div(negOne);
        expect(negViaDiv.toShort()).assertEqual((-100) as short);
        let negVal: Short = new Short((-100) as short);
        let posViaDiv: Short = negVal.div(negOne);
        expect(posViaDiv.toShort()).assertEqual(100 as short);
        let minVal: Short = new Short(Short.MIN_VALUE);
        let overflowed: Short = minVal.div(negOne);
        expect(overflowed.toShort()).assertEqual(Short.MIN_VALUE);
      }

      {
        let dividends: short[] = [-5 as short, -4 as short, -3 as short, -2 as short, -1 as short, 0 as short, 1 as short, 2 as short, 3 as short, 4 as short, 5 as short];
        let divisors: short[] = [2 as short, 3 as short, (-2) as short, (-3) as short];
        let divCount: int = 11;
        let dCount: int = 4;
        for (let d: int = 0; d < dCount; d++) {
          let divisor: Short = new Short(divisors[d]);
          let divisorVal: int = divisors[d];
          for (let v: int = 0; v < divCount; v++) {
            let dividend: Short = new Short(dividends[v]);
            let result: Short = dividend.div(divisor);
            let expected: int = Double.toInt(Math.trunc(dividends[v] / divisorVal));
            expect(result.toShort()).assertEqual(Double.toShort(expected));
          }
        }
      }

      {
        let signalPairs: [short, short, short][] = [
          [1000 as short, 10 as short, 100 as short],
          [500 as short, 25 as short, 20 as short],
          [2000 as short, 50 as short, 40 as short],
          [32767 as short, 100 as short, 327 as short],
          [100 as short, 30 as short, 3 as short]
        ];
        let pairCount: int = 5;
        for (let i: int = 0; i < pairCount; i++) {
          let signal: Short = new Short(signalPairs[i][0]);
          let noise: Short = new Short(signalPairs[i][1]);
          let snr: Short = signal.div(noise);
          expect(snr.toShort()).assertEqual(signalPairs[i][2]);
          let reconstructedSignal: Short = snr.mul(noise);
          expect(reconstructedSignal.toShort() <= signal.toShort()).assertTrue();
        }
      }

      {
        let testData: [short, short][] = [
          [10 as short, 3 as short],
          [100 as short, 7 as short],
          [(-10) as short, 3 as short],
          [(-100) as short, 7 as short],
          [32767 as short, 3 as short],
          [(-32768) as short, 3 as short]
        ];
        let pairCount: int = 6;
        for (let i: int = 0; i < pairCount; i++) {
          let dividend: Short = new Short(testData[i][0]);
          let divisor: Short = new Short(testData[i][1]);
          let quotient: Short = dividend.div(divisor);
          let reconstructed: Short = quotient.mul(divisor);
          expect(reconstructed.equals(dividend)).assertFalse();
        }
  
        let exactDividend: Short = new Short(144 as short);
        let exactDivisor: Short = new Short(12 as short);
        let exactQuotient: Short = exactDividend.div(exactDivisor);
        let exactRecon: Short = exactQuotient.mul(exactDivisor);
        expect(exactRecon.equals(exactDividend)).assertTrue();
      }

      {
        let one: Short = new Short(1 as short);
        let testDividends: short[] = [
          0 as short, 1 as short, -1 as short,
          100 as short, -100 as short,
          32767 as short, -32768 as short,
          255 as short, -255 as short, 42 as short
        ];
        let count: int = 10;
        for (let i: int = 0; i < count; i++) {
          let dividend: Short = new Short(testDividends[i]);
          let result: Short = dividend.div(one);
          expect(result.toShort()).assertEqual(testDividends[i]);
          expect(dividend.toShort()).assertEqual(testDividends[i]);
        }
        expect(one.toShort()).assertEqual(1 as short);
      }

      {
        let one: Short = new Short(1 as short);
        let divisorsGt1: short[] = [2 as short, 3 as short, 10 as short, 100 as short,
          32767 as short, -2 as short, -3 as short, -10 as short, -100 as short, -32767 as short];
        let count: int = 10;
        for (let i: int = 0; i < count; i++) {
          let divisor: Short = new Short(divisorsGt1[i]);
          let result: Short = one.div(divisor);
          expect(result.toShort()).assertEqual(0 as short);
        }
        let divOne: Short = new Short(1 as short);
        expect(one.div(divOne).toShort()).assertEqual(1 as short);
        let divNegOne: Short = new Short(-1 as short);
        expect(one.div(divNegOne).toShort()).assertEqual(-1 as short);
      }

      {
        let primes: short[] = [7 as short, 11 as short, 13 as short, 17 as short, 19 as short, 23 as short, 29 as short, 31 as short];
        let dividend: Short = new Short(1000 as short);
        let expected: short[] = [142 as short, 90 as short, 76 as short, 58 as short, 52 as short, 43 as short, 34 as short, 32 as short];
        let primeCount: int = 8;
        for (let i: int = 0; i < primeCount; i++) {
          let divisor: Short = new Short(primes[i]);
          let result: Short = dividend.div(divisor);
          expect(result.toShort()).assertEqual(expected[i]);
        }
      }

      {
        let maxPos: Short = new Short(Short.MAX_VALUE);
        let minNeg: Short = new Short(Short.MIN_VALUE);
        let posDivisor: Short = new Short(4 as short);
        let negDivisor: Short = new Short((-4) as short);
        let r1: Short = maxPos.div(posDivisor);
        let r2: Short = maxPos.div(negDivisor);
        let r3: Short = minNeg.div(posDivisor);
        let r4: Short = minNeg.div(negDivisor);
        expect(r1.toShort() > 0 as short).assertTrue();
        expect(r2.toShort() < 0 as short).assertTrue();
        expect(r3.toShort() < 0 as short).assertTrue();
        expect(r4.toShort() > 0 as short).assertTrue();
        expect(r1.toShort()).assertEqual(8191 as short);
        expect(r2.toShort()).assertEqual((-8191) as short);
        expect(r3.toShort()).assertEqual((-8192) as short);
        expect(r4.toShort()).assertEqual(8192 as short);
      }

      {
        let powersOf10: short[] = [10 as short, 100 as short, 1000 as short, 10000 as short];
        let dividend: Short = new Short(12345 as short);
        let expected: short[] = [1234 as short, 123 as short, 12 as short, 1 as short];
        let powCount: int = 4;
        for (let i: int = 0; i < powCount; i++) {
          let divisor: Short = new Short(powersOf10[i]);
          let result: Short = dividend.div(divisor);
          expect(result.toShort()).assertEqual(expected[i]);
        }
        let negDividend: Short = new Short((-12345) as short);
        let negExpected: short[] = [(-1234) as short, (-123) as short, (-12) as short, (-1) as short];
        for (let i: int = 0; i < powCount; i++) {
          let divisor: Short = new Short(powersOf10[i]);
          expect(negDividend.div(divisor).toShort()).assertEqual(negExpected[i]);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_DIV_0700
     * @tc.name testShortDiv_merged7
     * @tc.desc BoundaryOverflow / ErrorException: covers 10 merged test points for Short.div, including division and modulo, fractions and rounding, exceptions, zero values, and boundary values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortDiv_merged7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let composites: short[] = [6 as short, 14 as short, 15 as short, 21 as short, 22 as short, 25 as short];
        let dividend: Short = new Short(1000 as short);
        let expected: short[] = [166 as short, 71 as short, 66 as short, 47 as short, 45 as short, 40 as short];
        let compCount: int = 6;
        for (let i: int = 0; i < compCount; i++) {
          let divisor: Short = new Short(composites[i]);
          let result: Short = dividend.div(divisor);
          expect(result.toShort()).assertEqual(expected[i]);
          let product: Short = result.mul(divisor);
          expect(product.toShort() <= dividend.toShort()).assertTrue();
        }
      }

      {
        let maxVal: Short = new Short(Short.MAX_VALUE);
        let oddDivisors: short[] = [3 as short, 5 as short, 7 as short, 9 as short, 11 as short];
        let expected: short[] = [10922 as short, 6553 as short, 4681 as short, 3640 as short, 2978 as short];
        let oddCount: int = 5;
        for (let i: int = 0; i < oddCount; i++) {
          let divisor: Short = new Short(oddDivisors[i]);
          let result: Short = maxVal.div(divisor);
          expect(result.toShort()).assertEqual(expected[i]);
          let product: Short = result.mul(divisor);
          expect(product.toShort() <= maxVal.toShort()).assertTrue();
        }
        expect(maxVal.toShort()).assertEqual(Short.MAX_VALUE);
      }

      {
        let powersOf3: short[] = [3 as short, 9 as short, 27 as short, 81 as short, 243 as short];
        let dividend: Short = new Short(1000 as short);
        let expected: short[] = [333 as short, 111 as short, 37 as short, 12 as short, 4 as short];
        let powCount: int = 5;
        for (let i: int = 0; i < powCount; i++) {
          let divisor: Short = new Short(powersOf3[i]);
          let result: Short = dividend.div(divisor);
          expect(result.toShort()).assertEqual(expected[i]);
        }
        let largeDiv: Short = new Short(3000 as short);
        let divBy9: Short = largeDiv.div(new Short(9 as short));
        expect(divBy9.toShort()).assertEqual(333 as short);
        let divBy81: Short = largeDiv.div(new Short(81 as short));
        expect(divBy81.toShort()).assertEqual(37 as short);
      }

      {
        let primePairs: [short, short, short][] = [
        [97 as short, 13 as short, 7 as short],
        [101 as short, 7 as short, 14 as short],
        [199 as short, 17 as short, 11 as short],
        [(-97) as short, 13 as short, (-7) as short],
        [(-199) as short, 17 as short, (-11) as short],
        [97 as short, (-13) as short, (-7) as short]
        ];
        let pairCount: int = 6;
        for (let i: int = 0; i < pairCount; i++) {
          let dividend: Short = new Short(primePairs[i][0]);
          let divisor: Short = new Short(primePairs[i][1]);
          let result: Short = dividend.div(divisor);
          expect(result.toShort()).assertEqual(primePairs[i][2]);
          let reconstructed: Short = result.mul(divisor);
          expect(reconstructed.equals(dividend)).assertFalse();
        }
      }

      {
        let cases: [short, short, short][] = [
        [2 as short, 5 as short, 0 as short],
        [(-2) as short, 5 as short, 0 as short],
        [2 as short, (-5) as short, 0 as short],
        [(-2) as short, (-5) as short, 0 as short],
        [5 as short, 2 as short, 2 as short],
        [(-5) as short, 2 as short, (-2) as short],
        [5 as short, (-2) as short, (-2) as short],
        [(-5) as short, (-2) as short, 2 as short],
        [10 as short, 3 as short, 3 as short],
        [(-10) as short, 3 as short, (-3) as short],
        ];
        let caseCount: int = 10;
        for (let i: int = 0; i < caseCount; i++) {
          let dividend: Short = new Short(cases[i][0]);
          let divisor: Short = new Short(cases[i][1]);
          let result: Short = dividend.div(divisor);
          expect(result.toShort()).assertEqual(cases[i][2]);
        }
      }

      {
        let zeroDivisor: Short = new Short(0 as short);
        try {
          new Short(10 as short).div(zeroDivisor);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ArithmeticError');
        }
      }

      {
        let dividend: Short = new Short(8 as short);
        try {
          dividend.div(null as Short);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
        }
        expect(dividend.toShort()).assertEqual(8 as short);
      }

      {
        let dividend: Short = new Short(8 as short);
        try {
          dividend.div(undefined as Short);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
        }
      }

      {
        let zeroDivisor: Short = new Short(0 as short);
        try {
          new Short((-5) as short).div(zeroDivisor);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ArithmeticError');
        }
      }

      {
        let minDividend: Short = new Short(Short.MIN_VALUE);
        let zeroDivisor: Short = new Short(0 as short);
        let beforeDiv: short = minDividend.toShort();
        try {
          minDividend.div(zeroDivisor);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ArithmeticError');
        }
        expect(minDividend.toShort()).assertEqual(beforeDiv);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_DIV_0800
     * @tc.name testShortDiv_merged8
     * @tc.desc ErrorException / CrossTypeRoundTrip / RadixConversion: covers 10 merged test points for Short.div, including division and modulo, round-trip conversion, type conversion, radix conversion, and string conversion.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortDiv_merged8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let divisors: short[] = [
          2 as short, 3 as short, 5 as short, 10 as short, 100 as short,
          (-2) as short, (-3) as short, (-5) as short
        ];
        let divCount: int = 8;
        for (let d: int = 0; d < divCount; d++) {
          let divisor: Short = new Short(divisors[d]);
          let testValues: short[] = [
            Short.MIN_VALUE, (-10000) as short, (-1000) as short,
            (-100) as short, (-1) as short, 0 as short, 1 as short,
            100 as short, 1000 as short, 10000 as short, Short.MAX_VALUE
          ];
          let testCount: int = 11;
          for (let v: int = 0; v < testCount; v++) {
            let dividend: Short = new Short(testValues[v]);
            let beforeDividend: short = dividend.toShort();
            let beforeDivisor: short = divisor.toShort();
            dividend.div(divisor);
            expect(dividend.toShort()).assertEqual(beforeDividend);
            expect(divisor.toShort()).assertEqual(beforeDivisor);
          }
        }
        let knownDividend: Short = new Short(120 as short);
        let knownDivisor: Short = new Short(4 as short);
        let knownResult: Short = knownDividend.div(knownDivisor);
        expect(knownResult.toShort()).assertEqual(30 as short);
        expect(knownDividend.toShort()).assertEqual(120 as short);
        expect(knownDivisor.toShort()).assertEqual(4 as short);
      }

      {
        let dividends: int[] = [100, 200, 300, 400, 500];
        let divisor: Short = new Short(3 as short);
  
        let shortResults: int[] = [];
        let truncationErrors: double[] = [];
  
        for (let d of dividends) {
          let sd: Short = new Short(Int.toShort(d));
          let shortQuotient: Short = sd.div(divisor);
          let doubleQuotient: double = sd.toDouble() / divisor.toDouble();
  
          shortResults.push(shortQuotient.toInt());
          truncationErrors.push(doubleQuotient - shortQuotient.toDouble());
        }
  
        expect(shortResults[0]).assertEqual(33);
        expect(truncationErrors[0] > 0.33).assertTrue();
        expect(truncationErrors[0] < 0.34).assertTrue();
      }

      {
        let a: Short = new Short(10 as short);
        let b: Short = new Short(5 as short);
        let c: Short = new Short(3 as short);
        let sumDiv: Short = a.add(b).div(c);
        let divAdd: Short = a.div(c).add(b.div(c));
        expect(sumDiv.toShort()).assertEqual(5 as short);
        expect(divAdd.toShort()).assertEqual(4 as short);
        expect(sumDiv.toShort() >= divAdd.toShort()).assertTrue();
        let d: Short = new Short(20 as short);
        let e: Short = new Short(13 as short);
        let f: Short = new Short(4 as short);
        let sumDiv2: Short = d.add(e).div(f);
        let divAdd2: Short = d.div(f).add(e.div(f));
        expect(sumDiv2.toShort()).assertEqual(8 as short);
        expect(divAdd2.toShort()).assertEqual(8 as short);
      }

      {
        let totalSeconds: Short = new Short(5000 as short);
        let sixty: Short = new Short(60 as short);
        let totalMinutes: Short = totalSeconds.div(sixty);
        expect(totalMinutes.toShort()).assertEqual(83 as short);
        let remainderSeconds: Short = totalSeconds.sub(totalMinutes.mul(sixty));
        expect(remainderSeconds.toShort()).assertEqual(20 as short);
        let hours: Short = totalMinutes.div(sixty);
        expect(hours.toShort()).assertEqual(1 as short);
        let remainderMinutes: Short = totalMinutes.sub(hours.mul(sixty));
        expect(remainderMinutes.toShort()).assertEqual(23 as short);
        let reconstructed: Short = hours.mul(sixty).mul(sixty).add(remainderMinutes.mul(sixty)).add(remainderSeconds);
        expect(reconstructed.toShort()).assertEqual(totalSeconds.toShort());
      }

      {
        let a: Short = new Short(Short.parseInt('240', 10));
        let b: Short = new Short(Short.parseInt('16', 10));
        let result: Short = a.div(b);
        expect(result.toShort()).assertEqual(15 as short);
        let str: string = result.toString();
        let parsedBack: Short = new Short(Short.parseInt(str, 10));
        expect(parsedBack.toShort()).assertEqual(15 as short);
        expect(parsedBack.equals(result)).assertTrue();
      }

      {
        let a: Short = new Short(255 as short);
        let b: Short = new Short(15 as short);
        let result: Short = a.div(b);
        expect(result.toShort()).assertEqual(17 as short);
        let hexStr: string = result.toString(16);
        expect(hexStr).assertEqual('11');
        let octStr: string = result.toString(8);
        expect(octStr).assertEqual('21');
        let binStr: string = result.toString(2);
        expect(binStr).assertEqual('10001');
        let decStr: string = result.toString(10);
        expect(decStr).assertEqual('17');
        let fromHex: Short = new Short(Short.parseInt(hexStr, 16));
        expect(fromHex.equals(result)).assertTrue();
      }

      {
        let dividend: Short = new Short(144 as short);
        let divisor: Short = new Short(12 as short);
        let result: Short = dividend.div(divisor);
        expect(result.toShort()).assertEqual(12 as short);
        let resultStr: string = result.toString();
        let parsed: Short = new Short(Short.parseInt(resultStr, 10));
        expect(parsed.equals(result)).assertTrue();
        expect(parsed.toShort()).assertEqual(result.toShort());
        let resultHex: string = result.toString(16);
        expect(resultHex).assertEqual('c');
        let fromHex: Short = new Short(Short.parseInt(resultHex, 16));
        expect(fromHex.toShort()).assertEqual(12 as short);
      }

      {
        let pageSize: Short = new Short(256 as short);
        let pageIndices: short[] = [0 as short, 1 as short, 5 as short, 10 as short, 100 as short];
        let pageCount: int = 5;
        for (let i: int = 0; i < pageCount; i++) {
          let pageIdx: Short = new Short(pageIndices[i]);
          let offset: Short = pageIdx.mul(pageSize);
          let recoveredIdx: Short = offset.div(pageSize);
          expect(recoveredIdx.toShort()).assertEqual(pageIdx.toShort());
        }
        let offset: Short = new Short(512 as short);
        let pageNum: Short = offset.div(pageSize);
        expect(pageNum.toShort()).assertEqual(2 as short);
        let withinPage: Short = offset.sub(pageNum.mul(pageSize));
        expect(withinPage.toShort()).assertEqual(0 as short);
        let partialOffset: Short = new Short(600 as short);
        let partialPage: Short = partialOffset.div(pageSize);
        expect(partialPage.toShort()).assertEqual(2 as short);
      }

      {
        let pairs: [short, short, byte][] = [
        [100 as short, 4 as short, 25 as byte],
        [255 as short, 2 as short, 127 as byte],
        [(-100) as short, 2 as short, (-50) as byte],
        [200 as short, 10 as short, 20 as byte],
        [(-256) as short, 2 as short, (-128) as byte]
        ];
        let pairCount: int = 5;
        for (let i: int = 0; i < pairCount; i++) {
          let dividend: Short = new Short(pairs[i][0]);
          let divisor: Short = new Short(pairs[i][1]);
          let quotient: Short = dividend.div(divisor);
          expect(quotient.toByte()).assertEqual(pairs[i][2]);
        }
        let extra: Short = new Short(127 as short).div(new Short(1 as short));
        expect(extra.toByte()).assertEqual(127 as byte);
        expect(extra.toShort()).assertEqual(127 as short);
      }

      {
        let two: Short = new Short(2 as short);
        let childIndices: short[] = [2 as short, 3 as short, 4 as short, 5 as short, 6 as short, 7 as short, 10 as short, 15 as short];
        let expectedParents: short[] = [1 as short, 1 as short, 2 as short, 2 as short, 3 as short, 3 as short, 5 as short, 7 as short];
        let idxCount: int = 8;
        for (let i: int = 0; i < idxCount; i++) {
          let child: Short = new Short(childIndices[i]);
          let parent: Short = child.div(two);
          expect(parent.toShort()).assertEqual(expectedParents[i]);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_DIV_0900
     * @tc.name testShortDiv_merged9
     * @tc.desc RadixConversion / Idempotent: covers 10 merged test points for Short.div, including equality consistency, division and modulo, constructor forms, radix conversion, and loop accumulation.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortDiv_merged9', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let low: Short = new Short(0 as short);
        let high: Short = new Short(16 as short);
        let two: Short = new Short(2 as short);
        let expectedMids: short[] = [8 as short, 4 as short, 2 as short, 1 as short, 0 as short];
        let steps: int = 5;
        for (let s: int = 0; s < steps; s++) {
          let range: Short = high.sub(low);
          let mid: Short = low.add(range.div(two));
          expect(mid.toShort()).assertEqual(expectedMids[s]);
          high = mid;
        }
        let low2: Short = new Short(10 as short);
        let high2: Short = new Short(30 as short);
        let range2: Short = high2.sub(low2);
        let mid2: Short = low2.add(range2.div(two));
        expect(mid2.toShort()).assertEqual(20 as short);
      }

      {
        let hexDiv: Short = new Short(0xFF as short);
        let octDiv: Short = new Short(0o77 as short);
        let binDiv: Short = new Short(0b11110000 as short);
        let decDivisor: Short = new Short(16 as short);
        let hexResult: Short = hexDiv.div(decDivisor);
        expect(hexResult.toShort()).assertEqual(15 as short);
        let octResult: Short = octDiv.div(new Short(7 as short));
        expect(octResult.toShort()).assertEqual(9 as short);
        let binResult: Short = binDiv.div(new Short(16 as short));
        expect(binResult.toShort()).assertEqual(15 as short);
        let mixedDiv: Short = hexDiv.div(new Short(15 as short));
        expect(mixedDiv.toShort()).assertEqual(17 as short);
        let crossBase: Short = hexDiv.div(octDiv);
        expect(crossBase.toShort()).assertEqual(4 as short);
      }

      {
        let firstDividend: Short = new Short(8 as short);
        let firstDivisor: Short = new Short(4 as short);
        let firstResultA: Short = firstDividend.div(firstDivisor);
        let firstResultB: Short = firstDividend.div(firstDivisor);
        let firstResultC: Short = firstDividend.div(firstDivisor);
        expect(firstResultA.toShort()).assertEqual(2 as short);
        expect(firstResultB.toShort()).assertEqual(2 as short);
        expect(firstResultC.toShort()).assertEqual(2 as short);
        expect(firstResultB.toShort()).assertEqual(firstResultA.toShort());
        expect(firstResultC.toShort()).assertEqual(firstResultA.toShort());
        let secondDividend: Short = new Short(12 as short);
        let secondDivisor: Short = new Short((-3) as short);
        let secondResultA: Short = secondDividend.div(secondDivisor);
        let secondResultB: Short = secondDividend.div(secondDivisor);
        let secondResultC: Short = secondDividend.div(secondDivisor);
        expect(secondResultA.toShort()).assertEqual((-4) as short);
        expect(secondResultB.toShort()).assertEqual((-4) as short);
        expect(secondResultC.toShort()).assertEqual((-4) as short);
        expect(secondResultB.toShort()).assertEqual(secondResultA.toShort());
        expect(secondResultC.toShort()).assertEqual(secondResultA.toShort());
        let thirdDividend: Short = new Short((-15) as short);
        let thirdDivisor: Short = new Short((-5) as short);
        let thirdResultA: Short = thirdDividend.div(thirdDivisor);
        let thirdResultB: Short = thirdDividend.div(thirdDivisor);
        let thirdResultC: Short = thirdDividend.div(thirdDivisor);
        expect(thirdResultA.toShort()).assertEqual(3 as short);
        expect(thirdResultB.toShort()).assertEqual(3 as short);
        expect(thirdResultC.toShort()).assertEqual(3 as short);
        expect(thirdResultB.toShort()).assertEqual(thirdResultA.toShort());
        expect(thirdResultC.toShort()).assertEqual(thirdResultA.toShort());
      }

      {
        let dividendA: Short = new Short(10 as short);
        let divisorA: Short = new Short(2 as short);
        let dividendB: Short = new Short(10 as short);
        let divisorB: Short = new Short(2 as short);
        let resultA: Short = dividendA.div(divisorA);
        let resultB: Short = dividendB.div(divisorB);
        expect(resultA.toShort()).assertEqual(5 as short);
        expect(resultB.toShort()).assertEqual(5 as short);
        expect(resultB.toShort()).assertEqual(resultA.toShort());
      }

      {
        let dividend: Short = new Short(20 as short);
        let divisor: Short = new Short(4 as short);
        let dividendBefore: short = dividend.toShort();
        let divisorBefore: short = divisor.toShort();
        let result: Short = dividend.div(divisor);
        expect(result.toShort()).assertEqual(5 as short);
        expect(dividend.toShort()).assertEqual(dividendBefore);
        expect(divisor.toShort()).assertEqual(divisorBefore);
      }

      {
        let a: Short = new Short(10 as short);
        let b: Short = new Short(2 as short);
        let aDivB: Short = a.div(b);
        let bDivA: Short = b.div(a);
        expect(aDivB.toShort()).assertEqual(5 as short);
        expect(bDivA.toShort()).assertEqual(0 as short);
        expect(aDivB.toShort() !== bDivA.toShort()).assertTrue();
      }

      {
        let a: Short = new Short(100 as short);
        let b: Short = new Short(4 as short);
        let c: Short = new Short(3 as short);
        let left: Short = (a.div(b)).div(c);
        let right: Short = a.div(b.div(c));
        expect(left.toShort()).assertEqual(8 as short);
        expect(right.toShort()).assertEqual(100 as short);
        expect(left.toShort() !== right.toShort()).assertTrue();
      }

      {
        let posNum: Short = new Short(10 as short);
        let negNum: Short = new Short(-10 as short);
        let divisor: Short = new Short(3 as short);
  
        let posResult: Short = posNum.div(divisor);
        let negResult: Short = negNum.div(divisor);
  
        expect(posResult.toInt()).assertEqual(3);
        expect(negResult.toInt()).assertEqual(-3);
  
        expect(posResult.add(negResult).toInt()).assertEqual(0);
      }

      {
        let a1: Short = new Short(100 as short);
        let b1: Short = new Short(25 as short);
        let r1: Short = a1.div(b1);
        expect(r1.toShort()).assertEqual(4 as short);
  
        let a2: Short = new Short(200 as short);
        let b2: Short = new Short(50 as short);
        let r2: Short = a2.div(b2);
        expect(r2.toShort()).assertEqual(4 as short);
  
        expect(r1.toShort()).assertEqual(r2.toShort());
        expect(r1.equals(r2)).assertTrue();
  
        let a3: Short = new Short(300 as short);
        let b3: Short = new Short(75 as short);
        let r3: Short = a3.div(b3);
        expect(r3.toShort()).assertEqual(4 as short);
  
        expect(r3.toShort()).assertEqual(r1.toShort());
        expect(r3.toShort()).assertEqual(r2.toShort());
  
        let recon1: Short = r1.mul(b1);
        expect(recon1.toShort()).assertEqual(a1.toShort());
        let recon2: Short = r2.mul(b2);
        expect(recon2.toShort()).assertEqual(a2.toShort());
        let recon3: Short = r3.mul(b3);
        expect(recon3.toShort()).assertEqual(a3.toShort());
      }

      {
        let value: Short = new Short(100 as short);
        let divisor: Short = new Short(3 as short);
        let steps: short[] = [];
        let origValue: short = value.toShort();
        let stepCount: int = 5;
        for (let i: int = 0; i < stepCount; i++) {
          steps.push(value.toShort());
          value = value.div(divisor);
        }
        expect(steps[0]).assertEqual(origValue);
        expect(steps[1]).assertEqual(33 as short);
        expect(steps[2]).assertEqual(11 as short);
        expect(steps[3]).assertEqual(3 as short);
        expect(steps[4]).assertEqual(1 as short);
        for (let i: int = 1; i < stepCount; i++) {
          expect(steps[i] <= steps[i - 1]).assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_DIV_1000
     * @tc.name testShortDiv_merged10
     * @tc.desc Idempotent / ArithmeticBitwise: covers 10 merged test points for Short.div, including division and modulo, equality consistency, idempotence, loop accumulation, and constructor forms.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortDiv_merged10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let two: Short = new Short(2 as short);
        let inputSize: Short = new Short(1024 as short);
        let levelSizes: short[] = [];
        let levels: int = 6;
        let current: Short = inputSize;
        for (let l: int = 0; l < levels; l++) {
          levelSizes.push(current.toShort());
          current = current.div(two);
        }
        expect(levelSizes[0]).assertEqual(1024 as short);
        expect(levelSizes[1]).assertEqual(512 as short);
        expect(levelSizes[2]).assertEqual(256 as short);
        expect(levelSizes[3]).assertEqual(128 as short);
        expect(levelSizes[4]).assertEqual(64 as short);
        expect(levelSizes[5]).assertEqual(32 as short);
        for (let l: int = 1; l < levels; l++) {
          expect(levelSizes[l]).assertEqual(Double.toShort(levelSizes[l - 1] / 2));
        }
      }

      {
        let a: Short = new Short(100 as short);
        let b: Short = new Short(3 as short);
        let negA: Short = new Short((-100) as short);
        let posQuotient: Short = a.div(b);
        let negQuotient: Short = negA.div(b);
        let negatedPosQuotient: Short = posQuotient.mul(new Short((-1) as short));
        expect(negatedPosQuotient.equals(negQuotient)).assertTrue();
        expect(negQuotient.compareTo(negatedPosQuotient)).assertEqual(0);
        let c: Short = new Short(50 as short);
        let d: Short = new Short(7 as short);
        let posQ2: Short = c.div(d);
        let negQ2: Short = posQ2.mul(new Short((-1) as short));
        expect(negQ2.compareTo(new Short((-7) as short))).assertEqual(0);
      }

      {
        let dividends: short[] = [100 as short, 200 as short, 1000 as short, 500 as short, 50 as short];
        let divisors: short[] = [7 as short, 3 as short, 33 as short, 11 as short, 100 as short];
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          let dvd: Short = new Short(dividends[i]);
          let dvs: Short = new Short(divisors[i]);
          let quotient: Short = dvd.div(dvs);
          let remaining: int = dividends[i];
          let subtractCount: int = 0;
          while (remaining >= divisors[i]) {
            remaining = remaining - divisors[i];
            subtractCount++;
          }
          expect(subtractCount).assertEqual(quotient.toInt());
          expect(remaining < divisors[i]).assertTrue();
        }
        let negDvd: Short = new Short((-100) as short);
        let posDvs: Short = new Short(7 as short);
        let negQuotient: Short = negDvd.div(posDvs);
        expect(negQuotient.toInt()).assertEqual(-14);
        let negRemaining: int = -100;
        let negCount: int = 0;
        while (negRemaining <= -7) {
          negRemaining = negRemaining + 7;
          negCount++;
        }
        expect(negCount).assertEqual(14);
      }

      {
        let value: Short = new Short(12345 as short);
        let ten: Short = new Short(10 as short);
        let digits: short[] = [];
        let current: Short = value;
        while (current.toShort() > 0 as short) {
          let quotient: Short = current.div(ten);
          let digit: Short = current.sub(quotient.mul(ten));
          digits.push(digit.toShort());
          current = quotient;
        }
        expect(digits.length).assertEqual(5);
        expect(digits[0]).assertEqual(5 as short);
        expect(digits[1]).assertEqual(4 as short);
        expect(digits[2]).assertEqual(3 as short);
        expect(digits[3]).assertEqual(2 as short);
        expect(digits[4]).assertEqual(1 as short);
        let reconstructed: Short = new Short(0 as short);
        for (let i: int = digits.length - 1; i >= 0; i--) {
          reconstructed = reconstructed.mul(ten).add(new Short(digits[i]));
        }
        expect(reconstructed.toShort()).assertEqual(12345 as short);
        let value2: Short = new Short(100 as short);
        let current2: Short = value2;
        let digits2: short[] = [];
        while (current2.toShort() > 0 as short) {
          let q: Short = current2.div(ten);
          let d: Short = current2.sub(q.mul(ten));
          digits2.push(d.toShort());
          current2 = q;
        }
        expect(digits2.length).assertEqual(3);
        expect(digits2[0]).assertEqual(0 as short);
        expect(digits2[1]).assertEqual(0 as short);
        expect(digits2[2]).assertEqual(1 as short);
      }

      {
        let value: Short = new Short(7 as short);
        let beforeValue: short = value.toShort();
        let result: Short = value.div(value);
        expect(result.toShort()).assertEqual(1 as short);
        expect(value.toShort()).assertEqual(beforeValue);
      }

      {
        let dividend: Short = new Short(9 as short);
        let divisor: Short = new Short(1 as short);
        let result: Short = dividend.div(divisor);
        expect(result.compareTo(new Short(9 as short))).assertEqual(0);
        expect(dividend.equals(new Short(9 as short))).assertTrue();
      }

      {
        let a: Short = new Short(100 as short);
        let b: Short = new Short(5 as short);
        let c: Short = new Short(2 as short);
        let chained: Short = (a.div(b)).div(c);
        expect(chained.toShort()).assertEqual(10 as short);
        expect(a.toShort()).assertEqual(100 as short);
        expect(b.toShort()).assertEqual(5 as short);
        expect(c.toShort()).assertEqual(2 as short);
      }

      {
        let cols: Short = new Short(10 as short);
        let testIndices: short[] = [0 as short, 9 as short, 10 as short, 25 as short, 99 as short];
        let indexCount: int = 5;
        for (let i: int = 0; i < indexCount; i++) {
          let flatIndex: Short = new Short(testIndices[i]);
          let row: Short = flatIndex.div(cols);
          let rowTimesCols: Short = row.mul(cols);
          let col: Short = flatIndex.sub(rowTimesCols);
          let reconstructed: Short = row.mul(cols).add(col);
          expect(reconstructed.toShort()).assertEqual(flatIndex.toShort());
          expect(col.toShort() >= 0 as short).assertTrue();
          expect(col.toShort() < cols.toShort()).assertTrue();
        }
      }

      {
        let dividend: Short = new Short(Short.parseInt('144', 10));
        let divisor: Short = new Short(Short.parseInt('12', 10));
        let result: Short = dividend.div(divisor);
        expect(result.toShort()).assertEqual(12 as short);
        expect(result.toInt()).assertEqual(12);
        expect(dividend.toShort()).assertEqual(144 as short);
        expect(divisor.toShort()).assertEqual(12 as short);
      }

      {
        let dividend: Short = new Short(88 as short);
        let divisor: Short = new Short(11 as short);
        let result: Short = dividend.div(divisor);
        expect(result.toShort()).assertEqual(8 as short);
        dividend = new Short(999 as short);
        divisor = new Short(3 as short);
        expect(result.toShort()).assertEqual(8 as short);
        expect(dividend.toShort()).assertEqual(999 as short);
        expect(divisor.toShort()).assertEqual(3 as short);
      }
    });

  });
}