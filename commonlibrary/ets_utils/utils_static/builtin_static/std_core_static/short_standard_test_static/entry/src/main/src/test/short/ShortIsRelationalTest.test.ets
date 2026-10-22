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

export default function shortIsRelationalTest(): void {
  describe('ShortIsRelationalTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_IS_RELATIONAL_0100
     * @tc.name testShortIsRelational_merged1
     * @tc.desc BasicValue / BoundaryOverflow: covers 10 merged test points for Short.isRelational, including negative values, positive values, zero values, comparison and ordering, and sign handling.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortIsRelational_merged1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let current: Short = new Short((-50) as short);
        let argument: Short = new Short((-10) as short);
        expect(current.isLessThan(argument)).assertTrue();
        expect(current.isLessEqualThan(argument)).assertTrue();
        expect(current.isGreaterThan(argument)).assertFalse();
        expect(current.isGreaterEqualThan(argument)).assertFalse();
      }

      {
        let current: Short = new Short(0 as short);
        let argument: Short = new Short(5 as short);
        expect(current.isLessThan(argument)).assertTrue();
        expect(current.isLessEqualThan(argument)).assertTrue();
        expect(current.isGreaterThan(argument)).assertFalse();
        expect(current.isGreaterEqualThan(argument)).assertFalse();
      }

      {
        let current: Short = new Short(0 as short);
        let argument: Short = new Short((-3) as short);
        expect(current.isLessThan(argument)).assertFalse();
        expect(current.isLessEqualThan(argument)).assertFalse();
        expect(current.isGreaterThan(argument)).assertTrue();
        expect(current.isGreaterEqualThan(argument)).assertTrue();
      }

      {
        let current: Short = new Short(12 as short);
        let zero: Short = new Short(0 as short);
        expect(current.isLessThan(zero)).assertFalse();
        expect(current.isLessEqualThan(zero)).assertFalse();
        expect(current.isGreaterThan(zero)).assertTrue();
        expect(current.isGreaterEqualThan(zero)).assertTrue();
      }

      {
        let smallVal: Short = new Short(1 as short);
        let largeVal: Short = new Short(10000 as short);
        expect(smallVal.isLessThan(largeVal)).assertTrue();
        expect(smallVal.isLessEqualThan(largeVal)).assertTrue();
        expect(largeVal.isGreaterThan(smallVal)).assertTrue();
        expect(largeVal.isGreaterEqualThan(smallVal)).assertTrue();
      }

      {
        let negA: Short = new Short((-3) as short);
        let negB: Short = new Short((-4) as short);
        let positiveProduct: Short = negA.mul(negB);
        expect(positiveProduct.isGreaterThan(negA)).assertTrue();
        expect(positiveProduct.isGreaterThan(negB)).assertTrue();
        expect(positiveProduct.isGreaterThan(new Short(0 as short))).assertTrue();
        let mixedA: Short = new Short((-3) as short);
        let mixedB: Short = new Short(5 as short);
        let negativeProduct: Short = mixedA.mul(mixedB);
        expect(negativeProduct.isLessThan(mixedA)).assertTrue();
        expect(negativeProduct.isLessThan(mixedB)).assertTrue();
        expect(negativeProduct.isLessThan(new Short(0 as short))).assertTrue();
      }

      {
        let a: Short = new Short((-40) as short);
        let b: Short = new Short((-30) as short);
        let c: Short = new Short((-20) as short);
        let d: Short = new Short((-10) as short);
        expect(a.isLessThan(b)).assertTrue();
        expect(a.isLessThan(c)).assertTrue();
        expect(a.isLessThan(d)).assertTrue();
        expect(b.isLessThan(c)).assertTrue();
        expect(b.isLessThan(d)).assertTrue();
        expect(c.isLessThan(d)).assertTrue();
      }

      {
        let negZero: Short = new Short((-0) as short);
        let zero: Short = new Short(0 as short);
        expect(negZero.isLessThan(zero)).assertFalse();
        expect(negZero.isLessEqualThan(zero)).assertTrue();
        expect(negZero.isGreaterThan(zero)).assertFalse();
        expect(negZero.isGreaterEqualThan(zero)).assertTrue();
      }

      {
        let negativeCurrent: Short = new Short((-1) as short);
        let positiveArgument: Short = new Short(1 as short);
        let lessThanResult: boolean = negativeCurrent.isLessThan(positiveArgument);
        let lessEqualResult: boolean = negativeCurrent.isLessEqualThan(positiveArgument);
        let greaterThanResult: boolean = negativeCurrent.isGreaterThan(positiveArgument);
        let greaterEqualResult: boolean = negativeCurrent.isGreaterEqualThan(positiveArgument);
        expect(lessThanResult).assertTrue();
        expect(lessEqualResult).assertTrue();
        expect(greaterThanResult).assertFalse();
        expect(greaterEqualResult).assertFalse();
      }

      {
        let current: Short = new Short(Short.MIN_VALUE);
        let equalArgument: Short = new Short(Short.MIN_VALUE);
        let lessThanResult: boolean = current.isLessThan(equalArgument);
        let lessEqualResult: boolean = current.isLessEqualThan(equalArgument);
        let greaterThanResult: boolean = current.isGreaterThan(equalArgument);
        let greaterEqualResult: boolean = current.isGreaterEqualThan(equalArgument);
        expect(lessThanResult).assertFalse();
        expect(lessEqualResult).assertTrue();
        expect(greaterThanResult).assertFalse();
        expect(greaterEqualResult).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_IS_RELATIONAL_0200
     * @tc.name testShortIsRelational_merged2
     * @tc.desc BoundaryOverflow: covers 10 merged test points for Short.isRelational, including boundary values, equality consistency, negative values, zero values, and containers and references.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortIsRelational_merged2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let maxBoundaryValue: Short = new Short(Short.MAX_VALUE);
        let adjacentBoundaryValue: Short = new Short(32766 as short);
        let lessThanResult: boolean = maxBoundaryValue.isLessThan(adjacentBoundaryValue);
        let lessEqualResult: boolean = maxBoundaryValue.isLessEqualThan(adjacentBoundaryValue);
        let greaterThanResult: boolean = maxBoundaryValue.isGreaterThan(adjacentBoundaryValue);
        let greaterEqualResult: boolean = maxBoundaryValue.isGreaterEqualThan(adjacentBoundaryValue);
        expect(lessThanResult).assertFalse();
        expect(lessEqualResult).assertFalse();
        expect(greaterThanResult).assertTrue();
        expect(greaterEqualResult).assertTrue();
      }

      {
        let minBoundaryValue: Short = new Short(Short.MIN_VALUE);
        let adjacentBoundaryValue: Short = new Short((-32767) as short);
        let lessThanResult: boolean = minBoundaryValue.isLessThan(adjacentBoundaryValue);
        let lessEqualResult: boolean = minBoundaryValue.isLessEqualThan(adjacentBoundaryValue);
        let greaterThanResult: boolean = minBoundaryValue.isGreaterThan(adjacentBoundaryValue);
        let greaterEqualResult: boolean = minBoundaryValue.isGreaterEqualThan(adjacentBoundaryValue);
        expect(lessThanResult).assertTrue();
        expect(lessEqualResult).assertTrue();
        expect(greaterThanResult).assertFalse();
        expect(greaterEqualResult).assertFalse();
      }

      {
        let increasing: Short[] = [
          new Short((-5) as short), new Short(0 as short), new Short(7 as short),
          new Short(20 as short)
        ];
        let decreasing: Short[] = [
          new Short(30 as short), new Short(15 as short), new Short(2 as short),
          new Short((-10) as short)
        ];
        let mixed: Short[] = [
          new Short(3 as short), new Short(9 as short), new Short(4 as short)
        ];
        let isIncreasing: boolean = true;
        for (let i: int = 0; i < 3; i++) {
          if (!increasing[i].isLessEqualThan(increasing[i + 1])) {
            isIncreasing = false;
            break;
          }
        }
        let isDecreasing: boolean = true;
        for (let i: int = 0; i < 3; i++) {
          if (!decreasing[i].isGreaterEqualThan(decreasing[i + 1])) {
            isDecreasing = false;
            break;
          }
        }
        let mixedIncreasing: boolean = true;
        let mixedDecreasing: boolean = true;
        for (let i: int = 0; i < 2; i++) {
          if (!mixed[i].isLessEqualThan(mixed[i + 1])) {
            mixedIncreasing = false;
          }
          if (!mixed[i].isGreaterEqualThan(mixed[i + 1])) {
            mixedDecreasing = false;
          }
        }
        expect(isIncreasing).assertTrue();
        expect(isDecreasing).assertTrue();
        expect(mixedIncreasing).assertFalse();
        expect(mixedDecreasing).assertFalse();
      }

      {
        let a: Short = new Short(3 as short);
        let b: Short = new Short(7 as short);
        expect(a.isLessThan(b)).assertEqual(!a.isGreaterEqualThan(b));
        let c: Short = new Short(7 as short);
        let d: Short = new Short(3 as short);
        expect(c.isLessThan(d)).assertEqual(!c.isGreaterEqualThan(d));
        let e: Short = new Short(5 as short);
        let f: Short = new Short(5 as short);
        expect(e.isLessThan(f)).assertEqual(!e.isGreaterEqualThan(f));
        let minVal: Short = new Short(Short.MIN_VALUE);
        let maxVal: Short = new Short(Short.MAX_VALUE);
        expect(minVal.isLessThan(maxVal)).assertEqual(!minVal.isGreaterEqualThan(maxVal));
      }

      {
        let current: Short = new Short(Int.toShort(Short.toInt(Short.MIN_VALUE) + 1));
        let argument: Short = new Short(Short.MIN_VALUE);
        expect(current.isLessThan(argument)).assertFalse();
        expect(current.isLessEqualThan(argument)).assertFalse();
        expect(current.isGreaterThan(argument)).assertTrue();
        expect(current.isGreaterEqualThan(argument)).assertTrue();
      }

      {
        let a: Short = new Short(5 as short);
        let b: Short = new Short(3 as short);
        expect(a.isGreaterEqualThan(b)).assertEqual(a.isGreaterThan(b) || a.equals(b));
        let c: Short = new Short(5 as short);
        let d: Short = new Short(5 as short);
        expect(c.isGreaterEqualThan(d)).assertEqual(c.isGreaterThan(d) || c.equals(d));
        let e: Short = new Short(2 as short);
        let f: Short = new Short(9 as short);
        expect(e.isGreaterEqualThan(f)).assertEqual(e.isGreaterThan(f) || e.equals(f));
        let minVal: Short = new Short(Short.MIN_VALUE);
        let maxVal: Short = new Short(Short.MAX_VALUE);
        expect(minVal.isGreaterEqualThan(maxVal)).assertEqual(minVal.isGreaterThan(maxVal) || minVal.equals(maxVal));
      }

      {
        let negOne: Short = new Short((-1) as short);
        let zero: Short = new Short(0 as short);
        expect(negOne.isLessThan(zero)).assertTrue();
        expect(negOne.isLessEqualThan(zero)).assertTrue();
        expect(zero.isGreaterThan(negOne)).assertTrue();
        expect(zero.isGreaterEqualThan(negOne)).assertTrue();
      }

      {
        let minVal: Short = new Short(Short.MIN_VALUE);
        let maxVal: Short = new Short(Short.MAX_VALUE);
        expect(minVal.isLessThan(maxVal)).assertTrue();
        expect(minVal.isLessEqualThan(maxVal)).assertTrue();
        expect(minVal.isGreaterThan(maxVal)).assertFalse();
        expect(minVal.isGreaterEqualThan(maxVal)).assertFalse();
        expect(maxVal.isLessThan(minVal)).assertFalse();
        expect(maxVal.isGreaterThan(minVal)).assertTrue();
      }

      {
        let negOne: Short = new Short((-1) as short);
        let zero: Short = new Short(0 as short);
        let one: Short = new Short(1 as short);
        expect(negOne.isLessThan(zero)).assertTrue();
        expect(zero.isLessThan(one)).assertTrue();
        expect(negOne.isLessThan(one)).assertTrue();
      }

      {
        let singleAmount: Short = new Short(8000 as short);
        let cumulativeAmount: Short = new Short(25000 as short);
        let warningSingle: Short = new Short(10000 as short);
        let warningMid: Short = new Short(5000 as short);
        let warningCumulative: Short = new Short(20000 as short);
  
        let triggerLarge: boolean = singleAmount.isGreaterThan(warningSingle);
        let triggerMidCumulative: boolean = singleAmount.isGreaterThan(warningMid) &&
                                   cumulativeAmount.isGreaterEqualThan(warningCumulative);
        let alert: boolean = triggerLarge || triggerMidCumulative;
  
        expect(triggerLarge).assertFalse();
        expect(triggerMidCumulative).assertTrue();
        expect(alert).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_IS_RELATIONAL_0300
     * @tc.name testShortIsRelational_merged3
     * @tc.desc BoundaryOverflow: covers 10 merged test points for Short.isRelational, including boundary values, equality consistency, overflow, wrapping, and zero values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortIsRelational_merged3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let minShort: Short = new Short(Short.MIN_VALUE);
        let overflowedShort: Short = new Short(Int.toShort(Short.toInt(Short.MIN_VALUE) - 1));
        expect(minShort.isLessThan(overflowedShort)).assertTrue();
        expect(minShort.isLessEqualThan(overflowedShort)).assertTrue();
        expect(minShort.isGreaterThan(overflowedShort)).assertFalse();
        expect(minShort.isGreaterEqualThan(overflowedShort)).assertFalse();
      }

      {
        let maxShort: Short = new Short(Short.MAX_VALUE);
        let overflowedShort: Short = new Short(Int.toShort(Short.toInt(Short.MAX_VALUE) + 1));
        expect(maxShort.isGreaterThan(overflowedShort)).assertTrue();
        expect(maxShort.isGreaterEqualThan(overflowedShort)).assertTrue();
        expect(maxShort.isLessThan(overflowedShort)).assertFalse();
        expect(maxShort.isLessEqualThan(overflowedShort)).assertFalse();
      }

      {
        let nearMin: Short = new Short(Int.toShort(Short.toInt(Short.MIN_VALUE) + 1));
        let zero: Short = new Short(0 as short);
        expect(nearMin.isLessThan(zero)).assertTrue();
        expect(nearMin.isLessEqualThan(zero)).assertTrue();
        expect(nearMin.isGreaterThan(zero)).assertFalse();
        expect(nearMin.isGreaterEqualThan(zero)).assertFalse();
      }

      {
        let zero: Short = new Short(0 as short);
        let minVal: Short = new Short(Short.MIN_VALUE);
        expect(zero.isGreaterThan(minVal)).assertTrue();
        expect(zero.isGreaterEqualThan(minVal)).assertTrue();
        expect(zero.isLessThan(minVal)).assertFalse();
        expect(zero.isLessEqualThan(minVal)).assertFalse();
      }

      {
        let dividend: Short = new Short(10 as short);
        let divisor: Short = new Short(3 as short);
        let quotient: Short = dividend.div(divisor);
        expect(quotient.isLessThan(dividend)).assertTrue();
        expect(quotient.isGreaterThan(new Short(0 as short))).assertTrue();
        expect(quotient.isGreaterEqualThan(new Short(3 as short))).assertTrue();
      }

      {
        let reorderLevel: Short = new Short(20 as short);
        let maxCapacity: Short = new Short(200 as short);
        let stockA: Short = new Short(15 as short);
        let stockB: Short = new Short(180 as short);
        expect(stockA.isLessEqualThan(reorderLevel)).assertTrue();
        expect(stockA.isGreaterEqualThan(new Short(0 as short))).assertTrue();
        expect(stockB.isLessEqualThan(maxCapacity)).assertTrue();
        expect(stockB.isGreaterThan(reorderLevel)).assertTrue();
      }

      {
        let boundaries: Short[] = [
          new Short(Short.MIN_VALUE),
          new Short((-1) as short),
          new Short(0 as short),
          new Short(Short.MAX_VALUE)
        ];
        for (let i: int = 0; i < 4; i++) {
          let a: Short = boundaries[i];
          expect(a.isLessThan(a)).assertFalse();
        }
      }

      {
        let boundaries: Short[] = [
          new Short(Short.MIN_VALUE),
          new Short((-1) as short),
          new Short(0 as short),
          new Short(Short.MAX_VALUE)
        ];
        for (let i: int = 0; i < 4; i++) {
          let a: Short = boundaries[i];
          expect(a.isLessEqualThan(a)).assertTrue();
        }
      }

      {
        let boundaries: Short[] = [
          new Short(Short.MIN_VALUE),
          new Short((-1) as short),
          new Short(0 as short),
          new Short(Short.MAX_VALUE)
        ];
        for (let i: int = 0; i < 4; i++) {
          let a: Short = boundaries[i];
          expect(a.isGreaterThan(a)).assertFalse();
        }
      }

      {
        let boundaries: Short[] = [
          new Short(Short.MIN_VALUE),
          new Short((-1) as short),
          new Short(0 as short),
          new Short(Short.MAX_VALUE)
        ];
        for (let i: int = 0; i < 4; i++) {
          let a: Short = boundaries[i];
          expect(a.isGreaterEqualThan(a)).assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_IS_RELATIONAL_0400
     * @tc.name testShortIsRelational_merged4
     * @tc.desc BoundaryOverflow / ErrorException: covers 10 merged test points for Short.isRelational, including boundary values, equality consistency, type conversion, overflow, and wrapping.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortIsRelational_merged4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let values: short[] = [(-32768) as short, (-32767) as short, (-100) as short, 0 as short, 1 as short, 32766 as short, 32767 as short];
        let valueCount: int = 7;
        let minVal: Short = new Short(Short.MIN_VALUE);
        let maxVal: Short = new Short(Short.MAX_VALUE);
        for (let i: int = 0; i < valueCount; i++) {
          let a: Short = new Short(values[i]);
          expect(a.isGreaterEqualThan(minVal)).assertTrue();
          expect(a.isLessEqualThan(maxVal)).assertTrue();
        }
      }

      {
        let overflowed: Short = new Short(Int.toShort(Short.toInt(Short.MAX_VALUE) + 1));
        let minVal: Short = new Short(Short.MIN_VALUE);
        expect(overflowed.isLessEqualThan(minVal)).assertTrue();
        expect(overflowed.isGreaterEqualThan(minVal)).assertTrue();
        expect(overflowed.isLessThan(minVal)).assertFalse();
        expect(overflowed.isGreaterThan(minVal)).assertFalse();
  
        let underflowed: Short = new Short(Int.toShort(Short.toInt(Short.MIN_VALUE) - 1));
        let maxVal: Short = new Short(Short.MAX_VALUE);
        expect(underflowed.isLessEqualThan(maxVal)).assertTrue();
        expect(underflowed.isGreaterEqualThan(maxVal)).assertTrue();
  
        expect(overflowed.isLessThan(underflowed)).assertTrue();
        expect(underflowed.isGreaterThan(overflowed)).assertTrue();
      }

      {
        let wrappedToMin: Short = new Short(Int.toShort(32768));
        let zero: Short = new Short(0 as short);
        expect(wrappedToMin.isLessThan(zero)).assertTrue();
        expect(wrappedToMin.isLessEqualThan(zero)).assertTrue();
        expect(wrappedToMin.isGreaterThan(zero)).assertFalse();
      }

      {
        let a: Short = new Short(Short.MAX_VALUE);
        let b: Short = new Short(1 as short);
        let overflowSum: Short = a.add(b);
        let directWrapped: Short = new Short(Int.toShort(Short.toInt(Short.MAX_VALUE) + 1));
        expect(overflowSum.isLessEqualThan(directWrapped)).assertTrue();
        expect(overflowSum.isGreaterEqualThan(directWrapped)).assertTrue();
        expect(overflowSum.isLessThan(directWrapped)).assertFalse();
        expect(overflowSum.isGreaterThan(directWrapped)).assertFalse();
      }

      {
        let fromHex: Short = new Short(Short.parseInt("7FFF", 16));
        let directMax: Short = new Short(Short.MAX_VALUE);
        expect(fromHex.isLessEqualThan(directMax)).assertTrue();
        expect(fromHex.isGreaterEqualThan(directMax)).assertTrue();
      }

      {
        let byteTen: Short = new Short(10 as short);
        let byteFifty: Short = new Short(50 as short);
        expect(byteTen.isLessThan(byteFifty)).assertEqual(byteTen.toByte() < byteFifty.toByte());
        expect(byteFifty.isGreaterThan(byteTen)).assertEqual(byteFifty.toByte() > byteTen.toByte());
        let byteLow: Short = new Short((-128) as short);
        let byteHigh: Short = new Short(127 as short);
        expect(byteLow.isLessThan(byteHigh)).assertEqual(byteLow.toByte() < byteHigh.toByte());
        let wrapPositive: Short = new Short(200 as short);
        let zero: Short = new Short(0 as short);
        expect(wrapPositive.isLessThan(zero)).assertFalse();
        expect(wrapPositive.toByte() < zero.toByte()).assertTrue();
        let wrapNegative: Short = new Short((-200) as short);
        expect(wrapNegative.isLessThan(zero)).assertTrue();
        expect(wrapNegative.toByte() < zero.toByte()).assertFalse();
      }

      {
        let a: Short = new Short(20000 as short);
        let b: Short = new Short(20000 as short);
        let sum: Short = a.add(b);
        expect(sum.isLessThan(a)).assertTrue();
        expect(sum.isLessThan(b)).assertTrue();
        expect(sum.isLessThan(new Short(0 as short))).assertTrue();
      }

      {
        let a: Short = new Short(5 as short);
        let b: Short = new Short(10 as short);
        let c: Short = new Short(10 as short);
        expect(a.isLessThan(b) && b.isGreaterEqualThan(c)).assertTrue();
  
        let d: Short = new Short(7 as short);
        expect(d.isLessThan(b) && d.isGreaterThan(a)).assertTrue();
  
        let negA: Short = new Short((-20) as short);
        let negB: Short = new Short((-10) as short);
        let negC: Short = new Short((-10) as short);
        expect(negA.isLessThan(negB) && negB.isGreaterEqualThan(negC)).assertTrue();
  
        let zero: Short = new Short(0 as short);
        expect(negA.isLessThan(zero) && zero.isGreaterEqualThan(new Short(0 as short))).assertTrue();
  
        let maxVal: Short = new Short(Short.MAX_VALUE);
        let minVal: Short = new Short(Short.MIN_VALUE);
        expect(minVal.isLessThan(zero) && maxVal.isGreaterEqualThan(zero)).assertTrue();
      }

      {
        let current: Short = new Short(10 as short);
        try {
          current.isLessThan(null as Short);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
        }
        try {
          current.isLessEqualThan(null as Short);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
        }
        try {
          current.isGreaterThan(null as Short);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
        }
        try {
          current.isGreaterEqualThan(null as Short);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
        }
      }

      {
        let current: Short = new Short(10 as short);
        try {
          current.isLessThan(undefined as Short);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
        }
        try {
          current.isLessEqualThan(undefined as Short);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
        }
        try {
          current.isGreaterThan(undefined as Short);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
        }
        try {
          current.isGreaterEqualThan(undefined as Short);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_IS_RELATIONAL_0500
     * @tc.name testShortIsRelational_merged5
     * @tc.desc CrossTypeRoundTrip / RadixConversion / Idempotent: covers 10 merged test points for Short.isRelational, including business scenarios, equality consistency, type conversion, radix conversion, and fractions and rounding.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortIsRelational_merged5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let readings: Short[] = [];
        for (let i: int = 0; i < 20; i++) {
          readings.push(new Short(Int.toShort(i * 1000 - 5000)));
        }
  
        let intThreshold: int = 0;
        let stage1: Short[] = [];
        for (let r of readings) {
          if (r.isGreaterEqualThan(new Short(Int.toShort(intThreshold)))) {
            stage1.push(r);
          }
        }
  
        let floatThreshold: float = 10000.0f;
        let stage2: Short[] = [];
        for (let r of stage1) {
          if (r.toFloat() <= floatThreshold) {
            stage2.push(r);
          }
        }
  
        expect(stage2.length).assertEqual(11);
        for (let v of stage2) {
          expect(v.isGreaterEqualThan(new Short(0 as short))).assertTrue();
          expect(v.isLessEqualThan(new Short(10000 as short))).assertTrue();
        }
      }

      {
        let ranges: int[][] = [
          [0, 30000], [5000, 25000], [10000, 20000]
        ];
  
        let rangeStack: Short[][] = [];
        for (let range of ranges) {
          let lo: int = range[0];
          let hi: int = range[1];
          let sLo: Short = new Short(Int.toShort(lo));
          let sHi: Short = new Short(Int.toShort(hi));
  
          expect(rangeStack.length == 0 ||
            sLo.isGreaterEqualThan(rangeStack[rangeStack.length - 1][0])).assertTrue();
          expect(rangeStack.length == 0 ||
            sHi.isLessEqualThan(rangeStack[rangeStack.length - 1][1])).assertTrue();
          rangeStack.push([sLo, sHi]);
        }
  
        let innermost: Short[] = rangeStack[2];
        let width: long = innermost[1].toLong().sub(innermost[0].toLong());
        expect(width.toInt()).assertEqual(10000);
  
        let ratio: float = innermost[1].toFloat() / rangeStack[0][1].toFloat();
        expect(ratio > 0.66 && ratio < 0.67).assertTrue();
      }

      {
        let byteMin: Short = new Short((-128) as short);
        let byteMax: Short = new Short(127 as short);
        let zero: Short = new Short(0 as short);
        expect(byteMin.isLessThan(zero)).assertTrue();
        expect(byteMax.isGreaterThan(zero)).assertTrue();
        expect(byteMin.isLessThan(byteMax)).assertTrue();
        expect(byteMax.isGreaterThan(byteMin)).assertTrue();
      }

      {
        let hexVal: Short = new Short(0xFF as short);
        let decVal: Short = new Short(255 as short);
        let hexSmall: Short = new Short(0xA as short);
        let hexMid: Short = new Short(0x80 as short);
        expect(hexVal.isLessEqualThan(decVal)).assertTrue();
        expect(hexVal.isGreaterEqualThan(decVal)).assertTrue();
        expect(hexSmall.isLessThan(hexVal)).assertTrue();
        expect(hexVal.isGreaterThan(hexSmall)).assertTrue();
        expect(hexMid.isLessThan(hexVal)).assertTrue();
        expect(hexMid.isGreaterThan(hexSmall)).assertTrue();
      }

      {
        let rootVal: Short = new Short(50 as short);
        let searchTarget: Short = new Short(30 as short);
        expect(searchTarget.isLessThan(rootVal)).assertTrue();
        let searchTarget2: Short = new Short(70 as short);
        expect(searchTarget2.isGreaterThan(rootVal)).assertTrue();
        let searchTarget3: Short = new Short(50 as short);
        expect(searchTarget3.isLessThan(rootVal)).assertFalse();
        expect(searchTarget3.isGreaterThan(rootVal)).assertFalse();
      }

      {
        let current: Short = new Short(88 as short);
        let argument: Short = new Short(66 as short);
        let beforeShortValue: short = current.toShort();
        let lessThanResult: boolean = current.isLessThan(argument);
        let lessEqualResult: boolean = current.isLessEqualThan(argument);
        let greaterThanResult: boolean = current.isGreaterThan(argument);
        let greaterEqualResult: boolean = current.isGreaterEqualThan(argument);
        let afterShortValue: short = current.toShort();
        expect(lessThanResult).assertFalse();
        expect(lessEqualResult).assertFalse();
        expect(greaterThanResult).assertTrue();
        expect(greaterEqualResult).assertTrue();
        expect(afterShortValue).assertEqual(beforeShortValue);
        expect(afterShortValue).assertEqual(88 as short);
      }

      {
        let a: Short = new Short(100 as short);
        let b: Short = new Short(200 as short);
        let c: Short = new Short(300 as short);
        let aLessB: boolean = a.isLessThan(b);
        let bLessC: boolean = b.isLessThan(c);
        let aLessC: boolean = a.isLessThan(c);
        expect(aLessB).assertTrue();
        expect(bLessC).assertTrue();
        expect(aLessC).assertTrue();
      }

      {
        let a: Short = new Short(10 as short);
        let b: Short = new Short(20 as short);
        expect(a.isLessThan(b)).assertTrue();
        expect(b.isGreaterThan(a)).assertTrue();
      }

      {
        let a: Short = new Short(1 as short);
        let b: Short = new Short(5 as short);
        expect(a.isLessThan(b)).assertTrue();
        expect(b.isLessThan(a)).assertFalse();
      }

      {
        let a: Short = new Short(8 as short);
        let b: Short = new Short(12 as short);
        let firstResult: boolean = a.isLessThan(b);
        let secondResult: boolean = a.isLessThan(b);
        let thirdResult: boolean = a.isLessThan(b);
        expect(firstResult).assertTrue();
        expect(firstResult).assertEqual(secondResult);
        expect(secondResult).assertEqual(thirdResult);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_IS_RELATIONAL_0600
     * @tc.name testShortIsRelational_merged6
     * @tc.desc Idempotent: covers 10 merged test points for Short.isRelational, including equality consistency, comparison and ordering, radix conversion, and constructor forms.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortIsRelational_merged6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let pairs: Short[][] = [
          [new Short(10 as short), new Short(20 as short)],
          [new Short((-5) as short), new Short(0 as short)],
          [new Short(0 as short), new Short(0 as short)],
          [new Short(100 as short), new Short(50 as short)],
          [new Short(Short.MIN_VALUE), new Short(Short.MAX_VALUE)]
        ];
        let pairCount: int = 5;
        for (let i: int = 0; i < pairCount; i++) {
          let a: Short = pairs[i][0];
          let b: Short = pairs[i][1];
          let cmp: int = a.compareTo(b);
          expect(a.isLessThan(b)).assertEqual(cmp < 0);
          expect(a.isGreaterThan(b)).assertEqual(cmp > 0);
        }
      }

      {
        let a: Short = new Short(5 as short);
        let b: Short = new Short(5 as short);
        let c: Short = new Short(10 as short);
        expect(a.isLessThan(b)).assertFalse();
        expect(b.isLessThan(c)).assertTrue();
        expect(a.isLessThan(c)).assertTrue();
      }

      {
        let a: Short = new Short(30 as short);
        let b: Short = new Short(20 as short);
        let c: Short = new Short(10 as short);
        expect(a.isLessEqualThan(b)).assertFalse();
        expect(b.isLessEqualThan(c)).assertFalse();
        expect(a.isLessEqualThan(c)).assertFalse();
      }

      {
        let a: Short = new Short(10 as short);
        let b: Short = new Short(10 as short);
        let c: Short = new Short(20 as short);
        expect(a.isLessEqualThan(b)).assertTrue();
        expect(b.isLessEqualThan(c)).assertTrue();
        expect(a.isLessEqualThan(c)).assertTrue();
      }

      {
        let a: Short = new Short(3 as short);
        let b: Short = new Short(7 as short);
        let negA: Short = new Short((-3) as short);
        let negB: Short = new Short((-7) as short);
        expect(a.isLessThan(b)).assertTrue();
        expect(negB.isLessThan(negA)).assertTrue();
        expect(b.isGreaterThan(a)).assertTrue();
        expect(negA.isGreaterThan(negB)).assertTrue();
      }

      {
        let fromLiteral: Short = new Short(128 as short);
        let fromParseInt: Short = new Short(Short.parseInt("128", 10));
        let fromArithmetic: Short = new Short(64 as short).mul(new Short(2 as short));
        expect(fromLiteral.isLessEqualThan(fromParseInt)).assertTrue();
        expect(fromLiteral.isGreaterEqualThan(fromParseInt)).assertTrue();
        expect(fromLiteral.isLessEqualThan(fromArithmetic)).assertTrue();
        expect(fromLiteral.isGreaterEqualThan(fromArithmetic)).assertTrue();
      }

      {
        let a: Short = new Short(200 as short);
        let b: Short = new Short(50 as short);
        let c: Short = new Short((-100) as short);
        let aGtB: boolean = a.isGreaterThan(b);
        let bGtC: boolean = b.isGreaterThan(c);
        let aGtC: boolean = a.isGreaterThan(c);
        expect(aGtB).assertTrue();
        expect(bGtC).assertTrue();
        expect(aGtC).assertTrue();
      }

      {
        let pairs: Short[][] = [
          [new Short(10 as short), new Short(20 as short)],
          [new Short((-50) as short), new Short((-10) as short)],
          [new Short(Short.MIN_VALUE), new Short(Short.MAX_VALUE)],
          [new Short(0 as short), new Short(100 as short)],
          [new Short((-1) as short), new Short(1 as short)]
        ];
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          let a: Short = pairs[i][0];
          let b: Short = pairs[i][1];
          expect(a.isLessThan(b)).assertEqual(b.isGreaterThan(a));
        }
      }

      {
        let seed: int = 777;
        for (let i: int = 0; i < 1000; i++) {
          seed = (seed * 1103515245 + 12345) & 0x7FFFFFFF;
          let aVal: int = (seed % 65536) - 32768;
          seed = (seed * 1103515245 + 12345) & 0x7FFFFFFF;
          let bVal: int = (seed % 65536) - 32768;
          let a: Short = new Short(Int.toShort(aVal));
          let b: Short = new Short(Int.toShort(bVal));
          let cmp: int = a.compareTo(b);
          expect(a.isLessThan(b)).assertEqual(cmp < 0);
          expect(a.isLessEqualThan(b)).assertEqual(cmp <= 0);
          expect(a.isGreaterThan(b)).assertEqual(cmp > 0);
          expect(a.isGreaterEqualThan(b)).assertEqual(cmp >= 0);
        }
      }

      {
        let a: Short = new Short(42 as short);
        let b: Short = new Short(42 as short);
        let c: Short = new Short(99 as short);
        expect(a.equals(b)).assertTrue();
        expect(a.isLessEqualThan(b)).assertTrue();
        expect(a.isGreaterEqualThan(b)).assertTrue();
        expect(a.isLessThan(b)).assertFalse();
        expect(a.isGreaterThan(b)).assertFalse();
        expect(a.equals(c)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_IS_RELATIONAL_0700
     * @tc.name testShortIsRelational_merged7
     * @tc.desc ArithmeticBitwise: covers 10 merged test points for Short.isRelational, including equality consistency, loop accumulation, bitwise operations, and comparison and ordering.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortIsRelational_merged7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let values: short[] = [0 as short, 5 as short, 32767 as short, (-5) as short, (-128) as short, (-32767) as short];
        let valueCount: int = 6;
        for (let i: int = 0; i < valueCount; i++) {
          let a: Short = new Short(values[i]);
          let absInt: int = Math.abs(a.toInt());
          let absVal: Short = new Short(Int.toShort(absInt));
          expect(absVal.isGreaterEqualThan(a)).assertTrue();
        }
      }

      {
        let pairs: [short, short][] = [
          [3 as short, 7 as short],
          [7 as short, 3 as short],
          [5 as short, 5 as short],
          [(-2) as short, 6 as short],
          [6 as short, (-2) as short],
          [(-4) as short, (-4) as short]
        ];
        let pairCount: int = 6;
        for (let i: int = 0; i < pairCount; i++) {
          let a: Short = new Short(pairs[i][0]);
          let b: Short = new Short(pairs[i][1]);
          let bothNonStrict: boolean = a.isGreaterEqualThan(b) && a.isLessEqualThan(b);
          let neitherStrict: boolean = !a.isGreaterThan(b) && !a.isLessThan(b);
          expect(bothNonStrict).assertEqual(neitherStrict);
          expect(bothNonStrict).assertEqual(a.equals(b));
        }
      }

      {
        let triples: [short, short, short][] = [
          [10 as short, 5 as short, 3 as short],
          [5 as short, 10 as short, 3 as short],
          [7 as short, 7 as short, 2 as short],
          [(-20) as short, (-15) as short, 8 as short],
          [100 as short, 100 as short, 200 as short]
        ];
        let tripleCount: int = 5;
        for (let i: int = 0; i < tripleCount; i++) {
          let a: Short = new Short(triples[i][0]);
          let b: Short = new Short(triples[i][1]);
          let k: Short = new Short(triples[i][2]);
          let aShift: Short = a.add(k);
          let bShift: Short = b.add(k);
          expect(aShift.isGreaterEqualThan(bShift)).assertEqual(a.isGreaterEqualThan(b));
          expect(aShift.isLessEqualThan(bShift)).assertEqual(a.isLessEqualThan(b));
        }
      }

      {
        let pivot: Short = new Short(0 as short);
        expect(new Short((-5) as short).isLessThan(pivot)).assertTrue();
        expect(new Short((-1) as short).isLessThan(pivot)).assertTrue();
        expect(pivot.isLessThan(new Short(1 as short))).assertTrue();
        expect(pivot.isLessThan(new Short(5 as short))).assertTrue();
      }

      {
        let current: Short = new Short(7 as short);
        expect(current.isLessEqualThan(new Short(7 as short))).assertTrue();
        expect(current.isLessEqualThan(new Short(8 as short))).assertTrue();
        expect(current.isLessEqualThan(new Short(6 as short))).assertFalse();
      }

      {
        let current: Short = new Short(15 as short);
        expect(current.isGreaterThan(new Short(10 as short))).assertTrue();
        expect(current.isGreaterThan(new Short(15 as short))).assertFalse();
        expect(current.isGreaterThan(new Short(20 as short))).assertFalse();
      }

      {
        let current: Short = new Short(25 as short);
        expect(current.isGreaterEqualThan(new Short(20 as short))).assertTrue();
        expect(current.isGreaterEqualThan(new Short(25 as short))).assertTrue();
        expect(current.isGreaterEqualThan(new Short(30 as short))).assertFalse();
      }

      {
        let a: Short = new Short(50 as short);
        let b: Short = new Short(30 as short);
        let c: Short = new Short(10 as short);
        expect(a.isGreaterEqualThan(b)).assertTrue();
        expect(b.isGreaterEqualThan(c)).assertTrue();
        expect(a.isGreaterEqualThan(c)).assertTrue();
      }

      {
        let a: Short = new Short(25 as short);
        let b: Short = new Short(10 as short);
        let result: Short = a.add(b).sub(b);
        let expected: Short = new Short(25 as short);
        expect(result.isLessEqualThan(expected)).assertTrue();
        expect(result.isGreaterEqualThan(expected)).assertTrue();
      }

      {
        let zero: Short = new Short(0 as short);
        for (let v: int = -128; v <= 127; v++) {
          let s: Short = new Short(Int.toShort(v));
          let sgn: int = v < 0 ? -1 : (v > 0 ? 1 : 0);
          expect(s.isLessThan(zero)).assertEqual(sgn < 0);
          expect(s.isLessEqualThan(zero)).assertEqual(sgn <= 0);
          expect(s.isGreaterThan(zero)).assertEqual(sgn > 0);
          expect(s.isGreaterEqualThan(zero)).assertEqual(sgn >= 0);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_IS_RELATIONAL_0800
     * @tc.name testShortIsRelational_merged8
     * @tc.desc ArithmeticBitwise / SortCompare: covers 10 merged test points for Short.isRelational, including equality consistency, bitwise operations, fractions and rounding, and radix conversion.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortIsRelational_merged8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let seed: int = 12345;
        for (let i: int = 0; i < 100; i++) {
          seed = (seed * 1103515245 + 12345) & 0x7FFFFFFF;
          let aVal: int = (seed % 65536) - 32768;
          seed = (seed * 1103515245 + 12345) & 0x7FFFFFFF;
          let bVal: int = (seed % 65536) - 32768;
          let a: Short = new Short(Int.toShort(aVal));
          let b: Short = new Short(Int.toShort(bVal));
          let lt: boolean = a.isLessThan(b);
          let le: boolean = a.isLessEqualThan(b);
          expect(lt).assertEqual(aVal < bVal);
          expect(le).assertEqual(aVal <= bVal);
        }
      }

      {
        let seed: int = 54321;
        for (let i: int = 0; i < 100; i++) {
          seed = (seed * 1103515245 + 12345) & 0x7FFFFFFF;
          let aVal: int = (seed % 65536) - 32768;
          seed = (seed * 1103515245 + 12345) & 0x7FFFFFFF;
          let bVal: int = (seed % 65536) - 32768;
          let a: Short = new Short(Int.toShort(aVal));
          let b: Short = new Short(Int.toShort(bVal));
          let gt: boolean = a.isGreaterThan(b);
          let ge: boolean = a.isGreaterEqualThan(b);
          expect(gt).assertEqual(aVal > bVal);
          expect(ge).assertEqual(aVal >= bVal);
        }
      }

      {
        let values: short[] = [(-32767) as short, (-100) as short, (-1) as short, 0 as short, 1 as short, 200 as short, 32767 as short];
        let valueCount: int = 7;
        for (let i: int = 0; i < valueCount; i++) {
          for (let j: int = 0; j < valueCount; j++) {
            let a: Short = new Short(values[i]);
            let b: Short = new Short(values[j]);
            let comparable: boolean = a.isGreaterEqualThan(b) || b.isGreaterEqualThan(a);
            expect(comparable).assertTrue();
          }
        }
      }

      {
        let lower: Short = new Short(10 as short);
        let upper: Short = new Short(20 as short);
  
        let inside: Short = new Short(15 as short);
        let bothExclusive: boolean = inside.isLessThan(lower) && inside.isGreaterThan(upper);
        expect(bothExclusive).assertFalse();
  
        let below: Short = new Short(5 as short);
        let belowExclusive: boolean = below.isLessThan(lower) && below.isGreaterThan(upper);
        expect(below.isLessThan(lower)).assertTrue();
        expect(below.isGreaterThan(upper)).assertFalse();
        expect(belowExclusive).assertFalse();
  
        let above: Short = new Short(25 as short);
        let aboveExclusive: boolean = above.isLessThan(lower) && above.isGreaterThan(upper);
        expect(above.isLessThan(lower)).assertFalse();
        expect(above.isGreaterThan(upper)).assertTrue();
        expect(aboveExclusive).assertFalse();
  
        let inRange: boolean = !inside.isLessThan(lower) && !inside.isGreaterThan(upper);
        expect(inRange).assertTrue();
  
        let negLower: Short = new Short((-20) as short);
        let negUpper: Short = new Short((-10) as short);
        let negInside: Short = new Short((-15) as short);
        expect(negInside.isLessThan(negLower)).assertFalse();
        expect(negInside.isGreaterThan(negUpper)).assertFalse();
      }

      {
        let current: Short = new Short(5 as short);
        let smallerArgument: Short = new Short(3 as short);
        let lessThanResult: boolean = current.isLessThan(smallerArgument);
        let lessEqualResult: boolean = current.isLessEqualThan(smallerArgument);
        let greaterThanResult: boolean = current.isGreaterThan(smallerArgument);
        let greaterEqualResult: boolean = current.isGreaterEqualThan(smallerArgument);
        expect(lessThanResult).assertFalse();
        expect(lessEqualResult).assertFalse();
        expect(greaterThanResult).assertTrue();
        expect(greaterEqualResult).assertTrue();
      }

      {
        let current: Short = new Short(42 as short);
        let equalArgument: Short = new Short(42 as short);
        let lessThanResult: boolean = current.isLessThan(equalArgument);
        let lessEqualResult: boolean = current.isLessEqualThan(equalArgument);
        let greaterThanResult: boolean = current.isGreaterThan(equalArgument);
        let greaterEqualResult: boolean = current.isGreaterEqualThan(equalArgument);
        expect(lessThanResult).assertFalse();
        expect(lessEqualResult).assertTrue();
        expect(greaterThanResult).assertFalse();
        expect(greaterEqualResult).assertTrue();
      }

      {
        let current: Short = new Short(5 as short);
        let largerArgument: Short = new Short(7 as short);
        let lessThanResult: boolean = current.isLessThan(largerArgument);
        let lessEqualResult: boolean = current.isLessEqualThan(largerArgument);
        let greaterThanResult: boolean = current.isGreaterThan(largerArgument);
        let greaterEqualResult: boolean = current.isGreaterEqualThan(largerArgument);
        expect(lessThanResult).assertTrue();
        expect(lessEqualResult).assertTrue();
        expect(greaterThanResult).assertFalse();
        expect(greaterEqualResult).assertFalse();
      }

      {
        let a: Short = new Short(Short.parseInt("200", 10));
        let b: Short = new Short(Short.parseInt("100", 10));
        expect(a.isGreaterThan(b)).assertTrue();
        expect(a.isLessThan(b)).assertFalse();
        expect(b.isLessThan(a)).assertTrue();
        expect(b.isGreaterThan(a)).assertFalse();
      }

      {
        let base: Short = new Short(10 as short);
        let sum: Short = base.add(new Short(5 as short));
        let expected: Short = new Short(15 as short);
        expect(sum.isLessEqualThan(expected)).assertTrue();
        expect(sum.isGreaterEqualThan(expected)).assertTrue();
        expect(sum.isLessThan(expected)).assertFalse();
        expect(sum.isGreaterThan(expected)).assertFalse();
      }

      {
        let diff: Short = new Short(50 as short).sub(new Short(20 as short));
        let expected: Short = new Short(30 as short);
        expect(diff.isLessEqualThan(expected)).assertTrue();
        expect(diff.isGreaterEqualThan(expected)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_IS_RELATIONAL_0900
     * @tc.name testShortIsRelational_merged9
     * @tc.desc SortCompare: covers 10 merged test points for Short.isRelational, including equality consistency, division and modulo, and comparison and ordering.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortIsRelational_merged9', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let product: Short = new Short(4 as short).mul(new Short(6 as short));
        let expected: Short = new Short(24 as short);
        expect(product.isLessEqualThan(expected)).assertTrue();
        expect(product.isGreaterEqualThan(expected)).assertTrue();
      }

      {
        let instanceA: Short = new Short(42 as short);
        let instanceB: Short = new Short(42 as short);
        expect(instanceA.isLessThan(instanceB)).assertFalse();
        expect(instanceB.isLessThan(instanceA)).assertFalse();
        expect(instanceA.isLessEqualThan(instanceB)).assertTrue();
        expect(instanceB.isLessEqualThan(instanceA)).assertTrue();
      }

      {
        let a: Short = new Short(10 as short);
        let b: Short = new Short(5 as short);
        let sum: Short = a.add(b);
        expect(sum.isGreaterThan(a)).assertTrue();
        expect(sum.isGreaterThan(b)).assertTrue();
        expect(a.isLessThan(sum)).assertTrue();
      }

      {
        let a: Short = new Short(20 as short);
        let b: Short = new Short(8 as short);
        let diff: Short = a.sub(b);
        expect(diff.isLessThan(a)).assertTrue();
        expect(diff.isGreaterThan(b)).assertTrue();
      }

      {
        let a: Short = new Short(3 as short);
        let b: Short = new Short(7 as short);
        let product: Short = a.mul(b);
        expect(product.isGreaterThan(a)).assertTrue();
        expect(product.isGreaterThan(b)).assertTrue();
      }

      {
        let a: Short = new Short(30 as short);
        let b: Short = new Short(5 as short);
        let quotient: Short = a.div(b);
        let expected: Short = new Short(6 as short);
        expect(quotient.isLessEqualThan(expected)).assertTrue();
        expect(quotient.isGreaterEqualThan(expected)).assertTrue();
        expect(quotient.isLessThan(a)).assertTrue();
      }

      {
        let a: Short = new Short(20 as short);
        let b: Short = new Short(5 as short);
        let sum: Short = a.add(b);
        let diff: Short = a.sub(b);
        let prod: Short = a.mul(b);
        expect(prod.isGreaterThan(sum)).assertTrue();
        expect(sum.isGreaterThan(diff)).assertTrue();
        expect(diff.isLessThan(sum)).assertTrue();
        expect(diff.isLessEqualThan(prod)).assertTrue();
        expect(sum.isGreaterEqualThan(diff)).assertTrue();
        expect(prod.isGreaterEqualThan(sum)).assertTrue();
      }

      {
        let pairs: Short[][] = [
          [new Short(5 as short), new Short(5 as short)],
          [new Short(3 as short), new Short(7 as short)],
          [new Short(7 as short), new Short(3 as short)],
          [new Short(Short.MIN_VALUE), new Short(Short.MAX_VALUE)],
          [new Short(Short.MAX_VALUE), new Short(Short.MIN_VALUE)]
        ];
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          let a: Short = pairs[i][0];
          let b: Short = pairs[i][1];
          expect(a.isLessEqualThan(b)).assertEqual(!b.isLessThan(a));
        }
      }

      {
        let pairs: Short[][] = [
          [new Short(5 as short), new Short(5 as short)],
          [new Short(7 as short), new Short(3 as short)],
          [new Short(3 as short), new Short(7 as short)],
          [new Short(Short.MAX_VALUE), new Short(Short.MIN_VALUE)],
          [new Short(Short.MIN_VALUE), new Short(Short.MAX_VALUE)]
        ];
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          let a: Short = pairs[i][0];
          let b: Short = pairs[i][1];
          expect(a.isGreaterEqualThan(b)).assertEqual(!b.isGreaterThan(a));
        }
      }

      {
        let a: Short = new Short(100 as short);
        let aPlus1: Short = new Short(101 as short);
        expect(a.isLessEqualThan(aPlus1)).assertTrue();
        expect(aPlus1.isLessEqualThan(a)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_IS_RELATIONAL_1000
     * @tc.name testShortIsRelational_merged10
     * @tc.desc BusinessScenario: covers 10 merged test points for Short.isRelational, including business scenarios, equality consistency, negative values, loop accumulation, and boundary values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortIsRelational_merged10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let userLevel: Short = new Short(150 as short);
        let guest: Short = new Short(0 as short);
        let user: Short = new Short(100 as short);
        let admin: Short = new Short(200 as short);
        let superAdmin: Short = new Short(300 as short);
  
        let canUserOp: boolean = userLevel.isGreaterEqualThan(user);
        expect(canUserOp).assertTrue();
  
        let canAdminOp: boolean = userLevel.isGreaterEqualThan(admin);
        expect(canAdminOp).assertFalse();
  
        expect(guest.isLessThan(user)).assertTrue();
        expect(user.isLessThan(admin)).assertTrue();
        expect(admin.isLessThan(superAdmin)).assertTrue();
      }

      {
        let data: Short[] = [
          new Short(-5000 as short), new Short(0 as short), new Short(5000 as short),
          new Short(15000 as short), new Short(25000 as short), new Short(32000 as short)
        ];
  
        let buckets: Map<string, int[]> = new Map<string, int[]>();
        let negBound: Short = new Short(0 as short);
        let lowBound: Short = new Short(10000 as short);
        let highBound: Short = new Short(20000 as short);
  
        buckets.set('negative', []);
        buckets.set('low', []);
        buckets.set('medium', []);
        buckets.set('high', []);
  
        for (let v of data) {
          if (v.isLessThan(negBound)) {
            (buckets.get('negative') as int[]).push(v.toInt());
          } else if (v.isLessThan(lowBound)) {
            (buckets.get('low') as int[]).push(v.toInt());
          } else if (v.isLessThan(highBound)) {
            (buckets.get('medium') as int[]).push(v.toInt());
          } else {
            (buckets.get('high') as int[]).push(v.toInt());
          }
        }
  
        expect((buckets.get('negative') as int[]).length).assertEqual(1);
        expect((buckets.get('low') as int[]).length).assertEqual(2);
        expect((buckets.get('medium') as int[]).length).assertEqual(1);
        expect((buckets.get('high') as int[]).length).assertEqual(2);
      }

      {
        let currentPrice: Short = new Short(150 as short);
        let buyThreshold: Short = new Short(100 as short);
        let sellThreshold: Short = new Short(200 as short);
        let stopLoss: Short = new Short(80 as short);
        expect(currentPrice.isGreaterThan(buyThreshold)).assertTrue();
        expect(currentPrice.isGreaterEqualThan(sellThreshold)).assertFalse();
        expect(currentPrice.isGreaterThan(stopLoss)).assertTrue();
      }

      {
        let adultAge: Short = new Short(18 as short);
        let seniorAge: Short = new Short(65 as short);
        let personA: Short = new Short(20 as short);
        let personB: Short = new Short(16 as short);
        let personC: Short = new Short(70 as short);
        expect(personA.isGreaterEqualThan(adultAge)).assertTrue();
        expect(personB.isLessThan(adultAge)).assertTrue();
        expect(personC.isGreaterEqualThan(seniorAge)).assertTrue();
      }

      {
        let gradeA: Short = new Short(90 as short);
        let gradeB: Short = new Short(80 as short);
        let gradeC: Short = new Short(70 as short);
        let gradeD: Short = new Short(60 as short);
        let score: Short = new Short(85 as short);
        expect(score.isGreaterEqualThan(gradeA)).assertFalse();
        expect(score.isGreaterEqualThan(gradeB)).assertTrue();
        expect(score.isLessThan(gradeC)).assertFalse();
        expect(score.isGreaterEqualThan(gradeD)).assertTrue();
      }

      {
        let nearThreshold: Short = new Short(50 as short);
        let midThreshold: Short = new Short(200 as short);
        let farThreshold: Short = new Short(500 as short);
        let distance: Short = new Short(150 as short);
        expect(distance.isLessEqualThan(nearThreshold)).assertFalse();
        expect(distance.isLessEqualThan(midThreshold)).assertTrue();
        expect(distance.isLessThan(farThreshold)).assertTrue();
      }

      {
        let fullCharge: Short = new Short(100 as short);
        let lowBattery: Short = new Short(20 as short);
        let criticalBattery: Short = new Short(5 as short);
        let battery: Short = new Short(15 as short);
        expect(battery.isGreaterEqualThan(fullCharge)).assertFalse();
        expect(battery.isLessThan(lowBattery)).assertTrue();
        expect(battery.isGreaterThan(criticalBattery)).assertTrue();
      }

      {
        let openHour: Short = new Short(9 as short);
        let closeHour: Short = new Short(21 as short);
        let bookingA: Short = new Short(10 as short);
        let bookingB: Short = new Short(22 as short);
        let inHoursA: boolean = bookingA.isGreaterEqualThan(openHour) && bookingA.isLessThan(closeHour);
        let inHoursB: boolean = bookingB.isGreaterEqualThan(openHour) && bookingB.isLessThan(closeHour);
        expect(inHoursA).assertTrue();
        expect(inHoursB).assertFalse();
      }

      {
        let min: Short = new Short(100 as short);
        let max: Short = new Short(200 as short);
        let inRange: Short = new Short(150 as short);
        let belowRange: Short = new Short(50 as short);
        let aboveRange: Short = new Short(250 as short);
        let atMin: Short = new Short(100 as short);
        let atMax: Short = new Short(200 as short);
        expect(inRange.isGreaterEqualThan(min) && inRange.isLessEqualThan(max)).assertTrue();
        expect(belowRange.isGreaterEqualThan(min)).assertFalse();
        expect(aboveRange.isLessEqualThan(max)).assertFalse();
        expect(atMin.isGreaterEqualThan(min) && atMin.isLessEqualThan(max)).assertTrue();
        expect(atMax.isGreaterEqualThan(min) && atMax.isLessEqualThan(max)).assertTrue();
      }

      {
        let threshold: Short = new Short(1000 as short);
        let normalVal: Short = new Short(500 as short);
        let alertVal: Short = new Short(1500 as short);
        let atThreshold: Short = new Short(1000 as short);
        expect(normalVal.isGreaterThan(threshold)).assertFalse();
        expect(alertVal.isGreaterThan(threshold)).assertTrue();
        expect(atThreshold.isGreaterThan(threshold)).assertFalse();
        expect(atThreshold.isGreaterEqualThan(threshold)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_IS_RELATIONAL_1100
     * @tc.name testShortIsRelational_merged11
     * @tc.desc BusinessScenario: covers 10 merged test points for Short.isRelational, including business scenarios, equality consistency, and comparison and ordering.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortIsRelational_merged11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let min: Short = new Short(0 as short);
        let max: Short = new Short(100 as short);
        let above: Short = new Short(150 as short);
        let below: Short = new Short((-50) as short);
        let inside: Short = new Short(50 as short);
        let clipAbove: Short = above.isGreaterThan(max) ? max : (above.isLessThan(min) ? min : above);
        expect(clipAbove.toInt()).assertEqual(max.toInt());
        let clipBelow: Short = below.isGreaterThan(max) ? max : (below.isLessThan(min) ? min : below);
        expect(clipBelow.toInt()).assertEqual(min.toInt());
        let clipInside: Short = inside.isGreaterThan(max) ? max : (inside.isLessThan(min) ? min : inside);
        expect(clipInside.toInt()).assertEqual(inside.toInt());
      }

      {
        let arr: Short[] = [
          new Short(5 as short), new Short(2 as short), new Short(8 as short),
          new Short(1 as short), new Short(9 as short)
        ];
        let n: int = 5;
        for (let i: int = 1; i < n; i++) {
          let key: Short = arr[i];
          let j: int = i - 1;
          while (j >= 0 && key.isLessThan(arr[j])) {
            arr[j + 1] = arr[j];
            j = j - 1;
          }
          arr[j + 1] = key;
        }
        for (let i: int = 0; i < n - 1; i++) {
          expect(arr[i].isLessEqualThan(arr[i + 1])).assertTrue();
        }
      }

      {
        let arr: Short[] = [
          new Short(7 as short), new Short(10 as short), new Short(4 as short),
          new Short(3 as short), new Short(20 as short), new Short(15 as short)
        ];
        let pivot: Short = arr[arr.length - 1];
        let i: int = -1;
        for (let j: int = 0; j < arr.length; j++) {
          if (arr[j].isLessEqualThan(pivot)) {
            i++;
            let tmp: Short = arr[i];
            arr[i] = arr[j];
            arr[j] = tmp;
          }
        }
        for (let k: int = 0; k <= i; k++) {
          expect(arr[k].isLessEqualThan(pivot)).assertTrue();
        }
        for (let k: int = i + 1; k < arr.length; k++) {
          expect(arr[k].isGreaterThan(pivot) || arr[k].toInt() == pivot.toInt()).assertTrue();
        }
      }

      {
        let a: Short = new Short(10 as short);
        let b: Short = new Short(30 as short);
        let c: Short = new Short(20 as short);
        let d: Short = new Short(40 as short);
        let overlap: boolean = a.isLessEqualThan(d) && c.isLessEqualThan(b);
        expect(overlap).assertTrue();
  
        let e: Short = new Short(31 as short);
        let f: Short = new Short(50 as short);
        let noOverlap: boolean = a.isLessEqualThan(f) && e.isLessEqualThan(b);
        expect(noOverlap).assertFalse();
      }

      {
        let criticalThreshold: Short = new Short(10 as short);
        let lowThreshold: Short = new Short(30 as short);
        let batteryCritical: Short = new Short(5 as short);
        let batteryLow: Short = new Short(20 as short);
        let batteryNormal: Short = new Short(80 as short);
        expect(batteryCritical.isLessThan(criticalThreshold)).assertTrue();
        expect(batteryLow.isGreaterEqualThan(criticalThreshold) && batteryLow.isLessThan(lowThreshold)).assertTrue();
        expect(batteryNormal.isGreaterEqualThan(lowThreshold)).assertTrue();
      }

      {
        let redline: Short = new Short(7000 as short);
        let safeRPM: Short = new Short(6000 as short);
        let warnRPM: Short = new Short(7000 as short);
        let overRPM: Short = new Short(7500 as short);
        expect(safeRPM.isGreaterEqualThan(redline)).assertFalse();
        expect(warnRPM.isGreaterEqualThan(redline)).assertTrue();
        expect(overRPM.isGreaterEqualThan(redline)).assertTrue();
      }

      {
        let bandwidthGuarantee: Short = new Short(100 as short);
        let enoughBandwidth: Short = new Short(200 as short);
        let lowBandwidth: Short = new Short(50 as short);
        expect(enoughBandwidth.isLessThan(bandwidthGuarantee)).assertFalse();
        expect(lowBandwidth.isLessThan(bandwidthGuarantee)).assertTrue();
      }

      {
        let lowerBand: Short = new Short(100 as short);
        let upperBand: Short = new Short(200 as short);
        let priceInBand: Short = new Short(150 as short);
        let priceBelow: Short = new Short(80 as short);
        let priceAbove: Short = new Short(220 as short);
        let outOfBandBelow: boolean = priceBelow.isLessThan(lowerBand);
        let outOfBandAbove: boolean = priceAbove.isGreaterThan(upperBand);
        let inBand: boolean = !priceInBand.isLessThan(lowerBand) && !priceInBand.isGreaterThan(upperBand);
        expect(outOfBandBelow).assertTrue();
        expect(outOfBandAbove).assertTrue();
        expect(inBand).assertTrue();
      }

      {
        let minSafeAltitude: Short = new Short(500 as short);
        let safeAltitude: Short = new Short(1000 as short);
        let dangerAltitude: Short = new Short(400 as short);
        let atMinAltitude: Short = new Short(500 as short);
        expect(safeAltitude.isLessThan(minSafeAltitude)).assertFalse();
        expect(dangerAltitude.isLessThan(minSafeAltitude)).assertTrue();
        expect(atMinAltitude.isLessThan(minSafeAltitude)).assertFalse();
      }

      {
        let speedLimit: Short = new Short(120 as short);
        let tolerance: Short = new Short(5 as short);
        let legalSpeed: Short = new Short(115 as short);
        let borderlineSpeed: Short = new Short(122 as short);
        let overSpeed: Short = new Short(130 as short);
        let violation: boolean = overSpeed.isGreaterThan(speedLimit.add(tolerance));
        expect(violation).assertTrue();
        expect(borderlineSpeed.isGreaterThan(speedLimit.add(tolerance))).assertFalse();
        expect(legalSpeed.isGreaterThan(speedLimit)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_IS_RELATIONAL_1200
     * @tc.name testShortIsRelational_merged12
     * @tc.desc BusinessScenario: covers 3 merged test points for Short.isRelational, including business scenarios, equality consistency, and comparison and ordering.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortIsRelational_merged12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let undervoltThreshold: Short = new Short(210 as short);
        let overvoltThreshold: Short = new Short(250 as short);
        let normalVoltage: Short = new Short(230 as short);
        let undervolt: Short = new Short(200 as short);
        let overvolt: Short = new Short(255 as short);
        expect(undervolt.isLessEqualThan(undervoltThreshold)).assertTrue();
        expect(overvolt.isGreaterEqualThan(overvoltThreshold)).assertTrue();
        expect(normalVoltage.isLessEqualThan(undervoltThreshold) || normalVoltage.isGreaterEqualThan(overvoltThreshold)).assertFalse();
      }

      {
        let boxes: int[][] = [
          [10, 50, 10, 50],
          [30, 70, 30, 70]
        ];
        for (let axis: int = 0; axis < 2; axis++) {
          let aLo: Short = new Short(Int.toShort(boxes[0][axis * 2]));
          let aHi: Short = new Short(Int.toShort(boxes[0][axis * 2 + 1]));
          let bLo: Short = new Short(Int.toShort(boxes[1][axis * 2]));
          let bHi: Short = new Short(Int.toShort(boxes[1][axis * 2 + 1]));
          expect(aLo.isLessEqualThan(bHi) && bLo.isLessEqualThan(aHi)).assertTrue();
        }
        let box3Left: Short = new Short(60 as short);
        let box3Right: Short = new Short(100 as short);
        let boxA1: Short = new Short(10 as short);
        let boxA2: Short = new Short(50 as short);
        expect(boxA1.isLessEqualThan(box3Right) && box3Left.isLessEqualThan(boxA2)).assertFalse();
      }

      {
        let listA: Short[] = [
          new Short(1 as short), new Short(3 as short), new Short(5 as short)
        ];
        let listB: Short[] = [
          new Short(2 as short), new Short(4 as short), new Short(6 as short)
        ];
        let merged: Short[] = [];
        let i: int = 0;
        let j: int = 0;
        while (i < 3 && j < 3) {
          if (listA[i].isLessEqualThan(listB[j])) {
            merged.push(listA[i]);
            i++;
          } else {
            merged.push(listB[j]);
            j++;
          }
        }
        while (i < 3) {
          merged.push(listA[i]);
          i++;
        }
        while (j < 3) {
          merged.push(listB[j]);
          j++;
        }
        expect(merged.length).assertEqual(6);
        for (let k: int = 0; k < 5; k++) {
          expect(merged[k].isLessEqualThan(merged[k + 1])).assertTrue();
        }
      }
    });

  });
}