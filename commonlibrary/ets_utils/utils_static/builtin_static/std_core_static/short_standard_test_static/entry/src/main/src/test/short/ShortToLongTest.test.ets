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

export default function shortToLongTest(): void {
  describe('ShortToLongTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLONG_0100
     * @tc.name testShortToLong_merged1
     * @tc.desc BoundaryOverflow: covers 10 merged test points for Short.toLong, including type conversion, boundary values, wrapping, loop accumulation, and business scenarios.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLong_merged1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let doubleInputs: double[] = [3.9, (-3.9), 127.9, (-128.9), 32767.9];
        let expectedValues: long[] = [
          Long.toLong(3),
          Long.toLong(-3),
          Long.toLong(127),
          Long.toLong(-128),
          Long.toLong(32767)
        ];
        let caseCount: int = 5;
        for (let i: int = 0; i < caseCount; i++) {
          let derivedShort: short = Double.toShort(doubleInputs[i]);
          let derivedLong: long = Short.toLong(derivedShort);
          expect(derivedLong).assertEqual(expectedValues[i]);
        }
      }

      {
        let boundaryValues: short[] = [
          255 as short,
          256 as short,
          (-128) as short,
          (-129) as short
        ];
        let expectedValues: long[] = [
          Long.toLong(255),
          Long.toLong(256),
          Long.toLong(-128),
          Long.toLong(-129)
        ];
        let caseCount: int = 4;
        for (let i: int = 0; i < caseCount; i++) {
          expect(Short.toLong(boundaryValues[i])).assertEqual(expectedValues[i]);
        }
      }

      {
        let shortQuot: Short = new Short(Short.MIN_VALUE).div(new Short((-1) as short));
        expect(shortQuot.toShort()).assertEqual(Short.MIN_VALUE);
        let longQuot: long = Short.toLong(Short.MIN_VALUE).div(Long.toLong(-1));
        expect(longQuot.toInt()).assertEqual(32768);
      }

      {
        let minLong: long = Short.toLong(Short.MIN_VALUE);
        let maxLong: long = Short.toLong(Short.MAX_VALUE);
        expect(minLong.add(maxLong)).assertEqual(Long.toLong(-1));
        expect(minLong.sub(maxLong)).assertEqual(Long.toLong(-65535));
        expect(minLong.toInt()).assertEqual(-32768);
        expect(maxLong.toInt()).assertEqual(32767);
      }

      {
        expect(Short.toLong(32765 as short)).assertEqual(Long.toLong(32765));
        expect(Short.toLong(32766 as short)).assertEqual(Long.toLong(32766));
        expect(Short.toLong(Short.MAX_VALUE)).assertEqual(Long.toLong(32767));
        expect(Short.toLong(Int.toShort(32768))).assertEqual(Long.toLong(-32768));
      }

      {
        expect(Short.toLong((-32766) as short)).assertEqual(Long.toLong(-32766));
        expect(Short.toLong((-32767) as short)).assertEqual(Long.toLong(-32767));
        expect(Short.toLong(Short.MIN_VALUE)).assertEqual(Long.toLong(-32768));
        expect(Short.toLong(Int.toShort(-32769))).assertEqual(Long.toLong(32767));
      }

      {
        let operands: short[] = [30000 as short, 30000 as short, 30000 as short];
        let sumSquares: long = Long.toLong(0);
        for (let i: int = 0; i < operands.length; i++) {
          let widened: long = Short.toLong(operands[i]);
          sumSquares = sumSquares.add(widened.mul(widened));
        }
        expect(sumSquares.toString()).assertEqual("2700000000");
      }

      {
        let chars: char[] = [c'\u0000', c'A', c'\u03A9', c'\u4E2D', c'\u7FFF', c'\u8000', c'\uFF9C', c'\uFFFF'];
        let expected: int[] = [0, 65, 937, 20013, 32767, -32768, -100, -1];
        for (let i: int = 0; i < chars.length; i++) {
          let shortValue: short = Char.toShort(chars[i]);
          expect(Short.toLong(shortValue)).assertEqual(Long.toLong(expected[i]));
        }
      }

      {
        let byteRange: short[] = [
          (-128) as short,
          (-64) as short,
          (-1) as short,
          0 as short,
          1 as short,
          64 as short,
          127 as short
        ];
        let rangeCount: int = byteRange.length;
        for (let i: int = 0; i < rangeCount; i++) {
          expect(Short.toLong(byteRange[i])).assertEqual(Long.toLong(Short.toByte(byteRange[i])));
        }
        let widePos: Short = new Short(200 as short);
        expect(Short.toLong(widePos.toShort())).assertEqual(Long.toLong(200));
        expect(Short.toByte(widePos.toShort())).assertEqual((-56) as byte);
        let wideNeg: Short = new Short((-200) as short);
        expect(Short.toLong(wideNeg.toShort())).assertEqual(Long.toLong(-200));
        expect(Short.toByte(wideNeg.toShort())).assertEqual(56 as byte);
      }

      {
        let wrappedHigh: Short = new Short(Int.toShort(40000));
        let wrappedLow: Short = new Short(Int.toShort(-40000));
        expect(wrappedHigh.toShort()).assertEqual((-25536) as short);
        expect(wrappedHigh.toLong()).assertEqual(Long.toLong(-25536));
        expect(wrappedLow.toShort()).assertEqual(25536 as short);
        expect(wrappedLow.toLong()).assertEqual(Long.toLong(25536));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLONG_0200
     * @tc.name testShortToLong_merged2
     * @tc.desc BoundaryOverflow: covers 10 merged test points for Short.toLong, including type conversion, overflow, wrapping, boundary values, and loop accumulation.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLong_merged2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let maxLong: long = Short.toLong(Short.MAX_VALUE).add(Long.toLong(1));
        expect(maxLong.toInt()).assertEqual(32768);
        expect(Short.toLong(Short.MAX_VALUE).add(Long.toLong(Short.MAX_VALUE)).toInt()).assertEqual(65534);
      }

      {
        let inRange: Short = new Short(Long.toShort(Long.toLong(12345)));
        let wrappedHigh: Short = new Short(Long.toShort(Long.toLong(40000)));
        let wrappedLow: Short = new Short(Long.toShort(Long.toLong(-40000)));
        expect(Short.toLong(Long.toShort(Long.toLong(12345)))).assertEqual(Long.toLong(12345));
        expect(Short.toLong(Long.toShort(Long.toLong(40000)))).assertEqual(Long.toLong(-25536));
        expect(Short.toLong(Long.toShort(Long.toLong(-40000)))).assertEqual(Long.toLong(25536));
        expect(inRange.toLong()).assertEqual(Long.toLong(12345));
        expect(wrappedHigh.toLong()).assertEqual(Long.toLong(-25536));
        expect(wrappedLow.toLong()).assertEqual(Long.toLong(25536));
      }

      {
        let sumBox: Short = new Short(30000 as short).add(new Short(30000 as short));
        expect(sumBox.toShort()).assertEqual((-5536) as short);
        expect(sumBox.toLong()).assertEqual(Long.toLong(-5536));
      }

      {
        let diffBox: Short = new Short(Short.MIN_VALUE).sub(new Short(1 as short));
        expect(diffBox.toShort()).assertEqual(Short.MAX_VALUE);
        expect(diffBox.toLong()).assertEqual(Long.toLong(32767));
      }

      {
        let prodBox: Short = new Short(Short.MAX_VALUE).mul(new Short(2 as short));
        expect(prodBox.toShort()).assertEqual((-2) as short);
        expect(prodBox.toLong()).assertEqual(Long.toLong(-2));
        expect(Short.toLong(Short.MAX_VALUE).mul(Long.toLong(2)).toInt()).assertEqual(65534);
      }

      {
        let quotBox: Short = new Short((-7) as short).div(new Short(2 as short));
        expect(quotBox.toShort()).assertEqual((-3) as short);
        expect(quotBox.toLong()).assertEqual(Long.toLong(-3));
        expect(Short.toLong((-7) as short).div(Long.toLong(2)).toInt()).assertEqual(-3);
      }

      {
        let edgeVals: short[] = [1 as short, 3 as short, 7 as short, 15 as short,
          31 as short, 63 as short, 127 as short, 255 as short, 511 as short,
          1023 as short, 2047 as short, 4095 as short, 8191 as short, 16383 as short];
        for (let i: int = 0; i < edgeVals.length; i++) {
          expect(Short.toLong(edgeVals[i])).assertEqual(Long.toLong(Short.toInt(edgeVals[i])));
        }
        expect(Short.toLong((-2) as short)).assertEqual(Long.toLong(-2));
        expect(Short.toLong((-2049) as short)).assertEqual(Long.toLong(-2049));
      }

      {
        let original: Short = new Short(32767 as short);
  
        let longVal: long = original.toLong();
        let intVal: int = original.toInt();
  
        expect(longVal.toInt()).assertEqual(intVal);
  
        let fromLong: Short = new Short(Int.toShort(longVal.toInt()));
        let fromInt: Short = new Short(Int.toShort(intVal));
        expect(fromLong.equals(original)).assertTrue();
        expect(fromInt.equals(original)).assertTrue();
  
        let negOriginal: Short = new Short(-32768 as short);
        expect(negOriginal.toLong().toInt()).assertEqual(-32768);
        expect(negOriginal.toInt()).assertEqual(-32768);
      }

      {
        let smallShort: Short = new Short(100 as short);
        let hugeAddition: long = Long.toLong(100000);
  
        let bigLong: long = smallShort.toLong().add(hugeAddition);
  
        let truncated: Short = new Short(Int.toShort(bigLong.toInt()));
        expect(truncated.equals(smallShort)).assertFalse();
        expect(bigLong.toInt()).assertEqual(100100);
  
        let normalLong: long = Short.toLong(new Short(5000 as short)).add(Long.toLong(2000));
        let backToShort: Short = new Short(Int.toShort(normalLong.toInt()));
        expect(backToShort.toInt()).assertEqual(7000);
      }

      {
        let shortBatch: Short[] = [];
        for (let i: int = 0; i < 100; i++) {
          shortBatch.push(new Short(30000 as short));
        }
  
        let shortSum: Short = new Short(0 as short);
        for (let s of shortBatch) {
          shortSum = shortSum.add(s);
        }
        let shortSumInt: int = shortSum.toInt();
        expect(shortSumInt).assertEqual(-14656);
  
        let longSum: long = Long.toLong(0);
        for (let s of shortBatch) {
          longSum = longSum.add(s.toLong());
        }
        expect(longSum.toInt()).assertEqual(30000 * 100);
  
        let intSum: int = 0;
        for (let s of shortBatch) {
          intSum += s.toInt();
        }
        expect(intSum).assertEqual(30000 * 100);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLONG_0300
     * @tc.name testShortToLong_merged3
     * @tc.desc BoundaryOverflow / CrossTypeRoundTrip: covers 10 merged test points for Short.toLong, including type conversion, overflow, boundary values, positive values, and negative values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLong_merged3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let a: Short = new Short(15000 as short);
        let b: Short = new Short(2000 as short);
  
        let shortAdd: Short = a.add(b);
        let shortMul: Short = a.mul(b);
        let shortDiv: Short = a.div(b);
  
        let intA: int = a.toInt();
        let intB: int = b.toInt();
        let intAdd: int = intA + intB;
        let intMul: int = intA * intB;
        let intDiv: double = Math.floor(intA / intB);
  
        let longA: long = a.toLong();
        let longB: long = b.toLong();
        let longAdd: long = longA.add(longB);
        let longMul: long = longA.mul(longB);
        let longDiv: long = longA.div(longB);
  
        expect(shortAdd.toInt()).assertEqual(intAdd);
        expect(intAdd).assertEqual(longAdd.toInt());
  
        expect(shortDiv.toInt()).assertEqual(intDiv);
        expect(intDiv).assertEqual(longDiv.toInt());
  
        expect(shortMul.toInt()).assertEqual(-15488);
        expect(intMul).assertEqual(longMul.toInt());
      }

      {
        let a: Short = new Short(20000 as short);
        let b: Short = new Short(3 as short);
        let shortProduct: short = Int.toShort(a.toInt() * b.toInt());
        let longViaShort: long = Short.toLong(shortProduct);
        let longProduct: long = a.toLong().mul(b.toLong());
        expect(longProduct.toInt()).assertEqual(60000);
        expect(longViaShort.toInt()).assertEqual(-5536);
      }

      {
        let a: Short = new Short(20000 as short);
        let b: Short = new Short(15000 as short);
        let shortSumBox: Short = a.add(b);
        let longViaLong: long = a.toLong().add(b.toLong());
        let longViaShort: long = shortSumBox.toLong();
        expect(longViaLong.toInt()).assertEqual(35000);
        expect(longViaShort.toInt()).assertEqual(-30536);
      }

      {
        let n: int = 8;
        let factorialLong: long = Long.toLong(1);
        for (let i: int = 2; i <= n; i++) {
          factorialLong = factorialLong.mul(Long.toLong(i));
        }
        expect(factorialLong.toInt()).assertEqual(40320);
      }

      {
        let minLong: long = Short.toLong(Short.MIN_VALUE);
        let absLong: long = Long.toLong(-minLong.toInt());
        expect(absLong).assertEqual(Long.toLong(32768));
        expect(absLong.compareTo(Long.toLong(32767)) > 0).assertTrue();
      }

      {
        let testValues: short[] = [
          0 as short, 1 as short, (-1) as short, 12345 as short,
          (-12345) as short, Short.MAX_VALUE, Short.MIN_VALUE
        ];
        let expectedStrings: string[] = [
          '0', '1', '-1', '12345', '-12345', '32767', '-32768'
        ];
        let caseCount: int = testValues.length;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          expect(Short.toLong(testValues[caseIndex]).toString()).assertEqual(expectedStrings[caseIndex]);
        }
      }

      {
        let testValues: short[] = [
          1 as short, 100 as short, 5000 as short,
          10000 as short, 32766 as short, Short.MAX_VALUE
        ];
        let caseCount: int = testValues.length;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let negatedShort: short = Int.toShort(-testValues[caseIndex]);
          let negativeLong: long = Short.toLong(negatedShort);
          let expectedNeg: long = Long.toLong(-Short.toInt(testValues[caseIndex]));
          expect(negativeLong).assertEqual(expectedNeg);
        }
      }

      {
        let maxVal: Short = new Short(Short.MAX_VALUE);
        let minVal: Short = new Short(Short.MIN_VALUE);
        expect(maxVal.toLong().toInt()).assertEqual(32767);
        expect(minVal.toLong().toInt()).assertEqual(-32768);
        expect(maxVal.toLong().isGreaterThan(minVal.toLong())).assertTrue();
      }

      {
        let inputValue: short = 0 as short;
        let actualResult: long = Short.toLong(inputValue);
        expect(actualResult).assertEqual(Long.toLong(0));
      }

      {
        let inputValue: short = (1 << 10) as short;
        let expectedLong: long = Long.toLong(1024);
        expect(Short.toLong(inputValue)).assertEqual(expectedLong);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLONG_0400
     * @tc.name testShortToLong_merged4
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toLong, including type conversion, business scenarios, boundary values, negative values, and division and modulo.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLong_merged4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let inputValue: short = (-1) as short;
        let actualResult: long = Short.toLong(inputValue);
        expect(actualResult).assertEqual(Long.toLong(-1));
      }

      {
        let inputValue: short = Short.MIN_VALUE;
        let actualResult: long = Short.toLong(inputValue);
        expect(actualResult).assertEqual(Long.toLong(-32768));
      }

      {
        let inputValue: short = Short.MAX_VALUE;
        let actualResult: long = Short.toLong(inputValue);
        expect(actualResult).assertEqual(Long.toLong(32767));
      }

      {
        let repeatedValues: short[] = [
          0 as short,
          Short.MAX_VALUE,
          Short.MIN_VALUE
        ];
        let expectedValues: long[] = [
          Long.toLong(0),
          Long.toLong(32767),
          Long.toLong(-32768)
        ];
        let caseCount: int = 3;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let inputValue: short = repeatedValues[caseIndex];
          let firstResult: long = Short.toLong(inputValue);
          let secondResult: long = Short.toLong(inputValue);
          let thirdResult: long = Short.toLong(inputValue);
          expect(firstResult).assertEqual(expectedValues[caseIndex]);
          expect(secondResult).assertEqual(expectedValues[caseIndex]);
          expect(thirdResult).assertEqual(expectedValues[caseIndex]);
          expect(firstResult).assertEqual(secondResult);
          expect(secondResult).assertEqual(thirdResult);
        }
      }

      {
        let dividendValues: short[] = [100 as short, 1000 as short, 32767 as short];
        let divisorValues: short[] = [7 as short, 7 as short, 16 as short];
        let quotientValues: int[] = [14, 142, 2047];
        let remainderValues: int[] = [2, 6, 15];
        let caseCount: int = 3;
        for (let i: int = 0; i < caseCount; i++) {
          let dividendL: long = Short.toLong(dividendValues[i]);
          let divisorL: long = Short.toLong(divisorValues[i]);
          let quotient: long = dividendL.div(divisorL);
          expect(quotient).assertEqual(Long.toLong(quotientValues[i]));
          let recomposed: long = divisorL.mul(Long.toLong(quotientValues[i])).add(Long.toLong(remainderValues[i]));
          expect(recomposed).assertEqual(dividendL);
        }
      }

      {
        let valueSets: short[][] = [
          [10 as short, 20 as short, 30 as short],
          [7 as short, 8 as short, 9 as short],
          [100 as short, 150 as short, 200 as short]
        ];
        let expectedMeans: long[] = [
          Long.toLong(20),
          Long.toLong(8),
          Long.toLong(150)
        ];
        let setCount: int = 3;
        for (let s: int = 0; s < setCount; s++) {
          let sum: long = Long.toLong(0);
          for (let i: int = 0; i < 3; i++) {
            sum = sum.add(Short.toLong(valueSets[s][i]));
          }
          let mean: long = sum.div(Long.toLong(3));
          expect(mean).assertEqual(expectedMeans[s]);
        }
      }

      {
        let actualResult: long = Short.toLong(123 as short);
        let secondResult: long = Short.toLong(456 as short);
        let thirdResult: long = Short.toLong(789 as short);
        let fourthResult: long = Short.toLong(8765 as short);
        let fifthResult: long = Short.toLong(1 as short);
  
        expect(actualResult).assertEqual(Long.toLong(123));
        expect(secondResult).assertEqual(Long.toLong(456));
        expect(thirdResult).assertEqual(Long.toLong(789));
        expect(fourthResult).assertEqual(Long.toLong(8765));
        expect(fifthResult).assertEqual(Long.toLong(1));
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
        let expectedValues: long[] = [
          Long.toLong(1),
          Long.toLong(10),
          Long.toLong(100),
          Long.toLong(500),
          Long.toLong(1000),
          Long.toLong(5000),
          Long.toLong(10000),
          Long.toLong(20000),
          Long.toLong(30000),
          Long.toLong(32767)
        ];
        let caseCount: int = testValues.length;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let actualResult: long = Short.toLong(testValues[caseIndex]);
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
        let expectedValues: long[] = [
          Long.toLong(-1),
          Long.toLong(-10),
          Long.toLong(-100),
          Long.toLong(-500),
          Long.toLong(-1000),
          Long.toLong(-5000),
          Long.toLong(-10000),
          Long.toLong(-20000),
          Long.toLong(-30000),
          Long.toLong(-32768)
        ];
        let caseCount: int = testValues.length;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let actualResult: long = Short.toLong(testValues[caseIndex]);
          expect(actualResult).assertEqual(expectedValues[caseIndex]);
        }
      }

      {
        expect(Short.toLong(Short.MIN_VALUE).compareTo(Short.toLong((-1) as short)) < 0).assertTrue();
        expect(Short.toLong((-1) as short).compareTo(Short.toLong(0 as short)) < 0).assertTrue();
        expect(Short.toLong(0 as short).compareTo(Short.toLong(1 as short)) < 0).assertTrue();
        expect(Short.toLong(1 as short).compareTo(Short.toLong(Short.MAX_VALUE)) < 0).assertTrue();
        expect(Short.toLong(Short.MIN_VALUE)).assertEqual(Long.toLong(-32768));
        expect(Short.toLong((-1) as short)).assertEqual(Long.toLong(-1));
        expect(Short.toLong(0 as short)).assertEqual(Long.toLong(0));
        expect(Short.toLong(1 as short)).assertEqual(Long.toLong(1));
        expect(Short.toLong(Short.MAX_VALUE)).assertEqual(Long.toLong(32767));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLONG_0500
     * @tc.name testShortToLong_merged5
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toLong, including type conversion, positive values, negative values, radix conversion, and business scenarios.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLong_merged5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let testValues: short[] = [
          5 as short,
          50 as short,
          500 as short,
          5000 as short,
          20000 as short,
          32766 as short
        ];
        let expectedValues: long[] = [
          Long.toLong(5),
          Long.toLong(50),
          Long.toLong(500),
          Long.toLong(5000),
          Long.toLong(20000),
          Long.toLong(32766)
        ];
        let caseCount: int = testValues.length;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let boxedValue: Short = new Short(testValues[caseIndex]);
          let instanceResult: long = boxedValue.toLong();
          let staticResult: long = Short.toLong(testValues[caseIndex]);
          expect(instanceResult).assertEqual(expectedValues[caseIndex]);
          expect(staticResult).assertEqual(expectedValues[caseIndex]);
          expect(instanceResult).assertEqual(staticResult);
        }
      }

      {
        let testValues: short[] = [
          (-5) as short,
          (-50) as short,
          (-500) as short,
          (-5000) as short,
          (-20000) as short,
          (-32767) as short
        ];
        let expectedValues: long[] = [
          Long.toLong(-5),
          Long.toLong(-50),
          Long.toLong(-500),
          Long.toLong(-5000),
          Long.toLong(-20000),
          Long.toLong(-32767)
        ];
        let caseCount: int = testValues.length;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let boxedValue: Short = new Short(testValues[caseIndex]);
          let instanceResult: long = boxedValue.toLong();
          let staticResult: long = Short.toLong(testValues[caseIndex]);
          expect(instanceResult).assertEqual(expectedValues[caseIndex]);
          expect(staticResult).assertEqual(expectedValues[caseIndex]);
          expect(instanceResult).assertEqual(staticResult);
        }
      }

      {
        let parsedValue: int = Int.parseInt("9876", 10);
        let shortValue: short = Int.toShort(parsedValue);
        let actualResult: long = Short.toLong(shortValue);
        expect(actualResult).assertEqual(Long.toLong(9876));
      }

      {
        let parsedValue: int = Int.parseInt("-4321", 10);
        let shortValue: short = Int.toShort(parsedValue);
        let actualResult: long = Short.toLong(shortValue);
        expect(actualResult).assertEqual(Long.toLong(-4321));
      }

      {
        let chars: char[] = [c'A', c'\u03A9', c'\u4E2D', c'\u7FFF', c'\u8000', c'\uFF9C', c'\uFFFF'];
        for (let i: int = 0; i < chars.length; i++) {
          let shortValue: short = Char.toShort(chars[i]);
          let longValue: long = Short.toLong(shortValue);
          let restoredShort: short = Long.toShort(longValue);
          let restoredChar: char = Short.toChar(restoredShort);
          expect(restoredChar).assertEqual(chars[i]);
        }
      }

      {
        let shortValue: short = 100 as short;
        let longResult: long = Short.toLong(shortValue);
        let addend: long = Long.toLong(200);
        let sumResult: long = longResult + addend;
        expect(sumResult).assertEqual(Long.toLong(300));
      }

      {
        let shortValue: short = 500 as short;
        let longResult: long = Short.toLong(shortValue);
        let subtrahend: long = Long.toLong(150);
        let diffResult: long = longResult - subtrahend;
        expect(diffResult).assertEqual(Long.toLong(350));
      }

      {
        let shortValue: short = 50 as short;
        let longResult: long = Short.toLong(shortValue);
        let multiplier: long = Long.toLong(10);
        let prodResult: long = longResult * multiplier;
        expect(prodResult).assertEqual(Long.toLong(500));
      }

      {
        let shortValue: short = 1000 as short;
        let longResult: long = Short.toLong(shortValue);
        let divisor: long = Long.toLong(10);
        let quotResult: long = longResult / divisor;
        expect(quotResult).assertEqual(Long.toLong(100));
      }

      {
        let operandA: short = 100 as short;
        let operandB: short = 250 as short;
        let addResult: short = Int.toShort(operandA + operandB);
        let actualResult: long = Short.toLong(addResult);
        expect(actualResult).assertEqual(Long.toLong(350));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLONG_0600
     * @tc.name testShortToLong_merged6
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toLong, including type conversion, division and modulo, equality consistency, loop accumulation, and negative values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLong_merged6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let operandA: short = 800 as short;
        let operandB: short = 300 as short;
        let subResult: short = Int.toShort(operandA - operandB);
        let actualResult: long = Short.toLong(subResult);
        expect(actualResult).assertEqual(Long.toLong(500));
      }

      {
        let operandA: short = 600 as short;
        let operandB: short = 2 as short;
        let divResult: short = Int.toShort(operandA / operandB);
        let actualResult: long = Short.toLong(divResult);
        expect(actualResult).assertEqual(Long.toLong(300));
      }

      {
        let sumOfSquares: long = Long.toLong(0);
        for (let i: int = 1; i <= 10; i++) {
          let iShort: short = Int.toShort(i);
          sumOfSquares = sumOfSquares.add(Short.toLong(iShort).mul(Short.toLong(iShort)));
        }
        expect(sumOfSquares).assertEqual(Long.toLong(385));
      }

      {
        let negPow2: short[] = [(-1) as short, (-2) as short, (-4) as short, (-8) as short,
          (-16) as short, (-32) as short, (-64) as short, (-128) as short, (-256) as short,
          (-512) as short, (-1024) as short, (-2048) as short, (-4096) as short,
          (-8192) as short, (-16384) as short];
        for (let i: int = 0; i < negPow2.length; i++) {
          expect(Short.toLong(negPow2[i])).assertEqual(Long.toLong(Short.toInt(negPow2[i])));
        }
      }

      {
        let n1: short = 100 as short;
        let tri100: long = Short.toLong(n1).mul(Short.toLong(101 as short)).div(Long.toLong(2));
        expect(tri100).assertEqual(Long.toLong(5050));
        let n2: short = 1000 as short;
        let tri1000: long = Short.toLong(n2).mul(Short.toLong(1001 as short)).div(Long.toLong(2));
        expect(tri1000).assertEqual(Long.toLong(500500));
      }

      {
        let instanceA: Short = new Short(1111 as short);
        let instanceB: Short = new Short(2222 as short);
        let instanceC: Short = new Short(3333 as short);
        let resultA: long = Short.toLong(instanceA.toShort());
        let resultB: long = Short.toLong(instanceB.toShort());
        let resultC: long = Short.toLong(instanceC.toShort());
        expect(resultA).assertEqual(Long.toLong(1111));
        expect(resultB).assertEqual(Long.toLong(2222));
        expect(resultC).assertEqual(Long.toLong(3333));
      }

      {
        let shorts: short[] = [
          42 as short,
          7 as short,
          Short.MAX_VALUE,
          (-128) as short,
          1000 as short
        ];
        for (let i: int = 1; i < shorts.length; i++) {
          let key: short = shorts[i];
          let j: int = i - 1;
          while (j >= 0 && Short.toLong(shorts[j]) > Short.toLong(key)) {
            shorts[j + 1] = shorts[j];
            j = j - 1;
          }
          shorts[j + 1] = key;
        }
        let expectedOrder: short[] = [
          (-128) as short,
          7 as short,
          42 as short,
          1000 as short,
          Short.MAX_VALUE
        ];
        for (let i: int = 0; i < shorts.length; i++) {
          expect(shorts[i]).assertEqual(expectedOrder[i]);
        }
      }

      {
        let negOne: long = Short.toLong((-1) as short);
        let zero: long = Short.toLong(0 as short);
        let posOne: long = Short.toLong(1 as short);
        expect(zero.toInt()).assertEqual(0);
        expect(negOne.add(posOne).toInt()).assertEqual(0);
        expect(posOne.sub(negOne).toInt()).assertEqual(2);
        expect(zero.add(zero).toInt()).assertEqual(0);
      }

      {
        let powOf2Values: short[] = [
          1 as short,
          2 as short,
          4 as short,
          8 as short,
          16 as short,
          32 as short,
          64 as short,
          128 as short,
          256 as short,
          512 as short,
          1024 as short,
          2048 as short,
          4096 as short,
          8192 as short,
          16384 as short
        ];
        let caseCount: int = powOf2Values.length;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let intValue: int = Short.toInt(powOf2Values[caseIndex]);
          let expectedValue: long = Long.toLong(intValue);
          let actualResult: long = Short.toLong(powOf2Values[caseIndex]);
          expect(actualResult).assertEqual(expectedValue);
        }
      }

      {
        let balance: long = Long.toLong(0);
        balance = balance.add(Short.toLong(Short.MAX_VALUE));
        balance = balance.sub(Short.toLong(10000 as short));
        balance = balance.add(Short.toLong(12345 as short));
        balance = balance.sub(Short.toLong(Short.MAX_VALUE));
        expect(balance.toInt()).assertEqual(2345);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLONG_0700
     * @tc.name testShortToLong_merged7
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toLong, including type conversion, comparison and ordering, negative values, string conversion, and equality consistency.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLong_merged7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let shortInput: short = 8765 as short;
        let longResult: long = Short.toLong(shortInput);
        expect(longResult).assertEqual(Long.toLong(8765));
        let roundTripCheck: long = Long.toLong(8765);
        expect(longResult).assertEqual(roundTripCheck);
      }

      {
        let productPos: long = Short.toLong(300 as short).mul(Short.toLong(300 as short));
        expect(productPos.toInt()).assertEqual(90000);
        expect(productPos.toString()).assertEqual("90000");
        let productNeg: long = Short.toLong((-300) as short).mul(Short.toLong(300 as short));
        expect(productNeg.toInt()).assertEqual(-90000);
        expect(productNeg.toString()).assertEqual("-90000");
      }

      {
        let aLong: long = Short.toLong(200 as short);
        let bLong: long = Short.toLong(25 as short);
        let aPlusB: long = aLong.add(bLong);
        let leftSquare: long = aPlusB.mul(aPlusB);
        let rightSquare: long = aLong.mul(aLong).add(Long.toLong(2).mul(aLong).mul(bLong)).add(bLong.mul(bLong));
        expect(leftSquare).assertEqual(Long.toLong(50625));
        expect(leftSquare).assertEqual(rightSquare);
        expect(rightSquare.toInt()).assertEqual(50625);
      }

      {
        let fromPosByte: Short = new Short(Byte.toShort(100 as byte));
        let fromNegByte: Short = new Short(Byte.toShort((-50) as byte));
        expect(Short.toLong(Byte.toShort(100 as byte))).assertEqual(Long.toLong(100));
        expect(Short.toLong(Byte.toShort((-50) as byte))).assertEqual(Long.toLong(-50));
        expect(fromPosByte.toLong()).assertEqual(Long.toLong(100));
        expect(fromNegByte.toLong()).assertEqual(Long.toLong(-50));
      }

      {
        let a: long = Short.toLong(500 as short);
        let b: long = Short.toLong((-500) as short);
        expect((a > Long.toLong(0)).valueOf()).assertTrue();
        expect((a > Long.toLong(400)).valueOf()).assertTrue();
        expect((b > Long.toLong(-1000)).valueOf()).assertTrue();
        expect(a).assertEqual(Long.toLong(500));
        expect(b).assertEqual(Long.toLong(-500));
      }

      {
        let a: long = Short.toLong(100 as short);
        let b: long = Short.toLong((-300) as short);
        expect((a < Long.toLong(200)).valueOf()).assertTrue();
        expect((b < Long.toLong(0)).valueOf()).assertTrue();
        expect(a).assertEqual(Long.toLong(100));
        expect(b).assertEqual(Long.toLong(-300));
      }

      {
        let opA: Short = new Short(150 as short);
        let opB: Short = new Short(250 as short);
        let sumBox: Short = opA.add(opB);
        let sumLong: long = sumBox.toLong();
        expect(sumBox.toShort()).assertEqual(400 as short);
        expect(sumLong).assertEqual(Long.toLong(400));
      }

      {
        let opA: Short = new Short(800 as short);
        let opB: Short = new Short(350 as short);
        let diffBox: Short = opA.sub(opB);
        let diffLong: long = diffBox.toLong();
        expect(diffBox.toShort()).assertEqual(450 as short);
        expect(diffLong).assertEqual(Long.toLong(450));
      }

      {
        let opA: Short = new Short(30 as short);
        let opB: Short = new Short(20 as short);
        let prodBox: Short = opA.mul(opB);
        let prodLong: long = prodBox.toLong();
        expect(prodBox.toShort()).assertEqual(600 as short);
        expect(prodLong).assertEqual(Long.toLong(600));
      }

      {
        let opA: Short = new Short(900 as short);
        let opB: Short = new Short(3 as short);
        let quotBox: Short = opA.div(opB);
        let quotLong: long = quotBox.toLong();
        expect(quotBox.toShort()).assertEqual(300 as short);
        expect(quotLong).assertEqual(Long.toLong(300));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLONG_0800
     * @tc.name testShortToLong_merged8
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toLong, including type conversion, equality consistency, negative values, round-trip conversion, and loop accumulation.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLong_merged8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let box1: Short = new Short(777 as short);
        let box2: Short = new Short(777 as short);
        let box3: Short = new Short(777 as short);
        expect(box1.toLong()).assertEqual(Long.toLong(777));
        expect(box2.toLong()).assertEqual(Long.toLong(777));
        expect(box3.toLong()).assertEqual(Long.toLong(777));
        expect(box1.toLong()).assertEqual(box2.toLong());
        expect(box2.toLong()).assertEqual(box3.toLong());
      }

      {
        let originalShort: short = 1234 as short;
        let toDoubleVal: double = Short.toDouble(originalShort);
        let backToShort: short = Double.toShort(toDoubleVal);
        let toLongVal: long = Short.toLong(backToShort);
        expect(backToShort).assertEqual(originalShort);
        expect(toLongVal).assertEqual(Long.toLong(1234));
      }

      {
        let aLong: long = Short.toLong(200 as short);
        let bLong: long = Short.toLong(60 as short);
        let aSq: long = aLong.mul(aLong);
        let bSq: long = bLong.mul(bLong);
        let leftDiff: long = aSq.sub(bSq);
        let rightDiff: long = (aLong.add(bLong)).mul((aLong.sub(bLong)));
        expect(leftDiff).assertEqual(Long.toLong(36400));
        expect(rightDiff).assertEqual(leftDiff);
      }

      {
        let minLong: long = Short.toLong(Short.MIN_VALUE).sub(Long.toLong(1));
        expect(minLong.toInt()).assertEqual(-32769);
      }

      {
        let a: long = Short.toLong(10 as short);
        let b: long = Short.toLong(20 as short);
        let c: long = Short.toLong(3 as short);
        let combined: long = (a + b) * c;
        expect(combined).assertEqual(Long.toLong(90));
      }

      {
        let magValues: short[] = [999 as short, 1000 as short, 1001 as short,
          9999 as short, 10000 as short, 10001 as short,
          (-999) as short, (-1000) as short, (-1001) as short,
          (-9999) as short, (-10000) as short, (-10001) as short];
        for (let i: int = 0; i < magValues.length; i++) {
          expect(Short.toLong(magValues[i])).assertEqual(Long.toLong(Short.toInt(magValues[i])));
        }
      }

      {
        let boxA: Short = new Short(111 as short);
        let boxB: Short = new Short(222 as short);
        let a1: long = boxA.toLong();
        let b1: long = boxB.toLong();
        let a2: long = boxA.toLong();
        let b2: long = boxB.toLong();
        expect(a1).assertEqual(Long.toLong(111));
        expect(b1).assertEqual(Long.toLong(222));
        expect(a2).assertEqual(Long.toLong(111));
        expect(b2).assertEqual(Long.toLong(222));
        expect(a1).assertEqual(a2);
        expect(b1).assertEqual(b2);
      }

      {
        let a: long = Short.toLong(1111 as short);
        expect((a >= Long.toLong(1111)).valueOf()).assertTrue();
        expect((a <= Long.toLong(1111)).valueOf()).assertTrue();
        expect((a === Long.toLong(1111)).valueOf()).assertTrue();
        expect((a !== Long.toLong(1112)).valueOf()).assertTrue();
        expect((a >= Long.toLong(1112)).valueOf()).assertFalse();
        expect((a <= Long.toLong(1110)).valueOf()).assertFalse();
      }

      {
        for (let i: int = -2048; i <= 2047; i++) {
          expect(Short.toLong(Int.toShort(i))).assertEqual(Long.toLong(i));
        }
      }

      {
        let negHexBox: Short = new Short((-0x10) as short);
        let negOctBox: Short = new Short((-0o100) as short);
        let negBinBox: Short = new Short((-0b1010) as short);
        expect(negHexBox.toLong()).assertEqual(Long.toLong(-16));
        expect(negOctBox.toLong()).assertEqual(Long.toLong(-64));
        expect(negBinBox.toLong()).assertEqual(Long.toLong(-10));
        expect(negHexBox.toLong()).assertEqual(Short.toLong((-0x10) as short));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLONG_0900
     * @tc.name testShortToLong_merged9
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toLong, including type conversion, negative values, division and modulo, loop accumulation, and round-trip conversion.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLong_merged9', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let blockCount: Short = new Short(1000 as short);
        let blockSize: Short = new Short(32767 as short);
  
        let totalSize: long = blockCount.toLong().mul(blockSize.toLong());
        expect(totalSize.toInt()).assertEqual(1000 * 32767);
  
        let intTotal: int = blockCount.toInt() * blockSize.toInt();
        expect(totalSize.toInt()).assertEqual(intTotal);
      }

      {
        let bootTimeSec: Short = new Short(10000 as short);
        let uptimeSec: Short = new Short(3600 as short);
  
        let bootMs: long = bootTimeSec.toLong().mul(Long.toLong(1000));
        let uptimeMs: long = uptimeSec.toLong().mul(Long.toLong(1000));
  
        let currentTimeMs: long = bootMs.add(uptimeMs);
        expect(currentTimeMs.toInt()).assertEqual(13600000);
  
        let diffMs: long = currentTimeMs.sub(bootMs);
        expect(diffMs.toInt()).assertEqual(3600000);
      }

      {
        let dataMB: Short = new Short(100 as short);
        let durationSec: Short = new Short(60 as short);
  
        let dataBytes: long = dataMB.toLong().mul(Long.toLong(1024 * 1024));
        let dataBits: long = dataBytes.mul(Long.toLong(8));
  
        let bps: long = dataBits.div(durationSec.toLong());
  
        expect(bps.toInt()).assertEqual(13981013);
      }

      {
        let actualResult: long = Short.toLong(1 as short);
        expect(actualResult).assertEqual(Long.toLong(1));
      }

      {
        let testValues: short[] = [
          Short.MIN_VALUE, (-20000) as short, (-1) as short, 0 as short,
          1 as short, 20000 as short, Short.MAX_VALUE
        ];
        let caseCount: int = testValues.length;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let actualResult: long = Short.toLong(testValues[caseIndex]);
          expect(actualResult.compareTo(Long.toLong(-32768)) >= 0).assertTrue();
          expect(actualResult.compareTo(Long.toLong(32767)) <= 0).assertTrue();
          expect(actualResult).assertEqual(Long.toLong(testValues[caseIndex]));
        }
      }

      {
        let base: long = Short.toLong(5 as short);
        let exp: int = 7;
        let result: long = Long.toLong(1);
        for (let i: int = 0; i < exp; i++) {
          result = result.mul(base);
        }
        expect(result.toInt()).assertEqual(78125);
      }

      {
        let a: Short = new Short(0x7F as short);
        let b: Short = new Short(0x55 as short);
        let aLong: long = a.toLong();
        let bLongVal: int = Short.toInt(b.toShort()) & 0xFFFF;
        let packed: long = aLong.mul(Long.toLong(65536)).add(Long.toLong(bLongVal));
        let expectedVal: int = 0x7F * 65536 + 0x55;
        expect(packed.toInt()).assertEqual(expectedVal);
      }

      {
        let fPrev: long = Short.toLong(1 as short);
        let fCurr: long = Short.toLong(1 as short);
        for (let i: int = 3; i <= 10; i++) {
          let fNext: long = fPrev.add(fCurr);
          fPrev = fCurr;
          fCurr = fNext;
        }
        expect(fCurr.toInt()).assertEqual(55);
        for (let i: int = 11; i <= 23; i++) {
          let fNext: long = fPrev.add(fCurr);
          fPrev = fCurr;
          fCurr = fNext;
        }
        expect(fCurr.toInt()).assertEqual(28657);
      }

      {
        let testValues: short[] = [
          Short.MIN_VALUE, (-1) as short, 0 as short, 1 as short,
          Short.MAX_VALUE, 12345 as short, (-12345) as short
        ];
        let caseCount: int = testValues.length;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let longVal: long = Short.toLong(testValues[caseIndex]);
          let backToShort: short = Int.toShort(longVal.toInt());
          expect(backToShort).assertEqual(testValues[caseIndex]);
        }
      }

      {
        let negativeValues: short[] = [
          (-1) as short, (-128) as short, (-256) as short,
          (-1024) as short, (-10000) as short, Short.MIN_VALUE
        ];
        let caseCount: int = negativeValues.length;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let actualResult: long = Short.toLong(negativeValues[caseIndex]);
          let expectedResult: long = Long.toLong(Short.toInt(negativeValues[caseIndex]));
          expect(actualResult).assertEqual(expectedResult);
          expect(actualResult.compareTo(Long.toLong(0)) < 0).assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLONG_1000
     * @tc.name testShortToLong_merged10
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toLong, including type conversion, business scenarios, round-trip conversion, and division and modulo.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLong_merged10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let testValues: int[] = Array.create<int>(1000, 0);
        let seed: int = 12345;
        for (let i: int = 0; i < 1000; i++) {
          seed = (seed * 1103515245 + 12345) & 0x7FFFFFFF;
          testValues[i] = (seed % 65536) - 32768;
        }
        let caseCount: int = testValues.length;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let shortVal: short = Int.toShort(testValues[caseIndex]);
          let boxedValue: Short = new Short(shortVal);
          let instanceResult: long = boxedValue.toLong();
          let staticResult: long = Short.toLong(shortVal);
          expect(instanceResult).assertEqual(staticResult);
          expect(instanceResult).assertEqual(Long.toLong(testValues[caseIndex]));
        }
      }

      {
        let originalValues: int[] = [-30000, -1, 0, 1, 100, 30000];
        let caseCount: int = originalValues.length;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let longVal: long = Long.toLong(originalValues[caseIndex]);
          let shortFromLong: short = Int.toShort(longVal.toInt());
          let backToLong: long = Short.toLong(shortFromLong);
          let expectedVal: int = originalValues[caseIndex];
          if (expectedVal < -32768 || expectedVal > 32767) {
            let wrapped: int = ((expectedVal % 65536) + 65536) % 65536;
            if (wrapped > 32767) {
              wrapped = wrapped - 65536;
            }
            expectedVal = wrapped;
          }
          expect(backToLong.toInt()).assertEqual(expectedVal);
        }
      }

      {
        let originalValue: short = 12345 as short;
        let scale: short = 100 as short;
        let scaled: long = Short.toLong(originalValue).mul(Short.toLong(scale));
        let restored: long = scaled.div(Short.toLong(scale));
        expect(restored).assertEqual(Short.toLong(originalValue));
        let negativeValue: short = (-12345) as short;
        let scaledNeg: long = Short.toLong(negativeValue).mul(Short.toLong(scale));
        let restoredNeg: long = scaledNeg.div(Short.toLong(scale));
        expect(restoredNeg).assertEqual(Short.toLong(negativeValue));
        expect(restoredNeg.toInt()).assertEqual(-12345);
      }

      {
        let h1: Short = new Short(0x12AB as short);
        let h2: Short = new Short(0x34CD as short);
        let h1Long: long = h1.toLong();
        let h2Long: long = h2.toLong();
        let h1Int: int = h1Long.toInt() & 0xFFFF;
        let h2Int: int = h2Long.toInt() & 0xFFFF;
        let hashInt: int = (h1Int << 16) ^ h2Int;
        let hashLong: long = Long.toLong(hashInt);
        expect(hashLong.toInt()).assertEqual(hashInt);
      }

      {
        let percent75: long = Short.toLong(3 as short).mul(Long.toLong(100)).div(Short.toLong(4 as short));
        expect(percent75.toInt()).assertEqual(75);
        let percent33: long = Short.toLong(1 as short).mul(Long.toLong(100)).div(Short.toLong(3 as short));
        expect(percent33.toInt()).assertEqual(33);
        let percent66: long = Short.toLong(2 as short).mul(Long.toLong(100)).div(Short.toLong(3 as short));
        expect(percent66.toInt()).assertEqual(66);
      }

      {
        let initialHash: Short = new Short(0 as short);
        let nextValue: Short = new Short(42 as short);
        let hashLong: long = initialHash.toLong();
        let fnvPrime: long = Long.toLong(16777619);
        let fnvHash: long = hashLong.mul(fnvPrime).add(nextValue.toLong());
        expect(fnvHash.toInt()).assertEqual(42);
      }

      {
        let seed: Short = new Short(12345 as short);
        let seedLong: long = seed.toLong();
        let multiplier: long = Long.toLong(1103515245);
        let addend: long = Long.toLong(12345);
        let lcgResult: long = seedLong.mul(multiplier).add(addend);
        let expectedVal: int = 12345 * 1103515245 + 12345;
        expect(lcgResult.toInt()).assertEqual(expectedVal);
      }

      {
        let baseVal: Short = new Short(7 as short);
        let exp: int = 4;
        let modulus: long = Long.toLong(13);
        let result: long = baseVal.toLong();
        let total: long = Long.toLong(1);
        for (let i: int = 0; i < exp; i++) {
          total = total.mul(result);
        }
        let modResult: long = total.div(modulus);
        let remainder: long = total.sub(modResult.mul(modulus));
        expect(remainder.toInt()).assertEqual(9);
      }

      {
        let symbol: Short = new Short(128 as short);
        let alpha: Short = new Short(2 as short);
        let syndrome: long = symbol.toLong().mul(alpha.toLong().mul(Long.toLong(3)));
        expect(syndrome.toInt()).assertEqual(128 * 2 * 3);
      }

      {
        let p0: Short = new Short(100 as short);
        let p1: Short = new Short(200 as short);
        let p2: Short = new Short(300 as short);
        let t: int = 50;
        let tLong: long = Long.toLong(t);
        let oneMinusT: long = Long.toLong(100 - t);
        let resultBez: long = p0.toLong().mul(oneMinusT).mul(oneMinusT).div(Long.toLong(10000))
          .add(p1.toLong().mul(tLong).mul(oneMinusT).mul(Long.toLong(2)).div(Long.toLong(10000)))
          .add(p2.toLong().mul(tLong).mul(tLong).div(Long.toLong(10000)));
        expect(resultBez.toInt()).assertEqual(200);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLONG_1100
     * @tc.name testShortToLong_merged11
     * @tc.desc CrossTypeRoundTrip / RadixConversion / Idempotent: covers 10 merged test points for Short.toLong, including type conversion, radix conversion, business scenarios, equality consistency, and precision.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLong_merged11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dataLen: Short = new Short(1000 as short);
        let blockSize: Short = new Short(16 as short);
        let dataLong: long = dataLen.toLong();
        let blockLong: long = blockSize.toLong();
        let remainder: long = dataLong.sub(dataLong.div(blockLong).mul(blockLong));
        let paddingNeeded: long = Long.toLong(0);
        if (remainder.toInt() !== 0) {
          paddingNeeded = blockLong.sub(remainder);
        }
        let paddedLen: long = dataLong.add(paddingNeeded);
        expect(paddedLen.toInt() % 16).assertEqual(0);
      }

      {
        let mass: Short = new Short(100 as short);
        let velocity: Short = new Short(50 as short);
        let massLong: long = mass.toLong();
        let velocityLong: long = velocity.toLong();
        let momentum: long = massLong.mul(velocityLong);
        expect(momentum.toInt()).assertEqual(5000);
      }

      {
        let testVals: short[] = [0x0000 as short, 0x7FFF as short, Short.MIN_VALUE, 0x5555 as short, 0x00FF as short];
        for (let i: int = 0; i < testVals.length; i++) {
          let s: Short = new Short(testVals[i]);
          let lv: long = s.toLong();
          let masked: int = lv.toInt() & 0xFFFF;
          let expected: int = Short.toInt(testVals[i]) & 0xFFFF;
          expect(masked).assertEqual(expected);
        }
      }

      {
        let hexValue: int = 0x1234;
        let shortValue: short = Int.toShort(hexValue);
        let actualResult: long = Short.toLong(shortValue);
        expect(actualResult).assertEqual(Long.toLong(4660));
      }

      {
        let sortedShorts: short[] = [10 as short, 20 as short, 30 as short, 40 as short, 50 as short, 60 as short, 70 as short, 80 as short, 90 as short, 100 as short];
        let target: short = 70 as short;
        let low: int = 0;
        let high: int = sortedShorts.length - 1;
        let foundIndex: int = -1;
        while (low <= high) {
          let mid: int = low + ((high - low) >> 1);
          let cmpResult: int = Short.toLong(sortedShorts[mid]).compareTo(Short.toLong(target));
          if (cmpResult === 0) {
            foundIndex = mid;
            break;
          } else if (cmpResult < 0) {
            low = mid + 1;
          } else {
            high = mid - 1;
          }
        }
        expect(foundIndex).assertEqual(6);
        let missingTarget: short = 35 as short;
        let low2: int = 0;
        let high2: int = sortedShorts.length - 1;
        let foundMissing: boolean = false;
        while (low2 <= high2) {
          let mid2: int = low2 + ((high2 - low2) >> 1);
          let cmpMissing: int = Short.toLong(sortedShorts[mid2]).compareTo(Short.toLong(missingTarget));
          if (cmpMissing === 0) {
            foundMissing = true;
            break;
          } else if (cmpMissing < 0) {
            low2 = mid2 + 1;
          } else {
            high2 = mid2 - 1;
          }
        }
        expect(foundMissing).assertFalse();
      }

      {
        expect(Short.toLong(0x10 as short)).assertEqual(Long.toLong(16));
        expect(Short.toLong(0xFF as short)).assertEqual(Long.toLong(255));
        expect(Short.toLong(0x100 as short)).assertEqual(Long.toLong(256));
        expect(Short.toLong(0x1000 as short)).assertEqual(Long.toLong(4096));
        expect(Short.toLong(0x7FFF as short)).assertEqual(Long.toLong(32767));
      }

      {
        expect(Short.toLong((-0x10) as short)).assertEqual(Long.toLong(-16));
        expect(Short.toLong((-0x64) as short)).assertEqual(Long.toLong(-100));
        expect(Short.toLong((-0x100) as short)).assertEqual(Long.toLong(-256));
      }

      {
        let digit3: short = Char.toShort(c'3');
        expect(Short.toLong(digit3)).assertEqual(Long.toLong(51));
        let digit7: short = Char.toShort(c'7');
        expect(Short.toLong(digit7)).assertEqual(Long.toLong(55));
        let upperB: short = Char.toShort(c'B');
        expect(Short.toLong(upperB)).assertEqual(Long.toLong(66));
        let lowerY: short = Char.toShort(c'y');
        expect(Short.toLong(lowerY)).assertEqual(Long.toLong(121));
        let punctMark: short = Char.toShort(c'!');
        expect(Short.toLong(punctMark)).assertEqual(Long.toLong(33));
      }

      {
        let directInputValue: short = 1024 as short;
        let intermediateValue: short = 1024 as short;
        let directResult: long = Short.toLong(directInputValue);
        let intermediateResult: long = Short.toLong(intermediateValue);
        let repeatedResult: long = Short.toLong(1024 as short);
        expect(directResult).assertEqual(Long.toLong(1024));
        expect(intermediateResult).assertEqual(Long.toLong(1024));
        expect(repeatedResult).assertEqual(Long.toLong(1024));
        expect(directResult).assertEqual(intermediateResult);
        expect(intermediateResult).assertEqual(repeatedResult);
      }

      {
        let hexLong: long = Short.toLong(0x7FFF as short);
        let intLong: long = Short.toLong(Int.toShort(32767));
        expect(hexLong.equals(intLong)).assertTrue();
        expect(Short.toLong(0x5555 as short).toInt()).assertEqual(0x5555);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLONG_1200
     * @tc.name testShortToLong_merged12
     * @tc.desc Idempotent / BusinessScenario: covers 10 merged test points for Short.toLong, including type conversion, equality consistency, idempotence, loop accumulation, and zero values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLong_merged12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let accum: long = Long.toLong(0);
        for (let i: int = 0; i < 1000; i++) {
          accum = accum.add(Short.toLong(1 as short));
        }
        expect(accum.toInt()).assertEqual(1000);
      }

      {
        let aLong: long = Short.toLong(400 as short);
        let bLong: long = Short.toLong(50 as short);
        let cLong: long = Short.toLong(6 as short);
        let leftAdd: long = (aLong.add(bLong)).add(cLong);
        let rightAdd: long = aLong.add((bLong.add(cLong)));
        expect(leftAdd).assertEqual(Long.toLong(456));
        expect(rightAdd).assertEqual(leftAdd);
        let leftMul: long = (aLong.mul(bLong)).mul(cLong);
        let rightMul: long = aLong.mul((bLong.mul(cLong)));
        expect(leftMul).assertEqual(Long.toLong(120000));
        expect(rightMul).assertEqual(leftMul);
      }

      {
        let box: Short = new Short(567 as short);
        let callCount: int = 10;
        let results: long[] = Array.create<long>(callCount, Long.toLong(0));
        for (let i: int = 0; i < callCount; i++) {
          results[i] = box.toLong();
        }
        for (let i: int = 0; i < callCount; i++) {
          expect(results[i]).assertEqual(Long.toLong(567));
        }
        for (let i: int = 1; i < callCount; i++) {
          expect(results[i]).assertEqual(results[0]);
        }
      }

      {
        let pairs: short[] = [1 as short, (-1) as short, 256 as short, (-256) as short,
          1024 as short, (-1024) as short, 10000 as short, (-10000) as short];
        let expectedPairs: long[] = [
          Long.toLong(1), Long.toLong(-1), Long.toLong(256), Long.toLong(-256),
          Long.toLong(1024), Long.toLong(-1024), Long.toLong(10000), Long.toLong(-10000)
        ];
        let count: int = 8;
        for (let i: int = 0; i < count; i++) {
          expect(Short.toLong(pairs[i])).assertEqual(expectedPairs[i]);
        }
      }

      {
        let testVals: short[] = [(-9999) as short, (-1) as short, 0 as short, 1 as short, 9999 as short,
          Short.MAX_VALUE, Short.MIN_VALUE];
        let expectedVals: long[] = [
          Long.toLong(-9999), Long.toLong(-1), Long.toLong(0), Long.toLong(1),
          Long.toLong(9999), Long.toLong(32767), Long.toLong(-32768)
        ];
        let count: int = 7;
        for (let i: int = 0; i < count; i++) {
          let staticResult: long = Short.toLong(testVals[i]);
          let box: Short = new Short(testVals[i]);
          let instanceResult: long = box.toLong();
          expect(staticResult).assertEqual(expectedVals[i]);
          expect(instanceResult).assertEqual(expectedVals[i]);
          expect(staticResult).assertEqual(instanceResult);
          expect(box.toShort()).assertEqual(testVals[i]);
        }
      }

      {
        let testValues: short[] = [
          Short.MIN_VALUE, (-12345) as short, (-1) as short,
          0 as short, 1 as short, 12345 as short, Short.MAX_VALUE
        ];
        let caseCount: int = testValues.length;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let longResult: long = Short.toLong(testValues[caseIndex]);
          let intToLongResult: long = Long.toLong(Short.toInt(testValues[caseIndex]));
          expect(longResult).assertEqual(intToLongResult);
        }
      }

      {
        let testValues: short[] = [
          (-10000) as short, (-1) as short, 0 as short,
          1 as short, 10000 as short, Short.MAX_VALUE
        ];
        let caseCount: int = testValues.length;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let longResult: long = Short.toLong(testValues[caseIndex]);
          let doubleFromLong: double = Int.toDouble(longResult.toInt());
          let doubleFromShort: double = Short.toDouble(testValues[caseIndex]);
          expect(doubleFromLong).assertEqual(doubleFromShort);
        }
      }

      {
        let vals: Short[] = [
          new Short(0 as short), new Short(Short.MAX_VALUE), new Short(Short.MIN_VALUE),
          new Short(1 as short), new Short((-1) as short), new Short(12345 as short)
        ];
        for (let i: int = 0; i < vals.length; i++) {
          expect(vals[i].toLong().toInt()).assertEqual(vals[i].toInt());
        }
      }

      {
        let datePart: Short = new Short(365 as short);
        let timePart: Short = new Short(Int.toShort(20000));
        let dateLong: long = datePart.toLong().mul(Long.toLong(86400));
        let timestamp: long = dateLong.add(timePart.toLong());
        expect(timestamp.toInt()).assertEqual(365 * 86400 + 20000);
      }

      {
        let itemCount: Short = new Short(150 as short);
        let centsPerItem: Short = new Short(99 as short);
        let totalCents: long = itemCount.toLong().mul(centsPerItem.toLong());
        let totalDollars: long = totalCents.div(Long.toLong(100));
        expect(totalDollars.toInt()).assertEqual(148);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLONG_1300
     * @tc.name testShortToLong_merged13
     * @tc.desc BusinessScenario / Other: covers 10 merged test points for Short.toLong, including business scenarios and loop accumulation.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLong_merged13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let subCounts: short[] = [
          5000 as short, 10000 as short, 15000 as short,
          20000 as short, 25000 as short, 30000 as short
        ];
        let totalPopulation: long = Long.toLong(0);
        let caseCount: int = subCounts.length;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          totalPopulation = totalPopulation.add(Short.toLong(subCounts[caseIndex]));
        }
        expect(totalPopulation.toInt()).assertEqual(105000);
      }

      {
        let segment: Short = new Short(0x1000 as short);
        let offset: Short = new Short(0x00FF as short);
        let segmentLong: long = segment.toLong().mul(Long.toLong(16));
        let linearAddress: long = segmentLong.add(offset.toLong());
        expect(linearAddress.toInt()).assertEqual(0x1000 * 16 + 0x00FF);
      }

      {
        let crcLow: Short = new Short(0x4321 as short);
        let crcHigh: Short = new Short(Int.toShort(0x8765));
        let crcLowLong: long = Long.toLong(Short.toInt(crcLow.toShort()) & 0xFFFF);
        let crcHighLong: long = crcHigh.toLong().mul(Long.toLong(65536));
        let crc32: long = crcHighLong.add(crcLowLong);
        let expectedVal: int = ((0x8765 & 0xFFFF) << 16) | (0x4321 & 0xFFFF);
        expect(crc32.toInt()).assertEqual(expectedVal);
      }

      {
        let fields: Short[] = [new Short(1024 as short), new Short(3 as short)];
        let radix: long = Long.toLong(65536);
        let composite: long = Long.toLong(0);
        for (let i: int = 0; i < fields.length; i++) {
          composite = composite.mul(radix).add(fields[i].toLong());
        }
        expect(composite.toInt()).assertEqual(1024 * 65536 + 3);
      }

      {
        let sampleCount: int = 200;
        let sampleValue: short = 30000 as short;
        let accum: long = Long.toLong(0);
        for (let i: int = 0; i < sampleCount; i++) {
          accum = accum.add(Short.toLong(sampleValue));
        }
        let average: int = accum.div(Long.toLong(sampleCount)).toInt();
        expect(accum.toInt()).assertEqual(30000 * 200);
        expect(average).assertEqual(30000);
      }

      {
        let s0: Short = new Short(0x0001 as short);
        let s1: Short = new Short(0x0002 as short);
        let s2: Short = new Short(0x0003 as short);
        let s3: Short = new Short(0x0004 as short);
        let pack1: long = s0.toLong().mul(Long.toLong(65536)).add(
          Long.toLong(Short.toInt(s1.toShort()) & 0xFFFF));
        let pack2: long = s2.toLong().mul(Long.toLong(65536)).add(
          Long.toLong(Short.toInt(s3.toShort()) & 0xFFFF));
        expect(pack1.toInt()).assertEqual(0x00010002);
        expect(pack2.toInt()).assertEqual(0x00030004);
      }

      {
        let hours: Short = new Short(24 as short);
        let millisPerHour: long = Long.toLong(3600000);
        let totalMillis: long = hours.toLong().mul(millisPerHour);
        expect(totalMillis.toInt()).assertEqual(24 * 3600000);
      }

      {
        let packetCount: int = 150;
        let packetSize: short = 1400 as short;
        let totalThroughput: long = Long.toLong(0);
        for (let i: int = 0; i < packetCount; i++) {
          totalThroughput = totalThroughput.add(Short.toLong(packetSize));
        }
        expect(totalThroughput.toInt()).assertEqual(150 * 1400);
      }

      {
        let values: short[] = [
          100 as short, 200 as short, 300 as short, 400 as short
        ];
        let pairSum1: long = Short.toLong(values[0]).add(Short.toLong(values[1]));
        let pairSum2: long = Short.toLong(values[2]).add(Short.toLong(values[3]));
        let totalSum: long = pairSum1.add(pairSum2);
        expect(pairSum1.toInt()).assertEqual(300);
        expect(pairSum2.toInt()).assertEqual(700);
        expect(totalSum.toInt()).assertEqual(1000);
      }

      {
        let principal: Short = new Short(10000 as short);
        let rate: Short = new Short(5 as short);
  
        let pLong: long = principal.toLong();
        let rLong: long = rate.toLong();
  
        let year1: long = pLong.add(pLong.mul(rLong).div(Long.toLong(100)));
        let year2: long = year1.add(year1.mul(rLong).div(Long.toLong(100)));
        let year3: long = year2.add(year2.mul(rLong).div(Long.toLong(100)));
  
        expect(year3.toInt()).assertEqual(11576);
      }
    });

  });
}