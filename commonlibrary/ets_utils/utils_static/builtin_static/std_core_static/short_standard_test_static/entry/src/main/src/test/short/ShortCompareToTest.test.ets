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

export default function shortCompareToTest(): void {
  describe('ShortCompareToTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_COMPARETO_0100
     * @tc.name testShortCompareTo_merged1
     * @tc.desc BasicValue: covers 10 merged test points for Short.compareTo, including comparison and ordering, negative values, zero values, boundary values, and positive values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortCompareTo_merged1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let current: Short = new Short(3 as short);
        let other: Short = new Short(5 as short);
        let result: int = current.compareTo(other);
        expect(result).assertEqual(-1);
      }

      {
        let current: Short = new Short(5 as short);
        let other: Short = new Short(3 as short);
        let result: int = current.compareTo(other);
        expect(result).assertEqual(1);
      }

      {
        let current: Short = new Short((-1) as short);
        let other: Short = new Short((-1) as short);
        let result: int = current.compareTo(other);
        expect(result).assertEqual(0);
      }

      {
        let smallGapCurrent: Short = new Short(3 as short);
        let smallGapOther: Short = new Short(5 as short);
        let midGapCurrent: Short = new Short(10 as short);
        let midGapOther: Short = new Short(60 as short);
        let largeGapCurrent: Short = new Short(0 as short);
        let largeGapOther: Short = new Short(100 as short);
        expect(smallGapCurrent.compareTo(smallGapOther)).assertEqual(-1);
        expect(midGapCurrent.compareTo(midGapOther)).assertEqual(-1);
        expect(largeGapCurrent.compareTo(largeGapOther)).assertEqual(-1);
        expect(smallGapCurrent.compareTo(smallGapOther)).assertEqual(largeGapCurrent.compareTo(largeGapOther));
        expect(midGapCurrent.compareTo(midGapOther)).assertEqual(largeGapCurrent.compareTo(largeGapOther));
      }

      {
        let minValue: Short = new Short(Short.MIN_VALUE);
        let maxValue: Short = new Short(Short.MAX_VALUE);
        let result: int = minValue.compareTo(maxValue);
        expect(result).assertEqual(-1);
      }

      {
        let maxValue: Short = new Short(Short.MAX_VALUE);
        let minValue: Short = new Short(Short.MIN_VALUE);
        let result: int = maxValue.compareTo(minValue);
        expect(result).assertEqual(1);
      }

      {
        let zero: Short = new Short(0 as short);
        let negativeZero: Short = new Short((-0) as short);
        let result: int = zero.compareTo(negativeZero);
        expect(result).assertEqual(0);
      }

      {
        let minValue: Short = new Short(Short.MIN_VALUE);
        let zero: Short = new Short(0 as short);
        let result: int = minValue.compareTo(zero);
        expect(result).assertEqual(-1);
      }

      {
        let maxValue: Short = new Short(Short.MAX_VALUE);
        let zero: Short = new Short(0 as short);
        let result: int = maxValue.compareTo(zero);
        expect(result).assertEqual(1);
      }

      {
        let values: short[] = [0 as short, 1 as short, 32767 as short, (-1) as short, (-100) as short, (-32767) as short];
        let valueCount: int = 6;
        for (let i: int = 0; i < valueCount; i++) {
          let a: Short = new Short(values[i]);
          let absInt: int = Math.abs(a.toInt());
          let absVal: Short = new Short(Int.toShort(absInt));
          let cmp: int = a.compareTo(absVal);
          let expectedCmp: int = (a.toInt() >= 0) ? 0 : -1;
          expect(cmp).assertEqual(expectedCmp);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_COMPARETO_0200
     * @tc.name testShortCompareTo_merged2
     * @tc.desc BasicValue / BoundaryOverflow: covers 10 merged test points for Short.compareTo, including comparison and ordering, negative values, zero values, positive values, and sign handling.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortCompareTo_merged2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let zero: Short = new Short(0 as short);
        let negative: Short = new Short((-1) as short);
        expect(zero.compareTo(negative)).assertEqual(1);
      }

      {
        let negativeOne: Short = new Short((-1) as short);
        let largeNegative: Short = new Short((-10000) as short);
        let zero: Short = new Short(0 as short);
        expect(negativeOne.compareTo(zero)).assertEqual(-1);
        expect(largeNegative.compareTo(zero)).assertEqual(-1);
        expect(zero.compareTo(negativeOne)).assertEqual(1);
        expect(zero.compareTo(largeNegative)).assertEqual(1);
      }

      {
        let a: Short = new Short((-15000) as short);
        let b: Short = new Short((-5000) as short);
        expect(a.compareTo(b)).assertEqual(-1);
        expect(b.compareTo(a)).assertEqual(1);
      }

      {
        let largePositive: Short = new Short(20000 as short);
        let largeNegative: Short = new Short((-20000) as short);
        expect(largePositive.compareTo(largeNegative)).assertEqual(1);
        expect(largeNegative.compareTo(largePositive)).assertEqual(-1);
      }

      {
        let vals: Short[] = [
          new Short(Short.MIN_VALUE),
          new Short((-100) as short),
          new Short(0 as short),
          new Short(100 as short),
          new Short(Short.MAX_VALUE)
        ];
        let count: int = 5;
        for (let i: int = 0; i < count - 1; i++) {
          expect(vals[i].compareTo(vals[i + 1])).assertEqual(-1);
          expect(vals[i + 1].compareTo(vals[i])).assertEqual(1);
        }
      }

      {
        let negTwo: Short = new Short((-2) as short);
        let negOne: Short = new Short((-1) as short);
        let zero: Short = new Short(0 as short);
        let posOne: Short = new Short(1 as short);
        let posTwo: Short = new Short(2 as short);
        expect(negTwo.compareTo(negOne)).assertEqual(-1);
        expect(negOne.compareTo(zero)).assertEqual(-1);
        expect(zero.compareTo(posOne)).assertEqual(-1);
        expect(posOne.compareTo(posTwo)).assertEqual(-1);
        expect(negTwo.compareTo(posTwo)).assertEqual(-1);
      }

      {
        let x: Short = new Short(7 as short);
        let one: Short = new Short(1 as short);
        let negOne: Short = new Short((-1) as short);
        let identity: Short = x.mul(one);
        let inverse: Short = x.mul(negOne);
        let negLiteral: Short = new Short((-7) as short);
        expect(identity.compareTo(x)).assertEqual(0);
        expect(inverse.compareTo(negLiteral)).assertEqual(0);
        expect(x.compareTo(inverse)).assertEqual(1);
        expect(inverse.compareTo(x)).assertEqual(-1);
        expect(inverse.compareTo(identity)).assertEqual(-1);
      }

      {
        let base: Short = new Short(100 as short);
        let same: Short = new Short(100 as short);
        let oneMore: Short = new Short(101 as short);
        let oneLess: Short = new Short(99 as short);
        expect(base.compareTo(same)).assertEqual(0);
        expect(base.compareTo(oneMore)).assertEqual(-1);
        expect(base.compareTo(oneLess)).assertEqual(1);
        let zero: Short = new Short(0 as short);
        let zeroCopy: Short = new Short(0 as short);
        let posOne: Short = new Short(1 as short);
        let negOne: Short = new Short((-1) as short);
        expect(zero.compareTo(zeroCopy)).assertEqual(0);
        expect(zero.compareTo(posOne)).assertEqual(-1);
        expect(zero.compareTo(negOne)).assertEqual(1);
      }

      {
        let negPowers: Short[] = [
          new Short((-16384) as short),
          new Short((-8192) as short),
          new Short((-4096) as short),
          new Short((-2048) as short),
          new Short((-1024) as short),
          new Short((-512) as short),
          new Short((-256) as short),
          new Short((-128) as short),
          new Short((-64) as short),
          new Short((-32) as short),
          new Short((-16) as short),
          new Short((-8) as short),
          new Short((-4) as short),
          new Short((-2) as short),
          new Short((-1) as short)
        ];
        negPowers.sort((a, b) => a.compareTo(b));
        for (let i: int = 0; i < negPowers.length - 1; i++) {
          expect(negPowers[i].compareTo(negPowers[i + 1])).assertEqual(-1);
        }
        expect(negPowers[0].toShort()).assertEqual((-16384) as short);
        expect(negPowers[14].toShort()).assertEqual((-1) as short);
      }

      {
        let a: Short = new Short(100 as short);
        let b: Short = new Short(5 as short);
        let quotient: Short = a.div(b);
        let expected: Short = new Short(20 as short);
        expect(quotient.compareTo(expected)).assertEqual(0);
        let truncated: Short = new Short(100 as short).div(new Short(3 as short));
        let truncatedLit: Short = new Short(33 as short);
        let nextLit: Short = new Short(34 as short);
        expect(truncated.compareTo(truncatedLit)).assertEqual(0);
        expect(truncated.compareTo(nextLit)).assertEqual(-1);
        expect(nextLit.compareTo(truncated)).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_COMPARETO_0300
     * @tc.name testShortCompareTo_merged3
     * @tc.desc BoundaryOverflow: covers 10 merged test points for Short.compareTo, including comparison and ordering, boundary values, zero values, negative values, and equality consistency.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortCompareTo_merged3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let maxValue: Short = new Short(Short.MAX_VALUE);
        let result: int = maxValue.compareTo(maxValue);
        expect(result).assertEqual(0);
      }

      {
        let minValue: Short = new Short(Short.MIN_VALUE);
        let result: int = minValue.compareTo(minValue);
        expect(result).assertEqual(0);
      }

      {
        let adjacentMax: Short = new Short(32766 as short);
        let maxValue: Short = new Short(Short.MAX_VALUE);
        let result: int = adjacentMax.compareTo(maxValue);
        expect(result).assertEqual(-1);
      }

      {
        let adjacentMin: Short = new Short((-32767) as short);
        let minValue: Short = new Short(Short.MIN_VALUE);
        let result: int = adjacentMin.compareTo(minValue);
        expect(result).assertEqual(1);
      }

      {
        let a: Short = new Short(15 as short);
        let b: Short = new Short(25 as short);
        let c: Short = new Short(35 as short);
        let sumAB: Short = a.add(b);
        let sumBA: Short = b.add(a);
        expect(sumAB.compareTo(sumBA)).assertEqual(0);
        let leftAssoc: Short = (a.add(b)).add(c);
        let rightAssoc: Short = a.add(b.add(c));
        expect(leftAssoc.compareTo(rightAssoc)).assertEqual(0);
        expect(leftAssoc.compareTo(sumAB)).assertEqual(1);
      }

      {
        let minViaChar: Short = new Short(Char.toShort(c'\u8000'));
        let negOneViaChar: Short = new Short(Char.toShort(c'\uFFFF'));
        expect(minViaChar.compareTo(negOneViaChar)).assertEqual(-1);
        expect(negOneViaChar.compareTo(minViaChar)).assertEqual(1);
        expect(minViaChar.toShort()).assertEqual(Short.MIN_VALUE);
        expect(negOneViaChar.toShort()).assertEqual((-1) as short);
      }

      {
        let maxValue: Short = new Short(Short.MAX_VALUE);
        let literalMax: Short = new Short(32767 as short);
        expect(maxValue.compareTo(literalMax)).assertEqual(0);
        expect(literalMax.compareTo(maxValue)).assertEqual(0);
      }

      {
        let minValue: Short = new Short(Short.MIN_VALUE);
        let literalMin: Short = new Short((-32768) as short);
        expect(minValue.compareTo(literalMin)).assertEqual(0);
        expect(literalMin.compareTo(minValue)).assertEqual(0);
      }

      {
        let minValue: Short = new Short(Short.MIN_VALUE);
        let nearMin: Short = new Short((-32767) as short);
        let nearMax: Short = new Short(32766 as short);
        let maxValue: Short = new Short(Short.MAX_VALUE);
        expect(minValue.compareTo(nearMin)).assertEqual(-1);
        expect(nearMin.compareTo(nearMax)).assertEqual(-1);
        expect(nearMax.compareTo(maxValue)).assertEqual(-1);
        expect(minValue.compareTo(maxValue)).assertEqual(-1);
      }

      {
        let aValues: int[] = [10, 30, -20, -8, 100];
        let bValues: int[] = [25, 15, -5, 8, 100];
        let shifts: int[] = [-20, 3000, 25, -6000, 3000];
        let expectedSigns: int[] = [-1, 1, -1, -1, 0];
        for (let i: int = 0; i < 5; i++) {
          let baseA: Short = new Short(Int.toShort(aValues[i]));
          let baseB: Short = new Short(Int.toShort(bValues[i]));
          let shiftedA: Short = new Short(Int.toShort(aValues[i] + shifts[i]));
          let shiftedB: Short = new Short(Int.toShort(bValues[i] + shifts[i]));
          let baseResult: int = baseA.compareTo(baseB);
          let shiftedResult: int = shiftedA.compareTo(shiftedB);
          expect(baseResult).assertEqual(expectedSigns[i]);
          expect(shiftedResult).assertEqual(baseResult);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_COMPARETO_0400
     * @tc.name testShortCompareTo_merged4
     * @tc.desc BoundaryOverflow: covers 10 merged test points for Short.compareTo, including comparison and ordering, boundary values, equality consistency, overflow, and wrapping.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortCompareTo_merged4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let maxVal: Short = new Short(Short.MAX_VALUE);
        let one: Short = new Short(1 as short);
        let overflowed: Short = maxVal.add(one);
        let minVal: Short = new Short(Short.MIN_VALUE);
        expect(overflowed.compareTo(minVal)).assertEqual(0);
        expect(minVal.compareTo(overflowed)).assertEqual(0);
        expect(overflowed.toShort()).assertEqual(Short.MIN_VALUE);
        expect(maxVal.compareTo(overflowed)).assertEqual(1);
        expect(overflowed.compareTo(maxVal)).assertEqual(-1);
      }

      {
        let reference: Short = new Short(50 as short);
        let fromAdd: Short = new Short(30 as short).add(new Short(20 as short));
        let fromSub: Short = new Short(100 as short).sub(new Short(50 as short));
        let fromMul: Short = new Short(25 as short).mul(new Short(2 as short));
        expect(fromAdd.compareTo(reference)).assertEqual(0);
        expect(fromSub.compareTo(reference)).assertEqual(0);
        expect(fromMul.compareTo(reference)).assertEqual(0);
        expect(fromAdd.compareTo(fromSub)).assertEqual(0);
        expect(fromSub.compareTo(fromMul)).assertEqual(0);
        let larger: Short = new Short(100 as short);
        expect(fromAdd.compareTo(larger)).assertEqual(-1);
        expect(fromSub.compareTo(larger)).assertEqual(-1);
        expect(fromMul.compareTo(larger)).assertEqual(-1);
        let smaller: Short = new Short(10 as short);
        expect(fromAdd.compareTo(smaller)).assertEqual(1);
        expect(fromSub.compareTo(smaller)).assertEqual(1);
        expect(fromMul.compareTo(smaller)).assertEqual(1);
      }

      {
        let maxValue: Short = new Short(Short.MAX_VALUE);
        let nearMax: Short = new Short(Int.toShort(32766));
        let result: int = maxValue.compareTo(nearMax);
        expect(result).assertEqual(1);
      }

      {
        let minValue: Short = new Short(Short.MIN_VALUE);
        let nearMin: Short = new Short((-32767) as short);
        let result: int = minValue.compareTo(nearMin);
        expect(result).assertEqual(-1);
      }

      {
        let a: Short = new Short(10 as short);
        let b: Short = new Short(20 as short);
        let c: Short = new Short(40 as short);
        let d: Short = new Short(5 as short);
        let mulAB: Short = a.mul(b);
        let mulCD: Short = c.mul(d);
        expect(mulAB.compareTo(mulCD)).assertEqual(0);
        expect(mulAB.toShort()).assertEqual(200 as short);
        expect(mulCD.toShort()).assertEqual(200 as short);
      }

      {
        let minValue: Short = new Short(Short.MIN_VALUE);
        let one: Short = new Short(1 as short);
        let underflowed: Short = minValue.sub(one);
        let maxValue: Short = new Short(Short.MAX_VALUE);
        expect(underflowed.compareTo(maxValue)).assertEqual(0);
        expect(underflowed.toShort()).assertEqual(Short.MAX_VALUE);
      }

      {
        let a: Short = new Short(256 as short);
        let b: Short = new Short(128 as short);
        let product: Short = a.mul(b);
        let expected: Short = new Short(Short.MIN_VALUE);
        expect(product.compareTo(expected)).assertEqual(0);
        let c: Short = new Short(512 as short);
        let d: Short = new Short(64 as short);
        let product2: Short = c.mul(d);
        expect(product2.compareTo(expected)).assertEqual(0);
        expect(product.compareTo(product2)).assertEqual(0);
      }

      {
        let original: Short = new Short(255 as short);
        let fromLargeInt: Short = new Short(Int.toShort(65535));
        expect(original.compareTo(fromLargeInt)).assertEqual(1);
        expect(fromLargeInt.compareTo(original)).assertEqual(-1);
        let zero: Short = new Short(0 as short);
        let from65536: Short = new Short(Int.toShort(65536));
        expect(from65536.compareTo(zero)).assertEqual(0);
        expect(from65536.toShort()).assertEqual(0 as short);
      }

      {
        let values: Short[] = [
          new Short(5 as short), new Short(3 as short), new Short(9 as short),
          new Short(2 as short), new Short(12 as short)
        ];
        let valleyIdx: int = -1;
        for (let i: int = 1; i < 4; i++) {
          if (values[i].compareTo(values[i - 1]) < 0 && values[i].compareTo(values[i + 1]) < 0) {
            valleyIdx = i;
            break;
          }
        }
        expect(valleyIdx).assertEqual(1);
        expect(values[valleyIdx].toShort()).assertEqual(3 as short);
      }

      {
        let chars: char[] = [c'\u0000', c'A', c'\u7FFF', c'\u8000', c'\uFF9C', c'\uFFFF'];
        let signed: int[] = [0, 65, 32767, -32768, -100, -1];
        for (let i: int = 0; i < chars.length; i++) {
          let fromChar: Short = new Short(Char.toShort(chars[i]));
          let fromInt: Short = new Short(Int.toShort(signed[i]));
          expect(fromChar.compareTo(fromInt)).assertEqual(0);
          expect(fromChar.toShort()).assertEqual(Int.toShort(signed[i]));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_COMPARETO_0500
     * @tc.name testShortCompareTo_merged5
     * @tc.desc BoundaryOverflow / ErrorException / CrossTypeRoundTrip: covers 10 merged test points for Short.compareTo, including comparison and ordering, type conversion, equality consistency, constructor forms, and exceptions.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortCompareTo_merged5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let equalA: Short = new Short(45 as short);
        let equalB: Short = new Short(45 as short);
        let higher: Short = new Short(90 as short);
        expect((equalA.compareTo(equalB) <= 0)).assertEqual(equalA.isLessEqualThan(equalB));
        expect(equalA.isLessEqualThan(equalB)).assertTrue();
        expect((equalA.compareTo(equalB) >= 0)).assertEqual(equalA.isGreaterEqualThan(equalB));
        expect(equalA.isGreaterEqualThan(equalB)).assertTrue();
        expect((equalA.compareTo(higher) <= 0)).assertEqual(equalA.isLessEqualThan(higher));
        expect(equalA.isLessEqualThan(higher)).assertTrue();
        expect(equalA.isGreaterEqualThan(higher)).assertFalse();
        expect((higher.compareTo(equalA) <= 0)).assertEqual(higher.isLessEqualThan(equalA));
        expect(higher.isLessEqualThan(equalA)).assertFalse();
        expect(higher.isGreaterEqualThan(equalA)).assertTrue();
      }

      {
        let l: long = Long.toLong(500);
        let fromLong: Short = new Short(Long.toShort(l));
        let fromLiteral: Short = new Short(500 as short);
        expect(fromLong.compareTo(fromLiteral)).assertEqual(0);
        let largerFromLong: Short = new Short(Long.toShort(Long.toLong(30000)));
        let largerFromLit: Short = new Short(30000 as short);
        expect(largerFromLong.compareTo(largerFromLit)).assertEqual(0);
        let hugeLong: long = Long.toLong(100000);
        let truncated: Short = new Short(Long.toShort(hugeLong));
        let truncatedLit: Short = new Short(Int.toShort(100000));
        expect(truncated.compareTo(truncatedLit)).assertEqual(0);
      }

      {
        let d: double = 255.7;
        let fromDouble: Short = new Short(Double.toShort(d));
        let fromLiteral: Short = new Short(255 as short);
        expect(fromDouble.compareTo(fromLiteral)).assertEqual(0);
        let smallFromDouble: Short = new Short(Double.toShort(3.14));
        let smallFromLit: Short = new Short(3 as short);
        expect(smallFromDouble.compareTo(smallFromLit)).assertEqual(0);
        let negDouble: double = -128.9;
        let fromNegDouble: Short = new Short(Double.toShort(negDouble));
        let negLiteral: Short = new Short((-128) as short);
        expect(fromNegDouble.compareTo(negLiteral)).assertEqual(0);
      }

      {
        let values: Short[] = [
          new Short(1 as short), new Short(3 as short), new Short(7 as short),
          new Short(5 as short), new Short(2 as short)
        ];
        let peakIdx: int = -1;
        let peakVal: int = -1;
        for (let i: int = 1; i < 4; i++) {
          if (values[i].compareTo(values[i - 1]) > 0 && values[i].compareTo(values[i + 1]) > 0) {
            peakIdx = i;
            peakVal = values[i].toInt();
            break;
          }
        }
        expect(peakIdx).assertEqual(2);
        expect(peakVal).assertEqual(7);
      }

      {
        let strictlyInc: Short[] = [
          new Short((-100) as short), new Short(0 as short), new Short(100 as short),
          new Short(200 as short)
        ];
        let isStrictlyIncreasing: boolean = true;
        for (let i: int = 0; i < 3; i++) {
          if (strictlyInc[i].compareTo(strictlyInc[i + 1]) >= 0) {
            isStrictlyIncreasing = false;
            break;
          }
        }
        expect(isStrictlyIncreasing).assertTrue();
  
        let notStrict: Short[] = [
          new Short(10 as short), new Short(10 as short), new Short(20 as short)
        ];
        let violatesStrict: boolean = notStrict[0].compareTo(notStrict[1]) >= 0;
        expect(violatesStrict).assertTrue();
  
        let nonDecreasing: Short[] = [
          new Short(1 as short), new Short(1 as short), new Short(2 as short),
          new Short(3 as short), new Short(5 as short)
        ];
        let isNonDecreasing: boolean = true;
        for (let i: int = 0; i < 4; i++) {
          if (nonDecreasing[i].compareTo(nonDecreasing[i + 1]) > 0) {
            isNonDecreasing = false;
            break;
          }
        }
        expect(isNonDecreasing).assertTrue();
  
        let descending: Short[] = [
          new Short(3 as short), new Short(1 as short)
        ];
        let violatesNonDec: boolean = descending[0].compareTo(descending[1]) > 0;
        expect(violatesNonDec).assertTrue();
      }

      {
        try {
          let nullOperand: Short = null as Short;
          new Short(10 as short).compareTo(nullOperand);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
        }
      }

      {
        try {
          new Short(10 as short).compareTo(undefined as Short);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
        }
      }

      {
        let testValues: Short[] = [
          new Short(Short.MIN_VALUE),
          new Short((-10000) as short),
          new Short((-1) as short),
          new Short(0 as short),
          new Short(1 as short),
          new Short(10000 as short),
          new Short(Short.MAX_VALUE)
        ];
        let count: int = 7;
        for (let i: int = 0; i < count; i++) {
          for (let j: int = 0; j < count; j++) {
            let result: int = testValues[i].compareTo(testValues[j]);
            let expectedResult: int = i < j ? -1 : (i > j ? 1 : 0);
            expect(result).assertEqual(expectedResult);
          }
        }
      }

      {
        let a: Short = new Short(100 as short);
        let b: Short = new Short(250 as short);
        let restored: Short = (a.sub(b)).add(b);
        expect(restored.compareTo(a)).assertEqual(0);
        let smaller: Short = new Short(50 as short);
        let larger: Short = new Short(200 as short);
        expect(restored.compareTo(smaller)).assertEqual(1);
        expect(restored.compareTo(larger)).assertEqual(-1);
        let x: Short = new Short((-40) as short);
        let y: Short = new Short(90 as short);
        let restoredNeg: Short = (x.sub(y)).add(y);
        expect(restoredNeg.compareTo(x)).assertEqual(0);
      }

      {
        let raw: Short[] = [
          new Short(500 as short), new Short(200 as short), new Short(500 as short), new Short(800 as short), new Short(200 as short)
        ];
  
        let uniqueSet: Set<Short> = new Set<Short>();
        for (let v of raw) {
          let exists: boolean = false;
          uniqueSet.forEach((item) => { if (item.equals(v)) exists = true; });
          if (!exists) uniqueSet.add(v);
        }
  
        let uniqueArr: Short[] = [];
        uniqueSet.forEach((v): void => { uniqueArr.push(v); });
        uniqueArr.sort((a, b) => a.compareTo(b));
  
        expect(uniqueArr.length).assertEqual(3);
  
        let thresholdFloat: float = 400.0f;
        let passed: int[] = [];
        for (let v of uniqueArr) {
          let fv: float = v.toFloat();
          if (fv >= thresholdFloat) passed.push(v.toInt());
        }
        expect(passed.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_COMPARETO_0600
     * @tc.name testShortCompareTo_merged6
     * @tc.desc CrossTypeRoundTrip / RadixConversion: covers 10 merged test points for Short.compareTo, including comparison and ordering, radix conversion, type conversion, round-trip conversion, and constructor forms.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortCompareTo_merged6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let original: Short = new Short(12345 as short);
        let roundtripped: Short = new Short(Int.toShort(original.toInt()));
        expect(original.compareTo(roundtripped)).assertEqual(0);
        expect(roundtripped.toShort()).assertEqual(12345 as short);
        let negVal: Short = new Short((-20000) as short);
        let negRoundtripped: Short = new Short(Int.toShort(negVal.toInt()));
        expect(negVal.compareTo(negRoundtripped)).assertEqual(0);
        expect(negRoundtripped.toShort()).assertEqual((-20000) as short);
      }

      {
        let fromIntToShort: Short = new Short(Int.toShort(0xFF));
        let fromConstructor: Short = new Short(255 as short);
        expect(fromIntToShort.compareTo(fromConstructor)).assertEqual(0);
        expect(fromIntToShort.toShort()).assertEqual(255 as short);
        expect(fromConstructor.toShort()).assertEqual(255 as short);
      }

      {
        let posByte: byte = 100 as byte;
        let fromByte: Short = new Short(Byte.toShort(posByte));
        let fromLiteral: Short = new Short(100 as short);
        expect(fromByte.compareTo(fromLiteral)).assertEqual(0);
        expect(fromLiteral.compareTo(fromByte)).assertEqual(0);
        let negByte: byte = (-50) as byte;
        let fromNegByte: Short = new Short(Byte.toShort(negByte));
        let negLiteral: Short = new Short((-50) as short);
        expect(fromNegByte.compareTo(negLiteral)).assertEqual(0);
        expect(negLiteral.compareTo(fromNegByte)).assertEqual(0);
      }

      {
        let original: Short = new Short(100 as short);
        let b: byte = original.toByte();
        let roundtrip: Short = new Short(Int.toShort(b));
        expect(roundtrip.compareTo(original)).assertEqual(0);
        let negOri: Short = new Short((-50) as short);
        let negB: byte = negOri.toByte();
        let negRound: Short = new Short(Int.toShort(negB));
        expect(negRound.compareTo(negOri)).assertEqual(0);
      }

      {
        let hexSmall: Short = new Short(0x64 as short);
        let hexLarge: Short = new Short(0xC8 as short);
        expect(hexSmall.compareTo(hexLarge)).assertEqual(-1);
        expect(hexLarge.compareTo(hexSmall)).assertEqual(1);
        expect(hexSmall.toShort()).assertEqual(100 as short);
        expect(hexLarge.toShort()).assertEqual(200 as short);
      }

      {
        let digit0: Short = new Short(Char.toShort(c'0'));
        let digit9: Short = new Short(Char.toShort(c'9'));
        expect(digit0.compareTo(digit9)).assertEqual(-1);
        expect(digit9.compareTo(digit0)).assertEqual(1);
        expect(digit0.toShort()).assertEqual(48 as short);
        expect(digit9.toShort()).assertEqual(57 as short);
  
        let upperA: Short = new Short(Char.toShort(c'A'));
        let upperZ: Short = new Short(Char.toShort(c'Z'));
        expect(upperA.compareTo(upperZ)).assertEqual(-1);
        expect(upperZ.compareTo(upperA)).assertEqual(1);
        expect(digit9.compareTo(upperA)).assertEqual(-1);
  
        let lowerA: Short = new Short(Char.toShort(c'a'));
        let lowerZ: Short = new Short(Char.toShort(c'z'));
        expect(lowerA.compareTo(lowerZ)).assertEqual(-1);
        expect(lowerZ.compareTo(lowerA)).assertEqual(1);
        expect(upperZ.compareTo(lowerA)).assertEqual(-1);
      }

      {
        let ids: Short[] = [];
        for (let i: int = 0; i < 20; i++) {
          ids.push(new Short(Int.toShort(i * 500 + 100)));
        }
  
        ids.sort((a, b) => a.compareTo(b));
        expect(ids[0].toInt()).assertEqual(100);
        expect(ids[19].toInt()).assertEqual(9600);
  
        let target: int = 5100;
        let found: boolean = false;
        let lo: int = 0, hi: int = ids.length - 1;
        while (lo <= hi) {
          let mid: int = (lo + hi) >> 1;
          let cmp: int = ids[mid].toInt() - target;
          if (cmp === 0) { found = true; break; }
          else if (cmp < 0) lo = mid + 1;
          else hi = mid - 1;
        }
        expect(found).assertTrue();
  
        let foundVal: long = ids[lo].toLong();
        expect(foundVal.toInt() >= target).assertTrue();
      }

      {
        let negHexA: Short = new Short((-0x10) as short);
        let negHexB: Short = new Short((-0x20) as short);
        expect(negHexA.compareTo(negHexB)).assertEqual(1);
        expect(negHexB.compareTo(negHexA)).assertEqual(-1);
        expect(negHexA.toShort()).assertEqual((-16) as short);
        expect(negHexB.toShort()).assertEqual((-32) as short);
  
        let negOctA: Short = new Short((-0o10) as short);
        let negOctB: Short = new Short((-0o20) as short);
        expect(negOctA.compareTo(negOctB)).assertEqual(1);
        expect(negOctB.compareTo(negOctA)).assertEqual(-1);
  
        let negBinA: Short = new Short((-0b10) as short);
        let negBinB: Short = new Short((-0b1) as short);
        expect(negBinA.compareTo(negBinB)).assertEqual(-1);
        expect(negBinB.compareTo(negBinA)).assertEqual(1);
  
        let hexVal: Short = new Short(0x10 as short);
        let negHexVal: Short = new Short((-0x10) as short);
        expect(hexVal.compareTo(negHexVal)).assertEqual(1);
        expect(negHexVal.compareTo(hexVal)).assertEqual(-1);
      }

      {
        let arr: Short[] = Array.create<Short>(50, new Short(0 as short));
        for (let i: int = 0; i < 50; i++) {
          arr[i] = new Short(Int.toShort(i * 100));
        }
        for (let i: int = 0; i < 50; i++) {
          let target: Short = new Short(Int.toShort(i * 100));
          let lo: int = 0;
          let hi: int = arr.length - 1;
          let foundIdx: int = -1;
          while (lo <= hi) {
            let mid: int = Double.toInt(Math.floor((lo + hi) / 2));
            let cmp: int = arr[mid].compareTo(target);
            if (cmp == 0) {
              foundIdx = mid;
              break;
            } else if (cmp < 0) {
              lo = mid + 1;
            } else {
              hi = mid - 1;
            }
          }
          expect(foundIdx).assertEqual(i);
        }
      }

      {
        let hexVal: Short = new Short(0xFF as short);
        let decVal: Short = new Short(255 as short);
        expect(hexVal.compareTo(decVal)).assertEqual(0);
        expect(hexVal.toShort()).assertEqual(255 as short);
        expect(decVal.toShort()).assertEqual(255 as short);
        let hexLarge: Short = new Short(0x7FFF as short);
        let decLarge: Short = new Short(32767 as short);
        expect(hexLarge.compareTo(decLarge)).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_COMPARETO_0700
     * @tc.name testShortCompareTo_merged7
     * @tc.desc Idempotent: covers 10 merged test points for Short.compareTo, including comparison and ordering, equality consistency, negative values, zero values, and opposite values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortCompareTo_merged7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let current: Short = new Short(10 as short);
        let other: Short = new Short(20 as short);
        let first: int = current.compareTo(other);
        let second: int = current.compareTo(other);
        let third: int = current.compareTo(other);
        expect(first).assertEqual(-1);
        expect(second).assertEqual(-1);
        expect(third).assertEqual(-1);
      }

      {
        let currentA: Short = new Short(100 as short);
        let currentB: Short = new Short(100 as short);
        let other: Short = new Short(200 as short);
        let resultA: int = currentA.compareTo(other);
        let resultB: int = currentB.compareTo(other);
        expect(resultA).assertEqual(-1);
        expect(resultB).assertEqual(-1);
      }

      {
        let current: Short = new Short(25 as short);
        let other: Short = new Short(30 as short);
        let beforeValue: int = current.toInt();
        let compareResult: int = current.compareTo(other);
        let afterValue: int = current.toInt();
        expect(compareResult).assertEqual(-1);
        expect(beforeValue).assertEqual(25);
        expect(afterValue).assertEqual(25);
      }

      {
        let a: Short = new Short(3 as short);
        let b: Short = new Short(8 as short);
        let aToB: int = a.compareTo(b);
        let bToA: int = b.compareTo(a);
        expect(aToB).assertEqual(-1);
        expect(bToA).assertEqual(1);
        expect(aToB).assertEqual(-bToA);
      }

      {
        let a: Short = new Short(1 as short);
        let b: Short = new Short(5 as short);
        let c: Short = new Short(9 as short);
        let aToB: int = a.compareTo(b);
        let bToC: int = b.compareTo(c);
        let aToC: int = a.compareTo(c);
        expect(aToB).assertEqual(-1);
        expect(bToC).assertEqual(-1);
        expect(aToC).assertEqual(-1);
      }

      {
        let positive: Short = new Short(1 as short);
        let negative: Short = new Short((-1) as short);
        let posToNeg: int = positive.compareTo(negative);
        let negToPos: int = negative.compareTo(positive);
        expect(posToNeg).assertEqual(1);
        expect(negToPos).assertEqual(-1);
        expect(posToNeg).assertEqual(-negToPos);
      }

      {
        let val1: Short = new Short(42 as short);
        let val2: Short = new Short((-99) as short);
        let val3: Short = new Short(0 as short);
        let val4: Short = new Short(32767 as short);
        expect(val1.compareTo(val1)).assertEqual(0);
        expect(val2.compareTo(val2)).assertEqual(0);
        expect(val3.compareTo(val3)).assertEqual(0);
        expect(val4.compareTo(val4)).assertEqual(0);
      }

      {
        let pairs: Short[][] = [
          [new Short(5 as short), new Short(10 as short)],
          [new Short((-30) as short), new Short((-10) as short)],
          [new Short(0 as short), new Short(100 as short)],
          [new Short((-50) as short), new Short(0 as short)]
        ];
        let pairCount: int = 4;
        for (let i: int = 0; i < pairCount; i++) {
          let left: Short = pairs[i][0];
          let right: Short = pairs[i][1];
          expect(left.compareTo(right)).assertEqual(-right.compareTo(left));
        }
      }

      {
        let zero: Short = new Short(0 as short);
        let positives: Short[] = [
          new Short(1 as short),
          new Short(1000 as short),
          new Short(Short.MAX_VALUE)
        ];
        let negatives: Short[] = [
          new Short((-1) as short),
          new Short((-1000) as short),
          new Short(Short.MIN_VALUE)
        ];
        let count: int = 3;
        for (let i: int = 0; i < count; i++) {
          expect(positives[i].compareTo(zero)).assertEqual(1);
          expect(negatives[i].compareTo(zero)).assertEqual(-1);
        }
      }

      {
        let a: Short = new Short(Short.parseInt('42', 10));
        let b: Short = new Short(Short.parseInt('42', 10));
        expect(a.compareTo(b)).assertEqual(0);
        expect(a.toShort()).assertEqual(42 as short);
        expect(b.toShort()).assertEqual(42 as short);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_COMPARETO_0800
     * @tc.name testShortCompareTo_merged8
     * @tc.desc Idempotent: covers 10 merged test points for Short.compareTo, including comparison and ordering, equality consistency, sign handling, opposite values, and fractions and rounding.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortCompareTo_merged8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let a: Short = new Short(1000 as short);
        let b: Short = new Short(1001 as short);
        expect(a.compareTo(b)).assertEqual(-1);
        expect(b.compareTo(a)).assertEqual(1);
        expect(a.compareTo(b)).assertEqual(-b.compareTo(a));
      }

      {
        let fromDecimal: Short = new Short(100 as short);
        let fromHex: Short = new Short(0x64 as short);
        let fromOctal: Short = new Short(0o144 as short);
        let fromBinary: Short = new Short(0b1100100 as short);
        let fromParseInt: Short = new Short(Short.parseInt('100', 10));
        expect(fromDecimal.compareTo(fromHex)).assertEqual(0);
        expect(fromDecimal.compareTo(fromOctal)).assertEqual(0);
        expect(fromDecimal.compareTo(fromBinary)).assertEqual(0);
        expect(fromDecimal.compareTo(fromParseInt)).assertEqual(0);
        expect(fromHex.compareTo(fromOctal)).assertEqual(0);
        expect(fromHex.compareTo(fromBinary)).assertEqual(0);
        expect(fromHex.compareTo(fromParseInt)).assertEqual(0);
        let larger: Short = new Short(200 as short);
        expect(fromDecimal.compareTo(larger)).assertEqual(-1);
        expect(fromHex.compareTo(larger)).assertEqual(-1);
        expect(fromBinary.compareTo(larger)).assertEqual(-1);
        expect(fromParseInt.compareTo(larger)).assertEqual(-1);
      }

      {
        let pairs: Short[][] = [
          [new Short(100 as short), new Short(50 as short)],
          [new Short((-1) as short), new Short(1 as short)],
          [new Short(0 as short), new Short(0 as short)],
          [new Short(Short.MAX_VALUE), new Short(Short.MIN_VALUE)],
          [new Short((-20000) as short), new Short((-30000) as short)]
        ];
        let pairCount: int = 5;
        for (let i: int = 0; i < pairCount; i++) {
          let a: Short = pairs[i][0];
          let b: Short = pairs[i][1];
          let cmp: int = a.compareTo(b);
          expect(a.isGreaterThan(b)).assertEqual(cmp > 0);
          expect(a.isLessThan(b)).assertEqual(cmp < 0);
          expect(a.equals(b)).assertEqual(cmp == 0);
        }
      }

      {
        let seed: int = 12345;
        for (let i: int = 0; i < 100; i++) {
          seed = (seed * 16807 + 0) % 2147483647;
          let aVal: int = seed % 20000;
          seed = (seed * 16807 + 0) % 2147483647;
          let bVal: int = aVal + ((seed > 0 ? seed : -seed) % 5000) + 1;
          seed = (seed * 16807 + 0) % 2147483647;
          let cVal: int = bVal + ((seed > 0 ? seed : -seed) % 5000) + 1;
          if (cVal > 32767) {
            cVal = 32767;
            bVal = cVal - 1;
            aVal = bVal - 1;
          }
          let a: Short = new Short(Int.toShort(aVal));
          let b: Short = new Short(Int.toShort(bVal));
          let c: Short = new Short(Int.toShort(cVal));
          expect(a.compareTo(b)).assertEqual(-1);
          expect(b.compareTo(c)).assertEqual(-1);
          expect(a.compareTo(c)).assertEqual(-1);
        }
      }

      {
        let seed: int = 54321;
        for (let i: int = 0; i < 100; i++) {
          seed = (seed * 16807 + 0) % 2147483647;
          let val: int = Int.toShort(seed % 65536) - 32768;
          let a: Short = new Short(Int.toShort(val));
          let b: Short = new Short(Int.toShort(val));
          let c: Short = new Short(Int.toShort(val));
          expect(a.compareTo(b)).assertEqual(0);
          expect(b.compareTo(c)).assertEqual(0);
          expect(a.compareTo(c)).assertEqual(0);
        }
      }

      {
        let val1: Short = new Short((-200) as short);
        let val2: Short = new Short((100) as short);
        let val3: Short = new Short((300) as short);
        let val4: Short = new Short((100) as short);
        let val5: Short = new Short((300) as short);
        let aToB: int = val1.compareTo(val2);
        let bToC: int = val2.compareTo(val3);
        let aToC: int = val1.compareTo(val3);
        expect(aToB).assertEqual(-1);
        expect(bToC).assertEqual(-1);
        expect(aToC).assertEqual(-1);
        let dToE: int = val4.compareTo(val5);
        let dToD: int = val4.compareTo(val4);
        expect(dToE).assertEqual(-1);
        expect(dToD).assertEqual(0);
      }

      {
        let seed: int = 98765;
        for (let i: int = 0; i < 1000; i++) {
          seed = (seed * 16807 + 0) % 2147483647;
          let aVal: int = Int.toShort(seed % 65536) - 32768;
          seed = (seed * 16807 + 0) % 2147483647;
          let bVal: int = Int.toShort(seed % 65536) - 32768;
          let a: Short = new Short(Int.toShort(aVal));
          let b: Short = new Short(Int.toShort(bVal));
          let ab: int = a.compareTo(b);
          let ba: int = b.compareTo(a);
          expect(ab).assertEqual(-ba);
        }
      }

      {
        let pairs: Short[][] = [
          [new Short(999 as short), new Short(999 as short)],
          [new Short((-1) as short), new Short((-1) as short)],
          [new Short(0 as short), new Short(0 as short)],
          [new Short(Short.MAX_VALUE), new Short(Short.MAX_VALUE)],
          [new Short(Short.MIN_VALUE), new Short(Short.MIN_VALUE)]
        ];
        let pairCount: int = 5;
        for (let i: int = 0; i < pairCount; i++) {
          let a: Short = pairs[i][0];
          let b: Short = pairs[i][1];
          let cmp: int = a.compareTo(b);
          let eq: boolean = a.equals(b);
          expect((cmp == 0)).assertEqual(eq);
        }
      }

      {
        let a: Short = new Short(10 as short);
        let b: Short = new Short(20 as short);
        let cmp: int = a.compareTo(b);
        expect((cmp < 0)).assertEqual(a.isLessThan(b));
        expect(a.isLessThan(b)).assertTrue();
        let c: Short = new Short((-5) as short);
        let d: Short = new Short((-10) as short);
        let cmp2: int = c.compareTo(d);
        expect((cmp2 < 0)).assertEqual(c.isLessThan(d));
        expect(c.isLessThan(d)).assertFalse();
      }

      {
        let a: Short = new Short(100 as short);
        let b: Short = new Short(50 as short);
        let cmp: int = a.compareTo(b);
        expect((cmp > 0)).assertEqual(a.isGreaterThan(b));
        expect(a.isGreaterThan(b)).assertTrue();
        let c: Short = new Short((-50) as short);
        let d: Short = new Short((-100) as short);
        let cmp2: int = c.compareTo(d);
        expect((cmp2 > 0)).assertEqual(c.isGreaterThan(d));
        expect(c.isGreaterThan(d)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_COMPARETO_0900
     * @tc.name testShortCompareTo_merged9
     * @tc.desc Idempotent / ArithmeticBitwise: covers 10 merged test points for Short.compareTo, including comparison and ordering, equality consistency, sign handling, containers and references, and type conversion.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortCompareTo_merged9', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let a: Short = new Short(500 as short);
        let b: Short = new Short(1000 as short);
        let cmp: int = a.compareTo(b);
        let intCmp: int = a.toInt() < b.toInt() ? -1 : (a.toInt() > b.toInt() ? 1 : 0);
        expect(cmp).assertEqual(intCmp);
        let c: Short = new Short((-500) as short);
        let d: Short = new Short((-1000) as short);
        let cmp2: int = c.compareTo(d);
        let intCmp2: int = c.toInt() < d.toInt() ? -1 : (c.toInt() > d.toInt() ? 1 : 0);
        expect(cmp2).assertEqual(intCmp2);
      }

      {
        let a: Short = new Short(100 as short);
        let b: Short = new Short(200 as short);
        let c: Short = new Short(50 as short);
        let d: Short = new Short(250 as short);
        let sumAB: Short = a.add(b);
        let sumCD: Short = c.add(d);
        expect(sumAB.compareTo(sumCD)).assertEqual(0);
        let e: Short = new Short(500 as short);
        let f: Short = new Short(500 as short);
        let sumEF: Short = e.add(f);
        let big: Short = new Short(1000 as short);
        expect(big.compareTo(sumEF)).assertEqual(0);
      }

      {
        let a: Short = new Short(300 as short);
        let b: Short = new Short(100 as short);
        let c: Short = new Short(250 as short);
        let d: Short = new Short(50 as short);
        let subAB: Short = a.sub(b);
        let subCD: Short = c.sub(d);
        expect(subAB.compareTo(subCD)).assertEqual(0);
        expect(subAB.toShort()).assertEqual(200 as short);
        expect(subCD.toShort()).assertEqual(200 as short);
      }

      {
        let a: Short = new Short(100 as short);
        let b: Short = new Short(5 as short);
        let c: Short = new Short(200 as short);
        let d: Short = new Short(10 as short);
        let divAB: Short = a.div(b);
        let divCD: Short = c.div(d);
        expect(divAB.compareTo(divCD)).assertEqual(0);
        expect(divAB.toShort()).assertEqual(20 as short);
        let e: Short = new Short(300 as short);
        let f: Short = new Short(5 as short);
        let divEF: Short = e.div(f);
        expect(divEF.compareTo(divAB)).assertEqual(1);
      }

      {
        let a: Short = new Short(100 as short);
        let b: Short = new Short((-100) as short);
        let aNeg: Short = new Short((-100) as short);
        let bNeg: Short = new Short(100 as short);
        expect(a.compareTo(b)).assertEqual(1);
        expect(aNeg.compareTo(bNeg)).assertEqual(-1);
        expect(a.compareTo(aNeg)).assertEqual(1);
        expect(b.compareTo(bNeg)).assertEqual(-1);
      }

      {
        let a: Short = new Short(Short.parseInt('50', 10));
        let b: Short = new Short(Short.parseInt('100', 10));
        expect(a.compareTo(b)).assertEqual(-1);
        expect(b.compareTo(a)).assertEqual(1);
        expect(a.toShort()).assertEqual(50 as short);
        expect(b.toShort()).assertEqual(100 as short);
      }

      {
        let a: Short = new Short(10 as short);
        let b: Short = new Short(20 as short);
        let c: Short = new Short(30 as short);
        let sum: Short = (a.add(b)).add(c);
        let expected: Short = new Short(60 as short);
        expect(sum.compareTo(expected)).assertEqual(0);
        let smaller: Short = new Short(50 as short);
        expect(smaller.compareTo(sum)).assertEqual(-1);
      }

      {
        let arr: Short[] = [
          new Short(40 as short), new Short((-5) as short), new Short(300 as short),
          new Short(7 as short), new Short((-123) as short), new Short(200 as short)
        ];
        let minVal: Short = arr[0];
        let maxVal: Short = arr[0];
        for (let i: int = 1; i < 6; i++) {
          if (arr[i].compareTo(minVal) < 0) {
            minVal = arr[i];
          }
          if (arr[i].compareTo(maxVal) > 0) {
            maxVal = arr[i];
          }
        }
        expect(minVal.toShort()).assertEqual((-123) as short);
        expect(maxVal.toShort()).assertEqual(300 as short);
        expect(minVal.compareTo(maxVal)).assertEqual(-1);
      }

      {
        let a: Short = new Short(12 as short);
        let b: Short = new Short(34 as short);
        let sumAB: Short = a.add(b);
        expect(a.compareTo(sumAB)).assertEqual(-1);
        expect(b.compareTo(sumAB)).assertEqual(-1);
        expect(sumAB.compareTo(a)).assertEqual(1);
        expect(sumAB.compareTo(b)).assertEqual(1);
  
        let c: Short = new Short((-12) as short);
        let d: Short = new Short((-34) as short);
        let sumCD: Short = c.add(d);
        expect(c.compareTo(sumCD)).assertEqual(1);
        expect(d.compareTo(sumCD)).assertEqual(1);
        expect(sumCD.compareTo(c)).assertEqual(-1);
        expect(sumCD.compareTo(d)).assertEqual(-1);
      }

      {
        let records: [Short, Short][] = [
          [new Short(300 as short), new Short(10 as short)],
          [new Short(100 as short), new Short(30 as short)],
          [new Short(300 as short), new Short(5 as short)],
          [new Short(200 as short), new Short(20 as short)],
          [new Short(100 as short), new Short(15 as short)]
        ];
  
        records.sort((a, b) => {
          let primaryCmp: int = b[0].compareTo(a[0]);
          if (primaryCmp !== 0) {
            return primaryCmp;
          }
          return a[1].compareTo(b[1]);
        });
  
        expect(records[0][0].toShort()).assertEqual(300 as short);
        expect(records[0][1].toShort()).assertEqual(5 as short);
        expect(records[1][0].toShort()).assertEqual(300 as short);
        expect(records[1][1].toShort()).assertEqual(10 as short);
        expect(records[2][0].toShort()).assertEqual(200 as short);
        expect(records[2][1].toShort()).assertEqual(20 as short);
        expect(records[3][0].toShort()).assertEqual(100 as short);
        expect(records[3][1].toShort()).assertEqual(15 as short);
        expect(records[4][0].toShort()).assertEqual(100 as short);
        expect(records[4][1].toShort()).assertEqual(30 as short);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_COMPARETO_1000
     * @tc.name testShortCompareTo_merged10
     * @tc.desc ArithmeticBitwise / SortCompare / BusinessScenario: covers 10 merged test points for Short.compareTo, including comparison and ordering, containers and references, constructor forms, equality consistency, and algebraic properties.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortCompareTo_merged10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let a: Short = new Short(100 as short);
        let b: Short = new Short(200 as short);
        let cmp: int = a.compareTo(b);
        let lessCount: int = (cmp < 0) ? 1 : 0;
        let equalCount: int = (cmp == 0) ? 1 : 0;
        let greaterCount: int = (cmp > 0) ? 1 : 0;
        expect(lessCount + equalCount + greaterCount).assertEqual(1);
        let sameA: Short = new Short(50 as short);
        let sameB: Short = new Short(50 as short);
        let sameCmp: int = sameA.compareTo(sameB);
        expect(sameCmp).assertEqual(0);
      }

      {
        let heapArr: Short[] = [
          new Short(2 as short), new Short(5 as short), new Short(4 as short),
          new Short(9 as short), new Short(7 as short), new Short(6 as short), new Short(8 as short)
        ];
        let isMinHeap: boolean = true;
        for (let i: int = 0; i < 3; i++) {
          let leftChild: int = 2 * i + 1;
          let rightChild: int = 2 * i + 2;
          if (heapArr[i].compareTo(heapArr[leftChild]) > 0) {
            isMinHeap = false;
            break;
          }
          if (rightChild < 7 && heapArr[i].compareTo(heapArr[rightChild]) > 0) {
            isMinHeap = false;
            break;
          }
        }
        expect(isMinHeap).assertTrue();
        expect(heapArr[0].toShort()).assertEqual(2 as short);
      }

      {
        let data: Short[] = [
          new Short(42 as short), new Short(17 as short), new Short(63 as short),
          new Short(8 as short), new Short(99 as short), new Short(31 as short)
        ];
        data.sort((a, b) => a.compareTo(b));
        expect(data[0].toInt()).assertEqual(8);
        expect(data[1].toInt()).assertEqual(17);
        expect(data[2].toInt()).assertEqual(31);
        expect(data[3].toInt()).assertEqual(42);
        expect(data[4].toInt()).assertEqual(63);
        expect(data[5].toInt()).assertEqual(99);
        expect(data[2].compareTo(data[0])).assertEqual(1);
        expect(data[3].compareTo(data[5])).assertEqual(-1);
      }

      {
        let sorted: Short[] = [
          new Short(3 as short), new Short(8 as short), new Short(15 as short),
          new Short(22 as short)
        ];
        let toInsertMid: Short = new Short(12 as short);
        let insertPos: int = 0;
        while (insertPos < 4 && sorted[insertPos].compareTo(toInsertMid) < 0) {
          insertPos++;
        }
        expect(insertPos).assertEqual(2);
  
        let toInsertFirst: Short = new Short(0 as short);
        let firstPos: int = 0;
        while (firstPos < 4 && sorted[firstPos].compareTo(toInsertFirst) < 0) {
          firstPos++;
        }
        expect(firstPos).assertEqual(0);
  
        let toInsertLast: Short = new Short(99 as short);
        let lastPos: int = 0;
        while (lastPos < 4 && sorted[lastPos].compareTo(toInsertLast) < 0) {
          lastPos++;
        }
        expect(lastPos).assertEqual(4);
      }

      {
        let set: Short[] = [
          new Short(1 as short), new Short(2 as short), new Short(3 as short), new Short(4 as short)
        ];
        for (let i: int = 0; i < 4; i++) {
          expect(set[i].compareTo(set[i])).assertEqual(0);
          for (let j: int = i + 1; j < 4; j++) {
            expect(set[i].compareTo(set[j])).assertEqual(-1);
            expect(set[j].compareTo(set[i])).assertEqual(1);
          }
        }
      }

      {
        let arr: Short[] = [
          new Short(9 as short), new Short(3 as short), new Short(7 as short),
          new Short(1 as short), new Short(5 as short)
        ];
        let pivot: Short = arr[2];
        let leftCount: int = 0;
        let rightCount: int = 0;
        for (let i: int = 0; i < 5; i++) {
          let cmp: int = arr[i].compareTo(pivot);
          if (cmp < 0) leftCount++;
          else if (cmp > 0) rightCount++;
        }
        expect(leftCount).assertEqual(3);
        expect(rightCount).assertEqual(1);
        expect(pivot.toInt()).assertEqual(7);
      }

      {
        let pos: Short = new Short(128 as short);
        let neg: Short = new Short((-128) as short);
        let zero: Short = new Short(0 as short);
        expect(pos.compareTo(zero)).assertEqual(1);
        expect(neg.compareTo(zero)).assertEqual(-1);
        expect(pos.compareTo(neg)).assertEqual(1);
        expect(neg.compareTo(pos)).assertEqual(-1);
      }

      {
        let fromInt: Short = new Short(128 as short);
        let fromHex: Short = new Short(0x80 as short);
        expect(fromInt.compareTo(fromHex)).assertEqual(0);
        expect(fromInt.toShort()).assertEqual(128 as short);
        expect(fromHex.toShort()).assertEqual(128 as short);
      }

      {
        let fromLiteral: Short = new Short(500 as short);
        let fromInt: Short = new Short(Int.toShort(500));
        let fromAnother: Short = new Short(500 as short);
        expect(fromLiteral.compareTo(fromInt)).assertEqual(0);
        expect(fromLiteral.compareTo(fromAnother)).assertEqual(0);
        expect(fromInt.compareTo(fromAnother)).assertEqual(0);
      }

      {
        let entries: [Short, string][] = [
          [new Short(300 as short), 'C'],
          [new Short(100 as short), 'A'],
          [new Short(200 as short), 'B']
        ];
  
        entries.sort((a, b) => a[0].compareTo(b[0]));
  
        expect(entries[0][1]).assertEqual('A');
        expect(entries[1][1]).assertEqual('B');
        expect(entries[2][1]).assertEqual('C');
  
        let threshold: Short = new Short(200 as short);
        let filtered: string[] = [];
        for (let i: int = 0; i < entries.length; i++) {
          let k: Short = entries[i][0];
          let v: string = entries[i][1];
          if (k.compareTo(threshold) >= 0) {
            filtered.push(v);
          }
        }
        expect(filtered.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_COMPARETO_1100
     * @tc.name testShortCompareTo_merged11
     * @tc.desc BusinessScenario: covers 10 merged test points for Short.compareTo, including comparison and ordering, business scenarios, containers and references, and loop accumulation.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortCompareTo_merged11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let a: Short = new Short(100 as short);
        let b: Short = new Short(200 as short);
        let iterationCount: int = 10000;
        for (let i: int = 0; i < iterationCount; i++) {
          let result: int = a.compareTo(b);
          expect(result).assertEqual(-1);
          let result2: int = b.compareTo(a);
          expect(result2).assertEqual(1);
        }
      }

      {
        let sortedArr: Short[] = [];
        let expectedArr: int[] = [];
        let seed: int = 11111;
        for (let i: int = 0; i < 100; i++) {
          seed = (seed * 16807 + 0) % 2147483647;
          let wrappedVal: int = Int.toInt(Int.toShort(seed % 65536 - 32768));
          let newVal: Short = new Short(Int.toShort(wrappedVal));
          let pos: int = 0;
          while (pos < sortedArr.length && sortedArr[pos].compareTo(newVal) < 0) {
            pos++;
          }
          let newSize: int = sortedArr.length + 1;
          let newSorted: Short[] = Array.create<Short>(newSize, new Short(0 as short));
          for (let j: int = 0; j < pos; j++) {
            newSorted[j] = sortedArr[j];
          }
          newSorted[pos] = newVal;
          for (let j: int = pos; j < sortedArr.length; j++) {
            newSorted[j + 1] = sortedArr[j];
          }
          sortedArr = newSorted;
          let ePos: int = 0;
          while (ePos < expectedArr.length && expectedArr[ePos] < wrappedVal) {
            ePos++;
          }
          let eSize: int = expectedArr.length + 1;
          let newExpected: int[] = Array.create<int>(eSize, 0);
          for (let j: int = 0; j < ePos; j++) {
            newExpected[j] = expectedArr[j];
          }
          newExpected[ePos] = wrappedVal;
          for (let j: int = ePos; j < expectedArr.length; j++) {
            newExpected[j + 1] = expectedArr[j];
          }
          expectedArr = newExpected;
        }
        for (let i: int = 0; i < sortedArr.length; i++) {
          expect(sortedArr[i].toInt()).assertEqual(expectedArr[i]);
        }
        for (let i: int = 0; i < sortedArr.length - 1; i++) {
          expect(sortedArr[i].compareTo(sortedArr[i + 1]) <= 0).assertTrue();
        }
      }

      {
        let values: Short[] = [
          new Short(50 as short), new Short(100 as short), new Short(25 as short),
          new Short(75 as short), new Short(10 as short), new Short(200 as short)
        ];
        let heap: Short[] = Array.create<Short>(6, new Short(0 as short));
        let heapSize: int = 0;
        for (let i: int = 0; i < 6; i++) {
          heap[heapSize] = values[i];
          let idx: int = heapSize;
          heapSize++;
          while (idx > 0) {
            let parent: int = Double.toInt(Math.floor((idx - 1) / 2));
            if (heap[parent].compareTo(heap[idx]) < 0) {
              let tmp: Short = heap[parent];
              heap[parent] = heap[idx];
              heap[idx] = tmp;
              idx = parent;
            } else {
              break;
            }
          }
        }
        expect(heap[0].compareTo(heap[1]) >= 0).assertTrue();
        expect(heap[0].compareTo(heap[2]) >= 0).assertTrue();
        expect(heap[0].toShort()).assertEqual(200 as short);
      }

      {
        let scores: Short[] = [
          new Short(8500 as short), new Short(12000 as short), new Short(9500 as short),
          new Short(15000 as short), new Short(4000 as short), new Short(12000 as short)
        ];
        scores.sort((a, b) => b.compareTo(a));
        expect(scores[0].toShort()).assertEqual(15000 as short);
        expect(scores[1].toShort()).assertEqual(12000 as short);
        expect(scores[2].toShort()).assertEqual(12000 as short);
        expect(scores[3].toShort()).assertEqual(9500 as short);
        expect(scores[4].toShort()).assertEqual(8500 as short);
        expect(scores[5].toShort()).assertEqual(4000 as short);
      }

      {
        let a: Short = new Short(100 as short);
        let b: Short = new Short(300 as short);
        let c: Short = new Short(200 as short);
        let median: Short = a;
        if ((a.compareTo(b) <= 0 && b.compareTo(c) <= 0) || (c.compareTo(b) <= 0 && b.compareTo(a) <= 0)) {
          median = b;
        } else if ((a.compareTo(c) <= 0 && c.compareTo(b) <= 0) || (b.compareTo(c) <= 0 && c.compareTo(a) <= 0)) {
          median = c;
        }
        expect(median.toShort()).assertEqual(200 as short);
        let x: Short = new Short((-50) as short);
        let y: Short = new Short(50 as short);
        let z: Short = new Short(0 as short);
        let median2: Short = x;
        if ((x.compareTo(y) <= 0 && y.compareTo(z) <= 0) || (z.compareTo(y) <= 0 && y.compareTo(x) <= 0)) {
          median2 = y;
        } else if ((x.compareTo(z) <= 0 && z.compareTo(y) <= 0) || (y.compareTo(z) <= 0 && z.compareTo(x) <= 0)) {
          median2 = z;
        }
        expect(median2.toShort()).assertEqual(0 as short);
      }

      {
        let lowThreshold: Short = new Short(100 as short);
        let highThreshold: Short = new Short(1000 as short);
        let values: Short[] = [
          new Short(50 as short), new Short(500 as short), new Short(2000 as short),
          new Short(100 as short), new Short(1000 as short)
        ];
        let classifications: string[] = Array.create<string>(5, '');
        for (let i: int = 0; i < 5; i++) {
          let v: Short = values[i];
          if (v.compareTo(lowThreshold) < 0) {
            classifications[i] = 'LOW';
          } else if (v.compareTo(highThreshold) > 0) {
            classifications[i] = 'HIGH';
          } else {
            classifications[i] = 'MEDIUM';
          }
        }
        expect(classifications[0]).assertEqual('LOW');
        expect(classifications[1]).assertEqual('MEDIUM');
        expect(classifications[2]).assertEqual('HIGH');
        expect(classifications[3]).assertEqual('MEDIUM');
        expect(classifications[4]).assertEqual('MEDIUM');
      }

      {
        let data: Short[] = [
          new Short(500 as short), new Short(200 as short), new Short(500 as short),
          new Short(800 as short), new Short(200 as short), new Short(100 as short)
        ];
        data.sort((a, b) => a.compareTo(b));
        let duplicates: Short[] = Array.create<Short>(6, new Short(0 as short));
        let dupCount: int = 0;
        for (let i: int = 0; i < data.length - 1; i++) {
          if (data[i].compareTo(data[i + 1]) == 0) {
            duplicates[dupCount] = data[i];
            dupCount++;
          }
        }
        expect(dupCount).assertEqual(2);
        expect(duplicates[0].toShort()).assertEqual(200 as short);
        expect(duplicates[1].toShort()).assertEqual(500 as short);
      }

      {
        let arr1: Short[] = [
          new Short(10 as short), new Short(30 as short), new Short(50 as short)
        ];
        let arr2: Short[] = [
          new Short(20 as short), new Short(40 as short), new Short(60 as short)
        ];
        let merged: Short[] = Array.create<Short>(6, new Short(0 as short));
        let i: int = 0;
        let j: int = 0;
        let k: int = 0;
        while (i < 3 && j < 3) {
          if (arr1[i].compareTo(arr2[j]) <= 0) {
            merged[k] = arr1[i];
            i++;
          } else {
            merged[k] = arr2[j];
            j++;
          }
          k++;
        }
        while (i < 3) {
          merged[k] = arr1[i];
          i++;
          k++;
        }
        while (j < 3) {
          merged[k] = arr2[j];
          j++;
          k++;
        }
        expect(merged.length).assertEqual(6);
        expect(merged[0].toShort()).assertEqual(10 as short);
        expect(merged[1].toShort()).assertEqual(20 as short);
        expect(merged[2].toShort()).assertEqual(30 as short);
        expect(merged[3].toShort()).assertEqual(40 as short);
        expect(merged[4].toShort()).assertEqual(50 as short);
        expect(merged[5].toShort()).assertEqual(60 as short);
      }

      {
        let players: Short[] = [
          new Short(80 as short), new Short(95 as short), new Short(70 as short), new Short(88 as short)
        ];
        let winner1: Short = players[0].compareTo(players[1]) > 0 ? players[0] : players[1];
        let winner2: Short = players[2].compareTo(players[3]) > 0 ? players[2] : players[3];
        let champion: Short = winner1.compareTo(winner2) > 0 ? winner1 : winner2;
        expect(winner1.toShort()).assertEqual(95 as short);
        expect(winner2.toShort()).assertEqual(88 as short);
        expect(champion.toShort()).assertEqual(95 as short);
      }

      {
        let countInversions = (arr: Short[]): int => {
          let inversions: int = 0;
          for (let i: int = 0; i < arr.length; i++) {
            for (let j: int = i + 1; j < arr.length; j++) {
              if (arr[i].compareTo(arr[j]) > 0) {
                inversions++;
              }
            }
          }
          return inversions;
        };
  
        let mixed: Short[] = [
          new Short(3 as short), new Short(1 as short), new Short(2 as short),
          new Short(5 as short), new Short(4 as short)
        ];
        expect(countInversions(mixed)).assertEqual(3);
  
        let sorted: Short[] = [
          new Short((-5) as short), new Short((-2) as short), new Short(0 as short),
          new Short(3 as short), new Short(7 as short)
        ];
        expect(countInversions(sorted)).assertEqual(0);
  
        let reverse: Short[] = [
          new Short(4 as short), new Short(3 as short), new Short(2 as short),
          new Short(1 as short)
        ];
        expect(countInversions(reverse)).assertEqual(6);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_COMPARETO_1200
     * @tc.name testShortCompareTo_merged12
     * @tc.desc Other: covers 2 merged test points for Short.compareTo, including business scenarios and comparison and ordering.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortCompareTo_merged12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let readings: Short[] = [
          new Short(25 as short), new Short(35 as short), new Short(45 as short), new Short(55 as short)
        ];
  
        let normal: Short = new Short(30 as short);
        let warning: Short = new Short(40 as short);
        let critical: Short = new Short(50 as short);
  
        expect(readings[0].compareTo(normal)).assertEqual(-1);
        expect(readings[1].compareTo(warning)).assertEqual(-1);
        expect(readings[2].compareTo(critical)).assertEqual(-1);
        expect(readings[3].compareTo(critical)).assertEqual(1);
  
        let levels: string[] = [];
        for (let t of readings) {
          if (t.compareTo(normal) < 0) levels.push('normal');
          else if (t.compareTo(warning) < 0) levels.push('warning');
          else if (t.compareTo(critical) < 0) levels.push('critical');
          else levels.push('emergency');
        }
  
        expect(levels[0]).assertEqual('normal');
        expect(levels[1]).assertEqual('warning');
        expect(levels[2]).assertEqual('critical');
        expect(levels[3]).assertEqual('emergency');
      }

      {
        let v1_2_3: Short = new Short(123 as short);
        let v1_2_5: Short = new Short(125 as short);
        let v2_0_0: Short = new Short(200 as short);
  
        expect(v1_2_3.compareTo(v1_2_5)).assertEqual(-1);
        expect(v1_2_3.isLessThan(v1_2_5)).assertTrue();
  
        expect(v1_2_5.compareTo(v2_0_0)).assertEqual(-1);
        expect(v2_0_0.isGreaterThan(v1_2_5)).assertTrue();
  
        expect(v1_2_3.compareTo(v1_2_3)).assertEqual(0);
        expect(v1_2_3.equals(v1_2_3)).assertTrue();
      }
    });

  });
}