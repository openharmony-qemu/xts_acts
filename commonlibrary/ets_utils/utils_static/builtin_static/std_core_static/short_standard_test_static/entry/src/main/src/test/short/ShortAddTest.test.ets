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

export default function shortAddTest(): void {
  describe('ShortAddTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_ADD_0100
     * @tc.name testShortAdd_merged1
     * @tc.desc BasicValue: covers 10 merged test points for Short.add, including negative values, positive values, zero values, algebraic properties, and equality consistency.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortAdd_merged1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let left: Short = new Short(1 as short);
        let right: Short = new Short(2 as short);
        let result: Short = left.add(right);
        expect(result.toShort()).assertEqual(3 as short);
        expect(left.toShort()).assertEqual(1 as short);
        expect(right.toShort()).assertEqual(2 as short);
      }

      {
        let left: Short = new Short(5 as short);
        let right: Short = new Short((-5) as short);
        let result: Short = left.add(right);
        expect(result.toShort()).assertEqual(0 as short);
        expect(left.toShort()).assertEqual(5 as short);
        expect(right.toShort()).assertEqual((-5) as short);
      }

      {
        let positiveOperand: Short = new Short(100 as short);
        let negativeOperand: Short = new Short((-30) as short);
        let result: Short = positiveOperand.add(negativeOperand);
        expect(result.compareTo(new Short(70 as short))).assertEqual(0);
        expect(positiveOperand.toShort()).assertEqual(100 as short);
        expect(negativeOperand.toShort()).assertEqual((-30) as short);
      }

      {
        let leftNegativeOperand: Short = new Short((-10) as short);
        let rightNegativeOperand: Short = new Short((-20) as short);
        let result: Short = leftNegativeOperand.add(rightNegativeOperand);
        expect(result.toShort()).assertEqual((-30) as short);
        expect(leftNegativeOperand.toShort()).assertEqual((-10) as short);
        expect(rightNegativeOperand.toShort()).assertEqual((-20) as short);
      }

      {
        let positiveOperand: Short = new Short(2048 as short);
        let zeroOperand: Short = new Short(0 as short);
        let positiveResult: Short = positiveOperand.add(zeroOperand);
        expect(positiveResult.toShort()).assertEqual(2048 as short);
        expect(positiveOperand.toShort()).assertEqual(2048 as short);
        expect(zeroOperand.toShort()).assertEqual(0 as short);
  
        let negativeOperand: Short = new Short((-2048) as short);
        let negativeResult: Short = negativeOperand.add(zeroOperand);
        expect(negativeResult.toShort()).assertEqual((-2048) as short);
        expect(negativeOperand.toShort()).assertEqual((-2048) as short);
      }

      {
        let positive: Short = new Short(50 as short);
        let negative: Short = new Short((-200) as short);
        let result: Short = positive.add(negative);
        expect(result.toShort()).assertEqual((-150) as short);
        expect(positive.toShort()).assertEqual(50 as short);
        expect(negative.toShort()).assertEqual((-200) as short);
      }

      {
        let values: short[] = [0 as short, 5 as short, 16383 as short, (-7) as short, (-128) as short, (-16383) as short, (-32767) as short];
        let valueCount: int = 7;
        for (let i: int = 0; i < valueCount; i++) {
          let a: Short = new Short(values[i]);
          let absInt: int = Math.abs(a.toInt());
          let absVal: Short = new Short(Int.toShort(absInt));
          let sum: Short = a.add(absVal);
          let expectedSum: int = (a.toInt() >= 0) ? (2 * a.toInt()) : 0;
          expect(sum.toInt()).assertEqual(expectedSum);
        }
      }

      {
        let negativeZero: Short = new Short((-0) as short);
        let five: Short = new Short(5 as short);
        let result: Short = negativeZero.add(five);
        expect(result.toShort()).assertEqual(5 as short);
        expect(negativeZero.toShort()).assertEqual(0 as short);
        expect(five.toShort()).assertEqual(5 as short);
      }

      {
        let left: Short = new Short(Char.toShort(c'A'));
        let right: Short = new Short(Char.toShort(c'\u4E2D'));
        let result: Short = left.add(right);
        expect(result.toShort()).assertEqual(20078 as short);
      }

      {
        let left: Short = new Short(Byte.toShort((-50) as byte));
        let right: Short = new Short(Byte.toShort((-30) as byte));
        let result: Short = left.add(right);
        expect(result.toShort()).assertEqual((-80) as short);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_ADD_0200
     * @tc.name testShortAdd_merged2
     * @tc.desc BasicValue / BoundaryOverflow: covers 10 merged test points for Short.add, including boundary values, negative values, zero values, overflow, and fractions and rounding.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortAdd_merged2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let limbA: Short = new Short((-1) as short);
        let limbB: Short = new Short(1 as short);
        let sum: Short = limbA.add(limbB);
        expect(sum.toShort()).assertEqual(0 as short);
        let allOnes: Short = new Short((-1) as short);
        let isAllOnes: boolean = limbA.equals(allOnes);
        let carryOut: boolean = isAllOnes && (sum.toInt() === 0);
        expect(carryOut).assertTrue();
        let limbC: Short = new Short(Short.MAX_VALUE);
        let sum2: Short = limbC.add(limbC);
        expect(sum2.toShort()).assertEqual((-2) as short);
        expect(limbA.toShort()).assertEqual((-1) as short);
        expect(limbB.toShort()).assertEqual(1 as short);
      }

      {
        let a: Short = new Short(10 as short);
        let b: Short = new Short(20 as short);
        let c: Short = new Short(30 as short);
        let d: Short = new Short((-60) as short);
        let step1: Short = a.add(b);
        let step2: Short = step1.add(c);
        let step3: Short = step2.add(d);
        expect(step3.toShort()).assertEqual(0 as short);
        expect(step1.toShort()).assertEqual(30 as short);
        expect(step2.toShort()).assertEqual(60 as short);
      }

      {
        let start: Short = new Short(1 as short);
        let inc: Short = new Short(5 as short);
        let current: Short = start;
        for (let i: int = 0; i < 100; i++) {
          current = current.add(inc);
        }
        expect(current.toShort()).assertEqual(501 as short);
        let zero: Short = new Short(0 as short);
        expect(current.isGreaterThan(zero)).assertTrue();
      }

      {
        let pos: Short = new Short(50 as short);
        let neg: Short = new Short((-100) as short);
        let result: Short = pos.add(neg);
        expect(result.toShort()).assertEqual((-50) as short);
        let zero: Short = new Short(0 as short);
        expect(result.isLessThan(zero)).assertTrue();
        let startedPositive: boolean = pos.isGreaterThan(zero);
        let endedNegative: boolean = result.isLessThan(zero);
        expect(startedPositive).assertTrue();
        expect(endedNegative).assertTrue();
      }

      {
        let maxValue: Short = new Short(Short.MAX_VALUE);
        let one: Short = new Short(1 as short);
        let result: Short = maxValue.add(one);
        expect(result.toShort()).assertEqual(Short.MIN_VALUE);
        expect(maxValue.toShort()).assertEqual(Short.MAX_VALUE);
        expect(one.toShort()).assertEqual(1 as short);
      }

      {
        let minValue: Short = new Short(Short.MIN_VALUE);
        let negativeOne: Short = new Short((-1) as short);
        let result: Short = minValue.add(negativeOne);
        expect(result.toShort()).assertEqual(Short.MAX_VALUE);
        expect(minValue.toShort()).assertEqual(Short.MIN_VALUE);
        expect(negativeOne.toShort()).assertEqual((-1) as short);
      }

      {
        let maxLeft: Short = new Short(Short.MAX_VALUE);
        let maxRight: Short = new Short(Short.MAX_VALUE);
        let result: Short = maxLeft.add(maxRight);
        expect(result.toShort()).assertEqual((-2) as short);
        expect(maxLeft.toShort()).assertEqual(Short.MAX_VALUE);
        expect(maxRight.toShort()).assertEqual(Short.MAX_VALUE);
      }

      {
        let minLeft: Short = new Short(Short.MIN_VALUE);
        let minRight: Short = new Short(Short.MIN_VALUE);
        let result: Short = minLeft.add(minRight);
        expect(result.toShort()).assertEqual(0 as short);
        expect(minLeft.toShort()).assertEqual(Short.MIN_VALUE);
        expect(minRight.toShort()).assertEqual(Short.MIN_VALUE);
      }

      {
        let maxValue: Short = new Short(Short.MAX_VALUE);
        let minValue: Short = new Short(Short.MIN_VALUE);
        let result: Short = maxValue.add(minValue);
        expect(result.toShort()).assertEqual((-1) as short);
        expect(maxValue.toShort()).assertEqual(Short.MAX_VALUE);
        expect(minValue.toShort()).assertEqual(Short.MIN_VALUE);
      }

      {
        let maxValue: Short = new Short(Short.MAX_VALUE);
        let minValue: Short = new Short(Short.MIN_VALUE);
        let zero: Short = new Short(0 as short);
        let maxResult: Short = maxValue.add(zero);
        let minResult: Short = minValue.add(zero);
        expect(maxResult.toShort()).assertEqual(Short.MAX_VALUE);
        expect(minResult.toShort()).assertEqual(Short.MIN_VALUE);
        expect(maxValue.toShort()).assertEqual(Short.MAX_VALUE);
        expect(minValue.toShort()).assertEqual(Short.MIN_VALUE);
        expect(zero.toShort()).assertEqual(0 as short);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_ADD_0300
     * @tc.name testShortAdd_merged3
     * @tc.desc BoundaryOverflow: covers 10 merged test points for Short.add, including overflow, boundary values, wrapping, equality consistency, and fractions and rounding.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortAdd_merged3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let sizes: short[] = [10 as short, 16 as short, 17 as short, 128 as short];
        let aligns: short[] = [8 as short, 8 as short, 8 as short, 64 as short];
        let expected: short[] = [16 as short, 16 as short, 24 as short, 128 as short];
        let count: int = 4;
        for (let i: int = 0; i < count; i++) {
          let size: Short = new Short(sizes[i]);
          let align: Short = new Short(aligns[i]);
          let adjusted: Short = size.add(align.sub(new Short(1 as short)));
          let quotient: Short = adjusted.div(align);
          let aligned: Short = quotient.mul(align);
          expect(aligned.toShort()).assertEqual(expected[i]);
        }
      }

      {
        let nearMin: Short = new Short((-32767) as short);
        let negativeOne: Short = new Short((-1) as short);
        let result: Short = nearMin.add(negativeOne);
        expect(result.toShort()).assertEqual(Short.MIN_VALUE);
        expect(nearMin.toShort()).assertEqual((-32767) as short);
        expect(negativeOne.toShort()).assertEqual((-1) as short);
      }

      {
        let cases: [short, short][] = [
          [(-1) as short, 1 as short],
          [1000 as short, (-1) as short],
          [Short.MIN_VALUE, Short.MIN_VALUE],
          [Short.MAX_VALUE, 1 as short]
        ];
        let caseCount: int = 4;
        for (let i: int = 0; i < caseCount; i++) {
          let left: Short = new Short(cases[i][0]);
          let right: Short = new Short(cases[i][1]);
          let result: Short = left.add(right);
          let unsignedA: int = left.toInt() & 0xFFFF;
          let unsignedB: int = right.toInt() & 0xFFFF;
          let unsignedSum: int = (unsignedA + unsignedB) & 0xFFFF;
          let unsignedResult: int = result.toInt() & 0xFFFF;
          expect(unsignedResult).assertEqual(unsignedSum);
        }
      }

      {
        let triples: [short, short, short][] = [
          [(-5) as short, (-3) as short, 2 as short],
          [(-100) as short, 50 as short, (-25) as short],
          [100 as short, (-200) as short, 50 as short]
        ];
        let tripleCount: int = 3;
        for (let i: int = 0; i < tripleCount; i++) {
          let a: Short = new Short(triples[i][0]);
          let b: Short = new Short(triples[i][1]);
          let c: Short = new Short(triples[i][2]);
          let leftAssoc: Short = a.add(b).add(c);
          let rightAssoc: Short = a.add(b.add(c));
          expect(leftAssoc.toShort()).assertEqual(rightAssoc.toShort());
        }
      }

      {
        let nearMax: Short = new Short(32766 as short);
        let one: Short = new Short(1 as short);
        let result: Short = nearMax.add(one);
        expect(result.toShort()).assertEqual(Short.MAX_VALUE);
        expect(result.toFloat()).assertEqual(32767.0f);
        expect(result.toDouble()).assertEqual(32767.0);
        expect(nearMax.toShort()).assertEqual(32766 as short);
        expect(one.toShort()).assertEqual(1 as short);
      }

      {
        let a: Short = new Short(20000 as short);
        let b: Short = new Short(20000 as short);
        let c: Short = new Short(10000 as short);
        let left: Short = a.add(b).add(c);
        let right: Short = a.add(b.add(c));
        expect(left.toShort()).assertEqual((-15536) as short);
        expect(right.toShort()).assertEqual((-15536) as short);
        expect(left.equals(right)).assertTrue();
  
        let d: Short = new Short((-20000) as short);
        let e: Short = new Short((-20000) as short);
        let f: Short = new Short((-10000) as short);
        let left2: Short = d.add(e).add(f);
        let right2: Short = d.add(e.add(f));
        expect(left2.toShort()).assertEqual(15536 as short);
        expect(right2.toShort()).assertEqual(15536 as short);
        expect(left2.equals(right2)).assertTrue();
      }

      {
        let negativeTruncated: Short = new Short(Double.toShort(-3.9));
        let addend: Short = new Short(5 as short);
        let sum: Short = negativeTruncated.add(addend);
        expect(negativeTruncated.toShort()).assertEqual((-3) as short);
        expect(sum.toShort()).assertEqual(2 as short);
        expect(addend.toShort()).assertEqual(5 as short);
      }

      {
        let a: Short = new Short(10 as short);
        let b: Short = new Short(25 as short);
        let c: Short = new Short(3 as short);
        let sumProduct: Short = a.add(b).mul(c);
        let productSum: Short = a.mul(c).add(b.mul(c));
        expect(sumProduct.toShort()).assertEqual(105 as short);
        expect(productSum.toShort()).assertEqual(105 as short);
        expect(sumProduct.equals(productSum)).assertTrue();
        expect(a.toShort()).assertEqual(10 as short);
        expect(b.toShort()).assertEqual(25 as short);
      }

      {
        let pairs: [short, short][] = [
          [32766 as short, 2 as short],
          [32767 as short, 1 as short],
          [32765 as short, 3 as short],
          [30000 as short, 2768 as short]
        ];
        let pairCount: int = 4;
        for (let i: int = 0; i < pairCount; i++) {
          let left: Short = new Short(pairs[i][0]);
          let right: Short = new Short(pairs[i][1]);
          let result: Short = left.add(right);
          expect(result.toShort()).assertEqual(Short.MIN_VALUE);
        }
      }

      {
        let pairs: [short, short][] = [
          [(-32767) as short, (-2) as short],
          [Short.MIN_VALUE, (-1) as short],
          [(-32766) as short, (-3) as short]
        ];
        let pairCount: int = 3;
        for (let i: int = 0; i < pairCount; i++) {
          let left: Short = new Short(pairs[i][0]);
          let right: Short = new Short(pairs[i][1]);
          let result: Short = left.add(right);
          expect(result.toShort()).assertEqual(Short.MAX_VALUE);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_ADD_0400
     * @tc.name testShortAdd_merged4
     * @tc.desc BoundaryOverflow: covers 10 merged test points for Short.add, including boundary values, overflow, zero values, loop accumulation, and negative values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortAdd_merged4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let minValue: Short = new Short(Short.MIN_VALUE);
        let five: Short = new Short(5 as short);
        let result: Short = minValue.add(five);
        expect(result.toShort()).assertEqual((-32763) as short);
        expect(minValue.toShort()).assertEqual(Short.MIN_VALUE);
        expect(five.toShort()).assertEqual(5 as short);
      }

      {
        let accumulator: Short = new Short(0 as short);
        let step: Short = new Short((-10000) as short);
        let iterations: int = 0;
        while (iterations < 4) {
          accumulator = accumulator.add(step);
          iterations++;
        }
        expect(accumulator.toShort()).assertEqual(25536 as short);
        expect(iterations).assertEqual(4);
      }

      {
        let currentIndex: Short = new Short(0 as short);
        let increment: Short = new Short(1 as short);
        let taskCount: Short = new Short(8 as short);
        expect(currentIndex.toShort()).assertEqual(0 as short);
        currentIndex = currentIndex.add(increment);
        expect(currentIndex.toShort()).assertEqual(1 as short);
        currentIndex = currentIndex.add(increment);
        expect(currentIndex.toShort()).assertEqual(2 as short);
        currentIndex = currentIndex.add(increment);
        expect(currentIndex.toShort()).assertEqual(3 as short);
        currentIndex = currentIndex.add(increment);
        expect(currentIndex.toShort()).assertEqual(4 as short);
        currentIndex = currentIndex.add(increment);
        expect(currentIndex.toShort()).assertEqual(5 as short);
  
        currentIndex = currentIndex.add(increment);
        currentIndex = currentIndex.add(increment);
        currentIndex = currentIndex.add(increment);
        expect(currentIndex.toShort()).assertEqual(8 as short);
  
        let wrappedIndex: Short = new Short(Int.toShort(currentIndex.toInt() % taskCount.toInt()));
        expect(wrappedIndex.toShort()).assertEqual(0 as short);
        expect(increment.toShort()).assertEqual(1 as short);
      }

      {
        let positiveTruncated: Short = new Short(Double.toShort(3.14));
        let unitIncrement: Short = new Short(1 as short);
        let sum: Short = positiveTruncated.add(unitIncrement);
        expect(positiveTruncated.toShort()).assertEqual(3 as short);
        expect(sum.toShort()).assertEqual(4 as short);
        expect(unitIncrement.toShort()).assertEqual(1 as short);
      }

      {
        let balance: Short = new Short(10000 as short);
        let transactions: short[] = [500 as short, 1200 as short, 0 as short, 3000 as short, 8000 as short, 15000 as short];
  
        let runningTotal: Short = balance;
        let overflowDetected: boolean = false;
        for (let i: int = 0; i < transactions.length; i++) {
          let tx: short = transactions[i];
          let amount: Short = new Short(tx);
          let result: Short = runningTotal.add(amount);
          let newValue: int = result.toInt();
          if (newValue < 0) {
            overflowDetected = true;
          }
          runningTotal = result;
        }
  
        expect(runningTotal.toInt()).assertEqual(new Short(Int.toShort(10000 + 500 + 1200 + 0 + 3000 + 8000 + 15000)).toInt());
        expect(overflowDetected).assertTrue();
      }

      {
        let values: Short[] = [
          new Short(10000 as short), new Short(15000 as short), new Short(20000 as short), new Short(5000 as short)
        ];
  
        let shortSum: Short = new Short(0 as short);
        for (let v of values) {
          shortSum = shortSum.add(v);
        }
  
        let intSum: int = 0;
        for (let v of values) {
          intSum += v.toInt();
        }
  
        let longSum: long = Long.toLong(0);
        for (let v of values) {
          longSum = longSum.add(v.toLong());
        }
  
        expect(shortSum.toInt() !== intSum).assertTrue();
        expect(longSum.toInt()).assertEqual(intSum);
        expect(longSum.toInt()).assertEqual(50000);
      }

      {
        let a: Short = new Short(20000 as short);
        let b: Short = new Short(20000 as short);
        let c: Short = new Short(20000 as short);
        let intermediate: Short = a.add(b);
        expect(intermediate.toShort()).assertEqual((-25536) as short);
        let third: Short = intermediate.add(c);
        expect(third.toShort()).assertEqual((-5536) as short);
        expect(a.toShort()).assertEqual(20000 as short);
        expect(b.toShort()).assertEqual(20000 as short);
        expect(c.toShort()).assertEqual(20000 as short);
      }

      {
        let path1: Short = new Short(16384 as short).add(new Short(16383 as short));
        expect(path1.toShort()).assertEqual(Short.MAX_VALUE);
  
        let path2: Short = new Short(30000 as short).add(new Short(2767 as short));
        expect(path2.toShort()).assertEqual(Short.MAX_VALUE);
  
        let path3: Short = new Short(32767 as short).add(new Short(0 as short));
        expect(path3.toShort()).assertEqual(Short.MAX_VALUE);
  
        let path4: Short = new Short(0 as short).add(new Short(32767 as short));
        expect(path4.toShort()).assertEqual(Short.MAX_VALUE);
      }

      {
        let path1: Short = new Short((-16384) as short).add(new Short((-16384) as short));
        expect(path1.toShort()).assertEqual(Short.MIN_VALUE);
  
        let path2: Short = new Short((-30000) as short).add(new Short((-2768) as short));
        expect(path2.toShort()).assertEqual(Short.MIN_VALUE);
  
        let path3: Short = new Short((-32768) as short).add(new Short(0 as short));
        expect(path3.toShort()).assertEqual(Short.MIN_VALUE);
  
        let path4: Short = new Short(0 as short).add(new Short((-32768) as short));
        expect(path4.toShort()).assertEqual(Short.MIN_VALUE);
      }

      {
        let pos1: Short = new Short(1 as short);
        let neg1: Short = new Short((-1) as short);
        expect(pos1.add(neg1).toShort()).assertEqual(0 as short);
  
        let pos2: Short = new Short(2 as short);
        let neg2: Short = new Short((-2) as short);
        expect(pos2.add(neg2).toShort()).assertEqual(0 as short);
  
        let pos1b: Short = new Short(1 as short);
        let neg2b: Short = new Short((-2) as short);
        expect(pos1b.add(neg2b).toShort()).assertEqual((-1) as short);
  
        let neg1b: Short = new Short((-1) as short);
        let pos2b: Short = new Short(2 as short);
        expect(neg1b.add(pos2b).toShort()).assertEqual(1 as short);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_ADD_0500
     * @tc.name testShortAdd_merged5
     * @tc.desc BoundaryOverflow: covers 10 merged test points for Short.add, including boundary values, overflow, algebraic properties, zero values, and equality consistency.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortAdd_merged5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let maxVal: Short = new Short(Short.MAX_VALUE);
        let one: Short = new Short(1 as short);
        let maxPlus1: Short = maxVal.add(one);
        let restored: Short = maxPlus1.sub(one);
        expect(restored.equals(maxVal)).assertTrue();
  
        let minVal: Short = new Short(Short.MIN_VALUE);
        let negOne: Short = new Short((-1) as short);
        let minPlusNeg1: Short = minVal.add(negOne);
        let restored2: Short = minPlusNeg1.sub(negOne);
        expect(restored2.equals(minVal)).assertTrue();
      }

      {
        let a: Short = new Short(42 as short);
        let complement: Short = new Short(Int.toShort(~42));
        let one: Short = new Short(1 as short);
        let result: Short = a.add(complement).add(one);
        expect(result.toShort()).assertEqual(0 as short);
  
        let b: Short = new Short((-100) as short);
        let complementB: Short = new Short(Int.toShort(~(-100)));
        let resultB: Short = b.add(complementB).add(one);
        expect(resultB.toShort()).assertEqual(0 as short);
      }

      {
        let val: Short = new Short(30000 as short);
        let increment: Short = new Short(5000 as short);
        let result: Short = val.add(increment);
  
        if (val.isGreaterThan(new Short(0 as short)) && increment.isGreaterThan(new Short(0 as short))
          && !result.isGreaterThan(val)) {
          result = new Short(Short.MAX_VALUE);
        }
        expect(result.equals(new Short(Short.MAX_VALUE))).assertTrue();
  
        let val2: Short = new Short(20000 as short);
        let increment2: Short = new Short(5000 as short);
        let result2: Short = val2.add(increment2);
        expect(result2.toShort()).assertEqual(25000 as short);
      }

      {
        let currentPos: Short = new Short(250 as short);
        let writeSize: Short = new Short(10 as short);
        let newPos: Short = currentPos.add(writeSize);
        expect(newPos.toShort()).assertEqual(260 as short);
  
        let overflow: boolean = newPos.isLessThan(currentPos) && writeSize.isGreaterThan(new Short(0 as short));
        expect(overflow).assertFalse();
      }

      {
        let seqNum: Short = new Short(32760 as short);
        let payload: Short = new Short(10 as short);
        let nextSeq: Short = seqNum.add(payload);
        expect(nextSeq.toShort()).assertEqual((-32766) as short);
  
        let comparison: boolean = (nextSeq.toInt() & 0xFFFF) > (seqNum.toInt() & 0xFFFF);
        expect(comparison).assertTrue();
      }

      {
        let tickCount: Short = new Short(0 as short);
        let ticks: short[] = [1000 as short, 2000 as short, 5000 as short, 10000 as short, 15000 as short];
  
        let totalTicks: int = 0;
        for (let i: int = 0; i < ticks.length; i++) {
          tickCount = tickCount.add(new Short(ticks[i]));
          totalTicks += ticks[i];
        }
  
        let expectedWrapped: short = Int.toShort(totalTicks);
        expect(tickCount.toShort()).assertEqual(expectedWrapped);
        expect(totalTicks).assertEqual(33000);
        expect(tickCount.toShort()).assertEqual((-32536) as short);
      }

      {
        let iTerm: Short = new Short(0 as short);
        let error1: Short = new Short(100 as short);
        let error2: Short = new Short(50 as short);
        let error3: Short = new Short((-30) as short);
  
        iTerm = iTerm.add(error1);
        expect(iTerm.toShort()).assertEqual(100 as short);
        iTerm = iTerm.add(error2);
        expect(iTerm.toShort()).assertEqual(150 as short);
        iTerm = iTerm.add(error3);
        expect(iTerm.toShort()).assertEqual(120 as short);
  
        let iTermAccum: Short = new Short(Short.MAX_VALUE);
        let smallError: Short = new Short(10 as short);
        let overflowed: Short = iTermAccum.add(smallError);
        let clamped: Short = overflowed;
        if (Short.toInt(overflowed.toShort()) <= 0) {
          clamped = new Short(Short.MAX_VALUE);
        }
        expect(clamped.toShort()).assertEqual(Short.MAX_VALUE);
        expect(error1.toShort()).assertEqual(100 as short);
      }

      {
        let basePoints: Short = new Short(1000 as short);
        let bonusPoints: Short = new Short(500 as short);
        let penaltyPoints: Short = new Short((-200) as short);
        let multiplierBonus: Short = new Short(300 as short);
  
        let total: Short = basePoints.add(bonusPoints).add(penaltyPoints).add(multiplierBonus);
        expect(total.toShort()).assertEqual(1600 as short);
  
        let gradeA: Short = new Short(1500 as short);
        let gradeB: Short = new Short(1000 as short);
        let isGradeA: boolean = total.isGreaterEqualThan(gradeA);
        let isGradeB: boolean = total.isGreaterEqualThan(gradeB) && total.isLessThan(gradeA);
        expect(isGradeA).assertTrue();
        expect(isGradeB).assertFalse();
  
        let negativeBase: Short = new Short((-500) as short);
        let largePenalty: Short = new Short((-1000) as short);
        let total2: Short = negativeBase.add(largePenalty);
        expect(total2.toShort()).assertEqual((-1500) as short);
        let zeroGrade: Short = new Short(0 as short);
        let isBelowZero: boolean = total2.isLessThan(zeroGrade);
        expect(isBelowZero).assertTrue();
      }

      {
        let currentOffset: Short = new Short(0 as short);
        let pageSize: Short = new Short(20 as short);
  
        let page1: Short = currentOffset.add(pageSize);
        expect(page1.toShort()).assertEqual(20 as short);
  
        let page2: Short = page1.add(pageSize);
        expect(page2.toShort()).assertEqual(40 as short);
  
        let page3: Short = page2.add(pageSize);
        expect(page3.toShort()).assertEqual(60 as short);
  
        let totalRecords: Short = new Short(50 as short);
        let hasMore: boolean = page3.isLessThan(totalRecords);
        expect(hasMore).assertFalse();
      }

      {
        let maxVal: Short = new Short(Short.MAX_VALUE);
        let minVal: Short = new Short(Short.MIN_VALUE);
        let one: Short = new Short(1 as short);
  
        let step1: Short = maxVal.add(minVal);
        expect(step1.toShort()).assertEqual((-1) as short);
  
        let step2: Short = step1.add(one);
        expect(step2.toShort()).assertEqual(0 as short);
  
        let reordered: Short = maxVal.add(one).add(minVal);
        expect(reordered.toShort()).assertEqual(0 as short);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_ADD_0600
     * @tc.name testShortAdd_merged6
     * @tc.desc BoundaryOverflow: covers 10 merged test points for Short.add, including boundary values, overflow, wrapping, underflow, and algebraic properties.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortAdd_merged6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let offsets: short[] = [0 as short, 1 as short, 2 as short, 5 as short, 10 as short, 100 as short, 1000 as short];
  
        for (let i: int = 0; i < offsets.length; i++) {
          let maxVal: Short = new Short(Short.MAX_VALUE);
          let offset: Short = new Short(offsets[i]);
          let result: Short = maxVal.add(offset);
          let expected: short = Int.toShort(32767 + offsets[i]);
          expect(result.toShort()).assertEqual(expected);
        }
  
        for (let i: int = 0; i < offsets.length; i++) {
          let minVal: Short = new Short(Short.MIN_VALUE);
          let negOffset: Short = new Short(Int.toShort(-offsets[i]));
          let result: Short = minVal.add(negOffset);
          let expected: short = Int.toShort((-32768) + (-offsets[i]));
          expect(result.toShort()).assertEqual(expected);
        }
      }

      {
        let maxValue: Short = new Short(Short.MAX_VALUE);
        let minValue: Short = new Short(Short.MIN_VALUE);
        let one: Short = new Short(1 as short);
        let negativeOne: Short = new Short((-1) as short);
        let maxPlusOne: Short = maxValue.add(one);
        let onePlusMax: Short = one.add(maxValue);
        let minPlusNegOne: Short = minValue.add(negativeOne);
        let negOnePlusMin: Short = negativeOne.add(minValue);
        expect(maxPlusOne.toShort()).assertEqual(Short.MIN_VALUE);
        expect(onePlusMax.toShort()).assertEqual(Short.MIN_VALUE);
        expect(maxPlusOne.equals(onePlusMax)).assertTrue();
        expect(minPlusNegOne.toShort()).assertEqual(Short.MAX_VALUE);
        expect(negOnePlusMin.toShort()).assertEqual(Short.MAX_VALUE);
        expect(minPlusNegOne.equals(negOnePlusMin)).assertTrue();
        expect(maxValue.toShort()).assertEqual(Short.MAX_VALUE);
        expect(minValue.toShort()).assertEqual(Short.MIN_VALUE);
      }

      {
        let maxValue: Short = new Short(Short.MAX_VALUE);
        let power: int = 1;
        for (let i: int = 0; i <= 14; i++) {
          let operand: Short = new Short(Int.toShort(power));
          let result: Short = maxValue.add(operand);
          let expected: short = Int.toShort(32767 + power);
          expect(result.toShort()).assertEqual(expected);
          power = power * 2;
        }
        expect(maxValue.toShort()).assertEqual(Short.MAX_VALUE);
      }

      {
        let minValue: Short = new Short(Short.MIN_VALUE);
        let power: int = 1;
        for (let i: int = 0; i <= 14; i++) {
          let operand: Short = new Short(Int.toShort(-power));
          let result: Short = minValue.add(operand);
          let expected: short = Int.toShort((-32768) + (-power));
          expect(result.toShort()).assertEqual(expected);
          power = power * 2;
        }
        expect(minValue.toShort()).assertEqual(Short.MIN_VALUE);
      }

      {
        let a: Short = new Short(20000 as short);
        let b: Short = new Short(20000 as short);
        let result: Short = a.add(b);
        expect(result.toShort()).assertEqual((-25536) as short);
        let a2: Short = new Short(25000 as short);
        let b2: Short = new Short(25000 as short);
        let result2: Short = a2.add(b2);
        expect(result2.toShort()).assertEqual((-15536) as short);
        expect(a.toShort()).assertEqual(20000 as short);
        expect(b.toShort()).assertEqual(20000 as short);
      }

      {
        let a: Short = new Short((-20000) as short);
        let b: Short = new Short((-20000) as short);
        let result: Short = a.add(b);
        expect(result.toShort()).assertEqual(25536 as short);
        let a2: Short = new Short((-25000) as short);
        let b2: Short = new Short((-25000) as short);
        let result2: Short = a2.add(b2);
        expect(result2.toShort()).assertEqual(15536 as short);
        expect(a.toShort()).assertEqual((-20000) as short);
        expect(b.toShort()).assertEqual((-20000) as short);
      }

      {
        let a: Short = new Short(20000 as short);
        let b: Short = new Short(15000 as short);
        let shortResult: Short = a.add(b);
        let intSum: int = a.toInt() + b.toInt();
        let overflowed: boolean = shortResult.toInt() !== intSum;
        expect(overflowed).assertTrue();
        expect(shortResult.toShort()).assertEqual((-30536) as short);
        expect(intSum).assertEqual(35000);
      }

      {
        let halfMax: Short = new Short(16383 as short);
        let left: Short = halfMax;
        let right: Short = halfMax;
        let result: Short = left.add(right);
        expect(result.toShort()).assertEqual(32766 as short);
        expect(left.toShort()).assertEqual(16383 as short);
        expect(right.toShort()).assertEqual(16383 as short);
      }

      {
        let accumulator: Short = new Short(0 as short);
        let step: Short = new Short(10000 as short);
        let totalAdded: int = 0;
        for (let i: int = 0; i < 7; i++) {
          accumulator = accumulator.add(step);
          totalAdded += 10000;
        }
        let expected: short = Int.toShort(totalAdded);
        expect(accumulator.toShort()).assertEqual(expected);
        expect(expected).assertEqual(Int.toShort(70000));
      }

      {
        let a: Short = new Short(50 as short);
        let b: Short = new Short(30 as short);
        let negB: Short = new Short((-30) as short);
        let negA: Short = new Short((-50) as short);
        let left: Short = a.add(negB);
        let right: Short = negA.add(b);
        let rightNegated: short = Int.toShort(-right.toInt());
        expect(left.toShort()).assertEqual(rightNegated);
        expect(left.toShort()).assertEqual(20 as short);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_ADD_0700
     * @tc.name testShortAdd_merged7
     * @tc.desc BoundaryOverflow: covers 10 merged test points for Short.add, including overflow, equality consistency, business scenarios, wrapping, and zero values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortAdd_merged7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let testAbsValues: short[] = [1 as short, 2 as short, 100 as short, 1000 as short,
          16383 as short, 16384 as short, 32766 as short, 32767 as short];
        let zeroTest: Short = new Short(0 as short);
        for (let i: int = 0; i < testAbsValues.length; i++) {
          let posVal: Short = new Short(testAbsValues[i]);
          let negVal: Short = new Short(Int.toShort(-testAbsValues[i]));
          let result: Short = posVal.add(negVal);
          expect(result.equals(zeroTest)).assertTrue();
        }
      }

      {
        let sample1: Short = new Short(10000 as short);
        let sample2: Short = new Short(5000 as short);
        let mixed: Short = sample1.add(sample2);
        expect(mixed.toShort()).assertEqual(15000 as short);
        let overflowSample1: Short = new Short(30000 as short);
        let overflowSample2: Short = new Short(10000 as short);
        let overflowMixed: Short = overflowSample1.add(overflowSample2);
        let sumInt: int = overflowSample1.toInt() + overflowSample2.toInt();
        let clamped: Short = sumInt > 32767 ? new Short(Short.MAX_VALUE) : overflowMixed;
        expect(clamped.toShort()).assertEqual(Short.MAX_VALUE);
      }

      {
        let score: Short = new Short(0 as short);
        let points: short[] = [100 as short, 50 as short, 75 as short, 200 as short, 30 as short];
        for (let i: int = 0; i < points.length; i++) {
          score = score.add(new Short(points[i]));
        }
        expect(score.toShort()).assertEqual(455 as short);
        let highScore: Short = new Short(32000 as short);
        let bonus: Short = new Short(1000 as short);
        let newScore: Short = highScore.add(bonus);
        expect(newScore.toShort()).assertEqual((-32536) as short);
      }

      {
        let x: Short = new Short(100 as short);
        let y: Short = new Short(200 as short);
        let dx: Short = new Short(50 as short);
        let dy: Short = new Short((-30) as short);
        let newX: Short = x.add(dx);
        let newY: Short = y.add(dy);
        expect(newX.toShort()).assertEqual(150 as short);
        expect(newY.toShort()).assertEqual(170 as short);
        expect(x.toShort()).assertEqual(100 as short);
        expect(y.toShort()).assertEqual(200 as short);
      }

      {
        let a1: Short = new Short(20000 as short);
        let b1: Short = new Short(20000 as short);
        let shortResult1: Short = a1.add(b1);
        let intSum1: int = a1.toInt() + b1.toInt();
        let wrapDelta1: int = intSum1 - shortResult1.toInt();
        expect(wrapDelta1).assertEqual(65536);
  
        let a2: Short = new Short((-20000) as short);
        let b2: Short = new Short((-20000) as short);
        let shortResult2: Short = a2.add(b2);
        let intSum2: int = a2.toInt() + b2.toInt();
        let wrapDelta2: int = intSum2 - shortResult2.toInt();
        expect(wrapDelta2).assertEqual(-65536);
  
        let a3: Short = new Short(100 as short);
        let b3: Short = new Short(200 as short);
        let shortResult3: Short = a3.add(b3);
        let intSum3: int = a3.toInt() + b3.toInt();
        let wrapDelta3: int = intSum3 - shortResult3.toInt();
        expect(wrapDelta3).assertEqual(0);
  
        let a4: Short = new Short(Short.MAX_VALUE);
        let b4: Short = new Short(1 as short);
        let shortResult4: Short = a4.add(b4);
        expect(shortResult4.toShort()).assertEqual(Short.MIN_VALUE);
        let wrapDelta4: int = (a4.toInt() + b4.toInt()) - shortResult4.toInt();
        expect(wrapDelta4).assertEqual(65536);
      }

      {
        let a: Short = new Short(100 as short);
        let addResult: Short = a.add(a);
        let mulResult: Short = a.mul(new Short(2 as short));
        expect(addResult.equals(mulResult)).assertTrue();
        expect(addResult.toShort()).assertEqual(200 as short);
        let b: Short = new Short(5000 as short);
        let addResultB: Short = b.add(b);
        let mulResultB: Short = b.mul(new Short(2 as short));
        expect(addResultB.equals(mulResultB)).assertTrue();
      }

      {
        let a: Short = new Short(50 as short);
        let b: Short = new Short(30 as short);
        let sum: Short = a.add(b);
        let restored: Short = sum.sub(b);
        expect(restored.equals(a)).assertTrue();
        expect(a.toShort()).assertEqual(50 as short);
        expect(b.toShort()).assertEqual(30 as short);
      }

      {
        let a: Short = new Short(10 as short);
        let b: Short = new Short(20 as short);
        let c: Short = new Short(5 as short);
        expect(a.isLessThan(b)).assertTrue();
        let aPlusC: Short = a.add(c);
        let bPlusC: Short = b.add(c);
        expect(aPlusC.isLessEqualThan(bPlusC)).assertTrue();
        expect(aPlusC.toShort()).assertEqual(15 as short);
        expect(bPlusC.toShort()).assertEqual(25 as short);
      }

      {
        let a: Short = new Short(32766 as short);
        let b: Short = new Short(32767 as short);
        let one: Short = new Short(1 as short);
        let negOne: Short = new Short((-1) as short);
        expect(a.add(one).isGreaterThan(b.add(one))).assertTrue();
        expect(a.add(negOne).isLessThan(b.add(negOne))).assertTrue();
      }

      {
        let a: Short = new Short(30000 as short);
        let b: Short = new Short(20000 as short);
        let sum: Short = a.add(b);
        let restored: Short = sum.sub(b);
        expect(restored).assertEqual(a);
        let c: Short = new Short(32767 as short);
        let d: Short = new Short(1 as short);
        let restored2: Short = c.add(d).sub(d);
        expect(restored2).assertEqual(c);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_ADD_0800
     * @tc.name testShortAdd_merged8
     * @tc.desc BoundaryOverflow / ErrorException: covers 10 merged test points for Short.add, including boundary values, type conversion, exceptions, fractions and rounding, and division and modulo.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortAdd_merged8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let a: Short = new Short(100 as short);
        let b: Short = new Short(50 as short);
        let c: Short = new Short(3 as short);
        let sum: Short = a.add(b);
        let combinedDiv: Short = sum.div(c);
        let aDiv: Short = a.div(c);
        let bDiv: Short = b.div(c);
        let separateSum: Short = aDiv.add(bDiv);
        expect(combinedDiv.toShort()).assertEqual(50 as short);
        expect(separateSum.toShort()).assertEqual(49 as short);
        expect(a.toShort()).assertEqual(100 as short);
        expect(b.toShort()).assertEqual(50 as short);
        expect(c.toShort()).assertEqual(3 as short);
      }

      {
        let detectOverflow = (a: Short, b: Short): boolean => {
          let result: Short = a.add(b);
          let aPositive: boolean = a.toInt() > 0;
          let bPositive: boolean = b.toInt() > 0;
          let resultPositive: boolean = result.toInt() > 0;
          if (aPositive && bPositive && !resultPositive) return true;
          if (!aPositive && !bPositive && resultPositive) return true;
          return false;
        };
        let posA: Short = new Short(20000 as short);
        let posB: Short = new Short(20000 as short);
        expect(detectOverflow(posA, posB)).assertTrue();
        let negA: Short = new Short((-20000) as short);
        let negB: Short = new Short((-20000) as short);
        expect(detectOverflow(negA, negB)).assertTrue();
        let safeA: Short = new Short(100 as short);
        let safeB: Short = new Short(200 as short);
        expect(detectOverflow(safeA, safeB)).assertFalse();
        let mixedA: Short = new Short(100 as short);
        let mixedB: Short = new Short((-50) as short);
        expect(detectOverflow(mixedA, mixedB)).assertFalse();
      }

      {
        let current: Short = new Short(0 as short);
        let increment: Short = new Short(1000 as short);
        let maxVal: Short = new Short(Short.MAX_VALUE);
        let maxMinusThousand: Short = new Short(31767 as short);
        while (current.isLessThan(maxMinusThousand)) {
          current = current.add(increment);
        }
        let remaining: int = Short.MAX_VALUE - current.toInt();
        for (let i: int = 0; i < remaining; i++) {
          current = current.add(new Short(1 as short));
        }
        expect(current.toShort()).assertEqual(Short.MAX_VALUE);
        expect(current.equals(maxVal)).assertTrue();
        let nextStep: Short = current.add(new Short(1 as short));
        expect(nextStep.toShort()).assertEqual(Short.MIN_VALUE);
      }

      {
        let a: Short = new Short(20000 as short);
        let b: Short = new Short(20000 as short);
        let sum: Short = a.add(b);
        expect(sum.toShort()).assertEqual((-25536) as short);
        let byteVal: byte = sum.toByte();
        let expectedLowByte: int = (-25536) & 0xFF;
        let expectedSignedByte: byte = Int.toByte(expectedLowByte > 127 ? expectedLowByte - 256 : expectedLowByte);
        expect(byteVal).assertEqual(expectedSignedByte);
        let a2: Short = new Short(255 as short);
        let b2: Short = new Short(1 as short);
        let sum2: Short = a2.add(b2);
        expect(sum2.toByte()).assertEqual(0 as byte);
        expect(a.toShort()).assertEqual(20000 as short);
        expect(b.toShort()).assertEqual(20000 as short);
      }

      {
        let boundaryFF: Short = new Short(255 as short);
        let one: Short = new Short(1 as short);
        let cross100: Short = boundaryFF.add(one);
        expect(cross100.toShort()).assertEqual(256 as short);
        expect(cross100.toString(16)).assertEqual('100');
        let boundaryFFF: Short = new Short(4095 as short);
        let cross1000: Short = boundaryFFF.add(one);
        expect(cross1000.toShort()).assertEqual(4096 as short);
        expect(cross1000.toString(16)).assertEqual('1000');
        let boundary7FFE: Short = new Short(32766 as short);
        let cross7FFF: Short = boundary7FFE.add(one);
        expect(cross7FFF.toShort()).assertEqual(Short.MAX_VALUE);
        expect(cross7FFF.toString(16)).assertEqual('7fff');
        let cross8000: Short = cross7FFF.add(one);
        expect(cross8000.toShort()).assertEqual(Short.MIN_VALUE);
        expect(cross8000.toString(16)).assertEqual('-8000');
      }

      {
        let minutesInDay: Short = new Short(1440 as short);
        let currentMinutes: Short = new Short(1420 as short);
        let addMinutes: Short = new Short(37 as short);
        let total: Short = currentMinutes.add(addMinutes);
        let wrapped: Short = total.sub(minutesInDay);
        expect(total.toShort()).assertEqual(1457 as short);
        expect(wrapped.toShort()).assertEqual(17 as short);
        expect(currentMinutes.toShort()).assertEqual(1420 as short);
        expect(addMinutes.toShort()).assertEqual(37 as short);
      }

      {
        let left: Short = new Short(1 as short);
        try {
          let nullOperand: Short = null as Short;
          left.add(nullOperand);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
        }
      }

      {
        let base: Short = new Short(1 as short);
        let receiver: Short = base.add(new Short(0 as short));
        try {
          receiver.add(undefined as Short);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
        }
      }

      {
        let dx: Short = new Short(5 as short);
        let dy: Short = new Short(3 as short);
        let twoDy: Short = dy.add(dy);
        expect(twoDy.toShort()).assertEqual(6 as short);
  
        let d: Short = new Short(1 as short);
        let dyMinusDx: Short = new Short(Int.toShort(dy.toInt() - dx.toInt()));
        let twoDyMinusDx: Short = dyMinusDx.add(dyMinusDx);
        d = d.add(twoDyMinusDx);
        expect(d.toShort()).assertEqual((-3) as short);
        d = d.add(twoDy);
        expect(d.toShort()).assertEqual(3 as short);
        d = d.add(twoDyMinusDx);
        expect(d.toShort()).assertEqual((-1) as short);
        d = d.add(twoDy);
        expect(d.toShort()).assertEqual(5 as short);
      }

      {
        let left: Short = new Short(1 as short);
        try {
          left.add(true as Short);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_ADD_0900
     * @tc.name testShortAdd_merged9
     * @tc.desc ErrorException / SpecialValue / CrossTypeRoundTrip / RadixConversion: covers 10 merged test points for Short.add, including type conversion, string conversion, radix conversion, exceptions, and containers and references.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortAdd_merged9', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let left: Short = new Short(1 as short);
        let arr: short[] = [1 as short, 2 as short];
        try {
          left.add(arr as Short);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
        }
      }

      {
        let samples: Short[] = [
          new Short(10 as short),
          new Short(20 as short),
          new Short(30 as short),
          new Short(40 as short)
        ];
        let runningSum: Short = new Short(0 as short);
        for (let i: int = 0; i < samples.length; i++) {
          runningSum = runningSum.add(samples[i]);
        }
        expect(runningSum.toShort()).assertEqual(100 as short);
        let oldest: Short = samples[0];
        let oldestNeg: Short = new Short(Int.toShort(-oldest.toInt()));
        let newSample: Short = new Short(50 as short);
        runningSum = runningSum.add(oldestNeg).add(newSample);
        expect(runningSum.toShort()).assertEqual(140 as short);
      }

      {
        let left: Short = new Short(1234 as short);
        let right: Short = new Short(3426 as short);
        let result: Short = left.add(right);
        expect(result.toInt()).assertEqual(4660);
        let lowByte: byte = result.toByte();
        let highByte: int = (result.toInt() >> 8) & 0xFF;
        expect(lowByte).assertEqual(52 as byte);
        expect(highByte).assertEqual(18);
        expect(((highByte << 8) | lowByte)).assertEqual(4660);
      }

      {
        let left: Short = new Short(10 as short);
        let right: Short = new Short(20 as short);
        let result: Short = left.add(right);
        expect(result.toShort()).assertEqual(30 as short);
        expect(result.toByte()).assertEqual(30 as byte);
        expect(left.toShort()).assertEqual(10 as short);
        expect(right.toShort()).assertEqual(20 as short);
      }

      {
        let left: Short = new Short(40 as short);
        let right: Short = new Short(25 as short);
        let result: Short = left.add(right);
        expect(result.toShort()).assertEqual(65 as short);
        expect(result.toChar()).assertEqual(c'A');
        expect(left.toShort()).assertEqual(40 as short);
        expect(right.toShort()).assertEqual(25 as short);
      }

      {
        let a: Short = new Short(500 as short);
        let b: Short = new Short(600 as short);
        let result: Short = a.add(b);
        expect(result.toString()).assertEqual('1100');
        expect(result.toShort()).assertEqual(1100 as short);
      }

      {
        let a: Short = new Short(5000 as short);
        let b: Short = new Short(7000 as short);
        let result: Short = a.add(b);
        expect(result.toShort()).assertEqual(12000 as short);
        expect(result.toString()).assertEqual('12000');
  
        let localeStr: string = result.toLocaleString();
        expect(typeof localeStr).assertEqual('string');
        expect(localeStr).assertEqual('12,000');
  
        let localeStr2: string = result.toLocaleString();
        expect(localeStr).assertEqual(localeStr2);
  
        let negA: Short = new Short((-5000) as short);
        let negB: Short = new Short((-7000) as short);
        let negResult: Short = negA.add(negB);
        expect(negResult.toString()).assertEqual('-12000');
        expect(negResult.toLocaleString()).assertEqual('-12,000');
      }

      {
        let zero: Short = new Short(0 as short);
        let one: Short = new Short(1 as short);
        let two: Short = new Short(2 as short);
  
        expect(zero.add(zero).toShort()).assertEqual(0 as short);
        expect(zero.add(one).toShort()).assertEqual(1 as short);
        expect(one.add(zero).toShort()).assertEqual(1 as short);
        expect(one.add(one).toShort()).assertEqual(2 as short);
        expect(one.add(one).add(one).toShort()).assertEqual(3 as short);
        expect(one.add(one).add(two).toShort()).assertEqual(4 as short);
        expect(zero.toShort()).assertEqual(0 as short);
        expect(one.toShort()).assertEqual(1 as short);
      }

      {
        let negativeHex: Short = new Short((-0x10) as short);
        let positive: Short = new Short(20 as short);
        let result: Short = negativeHex.add(positive);
        expect(result.toShort()).assertEqual(4 as short);
        expect(negativeHex.toShort()).assertEqual((-16) as short);
        expect(positive.toShort()).assertEqual(20 as short);
      }

      {
        let base: Short = new Short(3 as short);
        let exp: int = 5;
        let result: Short = new Short(1 as short);
        let currentBase: Short = new Short(base.toShort());
        let bitPos: Short = new Short(1 as short);
        let increment: Short = new Short(1 as short);
  
        while (exp > 0) {
          if ((exp & 1) === 1) {
            result = new Short(Int.toShort(result.toInt() * currentBase.toInt()));
          }
          currentBase = new Short(Int.toShort(currentBase.toInt() * currentBase.toInt()));
          exp = exp >> 1;
          bitPos = bitPos.add(increment);
        }
        expect(result.toShort()).assertEqual(243 as short);
        expect(bitPos.toShort()).assertEqual(4 as short);
  
        let base2: Short = new Short(2 as short);
        let exp2: int = 3;
        let result2: Short = new Short(1 as short);
        let curBase2: Short = new Short(base2.toShort());
        while (exp2 > 0) {
          if ((exp2 & 1) === 1) {
            result2 = new Short(Int.toShort(result2.toInt() * curBase2.toInt()));
          }
          curBase2 = new Short(Int.toShort(curBase2.toInt() * curBase2.toInt()));
          exp2 = exp2 >> 1;
        }
        expect(result2.toShort()).assertEqual(8 as short);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_ADD_1000
     * @tc.name testShortAdd_merged10
     * @tc.desc RadixConversion / Idempotent: covers 10 merged test points for Short.add, including equality consistency, algebraic properties, division and modulo, comparison and ordering, and radix conversion.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortAdd_merged10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let a: Short = new Short(700 as short);
        let b: Short = new Short(700 as short);
        let sum: Short = a.add(b);
        let hex: string = sum.toString(16);
        expect(hex).assertEqual('578');
        let restored: short = Short.parseInt(hex, 16);
        expect(new Short(restored)).assertEqual(sum);
      }

      {
        let digitSum = (v: int): int => {
          let n: int = v;
          let total: int = 0;
          while (n > 0) {
            total += n % 10;
            n = Double.toInt(Math.floor(n / 10));
          }
          return total;
        };
  
        let a: Short = new Short(Int.toShort(123));
        let b: Short = new Short(Int.toShort(456));
        let sum: Short = a.add(b);
        expect(digitSum(sum.toInt()) % 9).assertEqual((digitSum(a.toInt()) + digitSum(b.toInt())) % 9);
  
        let c: Short = new Short(Int.toShort(999));
        let d: Short = new Short(Int.toShort(1));
        let sum2: Short = c.add(d);
        expect(digitSum(sum2.toInt()) % 9).assertEqual((digitSum(c.toInt()) + digitSum(d.toInt())) % 9);
  
        let e: Short = new Short(Int.toShort(20000));
        let f: Short = new Short(Int.toShort(555));
        let sum3: Short = e.add(f);
        expect(digitSum(sum3.toInt()) % 9).assertEqual((digitSum(e.toInt()) + digitSum(f.toInt())) % 9);
      }

      {
        let onesDigit = (v: int): int => v % 10;
        let a: Short = new Short(Int.toShort(123));
        let b: Short = new Short(Int.toShort(456));
        let sum: Short = a.add(b);
        expect(sum.toInt()).assertEqual(579);
        expect(onesDigit(sum.toInt())).assertEqual((onesDigit(a.toInt()) + onesDigit(b.toInt())) % 10);
  
        let c: Short = new Short(Int.toShort(128));
        let d: Short = new Short(Int.toShort(456));
        let sum2: Short = c.add(d);
        expect(sum2.toInt()).assertEqual(584);
        expect(onesDigit(sum2.toInt())).assertEqual((onesDigit(c.toInt()) + onesDigit(d.toInt())) % 10);
  
        let e: Short = new Short(Int.toShort(999));
        let f: Short = new Short(Int.toShort(999));
        let sum3: Short = e.add(f);
        expect(sum3.toInt()).assertEqual(1998);
        expect(onesDigit(sum3.toInt())).assertEqual((onesDigit(e.toInt()) + onesDigit(f.toInt())) % 10);
      }

      {
        let left: Short = new Short(7 as short);
        let right: Short = new Short(8 as short);
        let leftBefore: short = left.toShort();
        let rightBefore: short = right.toShort();
        let firstResult: Short = left.add(right);
        let secondResult: Short = left.add(right);
        let thirdResult: Short = left.add(right);
        expect(firstResult.toShort()).assertEqual(15 as short);
        expect(secondResult.toShort()).assertEqual(15 as short);
        expect(thirdResult.toShort()).assertEqual(15 as short);
        expect(left.toShort()).assertEqual(leftBefore);
        expect(right.toShort()).assertEqual(rightBefore);
      }

      {
        let firstLeft: Short = new Short(12 as short);
        let firstRight: Short = new Short(13 as short);
        let secondLeft: Short = new Short(12 as short);
        let secondRight: Short = new Short(13 as short);
        let thirdLeft: Short = new Short(12 as short);
        let thirdRight: Short = new Short(13 as short);
        let firstResult: Short = firstLeft.add(firstRight);
        let secondResult: Short = secondLeft.add(secondRight);
        let thirdResult: Short = thirdLeft.add(thirdRight);
        expect(firstResult.toShort()).assertEqual(25 as short);
        expect(secondResult.toShort()).assertEqual(25 as short);
        expect(thirdResult.toShort()).assertEqual(25 as short);
      }

      {
        let a: Short = new Short(10 as short);
        let b: Short = new Short(20 as short);
        let c: Short = new Short(30 as short);
        let chained: Short = (a.add(b)).add(c);
        expect(chained.toShort()).assertEqual(60 as short);
        expect(a.toShort()).assertEqual(10 as short);
        expect(b.toShort()).assertEqual(20 as short);
        expect(c.toShort()).assertEqual(30 as short);
      }

      {
        let a: Short = new Short(45 as short);
        let b: Short = new Short(55 as short);
        let aPlusB: Short = a.add(b);
        let bPlusA: Short = b.add(a);
        expect(aPlusB.toShort()).assertEqual(bPlusA.toShort());
        expect(aPlusB.toShort()).assertEqual(100 as short);
        expect(a.toShort()).assertEqual(45 as short);
        expect(b.toShort()).assertEqual(55 as short);
      }

      {
        let a: Short = new Short(7 as short);
        let b: Short = new Short(11 as short);
        let c: Short = new Short(13 as short);
        let leftAssoc: Short = (a.add(b)).add(c);
        let rightAssoc: Short = a.add(b.add(c));
        expect(leftAssoc.toShort()).assertEqual(rightAssoc.toShort());
        expect(leftAssoc.toShort()).assertEqual(31 as short);
        expect(a.toShort()).assertEqual(7 as short);
        expect(b.toShort()).assertEqual(11 as short);
        expect(c.toShort()).assertEqual(13 as short);
      }

      {
        let a: Short = new Short(5000 as short);
        let b: Short = new Short(12000 as short);
        let c: Short = new Short(-3000 as short);
  
        expect(a.add(b).equals(b.add(a))).assertTrue();
  
        expect(a.add(b).add(c).equals(a.add(b.add(c)))).assertTrue();
  
        expect(a.add(b).sub(b).equals(a)).assertTrue();
  
        let aPlusC: Short = a.add(c);
        let bPlusC: Short = b.add(c);
        expect(a.compareTo(b)).assertEqual(-1);
        expect(aPlusC.isLessThan(bPlusC)).assertTrue();
      }

      {
        let a: Short = new Short(123 as short);
        let b: Short = new Short(456 as short);
        let result: Short = a.add(b);
        let expected: Short = new Short(579 as short);
        expect(result.equals(expected)).assertTrue();
        expect(result.compareTo(expected)).assertEqual(0);
        expect(a.toShort()).assertEqual(123 as short);
        expect(b.toShort()).assertEqual(456 as short);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_ADD_1100
     * @tc.name testShortAdd_merged11
     * @tc.desc Idempotent / ArithmeticBitwise: covers 10 merged test points for Short.add, including equality consistency, loop accumulation, business scenarios, type conversion, and algebraic properties.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortAdd_merged11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let v1: Short = new Short(1 as short);
        let v2: Short = new Short(2 as short);
        let v3: Short = new Short(3 as short);
        let v4: Short = new Short(4 as short);
        let v5: Short = new Short(5 as short);
        let v6: Short = new Short(6 as short);
  
        let result: Short = v1.add(v2).add(v3).add(v4).add(v5).add(v6);
        expect(result.toShort()).assertEqual(21 as short);
        let nested: Short = v1.add(v2.add(v3.add(v4.add(v5.add(v6)))));
        expect(nested.toShort()).assertEqual(21 as short);
        expect(result.equals(nested)).assertTrue();
      }

      {
        let testValues: short[] = [0 as short, 1 as short, (-1) as short, 100 as short, (-100) as short,
          32766 as short, (-32767) as short, Short.MAX_VALUE, Short.MIN_VALUE];
  
        let inc: Short = new Short(1 as short);
        let dec: Short = new Short((-1) as short);
  
        for (let i: int = 0; i < testValues.length; i++) {
          let original: Short = new Short(testValues[i]);
          let afterInc: Short = original.add(inc);
          let afterDec: Short = afterInc.add(dec);
          expect(afterDec.equals(original)).assertTrue();
        }
      }

      {
        let a: Short = new Short(10 as short);
        let b: Short = new Short(20 as short);
        let c: Short = new Short(15 as short);
        let d: Short = new Short(15 as short);
        let sumAB: Short = a.add(b);
        let sumCD: Short = c.add(d);
        expect(sumAB.toShort()).assertEqual(30 as short);
        expect(sumCD.toShort()).assertEqual(30 as short);
        expect(sumAB.equals(sumCD)).assertTrue();
        expect(sumAB.compareTo(sumCD)).assertEqual(0);
      }

      {
        let a: Short = new Short(10000 as short);
        let b: Short = new Short(20000 as short);
        let result: Short = a.add(b);
        let rawBitResult: int = (a.toInt() + b.toInt()) & 0xFFFF;
        let signedResult: short = Int.toShort(rawBitResult);
        expect(result.toShort()).assertEqual(signedResult);
  
        let a2: Short = new Short((-10000) as short);
        let b2: Short = new Short((-20000) as short);
        let result2: Short = a2.add(b2);
        let rawBitResult2: int = (a2.toInt() + b2.toInt()) & 0xFFFF;
        let signedResult2: short = Int.toShort(rawBitResult2);
        expect(result2.toShort()).assertEqual(signedResult2);
      }

      {
        let accA: Short = new Short(1000 as short);
        let accB: Short = new Short(500 as short);
        let initialSum: Short = accA.add(accB);
        let deltas: short[] = [100 as short, (-50) as short, 200 as short, (-300) as short, 75 as short];
        for (let i: int = 0; i < deltas.length; i++) {
          let delta: Short = new Short(deltas[i]);
          let negDelta: Short = new Short(Int.toShort(-deltas[i]));
          accA = accA.add(delta);
          accB = accB.add(negDelta);
          let currentSum: Short = accA.add(accB);
          expect(currentSum.equals(initialSum)).assertTrue();
        }
        expect(initialSum.toShort()).assertEqual(1500 as short);
        let finalAExpected: int = 1000 + 100 - 50 + 200 - 300 + 75;
        expect(accA.toInt()).assertEqual(finalAExpected);
      }

      {
        let value: Short = new Short(3 as short);
        let beforeValue: short = value.toShort();
        let result: Short = value.add(value);
        expect(result.toShort()).assertEqual(6 as short);
        expect(value.toShort()).assertEqual(beforeValue);
      }

      {
        let left: Short = new Short(15 as short);
        let right: Short = new Short(25 as short);
        let result: Short = left.add(right);
        let resultShort: short = result.toShort();
        let resultInt: int = result.toInt();
        expect(resultShort).assertEqual(40 as short);
        expect(resultInt).assertEqual(40);
      }

      {
        let left: Short = new Short(8 as short);
        let right: Short = new Short(2 as short);
        let leftBefore: short = left.toShort();
        let rightBefore: short = right.toShort();
        let result: Short = left.add(right);
        expect(left.toShort()).assertEqual(leftBefore);
        expect(right.toShort()).assertEqual(rightBefore);
        expect(result.toShort()).assertEqual(10 as short);
      }

      {
        let left: Short = new Short(15 as short);
        let right: Short = new Short(25 as short);
        let result: Short = left.add(right);
        expect(result.toShort()).assertEqual(40 as short);
        expect(result.toLong()).assertEqual(Long.toLong(40));
        expect(left.toShort()).assertEqual(15 as short);
        expect(right.toShort()).assertEqual(25 as short);
      }

      {
        let left: Short = new Short(Int.toShort(Int.parseInt('50', 10)));
        let right: Short = new Short(Int.toShort(Int.parseInt('70', 10)));
        let result: Short = left.add(right);
        expect(result.toShort()).assertEqual(120 as short);
        expect(result.toInt()).assertEqual(120);
        expect(left.toShort()).assertEqual(50 as short);
        expect(right.toShort()).assertEqual(70 as short);
      }
    });

  });
}