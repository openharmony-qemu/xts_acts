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

export default function shortSubTest(): void {
  describe('ShortSubTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_SUB_0100
     * @tc.name testShortSub_merged1
     * @tc.desc BasicValue: covers 10 merged test points for Short.sub, including negative values, positive values, zero values, algebraic properties, and equality consistency.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortSub_merged1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let leftOperand: Short = new Short(6 as short);
        let rightOperand: Short = new Short(4 as short);
        let difference: Short = leftOperand.sub(rightOperand);
        expect(difference.toShort()).assertEqual(2 as short);
        expect(leftOperand.toShort()).assertEqual(6 as short);
        expect(rightOperand.toShort()).assertEqual(4 as short);
      }

      {
        let leftOperand: Short = new Short(6 as short);
        let rightOperand: Short = new Short((-4) as short);
        let difference: Short = leftOperand.sub(rightOperand);
        expect(difference.toShort()).assertEqual(10 as short);
        expect(leftOperand.toShort()).assertEqual(6 as short);
        expect(rightOperand.toShort()).assertEqual((-4) as short);
      }

      {
        let leftOperand: Short = new Short((-6) as short);
        let rightOperand: Short = new Short((-4) as short);
        let difference: Short = leftOperand.sub(rightOperand);
        expect(difference.toShort()).assertEqual((-2) as short);
        expect(leftOperand.toShort()).assertEqual((-6) as short);
        expect(rightOperand.toShort()).assertEqual((-4) as short);
      }

      {
        let leftOperand: Short = new Short(0 as short);
        let rightOperand: Short = new Short(5 as short);
        let difference: Short = leftOperand.sub(rightOperand);
        expect(difference.toShort()).assertEqual((-5) as short);
        expect(leftOperand.toShort()).assertEqual(0 as short);
        expect(rightOperand.toShort()).assertEqual(5 as short);
      }

      {
        let leftOperand: Short = new Short(5 as short);
        let rightOperand: Short = new Short(0 as short);
        let difference: Short = leftOperand.sub(rightOperand);
        expect(difference.compareTo(new Short(5 as short))).assertEqual(0);
        expect(leftOperand.equals(new Short(5 as short))).assertTrue();
      }

      {
        let leftOperand: Short = new Short(42 as short);
        let rightOperand: Short = new Short(42 as short);
        expect(leftOperand.sub(rightOperand).toShort()).assertEqual(0 as short);
        expect(leftOperand.toShort()).assertEqual(42 as short);
        expect(rightOperand.toShort()).assertEqual(42 as short);
      }

      {
        let leftOperand: Short = new Short((-5) as short);
        let rightOperand: Short = new Short((-12) as short);
        let difference: Short = leftOperand.sub(rightOperand);
        expect(difference.toShort()).assertEqual((7) as short);
        expect(leftOperand.toShort()).assertEqual((-5) as short);
        expect(rightOperand.toShort()).assertEqual((-12) as short);
      }

      {
        let leftOperand: Short = new Short(10 as short);
        let rightOperand: Short = new Short(25 as short);
        expect(leftOperand.sub(rightOperand).toShort()).assertEqual((-15) as short);
        expect(rightOperand.toShort()).assertEqual(25 as short);
      }

      {
        let negativeOperand: Short = new Short((-8) as short);
        let positiveOperand: Short = new Short(15 as short);
        let difference: Short = negativeOperand.sub(positiveOperand);
        expect(difference.toShort()).assertEqual((-23) as short);
        expect(negativeOperand.toShort()).assertEqual((-8) as short);
        expect(positiveOperand.toShort()).assertEqual(15 as short);
      }

      {
        let leftOperand: Short = new Short((-30) as short);
        let rightOperand: Short = new Short((-12) as short);
        let firstDifference: Short = leftOperand.sub(rightOperand);
        let secondDifference: Short = leftOperand.sub(rightOperand);
        let thirdDifference: Short = leftOperand.sub(rightOperand);
        let firstActual: short = firstDifference.toShort();
        let secondActual: short = secondDifference.toShort();
        let thirdActual: short = thirdDifference.toShort();
        expect(firstActual).assertEqual((-18) as short);
        expect(secondActual).assertEqual((-18) as short);
        expect(thirdActual).assertEqual((-18) as short);
        expect(secondActual).assertEqual(firstActual);
        expect(thirdActual).assertEqual(firstActual);
        expect(leftOperand.toShort()).assertEqual((-30) as short);
        expect(rightOperand.toShort()).assertEqual((-12) as short);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_SUB_0200
     * @tc.name testShortSub_merged2
     * @tc.desc BasicValue: covers 10 merged test points for Short.sub, including negative values, positive values, zero values, algebraic properties, and sign handling.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortSub_merged2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let leftOperand: Short = new Short(0 as short);
        let rightOperand: Short = new Short(0 as short);
        let firstDifference: Short = leftOperand.sub(rightOperand);
        let secondDifference: Short = leftOperand.sub(rightOperand);
        let thirdDifference: Short = leftOperand.sub(rightOperand);
        let firstActual: short = firstDifference.toShort();
        let secondActual: short = secondDifference.toShort();
        let thirdActual: short = thirdDifference.toShort();
        expect(firstActual).assertEqual(0 as short);
        expect(secondActual).assertEqual(0 as short);
        expect(thirdActual).assertEqual(0 as short);
        expect(leftOperand.toShort()).assertEqual(0 as short);
        expect(rightOperand.toShort()).assertEqual(0 as short);
      }

      {
        let leftOperand: Short = new Short((-2024) as short);
        let rightOperand: Short = new Short(0 as short);
        let difference: Short = leftOperand.sub(rightOperand);
        expect(difference.compareTo(new Short((-2024) as short))).assertEqual(0);
        expect(leftOperand.equals(new Short((-2024) as short))).assertTrue();
      }

      {
        let firstOperand: Short = new Short(1000 as short);
        let secondOperand: Short = new Short(300 as short);
        let thirdOperand: Short = new Short(200 as short);
        let intermediate: Short = firstOperand.sub(secondOperand);
        let finalResult: Short = intermediate.sub(thirdOperand);
        expect(intermediate.toShort()).assertEqual(700 as short);
        expect(finalResult.toShort()).assertEqual(500 as short);
        expect(firstOperand.toShort()).assertEqual(1000 as short);
        expect(secondOperand.toShort()).assertEqual(300 as short);
        expect(thirdOperand.toShort()).assertEqual(200 as short);
      }

      {
        let nearMin: Short = new Short((-32767) as short);
        let nearMax: Short = new Short(32766 as short);
        let diff1: Short = nearMin.sub(nearMax);
        expect(diff1.toShort()).assertEqual(3 as short);
        let diff2: Short = nearMax.sub(nearMin);
        expect(diff2.toShort()).assertEqual((-3) as short);
        let wide1: int = nearMin.toInt() - nearMax.toInt();
        expect(wide1).assertEqual(-65533);
        let diff3: Short = new Short(Short.MIN_VALUE).sub(new Short(Short.MAX_VALUE));
        expect(diff3.toShort()).assertEqual(1 as short);
        let diff4: Short = new Short(Short.MAX_VALUE).sub(new Short(Short.MIN_VALUE));
        expect(diff4.toShort()).assertEqual((-1) as short);
      }

      {
        let smaller: Short = new Short((-4) as short);
        let larger: Short = new Short((-6) as short);
        let positiveDiff: Short = smaller.sub(larger);
        expect(positiveDiff.toShort()).assertEqual(2 as short);
        let negativeDiff: Short = larger.sub(smaller);
        expect(negativeDiff.toShort()).assertEqual((-2) as short);
        expect(smaller.toShort()).assertEqual((-4) as short);
        expect(larger.toShort()).assertEqual((-6) as short);
      }

      {
        let initial: Short = new Short(10000 as short);
        let deltas: short[] = [100 as short, -200 as short, 300 as short, -400 as short, 500 as short];
  
        let current: Short = initial;
        for (let d of deltas) {
          if (d >= 0) {
            current = current.add(new Short(d));
          } else {
            current = current.sub(new Short(Int.toShort(-d)));
          }
        }
  
        let expected: Short = initial.add(new Short(300 as short));
        expect(current.equals(expected)).assertTrue();
  
        let reversed: Short = current.sub(new Short(300 as short));
        expect(reversed.equals(initial)).assertTrue();
      }

      {
        let f0: Short = new Short(2 as short);
        let f1: Short = new Short(1 as short);
        let result: Short[] = [f0, f1];
        for (let i: int = 2; i < 6; i++) {
          let next: Short = result[i - 2].sub(result[i - 1]);
          result.push(next);
        }
        expect(result[0].toShort()).assertEqual(2 as short);
        expect(result[1].toShort()).assertEqual(1 as short);
        expect(result[2].toShort()).assertEqual(1 as short);
        expect(result[3].toShort()).assertEqual(0 as short);
        expect(result[4].toShort()).assertEqual(1 as short);
        expect(result[5].toShort()).assertEqual((-1) as short);
      }

      {
        let testValues: short[] = [0 as short, 1 as short, 255 as short, 256 as short, 32766 as short, (-1) as short, (-32767) as short];
        for (let i: int = 0; i < testValues.length; i++) {
          let n: short = testValues[i];
          let nShort: Short = new Short(n);
          let nPlusOneRaw: int = n + 1;
          let nPlusOne: Short = new Short(Int.toShort(nPlusOneRaw));
          let diffForward: Short = nPlusOne.sub(nShort);
          expect(diffForward.toShort()).assertEqual(1 as short);
          let diffReverse: Short = nShort.sub(nPlusOne);
          expect(diffReverse.toShort()).assertEqual((-1) as short);
        }
      }

      {
        let a: Short = new Short(100 as short);
        let b: Short = new Short(50 as short);
        expect(Math.abs(a.sub(b).toInt())).assertEqual(Math.abs(b.sub(a).toInt()));
        expect(Math.abs(a.sub(b).toInt())).assertEqual(50);
        expect(Math.abs(b.sub(a).toInt())).assertEqual(50);
      }

      {
        let classifySign = (diff: Short): string => {
          if (diff.toInt() > 0) return 'positive';
          if (diff.toInt() < 0) return 'negative';
          return 'zero';
        };
        let a: Short = new Short(100 as short);
        let b: Short = new Short(50 as short);
        expect(classifySign(a.sub(b))).assertEqual('positive');
        expect(classifySign(b.sub(a))).assertEqual('negative');
        expect(classifySign(a.sub(a))).assertEqual('zero');
        let maxVal: Short = new Short(Short.MAX_VALUE);
        let minVal: Short = new Short(Short.MIN_VALUE);
        expect(classifySign(maxVal.sub(new Short(1 as short)))).assertEqual('positive');
        expect(classifySign(minVal.sub(new Short(1 as short)))).assertEqual('positive');
        expect(classifySign(new Short(0 as short).sub(maxVal))).assertEqual('negative');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_SUB_0300
     * @tc.name testShortSub_merged3
     * @tc.desc BasicValue / BoundaryOverflow: covers 10 merged test points for Short.sub, including boundary values, negative values, fractions and rounding, zero values, and equality consistency.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortSub_merged3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let zero: Short = new Short(0 as short);
        let high: Short = new Short(80 as short);
        let low: Short = new Short(20 as short);
        let diffHL: Short = high.sub(low);
        expect(diffHL.toShort()).assertEqual(60 as short);
        expect(high.compareTo(low) > 0).assertTrue();
        expect(diffHL.isGreaterThan(zero)).assertTrue();
        let diffLH: Short = low.sub(high);
        expect(diffLH.toShort()).assertEqual((-60) as short);
        expect(low.compareTo(high) < 0).assertTrue();
        expect(diffLH.isLessThan(zero)).assertTrue();
        let equalA: Short = new Short(45 as short);
        let equalB: Short = new Short(45 as short);
        let diffEq: Short = equalA.sub(equalB);
        expect(diffEq.toShort()).assertEqual(0 as short);
        expect(equalA.compareTo(equalB)).assertEqual(0);
        expect(diffEq.equals(zero)).assertTrue();
      }

      {
        let maxValue: Short = new Short(Short.MAX_VALUE);
        let oneValue: Short = new Short(1 as short);
        let maxMinusOneResult: Short = maxValue.sub(oneValue);
        expect(maxMinusOneResult.toShort()).assertEqual(32766 as short);
        expect(maxValue.toShort()).assertEqual(Short.MAX_VALUE);
        expect(oneValue.toShort()).assertEqual(1 as short);
      }

      {
        let minValue: Short = new Short(Short.MIN_VALUE);
        let negativeOneValue: Short = new Short((-1) as short);
        let difference: Short = minValue.sub(negativeOneValue);
        expect(difference.toShort()).assertEqual((-32767) as short);
        expect(minValue.toShort()).assertEqual(Short.MIN_VALUE);
        expect(negativeOneValue.toShort()).assertEqual((-1) as short);
      }

      {
        let maxValue: Short = new Short(Short.MAX_VALUE);
        let difference: Short = maxValue.sub(maxValue);
        expect(difference.toShort()).assertEqual(0 as short);
        expect(maxValue.toShort()).assertEqual(Short.MAX_VALUE);
      }

      {
        let minValue: Short = new Short(Short.MIN_VALUE);
        let oneValue: Short = new Short(1 as short);
        let difference: Short = minValue.sub(oneValue);
        expect(difference.toShort()).assertEqual(Short.MAX_VALUE);
        expect(minValue.toShort()).assertEqual(Short.MIN_VALUE);
        expect(oneValue.toShort()).assertEqual(1 as short);
      }

      {
        let maxValue: Short = new Short(Short.MAX_VALUE);
        let negativeOneValue: Short = new Short((-1) as short);
        let difference: Short = maxValue.sub(negativeOneValue);
        expect(difference.toShort()).assertEqual(Short.MIN_VALUE);
        expect(maxValue.toShort()).assertEqual(Short.MAX_VALUE);
        expect(negativeOneValue.toShort()).assertEqual((-1) as short);
      }

      {
        let minValue: Short = new Short(Short.MIN_VALUE);
        let maxValue: Short = new Short(Short.MAX_VALUE);
        let difference: Short = minValue.sub(maxValue);
        expect(difference.toShort()).assertEqual(1 as short);
        expect(minValue.toShort()).assertEqual(Short.MIN_VALUE);
        expect(maxValue.toShort()).assertEqual(Short.MAX_VALUE);
      }

      {
        let maxValue: Short = new Short(Short.MAX_VALUE);
        let minValue: Short = new Short(Short.MIN_VALUE);
        let difference: Short = maxValue.sub(minValue);
        expect(difference.toShort()).assertEqual((-1) as short);
        expect(maxValue.toShort()).assertEqual(Short.MAX_VALUE);
        expect(minValue.toShort()).assertEqual(Short.MIN_VALUE);
      }

      {
        let maxBoundary: Short = new Short(Short.MAX_VALUE);
        let minBoundary: Short = new Short(Short.MIN_VALUE);
        expect(maxBoundary.sub(0 as Short).toShort()).assertEqual(Short.MAX_VALUE);
        expect(minBoundary.sub(0 as Short).toShort()).assertEqual(Short.MIN_VALUE);
      }

      {
        let highByte: Short = new Short(0x0100 as short);
        let lowUnit: Short = new Short(0x0001 as short);
        let diff: Short = highByte.sub(lowUnit);
        expect(diff.toShort()).assertEqual(0x00FF as short);
        expect(diff.toInt()).assertEqual(255);
        let highByteAlt: Short = new Short(0x0200 as short);
        let lowUnitAlt: Short = new Short(0x0003 as short);
        let diffAlt: Short = highByteAlt.sub(lowUnitAlt);
        expect(diffAlt.toShort()).assertEqual(0x01FD as short);
        let expectedInt: int = 0x0200 - 0x0003;
        expect(diffAlt.toInt()).assertEqual(expectedInt);
        expect(highByte.toShort()).assertEqual(0x0100 as short);
        expect(lowUnit.toShort()).assertEqual(0x0001 as short);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_SUB_0400
     * @tc.name testShortSub_merged4
     * @tc.desc BoundaryOverflow: covers 10 merged test points for Short.sub, including boundary values, wrapping, type conversion, division and modulo, and overflow.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortSub_merged4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let zero: Short = new Short(0 as short);
        let one: Short = new Short(1 as short);
        let fullBorrow: Short = zero.sub(one);
        expect(fullBorrow.toShort()).assertEqual((-1) as short);
        expect(fullBorrow.toInt()).assertEqual(-1);
        let unsignedView: int = fullBorrow.toInt() + 65536;
        expect(unsignedView).assertEqual(65535);
        let verifyViaLong: long = zero.toLong().sub(one.toLong());
        expect(verifyViaLong).assertEqual(Long.toLong(-1));
        expect(zero.toShort()).assertEqual(0 as short);
        expect(one.toShort()).assertEqual(1 as short);
      }

      {
        let bufferSize: Short = new Short(256 as short);
        let currentIndex: Short = new Short(0 as short);
        let decrement: Short = new Short(1 as short);
        let rawResult: Short = currentIndex.sub(decrement);
        expect(rawResult.toShort()).assertEqual((-1) as short);
        let wrapped: Short = rawResult.add(bufferSize);
        expect(wrapped.toShort()).assertEqual(255 as short);
        let idx: Short = new Short(10 as short);
        let offset: Short = new Short(15 as short);
        let raw: Short = idx.sub(offset);
        expect(raw.toShort()).assertEqual((-5) as short);
        let wrapped2: Short = raw.add(bufferSize);
        expect(wrapped2.toShort()).assertEqual(251 as short);
        expect(bufferSize.toShort()).assertEqual(256 as short);
      }

      {
        let detectOverflow = (a: Short, b: Short): boolean => {
          return a.sub(b).toInt() !== (a.toInt() - b.toInt());
        };
        let safeA: Short = new Short(100 as short);
        let safeB: Short = new Short(50 as short);
        expect(detectOverflow(safeA, safeB)).assertFalse();
        expect(safeA.sub(safeB).toShort()).assertEqual(50 as short);
        let overflowA: Short = new Short(Short.MAX_VALUE);
        let overflowB: Short = new Short((-2) as short);
        expect(detectOverflow(overflowA, overflowB)).assertTrue();
        let underflowA: Short = new Short(Short.MIN_VALUE);
        let underflowB: Short = new Short(2 as short);
        expect(detectOverflow(underflowA, underflowB)).assertTrue();
        let noOverflowNearMin: Short = new Short(Short.MIN_VALUE);
        let noOverflowZero: Short = new Short(0 as short);
        expect(detectOverflow(noOverflowNearMin, noOverflowZero)).assertFalse();
      }

      {
        let leftOperand: Short = new Short(Double.toShort(1234.9));
        let rightOperand: Short = new Short(Double.toShort(234.7));
        let difference: Short = leftOperand.sub(rightOperand);
        expect(difference.toShort()).assertEqual(1000 as short);
        expect(leftOperand.toShort()).assertEqual(1234 as short);
        expect(rightOperand.toShort()).assertEqual(234 as short);
        let negativeOperand: Short = new Short(Double.toShort(-100.9));
        let negativeDiff: Short = negativeOperand.sub(rightOperand);
        expect(negativeDiff.toShort()).assertEqual((-334) as short);
      }

      {
        let modulo: Short = new Short(12 as short);
        let start: Short = new Short(10 as short);
        let end: Short = new Short(2 as short);
        let rawDiff: Short = end.sub(start);
        expect(rawDiff.toShort()).assertEqual((-8) as short);
        let wrappedDiff: Short = rawDiff.add(modulo);
        expect(wrappedDiff.toShort()).assertEqual(4 as short);
        let rawDiff2: Short = start.sub(end);
        expect(rawDiff2.toShort()).assertEqual(8 as short);
        let start2: Short = new Short(11 as short);
        let end2: Short = new Short(1 as short);
        let rawDiff3: Short = end2.sub(start2);
        expect(rawDiff3.toShort()).assertEqual((-10) as short);
        let wrappedDiff3: Short = rawDiff3.add(modulo);
        expect(wrappedDiff3.toShort()).assertEqual(2 as short);
      }

      {
        let a: Short = new Short(20000 as short);
        let negB: Short = new Short((-5000) as short);
        let b: Short = new Short(5000 as short);
        let subResult: Short = a.sub(negB);
        let addResult: Short = a.add(b);
        expect(subResult.toShort()).assertEqual(25000 as short);
        expect(addResult.toShort()).assertEqual(25000 as short);
        expect(subResult.toShort()).assertEqual(addResult.toShort());
        let nearMin: Short = new Short((-32765) as short);
        let negNearMin: Short = new Short(32765 as short);
        let subOverflow: Short = nearMin.sub(negNearMin);
        let wideResult: int = nearMin.toInt() - negNearMin.toInt();
        expect(wideResult).assertEqual(-65530);
        expect(subOverflow.toShort()).assertEqual(6 as short);
        expect(a.toShort()).assertEqual(20000 as short);
      }

      {
        let leftOperand: Short = new Short(Float.toShort(300.9f));
        let rightOperand: Short = new Short(Float.toShort(50.5f));
        let difference: Short = leftOperand.sub(rightOperand);
        expect(difference.compareTo(new Short(250 as short))).assertEqual(0);
        expect(leftOperand.toShort()).assertEqual(300 as short);
      }

      {
        let nearMaxOperand: Short = new Short(32765 as short);
        let smallOperand: Short = new Short(10 as short);
        let rawDifference: short = nearMaxOperand.sub(smallOperand).toShort();
        expect(rawDifference).assertEqual(32755 as short);
        expect(nearMaxOperand.toShort()).assertEqual(32765 as short);
      }

      {
        let nearMinOperand: Short = new Short((-32767) as short);
        let smallOperand: Short = new Short(1 as short);
        let difference: Short = nearMinOperand.sub(smallOperand);
        expect(difference.equals(new Short((-32768) as short))).assertTrue();
        expect(nearMinOperand.toShort()).assertEqual((-32767) as short);
        expect(smallOperand.toShort()).assertEqual(1 as short);
      }

      {
        let saturatedSubtract = (a: Short, b: Short): Short => {
          let wideResult: int = a.toInt() - b.toInt();
          if (wideResult > Short.MAX_VALUE) {
            return new Short(Short.MAX_VALUE);
          }
          if (wideResult < Short.MIN_VALUE) {
            return new Short(Short.MIN_VALUE);
          }
          return a.sub(b);
        };
        let x: Short = new Short(30000 as short);
        let y: Short = new Short((-10000) as short);
        let rawDiff: Short = x.sub(y);
        let saturatedDiff: Short = saturatedSubtract(x, y);
        expect(rawDiff.toShort()).assertEqual((-25536) as short);
        expect(saturatedDiff.toShort()).assertEqual(Short.MAX_VALUE);
        let z: Short = new Short((-20000) as short);
        let w: Short = new Short(15000 as short);
        let rawDiff2: Short = z.sub(w);
        let saturatedDiff2: Short = saturatedSubtract(z, w);
        expect(rawDiff2.toShort()).assertEqual(30536 as short);
        expect(saturatedDiff2.toShort()).assertEqual(Short.MIN_VALUE);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_SUB_0500
     * @tc.name testShortSub_merged5
     * @tc.desc BoundaryOverflow: covers 10 merged test points for Short.sub, including boundary values, wrapping, zero values, underflow, and positive values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortSub_merged5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let minOperand: Short = new Short(Short.MIN_VALUE);
        let minOperand2: Short = new Short(Short.MIN_VALUE);
        let difference: Short = minOperand.sub(minOperand2);
        expect(difference.toShort()).assertEqual(0 as short);
        expect(minOperand.toShort()).assertEqual(Short.MIN_VALUE);
        expect(minOperand2.toShort()).assertEqual(Short.MIN_VALUE);
      }

      {
        let minOperand: Short = new Short(Short.MIN_VALUE);
        let twoOperand: Short = new Short(2 as short);
        let difference: Short = minOperand.sub(twoOperand);
        expect(difference.toShort()).assertEqual(32766 as short);
        expect(minOperand.toShort()).assertEqual(Short.MIN_VALUE);
        expect(twoOperand.toShort()).assertEqual(2 as short);
      }

      {
        let start: Short = new Short(0 as short);
        let one: Short = new Short(1 as short);
        let expected: short[] = [(-1) as short, (-2) as short, (-3) as short, (-4) as short, (-5) as short,
          (-256) as short, (-32767) as short, (-32768) as short];
        let current: Short = start;
        for (let i: int = 0; i < 5; i++) {
          current = current.sub(one);
          expect(current.toShort()).assertEqual(expected[i]);
        }
        let diff256: Short = start.sub(new Short(256 as short));
        expect(diff256.toShort()).assertEqual(expected[5]);
        let diff32767: Short = start.sub(new Short(32767 as short));
        expect(diff32767.toShort()).assertEqual(expected[6]);
        let diffMin: Short = start.sub(new Short(Int.toShort(32768)));
        expect(diffMin.toShort()).assertEqual(Short.MIN_VALUE);
      }

      {
        let hexMinusOne: Short = new Short(Int.toShort(0xFFFF));
        let hexFive: Short = new Short(Int.toShort(0x0005));
        let difference: Short = hexMinusOne.sub(hexFive);
        expect(difference.toShort()).assertEqual((-6) as short);
        let hexMinusTwo: Short = new Short(Int.toShort(0xFFFE));
        let diff2: Short = hexMinusTwo.sub(hexMinusOne);
        expect(diff2.toShort()).assertEqual((-1) as short);
      }

      {
        let values: Short[] = [
          new Short(100 as short), new Short(350 as short), new Short(200 as short), new Short(500 as short)
        ];
  
        let diffs: Short[] = [];
        for (let i: int = 1; i < values.length; i++) {
          diffs.push(values[i].sub(values[i-1]));
        }
  
        expect(diffs[0].toInt()).assertEqual(250);
        expect(diffs[1].toInt()).assertEqual(-150);
        expect(diffs[2].toInt()).assertEqual(300);
  
        diffs.sort((a, b) => {
          let absA: Short = a.isGreaterEqualThan(new Short(0 as short)) ? a : new Short(0 as short).sub(a);
          let absB: Short = b.isGreaterEqualThan(new Short(0 as short)) ? b : new Short(0 as short).sub(b);
          return absB.compareTo(absA);
        });
        let maxDiff: Short = diffs[0];
        expect(maxDiff.toInt()).assertEqual(300);
      }

      {
        let signal: Short[] = [
          new Short(100 as short), new Short(350 as short), new Short(200 as short),
          new Short(500 as short), new Short(300 as short), new Short(100 as short)
        ];
  
        let diffs: Short[] = [];
        for (let i: int = 1; i < signal.length; i++) {
          diffs.push(signal[i].sub(signal[i - 1]));
        }
  
        expect(diffs[0].toInt()).assertEqual(250);
        expect(diffs[2].toInt()).assertEqual(300);
  
        let diffSum: float = 0.0f;
        for (let d of diffs) { diffSum += d.toFloat(); }
        let diffMean: float = diffSum / diffs.length;
  
        let diffVariance: float = 0.0f;
        for (let d of diffs) {
          let dev: float = d.toFloat() - diffMean;
          diffVariance += dev * dev;
        }
        diffVariance /= diffs.length;
  
        expect(diffMean).assertEqual(0.0f);
        expect(diffVariance).assertEqual(51000.0f);
        expect(diffVariance > 40000f).assertTrue();
      }

      {
        let zeroOperand: Short = new Short(0 as short);
        let maxValue: Short = new Short(Short.MAX_VALUE);
        let difference: Short = zeroOperand.sub(maxValue);
        expect(difference.toShort()).assertEqual((-32767) as short);
        expect(zeroOperand.toShort()).assertEqual(0 as short);
        expect(maxValue.toShort()).assertEqual(Short.MAX_VALUE);
      }

      {
        let zeroOperand: Short = new Short(0 as short);
        let minValue: Short = new Short(Short.MIN_VALUE);
        let difference: Short = zeroOperand.sub(minValue);
        expect(difference.toShort()).assertEqual(Short.MIN_VALUE);
        expect(zeroOperand.toShort()).assertEqual(0 as short);
        expect(minValue.toShort()).assertEqual(Short.MIN_VALUE);
      }

      {
        let negativeOne: Short = new Short((-1) as short);
        let maxValue: Short = new Short(Short.MAX_VALUE);
        let difference: Short = negativeOne.sub(maxValue);
        expect(difference.toShort()).assertEqual(Short.MIN_VALUE);
        expect(negativeOne.toShort()).assertEqual((-1) as short);
        expect(maxValue.toShort()).assertEqual(Short.MAX_VALUE);
      }

      {
        let oneValue: Short = new Short(1 as short);
        let minValue: Short = new Short(Short.MIN_VALUE);
        let difference: Short = oneValue.sub(minValue);
        expect(difference.toShort()).assertEqual((-32767) as short);
        expect(oneValue.toShort()).assertEqual(1 as short);
        expect(minValue.toShort()).assertEqual(Short.MIN_VALUE);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_SUB_0600
     * @tc.name testShortSub_merged6
     * @tc.desc BoundaryOverflow: covers 10 merged test points for Short.sub, including overflow, type conversion, underflow, boundary values, and wrapping.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortSub_merged6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let minValue: Short = new Short(Short.MIN_VALUE);
        let kValues: short[] = [1 as short, 2 as short, 128 as short, 256 as short];
        let expectedResults: short[] = [32767 as short, 32766 as short, 32640 as short, 32512 as short];
        for (let i: int = 0; i < kValues.length; i++) {
          let kOperand: Short = new Short(kValues[i]);
          let difference: Short = minValue.sub(kOperand);
          expect(difference.toShort()).assertEqual(expectedResults[i]);
        }
        expect(minValue.toShort()).assertEqual(Short.MIN_VALUE);
      }

      {
        let pairs: [short, short, byte][] = [
          [100 as short, 35 as short, 65 as byte],
          [(-256) as short, 2 as short, (-2) as byte],
          [32767 as short, 255 as short, 0 as byte],
          [200 as short, 56 as short, (-112) as byte]
        ];
        let pairCount: int = 4;
        for (let i: int = 0; i < pairCount; i++) {
          let minuend: Short = new Short(pairs[i][0]);
          let subtrahend: Short = new Short(pairs[i][1]);
          let diff: Short = minuend.sub(subtrahend);
          expect(diff.toByte()).assertEqual(pairs[i][2]);
        }
      }

      {
        let a: Short = new Short(100 as short);
        let b: Short = new Short(200 as short);
        let ua: int = a.toInt() + 0x8000;
        let ub: int = b.toInt() + 0x8000;
        let borrow: boolean = ua < ub;
        expect(borrow).assertTrue();
        let diff: Short = a.sub(b);
        expect(diff.toShort()).assertEqual((-100) as short);
        let c: Short = new Short(300 as short);
        let d: Short = new Short(100 as short);
        let uc: int = c.toInt() + 0x8000;
        let ud: int = d.toInt() + 0x8000;
        let noBorrow: boolean = uc < ud;
        expect(noBorrow).assertFalse();
        let diff2: Short = c.sub(d);
        expect(diff2.toShort()).assertEqual(200 as short);
      }

      {
        let maxValue: Short = new Short(Short.MAX_VALUE);
        let negKValues: Short[] = [
          new Short((-1) as short),
          new Short((-2) as short),
          new Short((-5) as short)
        ];
        let expectedResults: short[] = [Short.MIN_VALUE, (-32767) as short, (-32764) as short];
        for (let i: int = 0; i < negKValues.length; i++) {
          let difference: Short = maxValue.sub(negKValues[i]);
          expect(difference.toShort()).assertEqual(expectedResults[i]);
        }
        expect(maxValue.toShort()).assertEqual(Short.MAX_VALUE);
      }

      {
        let a: Short = new Short(Short.MIN_VALUE);
        let b: Short = new Short(1 as short);
        let shortResult: Short = a.sub(b);
        let shortIntResult: int = shortResult.toInt();
        expect(shortIntResult).assertEqual(32767);
        let wideIntResult: int = a.toInt() - b.toInt();
        expect(wideIntResult).assertEqual(-32769);
        expect(shortIntResult !== wideIntResult).assertTrue();
      }

      {
        let a: Short = new Short(Short.MIN_VALUE);
        let b: Short = new Short(2 as short);
        let shortResult: Short = a.sub(b);
        let shortResultLong: long = shortResult.toLong();
        let wideResultLong: long = a.toLong().sub(b.toLong());
        expect(shortResultLong.equals(wideResultLong)).assertFalse();
        expect(shortResult.toShort()).assertEqual(32766 as short);
        expect(a.toShort()).assertEqual(Short.MIN_VALUE);
        expect(b.toShort()).assertEqual(2 as short);
      }

      {
        let testPairs: Short[][] = [
          [new Short(Short.MAX_VALUE), new Short(Short.MIN_VALUE)],
          [new Short(Short.MIN_VALUE), new Short(Short.MAX_VALUE)],
          [new Short(Short.MAX_VALUE), new Short((-1) as short)],
          [new Short(Short.MIN_VALUE), new Short(1 as short)],
          [new Short(0 as short), new Short(Short.MIN_VALUE)]
        ];
        for (let i: int = 0; i < testPairs.length; i++) {
          let result: Short = testPairs[i][0].sub(testPairs[i][1]);
          let val: short = result.toShort();
          let inRange: boolean = val >= Short.MIN_VALUE && val <= Short.MAX_VALUE;
          expect(inRange).assertTrue();
        }
      }

      {
        let a: Short = new Short(10 as short);
        let b: Short = new Short(3 as short);
        let forwardResult: Short = a.sub(b);
        expect(forwardResult.toShort()).assertEqual(7 as short);
        let reverseResult: Short = b.sub(a);
        let negatedReverse: Short = new Short(0 as short).sub(reverseResult);
        expect(forwardResult.toShort()).assertEqual(negatedReverse.toShort());
        expect(a.toShort()).assertEqual(10 as short);
        expect(b.toShort()).assertEqual(3 as short);
      }

      {
        let a: Short = new Short(Short.MAX_VALUE);
        let b: Short = new Short(Short.MIN_VALUE);
        let forwardResult: Short = a.sub(b);
        let reverseResult: Short = b.sub(a);
        let negatedReverse: Short = new Short(0 as short).sub(reverseResult);
        expect(forwardResult.toShort()).assertEqual((-1) as short);
        expect(negatedReverse.toShort()).assertEqual((-1) as short);
        expect(forwardResult.toShort()).assertEqual(negatedReverse.toShort());
        expect(a.toShort()).assertEqual(Short.MAX_VALUE);
        expect(b.toShort()).assertEqual(Short.MIN_VALUE);
      }

      {
        let a: Short = new Short(50 as short);
        let b: Short = new Short(10 as short);
        let forwardResult: Short = a.sub(b);
        let reverseResult: Short = b.sub(a);
        expect(forwardResult.toShort()).assertEqual(40 as short);
        expect(reverseResult.toShort()).assertEqual((-40) as short);
        let combined: Short = forwardResult.add(reverseResult);
        expect(combined.toShort()).assertEqual(0 as short);
        let c: Short = new Short(120 as short);
        let d: Short = new Short(75 as short);
        let combined2: Short = c.sub(d).add(d.sub(c));
        expect(combined2.toShort()).assertEqual(0 as short);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_SUB_0700
     * @tc.name testShortSub_merged7
     * @tc.desc BoundaryOverflow: covers 10 merged test points for Short.sub, including equality consistency, overflow, wrapping, boundary values, and negative values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortSub_merged7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let a: Short = new Short(Short.MIN_VALUE);
        let b: Short = new Short(100 as short);
        let diff: Short = a.sub(b);
        expect(diff.toShort()).assertEqual(32668 as short);
        let reconstructed: Short = diff.add(b);
        expect(reconstructed.toShort()).assertEqual(a.toShort());
        expect(reconstructed.equals(a)).assertTrue();
        let c: Short = new Short(Short.MAX_VALUE);
        let d: Short = new Short((-50) as short);
        let diff2: Short = c.sub(d);
        expect(diff2.toShort()).assertEqual((-32719) as short);
        let reconstructed2: Short = diff2.add(d);
        expect(reconstructed2.toShort()).assertEqual(c.toShort());
      }

      {
        let a: Short = new Short(200 as short);
        let b: Short = new Short(75 as short);
        let diffA: Short = a.sub(b);
        expect(diffA.toShort()).assertEqual(Double.toShort(200.0 - 75.0));
        expect(diffA.toInt()).assertEqual(125);
        let c: Short = new Short(50 as short);
        let d: Short = new Short(120 as short);
        let diffB: Short = c.sub(d);
        expect(diffB.toShort()).assertEqual(Double.toShort(50.0 - 120.0));
        expect(diffB.toInt()).assertEqual((-70));
        let e: Short = new Short((-30) as short);
        let f: Short = new Short(90 as short);
        let diffC: Short = e.sub(f);
        expect(diffC.toShort()).assertEqual(Double.toShort(-30.0 - 90.0));
        expect(diffC.toInt()).assertEqual((-120));
        let g: Short = new Short((-100) as short);
        let h: Short = new Short((-40) as short);
        let diffD: Short = g.sub(h);
        expect(diffD.toShort()).assertEqual(Double.toShort(-100.0 - (-40.0)));
        expect(diffD.toInt()).assertEqual((-60));
      }

      {
        let a: Short = new Short(100 as short);
        let b: Short = new Short(20 as short);
        let c: Short = new Short(30 as short);
        let leftResult: Short = a.sub(b).sub(c);
        let rightResult: Short = a.sub(b.add(c));
        expect(leftResult.toShort()).assertEqual(50 as short);
        expect(rightResult.toShort()).assertEqual(50 as short);
        expect(leftResult.toShort()).assertEqual(rightResult.toShort());
        expect(a.toShort()).assertEqual(100 as short);
        expect(b.toShort()).assertEqual(20 as short);
        expect(c.toShort()).assertEqual(30 as short);
      }

      {
        let a: Short = new Short(42 as short);
        let zeroOperand: Short = new Short(0 as short);
        let negated: Short = zeroOperand.sub(a);
        expect(negated.toShort()).assertEqual((-42) as short);
        let explicitNegated: Short = new Short((-42) as short);
        expect(negated.equals(explicitNegated)).assertTrue();
        expect(a.toShort()).assertEqual(42 as short);
      }

      {
        let a: Short = new Short(1000 as short);
        let b: Short = new Short(600 as short);
        let c: Short = new Short(200 as short);
        let ab: Short = a.sub(b);
        let bc: Short = b.sub(c);
        let ca: Short = c.sub(a);
        expect(ab.toShort()).assertEqual(400 as short);
        expect(bc.toShort()).assertEqual(400 as short);
        expect(ca.toShort()).assertEqual((-800) as short);
        let cycleSum: Short = ab.add(bc).add(ca);
        expect(cycleSum.toShort()).assertEqual(0 as short);
        expect(a.toShort()).assertEqual(1000 as short);
        expect(b.toShort()).assertEqual(600 as short);
        expect(c.toShort()).assertEqual(200 as short);
      }

      {
        let timer: Short = new Short(3 as short);
        let decrement: Short = new Short(1 as short);
        timer = timer.sub(decrement);
        expect(timer.toShort()).assertEqual(2 as short);
        timer = timer.sub(decrement);
        expect(timer.toShort()).assertEqual(1 as short);
        timer = timer.sub(decrement);
        expect(timer.toShort()).assertEqual(0 as short);
        timer = timer.sub(decrement);
        let wrapped: boolean = timer.toShort() == (-1) as short;
        expect(wrapped).assertTrue();
        expect(timer.toShort()).assertEqual((-1) as short);
      }

      {
        let N: Short = new Short(16 as short);
        let x: Short = new Short(8 as short);
        let one: Short = new Short(1 as short);
        let decremented: Short = x.sub(one);
        expect(decremented.toShort()).assertEqual(7 as short);
        let wrappedDecrement: Short = decremented.add(N);
        expect(wrappedDecrement.toShort()).assertEqual(23 as short);
        let xAtZero: Short = new Short(0 as short);
        let decrementZero: Short = xAtZero.sub(one);
        expect(decrementZero.toShort()).assertEqual((-1) as short);
        let wrappedZero: Short = decrementZero.add(N);
        expect(wrappedZero.toShort()).assertEqual(15 as short);
      }

      {
        let posVal: Short = new Short(20000 as short);
        let negVal: Short = new Short((-20000) as short);
        let overflowDiff: Short = posVal.sub(negVal);
        expect(overflowDiff.toShort()).assertEqual((-25536) as short);
        let wideDiff: int = posVal.toInt() - negVal.toInt();
        expect(wideDiff).assertEqual(40000);
        let overflowed: boolean = overflowDiff.toInt() !== wideDiff;
        expect(overflowed).assertTrue();
        let noOverflowVal: Short = new Short(100 as short);
        let noOverflowDiff: Short = posVal.sub(noOverflowVal);
        let wideNoOverflow: int = posVal.toInt() - noOverflowVal.toInt();
        expect(noOverflowDiff.toInt()).assertEqual(wideNoOverflow);
      }

      {
        let testConfigs: Short[][] = [
          [new Short(100 as short), new Short(30 as short), new Short(50 as short)],
          [new Short((-20) as short), new Short(10 as short), new Short(35 as short)],
          [new Short(200 as short), new Short(150 as short), new Short(80 as short)],
          [new Short((-5) as short), new Short((-15) as short), new Short(40 as short)]
        ];
        for (let i: int = 0; i < testConfigs.length; i++) {
          let a: Short = testConfigs[i][0];
          let b: Short = testConfigs[i][1];
          let c: Short = testConfigs[i][2];
          let directDiff: Short = a.sub(b);
          let aPlusC: Short = a.add(c);
          let bPlusC: Short = b.add(c);
          let cancelledDiff: Short = aPlusC.sub(bPlusC);
          expect(cancelledDiff.toShort()).assertEqual(directDiff.toShort());
          expect(cancelledDiff.equals(directDiff)).assertTrue();
        }
      }

      {
        let minVal: Short = new Short(Short.MIN_VALUE);
        let negOperands: Short[] = [
          new Short((-1) as short), new Short((-100) as short),
          new Short((-1000) as short), new Short((-16384) as short)
        ];
        for (let i: int = 0; i < negOperands.length; i++) {
          let diff: Short = minVal.sub(negOperands[i]);
          let wideResult: int = minVal.toInt() - negOperands[i].toInt();
          let overflowed: boolean = wideResult > Short.MAX_VALUE || wideResult < Short.MIN_VALUE;
          expect(!overflowed || diff.toInt() !== wideResult).assertTrue();
          let widePositive: boolean = wideResult > 0;
          let shortPositive: boolean = diff.toInt() > 0;
          expect(negOperands[i].toInt() >= 0 || widePositive === shortPositive || overflowed).assertTrue();
        }
        expect(minVal.toShort()).assertEqual(Short.MIN_VALUE);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_SUB_0800
     * @tc.name testShortSub_merged8
     * @tc.desc BoundaryOverflow / ErrorException / CrossTypeRoundTrip: covers 10 merged test points for Short.sub, including type conversion, fractions and rounding, division and modulo, exceptions, and comparison and ordering.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortSub_merged8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let a: Short = new Short(300 as short);
        let b: Short = new Short(50 as short);
        let c: Short = new Short(3 as short);
        let combined: Short = a.sub(b).div(c);
        let separated: Short = a.div(c).sub(b.div(c));
        expect(combined.toShort()).assertEqual(83 as short);
        expect(separated.toShort()).assertEqual(84 as short);
        let d: Short = new Short(1000 as short);
        let e: Short = new Short(300 as short);
        let f: Short = new Short(7 as short);
        let combined2: Short = d.sub(e).div(f);
        expect(combined2.toShort()).assertEqual(100 as short);
        expect(a.toShort()).assertEqual(300 as short);
        expect(b.toShort()).assertEqual(50 as short);
      }

      {
        try {
          new Short(1 as short).sub(null as Short);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
        }
      }

      {
        let leftOperand: Short = new Short(1 as short);
        try {
          leftOperand.sub(undefined as Short);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
        }
        expect(leftOperand.toShort()).assertEqual(1 as short);
      }

      {
        let testValues: short[] = [
          0 as short, 1 as short, (-1) as short, 127 as short, (-128) as short,
          32767 as short, (-32768) as short, 1000 as short, (-2000) as short
        ];
        for (let i: int = 0; i < testValues.length; i++) {
          for (let j: int = 0; j < testValues.length; j++) {
            let a: Short = new Short(testValues[i]);
            let b: Short = new Short(testValues[j]);
            let diff: Short = a.sub(b);
            let wide: int = a.toInt() - b.toInt();
            let modVal: int = ((wide % 65536) + 65536) % 65536;
            let expectedSigned: short = Int.toShort(modVal > 32767 ? modVal - 65536 : modVal);
            expect(diff.toShort()).assertEqual(expectedSigned);
          }
        }
      }

      {
        let a: Short = new Short(1000 as short);
        let b: Short = new Short(3000 as short);
        let diff: Short = a.sub(b);
        expect(diff.toShort()).assertEqual((-2000) as short);
        let signedVal: int = diff.toInt();
        expect(signedVal).assertEqual(-2000);
        let unsignedVal: int = diff.toInt() + 65536;
        expect(unsignedVal).assertEqual(63536);
        let c: Short = new Short(10000 as short);
        let d: Short = new Short(30000 as short);
        let diff2: Short = c.sub(d);
        let signedVal2: int = diff2.toInt();
        let unsignedVal2: int = diff2.toInt() + 65536;
        expect(signedVal2).assertEqual(-20000);
        expect(unsignedVal2).assertEqual(45536);
        expect(a.toShort()).assertEqual(1000 as short);
        expect(b.toShort()).assertEqual(3000 as short);
      }

      {
        let pairs: [short, short][] = [
          [300 as short, 150 as short],
          [50 as short, 200 as short],
          [(-100) as short, (-250) as short],
          [32767 as short, 16383 as short]
        ];
        let pairCount: int = 4;
        for (let i: int = 0; i < pairCount; i++) {
          let left: Short = new Short(pairs[i][0]);
          let right: Short = new Short(pairs[i][1]);
          let difference: Short = left.sub(right);
          let intDiff: int = left.toInt() - right.toInt();
          expect(difference.toFloat()).assertEqual(Int.toFloat(intDiff));
          expect(difference.toDouble()).assertEqual(Int.toDouble(intDiff));
        }
      }

      {
        let a: Short = new Short(0x4321 as short);
        let b: Short = new Short(0x0123 as short);
        let diff: Short = a.sub(b);
        let diffInt: int = diff.toInt();
        let lowByte: int = diffInt & 0xFF;
        let highByte: int = (diffInt >> 8) & 0xFF;
        expect(lowByte).assertEqual(0xFE);
        expect(highByte).assertEqual(0x41);
        let combined: short = Int.toShort((highByte << 8) | lowByte);
        expect(combined).assertEqual(diff.toShort());
        let expectedHex: int = 0x4321 - 0x0123;
        expect(diff.toInt()).assertEqual(expectedHex);
        expect(a.toShort()).assertEqual(0x4321 as short);
        expect(b.toShort()).assertEqual(0x0123 as short);
      }

      {
        let leftOperand: Short = new Short(Byte.toShort(100 as byte));
        let rightOperand: Short = new Short(Byte.toShort(30 as byte));
        let difference: Short = leftOperand.sub(rightOperand);
        expect(difference.toShort()).assertEqual(70 as short);
        expect(leftOperand.toShort()).assertEqual(100 as short);
        expect(rightOperand.toShort()).assertEqual(30 as short);
        let negativeOperand: Short = new Short(Byte.toShort((-40) as byte));
        let negativeDiff: Short = negativeOperand.sub(rightOperand);
        expect(negativeDiff.toShort()).assertEqual((-70) as short);
      }

      {
        let original: Short[] = [
          new Short(100 as short), new Short(250 as short), new Short(180 as short), new Short(400 as short)
        ];
        let deltas: Short[] = [original[0]];
        for (let i: int = 1; i < original.length; i++) {
          deltas.push(original[i].sub(original[i - 1]));
        }
        let decoded: Short[] = [deltas[0]];
        for (let i: int = 1; i < deltas.length; i++) {
          decoded.push(decoded[i - 1].add(deltas[i]));
        }
        for (let i: int = 0; i < original.length; i++) {
          expect(decoded[i].equals(original[i])).assertTrue();
        }
        expect(deltas[0].toShort()).assertEqual(100 as short);
        expect(deltas[1].toShort()).assertEqual(150 as short);
        expect(deltas[2].toShort()).assertEqual((-70) as short);
        expect(deltas[3].toShort()).assertEqual(220 as short);
      }

      {
        let a: Short = new Short(100 as short);
        let b: Short = new Short(200 as short);
        let diff: Short = a.sub(b);
        let unsignedDiff: int = diff.toInt() + 65536;
        let unsignedA: int = a.toInt() + 0x8000;
        let unsignedB: int = b.toInt() + 0x8000;
        let unsignedExpected: int = (unsignedA - unsignedB + 65536) % 65536;
        let unsignedReconstructed: int = unsignedDiff % 65536;
        expect(unsignedReconstructed).assertEqual(unsignedExpected);
        expect(a.toShort()).assertEqual(100 as short);
        expect(b.toShort()).assertEqual(200 as short);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_SUB_0900
     * @tc.name testShortSub_merged9
     * @tc.desc CrossTypeRoundTrip / RadixConversion / Idempotent: covers 10 merged test points for Short.sub, including equality consistency, type conversion, radix conversion, idempotence, and positive values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortSub_merged9', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let a: Short = new Short(1000 as short);
        let b: Short = new Short(3000 as short);
        let diff: Short = a.sub(b);
        expect(diff.toShort()).assertEqual((-2000) as short);
        expect(diff.toString()).assertEqual('-2000');
        let localeStr: string = diff.toLocaleString();
        expect(typeof localeStr).assertEqual('string');
        expect(localeStr).assertEqual('-2,000');
        let c: Short = new Short(5000 as short);
        let d: Short = new Short(2000 as short);
        let diff2: Short = c.sub(d);
        expect(diff2.toShort()).assertEqual(3000 as short);
        expect(diff2.toString()).assertEqual('3000');
        let localeStr2: string = diff2.toLocaleString();
        expect(typeof localeStr2).assertEqual('string');
        expect(a.toShort()).assertEqual(1000 as short);
        expect(b.toShort()).assertEqual(3000 as short);
      }

      {
        let longVal: long = Long.toLong(50000);
        let shortFromLong: Short = new Short(Long.toShort(longVal));
        let normalOperand: Short = new Short(10000 as short);
        let diff: Short = shortFromLong.sub(normalOperand);
        let wideDiff: int = shortFromLong.toInt() - normalOperand.toInt();
        expect(diff.toInt()).assertEqual(wideDiff);
        let expectedShort: short = Int.toShort(Long.toInt(longVal) - 10000);
        expect(diff.toShort()).assertEqual(expectedShort);
        let longVal2: long = Long.toLong(-100000);
        let shortFromLong2: Short = new Short(Long.toShort(longVal2));
        let diff2: Short = shortFromLong2.sub(new Short(1 as short));
        let wideDiff2: int = shortFromLong2.toInt() - 1;
        expect(diff2.toInt()).assertEqual(wideDiff2);
      }

      {
        let literalLeft: Short = new Short(60 as short);
        let intCastLeft: Short = Int.toShort(60);
        let hexLeft: Short = new Short((0x3C) as short);
        let literalRight: Short = new Short(25 as short);
        let intCastRight: Short = Int.toShort(25);
        let hexRight: Short = new Short((0x19) as short);
        let diffA: Short = literalLeft.sub(intCastRight);
        let diffB: Short = intCastLeft.sub(hexRight);
        let diffC: Short = hexLeft.sub(literalRight);
        expect(diffA.toShort()).assertEqual(35 as short);
        expect(diffB.toShort()).assertEqual(35 as short);
        expect(diffC.toShort()).assertEqual(35 as short);
        expect(diffA.toShort()).assertEqual(diffB.toShort());
        expect(diffB.toShort()).assertEqual(diffC.toShort());
      }

      {
        let left: Short = new Short(100 as short);
        let right: Short = new Short(500 as short);
        let rangeLength: Short = right.sub(left);
        expect(rangeLength.toShort()).assertEqual(400 as short);
        let lengthInt: int = rangeLength.toInt();
        let midOffsetInt: int = lengthInt / 2;
        let midOffset: Short = new Short(Int.toShort(midOffsetInt));
        let midpoint: Short = left.add(midOffset);
        expect(midpoint.toShort()).assertEqual(300 as short);
        expect(midpoint.toInt()).assertEqual(300);
        expect(left.toShort()).assertEqual(100 as short);
        expect(right.toShort()).assertEqual(500 as short);
      }

      {
        let leftOperand: Short = new Short(100 as short);
        let rightOperand: Short = new Short(33 as short);
        let firstDifference: Short = leftOperand.sub(rightOperand);
        let secondDifference: Short = leftOperand.sub(rightOperand);
        let thirdDifference: Short = leftOperand.sub(rightOperand);
        let firstActual: short = firstDifference.toShort();
        let secondActual: short = secondDifference.toShort();
        let thirdActual: short = thirdDifference.toShort();
        expect(firstActual).assertEqual(67 as short);
        expect(secondActual).assertEqual(67 as short);
        expect(thirdActual).assertEqual(67 as short);
        expect(secondActual).assertEqual(firstActual);
        expect(thirdActual).assertEqual(firstActual);
        expect(leftOperand.toShort()).assertEqual(100 as short);
        expect(rightOperand.toShort()).assertEqual(33 as short);
      }

      {
        let firstLeftOperand: Short = new Short(80 as short);
        let firstRightOperand: Short = new Short(25 as short);
        let secondLeftOperand: Short = new Short(80 as short);
        let secondRightOperand: Short = new Short(25 as short);
        let firstDifference: Short = firstLeftOperand.sub(firstRightOperand);
        let secondDifference: Short = secondLeftOperand.sub(secondRightOperand);
        let firstActual: short = firstDifference.toShort();
        let secondActual: short = secondDifference.toShort();
        expect(firstActual).assertEqual(55 as short);
        expect(secondActual).assertEqual(55 as short);
        expect(secondActual).assertEqual(firstActual);
        expect(firstLeftOperand.toShort()).assertEqual(80 as short);
        expect(firstRightOperand.toShort()).assertEqual(25 as short);
        expect(secondLeftOperand.toShort()).assertEqual(80 as short);
        expect(secondRightOperand.toShort()).assertEqual(25 as short);
      }

      {
        let leftOperand: Short = new Short(99 as short);
        let rightOperand: Short = new Short(44 as short);
        let initialLeftValue: short = leftOperand.toShort();
        let initialRightValue: short = rightOperand.toShort();
        let iterationLimit: int = 5;
        let iterationCount: int = 0;
        while (iterationCount < iterationLimit) {
          let difference: Short = leftOperand.sub(rightOperand);
          let actualResult: short = difference.toShort();
          let currentLeftValue: short = leftOperand.toShort();
          let currentRightValue: short = rightOperand.toShort();
          expect(actualResult).assertEqual(55 as short);
          expect(currentLeftValue).assertEqual(initialLeftValue);
          expect(currentRightValue).assertEqual(initialRightValue);
          iterationCount++;
        }
        expect(leftOperand.toShort()).assertEqual(99 as short);
        expect(rightOperand.toShort()).assertEqual(44 as short);
      }

      {
        let evenMinusEven: Short = new Short(10 as short).sub(new Short(4 as short));
        expect(Math.abs(evenMinusEven.toInt()) % 2).assertEqual(0);
        let oddMinusOdd: Short = new Short(11 as short).sub(new Short(5 as short));
        expect(Math.abs(oddMinusOdd.toInt()) % 2).assertEqual(0);
        let evenMinusOdd: Short = new Short(10 as short).sub(new Short(5 as short));
        expect(Math.abs(evenMinusOdd.toInt()) % 2).assertEqual(1);
        let oddMinusEven: Short = new Short(11 as short).sub(new Short(4 as short));
        expect(Math.abs(oddMinusEven.toInt()) % 2).assertEqual(1);
        let negEvenMinusEven: Short = new Short((-10) as short).sub(new Short(4 as short));
        expect(Math.abs(negEvenMinusEven.toInt()) % 2).assertEqual(0);
        let negOddMinusEven: Short = new Short((-11) as short).sub(new Short(4 as short));
        expect(Math.abs(negOddMinusEven.toInt()) % 2).assertEqual(1);
        let evenMinusNegEven: Short = new Short(10 as short).sub(new Short((-6) as short));
        expect(Math.abs(evenMinusNegEven.toInt()) % 2).assertEqual(0);
      }

      {
        let leftOperand: Short = new Short(12345 as short);
        let rightOperand: Short = new Short(6789 as short);
        let difference: Short = leftOperand.sub(rightOperand);
        let longLeft: long = leftOperand.toLong();
        let longRight: long = rightOperand.toLong();
        let longDiff: long = longLeft.sub(longRight);
        expect(difference.toShort()).assertEqual(5556 as short);
        expect(difference.toLong()).assertEqual(longDiff);
        expect(leftOperand.toShort()).assertEqual(12345 as short);
        expect(rightOperand.toShort()).assertEqual(6789 as short);
      }

      {
        let a: Short = new Short(100 as short);
        let b: Short = new Short(60 as short);
        let k: Short = new Short(5 as short);
        let aScaled: Short = a.mul(k);
        let bScaled: Short = b.mul(k);
        let scaledDiff: Short = aScaled.sub(bScaled);
        let diff: Short = a.sub(b);
        let diffScaled: Short = diff.mul(k);
        expect(scaledDiff.toShort()).assertEqual(diffScaled.toShort());
        expect(a.toShort()).assertEqual(100 as short);
        expect(b.toShort()).assertEqual(60 as short);
        expect(k.toShort()).assertEqual(5 as short);
      }
    });

  });
}