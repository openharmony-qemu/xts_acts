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

function invokeShortToIntInFunction(inputValue: short): int {
  return Short.toInt(inputValue);
}

export default function shortToIntTest(): void {
  describe('ShortToIntTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOINT_0100
     * @tc.name testShortToInt_merged1
     * @tc.desc BoundaryOverflow: covers 10 merged test points for Short.toInt, including type conversion, boundary values, fractions and rounding, wrapping, and sign handling.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToInt_merged1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let maxShortValue: short = Short.MAX_VALUE;
        let actualResult: int = Short.toInt(maxShortValue);
        expect(actualResult).assertEqual(32767);
      }

      {
        let minShortValue: short = Short.MIN_VALUE;
        let actualResult: int = Short.toInt(minShortValue);
        expect(actualResult).assertEqual(-32768);
      }

      {
        let maxAdjacentValue: short = 32766 as short;
        let minAdjacentValue: short = (-32767) as short;
        let maxAdjacentResult: int = Short.toInt(maxAdjacentValue);
        let minAdjacentResult: int = Short.toInt(minAdjacentValue);
        expect(maxAdjacentResult).assertEqual(32766);
        expect(minAdjacentResult).assertEqual(-32767);
      }

      {
        let testValues: short[] = [
          0 as short,
          42 as short,
          (-42) as short,
          32766 as short,
          (-32767) as short,
          Short.MAX_VALUE,
          Short.MIN_VALUE
        ];
        let expectedValues: int[] = [
          0,
          42,
          -42,
          32766,
          -32767,
          32767,
          -32768
        ];
        let caseCount: int = 7;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let boxedValue: Short = new Short(testValues[caseIndex]);
          let instanceResult: int = boxedValue.toInt();
          let staticResult: int = Short.toInt(testValues[caseIndex]);
          expect(instanceResult).assertEqual(expectedValues[caseIndex]);
          expect(staticResult).assertEqual(expectedValues[caseIndex]);
          expect(instanceResult).assertEqual(staticResult);
          expect(boxedValue.toShort()).assertEqual(testValues[caseIndex]);
        }
      }

      {
        let floatSource: short = Float.toShort(123.9f);
        let actualResult: int = Short.toInt(floatSource);
        expect(actualResult).assertEqual(123);
        let negFloatSource: short = Float.toShort(-45.9f);
        expect(Short.toInt(negFloatSource)).assertEqual(-45);
      }

      {
        let doubleSource: short = Double.toShort(999.9);
        let actualResult: int = Short.toInt(doubleSource);
        expect(actualResult).assertEqual(999);
      }

      {
        let values: Short[] = [
          new Short(10000 as short), new Short(15000 as short), new Short(20000 as short), new Short(5000 as short)
        ];
  
        let shortSum: Short = new Short(0 as short);
        for (let v of values) {
          shortSum = shortSum.add(v);
        }
        expect(shortSum.toInt()).assertEqual(-15536);
  
        let intSum: int = 0;
        for (let v of values) {
          intSum += v.toInt();
        }
        expect(intSum).assertEqual(50000);
      }

      {
        let shortData: Short[] = [
          new Short(-32768 as short), new Short(-1 as short), new Short(0 as short),
          new Short(1 as short), new Short(32767 as short)
        ];
        let intArray: int[] = [];
        for (let s of shortData) {
          intArray.push(s.toInt());
        }
        expect(intArray[0]).assertEqual(-32768);
        expect(intArray[2]).assertEqual(0);
        expect(intArray[4]).assertEqual(32767);
  
        for (let i: int = 0; i < shortData.length; i++) {
          expect(shortData[i].toInt()).assertEqual(shortData[i].toLong().toInt());
        }
        for (let i: int = 0; i < shortData.length; i++) {
          let intVal: int = intArray[i];
          let floatVal: float = shortData[i].toFloat();
          expect(intVal >= 0).assertEqual(floatVal >= 0);
        }
      }

      {
        let values: short[] = [
          0 as short, 1 as short, 42 as short, 127 as short, 128 as short,
          1000 as short, 16384 as short, Short.MAX_VALUE
        ];
        for (let i: int = 0; i < values.length; i++) {
          let posResult: int = Short.toInt(values[i]);
          let negInput: short = Int.toShort(-Int.toInt(values[i]));
          let negResult: int = Short.toInt(negInput);
          expect(-posResult).assertEqual(negResult);
        }
      }

      {
        let maxShort: Short = new Short(Short.MAX_VALUE);
        let one: Short = new Short(1 as short);
        let wrapped: Short = maxShort.add(one);
        expect(wrapped.toInt()).assertEqual(-32768);
        expect(Short.toInt(wrapped.toShort())).assertEqual(-32768);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOINT_0200
     * @tc.name testShortToInt_merged2
     * @tc.desc BoundaryOverflow: covers 10 merged test points for Short.toInt, including type conversion, wrapping, boundary values, overflow, and fractions and rounding.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToInt_merged2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let minShort: Short = new Short(Short.MIN_VALUE);
        let one: Short = new Short(1 as short);
        let wrapped: Short = minShort.sub(one);
        expect(wrapped.toInt()).assertEqual(32767);
        expect(Short.toInt(wrapped.toShort())).assertEqual(32767);
      }

      {
        let minValue: short = Short.MIN_VALUE;
        let negated: short = Int.toShort(-Int.toInt(minValue));
        let result: int = Short.toInt(negated);
        expect(result).assertEqual(-32768);
        expect(negated).assertEqual(Short.MIN_VALUE);
      }

      {
        let startVal: short = 30000 as short;
        let addVal: short = 5000 as short;
        let addVal2: short = 3000 as short;
        let sum1: short = Int.toShort(startVal + addVal);
        let sum2: short = Int.toShort(sum1 + addVal2);
        let intSum1: int = Short.toInt(sum1);
        let intSum2: int = Short.toInt(sum2);
        expect(sum1).assertEqual(-30536);
        expect(sum2).assertEqual(-27536);
        expect(intSum1).assertEqual(Short.toInt(Int.toShort(30000 + 5000)));
        expect(intSum2).assertEqual(Short.toInt(Int.toShort(30000 + 5000 + 3000)));
        expect(intSum1 !== 35000).assertTrue();
        expect(intSum2 !== 38000).assertTrue();
      }

      {
        let a: short = 1000 as short;
        let b: short = 100 as short;
        let product: short = Int.toShort(a * b);
        let intResult: int = Short.toInt(product);
        expect(intResult).assertEqual(-31072);
        expect(intResult !== 100000).assertTrue();
      }

      {
        let dividend: Short = new Short(100 as short);
        let divisor: Short = new Short(3 as short);
        let quotient: Short = dividend.div(divisor);
        let intQuotient: int = quotient.toInt();
        let intDividend: int = dividend.toInt();
        let intDivisor: int = divisor.toInt();
        let expected: int = intDividend / intDivisor;
        expect(intQuotient).assertEqual(expected);
        expect(intQuotient).assertEqual(33);
  
        let negDividend: Short = new Short((-100) as short);
        let negQuotient: Short = negDividend.div(divisor);
        expect(negQuotient.toInt()).assertEqual(-33);
      }

      {
        let testInts: int[] = [32768, 32769, 65535, 65536, -32769, -65536, 0xFFFF, 0x1FFFF];
        let expectedTruncated: int[] = [-32768, -32767, -1, 0, 32767, 0, -1, -1];
        for (let i: int = 0; i < testInts.length; i++) {
          let truncated: short = Int.toShort(testInts[i]);
          let result: int = Short.toInt(truncated);
          expect(result).assertEqual(expectedTruncated[i]);
        }
      }

      {
        let overflowNeg: int[] = [-32769, -32770, -40000, -65535, -65536, -65537];
        let expectedIntVals: int[] = [32767, 32766, 25536, 1, 0, -1];
        for (let i: int = 0; i < overflowNeg.length; i++) {
          let shortVal: short = Int.toShort(overflowNeg[i]);
          let intVal: int = Short.toInt(shortVal);
          expect(intVal).assertEqual(expectedIntVals[i]);
        }
      }

      {
        let parsedBinary: int = Int.parseInt("1111111100000000", 2);
        let shortVal: short = Int.toShort(parsedBinary);
        expect(Short.toInt(shortVal)).assertEqual(-256);
      }

      {
        let parsedOctalMax: int = Int.parseInt("77777", 8);
        let shortMax: short = Int.toShort(parsedOctalMax);
        expect(Short.toInt(shortMax)).assertEqual(32767);
        let parsedOctalMin: int = Int.parseInt("100000", 8);
        let shortMin: short = Int.toShort(parsedOctalMin);
        expect(Short.toInt(shortMin)).assertEqual(-32768);
      }

      {
        let hexBoundary: int[] = [0x0000, 0x0001, 0x3FFF, 0x7FFF, 0x8000, 0x8001, 0xFFFF];
        let expectedVals: int[] = [0, 1, 16383, 32767, -32768, -32767, -1];
        for (let i: int = 0; i < hexBoundary.length; i++) {
          let shortVal: short = Int.toShort(hexBoundary[i]);
          let intVal: int = Short.toInt(shortVal);
          expect(intVal).assertEqual(expectedVals[i]);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOINT_0300
     * @tc.name testShortToInt_merged3
     * @tc.desc BoundaryOverflow / CrossTypeRoundTrip: covers 10 merged test points for Short.toInt, including type conversion, boundary values, positive values, negative values, and equality consistency.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToInt_merged3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let boundaries: Short[] = [
          new Short(Short.MIN_VALUE), new Short((-32767) as short), new Short((-1) as short),
          new Short(0 as short), new Short(1 as short), new Short(32766 as short),
          new Short(Short.MAX_VALUE)
        ];
        for (let i: int = 0; i < boundaries.length; i++) {
          let directInt: int = boundaries[i].toInt();
          let viaLong: int = boundaries[i].toLong().toInt();
          expect(directInt).assertEqual(viaLong);
        }
      }

      {
        let signedValues: short[] = [(-100) as short, (-1) as short, 0 as short, 1 as short, 100 as short,
          (-16384) as short, 16384 as short, Short.MIN_VALUE];
        for (let i: int = 0; i < signedValues.length; i++) {
          let intResult: int = Short.toInt(signedValues[i]);
          let absInt: int = Math.abs(intResult);
          let expectedAbs: int = intResult >= 0 ? intResult : -intResult;
          expect(absInt).assertEqual(expectedAbs);
        }
      }

      {
        let boundaries: int[] = [-512, -257, -256, -255, -1, 0, 1, 255, 256, 257, 511, 512, 513];
        let expectedVals: int[] = [-512, -257, -256, -255, -1, 0, 1, 255, 256, 257, 511, 512, 513];
        for (let i: int = 0; i < boundaries.length; i++) {
          let shortVal: short = Int.toShort(boundaries[i]);
          let result: int = Short.toInt(shortVal);
          expect(result).assertEqual(expectedVals[i]);
        }
      }

      {
        let pairs: short[][] = [
          [10 as short, 20 as short],
          [100 as short, 200 as short],
          [(-10) as short, 30 as short],
          [(-50) as short, (-100) as short]
        ];
        for (let i: int = 0; i < pairs.length; i++) {
          let a: short = pairs[i][0];
          let b: short = pairs[i][1];
          let sumShort: short = Int.toShort(a + b);
          let sumToInt: int = Short.toInt(sumShort);
          let individualSum: int = Short.toInt(a) + Short.toInt(b);
          expect(sumToInt).assertEqual(individualSum);
        }
      }

      {
        let absMinVal: int = 32768;
        expect(absMinVal).assertEqual(32768);
        let shortVal: short = Short.MIN_VALUE;
        let toIntResult: int = Short.toInt(shortVal);
        expect(toIntResult).assertEqual(-32768);
        expect(Math.abs(toIntResult)).assertEqual(32768);
      }

      {
        let blockSize: int = 256;
        let capacity: int = 4096;
        let pool: int[] = Array.create<int>(capacity, 0);
        let lastOffset: int = 0;
        for (let blockIndex: int = 1; blockIndex <= 8; blockIndex++) {
          let offset: int = Short.toInt(Int.toShort(blockIndex)) * blockSize;
          expect(offset).assertEqual(blockIndex * blockSize);
          expect(offset + blockSize <= capacity).assertTrue();
          pool[offset] = 1;
          lastOffset = offset;
        }
        expect(pool[256]).assertEqual(1);
        expect(pool[lastOffset]).assertEqual(1);
        expect(pool[0]).assertEqual(0);
        expect(pool[lastOffset + blockSize]).assertEqual(0);
      }

      {
        let zeroValue: short = 0 as short;
        let actualResult: int = Short.toInt(zeroValue);
        expect(actualResult).assertEqual(0);
      }

      {
        let actualResult: int = Short.toInt(42 as short);
        expect(actualResult).assertEqual(42);
      }

      {
        let negativeValue: short = (-42) as short;
        let actualResult: int = Short.toInt(negativeValue);
        expect(actualResult).assertEqual(-42);
      }

      {
        let testValues: short[] = [1 as short, 127 as short, (-1) as short, (-128) as short];
        let expectedValues: int[] = [1, 127, -1, -128];
        let caseCount: int = 4;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let actualResult: int = Short.toInt(testValues[caseIndex]);
          expect(actualResult).assertEqual(expectedValues[caseIndex]);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOINT_0400
     * @tc.name testShortToInt_merged4
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toInt, including type conversion, business scenarios, negative values, positive values, and zero values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToInt_merged4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let testValues: short[] = [
          Short.MIN_VALUE,
          (-16384) as short,
          0 as short,
          16384 as short,
          Short.MAX_VALUE
        ];
        let expectedValues: int[] = [
          -32768,
          -16384,
          0,
          16384,
          32767
        ];
        let caseCount: int = 5;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let actualResult: int = Short.toInt(testValues[caseIndex]);
          expect(actualResult).assertEqual(expectedValues[caseIndex]);
        }
      }

      {
        let zeroValue: short = 0 as short;
        let negativeValue: short = (-1) as short;
        let positiveValue: short = 255 as short;
        let zeroResult: int = Short.toInt(zeroValue);
        let negativeResult: int = Short.toInt(negativeValue);
        let positiveResult: int = Short.toInt(positiveValue);
        let repeatedZeroResult: int = Short.toInt(zeroValue);
        let repeatedPositiveResult: int = Short.toInt(positiveValue);
        expect(zeroResult).assertEqual(0);
        expect(negativeResult).assertEqual(-1);
        expect(positiveResult).assertEqual(255);
        expect(repeatedZeroResult).assertEqual(zeroResult);
        expect(repeatedPositiveResult).assertEqual(positiveResult);
      }

      {
        let testValues: short[] = [
          1 as short,
          10 as short,
          100 as short,
          500 as short,
          1000 as short,
          5000 as short,
          10000 as short,
          20000 as short,
          30000 as short,
          Short.MAX_VALUE
        ];
        let expectedValues: int[] = [
          1,
          10,
          100,
          500,
          1000,
          5000,
          10000,
          20000,
          30000,
          32767
        ];
        let caseCount: int = testValues.length;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let actualResult: int = Short.toInt(testValues[caseIndex]);
          expect(actualResult).assertEqual(expectedValues[caseIndex]);
        }
      }

      {
        let testValues: short[] = [
          (-1) as short,
          (-10) as short,
          (-100) as short,
          (-500) as short,
          (-1000) as short,
          (-5000) as short,
          (-10000) as short,
          (-20000) as short,
          (-30000) as short,
          Short.MIN_VALUE
        ];
        let expectedValues: int[] = [
          -1,
          -10,
          -100,
          -500,
          -1000,
          -5000,
          -10000,
          -20000,
          -30000,
          -32768
        ];
        let caseCount: int = testValues.length;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let actualResult: int = Short.toInt(testValues[caseIndex]);
          expect(actualResult).assertEqual(expectedValues[caseIndex]);
        }
      }

      {
        let testValues: short[] = [
          (-3) as short,
          (-2) as short,
          (-1) as short,
          0 as short,
          1 as short,
          2 as short,
          3 as short
        ];
        let expectedValues: int[] = [
          -3,
          -2,
          -1,
          0,
          1,
          2,
          3
        ];
        let caseCount: int = testValues.length;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let actualResult: int = Short.toInt(testValues[caseIndex]);
          expect(actualResult).assertEqual(expectedValues[caseIndex]);
        }
      }

      {
        let parsedPositive: int = Int.parseInt("2468", 10);
        let positiveShort: short = Int.toShort(parsedPositive);
        let positiveResult: int = Short.toInt(positiveShort);
        expect(positiveResult).assertEqual(2468);
  
        let parsedZero: int = Int.parseInt("0", 10);
        let zeroShort: short = Int.toShort(parsedZero);
        let zeroResult: int = Short.toInt(zeroShort);
        expect(zeroResult).assertEqual(0);
      }

      {
        let parsedValue: int = Int.parseInt("-1357", 10);
        let shortValue: short = Int.toShort(parsedValue);
        let actualResult: int = Short.toInt(shortValue);
        expect(actualResult).assertEqual(-1357);
      }

      {
        let seed: short = 6 as short;
        let n: int = Short.toInt(seed);
        let steps: int = 0;
        while (n > 1) {
          if (n % 2 === 0) {
            n = n / 2;
          } else {
            n = 3 * n + 1;
          }
          steps++;
        }
        expect(steps).assertEqual(8);
        let seedNine: short = 9 as short;
        let m: int = Short.toInt(seedNine);
        let stepsNine: int = 0;
        while (m > 1) {
          if (m % 2 === 0) {
            m = m / 2;
          } else {
            m = 3 * m + 1;
          }
          stepsNine++;
        }
        expect(stepsNine).assertEqual(19);
      }

      {
        let a: short = 0x5555 as short;
        let v: int = Short.toInt(a);
        let reversed: int = 0;
        for (let i: int = 0; i < 16; i++) {
          reversed = (reversed << 1) | (v & 1);
          v = v >> 1;
        }
        expect(reversed).assertEqual(43690);
        let b: short = 1 as short;
        let v2: int = Short.toInt(b);
        let reversed2: int = 0;
        for (let j: int = 0; j < 16; j++) {
          reversed2 = (reversed2 << 1) | (v2 & 1);
          v2 = v2 >> 1;
        }
        expect(reversed2).assertEqual(32768);
      }

      {
        let negativeValues: short[] = [
          (-50) as short,
          (-200) as short,
          (-999) as short,
          (-5000) as short,
          (-12345) as short,
          Short.MIN_VALUE
        ];
        let expectedValues: int[] = [
          -50,
          -200,
          -999,
          -5000,
          -12345,
          -32768
        ];
        let caseCount: int = negativeValues.length;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let actualResult: int = Short.toInt(negativeValues[caseIndex]);
          expect(actualResult).assertEqual(expectedValues[caseIndex]);
          expect(actualResult < 0).assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOINT_0500
     * @tc.name testShortToInt_merged5
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toInt, including type conversion, sign handling, loop accumulation, positive values, and division and modulo.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToInt_merged5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let positiveValues: short[] = [
          50 as short,
          200 as short,
          999 as short,
          5000 as short,
          12345 as short,
          Short.MAX_VALUE
        ];
        let expectedValues: int[] = [
          50,
          200,
          999,
          5000,
          12345,
          32767
        ];
        let caseCount: int = positiveValues.length;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let actualResult: int = Short.toInt(positiveValues[caseIndex]);
          expect(actualResult).assertEqual(expectedValues[caseIndex]);
          expect(actualResult >= 0).assertTrue();
        }
      }

      {
        let operandA: short = 300 as short;
        let operandB: short = 400 as short;
        let addResult: short = Int.toShort(operandA + operandB);
        let actualResult: int = Short.toInt(addResult);
        expect(actualResult).assertEqual(700);
      }

      {
        let operandA: short = 1000 as short;
        let operandB: short = 250 as short;
        let subResult: short = Int.toShort(operandA - operandB);
        let actualResult: int = Short.toInt(subResult);
        expect(actualResult).assertEqual(750);
      }

      {
        let operandA: short = 40 as short;
        let operandB: short = 5 as short;
        let mulResult: short = Int.toShort(operandA * operandB);
        let actualResult: int = Short.toInt(mulResult);
        expect(actualResult).assertEqual(200);
      }

      {
        let operandA: short = 900 as short;
        let operandB: short = 3 as short;
        let divResult: short = Int.toShort(operandA / operandB);
        let actualResult: int = Short.toInt(divResult);
        expect(actualResult).assertEqual(300);
      }

      {
        let shortValue: short = 12345 as short;
        let intResult: int = Short.toInt(shortValue);
        let longResult: long = Long.toLong(intResult);
        expect(longResult).assertEqual(Long.toLong(12345));
      }

      {
        let byteSource: short = Byte.toShort(100 as byte);
        let actualResult: int = Short.toInt(byteSource);
        expect(actualResult).assertEqual(100);
        let negByteSource: short = Byte.toShort((-100) as byte);
        expect(Short.toInt(negByteSource)).assertEqual(-100);
      }

      {
        let dataArray: int[] = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100];
        let baseOffset: Short = new Short(3 as short);
        let stride: Short = new Short(2 as short);
        let idx1: int = baseOffset.toInt();
        let idx2: int = Short.toInt(baseOffset.add(stride));
        let idx3: int = Short.toInt(baseOffset.add(stride.mul(new Short(2 as short))));
  
        expect(dataArray[idx1]).assertEqual(40);
        expect(dataArray[idx2]).assertEqual(60);
        expect(dataArray[idx3]).assertEqual(80);
      }

      {
        let nodeId: Short = new Short(10 as short);
        let sequenceId: Short = new Short(Int.toShort(0x4A3F));
        let nodeInt: int = nodeId.toInt();
        let seqInt: int = sequenceId.toInt();
        let compositeId: int = (nodeInt << 16) | (seqInt & 0xFFFF);
        expect(compositeId).assertEqual((10 << 16) | 0x4A3F);
  
        let extractedNode: int = (compositeId >> 16) & 0xFFFF;
        let extractedSeq: int = compositeId & 0xFFFF;
        expect(extractedNode).assertEqual(10);
        expect(extractedSeq).assertEqual(0x4A3F);
      }

      {
        let original: Short = new Short(-12345 as short);
        let intVal: int = original.toInt();
        let longVal: long = original.toLong();
        let intFromLong: int = longVal.toInt();
        let shortFromInt: Short = new Short(Int.toShort(intFromLong));
        expect(intVal).assertEqual(-12345);
        expect(longVal.toInt()).assertEqual(-12345);
        expect(intFromLong).assertEqual(-12345);
        expect(shortFromInt.equals(original)).assertTrue();
  
        let negShort: Short = new Short(-1 as short);
        expect(negShort.toInt()).assertEqual(-1);
        expect(negShort.toLong().toInt()).assertEqual(-1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOINT_0600
     * @tc.name testShortToInt_merged6
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toInt, including type conversion, bitwise operations, containers and references, comparison and ordering, and negative values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToInt_merged6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const STATE_IDLE: Short = new Short(0 as short);
        const STATE_RUNNING: Short = new Short(1 as short);
        const STATE_PAUSED: Short = new Short(2 as short);
        const STATE_STOPPED: Short = new Short(3 as short);
  
        let handlers: string[] = ['IdleHandler', 'RunningHandler', 'PausedHandler', 'StoppedHandler'];
        let currentState: Short = STATE_IDLE;
        expect(handlers[currentState.toInt()]).assertEqual('IdleHandler');
        let transitions: Short[] = [STATE_RUNNING, STATE_PAUSED, STATE_RUNNING, STATE_STOPPED];
        let expectedHandlers: string[] = ['RunningHandler', 'PausedHandler', 'RunningHandler', 'StoppedHandler'];
        for (let i: int = 0; i < transitions.length; i++) {
          currentState = transitions[i];
          expect(handlers[currentState.toInt()]).assertEqual(expectedHandlers[i]);
        }
        expect(currentState.equals(STATE_STOPPED)).assertTrue();
      }

      {
        let categorySum: Map<int, int> = new Map<int, int>();
  
        let records: [int, int][] = [
          [1, 10000], [2, 20000], [1, 15000], [2, 10000], [1, 5000]
        ];
  
        for (let i: int = 0; i < records.length; i++) {
          let cat: int = records[i][0];
          let val: int = records[i][1];
          let sCat: Short = new Short(Int.toShort(cat));
          let key: int= sCat.toInt();
          let current: int | undefined = categorySum.get(key);
          if (current !== undefined) {
            categorySum.set(key, current + val);
          } else {
            categorySum.set(key, val);
          }
        }
  
        expect(categorySum.get(1)).assertEqual(30000);
        expect(categorySum.get(2)).assertEqual(30000);
  
        let count1: int = records.filter(r => r[0] === 1).length;
        let total1: int | undefined = categorySum.get(1);
        expect(total1).assertEqual(30000);
        let avg1: double = Int.toDouble(total1!) / count1;
        expect(avg1).assertEqual(10000.0);
      }

      {
        let rawData: Short[] = [
          new Short(500 as short), new Short(200 as short), new Short(500 as short),
          new Short(800 as short), new Short(300 as short), new Short(200 as short), new Short(700 as short)
        ];
  
        let intSet: Set<int> = new Set<int>();
        for (let s of rawData) {
          intSet.add(s.toInt());
        }
  
        let sortedInts: int[] = [];
        intSet.forEach((v): void => { sortedInts.push(v); });
        sortedInts.sort();
  
        expect(sortedInts.length).assertEqual(5);
  
        let mid: int = sortedInts.length >> 1;
        let median: double = sortedInts.length % 2 === 1
          ? Int.toDouble(sortedInts[mid])
          : (sortedInts[mid - 1] + sortedInts[mid]) / 2.0;
        expect(median).assertEqual(500.0);
      }

      {
        let sortedValues: short[] = [
          Short.MIN_VALUE, (-16384) as short, (-1000) as short, (-1) as short,
          0 as short, 1 as short, 1000 as short, 16384 as short, Short.MAX_VALUE
        ];
        let expectedInts: int[] = [-32768, -16384, -1000, -1, 0, 1, 1000, 16384, 32767];
        for (let i: int = 0; i < sortedValues.length; i++) {
          expect(Short.toInt(sortedValues[i])).assertEqual(expectedInts[i]);
        }
      }

      {
        let a: short = 0x7FFF as short;
        let b: short = 0x00FF as short;
        let intA: int = Short.toInt(a);
        let intB: int = Short.toInt(b);
        let andResult: int = intA & intB;
        expect(andResult).assertEqual(0xFF);
        let andResult2: int = intA & 0x7F00;
        expect(andResult2).assertEqual(0x7F00);
      }

      {
        let highPart: short = 0x7F00 as short;
        let lowPart: short = 0x00FF as short;
        let highInt: int = Short.toInt(highPart);
        let lowInt: int = Short.toInt(lowPart);
        let combined: int = highInt | lowInt;
        expect(combined).assertEqual(0x7FFF);
      }

      {
        let value: short = 0x3C3C as short;
        let mask: int = 0xFFFF;
        let intVal: int = Short.toInt(value);
        let xored: int = intVal ^ mask;
        let doubleXored: int = xored ^ mask;
        expect(doubleXored).assertEqual(intVal);
        expect(xored !== intVal).assertTrue();
      }

      {
        let negVal: short = (-256) as short;
        let posVal: short = 256 as short;
        let negInt: int = Short.toInt(negVal);
        let posInt: int = Short.toInt(posVal);
        let negShifted: int = negInt >> 4;
        let posShifted: int = posInt >> 4;
        expect(negShifted).assertEqual(-16);
        expect(posShifted).assertEqual(16);
      }

      {
        let testValues: short[] = [100 as short, 255 as short, 1000 as short, (-100) as short, (-255) as short];
        let divisors: int[] = [3, 7, 17];
        let expectedRemainders: int[][] = [
          [1, 2, 15], [0, 3, 0], [1, 6, 14], [-1, -2, -15], [0, -3, 0]
        ];
        for (let i: int = 0; i < testValues.length; i++) {
          let intVal: int = Short.toInt(testValues[i]);
          for (let j: int = 0; j < divisors.length; j++) {
            let remainder: int = intVal % divisors[j];
            expect(remainder).assertEqual(expectedRemainders[i][j]);
          }
        }
      }

      {
        let a: short = 10 as short;
        let b: short = 20 as short;
        let c: short = 5 as short;
        let intA: int = Short.toInt(a);
        let intB: int = Short.toInt(b);
        let intC: int = Short.toInt(c);
        let result1: int = intA + intB * intC;
        let result2: int = (intA + intB) * intC;
        let result3: int = intA << 2 + intC;
        expect(result1).assertEqual(10 + 20 * 5);
        expect(result2).assertEqual((10 + 20) * 5);
        expect(result3).assertEqual(10 << (2 + 5));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOINT_0700
     * @tc.name testShortToInt_merged7
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toInt, including type conversion, negative values, boundary values, and containers and references.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToInt_merged7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let expectedPowers: int[] = [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384];
        for (let i: int = 0; i < expectedPowers.length; i++) {
          let shortVal: short = Int.toShort(expectedPowers[i]);
          let result: int = Short.toInt(shortVal);
          expect(result).assertEqual(expectedPowers[i]);
        }
        for (let i: int = 1; i < expectedPowers.length; i++) {
          let shortVal: short = Int.toShort(expectedPowers[i - 1] * 2);
          expect(Short.toInt(shortVal)).assertEqual(expectedPowers[i]);
        }
      }

      {
        let powersOfTen: short[] = [1 as short, 10 as short, 100 as short, 1000 as short, 10000 as short];
        let expected: int[] = [1, 10, 100, 1000, 10000];
        for (let i: int = 0; i < powersOfTen.length; i++) {
          expect(Short.toInt(powersOfTen[i])).assertEqual(expected[i]);
        }
        for (let i: int = 1; i < powersOfTen.length; i++) {
          let ratio: int = Short.toInt(powersOfTen[i]) / Short.toInt(powersOfTen[i - 1]);
          expect(ratio).assertEqual(10);
        }
      }

      {
        let fibExpected: int[] = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377,
          610, 987, 1597, 2584, 4181, 6765, 10946, 17711, 28657];
        for (let i: int = 0; i < fibExpected.length; i++) {
          let shortVal: short = Int.toShort(fibExpected[i]);
          let result: int = Short.toInt(shortVal);
          expect(result).assertEqual(fibExpected[i]);
        }
        for (let i: int = 2; i < fibExpected.length; i++) {
          let fn2: int = Short.toInt(Int.toShort(fibExpected[i]));
          let fn1: int = Short.toInt(Int.toShort(fibExpected[i - 1]));
          let fn0: int = Short.toInt(Int.toShort(fibExpected[i - 2]));
          expect(fn2).assertEqual(fn1 + fn0);
        }
      }

      {
        let factorials: int[] = [1, 1, 2, 6, 24, 120, 720, 5040];
        for (let i: int = 0; i < factorials.length; i++) {
          let shortVal: short = Int.toShort(factorials[i]);
          let result: int = Short.toInt(shortVal);
          expect(result).assertEqual(factorials[i]);
        }
        for (let i: int = 2; i < factorials.length; i++) {
          let fn: int = Short.toInt(Int.toShort(factorials[i]));
          let fn1: int = Short.toInt(Int.toShort(factorials[i - 1]));
          expect(fn).assertEqual(fn1 * i);
        }
      }

      {
        for (let n: int = 1; n <= 20; n++) {
          let triangular: int = n * (n + 1) / 2;
          let shortVal: short = Int.toShort(triangular);
          let result: int = Short.toInt(shortVal);
          expect(result).assertEqual(triangular);
        }
      }

      {
        for (let n: int = 1; n <= 20; n++) {
          let square: int = n * n;
          let shortVal: short = Int.toShort(square);
          let result: int = Short.toInt(shortVal);
          expect(result).assertEqual(square);
        }
      }

      {
        let mersenne: int[] = [];
        for (let n: int = 1; n <= 14; n++) {
          let val: int = (1 << n) - 1;
          mersenne.push(val);
        }
        for (let i: int = 0; i < mersenne.length; i++) {
          let shortVal: short = Int.toShort(mersenne[i]);
          expect(Short.toInt(shortVal)).assertEqual(mersenne[i]);
        }
      }

      {
        let negPowers: int[] = [-1, -2, -4, -8, -16, -32, -64, -128, -256, -512, -1024, -2048, -4096, -8192, -16384];
        for (let i: int = 0; i < negPowers.length; i++) {
          let shortVal: short = Int.toShort(negPowers[i]);
          let result: int = Short.toInt(shortVal);
          expect(result).assertEqual(negPowers[i]);
        }
      }

      {
        let endpointA: Short = new Short(100 as short);
        let endpointB: Short = new Short(200 as short);
        let intA: int = endpointA.toInt();
        let intB: int = endpointB.toInt();
        let midpoint: double = (intA + intB) / 2.0;
        expect(midpoint).assertEqual(150.0);
        let quarterPoint: double = intA + (intB - intA) * 0.25;
        expect(quarterPoint).assertEqual(125.0);
        let threeQuarterPoint: double = intA + (intB - intA) * 0.75;
        expect(threeQuarterPoint).assertEqual(175.0);
      }

      {
        let values: Short[] = [
          new Short(50 as short), new Short(200 as short), new Short((-100) as short),
          new Short(0 as short), new Short(Short.MAX_VALUE), new Short(Short.MIN_VALUE),
          new Short(150 as short)
        ];
        let minVal: int = values[0].toInt();
        let maxVal: int = values[0].toInt();
        for (let i: int = 1; i < values.length; i++) {
          let intVal: int = values[i].toInt();
          if (intVal < minVal) { minVal = intVal; }
          if (intVal > maxVal) { maxVal = intVal; }
        }
        expect(minVal).assertEqual(-32768);
        expect(maxVal).assertEqual(32767);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOINT_0800
     * @tc.name testShortToInt_merged8
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toInt, including type conversion, comparison and ordering, containers and references, business scenarios, and sliding window.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToInt_merged8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let inputMin: int = 0;
        let inputMax: int = 100;
        let outputMin: int = 10;
        let outputMax: int = 50;
        let testStops: short[] = [0 as short, 25 as short, 50 as short, 75 as short, 100 as short];
        let expectedMapped: int[] = [10, 20, 30, 40, 50];
        for (let i: int = 0; i < testStops.length; i++) {
          let intVal: int = Short.toInt(testStops[i]);
          let mapped: int = outputMin + Int.toShort((intVal - inputMin) * (outputMax - outputMin) / (inputMax - inputMin));
          expect(mapped).assertEqual(expectedMapped[i]);
        }
      }

      {
        let data: Short[] = [
          new Short(500 as short), new Short(100 as short), new Short(300 as short),
          new Short(200 as short), new Short(400 as short)
        ];
        for (let i: int = 0; i < data.length - 1; i++) {
          for (let j: int = 0; j < data.length - 1 - i; j++) {
            if (data[j].toInt() > data[j + 1].toInt()) {
              let temp: Short = data[j];
              data[j] = data[j + 1];
              data[j + 1] = temp;
            }
          }
        }
        let expected: int[] = [100, 200, 300, 400, 500];
        for (let i: int = 0; i < data.length; i++) {
          expect(data[i].toInt()).assertEqual(expected[i]);
        }
      }

      {
        let samples: Short[] = [
          new Short(1 as short), new Short(2 as short), new Short(1 as short),
          new Short(3 as short), new Short(2 as short), new Short(1 as short)
        ];
        let freq: Map<int, int> = new Map<int, int>();
        for (let i: int = 0; i < samples.length; i++) {
          let key: int = samples[i].toInt();
          let current: int | undefined = freq.get(key);
          freq.set(key, current !== undefined ? current + 1 : 1);
        }
        expect(freq.get(1)).assertEqual(3);
        expect(freq.get(2)).assertEqual(2);
        expect(freq.get(3)).assertEqual(1);
      }

      {
        let thresholds: int[] = [0, 100, 500, 1000];
        let levels: string[] = ['LOW_NEGATIVE', 'LOW', 'MEDIUM', 'HIGH', 'VERY_HIGH'];
        let testValues: Short[] = [
          new Short((-50) as short), new Short(50 as short), new Short(300 as short),
          new Short(800 as short), new Short(2000 as short)
        ];
        let expectedLevels: string[] = ['LOW_NEGATIVE', 'LOW', 'MEDIUM', 'HIGH', 'VERY_HIGH'];
        for (let i: int = 0; i < testValues.length; i++) {
          let intVal: int = testValues[i].toInt();
          let levelIndex: int = 0;
          for (let t: int = 0; t < thresholds.length; t++) {
            if (intVal >= thresholds[t]) { levelIndex = t + 1; }
          }
          expect(levels[levelIndex]).assertEqual(expectedLevels[i]);
        }
      }

      {
        let data: Short[] = [
          new Short(10 as short), new Short(20 as short), new Short(30 as short),
          new Short(40 as short), new Short(50 as short)
        ];
        let windowSize: int = 3;
        let movingAvgs: double[] = [];
        for (let i: int = 0; i <= data.length - windowSize; i++) {
          let windowSum: int = 0;
          for (let j: int = 0; j < windowSize; j++) {
            windowSum += data[i + j].toInt();
          }
          movingAvgs.push(windowSum / windowSize);
        }
        expect(movingAvgs[0]).assertEqual(20.0);
        expect(movingAvgs[1]).assertEqual(30.0);
        expect(movingAvgs[2]).assertEqual(40.0);
      }

      {
        let first: Short = new Short(1 as short);
        let last: Short = new Short(100 as short);
        let n: int = last.toInt() - first.toInt() + 1;
        let sumFormula: int = n * (first.toInt() + last.toInt()) / 2;
        expect(sumFormula).assertEqual(5050);
        let actualSum: int = 0;
        for (let val: int = first.toInt(); val <= last.toInt(); val++) {
          actualSum += val;
        }
        expect(actualSum).assertEqual(sumFormula);
      }

      {
        let celsiusValues: Short[] = [
          new Short(0 as short), new Short(10 as short), new Short(25 as short),
          new Short(100 as short), new Short((-10) as short), new Short((-40) as short)
        ];
        let expectedF: Map<int, int> = new Map<int, int>();
        expectedF.set(0, 32);
        expectedF.set(100, 212);
        expectedF.set(-40, -40);
        expectedF.set(25, 77);
        for (let i: int = 0; i < celsiusValues.length; i++) {
          let c: int = celsiusValues[i].toInt();
          let f: int = c * 9 / 5 + 32;
          expect(f).assertEqual(expectedF.has(c) ? expectedF.get(c)! : f);
        }
      }

      {
        let pricesInCents: Short[] = [
          new Short(199 as short), new Short(500 as short), new Short(2500 as short),
          new Short(0 as short), new Short(9999 as short)
        ];
        let expectedDollars: double[] = [1.99, 5.00, 25.00, 0.00, 99.99];
        for (let i: int = 0; i < pricesInCents.length; i++) {
          let cents: int = pricesInCents[i].toInt();
          let dollars: double = cents / 100.0;
          expect(dollars).assertEqual(expectedDollars[i]);
        }
      }

      {
        let maxPwm: Short = new Short(Short.MAX_VALUE);
        let minPwm: Short = new Short(0 as short);
        let midPwm: Short = new Short(16384 as short);
        let maxDuty: double = maxPwm.toInt() * 100.0 / 32767;
        let minDuty: double = minPwm.toInt() * 100.0 / 32767;
        let midDuty: double = midPwm.toInt() * 100 / 32767;
        expect(Math.round(maxDuty)).assertEqual(100);
        expect(minDuty).assertEqual(0.0);
        expect(midDuty > 49 && midDuty < 51).assertTrue();
      }

      {
        let adcMax: Short = new Short(Short.MAX_VALUE);
        let adcZero: Short = new Short(0 as short);
        let adcHalf: Short = new Short(16384 as short);
        let vRef: number = 5.0;
        let maxVoltage: number = adcMax.toInt() * vRef / 32767;
        let zeroVoltage: number = adcZero.toInt() * vRef / 32767;
        let halfVoltage: number = adcHalf.toInt() * vRef / 32767;
        expect(maxVoltage > 4.99 && maxVoltage < 5.01).assertTrue();
        expect(zeroVoltage).assertEqual(0.0);
        expect(halfVoltage > 2.49 && halfVoltage < 2.51).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOINT_0900
     * @tc.name testShortToInt_merged9
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toInt, including type conversion, loop accumulation, round-trip conversion, equality consistency, and containers and references.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToInt_merged9', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let data: Short[] = [
          new Short(2 as short), new Short(4 as short), new Short(4 as short),
          new Short(4 as short), new Short(5 as short), new Short(5 as short),
          new Short(7 as short), new Short(9 as short)
        ];
        let n: int = data.length;
        let sum: int = 0;
        for (let i: int = 0; i < n; i++) {
          sum += data[i].toInt();
        }
        let mean: double = sum / n;
        expect(mean).assertEqual(5.0);
        let sqDiffs: double = 0.0;
        for (let i: int = 0; i < n; i++) {
          let diff: double = data[i].toInt() - mean;
          sqDiffs += diff * diff;
        }
        let variance: double = sqDiffs / n;
        let stdDev: double = Math.sqrt(variance);
        expect(stdDev).assertEqual(2.0);
      }

      {
        let samples: Short[] = [
          new Short(3 as short), new Short(4 as short), new Short((-3) as short), new Short((-4) as short)
        ];
        let sumSquares: int = 0;
        for (let i: int = 0; i < samples.length; i++) {
          let val: int = samples[i].toInt();
          sumSquares += val * val;
        }
        let rms: double = Math.sqrt(Int.toDouble(sumSquares) / samples.length);
        expect(rms).assertEqual(3.5355339059327378);
      }

      {
        let testValues: short[] = [0 as short, 1 as short, (-1) as short, Short.MAX_VALUE, Short.MIN_VALUE,
          255 as short, (-255) as short, 16384 as short, (-16384) as short];
        for (let i: int = 0; i < testValues.length; i++) {
          let original: Short = new Short(testValues[i]);
          let chained: int = new Short(original.toShort()).toInt();
          expect(chained).assertEqual(original.toInt());
          expect(chained).assertEqual(Short.toInt(testValues[i]));
        }
      }

      {
        let keyValues: Short[] = [
          new Short(Short.MIN_VALUE), new Short((-1) as short), new Short(0 as short),
          new Short(1 as short), new Short(Short.MAX_VALUE)
        ];
        for (let i: int = 0; i < keyValues.length; i++) {
          let intVal: int = keyValues[i].toInt();
          let doubleVal: double = keyValues[i].toDouble();
          expect(intVal).assertEqual(doubleVal);
        }
      }

      {
        let base: short = 10 as short;
        let incremented: short = Int.toShort(base + 1);
        expect(Short.toInt(incremented)).assertEqual(11);
        let decremented: short = Int.toShort(base - 1);
        expect(Short.toInt(decremented)).assertEqual(9);
        let doubleAdd: short = Int.toShort(base + 2);
        expect(Short.toInt(doubleAdd)).assertEqual(12);
      }

      {
        let base: short = (-10) as short;
        let decremented: short = Int.toShort(base - 1);
        expect(Short.toInt(decremented)).assertEqual(-11);
        let incremented: short = Int.toShort(base + 1);
        expect(Short.toInt(incremented)).assertEqual(-9);
        let doubleSub: short = Int.toShort(base - 2);
        expect(Short.toInt(doubleSub)).assertEqual(-12);
      }

      {
        let seed: int = 42;
        let a: int = 1103515245;
        let c: int = 12345;
        let m: int = 0x7FFFFFFF;
        let seenValues: Set<int> = new Set<int>();
        for (let i: int = 0; i < 20; i++) {
          seed = (a * seed + c) % m;
          let shortVal: short = Int.toShort(seed);
          let result: int = Short.toInt(shortVal);
          expect(result).assertEqual(Int.toInt(Int.toShort(seed)));
          seenValues.add(result);
        }
        expect(seenValues.size).assertEqual(20);
      }

      {
        let patternA: short = 0x5555 as short;
        let patternB: short = 0x0FFF as short;
        let intA: int = Short.toInt(patternA);
        let intB: int = Short.toInt(patternB);
        expect(intA).assertEqual(0x5555);
        expect(intB).assertEqual(0xFFF);
        let xorResult: int = intA ^ intB;
        expect(xorResult).assertEqual(0x5AAA);
        let andResult: int = intA & intB;
        expect(andResult).assertEqual(0x0555);
      }

      {
        let a: Short = new Short(100 as short);
        let b: Short = new Short(50 as short);
        let c: Short = new Short(30 as short);
        let chainResult: int = a.add(b).sub(c).toInt();
        expect(chainResult).assertEqual(120);
        let chainResult2: int = new Short(200 as short).sub(new Short(75 as short)).add(new Short(25 as short)).toInt();
        expect(chainResult2).assertEqual(150);
        let chainWithNeg: int = new Short((-50) as short).add(new Short(100 as short)).sub(new Short(20 as short)).toInt();
        expect(chainWithNeg).assertEqual(30);
      }

      {
        let shortVal: short = Int.toShort(0xFFFF);
        let actualResult: int = Short.toInt(shortVal);
        expect(actualResult).assertEqual(-1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOINT_1000
     * @tc.name testShortToInt_merged10
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toInt, including type conversion, containers and references, and sign handling.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToInt_merged10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let shortVal: short = Int.toShort(0x8000);
        expect(Short.toInt(shortVal)).assertEqual(-32768);
      }

      {
        let testVals: short[] = [0x1234 as short, Int.toShort(0xABCD), (-1) as short, 0 as short, Short.MAX_VALUE];
        let expectedLowBytes: int[] = [0x34, 0xCD, 0xFF, 0x00, 0xFF];
        for (let i: int = 0; i < testVals.length; i++) {
          let intVal: int = Short.toInt(testVals[i]);
          let lowByte: int = intVal & 0xFF;
          expect(lowByte).assertEqual(expectedLowBytes[i]);
        }
      }

      {
        let shortVal: short = 0x1234 as short;
        let intVal: int = Short.toInt(shortVal);
        let lowByte: int = intVal & 0xFF;
        let highByte: int = (intVal >> 8) & 0xFF;
        expect(lowByte).assertEqual(0x34);
        expect(highByte).assertEqual(0x12);
      }

      {
        let shortVal: short = 0 as short;
        let intVal: int = Short.toInt(shortVal);
        for (let n: int = 0; n < 15; n++) {
          let bitSetResult: int = intVal | (1 << n);
          expect((bitSetResult >> n) & 1).assertEqual(1);
        }
      }

      {
        let shortVal: short = 0x7FFF as short;
        let intVal: int = Short.toInt(shortVal);
        let bitClearResult: int = intVal & ~(1 << 0);
        expect(bitClearResult).assertEqual(0x7FFE);
        let bitClearHigh: int = intVal & ~(1 << 14);
        expect(bitClearHigh).assertEqual(0x3FFF);
      }

      {
        let shortVal: short = 0x5555 as short;
        let intVal: int = Short.toInt(shortVal);
        let toggled: int = intVal ^ (1 << 0);
        expect(toggled).assertEqual(0x5554);
        let toggleBack: int = toggled ^ (1 << 0);
        expect(toggleBack).assertEqual(0x5555);
      }

      {
        let shortVal: short = 0x0004 as short;
        let intVal: int = Short.toInt(shortVal);
        let bitAt2: int = (intVal >> 2) & 1;
        expect(bitAt2).assertEqual(1);
        let bitAt0: int = (intVal >> 0) & 1;
        expect(bitAt0).assertEqual(0);
      }

      {
        let shortVal: short = 0x3E8 as short;
        let intVal: int = Short.toInt(shortVal);
        let fieldOff: int = 4;
        let fieldMask: int = 0x0F;
        let fieldValue: int = (intVal >> fieldOff) & fieldMask;
        expect(fieldValue).assertEqual(0x0E);
      }

      {
        let shortVal: short = 0x0F00 as short;
        let intVal: int = Short.toInt(shortVal);
        let insertVal: int = 0x0A;
        let mask: int = 0x00F0;
        let off: int = 4;
        let result: int = (intVal & ~mask) | ((insertVal << off) & mask);
        expect(result).assertEqual(0x0FA0);
      }

      {
        let shortVal: short = 0x00FF as short;
        let intVal: int = Short.toInt(shortVal);
        let signExtended: int = (intVal << 16) >> 16;
        expect(signExtended).assertEqual(255);
        let negShortVal: short = Int.toShort(0x8000);
        let negIntVal: int = Short.toInt(negShortVal);
        let negSignExtended: int = (negIntVal << 16) >> 16;
        expect(negSignExtended).assertEqual(-32768);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOINT_1100
     * @tc.name testShortToInt_merged11
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toInt, including type conversion, equality consistency, division and modulo, and algebraic properties.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToInt_merged11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let shortVal: short = 0x0001 as short;
        let intVal: int = Short.toInt(shortVal);
        let clz: int = 0;
        let temp: int = intVal;
        let bitCount: int = 16;
        for (let i: int = bitCount - 1; i >= 0; i--) {
          if (((temp >> i) & 1) === 0) {
            clz++;
          } else {
            break;
          }
        }
        expect(clz).assertEqual(15);
      }

      {
        let a: short = 100 as short;
        let b: short = 200 as short;
        let intA: int = Short.toInt(a);
        let intB: int = Short.toInt(b);
        let product: int = intA * intB;
        expect(product).assertEqual(20000);
      }

      {
        let a: short = 15000 as short;
        let b: short = 17767 as short;
        let intA: int = Short.toInt(a);
        let intB: int = Short.toInt(b);
        let sum: int = intA + intB;
        expect(sum).assertEqual(32767);
      }

      {
        let a: short = 100 as short;
        let b: short = (-50) as short;
        let intA: int = Short.toInt(a);
        let intB: int = Short.toInt(b);
        let absDiff: int = Math.abs(intA - intB);
        expect(absDiff).assertEqual(150);
      }

      {
        let a: short = 25 as short;
        let b: short = 16 as short;
        let intA: int = Short.toInt(a);
        let intB: int = Short.toInt(b);
        let diffSquares: int = intA * intA - intB * intB;
        let factored: int = (intA - intB) * (intA + intB);
        expect(diffSquares).assertEqual(369);
        expect(factored).assertEqual(369);
        expect(diffSquares).assertEqual(factored);
        let c: short = 13 as short;
        let d: short = 7 as short;
        let intC: int = Short.toInt(c);
        let intD: int = Short.toInt(d);
        expect(intC * intC - intD * intD).assertEqual((intC - intD) * (intC + intD));
        expect(intC * intC - intD * intD).assertEqual(120);
      }

      {
        let a: short = 12 as short;
        let b: short = 18 as short;
        let intA: int = Short.toInt(a);
        let intB: int = Short.toInt(b);
        let x: int = intA;
        let y: int = intB;
        while (y !== 0) {
          let t: int = y;
          y = x % y;
          x = t;
        }
        let gcd: int = x;
        let lcm: int = (intA * intB) / gcd;
        expect(lcm).assertEqual(36);
      }

      {
        let n: short = 10 as short;
        let intN: int = Short.toInt(n);
        let factorial: int = 1;
        for (let i: int = 2; i <= intN; i++) {
          factorial = factorial * i;
        }
        expect(factorial).assertEqual(3628800);
      }

      {
        let n: short = 10 as short;
        let k: short = 3 as short;
        let intN: int = Short.toInt(n);
        let intK: int = Short.toInt(k);
        let result: int = 1;
        for (let i: int = 1; i <= intK; i++) {
          result = result * (intN - intK + i) / i;
        }
        expect(result).assertEqual(120);
      }

      {
        let a: short = 5 as short;
        let b: short = 3 as short;
        let m: short = 13 as short;
        let intA: int = Short.toInt(a);
        let intB: int = Short.toInt(b);
        let intM: int = Short.toInt(m);
        let result: int = 1;
        let base: int = intA % intM;
        let exp: int = intB;
        while (exp > 0) {
          if ((exp & 1) === 1) {
            result = (result * base) % intM;
          }
          exp = exp >> 1;
          base = (base * base) % intM;
        }
        expect(result).assertEqual(8);
      }

      {
        let primeShort: short = 97 as short;
        let intPrime: int = Short.toInt(primeShort);
        let isPrime: boolean = true;
        if (intPrime < 2) {
          isPrime = false;
        }
        for (let i: int = 2; i * i <= intPrime; i++) {
          if (intPrime % i === 0) {
            isPrime = false;
          }
        }
        expect(isPrime).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOINT_1200
     * @tc.name testShortToInt_merged12
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toInt, including type conversion, business scenarios, containers and references, opposite values, and division and modulo.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToInt_merged12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let a: short = 3 as short;
        let m: short = 11 as short;
        let intA: int = Short.toInt(a);
        let intM: int = Short.toInt(m);
        let m0: int = intM;
        let x0: int = 0;
        let x1: int = 1;
        let aVal: int = intA;
        while (aVal > 1) {
          let q: int = aVal / m0;
          let t: int = m0;
          m0 = aVal % m0;
          aVal = t;
          t = x0;
          x0 = x1 - q * x0;
          x1 = t;
        }
        let inverse: int = x1;
        expect(inverse >= 0).assertTrue();
        expect((intA * inverse) % intM).assertEqual(1 % intM);
      }

      {
        let indexShort: short = 5 as short;
        let array: string[] = ['a', 'b', 'c', 'd', 'e', 'f', 'g'];
        let intIndex: int = Short.toInt(indexShort);
        expect(intIndex >= 0 && intIndex < array.length).assertTrue();
        expect(array[intIndex]).assertEqual('f');
      }

      {
        let key: short = 12345 as short;
        let tableSize: int = 16;
        let intKey: int = Short.toInt(key);
        let bucket: int = intKey % tableSize;
        expect(bucket >= 0 && bucket < tableSize).assertTrue();
        expect(bucket).assertEqual(12345 % 16);
      }

      {
        let nodeId: short = 3 as short;
        let matrix: int[][] = [
          [0, 1, 0, 1],
          [1, 0, 1, 0],
          [0, 1, 0, 1],
          [1, 0, 1, 0]
        ];
        let intNodeId: int = Short.toInt(nodeId);
        expect(matrix[intNodeId][1]).assertEqual(0);
        expect(matrix[intNodeId][0]).assertEqual(1);
      }

      {
        let state: short = 7 as short;
        let memo: int[] = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1];
        let intState: int = Short.toInt(state);
        expect(intState).assertEqual(7);
        memo[intState] = 42;
        expect(memo[intState]).assertEqual(42);
        expect(memo[6]).assertEqual(-1);
        expect(memo[8]).assertEqual(-1);
      }

      {
        let priorities: short[] = [5 as short, 1 as short, 10 as short, 3 as short];
        let intPriorities: int[] = Array.create<int>(priorities.length, 0);
        for (let i: int = 0; i < priorities.length; i++) {
          intPriorities[i] = Short.toInt(priorities[i]);
        }
        for (let i: int = 0; i < intPriorities.length - 1; i++) {
          for (let j: int = 0; j < intPriorities.length - i - 1; j++) {
            if (intPriorities[j] > intPriorities[j + 1]) {
              let tmp: int = intPriorities[j];
              intPriorities[j] = intPriorities[j + 1];
              intPriorities[j + 1] = tmp;
            }
          }
        }
        expect(intPriorities[0]).assertEqual(1);
        expect(intPriorities[3]).assertEqual(10);
      }

      {
        let runCount: short = 255 as short;
        let intCount: int = Short.toInt(runCount);
        let decoded: int[] = Array.create<int>(intCount, 0);
        for (let i: int = 0; i < intCount; i++) {
          decoded[i] = 1;
        }
        expect(decoded.length).assertEqual(255);
        expect(decoded[0]).assertEqual(1);
        expect(decoded[254]).assertEqual(1);
      }

      {
        let freq: short = 150 as short;
        let intFreq: int = Short.toInt(freq);
        let freqTable: int[] = [intFreq, intFreq + 10, intFreq - 10];
        expect(freqTable[0]).assertEqual(150);
        expect(freqTable[1]).assertEqual(160);
        expect(freqTable[2]).assertEqual(140);
      }

      {
        let code: short = 256 as short;
        let intCode: int = Short.toInt(code);
        let dict: string[] = Array.create<string>(intCode + 1, '');
        for (let i: int = 0; i <= intCode; i++) {
          dict[i] = 'entry_' + i;
        }
        expect(dict[intCode]).assertEqual('entry_256');
        expect(dict[0]).assertEqual('entry_0');
      }

      {
        let palette: string[] = [
          'black', 'white', 'red', 'green', 'blue',
          'yellow', 'cyan', 'magenta', 'gray', 'orange',
          'pink', 'purple', 'brown', 'lime', 'navy', 'teal'
        ];
        let colorCodes: short[] = [15 as short, 0 as short, 8 as short];
        let expectedColors: string[] = ['teal', 'black', 'gray'];
        for (let i: int = 0; i < colorCodes.length; i++) {
          let idx: int = Short.toInt(colorCodes[i]);
          expect(idx >= 0 && idx < palette.length).assertTrue();
          expect(palette[idx]).assertEqual(expectedColors[i]);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOINT_1300
     * @tc.name testShortToInt_merged13
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toInt, including type conversion, business scenarios, comparison and ordering, and containers and references.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToInt_merged13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let state: short = 1 as short;
        let intState: int = Short.toInt(state);
        let transitions: int[][] = [
          [0, 1, 2],
          [1, 0, 3],
          [2, 3, 0],
          [3, 2, 1]
        ];
        let nextState: int = transitions[intState][0];
        expect(nextState).assertEqual(1);
      }

      {
        let row: short = 5 as short;
        let col: short = 7 as short;
        let width: int = 16;
        let intRow: int = Short.toInt(row);
        let intCol: int = Short.toInt(col);
        let pixelIndex: int = intRow * width + intCol;
        expect(pixelIndex).assertEqual(5 * 16 + 7);
      }

      {
        let keyA: short = 500 as short;
        let keyB: short = 300 as short;
        let intKeyA: int = Short.toInt(keyA);
        let intKeyB: int = Short.toInt(keyB);
        expect(intKeyA > intKeyB).assertTrue();
        expect(intKeyA - intKeyB).assertEqual(200);
      }

      {
        let bucket: short = 4 as short;
        let intBucket: int = Short.toInt(bucket);
        let histogram: int[] = [10, 25, 30, 15, 20, 8, 5];
        histogram[intBucket] = histogram[intBucket] + 1;
        expect(histogram[intBucket]).assertEqual(21);
      }

      {
        let pixel: short = 100 as short;
        let kernelWeight: int = 3;
        let intPixel: int = Short.toInt(pixel);
        let convResult: int = intPixel * kernelWeight;
        expect(convResult).assertEqual(300);
      }

      {
        let tickSamples: short[] = [5000 as short, 250 as short];
        let expectedMs: int[] = [50000, 2500];
        let msPerTick: int = 10;
        for (let i: int = 0; i < tickSamples.length; i++) {
          expect(Short.toInt(tickSamples[i]) * msPerTick).assertEqual(expectedMs[i]);
        }
      }

      {
        let frameIndex: short = 240 as short;
        let fps: int = 30;
        let intFrame: int = Short.toInt(frameIndex);
        let positionMs: int = (intFrame * 1000) / fps;
        expect(positionMs).assertEqual(8000);
      }

      {
        let line: short = 42 as short;
        let col: short = 7 as short;
        let intLine: int = Short.toInt(line);
        let intCol: int = Short.toInt(col);
        let lexerPos: int = intLine * 1000 + intCol;
        expect(lexerPos).assertEqual(42007);
      }

      {
        expect(new Short(Short.BIT_SIZE).toInt()).assertEqual(16);
        expect(new Short(Short.BYTE_SIZE).toInt()).assertEqual(2);
      }

      {
        let pA: Short = new Short(500);
        let lA: Short = new Short(1);
        let pB: Short = new Short(250);
        let lB: Short = new Short(2);
        let pC: Short = new Short(125);
        let lC: Short = new Short(3);
        let pD: Short = new Short(125);
        let lD: Short = new Short(3);
        let expectedL: int = pA.toInt() * lA.toInt() +
          pB.toInt() * lB.toInt() +
          pC.toInt() * lC.toInt() +
          pD.toInt() * lD.toInt();
        expect(expectedL).assertEqual(1750);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOINT_1400
     * @tc.name testShortToInt_merged14
     * @tc.desc CrossTypeRoundTrip / RadixConversion / Idempotent: covers 10 merged test points for Short.toInt, including type conversion, radix conversion, idempotence, positive values, and round-trip conversion.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToInt_merged14', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let failCount: int = 0;
        let step: int = 1024;
        for (let v: int = 0; v <= 32767; v += step) {
          let sv: short = Int.toShort(v);
          let intVal: int = Short.toInt(sv);
          let restored: short = Int.toShort(intVal);
          if (Short.toInt(restored) !== v) {
            failCount++;
          }
        }
        expect(failCount).assertEqual(0);
      }

      {
        let failCount: int = 0;
        let step: int = 1024;
        for (let v: int = -1; v >= -32768; v -= step) {
          let sv: short = Int.toShort(v);
          let intVal: int = Short.toInt(sv);
          expect(intVal).assertEqual(v);
          let restored: short = Int.toShort(intVal);
          if (Short.toInt(restored) !== v) {
            failCount++;
          }
        }
        expect(failCount).assertEqual(0);
      }

      {
        let hexValue: int = 0x7FFF;
        let shortValue: short = Int.toShort(hexValue);
        let actualResult: int = Short.toInt(shortValue);
        expect(actualResult).assertEqual(32767);
      }

      {
        let decVal: int = Int.parseInt("255", 10);
        let hexVal: int = Int.parseInt("FF", 16);
        let binVal: int = Int.parseInt("11111111", 2);
        let octVal: int = Int.parseInt("377", 8);
        let shortDec: short = Int.toShort(decVal);
        let shortHex: short = Int.toShort(hexVal);
        let shortBin: short = Int.toShort(binVal);
        let shortOct: short = Int.toShort(octVal);
        let decResult: int = Short.toInt(shortDec);
        expect(Short.toInt(shortHex)).assertEqual(decResult);
        expect(Short.toInt(shortBin)).assertEqual(decResult);
        expect(Short.toInt(shortOct)).assertEqual(decResult);
      }

      {
        let hexStrings: string[] = ["0", "1", "FF", "7FFF", "3FFF"];
        let expectedVals: int[] = [0, 1, 255, 32767, 16383];
        for (let i: int = 0; i < hexStrings.length; i++) {
          let parsed: int = Int.parseInt(hexStrings[i], 16);
          let shortVal: short = Int.toShort(parsed);
          let instance: Short = new Short(shortVal);
          expect(instance.toInt()).assertEqual(expectedVals[i]);
        }
      }

      {
        let testValues: short[] = [
          0 as short,
          1 as short,
          Short.MAX_VALUE,
          (-1) as short,
          Short.MIN_VALUE
        ];
        let expectedValues: int[] = [
          0,
          1,
          32767,
          -1,
          -32768
        ];
        let caseCount: int = 5;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let inputValue: short = testValues[caseIndex];
          let expectedResult: int = expectedValues[caseIndex];
          let firstCallResult: int = Short.toInt(inputValue);
          let secondCallResult: int = Short.toInt(inputValue);
          let thirdCallResult: int = Short.toInt(inputValue);
          expect(firstCallResult).assertEqual(expectedResult);
          expect(secondCallResult).assertEqual(expectedResult);
          expect(thirdCallResult).assertEqual(expectedResult);
          expect(secondCallResult).assertEqual(firstCallResult);
          expect(thirdCallResult).assertEqual(firstCallResult);
        }
      }

      {
        let inputValue: short = 255 as short;
        let directResult: int = Short.toInt(inputValue);
        let functionResult: int = invokeShortToIntInFunction(inputValue);
        let repeatedDirectResult: int = Short.toInt(inputValue);
        expect(directResult).assertEqual(255);
        expect(functionResult).assertEqual(255);
        expect(repeatedDirectResult).assertEqual(255);
        expect(functionResult).assertEqual(directResult);
        expect(repeatedDirectResult).assertEqual(directResult);
      }

      {
        let primaryInput: short = 1024 as short;
        let secondaryInput: short = 2048 as short;
        let firstPrimaryResult: int = Short.toInt(primaryInput);
        let secondaryResult: int = Short.toInt(secondaryInput);
        let secondPrimaryResult: int = Short.toInt(primaryInput);
        expect(firstPrimaryResult).assertEqual(1024);
        expect(secondaryResult).assertEqual(2048);
        expect(secondPrimaryResult).assertEqual(1024);
        expect(secondPrimaryResult).assertEqual(firstPrimaryResult);
      }

      {
        let a1: Short = new Short(48 as short);
        let b1: Short = new Short(36 as short);
        let x1: int = a1.toInt();
        let y1: int = b1.toInt();
        while (y1 !== 0) {
          let t1: int = y1;
          y1 = x1 % y1;
          x1 = t1;
        }
        expect(x1).assertEqual(12);
        let a2: Short = new Short(100 as short);
        let b2: Short = new Short(75 as short);
        let x2: int = a2.toInt();
        let y2: int = b2.toInt();
        while (y2 !== 0) {
          let t2: int = y2;
          y2 = x2 % y2;
          x2 = t2;
        }
        expect(x2).assertEqual(25);
        let a3: Short = new Short(17 as short);
        let b3: Short = new Short(5 as short);
        let x3: int = a3.toInt();
        let y3: int = b3.toInt();
        while (y3 !== 0) {
          let t3: int = y3;
          y3 = x3 % y3;
          x3 = t3;
        }
        expect(x3).assertEqual(1);
        let a4: Short = new Short(Short.MAX_VALUE);
        let b4: Short = new Short(1 as short);
        let x4: int = a4.toInt();
        let y4: int = b4.toInt();
        while (y4 !== 0) {
          let t4: int = y4;
          y4 = x4 % y4;
          x4 = t4;
        }
        expect(x4).assertEqual(1);
      }

      {
        let positiveValue: Short = new Short(555 as short);
        let posFirst: int = positiveValue.toInt();
        let posSecond: int = positiveValue.toInt();
        let posThird: int = positiveValue.toInt();
        expect(posFirst).assertEqual(555);
        expect(posSecond).assertEqual(555);
        expect(posThird).assertEqual(555);
        expect(posFirst).assertEqual(posSecond);
        expect(posSecond).assertEqual(posThird);
  
        let negativeValue: Short = new Short((-666) as short);
        let negFirst: int = negativeValue.toInt();
        let negSecond: int = negativeValue.toInt();
        let negThird: int = negativeValue.toInt();
        expect(negFirst).assertEqual(-666);
        expect(negSecond).assertEqual(-666);
        expect(negThird).assertEqual(-666);
        expect(negFirst).assertEqual(negSecond);
        expect(negSecond).assertEqual(negThird);
  
        let zeroValue: Short = new Short(0 as short);
        let zeroFirst: int = zeroValue.toInt();
        let zeroSecond: int = zeroValue.toInt();
        let zeroThird: int = zeroValue.toInt();
        expect(zeroFirst).assertEqual(0);
        expect(zeroSecond).assertEqual(0);
        expect(zeroThird).assertEqual(0);
        expect(zeroFirst).assertEqual(zeroSecond);
        expect(zeroSecond).assertEqual(zeroThird);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOINT_1500
     * @tc.name testShortToInt_merged15
     * @tc.desc Idempotent / BatchSampling / Other: covers 5 merged test points for Short.toInt, including type conversion, equality consistency, positive values, negative values, and comparison and ordering.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToInt_merged15', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let symPairs: short[] = [
          1 as short, (-1) as short,
          128 as short, (-128) as short,
          1024 as short, (-1024) as short,
          16384 as short, (-16384) as short
        ];
        let expectedSym: int[] = [
          1, -1, 128, -128, 1024, -1024, 16384, -16384
        ];
        let symCount: int = symPairs.length;
        for (let symIndex: int = 0; symIndex < symCount; symIndex++) {
          let actualResult: int = Short.toInt(symPairs[symIndex]);
          expect(actualResult).assertEqual(expectedSym[symIndex]);
        }
      }

      {
        let values: short[] = [10 as short, 20 as short, 30 as short, 40 as short];
        let instances: Short[] = [];
        for (let i: int = 0; i < values.length; i++) {
          instances.push(new Short(values[i]));
        }
        let results: int[] = [];
        results.push(instances[0].toInt());
        results.push(Short.toInt(values[1]));
        results.push(instances[2].toInt());
        results.push(Short.toInt(values[3]));
        results.push(instances[1].toInt());
        results.push(Short.toInt(values[0]));
        expect(results[0]).assertEqual(10);
        expect(results[1]).assertEqual(20);
        expect(results[2]).assertEqual(30);
        expect(results[3]).assertEqual(40);
        expect(results[4]).assertEqual(20);
        expect(results[5]).assertEqual(10);
      }

      {
        let pairs: [short, short][] = [
          [100 as short, 200 as short],
          [-50 as short, 50 as short],
          [0 as short, -1 as short],
          [Short.MAX_VALUE, 0 as short],
          [Short.MIN_VALUE, Short.MAX_VALUE]
        ];
        for (let i: int = 0; i < pairs.length; i++) {
          let a: Short = new Short(pairs[i][0]);
          let b: Short = new Short(pairs[i][1]);
          expect(a.isGreaterThan(b)).assertEqual(a.toInt() > b.toInt());
          expect(a.isLessThan(b)).assertEqual(a.toInt() < b.toInt());
        }
      }

      {
        let sampleValues: short[] = [
          (-2000) as short, (-1500) as short, (-1000) as short, (-500) as short,
          0 as short, 500 as short, 1000 as short, 1500 as short, 2000 as short,
          Short.MIN_VALUE, (-16384) as short, 16384 as short, Short.MAX_VALUE
        ];
        let resultSet: Set<int> = new Set<int>();
        for (let i: int = 0; i < sampleValues.length; i++) {
          let result: int = Short.toInt(sampleValues[i]);
          expect(resultSet.has(result)).assertFalse();
          resultSet.add(result);
        }
        expect(resultSet.size).assertEqual(sampleValues.length);
      }

      {
        for (let i: int = -128; i <= 127; i++) {
          let shortVal: short = Int.toShort(i);
          let result: int = Short.toInt(shortVal);
          expect(result).assertEqual(i);
        }
      }
    });

  });
}