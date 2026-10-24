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

function invokeShortToShortInFunction(inputValue: short): short {
  return Short.toShort(inputValue);
}

export default function shortToShortTest(): void {
  describe('ShortToShortTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSHORT_0100
     * @tc.name testShortToShort_merged1
     * @tc.desc BoundaryOverflow: covers 10 merged test points for Short.toShort, including type conversion, boundary values, zero values, equality consistency, and fractions and rounding.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToShort_merged1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let minBoundaryInput: short = Short.MIN_VALUE;
        let actualResult: short = Short.toShort(minBoundaryInput);
        expect(actualResult).assertEqual(minBoundaryInput);
      }

      {
        let maxBoundaryInput: short = Short.MAX_VALUE;
        let actualResult: short = Short.toShort(maxBoundaryInput);
        expect(actualResult).assertEqual(maxBoundaryInput);
      }

      {
        let adjacentMaxInput: short = Int.toShort(32766);
        let actualResult: short = Short.toShort(adjacentMaxInput);
        expect(actualResult).assertEqual(adjacentMaxInput);
      }

      {
        let actualResult: short = Short.toShort((-32767) as short);
        expect(actualResult).assertEqual((-32767) as short);
      }

      {
        let a: short = 100 as short;
        let b: short = 200 as short;
        let c: short = 101 as short;
        let dNeg: short = (-100) as short;
        let eNeg: short = (-50) as short;
        let fZero: short = 0 as short;
        let gNegOne: short = (-1) as short;
        let mid1: short = Int.toShort((Short.toInt(a) + Short.toInt(b)) / 2);
        let mid2: short = Int.toShort((Short.toInt(a) + Short.toInt(c)) / 2);
        let mid3: short = Int.toShort((Short.toInt(dNeg) + Short.toInt(eNeg)) / 2);
        let mid4: short = Int.toShort((Short.toInt(gNegOne) + Short.toInt(fZero)) / 2);
        expect(Short.toShort(mid1)).assertEqual(150 as short);
        expect(Short.toShort(mid2)).assertEqual(100 as short);
        expect(Short.toShort(mid3)).assertEqual((-75) as short);
        expect(Short.toShort(mid4)).assertEqual(0 as short);
      }

      {
        let sourceValue: short = Short.MIN_VALUE;
        let boxedValue: Short = new Short(sourceValue);
        let instanceResult: short = boxedValue.toShort();
        let staticResult: short = Short.toShort(sourceValue);
        expect(instanceResult).assertEqual(sourceValue);
        expect(staticResult).assertEqual(sourceValue);
        expect(instanceResult).assertEqual(staticResult);
      }

      {
        let sourceValue: short = Short.MAX_VALUE;
        let boxedValue: Short = new Short(sourceValue);
        let instanceResult: short = boxedValue.toShort();
        let staticResult: short = Short.toShort(sourceValue);
        expect(instanceResult).assertEqual(sourceValue);
        expect(staticResult).assertEqual(sourceValue);
        expect(instanceResult).assertEqual(staticResult);
      }

      {
        let values: short[] = [Short.MAX_VALUE, Short.MIN_VALUE, 32766 as short, (-32767) as short];
        let caseCount: int = 4;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let sourceValue: short = values[caseIndex];
          let instance1: Short = new Short(sourceValue);
          let instance2: Short = new Short(sourceValue);
          let staticResult: short = Short.toShort(sourceValue);
          let inst1Result: short = instance1.toShort();
          let inst2Result: short = instance2.toShort();
          expect(staticResult).assertEqual(sourceValue);
          expect(inst1Result).assertEqual(sourceValue);
          expect(inst2Result).assertEqual(sourceValue);
          expect(inst1Result).assertEqual(staticResult);
          expect(inst2Result).assertEqual(staticResult);
        }
      }

      {
        let minInstance: Short = new Short(Short.MIN_VALUE);
        let maxInstance: Short = new Short(Short.MAX_VALUE);
        let minFirst: short = minInstance.toShort();
        let minSecond: short = minInstance.toShort();
        let maxFirst: short = maxInstance.toShort();
        let maxSecond: short = maxInstance.toShort();
        expect(minFirst).assertEqual(Short.MIN_VALUE);
        expect(minSecond).assertEqual(minFirst);
        expect(maxFirst).assertEqual(Short.MAX_VALUE);
        expect(maxSecond).assertEqual(maxFirst);
      }

      {
        let values: short[] = [0 as short, 1 as short, 42 as short, 127 as short, 1000 as short, 16384 as short, 32767 as short];
        let count: int = 7;
        for (let i: int = 0; i < count; i++) {
          let posResult: short = Short.toShort(values[i]);
          let negResult: short = Short.toShort(Int.toShort(-Short.toInt(values[i])));
          expect(Int.toShort(-Short.toInt(posResult))).assertEqual(negResult);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSHORT_0200
     * @tc.name testShortToShort_merged2
     * @tc.desc BoundaryOverflow: covers 10 merged test points for Short.toShort, including type conversion, wrapping, boundary values, overflow, and fractions and rounding.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToShort_merged2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let intInputs: int[] = [0, 32767, -32768, 255, -256, 10000, -10000, 65535, 70000];
        let count: int = 9;
        for (let i: int = 0; i < count; i++) {
          let mapped: short = Short.toShort(Int.toShort(intInputs[i]));
          expect(mapped).assertEqual(Int.toShort(intInputs[i]));
          expect(Short.toInt(mapped)).assertEqual(Short.toInt(Int.toShort(intInputs[i])));
        }
      }

      {
        let v1: short = Short.parseInt('0', 16);
        let v2: short = Short.parseInt('FF', 16);
        let v3: short = Short.parseInt('7FFF', 16);
        let v4: short = Int.toShort(0x8000);
        expect(Short.toShort(v1)).assertEqual(0 as short);
        expect(Short.toShort(v2)).assertEqual(255 as short);
        expect(Short.toShort(v3)).assertEqual(32767 as short);
        expect(Short.toShort(v4)).assertEqual((-32768) as short);
      }

      {
        let posDouble: short = Double.toShort(3.99);
        let negDouble: short = Double.toShort(-6.9);
        expect(posDouble).assertEqual(3 as short);
        expect(negDouble).assertEqual((-6) as short);
        expect(Short.toShort(posDouble)).assertEqual(3 as short);
        expect(Short.toShort(negDouble)).assertEqual((-6) as short);
      }

      {
        let inRange: short = Long.toShort(Long.toLong(12345));
        let wrappedHigh: short = Long.toShort(Long.toLong(40000));
        let wrappedLow: short = Long.toShort(Long.toLong(-40000));
        expect(Short.toShort(inRange)).assertEqual(12345 as short);
        expect(Short.toShort(wrappedHigh)).assertEqual((-25536) as short);
        expect(Short.toShort(wrappedLow)).assertEqual(25536 as short);
      }

      {
        let wrapValues: short[] = [
          Int.toShort(32768), Int.toShort(32769), Int.toShort(65535),
          Int.toShort(65536), Int.toShort(-32769), Int.toShort(-65536)
        ];
        let expected: short[] = [
          (-32768) as short, (-32767) as short, (-1) as short,
          0 as short, 32767 as short, 0 as short
        ];
        let count: int = 6;
        for (let i: int = 0; i < count; i++) {
          expect(Short.toShort(wrapValues[i])).assertEqual(expected[i]);
        }
      }

      {
        let maxShort: Short = new Short(Short.MAX_VALUE);
        let overflowed: Short = maxShort.add(1 as short);
        let result: short = Short.toShort(Int.toShort(overflowed));
        expect(result).assertEqual(Short.MIN_VALUE);
        let doubleOverflow: Short = overflowed.add(1 as short);
        expect(Short.toShort(Int.toShort(doubleOverflow))).assertEqual((-32767) as short);
      }

      {
        let minShort: Short = new Short(Short.MIN_VALUE);
        let overflowed: Short = minShort.sub(1 as short);
        let result: short = Short.toShort(Int.toShort(overflowed));
        expect(result).assertEqual(Short.MAX_VALUE);
      }

      {
        let maxShort: Short = new Short(Short.MAX_VALUE);
        let overflowed: Short = maxShort.mul(2 as short);
        let result: short = Short.toShort(Int.toShort(overflowed));
        expect(result).assertEqual((-2) as short);
      }

      {
        for (let n: int = 0; n <= 20; n++) {
          let square: short = Int.toShort(n * n);
          expect(Short.toShort(square)).assertEqual(square);
        }
        let n181: short = Int.toShort(181 * 181);
        expect(Short.toShort(n181)).assertEqual(32761 as short);
      }

      {
        let byteEdges: short[] = [
          Int.toShort(254), Int.toShort(255), Int.toShort(256), Int.toShort(257),
          Int.toShort(-254), Int.toShort(-255), Int.toShort(-256), Int.toShort(-257),
          Int.toShort(0), Int.toShort(1), Int.toShort(-1)
        ];
        let count: int = 11;
        for (let i: int = 0; i < count; i++) {
          expect(Short.toShort(byteEdges[i])).assertEqual(byteEdges[i]);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSHORT_0300
     * @tc.name testShortToShort_merged3
     * @tc.desc BoundaryOverflow / CrossTypeRoundTrip: covers 10 merged test points for Short.toShort, including type conversion, fractions and rounding, equality consistency, zero values, and division and modulo.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToShort_merged3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let values: short[] = [0 as short, 42 as short, (-99) as short, 1000 as short, (-5000) as short];
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          let tsResult: short = Short.toShort(values[i]);
          let tfResult: float = new Short(values[i]).toFloat();
          let back: short = Double.toShort(tfResult);
          expect(tsResult).assertEqual(back);
        }
      }

      {
        let values: short[] = [0 as short, 32767 as short, (-32768) as short, 1 as short, (-1) as short];
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          let tsResult: short = Short.toShort(values[i]);
          let tdResult: double = new Short(values[i]).toDouble();
          let back: short = Double.toShort(tdResult);
          expect(tsResult).assertEqual(back);
        }
      }

      {
        let dividend: Short = new Short(100 as short);
        let divisor: Short = new Short(7 as short);
        let quotient: Short = dividend.div(divisor);
        let result: short = Short.toShort(Int.toShort(quotient));
        expect(result).assertEqual(14 as short);
      }

      {
        let boundaryValues: short[] = [
          Short.MAX_VALUE, Short.MIN_VALUE, 0 as short, 1 as short, (-1) as short,
          32766 as short, (-32767) as short, 255 as short, (-256) as short
        ];
        let count: int = 9;
        for (let i: int = 0; i < count; i++) {
          let result: short = Short.toShort(boundaryValues[i]);
          expect(result).assertEqual(boundaryValues[i]);
        }
      }

      {
        let base: short = 1 as short;
        for (let shift: int = 0; shift < 15; shift++) {
          let shifted: short = Int.toShort((Short.toInt(base) << shift) & 0xFFFF);
          let tsResult: short = Short.toShort(shifted);
          expect(tsResult).assertEqual(Int.toShort(1 << shift));
        }
        let bigShift: short = Int.toShort((Short.toInt(1 as short) << 16) & 0xFFFF);
        expect(Short.toShort(bigShift)).assertEqual(0 as short);
      }

      {
        let lookupTable: string[] = ['A', 'B', 'C', 'D', 'E', 'F', 'G'];
        let rawIndices: int[] = [70000, 65536, 32767, 12, 0];
        let expectedEntries: string[] = ['F', 'A', 'A', 'F', 'A'];
        let tableSize: int = 7;
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          let wrapped: short = Short.toShort(Int.toShort(rawIndices[i]));
          let index: int = Short.toInt(wrapped) % tableSize;
          expect(lookupTable[index]).assertEqual(expectedEntries[i]);
        }
      }

      {
        let parsedHex: short = Short.parseInt('2A', 16);
        let parsedOct: short = Short.parseInt('7', 8);
        let parsedNeg: short = Short.parseInt('-5', 10);
        let parsedHigh: short = Short.parseInt('12', 16);
        let scaledHex: short = Short.toShort(Int.toShort(Short.toInt(parsedHex) * 100));
        let scaledOct: short = Short.toShort(Int.toShort(Short.toInt(parsedOct) * 500));
        let scaledNeg: short = Short.toShort(Int.toShort(Short.toInt(parsedNeg) * 50));
        let scaledHigh: short = Short.toShort(Int.toShort(Short.toInt(parsedHigh) * 2000));
        expect(scaledHex).assertEqual(4200 as short);
        expect(scaledOct).assertEqual(3500 as short);
        expect(scaledNeg).assertEqual((-250) as short);
        expect(scaledHigh).assertEqual((-29536) as short);
      }

      {
        let absShort = (v: short): short => {
          let ts: short = Short.toShort(v);
          let vi: int = Short.toInt(ts);
          if (vi == -32768) {
            return Short.MIN_VALUE;
          }
          let absVal: int = vi < 0 ? -vi : vi;
          return Int.toShort(absVal);
        };
        expect(absShort(42 as short)).assertEqual(42 as short);
        expect(absShort((-42) as short)).assertEqual(42 as short);
        expect(absShort(0 as short)).assertEqual(0 as short);
        expect(absShort(Short.MIN_VALUE)).assertEqual(Short.MIN_VALUE);
      }

      {
        let positiveInput: short = 100 as short;
        let actualResult: short = Short.toShort(positiveInput);
        expect(actualResult).assertEqual(positiveInput);
      }

      {
        expect(Short.toShort(0 as short)).assertEqual(0 as short);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSHORT_0400
     * @tc.name testShortToShort_merged4
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toShort, including type conversion, negative values, equality consistency, loop accumulation, and positive values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToShort_merged4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let negativeInput: short = (-1) as short;
        let actualResult: short = Short.toShort(negativeInput);
        expect(actualResult).assertEqual(negativeInput);
      }

      {
        let inputValue: short = 42 as short;
        let actualResult: short = Short.toShort(inputValue);
        let actualType: string = typeof actualResult;
        expect(actualType).assertEqual('short');
        expect(actualResult).assertEqual(inputValue);
      }

      {
        let directLiteralResult: short = Short.toShort(99 as short);
        expect(directLiteralResult).assertEqual(99 as short);
      }

      {
        let helperInput: short = 42 as short;
        let directResult: short = Short.toShort(helperInput);
        let helperResult: short = invokeShortToShortInFunction(helperInput);
        expect(directResult).assertEqual(helperInput);
        expect(helperResult).assertEqual(helperInput);
        expect(helperResult).assertEqual(directResult);
      }

      {
        let primaryInput: short = 256 as short;
        let secondaryInput: short = 256 as short;
        let primaryResult: short = Short.toShort(primaryInput);
        let secondaryResult: short = Short.toShort(secondaryInput);
        expect(primaryResult).assertEqual(primaryInput);
        expect(secondaryResult).assertEqual(secondaryInput);
        expect(primaryResult).assertEqual(secondaryResult);
      }

      {
        let positiveValues: short[] = [
          1 as short, 10 as short, 100 as short, 500 as short,
          1000 as short, 5000 as short, 10000 as short, 20000 as short,
          32767 as short
        ];
        let caseCount: int = 9;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let result: short = Short.toShort(positiveValues[caseIndex]);
          expect(result).assertEqual(positiveValues[caseIndex]);
        }
      }

      {
        let negativeValues: short[] = [
          (-1) as short, (-10) as short, (-100) as short, (-500) as short,
          (-1000) as short, (-5000) as short, (-10000) as short, (-20000) as short,
          (-32768) as short
        ];
        let caseCount: int = 9;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let result: short = Short.toShort(negativeValues[caseIndex]);
          expect(result).assertEqual(negativeValues[caseIndex]);
        }
      }

      {
        let testValues: short[] = [0 as short, 42 as short, (-1) as short, 1000 as short, (-1000) as short, Short.MAX_VALUE, Short.MIN_VALUE];
        let caseCount: int = 7;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let onceResult: short = Short.toShort(testValues[caseIndex]);
          let twiceResult: short = Short.toShort(Short.toShort(testValues[caseIndex]));
          expect(twiceResult).assertEqual(onceResult);
          expect(onceResult).assertEqual(testValues[caseIndex]);
        }
      }

      {
        let sumVal: short = (100 + 200) as short;
        let diffVal: short = (50 - 300) as short;
        let prodVal: short = (30 * 60) as short;
        let sumResult: short = Short.toShort(sumVal);
        let diffResult: short = Short.toShort(diffVal);
        let prodResult: short = Short.toShort(prodVal);
        expect(sumResult).assertEqual(300 as short);
        expect(diffResult).assertEqual((-250) as short);
        expect(prodResult).assertEqual(1800 as short);
      }

      {
        let inputA: short = 100 as short;
        let inputB: short = 50 as short;
        let resultA: short = Short.toShort(inputA);
        let resultB: short = Short.toShort(inputB);
        let added: short = new Short(resultA).add(resultB);
        let subtracted: short = new Short(resultA).sub(resultB);
        expect(added).assertEqual(150 as short);
        expect(subtracted).assertEqual(50 as short);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSHORT_0500
     * @tc.name testShortToShort_merged5
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toShort, including type conversion, negative values, zero values, sign handling, and equality consistency.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToShort_merged5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let inputA: short = 30 as short;
        let inputB: short = 40 as short;
        let inputC: short = 200 as short;
        let inputD: short = 10 as short;
        let valA: short = Short.toShort(inputA);
        let valB: short = Short.toShort(inputB);
        let valC: short = Short.toShort(inputC);
        let valD: short = Short.toShort(inputD);
        let multiplied: short = new Short(valA).mul(valB);
        let divided: short = new Short(valC).div(valD);
        expect(multiplied).assertEqual(1200 as short);
        expect(divided).assertEqual(20 as short);
      }

      {
        let values: short[] = [0 as short, 127 as short, (-128) as short, Short.MAX_VALUE, Short.MIN_VALUE];
        let caseCount: int = 5;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let sourceValue: short = values[caseIndex];
          let staticResult: short = Short.toShort(sourceValue);
          let instanceVal: Short = new Short(sourceValue);
          let instanceResult: short = instanceVal.toShort();
          let staticType: string = typeof staticResult;
          let instanceType: string = typeof instanceResult;
          expect(staticType).assertEqual('short');
          expect(instanceType).assertEqual('short');
        }
      }

      {
        let zero: Short = new Short(0 as short);
        let posVal: short = Short.toShort(300 as short);
        expect(posVal).assertEqual(300 as short);
        let posInst: Short = new Short(posVal);
        expect(posInst.isGreaterThan(zero)).assertTrue();
        expect(posInst.isGreaterEqualThan(zero)).assertTrue();
        expect(posInst.isLessThan(zero)).assertFalse();
        expect(posInst.isLessEqualThan(zero)).assertFalse();
        let negVal: short = Short.toShort((-300) as short);
        expect(negVal).assertEqual((-300) as short);
        let negInst: Short = new Short(negVal);
        expect(negInst.isLessThan(zero)).assertTrue();
        expect(negInst.isLessEqualThan(zero)).assertTrue();
        expect(negInst.isGreaterThan(zero)).assertFalse();
        expect(negInst.isGreaterEqualThan(zero)).assertFalse();
        let zeroVal: short = Short.toShort(0 as short);
        let zeroInst: Short = new Short(zeroVal);
        expect(zeroInst.isGreaterEqualThan(zero)).assertTrue();
        expect(zeroInst.isLessEqualThan(zero)).assertTrue();
        expect(zeroInst.isGreaterThan(zero)).assertFalse();
        expect(zeroInst.isLessThan(zero)).assertFalse();
        expect(new Short(Short.toShort((-100) as short)).isLessThan(posInst)).assertTrue();
        expect(posInst.isGreaterThan(new Short(Short.toShort(100 as short)))).assertTrue();
      }

      {
        let baseValue: short = 100 as short;
        let toShortResult: short = Short.toShort(baseValue);
        let arithmeticResult: short = new Short(toShortResult).add(50 as short);
        let finalResult: short = Short.toShort(arithmeticResult);
        expect(finalResult).assertEqual(150 as short);
        expect(finalResult).assertEqual(arithmeticResult);
      }

      {
        let value: short = 999 as short;
        let instA: Short = new Short(value);
        let instB: Short = new Short(value);
        let instC: Short = new Short(value);
        let resultA: short = instA.toShort();
        let resultB: short = instB.toShort();
        let resultC: short = instC.toShort();
        expect(resultA).assertEqual(resultB);
        expect(resultB).assertEqual(resultC);
        expect(resultA).assertEqual(value);
      }

      {
        let negValues: short[] = [
          (-1) as short, (-5) as short, (-50) as short, (-127) as short,
          (-128) as short, (-255) as short, (-256) as short, (-512) as short,
          (-1024) as short, (-2048) as short
        ];
        let caseCount: int = 10;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let result: short = Short.toShort(negValues[caseIndex]);
          expect(result).assertEqual(negValues[caseIndex]);
          expect(result).assertLess(0);
        }
      }

      {
        let oneVal: short = 1 as short;
        let negOneVal: short = (-1) as short;
        expect(Short.toShort(oneVal)).assertEqual(1 as short);
        expect(Short.toShort(negOneVal)).assertEqual((-1) as short);
        expect(new Short(oneVal).toShort()).assertEqual(1 as short);
        expect(new Short(negOneVal).toShort()).assertEqual((-1) as short);
        expect(invokeShortToShortInFunction(oneVal)).assertEqual(1 as short);
        expect(invokeShortToShortInFunction(negOneVal)).assertEqual((-1) as short);
      }

      {
        let directInstance: Short = new Short(75 as short);
        let viaArithInstance: Short = new Short((50 + 25) as short);
        expect(directInstance.toShort()).assertEqual(75 as short);
        expect(viaArithInstance.toShort()).assertEqual(75 as short);
        expect(directInstance.toShort()).assertEqual(viaArithInstance.toShort());
      }

      {
        let zeroLiteral: short = 0 as short;
        let zeroBySub: short = (10 - 10) as short;
        let zeroByMult: short = (5 * 0) as short;
        expect(Short.toShort(zeroLiteral)).assertEqual(0 as short);
        expect(Short.toShort(zeroBySub)).assertEqual(0 as short);
        expect(Short.toShort(zeroByMult)).assertEqual(0 as short);
      }

      {
        let arithValue1: short = (20 + 30) as short;
        let arithValue2: short = (15 - 40) as short;
        let inst1: Short = new Short(arithValue1);
        let inst2: Short = new Short(arithValue2);
        expect(inst1.toShort()).assertEqual(50 as short);
        expect(inst2.toShort()).assertEqual((-25) as short);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSHORT_0600
     * @tc.name testShortToShort_merged6
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toShort, including type conversion, bitwise operations, fractions and rounding, equality consistency, and constructor forms.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToShort_merged6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let testValues: Short[] = [
          new Short(0 as short), new Short(1 as short), new Short(-1 as short),
          new Short(32767 as short), new Short(-32768 as short), new Short(12345 as short)
        ];
  
        for (let v of testValues) {
          let identity: Short = new Short(Int.toShort(v));
          expect(identity.equals(v)).assertTrue();
          expect(identity.toInt()).assertEqual(v.toInt());
  
          let doubleIdentity: short = Short.toShort(new Short(Int.toShort(v)));
          expect(doubleIdentity.equals(v)).assertTrue();
        }
      }

      {
        let source: Short = new Short(-9999 as short);
        let passed: Short = new Short(Int.toShort(source));
        let processed: Short = passed.add(new Short(1111 as short));
        let normalized: Short = new Short(Int.toShort(processed));
  
        expect(normalized.toInt()).assertEqual(-8888);
        expect(normalized.isLessThan(new Short(0 as short))).assertTrue();
  
        let chained: Short = new Short(Int.toShort(Short.toShort(new Short(42 as short))));
        expect(chained.toInt()).assertEqual(42);
  
        let fromAdd: Short = new Short(40 as short).add(new Short(2 as short));
        expect(new Short(Int.toShort(fromAdd)).equals(chained)).assertTrue();
      }

      {
        let pairs: [short, short][] = [
          [(-32768) as short, (-1) as short],
          [(-1) as short, 0 as short],
          [0 as short, 1 as short],
          [1 as short, 32767 as short],
          [(-100) as short, 100 as short]
        ];
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          let a: short = Short.toShort(pairs[i][0]);
          let b: short = Short.toShort(pairs[i][1]);
          expect(new Short(a).compareTo(b)).assertEqual(-1);
        }
      }

      {
        let samples: short[] = [0 as short, 42 as short, (-99) as short, 32767 as short, (-32768) as short];
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          let result: short = Short.toShort(samples[i]);
          let asInt: int = Short.toInt(result);
          let diff: double = Short.toDouble(result) - Int.toDouble(asInt);
          expect(diff).assertEqual(0.0);
        }
      }

      {
        let v1: short = Short.parseInt('0', 10);
        let v2: short = Short.parseInt('12345', 10);
        let v3: short = Short.parseInt('-12345', 10);
        let v4: short = Short.parseInt('32767', 10);
        let v5: short = Short.parseInt('-32768', 10);
        expect(Short.toShort(v1)).assertEqual(0 as short);
        expect(Short.toShort(v2)).assertEqual(12345 as short);
        expect(Short.toShort(v3)).assertEqual((-12345) as short);
        expect(Short.toShort(v4)).assertEqual(32767 as short);
        expect(Short.toShort(v5)).assertEqual((-32768) as short);
      }

      {
        let a: short = 0xFF as short;
        let b: short = 0x0F as short;
        let andResult: short = Int.toShort(Short.toInt(a) & Short.toInt(b));
        let toShortResult: short = Short.toShort(andResult);
        expect(toShortResult).assertEqual(15 as short);
        let c: short = (-1) as short;
        let d: short = 0x7F as short;
        let andResult2: short = Int.toShort(Short.toInt(c) & Short.toInt(d));
        expect(Short.toShort(andResult2)).assertEqual(127 as short);
      }

      {
        let a: short = 0xF0 as short;
        let b: short = 0x0F as short;
        let orResult: short = Int.toShort(Short.toInt(a) | Short.toInt(b));
        expect(Short.toShort(orResult)).assertEqual(255 as short);
        let c: short = 0x00 as short;
        let d: short = 42 as short;
        let orResult2: short = Int.toShort(Short.toInt(c) | Short.toInt(d));
        expect(Short.toShort(orResult2)).assertEqual(42 as short);
      }

      {
        let a: short = 0xFF as short;
        let b: short = 0x0F as short;
        let xorResult: short = Int.toShort(Short.toInt(a) ^ Short.toInt(b));
        expect(Short.toShort(xorResult)).assertEqual(240 as short);
        let c: short = 42 as short;
        let xorResult2: short = Int.toShort(Short.toInt(c) ^ Short.toInt(c));
        expect(Short.toShort(xorResult2)).assertEqual(0 as short);
      }

      {
        let base: short = 1 as short;
        let shift1: short = Int.toShort(Short.toInt(base) << 0);
        let shift2: short = Int.toShort(Short.toInt(base) << 5);
        let shift3: short = Int.toShort(Short.toInt(base) << 10);
        expect(Short.toShort(shift1)).assertEqual(1 as short);
        expect(Short.toShort(shift2)).assertEqual(32 as short);
        expect(Short.toShort(shift3)).assertEqual(1024 as short);
      }

      {
        let base: short = 1024 as short;
        let shift1: short = Int.toShort(Short.toInt(base) >> 0);
        let shift2: short = Int.toShort(Short.toInt(base) >> 5);
        let shift3: short = Int.toShort(Short.toInt(base) >> 10);
        expect(Short.toShort(shift1)).assertEqual(1024 as short);
        expect(Short.toShort(shift2)).assertEqual(32 as short);
        expect(Short.toShort(shift3)).assertEqual(1 as short);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSHORT_0700
     * @tc.name testShortToShort_merged7
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toShort, including type conversion, negative values, bitwise operations, constructor forms, and sign handling.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToShort_merged7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let value: short = 1 as short;
        for (let shift: int = 0; shift < 15; shift++) {
          let pow2: short = Int.toShort(Short.toInt(value) << shift);
          expect(Short.toShort(pow2)).assertEqual(pow2);
        }
      }

      {
        let pow10: short[] = [1 as short, 10 as short, 100 as short, 1000 as short, 10000 as short];
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          expect(Short.toShort(pow10[i])).assertEqual(pow10[i]);
        }
        let ratioCheck: short = Short.toShort(pow10[4]);
        let ratio: int = Short.toInt(ratioCheck) / Short.toInt(Short.toShort(pow10[3]));
        expect(ratio).assertEqual(10);
      }

      {
        let value: short = 1 as short;
        for (let shift: int = 0; shift < 15; shift++) {
          let negPow2: short = Int.toShort(-(Short.toInt(value) << shift));
          expect(Short.toShort(negPow2)).assertEqual(negPow2);
        }
      }

      {
        let fibPrev: short = 0 as short;
        let fibCurr: short = 1 as short;
        let fibValues: short[] = [fibPrev, fibCurr];
        for (let i: int = 2; i < 24; i++) {
          let fibNext: short = Int.toShort(Short.toInt(fibPrev) + Short.toInt(fibCurr));
          fibValues.push(fibNext);
          fibPrev = fibCurr;
          fibCurr = fibNext;
        }
        for (let i: int = 0; i < 24; i++) {
          expect(Short.toShort(fibValues[i])).assertEqual(fibValues[i]);
        }
        let restoredPrev: short = Short.toShort(fibValues[21]);
        let restoredCurr: short = Short.toShort(fibValues[22]);
        expect(Int.toShort(Short.toInt(restoredPrev) + Short.toInt(restoredCurr))).assertEqual(fibValues[23]);
      }

      {
        for (let n: int = 0; n <= 25; n++) {
          let tri: short = Int.toShort(n * (n + 1) / 2);
          expect(Short.toShort(tri)).assertEqual(tri);
        }
      }

      {
        let expected: short[] = [1 as short, 1 as short, 2 as short, 6 as short,
          24 as short, 120 as short, 720 as short, 5040 as short];
        for (let i: int = 0; i < 8; i++) {
          expect(Short.toShort(expected[i])).assertEqual(expected[i]);
        }
        let f7: short = Short.toShort(expected[7]);
        let f6: short = Short.toShort(expected[6]);
        expect(Int.toShort(Short.toInt(f7) / 7)).assertEqual(f6);
      }

      {
        let mersenneValues: short[] = [];
        let pow: short = Int.toShort(1);
        for (let n: int = 1; n <= 14; n++) {
          let m: short = Int.toShort((Short.toInt(pow) << n) - 1);
          mersenneValues.push(m);
        }
        let count: int = 14;
        for (let i: int = 0; i < count; i++) {
          expect(Short.toShort(mersenneValues[i])).assertEqual(mersenneValues[i]);
        }
      }

      {
        let pattern1: short = Int.toShort(0x5555);
        let pattern2: short = Int.toShort(0xAAAA);
        let pattern3: short = Int.toShort(0x0F0F);
        expect(Short.toShort(pattern1)).assertEqual(Int.toShort(0x5555));
        expect(Short.toShort(pattern2)).assertEqual(Int.toShort(0xAAAA));
        expect(Short.toShort(pattern3)).assertEqual(Int.toShort(0x0F0F));
        let xorResult: short = Int.toShort(Short.toInt(Short.toShort(pattern1)) ^ Short.toInt(Short.toShort(pattern2)));
        expect(xorResult).assertEqual((-1) as short);
      }

      {
        let start: int = -32768;
        let end: int = 32767;
        let step: int = 7;
        for (let v: int = start; v <= end; v += step) {
          let sv: short = Int.toShort(v);
          expect(Short.toShort(sv)).assertEqual(sv);
        }
      }

      {
        let pairs: [short, short][] = [
          [0 as short, 1 as short],
          [1 as short, 0 as short],
          [(-1) as short, 1 as short],
          [Short.MIN_VALUE, Short.MAX_VALUE],
          [32766 as short, 32767 as short]
        ];
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          let a: short = Short.toShort(pairs[i][0]);
          let b: short = Short.toShort(pairs[i][1]);
          let diff: int = Short.toInt(a) - Short.toInt(b);
          let cmp: int = new Short(a).compareTo(b);
          expect(cmp).assertEqual(diff < 0 ? -1 : (diff > 0 ? 1 : 0));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSHORT_0800
     * @tc.name testShortToShort_merged8
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toShort, including type conversion, containers and references, business scenarios, equality consistency, and bitwise operations.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToShort_merged8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let values: short[] = [0 as short, 42 as short, (-256) as short, 32767 as short, (-32768) as short];
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          let ts: short = Short.toShort(values[i]);
          let instance: Short = new Short(values[i]);
          expect(new Short(ts).equals(instance)).assertTrue();
        }
      }

      {
        for (let v: int = -128; v <= 127; v++) {
          let sv: short = Int.toShort(v);
          expect(Short.toShort(sv)).assertEqual(sv);
        }
      }

      {
        let samples: short[] = [0 as short, 16384 as short, (-16384) as short, 32767 as short, (-32768) as short];
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          let sample: short = Short.toShort(samples[i]);
          let stored: short = new Short(sample).toShort();
          expect(stored).assertEqual(samples[i]);
        }
      }

      {
        let rawADC: short = 250 as short;
        let preserved: short = Short.toShort(rawADC);
        let celsius: int = (Short.toInt(preserved) * 100 - 27315) / 100;
        expect(celsius).assertEqual(-23);
      }

      {
        let packed: short = Int.toShort(0xF800);
        let preserved: short = Short.toShort(packed);
        let redExtract: short = Int.toShort(Short.toInt(preserved) & Short.toInt(Int.toShort(0xF800)));
        expect(redExtract).assertEqual(Int.toShort(0xF800));
      }

      {
        let httpPort: short = 80 as short;
        let httpsPort: short = 443 as short;
        let dnsPort: short = 53 as short;
        expect(Short.toShort(httpPort)).assertEqual(80 as short);
        expect(Short.toShort(httpsPort)).assertEqual(443 as short);
        expect(Short.toShort(dnsPort)).assertEqual(53 as short);
      }

      {
        let data: short[] = [10 as short, 20 as short, 30 as short, 40 as short, 50 as short];
        let checksum: short = 0 as short;
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          let val: short = Short.toShort(data[i]);
          checksum = Int.toShort(Short.toInt(checksum) ^ Short.toInt(val));
        }
        expect(checksum).assertEqual(26 as short);
      }

      {
        let bufferSize: short = 256 as short;
        let head: short = Short.toShort(255 as short);
        let nextHead: short = new Short(head).add(1 as short);
        let wrapped: short = new Short(Int.toShort(nextHead)).sub(bufferSize);
        expect(Int.toShort(wrapped)).assertEqual(0 as short);
      }

      {
        let values: short[] = [(-200) as short, (-50) as short, 0 as short, 75 as short, 200 as short];
        let bins: int[] = [0, 0, 0];
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          let v: short = Short.toShort(values[i]);
          if (v < 0 as short) {
            bins[0]++;
          } else if (v == 0 as short) {
            bins[1]++;
          } else {
            bins[2]++;
          }
        }
        expect(bins[0]).assertEqual(2);
        expect(bins[1]).assertEqual(1);
        expect(bins[2]).assertEqual(2);
      }

      {
        let lookup: int[] = [10, 20, 30, 40, 50];
        let indices: short[] = [0 as short, 2 as short, 4 as short];
        let expectedVals: int[] = [10, 30, 50];
        let count: int = 3;
        for (let i: int = 0; i < count; i++) {
          let idx: short = Short.toShort(indices[i]);
          expect(lookup[idx]).assertEqual(expectedVals[i]);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSHORT_0900
     * @tc.name testShortToShort_merged9
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toShort, including type conversion, algebraic properties, loop accumulation, business scenarios, and containers and references.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToShort_merged9', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let stateIdle: short = Short.toShort(0 as short);
        let stateActive: short = Short.toShort(1 as short);
        let stateError: short = Short.toShort((-1) as short);
        expect(stateIdle).assertEqual(0 as short);
        expect(stateActive).assertEqual(1 as short);
        expect(stateError).assertEqual((-1) as short);
        expect(new Short(stateActive).isLessThan(stateError)).assertFalse();
      }

      {
        let score: Short = new Short(0 as short);
        let increments: short[] = [10 as short, 25 as short, 50 as short, 15 as short];
        let count: int = 4;
        for (let i: int = 0; i < count; i++) {
          score = score.add(increments[i]);
        }
        let finalScore: short = Short.toShort(Int.toShort(score));
        expect(finalScore).assertEqual(100 as short);
      }

      {
        let samples: short[] = [
          12 as short, 300 as short, (-5) as short, 200 as short,
          150 as short, (-120) as short, 45 as short
        ];
        let peak: short = Short.MIN_VALUE;
        let trough: short = Short.MAX_VALUE;
        for (let sIndex: int = 0; sIndex < samples.length; sIndex++) {
          let sampleShort: short = Short.toShort(samples[sIndex]);
          if (Short.toInt(sampleShort) > Short.toInt(peak)) {
            peak = sampleShort;
          }
          if (Short.toInt(sampleShort) < Short.toInt(trough)) {
            trough = sampleShort;
          }
        }
        expect(peak).assertEqual(300 as short);
        expect(trough).assertEqual((-120) as short);
        let peakToPeak: int = Short.toInt(peak) - Short.toInt(trough);
        expect(peakToPeak).assertEqual(420);
      }

      {
        let a: short = 100 as short;
        let b: short = 200 as short;
        let result1: short = Short.toShort(a) !== 0 as short ? a : b;
        let result2: short = Short.toShort(0 as short) !== 0 as short ? a : b;
        expect(result1).assertEqual(100 as short);
        expect(result2).assertEqual(200 as short);
      }

      {
        let lookup: Map<int, int> = new Map<int, int>();
        let keys: int[] = [1, 2, 3, 4, 5];
        let values: short[] = [100 as short, 200 as short, 300 as short, 400 as short, 500 as short];
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          lookup.set(keys[i], Short.toInt(Short.toShort(values[i])));
        }
        for (let i: int = 0; i < count; i++) {
          expect(lookup.get(keys[i])).assertEqual(Short.toInt(values[i]));
        }
      }

      {
        let gen0: short = 999 as short;
        let gen1: short = Short.toShort(gen0);
        let gen2: short = Short.toShort(gen1);
        let gen3: short = new Short(gen2).toShort();
        expect(gen0).assertEqual(999 as short);
        expect(gen1).assertEqual(gen0);
        expect(gen2).assertEqual(gen1);
        expect(gen3).assertEqual(gen2);
      }

      {
        let seed: short = 1 as short;
        let count: int = 100;
        for (let i: int = 0; i < count; i++) {
          let next: short = Int.toShort((Short.toInt(seed) * 1103515245 + 12345) & 0x7FFF);
          expect(Short.toShort(next)).assertEqual(next);
          seed = next;
        }
      }

      {
        let x: short = Int.toShort(42);
        let posX: short = x;
        let negOnce: short = Int.toShort(-Short.toInt(x));
        let negNegX: short = Int.toShort(-Short.toInt(negOnce));
        expect(Short.toShort(posX)).assertEqual(Int.toShort(42));
        expect(Short.toShort(negNegX)).assertEqual(Int.toShort(42));
      }

      {
        let sum: int = 0;
        let toShortSum: int = 0;
        for (let v: int = 1; v <= 127; v++) {
          sum += v;
          toShortSum += Short.toInt(Short.toShort(Int.toShort(v)));
        }
        expect(toShortSum).assertEqual(sum);
      }

      {
        let base: Short = new Short(0 as short);
        let chainResults: short[] = [];
        for (let step: int = 0; step < 10; step++) {
          base = base.add(100 as short);
          chainResults.push(Short.toShort(Int.toShort(base)));
        }
        for (let i: int = 0; i < 10; i++) {
          expect(chainResults[i]).assertEqual(Int.toShort((i + 1) * 100));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSHORT_1000
     * @tc.name testShortToShort_merged10
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toShort, including type conversion, equality consistency, sign handling, bitwise operations, and round-trip conversion.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToShort_merged10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let values: short[] = [0 as short, 42 as short, (-99) as short, 1000 as short, (-5000) as short, Short.MAX_VALUE, Short.MIN_VALUE];
        let count: int = 7;
        for (let i: int = 0; i < count; i++) {
          let rt: short = Short.toShort(Int.toShort(Short.toInt(values[i])));
          expect(rt).assertEqual(values[i]);
        }
      }

      {
        let charA: int = Char.toInt(c'A');
        let charB: int = Char.toInt(c'\uFFFF');
        let fromCharA: short = Int.toShort(charA);
        let resultA: short = Short.toShort(fromCharA);
        let fromCharB: short = Int.toShort(charB);
        let resultB: short = Short.toShort(fromCharB);
        expect(resultA).assertEqual(Int.toShort(65));
        expect(resultB).assertEqual((-1) as short);
      }

      {
        let bytePositive: byte = 127 as byte;
        let byteNegative: byte = (-128) as byte;
        let fromBytePos: short = Byte.toShort(bytePositive);
        let fromByteNeg: short = Byte.toShort(byteNegative);
        let resultPos: short = Short.toShort(fromBytePos);
        let resultNeg: short = Short.toShort(fromByteNeg);
        expect(resultPos).assertEqual(127 as short);
        expect(resultNeg).assertEqual((-128) as short);
      }

      {
        let floatVal: float = 42.0f;
        let floatToShortVal: short = Float.toShort(floatVal);
        let result: short = Short.toShort(floatToShortVal);
        expect(result).assertEqual(floatToShortVal);
        expect(result).assertEqual(42 as short);
      }

      {
        let values: short[] = [0 as short, 42 as short, (-1) as short, 255 as short, (-256) as short, Short.MAX_VALUE, Short.MIN_VALUE];
        let count: int = 7;
        for (let i: int = 0; i < count; i++) {
          let andResult: short = Int.toShort(Short.toInt(values[i]) & 0xFFFF);
          let tsResult: short = Short.toShort(andResult);
          expect(tsResult).assertEqual(values[i]);
        }
      }

      {
        let values: short[] = [0 as short, 42 as short, (-99) as short, 1000 as short, Short.MAX_VALUE, Short.MIN_VALUE];
        let count: int = 6;
        for (let i: int = 0; i < count; i++) {
          let orResult: short = Int.toShort(Short.toInt(values[i]) | 0x0000);
          let tsResult: short = Short.toShort(orResult);
          expect(tsResult).assertEqual(values[i]);
        }
      }

      {
        let values: short[] = [0 as short, 42 as short, (-1) as short, 255 as short, 32767 as short, (-32768) as short];
        let count: int = 6;
        for (let i: int = 0; i < count; i++) {
          let xorSelf: short = Int.toShort(Short.toInt(values[i]) ^ Short.toInt(values[i]));
          let tsResult: short = Short.toShort(xorSelf);
          expect(tsResult).assertEqual(0 as short);
        }
      }

      {
        let testValues: short[] = [0 as short, 1 as short, 2 as short, (-1) as short, 42 as short, (-100) as short];
        let count: int = 6;
        for (let i: int = 0; i < count; i++) {
          let notResult: short = Int.toShort(~Short.toInt(testValues[i]));
          let tsResult: short = Short.toShort(notResult);
          let expected: short = Int.toShort(-(Short.toInt(testValues[i]) + 1));
          expect(tsResult).assertEqual(expected);
        }
      }

      {
        let negVal: short = (-256) as short;
        let shiftedRight: short = Int.toShort(Short.toInt(negVal) >> 4);
        let tsResult: short = Short.toShort(shiftedRight);
        expect(tsResult).assertEqual((-16) as short);
        let posVal: short = 1024 as short;
        let shiftedRightPos: short = Int.toShort(Short.toInt(posVal) >> 3);
        expect(Short.toShort(shiftedRightPos)).assertEqual(128 as short);
      }

      {
        let testVal: short = 0x7F80 as short;
        let highByte: short = Int.toShort((Short.toInt(testVal) >>> 8) & 0xFF);
        let tsResult: short = Short.toShort(highByte);
        expect(tsResult).assertEqual(127 as short);
        let negVal: short = (-1) as short;
        let highByteNeg: short = Int.toShort((Short.toInt(negVal) >>> 8) & 0xFF);
        expect(Short.toShort(highByteNeg)).assertEqual(255 as short);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSHORT_1100
     * @tc.name testShortToShort_merged11
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toShort, including type conversion, business scenarios, bitwise operations, equality consistency, and sign handling.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToShort_merged11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let a: short = 0x5555 as short;
        let b: short = 0x3333 as short;
        let ops: short[] = [
          Int.toShort(Short.toInt(a) & Short.toInt(b)),
          Int.toShort(Short.toInt(a) | Short.toInt(b)),
          Int.toShort(Short.toInt(a) ^ Short.toInt(b)),
          Int.toShort(~Short.toInt(a))
        ];
        let expectedIntVals: int[] = [0x1111, 0x7777, 0x6666, -21846];
        let count: int = 4;
        for (let i: int = 0; i < count; i++) {
          let result: short = Short.toShort(ops[i]);
          expect(Short.toInt(result) >= -32768).assertTrue();
          expect(Short.toInt(result) <= 32767).assertTrue();
          expect(Short.toInt(result)).assertEqual(expectedIntVals[i]);
        }
      }

      {
        let posValue: short = 12345 as short;
        expect(Short.toShort(posValue)).assertEqual(Int.toShort(12345));
        expect(Short.toShort(posValue)).assertEqual(Long.toShort(Long.toLong(12345)));
        expect(Short.toShort(posValue)).assertEqual(Float.toShort(12345.0f));
        expect(Short.toShort(posValue)).assertEqual(Double.toShort(12345.0));
        let negValue: short = (-9876) as short;
        expect(Short.toShort(negValue)).assertEqual(Int.toShort(-9876));
        expect(Short.toShort(negValue)).assertEqual(Long.toShort(Long.toLong(-9876)));
        expect(Short.toShort(negValue)).assertEqual(Float.toShort(-9876.0f));
        expect(Short.toShort(negValue)).assertEqual(Double.toShort(-9876.0));
        let byteRangeValue: short = 100 as short;
        expect(Short.toShort(byteRangeValue)).assertEqual(Byte.toShort(Short.toByte(100)));
        let wideValue: short = 300 as short;
        expect(Short.toShort(wideValue)).assertEqual(300 as short);
        expect(Byte.toShort(Short.toByte(300))).assertEqual(44 as short);
      }

      {
        let a: Short = new Short(100 as short);
        let b: Short = new Short(200 as short);
        let sum: Short = a.add(b);
        let tsResult: short = Short.toShort(Int.toShort(sum));
        expect(tsResult).assertEqual(300 as short);
      }

      {
        let hi0: int = 0x12;
        let lo0: int = 0x34;
        let hi1: int = 0x7F;
        let lo1: int = 0xFF;
        let hi2: int = 0x80;
        let lo2: int = 0x00;
        let hi3: int = 0xFF;
        let lo3: int = 0xFE;
        let packedA: short = Short.toShort(Int.toShort((hi0 << 8) | lo0));
        let packedB: short = Short.toShort(Int.toShort((hi1 << 8) | lo1));
        let packedC: short = Short.toShort(Int.toShort((hi2 << 8) | lo2));
        let packedD: short = Short.toShort(Int.toShort((hi3 << 8) | lo3));
        expect(packedA).assertEqual(4660 as short);
        expect(packedB).assertEqual(32767 as short);
        expect(packedC).assertEqual((-32768) as short);
        expect(packedD).assertEqual((-2) as short);
      }

      {
        let clampValue = (val: short): short => {
          let v: short = Short.toShort(val);
          let max: short = Short.MAX_VALUE;
          let min: short = Short.MIN_VALUE;
          if (Short.toInt(v) > Short.toInt(max)) {
            return max;
          }
          if (Short.toInt(v) < Short.toInt(min)) {
            return min;
          }
          return v;
        };
        expect(clampValue(500 as short)).assertEqual(500 as short);
        expect(clampValue(Short.MAX_VALUE)).assertEqual(Short.MAX_VALUE);
        expect(clampValue(Short.MIN_VALUE)).assertEqual(Short.MIN_VALUE);
      }

      {
        let saturatingAdd = (a: short, b: short): short => {
          let ai: int = Short.toInt(Short.toShort(a));
          let bi: int = Short.toInt(Short.toShort(b));
          let sum: int = ai + bi;
          if (sum > Short.toInt(Short.MAX_VALUE)) {
            return Short.MAX_VALUE;
          }
          if (sum < Short.toInt(Short.MIN_VALUE)) {
            return Short.MIN_VALUE;
          }
          return Int.toShort(sum);
        };
        expect(saturatingAdd(100 as short, 200 as short)).assertEqual(300 as short);
        expect(saturatingAdd(Short.MAX_VALUE, 1 as short)).assertEqual(Short.MAX_VALUE);
        expect(saturatingAdd(Short.MIN_VALUE, (-1) as short)).assertEqual(Short.MIN_VALUE);
      }

      {
        let posVal: short = 100 as short;
        let negVal: short = (-100) as short;
        let zeroVal: short = 0 as short;
        let posSign: short = Int.toShort((Short.toInt(Short.toShort(posVal)) >> 15) & 1);
        let negSign: short = Int.toShort((Short.toInt(Short.toShort(negVal)) >> 15) & 1);
        let zeroSign: short = Int.toShort((Short.toInt(Short.toShort(zeroVal)) >> 15) & 1);
        expect(Short.toShort(posSign)).assertEqual(0 as short);
        expect(Short.toShort(negSign)).assertEqual(1 as short);
        expect(Short.toShort(zeroSign)).assertEqual(0 as short);
      }

      {
        let testVal: short = 0x1234 as short;
        let ts: short = Short.toShort(testVal);
        for (let n: int = 0; n < 4; n++) {
          let nibble: short = Int.toShort((Short.toInt(ts) >> (4 * n)) & 0xF);
          let result: short = Short.toShort(nibble);
          expect(result >= 0 as short).assertTrue();
          expect(result <= 15 as short).assertTrue();
        }
        let nibble0: short = Int.toShort((Short.toInt(ts) >> 0) & 0xF);
        let nibble1: short = Int.toShort((Short.toInt(ts) >> 4) & 0xF);
        expect(Short.toShort(nibble0)).assertEqual(4 as short);
        expect(Short.toShort(nibble1)).assertEqual(3 as short);
      }

      {
        let reverseBits = (v: short): short => {
          let vi: int = Short.toInt(v);
          let rev: int = 0;
          for (let b: int = 0; b < 16; b++) {
            rev = (rev << 1) | ((vi >> b) & 1);
          }
          return Int.toShort(rev);
        };
        let original: short = 0x00FF as short;
        let ts: short = Short.toShort(original);
        let reversed: short = reverseBits(ts);
        let result: short = Short.toShort(reversed);
        expect(Short.toInt(result) & 0xFF00).assertEqual(0xFF00);
      }

      {
        let parity = (v: short): short => {
          let vi: int = Short.toInt(Short.toShort(v));
          let count: int = 0;
          for (let b: int = 0; b < 16; b++) {
            if ((vi >> b) & 1) {
              count++;
            }
          }
          return Int.toShort(count % 2);
        };
        expect(Short.toShort(parity(0 as short))).assertEqual(0 as short);
        expect(Short.toShort(parity(1 as short))).assertEqual(1 as short);
        expect(Short.toShort(parity(3 as short))).assertEqual(0 as short);
        expect(Short.toShort(parity((-1) as short))).assertEqual(0 as short);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSHORT_1200
     * @tc.name testShortToShort_merged12
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toShort, including business scenarios, type conversion, division and modulo, bitwise operations, and opposite values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToShort_merged12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let endianSwap = (v: short): short => {
          let vi: int = Short.toInt(Short.toShort(v));
          let lo: int = vi & 0xFF;
          let hi: int = (vi >>> 8) & 0xFF;
          return Int.toShort((lo << 8) | hi);
        };
        let original: short = 0x1234 as short;
        let swapped: short = endianSwap(original);
        let result: short = Short.toShort(swapped);
        expect(result).assertEqual(0x3412 as short);
        let roundtrip: short = endianSwap(swapped);
        expect(Short.toShort(roundtrip)).assertEqual(original);
      }

      {
        let rotateLeft = (v: short, n: int): short => {
          let vi: int = Short.toInt(v) & 0xFFFF;
          let nMod: int = n & 15;
          let result: int = ((vi << nMod) | (vi >>> (16 - nMod))) & 0xFFFF;
          return Int.toShort(result);
        };
        let val: short = Int.toShort(0x8001);
        let ts: short = Short.toShort(val);
        let rotated: short = rotateLeft(ts, 2);
        let result: short = Short.toShort(rotated);
        expect(result).assertEqual(Int.toShort(0x0006));
      }

      {
        let rotateRight = (v: short, n: int): short => {
          let vi: int = Short.toInt(v) & 0xFFFF;
          let nMod: int = n & 15;
          let result: int = (vi >>> nMod) | ((vi << (16 - nMod)) & 0xFFFF);
          return Int.toShort(result);
        };
        let val: short = 0x0006 as short;
        let ts: short = Short.toShort(val);
        let rotated: short = rotateRight(ts, 2);
        let result: short = Short.toShort(rotated);
        expect(result).assertEqual(Int.toShort(0x8001));
      }

      {
        let toGray = (v: short): short => {
          let vi: int = Short.toInt(Short.toShort(v));
          return Int.toShort(vi ^ (vi >>> 1));
        };
        for (let i: int = 0; i <= 15; i++) {
          let val: short = Int.toShort(i);
          let gray: short = toGray(val);
          let result: short = Short.toShort(gray);
          expect(result).assertEqual(gray);
        }
        let g0: short = toGray(0 as short);
        expect(Short.toShort(g0)).assertEqual(0 as short);
        let g1: short = toGray(1 as short);
        expect(Short.toShort(g1)).assertEqual(1 as short);
      }

      {
        let hammingWeight = (v: short): short => {
          let vi: int = Short.toInt(Short.toShort(v)) & 0xFFFF;
          let count: int = 0;
          while (vi !== 0) {
            count++;
            vi = vi & (vi - 1);
          }
          return Int.toShort(count);
        };
        let weights: [short, short][] = [
          [0 as short, 0 as short],
          [1 as short, 1 as short],
          [0xFF as short, 8 as short],
          [Int.toShort(0xFFFF), 16 as short],
          [0x5555 as short, 8 as short]
        ];
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          let hw: short = hammingWeight(weights[i][0]);
          expect(Short.toShort(hw)).assertEqual(weights[i][1]);
        }
      }

      {
        let hammingDistance = (a: short, b: short): short => {
          let ai: int = Short.toInt(Short.toShort(a)) & 0xFFFF;
          let bi: int = Short.toInt(Short.toShort(b)) & 0xFFFF;
          let xorVal: int = ai ^ bi;
          let dist: int = 0;
          while (xorVal !== 0) {
            dist++;
            xorVal = xorVal & (xorVal - 1);
          }
          return Int.toShort(dist);
        };
        expect(Short.toShort(hammingDistance(0 as short, 0 as short))).assertEqual(0 as short);
        expect(Short.toShort(hammingDistance(0 as short, (-1) as short))).assertEqual(16 as short);
        expect(Short.toShort(hammingDistance(0x0F as short, 0xF0 as short))).assertEqual(8 as short);
      }

      {
        let modAdd = (a: short, b: short): short => {
          let ai: int = Short.toInt(Short.toShort(a));
          let bi: int = Short.toInt(Short.toShort(b));
          let modResult: int = ((ai + bi) % 65536 + 65536) % 65536;
          if (modResult > 32767) {
            modResult = modResult - 65536;
          }
          return Int.toShort(modResult);
        };
        let a: short = 30000 as short;
        let b: short = 10000 as short;
        let result: short = modAdd(a, b);
        expect(Short.toShort(result)).assertEqual(result);
      }

      {
        let modInverse = (a: short, m: short): short => {
          let aVal: int = Short.toInt(Short.toShort(a));
          let mVal: int = Short.toInt(Short.toShort(m));
          if (mVal <= 0) {
            return 0 as short;
          }
          let aMod: int = ((aVal % mVal) + mVal) % mVal;
          let m0: int = mVal;
          let x0: int = 0;
          let x1: int = 1;
          while (aMod > 1) {
            let q: int = Double.toInt(Math.floor(aMod / m0));
            let t: int = m0;
            m0 = aMod % m0;
            aMod = t;
            t = x0;
            x0 = x1 - q * x0;
            x1 = t;
          }
          if (aMod == 1) {
            return Int.toShort(((x1 % mVal) + mVal) % mVal);
          }
          return 0 as short;
        };
        let inv: short = modInverse(3 as short, 11 as short);
        let result: short = Short.toShort(inv);
        expect(result).assertEqual(4 as short);
        let check: short = Int.toShort((Short.toInt(result) * 3) % 11);
        expect(check).assertEqual(1 as short);
      }

      {
        let lcg = (seed: short, a: short, c: short): short => {
          let si: int = Short.toInt(Short.toShort(seed));
          let ai: int = Short.toInt(Short.toShort(a));
          let ci: int = Short.toInt(Short.toShort(c));
          return Int.toShort((ai * si + ci) & 0xFFFF);
        };
        let seed: short = 1 as short;
        let generator: short[] = [];
        for (let i: int = 0; i < 10; i++) {
          seed = lcg(seed, 5 as short, 1 as short);
          generator.push(Short.toShort(seed));
        }
        for (let i: int = 0; i < 10; i++) {
          expect(Short.toShort(generator[i])).assertEqual(generator[i]);
        }
        expect(generator[0]).assertEqual(6 as short);
      }

      {
        let sbox: short[] = [];
        for (let i: int = 0; i < 256; i++) {
          let val: short = Int.toShort((i * 7 + 13) % 256);
          sbox.push(val);
        }
        let lookup: short = sbox[0];
        let result: short = Short.toShort(lookup);
        expect(result).assertEqual(13 as short);
        let lookup2: short = sbox[255];
        let result2: short = Short.toShort(lookup2);
        expect(result2).assertEqual(Int.toShort((255 * 7 + 13) % 256));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSHORT_1300
     * @tc.name testShortToShort_merged13
     * @tc.desc CrossTypeRoundTrip / RadixConversion: covers 10 merged test points for Short.toShort, including type conversion, business scenarios, radix conversion, comparison and ordering, and round-trip conversion.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToShort_merged13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let circularAdvance = (index: short, size: short): short => {
          let idx: int = Short.toInt(Short.toShort(index));
          let sz: int = Short.toInt(Short.toShort(size));
          return Int.toShort((idx + 1) % sz);
        };
        let size: short = 8 as short;
        let index: short = 0 as short;
        for (let i: int = 0; i < 16; i++) {
          index = circularAdvance(index, size);
          let result: short = Short.toShort(index);
          expect(result >= 0 as short).assertTrue();
          expect(Short.toInt(result) < 8).assertTrue();
        }
        expect(Short.toShort(circularAdvance(7 as short, 8 as short))).assertEqual(0 as short);
      }

      {
        let triangleWave = (phase: short, amplitude: short): short => {
          let ph: int = Short.toInt(Short.toShort(phase));
          let amp: int = Short.toInt(Short.toShort(amplitude));
          let halfPeriod: int = 16384;
          let rawValue: int = (ph % halfPeriod) * amp / halfPeriod;
          if (ph >= halfPeriod) {
            return Int.toShort(amp - rawValue);
          }
          return Int.toShort(rawValue);
        };
        let amp: short = 100 as short;
        let phase0: short = 0 as short;
        expect(Short.toShort(triangleWave(phase0, amp))).assertEqual(0 as short);
        let phaseHalf: short = 16384 as short;
        expect(Short.toShort(triangleWave(phaseHalf, amp))).assertEqual(100 as short);
      }

      {
        let pwmCompare = (counter: short, threshold: short): short => {
          let cnt: int = Short.toInt(Short.toShort(counter));
          let thr: int = Short.toInt(Short.toShort(threshold));
          if (cnt < thr) {
            return 1 as short;
          }
          return 0 as short;
        };
        let counter: short = 500 as short;
        let threshold: short = 1000 as short;
        expect(Short.toShort(pwmCompare(counter, threshold))).assertEqual(1 as short);
        let counterHigh: short = 1500 as short;
        expect(Short.toShort(pwmCompare(counterHigh, threshold))).assertEqual(0 as short);
      }

      {
        let chipSelect = (address: short, baseAddr: short, chipMask: short): short => {
          let addr: int = Short.toInt(Short.toShort(address));
          let base: int = Short.toInt(Short.toShort(baseAddr));
          let mask: int = Short.toInt(Short.toShort(chipMask));
          let cs: int = (addr & mask) - (base & mask);
          if (cs == 0) {
            return 1 as short;
          }
          return 0 as short;
        };
        let address: short = 0x1000 as short;
        let base: short = 0x1000 as short;
        let mask: short = Int.toShort(0xFF00);
        expect(Short.toShort(chipSelect(address, base, mask))).assertEqual(1 as short);
        let otherAddr: short = 0x2000 as short;
        expect(Short.toShort(chipSelect(otherAddr, base, mask))).assertEqual(0 as short);
      }

      {
        let necEncode = (command: short): short[] => {
          let cmd: int = Short.toInt(Short.toShort(command));
          let cmdLow: int = cmd & 0xFF;
          let cmdInverse: int = (~cmdLow) & 0xFF;
          return [Int.toShort(cmdLow), Int.toShort(cmdInverse)];
        };
        let command: short = 0x12 as short;
        let encoded: short[] = necEncode(command);
        let cmdPart: short = Short.toShort(encoded[0]);
        let invPart: short = Short.toShort(encoded[1]);
        expect(cmdPart).assertEqual(0x12 as short);
        expect(Short.toInt(invPart)).assertEqual((~0x12) & 0xFF);
      }

      {
        let getToneIndex = (row: short, col: short): short => {
          let r: int = Short.toInt(Short.toShort(row));
          let c: int = Short.toInt(Short.toShort(col));
          return Int.toShort(r * 4 + c);
        };
        let index00: short = getToneIndex(0 as short, 0 as short);
        expect(Short.toShort(index00)).assertEqual(0 as short);
        let index33: short = getToneIndex(3 as short, 3 as short);
        expect(Short.toShort(index33)).assertEqual(15 as short);
        let index21: short = getToneIndex(2 as short, 1 as short);
        expect(Short.toShort(index21)).assertEqual(9 as short);
      }

      {
        let crc16Modbus = (data: short[]): short => {
          let crc: int = 0xFFFF;
          for (let i: int = 0; i < data.length; i++) {
            crc = crc ^ (Short.toInt(data[i]) & 0xFF);
            for (let j: int = 0; j < 8; j++) {
              if ((crc & 1) != 0) {
                crc = (crc >>> 1) ^ 0xA001;
              } else {
                crc = crc >>> 1;
              }
            }
          }
          return Int.toShort(crc & 0xFFFF);
        };
        let message: short[] = [
          0x31 as short, 0x32 as short, 0x33 as short, 0x34 as short, 0x35 as short,
          0x36 as short, 0x37 as short, 0x38 as short, 0x39 as short
        ];
        let checksum: short = crc16Modbus(message);
        expect(Short.toShort(checksum)).assertEqual(0x4B37 as short);
        expect(Short.toInt(Short.toShort(checksum)) & 0xFFFF).assertEqual(0x4B37);
      }

      {
        let testVals: short[] = [
          0 as short, 65 as short, 127 as short, 255 as short,
          1000 as short, 0x4E00 as short, 0x7FFF as short
        ];
        for (let i: int = 0; i < testVals.length; i++) {
          let orig: short = testVals[i];
          let ch: char = Short.toChar(orig);
          let charShort: short = Char.toShort(ch);
          let restored: short = Short.toShort(charShort);
          let origUnsigned: int = Short.toInt(orig) & 0xFFFF;
          let restoredUnsigned: int = Short.toInt(restored) & 0xFFFF;
          expect(restoredUnsigned).assertEqual(origUnsigned);
        }
      }

      {
        let hexValue: short = 0xFF as short;
        let octValue: short = 0o77 as short;
        let hexResult: short = Short.toShort(hexValue);
        let octResult: short = Short.toShort(octValue);
        expect(hexResult).assertEqual(255 as short);
        expect(octResult).assertEqual(63 as short);
      }

      {
        let hexVal: short = 0x7F as short;
        let staticResult: short = Short.toShort(hexVal);
        let instanceVal: Short = new Short(hexVal);
        let instanceResult: short = instanceVal.toShort();
        expect(staticResult).assertEqual(127 as short);
        expect(instanceResult).assertEqual(127 as short);
        expect(staticResult).assertEqual(instanceResult);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOSHORT_1400
     * @tc.name testShortToShort_merged14
     * @tc.desc Idempotent / BusinessScenario: covers 9 merged test points for Short.toShort, including type conversion, equality consistency, idempotence, bitwise operations, and business scenarios.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToShort_merged14', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let repeatedInput: short = (-1) as short;
        let firstCallResult: short = Short.toShort(repeatedInput);
        let secondCallResult: short = Short.toShort(repeatedInput);
        let thirdCallResult: short = Short.toShort(repeatedInput);
        expect(firstCallResult).assertEqual(repeatedInput);
        expect(secondCallResult).assertEqual(repeatedInput);
        expect(thirdCallResult).assertEqual(repeatedInput);
        expect(secondCallResult).assertEqual(firstCallResult);
        expect(thirdCallResult).assertEqual(secondCallResult);
      }

      {
        let testValues: short[] = [0 as short, 1 as short, (-1) as short, 256 as short, (-256) as short, 1000 as short, (-1000) as short];
        let caseCount: int = 7;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let sourceValue: short = testValues[caseIndex];
          let boxedInstance: Short = new Short(sourceValue);
          let instanceResult: short = boxedInstance.toShort();
          let staticResult: short = Short.toShort(sourceValue);
          expect(instanceResult).assertEqual(sourceValue);
          expect(staticResult).assertEqual(sourceValue);
          expect(instanceResult).assertEqual(staticResult);
        }
      }

      {
        let boxedInstance: Short = new Short(500 as short);
        let firstCall: short = boxedInstance.toShort();
        let secondCall: short = boxedInstance.toShort();
        let thirdCall: short = boxedInstance.toShort();
        expect(firstCall).assertEqual(500 as short);
        expect(secondCall).assertEqual(firstCall);
        expect(thirdCall).assertEqual(secondCall);
        expect(boxedInstance.toShort()).assertEqual(firstCall);
      }

      {
        let values: short[] = [0 as short, 42 as short, (-100) as short, 500 as short, (-500) as short, Short.MAX_VALUE, Short.MIN_VALUE];
        let caseCount: int = 7;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let originalValue: short = values[caseIndex];
          let instance: Short = new Short(originalValue);
          let instanceShort: short = instance.toShort();
          let staticOfInstance: short = Short.toShort(instanceShort);
          let staticOfOriginal: short = Short.toShort(originalValue);
          expect(staticOfInstance).assertEqual(staticOfOriginal);
        }
      }

      {
        let values: short[] = [0 as short, 42 as short, (-42) as short, Short.MAX_VALUE, Short.MIN_VALUE];
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          let tsResult: short = Short.toShort(values[i]);
          let tiResult: int = new Short(values[i]).toInt();
          let back: short = Int.toShort(tiResult);
          expect(tsResult).assertEqual(back);
        }
      }

      {
        let values: short[] = [0 as short, 100 as short, (-100) as short, Short.MAX_VALUE, Short.MIN_VALUE];
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          let tsResult: short = Short.toShort(values[i]);
          let tlResult: long = new Short(values[i]).toLong();
          let tlLow: int = tlResult.toInt();
          expect(Short.toInt(tsResult)).assertEqual(tlLow);
        }
      }

      {
        let values: short[] = [0 as short, 42 as short, (-100) as short, Short.MAX_VALUE, Short.MIN_VALUE];
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          let ts: short = Short.toShort(values[i]);
          let cmp: int = new Short(ts).compareTo(ts);
          expect(cmp).assertEqual(0);
        }
      }

      {
        let val: short = 0x0001 as short;
        let ts: short = Short.toShort(val);
        for (let n: int = 1; n <= 15; n++) {
          let vi: int = Short.toInt(ts);
          let rotated: short = Int.toShort(((vi << n) | (vi >>> (16 - n))) & 0xFFFF);
          let result: short = Short.toShort(rotated);
          let expected: short = Int.toShort(1 << n);
          expect(result).assertEqual(expected);
        }
      }

      {
        let fromGray = (g: short): short => {
          let gi: int = Short.toInt(Short.toShort(g));
          let mask: int = gi;
          while (mask !== 0) {
            mask = mask >>> 1;
            gi = gi ^ mask;
          }
          return Int.toShort(gi);
        };
        let toGray = (v: short): short => {
          let vi: int = Short.toInt(v);
          return Int.toShort(vi ^ (vi >>> 1));
        };
        for (let i: int = 0; i <= 255; i++) {
          let val: short = Int.toShort(i);
          let gray: short = toGray(val);
          let decoded: short = fromGray(gray);
          let result: short = Short.toShort(decoded);
          expect(result).assertEqual(val);
        }
      }
    });

  });
}