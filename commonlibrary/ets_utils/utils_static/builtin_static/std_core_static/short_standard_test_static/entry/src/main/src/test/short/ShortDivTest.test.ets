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
} from '@ohos/hypium-static/src/main/indexStatic';
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

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_DIV_1100
     * @tc.name testShortDiv_merged11
     * @tc.desc ArithmeticBitwise: covers 10 merged test points for Short.div, including division and modulo, type conversion, precision, comparison and ordering, and opposite values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortDiv_merged11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let originalSize: Short = new Short(1024 as short);
        let compressedSize: Short = new Short(256 as short);
        let compressionRatio: Short = originalSize.div(compressedSize);
        expect(compressionRatio.toShort()).assertEqual(4 as short);
        let reconstructed: Short = compressedSize.mul(compressionRatio);
        expect(reconstructed.toShort()).assertEqual(originalSize.toShort());
        let originalSize2: Short = new Short(1000 as short);
        let compressedSize2: Short = new Short(300 as short);
        let ratio2: Short = originalSize2.div(compressedSize2);
        expect(ratio2.toShort()).assertEqual(3 as short);
        let recovered: Short = compressedSize2.mul(ratio2);
        expect(recovered.toShort() <= originalSize2.toShort()).assertTrue();
      }

      {
        let totalItems: Short = new Short(100 as short);
        let desiredSamples: Short = new Short(10 as short);
        let stride: Short = totalItems.div(desiredSamples);
        expect(stride.toShort()).assertEqual(10 as short);
        let selectedIndices: short[] = [];
        let sampleCount: int = 10;
        for (let i: int = 0; i < sampleCount; i++) {
          let idx: Short = new Short(Int.toShort(i)).mul(stride);
          selectedIndices.push(idx.toShort());
        }
        expect(selectedIndices[0]).assertEqual(0 as short);
        expect(selectedIndices[5]).assertEqual(50 as short);
        expect(selectedIndices[9]).assertEqual(90 as short);
        let totalItems2: Short = new Short(50 as short);
        let samples2: Short = new Short(8 as short);
        let stride2: Short = totalItems2.div(samples2);
        expect(stride2.toShort()).assertEqual(6 as short);
      }

      {
        let dividends: short[] = [
          100 as short,
          1000 as short,
          10000 as short,
          30000 as short
        ];
        let divisors: short[] = [
          1 as short,
          2 as short,
          5 as short,
          10 as short
        ];
        let expectedQuotients: short[] = [
          100 as short,
          500 as short,
          2000 as short,
          3000 as short
        ];
        let count: int = 4;
        for (let i: int = 0; i < count; i++) {
          let dividend: Short = new Short(dividends[i]);
          let divisor: Short = new Short(divisors[i]);
          let result: Short = dividend.div(divisor);
          expect(result.toShort()).assertEqual(expectedQuotients[i]);
        }
      }

      {
        let dividend: Short = new Short(300 as short);
        let divisor: Short = new Short(4 as short);
        let result: Short = dividend.div(divisor);
        expect(result.toShort()).assertEqual(75 as short);
        expect(result.toByte()).assertEqual(75 as byte);
        expect(result.toInt()).assertEqual(75);
        expect(result.toLong()).assertEqual(Long.toLong(75));
        expect(result.toFloat()).assertEqual(75.0);
        expect(result.toDouble()).assertEqual(75.0);
      }

      {
        let divisor: Short = new Short(7 as short);
        let values: short[] = [
          0 as short,
          7 as short,
          49 as short,
          343 as short,
          2401 as short,
          16807 as short,
          (-7) as short,
          (-49) as short,
          (-343) as short,
          (-2401) as short,
          (-16807) as short
        ];
        let expectedQuotients: short[] = [
          0 as short,
          1 as short,
          7 as short,
          49 as short,
          343 as short,
          2401 as short,
          (-1) as short,
          (-7) as short,
          (-49) as short,
          (-343) as short,
          (-2401) as short
        ];
        let count: int = 11;
        for (let i: int = 0; i < count; i++) {
          let dividend: Short = new Short(values[i]);
          let result: Short = dividend.div(divisor);
          expect(result.toShort()).assertEqual(expectedQuotients[i]);
          expect(dividend.toShort()).assertEqual(values[i]);
        }
      }

      {
        let divisor: Short = new Short(17 as short);
        let dividend170: Short = new Short(170 as short);
        expect(dividend170.div(divisor).toShort()).assertEqual(10 as short);
        let dividend51: Short = new Short(51 as short);
        expect(dividend51.div(divisor).toShort()).assertEqual(3 as short);
        let dividend100: Short = new Short(100 as short);
        expect(dividend100.div(divisor).toShort()).assertEqual(5 as short);
        let dividendNeg170: Short = new Short((-170) as short);
        expect(dividendNeg170.div(divisor).toShort()).assertEqual((-10) as short);
        let dividendNeg51: Short = new Short((-51) as short);
        expect(dividendNeg51.div(divisor).toShort()).assertEqual((-3) as short);
        let dividendNeg100: Short = new Short((-100) as short);
        expect(dividendNeg100.div(divisor).toShort()).assertEqual((-5) as short);
      }

      {
        let dividendA: Short = new Short(100 as short);
        let divisorA: Short = new Short(3 as short);
        let resultA: Short = dividendA.div(divisorA);
        expect(resultA.toShort()).assertEqual(33 as short);
        let dividendB: Short = new Short(100 as short);
        let divisorB: Short = new Short(2 as short);
        let resultB: Short = dividendB.div(divisorB);
        expect(resultB.toShort()).assertEqual(50 as short);
        expect(resultA.compareTo(resultB) < 0).assertTrue();
        expect(resultB.compareTo(resultA) > 0).assertTrue();
        expect(resultA.compareTo(resultA) == 0).assertTrue();
      }

      {
        let pairs: [short, short, short, short][] = [
          [10 as short, 3 as short, 3 as short, 1 as short],
          [10 as short, (-3) as short, (-3) as short, 1 as short],
          [(-10) as short, 3 as short, (-3) as short, (-1) as short],
          [(-10) as short, (-3) as short, 3 as short, (-1) as short],
          [100 as short, 7 as short, 14 as short, 2 as short],
          [(-100) as short, (-7) as short, 14 as short, (-2) as short]
        ];
        for (let i: int = 0; i < pairs.length; i++) {
          let dividend: Short = new Short(pairs[i][0]);
          let divisor: Short = new Short(pairs[i][1]);
          let result: Short = dividend.div(divisor);
          expect(result.toShort()).assertEqual(pairs[i][2]);
          expect(pairs[i][0]).assertEqual((pairs[i][1].mul(pairs[i][2])).add(pairs[i][3]));
        }
      }

      {
        let powersOfTwo: short[] = [
          2 as short, 4 as short, 8 as short, 16 as short,
          32 as short, 64 as short, 128 as short, 256 as short
        ];
        let dividends: short[] = [1024 as short, 1000 as short, (-1024) as short];
        let exactFlags: boolean[] = [true, false, true];
        let expected: short[][] = [
          [512 as short, 256 as short, 128 as short, 64 as short, 32 as short, 16 as short, 8 as short, 4 as short],
          [500 as short, 250 as short, 125 as short, 62 as short, 31 as short, 15 as short, 7 as short, 3 as short],
          [(-512) as short, (-256) as short, (-128) as short, (-64) as short, (-32) as short, (-16) as short, (-8) as short, (-4) as short]
        ];
        for (let d: int = 0; d < dividends.length; d++) {
          let dividend: Short = new Short(dividends[d]);
          for (let p: int = 0; p < powersOfTwo.length; p++) {
            let divisor: Short = new Short(powersOfTwo[p]);
            let result: Short = dividend.div(divisor);
            expect(result.toShort()).assertEqual(expected[d][p]);
            let reconstructed: Short = result.mul(divisor);
            expect(!exactFlags[d] || reconstructed.toShort() == dividend.toShort()).assertTrue();
          }
        }
      }

      {
        let value: Short = new Short(1000 as short);
        let results: short[] = [];
        let count: int = 50;
        for (let i: int = 0; i < count; i++) {
          let divisor: Short = new Short(Int.toShort(i + 2));
          let result: Short = value.div(divisor);
          results.push(result.toShort());
        }
        expect(results.length).assertEqual(50);
        expect(results[0]).assertEqual(500 as short);
        expect(results[1]).assertEqual(333 as short);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_DIV_1200
     * @tc.name testShortDiv_merged12
     * @tc.desc ArithmeticBitwise: covers 10 merged test points for Short.div, including division and modulo, loop accumulation, and fractions and rounding.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortDiv_merged12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let v: Short = new Short(0 as short);
        v = v.add(new Short(100 as short));
        expect(v.toShort()).assertEqual(100 as short);
        v = v.div(new Short(2 as short));
        expect(v.toShort()).assertEqual(50 as short);
        v = v.mul(new Short(3 as short));
        expect(v.toShort()).assertEqual(150 as short);
        v = v.sub(new Short(30 as short));
        expect(v.toShort()).assertEqual(120 as short);
        v = v.div(new Short(4 as short));
        expect(v.toShort()).assertEqual(30 as short);
        v = v.add(new Short(70 as short));
        expect(v.toShort()).assertEqual(100 as short);
        v = v.mul(new Short(2 as short));
        expect(v.toShort()).assertEqual(200 as short);
        v = v.div(new Short(5 as short));
        expect(v.toShort()).assertEqual(40 as short);
        v = v.sub(new Short(10 as short));
        expect(v.toShort()).assertEqual(30 as short);
        v = v.div(new Short(3 as short));
        expect(v.toShort()).assertEqual(10 as short);
      }

      {
        let width: Short = new Short(120 as short);
        let height: Short = new Short(80 as short);
        let commonFactor: Short = new Short(40 as short);
        let ratioW: Short = width.div(commonFactor);
        let ratioH: Short = height.div(commonFactor);
        expect(ratioW.toShort()).assertEqual(3 as short);
        expect(ratioH.toShort()).assertEqual(2 as short);
        let width2: Short = new Short(256 as short);
        let height2: Short = new Short(64 as short);
        let factor2: Short = new Short(64 as short);
        expect(width2.div(factor2).toShort()).assertEqual(4 as short);
        expect(height2.div(factor2).toShort()).assertEqual(1 as short);
      }

      {
        let duration: Short = new Short(100 as short);
        let maxWeight: Short = new Short(100 as short);
        let elapsedTimes: short[] = [0 as short, 25 as short, 50 as short, 75 as short, 100 as short];
        let expectedWeights: short[] = [0 as short, 25 as short, 50 as short, 75 as short, 100 as short];
        let timeCount: int = 5;
        for (let i: int = 0; i < timeCount; i++) {
          let elapsed: Short = new Short(elapsedTimes[i]);
          let scaled: Short = elapsed.mul(maxWeight);
          let weight: Short = scaled.div(duration);
          expect(weight.toShort()).assertEqual(expectedWeights[i]);
        }
      }

      {
        let dividend: Short = new Short(120 as short);
        let divisors: short[] = [2 as short, 3 as short, 4 as short, 5 as short, 6 as short, 10 as short];
        let expectedQuotients: short[] = [60 as short, 40 as short, 30 as short, 24 as short, 20 as short, 12 as short];
        let divCount: int = 6;
        for (let i: int = 0; i < divCount; i++) {
          let divisor: Short = new Short(divisors[i]);
          let quotient: Short = dividend.div(divisor);
          expect(quotient.toShort()).assertEqual(expectedQuotients[i]);
        }
        for (let i: int = 1; i < divCount; i++) {
          let divisor: Short = new Short(divisors[i]);
          let quotient: Short = dividend.div(divisor);
          expect(quotient.toShort() <= expectedQuotients[i - 1]).assertTrue();
        }
      }

      {
        let alignment: Short = new Short(16 as short);
        let addresses: short[] = [0 as short, 16 as short, 32 as short, 48 as short, 64 as short, 128 as short, 256 as short];
        let addrCount: int = 7;
        for (let i: int = 0; i < addrCount; i++) {
          let addr: Short = new Short(addresses[i]);
          let quotient: Short = addr.div(alignment);
          let aligned: Short = quotient.mul(alignment);
          expect(aligned.toShort()).assertEqual(addr.toShort());
        }
        let misaligned: Short = new Short(20 as short);
        let q2: Short = misaligned.div(alignment);
        expect(q2.toShort()).assertEqual(1 as short);
        let floorAligned: Short = q2.mul(alignment);
        expect(floorAligned.toShort()).assertEqual(16 as short);
      }

      {
        let baseDividend1: Short = new Short(12 as short);
        let baseDivisor1: Short = new Short(8 as short);
        let baseResult1: Short = baseDividend1.div(baseDivisor1);
        expect(baseResult1.toShort()).assertEqual(1 as short);
  
        let scales: short[] = [2 as short, 3 as short, 5 as short, 7 as short, 10 as short, 15 as short, 20 as short];
        let scaleCount: int = 7;
        for (let i: int = 0; i < scaleCount; i++) {
          let scale: Short = new Short(scales[i]);
          let scaledDividend: Short = baseDividend1.mul(scale);
          let scaledDivisor: Short = baseDivisor1.mul(scale);
          let scaledResult: Short = scaledDividend.div(scaledDivisor);
          expect(scaledResult.toShort()).assertEqual(baseResult1.toShort());
        }
  
        let baseDividend2: Short = new Short(20 as short);
        let baseDivisor2: Short = new Short(6 as short);
        let baseResult2: Short = baseDividend2.div(baseDivisor2);
        expect(baseResult2.toShort()).assertEqual(3 as short);
  
        for (let i: int = 0; i < scaleCount; i++) {
          let scale: Short = new Short(scales[i]);
          let scaledDividend: Short = baseDividend2.mul(scale);
          let scaledDivisor: Short = baseDivisor2.mul(scale);
          let scaledResult: Short = scaledDividend.div(scaledDivisor);
          expect(scaledResult.toShort()).assertEqual(baseResult2.toShort());
        }
  
        expect(baseResult1.toShort() !== baseResult2.toShort()).assertTrue();
      }

      {
        let maxRunLength: Short = new Short(50 as short);
        let dataLengths: short[] = [100 as short, 250 as short, 500 as short, 1000 as short, 50 as short];
        let expectedRuns: short[] = [2 as short, 5 as short, 10 as short, 20 as short, 1 as short];
        let lenCount: int = 5;
        for (let i: int = 0; i < lenCount; i++) {
          let dataLen: Short = new Short(dataLengths[i]);
          let runCount: Short = dataLen.div(maxRunLength);
          expect(runCount.toShort()).assertEqual(expectedRuns[i]);
          let covered: Short = runCount.mul(maxRunLength);
          let leftover: Short = dataLen.sub(covered);
          expect(leftover.toShort() < maxRunLength.toShort()).assertTrue();
        }
      }

      {
        let dataMin: Short = new Short(0 as short);
        let dataMax: Short = new Short(1000 as short);
        let dataRange: Short = dataMax.sub(dataMin);
        let numBins: Short = new Short(10 as short);
        let binWidth: Short = dataRange.div(numBins);
        expect(binWidth.toShort()).assertEqual(100 as short);
        let testValues: short[] = [0 as short, 50 as short, 100 as short, 550 as short, 999 as short, 1000 as short];
        let expectedBins: short[] = [0 as short, 0 as short, 1 as short, 5 as short, 9 as short, 10 as short];
        let valCount: int = 6;
        for (let i: int = 0; i < valCount; i++) {
          let value: Short = new Short(testValues[i]);
          let binIndex: Short = value.div(binWidth);
          expect(binIndex.toShort()).assertEqual(expectedBins[i]);
        }
      }

      {
        let bankSize: Short = new Short(256 as short);
        let addresses: short[] = [0 as short, 255 as short, 256 as short, 512 as short, 1000 as short, 2048 as short];
        let expectedBanks: short[] = [0 as short, 0 as short, 1 as short, 2 as short, 3 as short, 8 as short];
        let expectedOffsets: short[] = [0 as short, 255 as short, 0 as short, 0 as short, 232 as short, 0 as short];
        let addrCount: int = 6;
        for (let i: int = 0; i < addrCount; i++) {
          let addr: Short = new Short(addresses[i]);
          let bankIdx: Short = addr.div(bankSize);
          expect(bankIdx.toShort()).assertEqual(expectedBanks[i]);
          let offset: Short = addr.sub(bankIdx.mul(bankSize));
          expect(offset.toShort()).assertEqual(expectedOffsets[i]);
        }
      }

      {
        let x0: Short = new Short(0 as short);
        let y0: Short = new Short(0 as short);
        let x1: Short = new Short(10 as short);
        let y1: Short = new Short(3 as short);
        let dx: Short = x1.sub(x0);
        let dy: Short = y1.sub(y0);
        expect(dx.toShort()).assertEqual(10 as short);
        expect(dy.toShort()).assertEqual(3 as short);
        let slopeY: Short = dy.div(dx);
        expect(slopeY.toShort()).assertEqual(0 as short);
        let x1_2: Short = new Short(5 as short);
        let y1_2: Short = new Short(20 as short);
        let dx2: Short = x1_2.sub(x0);
        let dy2: Short = y1_2.sub(y0);
        let slopeY2: Short = dy2.div(dx2);
        expect(slopeY2.toShort()).assertEqual(4 as short);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_DIV_1300
     * @tc.name testShortDiv_merged13
     * @tc.desc ArithmeticBitwise / BusinessScenario: covers 10 merged test points for Short.div, including division and modulo, business scenarios, constructor forms, zero values, and fractions and rounding.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortDiv_merged13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let start: Short = new Short(900 as short);
        let d2: Short = new Short(2 as short);
        let d3: Short = new Short(3 as short);
        let d5: Short = new Short(5 as short);
        let step1: Short = start.div(d2);
        expect(step1.toShort()).assertEqual(450 as short);
        let step2: Short = step1.div(d3);
        expect(step2.toShort()).assertEqual(150 as short);
        let step3: Short = step2.div(d5);
        expect(step3.toShort()).assertEqual(30 as short);
        expect(start.toShort()).assertEqual(900 as short);
        let step1FromStart: Short = start.div(new Short(2 as short));
        let step3viaStep1Start: Short = step1FromStart.div(new Short(3 as short)).div(new Short(5 as short));
        expect(step3viaStep1Start.toShort()).assertEqual(step3.toShort());
      }

      {
        let dividend: Short = new Short(200 as short);
        let prevQuotient: short = Short.MAX_VALUE;
        for (let d: int = 2; d <= 20; d++) {
          let divisor: Short = new Short(Int.toShort(d));
          let quotient: Short = dividend.div(divisor);
          let qVal: short = quotient.toShort();
          expect(qVal <= prevQuotient).assertTrue();
          expect(qVal >= 0 as short).assertTrue();
          prevQuotient = qVal;
        }
        expect(dividend.div(new Short(2 as short)).toShort()).assertEqual(100 as short);
        expect(dividend.div(new Short(10 as short)).toShort()).assertEqual(20 as short);
        expect(dividend.div(new Short(20 as short)).toShort()).assertEqual(10 as short);
      }

      {
        let divisor: Short = new Short(5 as short);
        let dividends: short[] = [14 as short, 15 as short, 17 as short, 19 as short, 20 as short, 24 as short, 25 as short];
        let expectedQuotients: short[] = [2 as short, 3 as short, 3 as short, 3 as short, 4 as short, 4 as short, 5 as short];
        let divCount: int = 7;
        for (let i: int = 0; i < divCount; i++) {
          let dividend: Short = new Short(dividends[i]);
          let quotient: Short = dividend.div(divisor);
          expect(quotient.toShort()).assertEqual(expectedQuotients[i]);
        }
        let plateauLow: Short = new Short(15 as short).div(divisor);
        let plateauHigh: Short = new Short(19 as short).div(divisor);
        let steppedUp: Short = new Short(20 as short).div(divisor);
        expect(plateauLow.toShort()).assertEqual(plateauHigh.toShort());
        expect(steppedUp.toShort()).assertEqual(Int.toShort(plateauLow.toInt() + 1));
      }

      {
        let values: short[] = [100 as short, 200 as short, 300 as short, (-100) as short, (-200) as short];
        let divisor: Short = new Short(3 as short);
        let two: Short = new Short(2 as short);
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          let v: Short = new Short(values[i]);
          let q1: Short = v.div(divisor);
          let doubled: Short = q1.mul(two);
          let restored: Short = doubled.div(two);
          expect(restored.toShort()).assertEqual(q1.toShort());
          expect(restored.equals(q1)).assertTrue();
        }
        let edge: Short = new Short(0 as short);
        let qZero: Short = edge.div(divisor);
        let doubledZero: Short = qZero.mul(two);
        expect(doubledZero.div(two).toShort()).assertEqual(0 as short);
      }

      {
        let dividend: Short = new Short(1000 as short);
        let factor1: Short = new Short(5 as short);
        let factor2: Short = new Short(4 as short);
        let compositeDiv: Short = factor1.mul(factor2);
        expect(compositeDiv.toShort()).assertEqual(20 as short);
        let result: Short = dividend.div(compositeDiv);
        expect(result.toShort()).assertEqual(50 as short);
        let prodDiv2: Short = new Short(3 as short).mul(new Short(7 as short));
        let div2: Short = new Short(210 as short);
        expect(div2.div(prodDiv2).toShort()).assertEqual(10 as short);
        let negProd: Short = new Short((-2) as short).mul(new Short(5 as short));
        let negDiv: Short = new Short(100 as short);
        expect(negDiv.div(negProd).toShort()).assertEqual((-10) as short);
      }

      {
        let totalBill: Short = new Short(1000 as short);
        let people: Short = new Short(3 as short);
  
        let perPerson: Short = totalBill.div(people);
        let remainder: Short = totalBill.sub(perPerson.mul(people));
        expect(perPerson.toInt()).assertEqual(333);
        expect(remainder.toInt()).assertEqual(1);
  
        let reconstructed: Short = perPerson.mul(people).add(remainder);
        expect(reconstructed.equals(totalBill)).assertTrue();
      }

      {
        let readings: Short[] = [
          new Short(100 as short), new Short(200 as short), new Short(300 as short), new Short(400 as short)
        ];
  
        let sum: Short = new Short(0 as short);
        for (let r of readings) {
          sum = sum.add(r);
        }
  
        let count: Short = new Short(Int.toShort(readings.length));
        let avg: Short = sum.div(count);
  
        expect(avg.toInt()).assertEqual(250);
        expect(avg.mul(count).toInt()).assertEqual(1000);
      }

      {
        let originalPrice: Short = new Short(999 as short);
        let discountPercent: Short = new Short(15 as short);
  
        let discount: Short = originalPrice.mul(discountPercent).div(new Short(100 as short));
        let finalPrice: Short = originalPrice.sub(discount);
  
        expect(finalPrice.toInt()).assertEqual(999 - 149);
        expect(discount.toInt()).assertEqual(149);
      }

      {
        let dividend: Short = new Short(100 as short);
        let zeroDivisor: Short = new Short(0 as short);
        let safeResult: int = 0;
  
        try {
          let r: Short = dividend.div(zeroDivisor);
          safeResult = r.toInt();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ArithmeticError');
        }
        expect(safeResult).assertEqual(0);
      }

      {
        let taskQueue: Short[] = [];
        for (let i: int = 0; i < 10; i++) {
          taskQueue.push(new Short(Int.toShort(i * 10 + 10)));
        }
  
        let workerCount: Short = new Short(3 as short);
        let totalTasks: Short = new Short(Int.toShort(taskQueue.length));
  
        let perWorker: Short = totalTasks.div(workerCount);
        let remaining: Short = totalTasks.sub(perWorker.mul(workerCount));
  
        expect(perWorker.toInt()).assertEqual(3);
        expect(remaining.toInt()).assertEqual(1);
  
        let groups: Short[][] = [[], [], []];
        let idx: int = 0;
        while (taskQueue.length > 0) {
          groups[idx % 3].push(taskQueue.shift() as Short);
          idx++;
        }
  
        expect(groups[0].length).assertEqual(4);
        expect(groups[1].length).assertEqual(3);
        expect(groups[2].length).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_DIV_1400
     * @tc.name testShortDiv_merged14
     * @tc.desc BusinessScenario: covers 10 merged test points for Short.div, including business scenarios, division and modulo, containers and references, and fractions and rounding.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortDiv_merged14', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let a: Short = new Short(80 as short);
        let w1: Short = new Short(3 as short);
        let b: Short = new Short(20 as short);
        let w2: Short = new Short(1 as short);
        let weightedSum: Short = a.mul(w1).add(b.mul(w2));
        let totalWeight: Short = w1.add(w2);
        let avg: Short = weightedSum.div(totalWeight);
        expect(weightedSum.toShort()).assertEqual(260 as short);
        expect(totalWeight.toShort()).assertEqual(4 as short);
        expect(avg.toShort()).assertEqual(65 as short);
      }

      {
        let pixelX: Short = new Short(1024 as short);
        let pixelY: Short = new Short(2048 as short);
        let zoomLevels: short[] = [1 as short, 2 as short, 4 as short, 8 as short];
        let expectedX: short[] = [1024 as short, 512 as short, 256 as short, 128 as short];
        let expectedY: short[] = [2048 as short, 1024 as short, 512 as short, 256 as short];
        for (let z: int = 0; z < zoomLevels.length; z++) {
          let divisor: Short = new Short(zoomLevels[z]);
          expect(pixelX.div(divisor).toShort()).assertEqual(expectedX[z]);
          expect(pixelY.div(divisor).toShort()).assertEqual(expectedY[z]);
        }
      }

      {
        let minVal: Short = new Short(0 as short);
        let maxVal: Short = new Short(200 as short);
        let value: Short = new Short(150 as short);
        let range: Short = maxVal.sub(minVal);
        let normalized: Short = value.sub(minVal);
        let ratio: Short = normalized.mul(new Short(100 as short)).div(range);
        expect(range.toShort()).assertEqual(200 as short);
        expect(normalized.toShort()).assertEqual(150 as short);
        expect(ratio.toShort()).assertEqual(75 as short);
        let value2: Short = new Short(50 as short);
        let normalized2: Short = value2.sub(minVal);
        let ratio2: Short = normalized2.mul(new Short(100 as short)).div(range);
        expect(ratio2.toShort()).assertEqual(25 as short);
      }

      {
        let cacheLineSize: Short = new Short(64 as short);
        let totalBytes: Short = new Short(1024 as short);
        let numChunks: Short = totalBytes.div(cacheLineSize);
        expect(numChunks.toShort()).assertEqual(16 as short);
        let transferred: Short = numChunks.mul(cacheLineSize);
        expect(transferred.toShort()).assertEqual(totalBytes.toShort());
        let totalBytes2: Short = new Short(1000 as short);
        let numChunks2: Short = totalBytes2.div(cacheLineSize);
        expect(numChunks2.toShort()).assertEqual(15 as short);
        let transferred2: Short = numChunks2.mul(cacheLineSize);
        expect(transferred2.toShort()).assertEqual(960 as short);
        let remaining: Short = totalBytes2.sub(transferred2);
        expect(remaining.toShort()).assertEqual(40 as short);
      }

      {
        let frameTime: Short = new Short(1000 as short);
        let slotCount: Short = new Short(8 as short);
        let slotDuration: Short = frameTime.div(slotCount);
        expect(slotDuration.toShort()).assertEqual(125 as short);
        let totalAllocated: Short = slotDuration.mul(slotCount);
        expect(totalAllocated.toShort()).assertEqual(1000 as short);
        let frameTime2: Short = new Short(100 as short);
        let slotCount2: Short = new Short(7 as short);
        let slotDuration2: Short = frameTime2.div(slotCount2);
        expect(slotDuration2.toShort()).assertEqual(14 as short);
        let allocated2: Short = slotDuration2.mul(slotCount2);
        expect(allocated2.toShort()).assertEqual(98 as short);
        let unused: Short = frameTime2.sub(allocated2);
        expect(unused.toShort()).assertEqual(2 as short);
      }

      {
        let total: Short = new Short(200 as short);
        let current: Short = new Short(150 as short);
        let hundred: Short = new Short(100 as short);
        let percentage: Short = current.mul(hundred).div(total);
        expect(percentage.toShort()).assertEqual(75 as short);
        let current2: Short = new Short(50 as short);
        let percentage2: Short = current2.mul(hundred).div(total);
        expect(percentage2.toShort()).assertEqual(25 as short);
        let current3: Short = new Short(200 as short);
        let percentage3: Short = current3.mul(hundred).div(total);
        expect(percentage3.toShort()).assertEqual(100 as short);
      }

      {
        let arrayLength: Short = new Short(100 as short);
        let chunkSize: Short = new Short(8 as short);
        let fullChunks: Short = arrayLength.div(chunkSize);
        expect(fullChunks.toShort()).assertEqual(12 as short);
        let remaining: Short = arrayLength.sub(fullChunks.mul(chunkSize));
        expect(remaining.toShort()).assertEqual(4 as short);
        let totalChunks: Short = remaining.equals(new Short(0 as short)) ? fullChunks : fullChunks.add(new Short(1 as short));
        expect(totalChunks.toShort()).assertEqual(13 as short);
      }

      {
        let totalTasks: Short = new Short(50 as short);
        let workerCount: Short = new Short(3 as short);
        let tasksPerWorker: Short = totalTasks.div(workerCount);
        expect(tasksPerWorker.toShort()).assertEqual(16 as short);
        let assigned: Short = tasksPerWorker.mul(workerCount);
        let unassigned: Short = totalTasks.sub(assigned);
        expect(unassigned.toShort()).assertEqual(2 as short);
        let totalTasks2: Short = new Short(100 as short);
        let workerCount2: Short = new Short(4 as short);
        let tasksPerWorker2: Short = totalTasks2.div(workerCount2);
        expect(tasksPerWorker2.toShort()).assertEqual(25 as short);
      }

      {
        let clockFreq: Short = new Short(16000 as short);
        let prescalers: short[] = [1 as short, 2 as short, 4 as short, 8 as short, 16 as short];
        let expectedFreqs: short[] = [16000 as short, 8000 as short, 4000 as short, 2000 as short, 1000 as short];
        let prescalerCount: int = 5;
        for (let i: int = 0; i < prescalerCount; i++) {
          let prescaler: Short = new Short(prescalers[i]);
          let dividedFreq: Short = clockFreq.div(prescaler);
          expect(dividedFreq.toShort()).assertEqual(expectedFreqs[i]);
        }
        let clockFreq2: Short = new Short(32767 as short);
        let prescaler2: Short = new Short(10 as short);
        let result2: Short = clockFreq2.div(prescaler2);
        expect(result2.toShort()).assertEqual(3276 as short);
      }

      {
        let numerator: Short = new Short(22 as short);
        let denominator: Short = new Short(7 as short);
        let approxPi: Short = numerator.div(denominator);
        expect(approxPi.toShort()).assertEqual(3 as short);
        let scale: Short = new Short(100 as short);
        let scaled: Short = numerator.mul(scale).div(denominator);
        expect(scaled.toShort()).assertEqual(314 as short);
        let numerator2: Short = new Short(157 as short);
        let denominator2: Short = new Short(50 as short);
        let scaled2: Short = numerator2.mul(scale).div(denominator2);
        expect(scaled2.toShort()).assertEqual(314 as short);
        let scale2: Short = new Short(100 as short);
        let n1: Short = new Short(3 as short);
        let d1: Short = new Short(8 as short);
        expect(n1.mul(scale2).div(d1).toShort()).assertEqual(37 as short);
        let n2: Short = new Short(1 as short);
        let d2: Short = new Short(3 as short);
        expect(n2.mul(scale2).div(d2).toShort()).assertEqual(33 as short);
        let n3: Short = new Short(5 as short);
        let d3: Short = new Short(6 as short);
        expect(n3.mul(scale2).div(d3).toShort()).assertEqual(83 as short);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_DIV_1500
     * @tc.name testShortDiv_merged15
     * @tc.desc BusinessScenario / Other: covers 10 merged test points for Short.div, including division and modulo, business scenarios, containers and references, loop accumulation, and sliding window.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortDiv_merged15', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let sampleRate: Short = new Short(Int.toShort(22050));
        let decimationFactors: short[] = [2 as short, 4 as short, 8 as short, 10 as short];
        let expectedRates: short[] = [11025 as short, 5512 as short, 2756 as short, 2205 as short];
        let factorCount: int = 4;
        for (let i: int = 0; i < factorCount; i++) {
          let factor: Short = new Short(decimationFactors[i]);
          let downsampledRate: Short = sampleRate.div(factor);
          expect(downsampledRate.toShort()).assertEqual(expectedRates[i]);
        }
        let sampleRate2: Short = new Short(Int.toShort(24000));
        let factor2: Short = new Short(2 as short);
        let rate2: Short = sampleRate2.div(factor2);
        expect(rate2.toShort()).assertEqual(12000 as short);
      }

      {
        let testDividends: short[] = [
          0 as short, 1 as short, 10 as short, 50 as short, 100 as short, 500 as short
        ];
        let divisors: short[] = [3 as short, 5 as short, 7 as short, 10 as short];
        let divCount: int = 4;
        let testCount: int = 6;
        for (let d: int = 0; d < divCount; d++) {
          let divisor: Short = new Short(divisors[d]);
          let absDivisor: short = divisors[d];
          for (let v: int = 0; v < testCount; v++) {
            let dividend: Short = new Short(testDividends[v]);
            let quotient: Short = dividend.div(divisor);
            let product: Short = quotient.mul(divisor);
            let remainder: Short = dividend.sub(product);
            expect(remainder.toShort() >= 0 as short).assertTrue();
            expect(remainder.toShort() < absDivisor).assertTrue();
          }
        }
      }

      {
        let pDividend: Short = new Short(Char.toShort(c'P'));
        let spaceDivisor: Short = new Short(Char.toShort(c' '));
        let upperResult: Short = pDividend.div(spaceDivisor);
        expect(upperResult.toShort()).assertEqual(2 as short);
        let aDividend: Short = new Short(Char.toShort(c'a'));
        let capitalADivisor: Short = new Short(Char.toShort(c'A'));
        expect(aDividend.div(capitalADivisor).toShort()).assertEqual(1 as short);
        let zeroDigit: Short = new Short(Char.toShort(c'0'));
        let fiveDigit: Short = new Short(Char.toShort(c'5'));
        expect(zeroDigit.div(fiveDigit).toShort()).assertEqual(0 as short);
        expect(pDividend.toShort()).assertEqual(80 as short);
        expect(spaceDivisor.toShort()).assertEqual(32 as short);
      }

      {
        let dividend: Short = new Short(12 as short);
        let divisor: Short = new Short(3 as short);
        let result: Short = dividend.div(divisor);
        expect(result.toShort()).assertEqual(4 as short);
        expect(result === dividend).assertFalse();
        expect(result === divisor).assertFalse();
        expect(dividend.toShort()).assertEqual(12 as short);
        expect(divisor.toShort()).assertEqual(3 as short);
      }

      {
        let maxVal: Short = new Short(1000 as short);
        let minVal: Short = new Short(0 as short);
        let range: Short = maxVal.sub(minVal);
        let numLevels: Short = new Short(8 as short);
        let stepSize: Short = range.div(numLevels);
        expect(stepSize.toShort()).assertEqual(125 as short);
        let testValue: Short = new Short(500 as short);
        let quantizedLevel: Short = testValue.div(stepSize);
        expect(quantizedLevel.toShort()).assertEqual(4 as short);
        let reconstructedMin: Short = quantizedLevel.mul(stepSize);
        expect(reconstructedMin.toShort()).assertEqual(500 as short);
        let testValue2: Short = new Short(630 as short);
        let quantizedLevel2: Short = testValue2.div(stepSize);
        expect(quantizedLevel2.toShort()).assertEqual(5 as short);
      }

      {
        let a: Short = new Short(10 as short);
        let b: Short = new Short(14 as short);
        let c: Short = new Short(3 as short);
        let d: Short = new Short(5 as short);
        let e: Short = new Short(30 as short);
        let f: Short = new Short(7 as short);
        let sum: Short = a.add(b);
        let div1: Short = sum.div(c);
        let mul: Short = div1.mul(d);
        let div2: Short = e.div(f);
        let result: Short = mul.sub(div2);
        expect(sum.toShort()).assertEqual(24 as short);
        expect(div1.toShort()).assertEqual(8 as short);
        expect(mul.toShort()).assertEqual(40 as short);
        expect(div2.toShort()).assertEqual(4 as short);
        expect(result.toShort()).assertEqual(36 as short);
      }

      {
        let signalLength: Short = new Short(16 as short);
        let two: Short = new Short(2 as short);
        let stageNumbers: short[] = [1 as short, 2 as short, 4 as short, 8 as short];
        let expectedSpans: short[] = [8 as short, 4 as short, 2 as short, 1 as short];
        let stageCount: int = 4;
        for (let i: int = 0; i < stageCount; i++) {
          let stage: Short = new Short(stageNumbers[i]);
          let stageSpan: Short = signalLength.div(two.mul(stage));
          expect(stageSpan.toShort()).assertEqual(expectedSpans[i]);
        }
        let signalLength2: Short = new Short(32 as short);
        let stage2: Short = new Short(4 as short);
        let span2: Short = signalLength2.div(two.mul(stage2));
        expect(span2.toShort()).assertEqual(4 as short);
      }

      {
        let ratio: Short = new Short(2 as short);
        let startTerm: Short = new Short(5 as short);
        let geoTerms: short[] = [];
        let termCount: int = 6;
        let current: Short = startTerm;
        for (let i: int = 0; i < termCount; i++) {
          geoTerms.push(current.toShort());
          current = current.mul(ratio);
        }
        expect(geoTerms[0]).assertEqual(5 as short);
        expect(geoTerms[1]).assertEqual(10 as short);
        expect(geoTerms[5]).assertEqual(160 as short);
        for (let i: int = 1; i < termCount; i++) {
          let termN: Short = new Short(geoTerms[i]);
          let termPrev: Short = new Short(geoTerms[i - 1]);
          let divResult: Short = termN.div(termPrev);
          expect(divResult.toShort()).assertEqual(ratio.toShort());
        }
      }

      {
        let a: Short = new Short(180 as short);
        let b: Short = new Short(120 as short);
        let commonDivisors: short[] = [2 as short, 2 as short, 3 as short, 5 as short];
        let gcdSteps: int = 4;
        for (let i: int = 0; i < gcdSteps; i++) {
          let div: Short = new Short(commonDivisors[i]);
          a = a.div(div);
          b = b.div(div);
        }
        expect(a.toShort()).assertEqual(3 as short);
        expect(b.toShort()).assertEqual(2 as short);
        let a2: Short = new Short(256 as short);
        let b2: Short = new Short(64 as short);
        let step1: Short = new Short(2 as short);
        a2 = a2.div(step1);
        b2 = b2.div(step1);
        a2 = a2.div(step1);
        b2 = b2.div(step1);
        a2 = a2.div(step1);
        b2 = b2.div(step1);
        a2 = a2.div(step1);
        b2 = b2.div(step1);
        a2 = a2.div(step1);
        b2 = b2.div(step1);
        a2 = a2.div(step1);
        b2 = b2.div(step1);
        expect(a2.toShort()).assertEqual(4 as short);
        expect(b2.toShort()).assertEqual(1 as short);
      }

      {
        let newReadings: short[] = [100 as short, 150 as short, 200 as short, 250 as short, 300 as short];
        let avg: Short = new Short(newReadings[0]);
        let readingCount: int = 5;
        for (let i: int = 1; i < readingCount; i++) {
          let n: Short = new Short(Int.toShort(i + 1));
          let nMinus1: Short = new Short(Int.toShort(i));
          let oldSum: Short = avg.mul(nMinus1);
          let newReading: Short = new Short(newReadings[i]);
          let newSum: Short = oldSum.add(newReading);
          avg = newSum.div(n);
        }
        expect(avg.toShort()).assertEqual(200 as short);
        let simpleAvg: Short = new Short(0 as short);
        let sum: Short = new Short(0 as short);
        for (let i: int = 0; i < readingCount; i++) {
          sum = sum.add(new Short(newReadings[i]));
        }
        simpleAvg = sum.div(new Short(Int.toShort(readingCount)));
        expect(simpleAvg.toShort()).assertEqual(avg.toShort());
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_DIV_1600
     * @tc.name testShortDiv_merged16
     * @tc.desc Other: covers 2 merged test points for Short.div, including equality consistency, loop accumulation, algebraic properties, and division and modulo.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortDiv_merged16', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let a: Short = new Short(500 as short);
        let b: Short = new Short(7 as short);
        let c: Short = new Short(21 as short);
        let quotient: Short = a.div(b);
        expect(quotient.toShort()).assertEqual(71 as short);
        let result: Short = quotient.sub(c);
        expect(result.toShort()).assertEqual(50 as short);
        let expected: Short = new Short(50 as short);
        expect(result.equals(expected)).assertTrue();
        let a2: Short = new Short(300 as short);
        let b2: Short = new Short(11 as short);
        let c2: Short = new Short(15 as short);
        let q2: Short = a2.div(b2);
        let r2: Short = q2.sub(c2);
        let exp2: Short = new Short(12 as short);
        expect(r2.equals(exp2)).assertTrue();
      }

      {
        let a: Short = new Short(200 as short);
        let b: Short = new Short(7 as short);
        let quotient: Short = a.div(b);
        expect(quotient.toShort()).assertEqual(28 as short);
        let afterAddZero: Short = quotient.add(new Short(0 as short));
        let afterSubZero: Short = quotient.sub(new Short(0 as short));
        let afterMulOne: Short = quotient.mul(new Short(1 as short));
        let afterDivOne: Short = quotient.div(new Short(1 as short));
        expect(afterAddZero.equals(quotient)).assertTrue();
        expect(afterSubZero.equals(quotient)).assertTrue();
        expect(afterMulOne.equals(quotient)).assertTrue();
        expect(afterDivOne.equals(quotient)).assertTrue();
        expect(afterAddZero.toShort()).assertEqual(28 as short);
        expect(afterSubZero.toShort()).assertEqual(28 as short);
        expect(afterMulOne.toShort()).assertEqual(28 as short);
        expect(afterDivOne.toShort()).assertEqual(28 as short);
      }
    });

  });
}