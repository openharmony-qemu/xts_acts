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

export default function shortToDoubleTest(): void {
  describe('ShortToDoubleTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TODOUBLE_0100
     * @tc.name testShortToDouble_merged1
     * @tc.desc BoundaryOverflow: covers 10 merged test points for Short.toDouble, including type conversion, boundary values, zero values, business scenarios, and wrapping.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToDouble_merged1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let maxShortValue: short = Short.MAX_VALUE;
        let actualResult: double = Short.toDouble(maxShortValue);
        expect(actualResult).assertEqual(32767.0);
      }

      {
        let minShortValue: short = Short.MIN_VALUE;
        let actualResult: double = Short.toDouble(minShortValue);
        expect(actualResult).assertEqual(-32768.0);
      }

      {
        let testValues: short[] = [
          0 as short,
          1 as short,
          (-1) as short,
          32766 as short,
          (-32767) as short,
          127 as short,
          (-128) as short
        ];
        let expectedValues: double[] = [
          0.0,
          1.0,
          -1.0,
          32766.0,
          -32767.0,
          127.0,
          -128.0
        ];
        let caseCount: int = 7;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let actualResult: double = Short.toDouble(testValues[caseIndex]);
          expect(actualResult).assertEqual(expectedValues[caseIndex]);
        }
      }

      {
        let charInputs: char[] = [c'A', c'z', c'\u00FF', c'\u1234', c'\u4E2D', c'\uFFFF'];
        let expectedValues: double[] = [65.0, 122.0, 255.0, 4660.0, 20013.0, (-1.0)];
        let caseCount: int = 6;
        for (let i: int = 0; i < caseCount; i++) {
          let derivedShort: short = Char.toShort(charInputs[i]);
          expect(Short.toDouble(derivedShort)).assertEqual(expectedValues[i]);
        }
      }

      {
        let testValues: short[] = [
          0 as short,
          256 as short,
          (-128) as short,
          Short.MAX_VALUE,
          Short.MIN_VALUE
        ];
        let expectedValues: double[] = [
          0.0,
          256.0,
          -128.0,
          32767.0,
          -32768.0
        ];
        let caseCount: int = 5;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let firstResult: double = Short.toDouble(testValues[caseIndex]);
          let secondResult: double = Short.toDouble(testValues[caseIndex]);
          let thirdResult: double = Short.toDouble(testValues[caseIndex]);
          expect(firstResult).assertEqual(expectedValues[caseIndex]);
          expect(secondResult).assertEqual(expectedValues[caseIndex]);
          expect(thirdResult).assertEqual(expectedValues[caseIndex]);
          expect(firstResult).assertEqual(secondResult);
          expect(secondResult).assertEqual(thirdResult);
        }
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
        let expectedValues: double[] = [
          0.0,
          42.0,
          -42.0,
          32766.0,
          -32767.0,
          32767.0,
          -32768.0
        ];
        let caseCount: int = 7;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let boxedValue: Short = new Short(testValues[caseIndex]);
          let instanceResult: double = boxedValue.toDouble();
          let staticResult: double = Short.toDouble(testValues[caseIndex]);
          expect(instanceResult).assertEqual(expectedValues[caseIndex]);
          expect(staticResult).assertEqual(expectedValues[caseIndex]);
          expect(instanceResult).assertEqual(staticResult);
          expect(boxedValue.toShort()).assertEqual(testValues[caseIndex]);
        }
      }

      {
        let maxMinusResult: double = Short.toDouble(32766 as short);
        let minPlusResult: double = Short.toDouble((-32767) as short);
        expect(maxMinusResult).assertEqual(32766.0);
        expect(minPlusResult).assertEqual(-32767.0);
      }

      {
        let floatSource: short = Float.toShort(123.9f);
        let actualResult: double = Short.toDouble(floatSource);
        expect(actualResult).assertEqual(123.0);
        let negFloatSource: short = Float.toShort(-45.9f);
        expect(Short.toDouble(negFloatSource)).assertEqual(-45.0);
      }

      {
        let start: Short = new Short(Short.MIN_VALUE);
        let step: Short = new Short(16384 as short);
        let step1: Short = start.add(step);
        let step2: Short = step1.add(step);
        let step3: Short = step2.add(step);
        expect(start.toDouble()).assertEqual(-32768.0);
        expect(step1.toDouble()).assertEqual(-16384.0);
        expect(step2.toDouble()).assertEqual(0.0);
        expect(step3.toDouble()).assertEqual(16384.0);
        expect(start.toShort()).assertEqual(Short.MIN_VALUE);
      }

      {
        let longWrap: short = Long.toShort(Long.toLong(40000));
        let actualResult: double = Short.toDouble(longWrap);
        expect(actualResult).assertEqual(-25536.0);
        let longWrapNeg: short = Long.toShort(Long.toLong(-40000));
        expect(Short.toDouble(longWrapNeg)).assertEqual(25536.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TODOUBLE_0200
     * @tc.name testShortToDouble_merged2
     * @tc.desc BoundaryOverflow: covers 10 merged test points for Short.toDouble, including type conversion, boundary values, fractions and rounding, business scenarios, and negative values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToDouble_merged2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        expect(Short.toDouble(32765 as short)).assertEqual(32765.0);
        expect(Short.toDouble(32764 as short)).assertEqual(32764.0);
        expect(Short.toDouble(32763 as short)).assertEqual(32763.0);
      }

      {
        expect(Short.toDouble((-32766) as short)).assertEqual(-32766.0);
        expect(Short.toDouble((-32765) as short)).assertEqual(-32765.0);
        expect(Short.toDouble((-32764) as short)).assertEqual(-32764.0);
      }

      {
        let dirMax: double = Short.toDouble(Short.MAX_VALUE);
        let boxMax: double = new Short(Short.MAX_VALUE).toDouble();
        let varMax: short = Short.MAX_VALUE;
        let varMaxDouble: double = Short.toDouble(varMax);
        expect(dirMax).assertEqual(32767.0);
        expect(boxMax).assertEqual(32767.0);
        expect(varMaxDouble).assertEqual(32767.0);
        expect(dirMax).assertEqual(boxMax);
        expect(boxMax).assertEqual(varMaxDouble);
      }

      {
        let dirMin: double = Short.toDouble(Short.MIN_VALUE);
        let boxMin: double = new Short(Short.MIN_VALUE).toDouble();
        let varMin: short = Short.MIN_VALUE;
        let varMinDouble: double = Short.toDouble(varMin);
        expect(dirMin).assertEqual(-32768.0);
        expect(boxMin).assertEqual(-32768.0);
        expect(varMinDouble).assertEqual(-32768.0);
        expect(dirMin).assertEqual(boxMin);
        expect(boxMin).assertEqual(varMinDouble);
      }

      {
        let negHexVal: short = (-0x8000) as short;
        let result: double = Short.toDouble(negHexVal);
        expect(result).assertEqual(-32768.0);
      }

      {
        let a: Short = new Short(1000 as short);
        let b: Short = new Short(3 as short);
  
        let shortDiv: Short = a.div(b);
        expect(shortDiv.toInt()).assertEqual(333);
  
        let doubleDiv: double = a.toDouble() / b.toDouble();
        expect(doubleDiv > 333.33 && doubleDiv < 333.34).assertTrue();
  
        let intResult: double = shortDiv.toDouble();
        expect(intResult < doubleDiv).assertTrue();
      }

      {
        let truncated1: short = Int.toShort(32768);
        let truncated2: short = Int.toShort(65535);
        let truncated3: short = Int.toShort(-32769);
        let truncated4: short = Int.toShort(65536);
        expect(Short.toDouble(truncated1)).assertEqual(-32768.0);
        expect(Short.toDouble(truncated2)).assertEqual(-1.0);
        expect(Short.toDouble(truncated3)).assertEqual(32767.0);
        expect(Short.toDouble(truncated4)).assertEqual(0.0);
      }

      {
        let testVals: short[] = [
          255 as short, 256 as short, 257 as short,
          511 as short, 512 as short, 513 as short,
          1023 as short, 1024 as short, 1025 as short,
          (-1) as short, 0 as short, 1 as short,
          (-257) as short, (-256) as short, (-255) as short
        ];
        let expectedVals: double[] = [
          255.0, 256.0, 257.0,
          511.0, 512.0, 513.0,
          1023.0, 1024.0, 1025.0,
          -1.0, 0.0, 1.0,
          -257.0, -256.0, -255.0
        ];
        let count: int = 15;
        for (let i: int = 0; i < count; i++) {
          expect(Short.toDouble(testVals[i])).assertEqual(expectedVals[i]);
        }
      }

      {
        let inRangeVals: double[] = [-32768.0, -1.0, 0.0, 1.0, 255.0, 16384.0, 32767.0];
        let count: int = 7;
        for (let i: int = 0; i < count; i++) {
          let sVal: short = Double.toShort(inRangeVals[i]);
          let back: double = Short.toDouble(sVal);
          expect(back).assertEqual(inRangeVals[i]);
        }
        let fracVal: short = Double.toShort(3.14);
        let fracBack: double = Short.toDouble(fracVal);
        expect(fracBack).assertEqual(3.0);
        let shortVals: short[] = [(-32767) as short, (-100) as short, 0 as short, 100 as short, 10000 as short, 32766 as short];
        let count2: int = 6;
        for (let j: int = 0; j < count2; j++) {
          let dVal: double = Short.toDouble(shortVals[j]);
          let back: short = Double.toShort(dVal);
          expect(back).assertEqual(shortVals[j]);
        }
      }

      {
        let a: Short = new Short(100 as short);
        let b: Short = new Short(200 as short);
        let sumDouble: double = a.toDouble() + b.toDouble();
        expect(sumDouble).assertEqual(300.0);
        let c: short = Int.toShort(100 + 200);
        expect(Short.toDouble(c)).assertEqual(sumDouble);
        let d: Short = new Short(5000 as short);
        let e: Short = new Short(7000 as short);
        let sumDouble2: double = d.toDouble() + e.toDouble();
        expect(sumDouble2).assertEqual(12000.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TODOUBLE_0300
     * @tc.name testShortToDouble_merged3
     * @tc.desc BoundaryOverflow / CrossTypeRoundTrip: covers 10 merged test points for Short.toDouble, including type conversion, business scenarios, positive values, negative values, and boundary values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToDouble_merged3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let prev: double = Short.toDouble(Short.MIN_VALUE);
        let violations: int = 0;
        for (let i: int = -32767; i <= -32000; i++) {
          let curr: double = Short.toDouble(Int.toShort(i));
          if (curr <= prev) {
            violations++;
          }
          prev = curr;
        }
        expect(violations).assertEqual(0);
      }

      {
        let a: Short = new Short(200 as short);
        let b: Short = new Short(200 as short);
        let mulResult: Short = a.mul(b);
        let mathProduct: int = 200 * 200;
        expect(mathProduct).assertEqual(40000);
        expect(mulResult.toInt() !== mathProduct).assertTrue();
        let overflowedDouble: double = mulResult.toDouble();
        expect(overflowedDouble).assertEqual(Int.toDouble(mulResult.toInt()));
        expect(overflowedDouble !== Int.toDouble(mathProduct)).assertTrue();
        let c: Short = new Short((-200) as short);
        let d: Short = new Short(200 as short);
        let mulResult2: Short = c.mul(d);
        let mathProduct2: int = (-200) * 200;
        expect(mulResult2.toDouble()).assertEqual(Int.toDouble(mulResult2.toInt()));
        expect(mulResult2.toInt() !== mathProduct2).assertTrue();
      }

      {
        let smallPositiveValue: short = 1 as short;
        let middlePositiveValue: short = 100 as short;
        let smallPositiveResult: double = Short.toDouble(smallPositiveValue);
        let middlePositiveResult: double = Short.toDouble(middlePositiveValue);
        expect(smallPositiveResult).assertEqual(1.0);
        expect(middlePositiveResult).assertEqual(100.0);
      }

      {
        let smallNegativeValue: short = (-1) as short;
        let middleNegativeValue: short = (-100) as short;
        let smallNegativeResult: double = Short.toDouble(smallNegativeValue);
        let middleNegativeResult: double = Short.toDouble(middleNegativeValue);
        expect(smallNegativeResult).assertEqual(-1.0);
        expect(middleNegativeResult).assertEqual(-100.0);
      }

      {
        let zeroValue: short = 0 as short;
        let positiveByteOverflowValue: short = 128 as short;
        let negativeMiddleValue: short = (-256) as short;
        let zeroResult: double = Short.toDouble(zeroValue);
        let positiveByteOverflowResult: double = Short.toDouble(positiveByteOverflowValue);
        let negativeMiddleResult: double = Short.toDouble(negativeMiddleValue);
        expect(zeroResult).assertEqual(0.0);
        expect(positiveByteOverflowResult).assertEqual(128.0);
        expect(negativeMiddleResult).assertEqual(-256.0);
      }

      {
        let rmsOf = (vals: short[], n: int): double => {
          let sumSquares: double = 0.0;
          for (let i: int = 0; i < n; i++) {
            let sample: double = Short.toDouble(vals[i]);
            sumSquares += sample * sample;
          }
          return Math.sqrt(sumSquares / Int.toDouble(n));
        };
  
        let threeEqual: short[] = [2 as short, 2 as short, 2 as short];
        let fiveMixedA: short[] = [0 as short, 1 as short, 1 as short, 3 as short, 3 as short];
        let fiveMixedB: short[] = [0 as short, 0 as short, 3 as short, 6 as short, 0 as short];
        let threeFourFive: short[] = [3 as short, 4 as short, 5 as short];
  
        expect(rmsOf(threeEqual, 3)).assertEqual(2.0);
        expect(rmsOf(fiveMixedA, 5)).assertEqual(2.0);
        expect(rmsOf(fiveMixedB, 5)).assertEqual(3.0);
  
        let generalRms: double = rmsOf(threeFourFive, 3);
        expect(Math.abs(generalRms - 4.08248290463863) < 0.000001).assertTrue();
      }

      {
        let testVals: short[] = [10 as short, 100 as short, 1000 as short, 5000 as short, 16384 as short, 32766 as short];
        let expectedVals: double[] = [10.0, 100.0, 1000.0, 5000.0, 16384.0, 32766.0];
        let count: int = 6;
        for (let i: int = 0; i < count; i++) {
          expect(Short.toDouble(testVals[i])).assertEqual(expectedVals[i]);
        }
      }

      {
        let testVals: short[] = [(-10) as short, (-100) as short, (-1000) as short, (-5000) as short, (-16384) as short, (-32767) as short];
        let expectedVals: double[] = [-10.0, -100.0, -1000.0, -5000.0, -16384.0, -32767.0];
        let count: int = 6;
        for (let i: int = 0; i < count; i++) {
          expect(Short.toDouble(testVals[i])).assertEqual(expectedVals[i]);
        }
      }

      {
        let thresholdD: double = 100.0;
        let discountRateD: double = 0.8;
  
        let belowTotalD: double = Short.toDouble(30 as short) + Short.toDouble(40 as short);
        let belowFinalD: double = belowTotalD >= thresholdD ? belowTotalD * discountRateD : belowTotalD;
        expect(belowTotalD).assertEqual(70.0);
        expect(belowFinalD).assertEqual(70.0);
  
        let atTotalD: double = Short.toDouble(60 as short) + Short.toDouble(40 as short);
        let atFinalD: double = atTotalD >= thresholdD ? atTotalD * discountRateD : atTotalD;
        expect(atTotalD).assertEqual(100.0);
        expect(atFinalD).assertEqual(80.0);
  
        let aboveTotalD: double = Short.toDouble(85 as short) + Short.toDouble(95 as short);
        let aboveFinalD: double = aboveTotalD >= thresholdD ? aboveTotalD * discountRateD : aboveTotalD;
        expect(aboveTotalD).assertEqual(180.0);
        expect(aboveFinalD).assertEqual(144.0);
        expect(aboveTotalD - aboveFinalD).assertEqual(36.0);
      }

      {
        let opA: Short = new Short(300 as short);
        let opB: Short = new Short(100 as short);
        let sumResult: Short = opA.add(opB);
        let subResult: Short = opA.sub(opB);
        let mulResult: Short = new Short(15 as short).mul(new Short(20 as short));
        let divResult: Short = new Short(600 as short).div(new Short(3 as short));
        expect(sumResult.toDouble()).assertEqual(Short.toDouble(sumResult.toShort()));
        expect(subResult.toDouble()).assertEqual(Short.toDouble(subResult.toShort()));
        expect(mulResult.toDouble()).assertEqual(Short.toDouble(mulResult.toShort()));
        expect(divResult.toDouble()).assertEqual(Short.toDouble(divResult.toShort()));
        expect(sumResult.toDouble()).assertEqual(400.0);
        expect(subResult.toDouble()).assertEqual(200.0);
        expect(mulResult.toDouble()).assertEqual(300.0);
        expect(divResult.toDouble()).assertEqual(200.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TODOUBLE_0400
     * @tc.name testShortToDouble_merged4
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toDouble, including type conversion, business scenarios, division and modulo, radix conversion, and precision.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToDouble_merged4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let parsedPos: short = Short.parseInt('888', 10);
        let parsedNeg: short = Short.parseInt('-444', 10);
        let staticPosResult: double = Short.toDouble(parsedPos);
        let staticNegResult: double = Short.toDouble(parsedNeg);
        expect(staticPosResult).assertEqual(888.0);
        expect(staticNegResult).assertEqual(-444.0);
      }

      {
        let testVals: short[] = [0 as short, 1 as short, (-1) as short, 16384 as short, (-16384) as short,
          Short.MAX_VALUE, Short.MIN_VALUE];
        let expectedVals: double[] = [0.0, 1.0, -1.0, 16384.0, -16384.0, 32767.0, -32768.0];
        let epsilon: double = 0.0000001;
        let count: int = 7;
        for (let i: int = 0; i < count; i++) {
          let doubleResult: double = Short.toDouble(testVals[i]);
          let difference: double = doubleResult - expectedVals[i];
          if (difference < 0) {
            difference = -difference;
          }
          expect(difference < epsilon).assertTrue();
        }
      }

      {
        let a: double = Short.toDouble(100 as short);
        let b: double = Short.toDouble(200 as short);
        let sum: double = a + b;
        expect(a).assertEqual(100.0);
        expect(b).assertEqual(200.0);
        expect(sum).assertEqual(300.0);
      }

      {
        let a: double = Short.toDouble(50 as short);
        let b: double = Short.toDouble(60 as short);
        let product: double = a * b;
        expect(a).assertEqual(50.0);
        expect(b).assertEqual(60.0);
        expect(product).assertEqual(3000.0);
      }

      {
        let a: double = Short.toDouble(1000 as short);
        let b: double = Short.toDouble(4 as short);
        let quotient: double = a / b;
        expect(a).assertEqual(1000.0);
        expect(b).assertEqual(4.0);
        expect(quotient).assertEqual(250.0);
      }

      {
        let dividendValues: short[] = [17 as short, 100 as short, (-17) as short, (-100) as short, 0 as short, 255 as short, (-255) as short];
        let divisorValues: short[] = [5 as short, 7 as short, 5 as short, 7 as short, 9 as short, 256 as short, 256 as short];
        let caseCount: int = 7;
        for (let i: int = 0; i < caseCount; i++) {
          let aD: double = Short.toDouble(dividendValues[i]);
          let bD: double = Short.toDouble(divisorValues[i]);
          let actualRemainder: double = aD % bD;
          let expectedRemainder: double = Int.toDouble(Short.toInt(dividendValues[i]) % Short.toInt(divisorValues[i]));
          expect(actualRemainder).assertEqual(expectedRemainder);
        }
      }

      {
        let leftOperand: Short = new Short(1500 as short);
        let rightOperand: Short = new Short(600 as short);
        let difference: Short = leftOperand.sub(rightOperand);
        let doubleResult: double = difference.toDouble();
        expect(difference.toShort()).assertEqual(900 as short);
        expect(doubleResult).assertEqual(900.0);
      }

      {
        expect(Short.toDouble((-128) as short)).assertEqual(-128.0);
        expect(Short.toDouble((-256) as short)).assertEqual(-256.0);
        expect(Short.toDouble((-512) as short)).assertEqual(-512.0);
        expect(Short.toDouble((-1024) as short)).assertEqual(-1024.0);
        expect(Short.toDouble((-2048) as short)).assertEqual(-2048.0);
      }

      {
        let scoreSet1: short[] = [86 as short, 92 as short, 88 as short];
        let sum1: double = 0.0;
        for (let i: int = 0; i < 3; i++) {
          sum1 += Short.toDouble(scoreSet1[i]);
        }
        let avg1: double = sum1 / 3.0;
        expect(Math.round(avg1)).assertEqual(89);
        let scoreSet2: short[] = [85 as short, 92 as short];
        let sum2: double = 0.0;
        for (let j: int = 0; j < 2; j++) {
          sum2 += Short.toDouble(scoreSet2[j]);
        }
        let avg2: double = sum2 / 2.0;
        expect(Math.round(avg2)).assertEqual(89);
        let scoreSet3: short[] = [90 as short, 91 as short, 92 as short];
        let sum3: double = 0.0;
        for (let k: int = 0; k < 3; k++) {
          sum3 += Short.toDouble(scoreSet3[k]);
        }
        let avg3: double = sum3 / 3.0;
        expect(Math.round(avg3)).assertEqual(91);
      }

      {
        let byteSource: short = Byte.toShort(100 as byte);
        let actualResult: double = Short.toDouble(byteSource);
        expect(actualResult).assertEqual(100.0);
        let negByteSource: short = Byte.toShort((-100) as byte);
        expect(Short.toDouble(negByteSource)).assertEqual(-100.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TODOUBLE_0500
     * @tc.name testShortToDouble_merged5
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toDouble, including type conversion, positive values, negative values, business scenarios, and constructor forms.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToDouble_merged5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let testVals: short[] = [300 as short, (-150) as short, 0 as short, (-1) as short,
          2023 as short, (-2023) as short, 15000 as short, (-15000) as short];
        let expectedVals: double[] = [300.0, -150.0, 0.0, -1.0, 2023.0, -2023.0, 15000.0, -15000.0];
        let count: int = 8;
        for (let i: int = 0; i < count; i++) {
          expect(Short.toDouble(testVals[i])).assertEqual(expectedVals[i]);
        }
      }

      {
        let startShort: short = 10 as short;
        let endShort: short = 30 as short;
        let startD: double = Short.toDouble(startShort);
        let endD: double = Short.toDouble(endShort);
        let lerp0: double = startD + (endD - startD) * 0.0;
        let lerp1: double = startD + (endD - startD) * 0.5;
        let lerp2: double = startD + (endD - startD) * 1.0;
        expect(lerp0).assertEqual(10.0);
        expect(lerp1).assertEqual(20.0);
        expect(lerp2).assertEqual(30.0);
  
        let tFromShorts: double = Short.toDouble(3 as short) / Short.toDouble(4 as short);
        let lerpMid: double = startD + (endD - startD) * tFromShorts;
        expect(lerpMid).assertEqual(25.0);
      }

      {
        let leftOperand: Short = new Short(700 as short);
        let rightOperand: Short = new Short(300 as short);
        let sum: Short = leftOperand.add(rightOperand);
        let doubleResult: double = sum.toDouble();
        expect(sum.toShort()).assertEqual(1000 as short);
        expect(doubleResult).assertEqual(1000.0);
      }

      {
        let testVals: short[] = [0 as short, 1 as short, (-1) as short, 256 as short, (-256) as short,
          4096 as short, (-4096) as short, 16384 as short];
        let count: int = 8;
        for (let i: int = 0; i < count; i++) {
          let doubleVal: double = Short.toDouble(testVals[i]);
          let backToShort: short = Short.parseInt(doubleVal.toString(), 10);
          expect(backToShort).assertEqual(testVals[i]);
        }
      }

      {
        let a: double = Short.toDouble(100 as short);
        let b: double = Short.toDouble(200 as short);
        let c: double = Short.toDouble((-100) as short);
        expect(a).assertEqual(100.0);
        expect(b).assertEqual(200.0);
        expect(c).assertEqual(-100.0);
        expect(a < b).assertTrue();
        expect(b > a).assertTrue();
        expect(c < a).assertTrue();
        expect(c < 0.0).assertTrue();
        expect(b > 150.0).assertTrue();
      }

      {
        let opA: Short = new Short(25 as short);
        let opB: Short = new Short(40 as short);
        let prodBox: Short = opA.mul(opB);
        let prodDouble: double = prodBox.toDouble();
        expect(prodBox.toShort()).assertEqual(1000 as short);
        expect(prodDouble).assertEqual(1000.0);
      }

      {
        let opA: Short = new Short(600 as short);
        let opB: Short = new Short(3 as short);
        let quotBox: Short = opA.div(opB);
        let quotDouble: double = quotBox.toDouble();
        expect(quotBox.toShort()).assertEqual(200 as short);
        expect(quotDouble).assertEqual(200.0);
      }

      {
        let sideA1: short = 3 as short;
        let sideB1: short = 4 as short;
        let sideC1: short = 5 as short;
        let a1D: double = Short.toDouble(sideA1);
        let b1D: double = Short.toDouble(sideB1);
        let c1D: double = Short.toDouble(sideC1);
        expect(a1D).assertEqual(3.0);
        expect(b1D).assertEqual(4.0);
        expect(c1D).assertEqual(5.0);
        let cosC1: double = (a1D * a1D + b1D * b1D - c1D * c1D) / (2.0 * a1D * b1D);
        expect(cosC1).assertEqual(0.0);
        let angle1: double = Math.acos(cosC1);
        expect(Math.abs(angle1 - Math.PI / 2.0) < 0.0000001).assertTrue();
  
        let sideA2: short = 5 as short;
        let sideB2: short = 12 as short;
        let sideC2: short = 13 as short;
        let a2D: double = Short.toDouble(sideA2);
        let b2D: double = Short.toDouble(sideB2);
        let c2D: double = Short.toDouble(sideC2);
        let cosC2: double = (a2D * a2D + b2D * b2D - c2D * c2D) / (2.0 * a2D * b2D);
        expect(Math.abs(cosC2) < 0.0000001).assertTrue();
        let angle2: double = Math.acos(cosC2);
        expect(Math.abs(angle2 - Math.PI / 2.0) < 0.0000001).assertTrue();
  
        let sideA3: short = 2 as short;
        let sideB3: short = 2 as short;
        let sideC3: short = 2 as short;
        let a3D: double = Short.toDouble(sideA3);
        let b3D: double = Short.toDouble(sideB3);
        let c3D: double = Short.toDouble(sideC3);
        let cosC3: double = (a3D * a3D + b3D * b3D - c3D * c3D) / (2.0 * a3D * b3D);
        expect(cosC3).assertEqual(0.5);
        let angle3: double = Math.acos(cosC3);
        expect(Math.abs(angle3 - Math.PI / 3.0) < 0.0000001).assertTrue();
  
        let sideA4: short = 5 as short;
        let sideB4: short = 5 as short;
        let sideC4: short = 6 as short;
        let a4D: double = Short.toDouble(sideA4);
        let b4D: double = Short.toDouble(sideB4);
        let c4D: double = Short.toDouble(sideC4);
        let cosC4: double = (a4D * a4D + b4D * b4D - c4D * c4D) / (2.0 * a4D * b4D);
        expect(cosC4).assertEqual(0.28);
        let angle4: double = Math.acos(cosC4);
        expect(Math.abs(angle4 - 1.2870022175865687) < 0.000001).assertTrue();
      }

      {
        let a: double = Short.toDouble(1000 as short);
        let b: double = Short.toDouble(300 as short);
        let diff: double = a - b;
        expect(a).assertEqual(1000.0);
        expect(b).assertEqual(300.0);
        expect(diff).assertEqual(700.0);
      }

      {
        let a: double = Short.toDouble(10 as short);
        let b: double = Short.toDouble(20 as short);
        let c: double = Short.toDouble(3 as short);
        let d: double = Short.toDouble(5 as short);
        let combined: double = (a + b) * c / d;
        expect(combined).assertEqual(18.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TODOUBLE_0600
     * @tc.name testShortToDouble_merged6
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toDouble, including type conversion, comparison and ordering, business scenarios, precision, and division and modulo.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToDouble_merged6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let base: Short = new Short(100 as short);
        let addend: Short = new Short(50 as short);
        let result1: Short = base.add(addend);
        let result2: Short = result1.add(addend);
        let result3: Short = result2.add(addend);
        expect(result1.toDouble()).assertEqual(150.0);
        expect(result2.toDouble()).assertEqual(200.0);
        expect(result3.toDouble()).assertEqual(250.0);
      }

      {
        let base: Short = new Short(500 as short);
        let subtrahend: Short = new Short(50 as short);
        let result1: Short = base.sub(subtrahend);
        let result2: Short = result1.sub(subtrahend);
        let result3: Short = result2.sub(subtrahend);
        expect(result1.toDouble()).assertEqual(450.0);
        expect(result2.toDouble()).assertEqual(400.0);
        expect(result3.toDouble()).assertEqual(350.0);
      }

      {
        let a: double = Short.toDouble(500 as short);
        let b: double = Short.toDouble((-500) as short);
        expect(a).assertEqual(500.0);
        expect(b).assertEqual(-500.0);
        expect(a > 0.0).assertTrue();
        expect(a > 400.0).assertTrue();
        expect(b > (-1000.0)).assertTrue();
        expect(a > b).assertTrue();
      }

      {
        let a: double = Short.toDouble(100 as short);
        let b: double = Short.toDouble((-300) as short);
        expect(a).assertEqual(100.0);
        expect(b).assertEqual(-300.0);
        expect(a < 200.0).assertTrue();
        expect(b < 0.0).assertTrue();
        expect(b < a).assertTrue();
      }

      {
        let testVals: short[] = [3 as short, 17 as short, 99 as short, 303 as short, 707 as short,
          1234 as short, 5678 as short, 9999 as short, 15000 as short, 32000 as short];
        let count: int = 10;
        for (let i: int = 0; i < count; i++) {
          let doubleVal: double = Short.toDouble(testVals[i]);
          let asInt: int = Short.toInt(testVals[i]);
          let diff: double = doubleVal - Int.toDouble(asInt);
          if (diff < 0) {
            diff = -diff;
          }
          expect(diff < 0.0000001).assertTrue();
        }
      }

      {
        let a: double = Short.toDouble(15 as short);
        let factor: double = 2.5;
        let product: double = a * factor;
        expect(a).assertEqual(15.0);
        expect(product).assertEqual(37.5);
      }

      {
        let dividend: double = 10000.0;
        let divisor: double = Short.toDouble(4 as short);
        expect(divisor).assertEqual(4.0);
        expect(dividend / divisor).assertEqual(2500.0);
      }

      {
        let a: Short = new Short(100 as short);
        let b: Short = new Short(25 as short);
        let sum: Short = a.add(b);
        let sumShort: short = sum.toShort();
        let sumDouble: double = Short.toDouble(sumShort);
        expect(sumShort).assertEqual(125 as short);
        expect(sumDouble).assertEqual(125.0);
      }

      {
        let samples: short[] = [10 as short, 20 as short, 30 as short, 40 as short];
        let alpha: double = 0.5;
        let emaValues: double[] = [0.0, 0.0, 0.0, 0.0];
        let ema: double = Short.toDouble(samples[0]);
        emaValues[0] = ema;
        for (let i: int = 1; i < 4; i++) {
          ema = alpha * Short.toDouble(samples[i]) + (1.0 - alpha) * ema;
          emaValues[i] = ema;
        }
        expect(emaValues[0]).assertEqual(10.0);
        expect(emaValues[1]).assertEqual(15.0);
        expect(emaValues[2]).assertEqual(22.5);
        expect(emaValues[3]).assertEqual(31.25);
      }

      {
        let parsedPos: short = Short.parseInt('007', 10);
        let parsedNeg: short = Short.parseInt('-007', 10);
        expect(Short.toDouble(parsedPos)).assertEqual(7.0);
        expect(Short.toDouble(parsedNeg)).assertEqual(-7.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TODOUBLE_0700
     * @tc.name testShortToDouble_merged7
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toDouble, including type conversion, containers and references, business scenarios, equality consistency, and round-trip conversion.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToDouble_merged7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let g: Short = new Short(98 as short);
        let t: Short = new Short(30 as short);
  
        let gDouble: double = g.toDouble();
        let tDouble: double = t.toDouble();
  
        let gravity: double = gDouble / 10.0;
        let time: double = tDouble / 10.0;
        let distance: double = 0.5 * gravity * time * time;
  
        expect(distance > 44.0 && distance < 44.2).assertTrue();
      }

      {
        let samples: Short[] = [
          new Short(10 as short), new Short(20 as short), new Short(30 as short), new Short(40 as short), new Short(50 as short)
        ];
  
        let sumDouble: double = 0.0;
        for (let s of samples) {
          sumDouble += s.toDouble();
        }
  
        let mean: double = sumDouble / samples.length;
        expect(mean).assertEqual(30.0);
  
        let variance: double = 0.0;
        for (let s of samples) {
          let diff: double = s.toDouble() - mean;
          variance += diff * diff;
        }
        variance /= samples.length;
        expect(variance).assertEqual(200.0);
      }

      {
        let rmbFen: Short = new Short(10000 as short);
        let exchangeRate: double = 0.145;
  
        let rmbYuan: double = rmbFen.toDouble() / 100.0;
        let usdDollars: double = rmbYuan * exchangeRate;
  
        expect(rmbYuan).assertEqual(100.0);
        expect(usdDollars > 14.49 && usdDollars < 14.51).assertTrue();
  
        let backToRmb: double = usdDollars / exchangeRate;
        expect(Math.abs(backToRmb - 100.0) < 0.01).assertTrue();
      }

      {
        let rawZero: Short = new Short(0 as short);
        let rawFull: Short = new Short(1000 as short);
  
        let realZero: double = 5.0;
        let realFull: double = 1005.0;
  
        let m: double = (realFull - realZero) / (rawFull.toDouble() - rawZero.toDouble());
        let b: double = realZero;
  
        expect(m).assertEqual(1.0);
  
        let rawMid: Short = new Short(500 as short);
        let realMid: double = m * rawMid.toDouble() + b;
        expect(realMid).assertEqual(505.0);
      }

      {
        let values: Short[] = [
          new Short(0 as short), new Short(1 as short), new Short(4 as short),
          new Short(9 as short), new Short(16 as short), new Short(-25 as short)
        ];
  
        let sqrtResults: double[] = [];
        let absResults: double[] = [];
  
        for (let v of values) {
          let d: double = v.toDouble();
          if (d >= 0) {
            sqrtResults.push(Math.sqrt(d));
          } else {
            sqrtResults.push(-1);
          }
          absResults.push(Math.abs(d));
        }
  
        expect(sqrtResults[0]).assertEqual(0.0);
        expect(sqrtResults[3]).assertEqual(3.0);
        expect(sqrtResults[4]).assertEqual(4.0);
        expect(sqrtResults[5]).assertEqual(-1.0);
        expect(absResults[5]).assertEqual(25.0);
      }

      {
        let observations: Short[] = [
          new Short(1000 as short), new Short(2000 as short), new Short(3000 as short),
          new Short(4000 as short), new Short(5000 as short)
        ];
  
        let doubleValues: double[] = [];
        for (let obs of observations) {
          doubleValues.push(obs.toDouble());
        }
  
        let n: int = doubleValues.length;
        let sum: double = 0.0;
        for (let v of doubleValues) sum += v;
        let mean: double = sum / n;
        expect(mean).assertEqual(3000.0);
  
        let variance: double = 0.0;
        for (let v of doubleValues) {
          variance += (v - mean) * (v - mean);
        }
        variance /= n;
        let stddev: double = Math.sqrt(variance);
        expect(stddev > 1414.2 && stddev < 1414.3).assertTrue();
      }

      {
        let timeSeries: Map<int, Short> = new Map<int, Short>();
        timeSeries.set(1, new Short(100 as short));
        timeSeries.set(2, new Short(150 as short));
        timeSeries.set(3, new Short(120 as short));
        timeSeries.set(4, new Short(180 as short));
  
        let rates: Map<int, double> = new Map<int, double>();
        let prev: Short = timeSeries.get(1) as Short;
  
        for (let t: int = 2; t <= 4; t++) {
          let curr: Short = timeSeries.get(t) as Short;
          let rate: double = (curr.toDouble() - prev.toDouble()) / prev.toDouble();
          rates.set(t, rate);
          prev = curr;
        }
  
        expect(rates.get(2) as double).assertEqual(0.5);
        expect(rates.get(4) as double).assertEqual(0.5);
        expect((rates.get(3) as double) < -0.19 && (rates.get(3) as double) > -0.21).assertTrue();
      }

      {
        let testVals: short[] = [Short.MIN_VALUE, (-16384) as short, (-256) as short, (-1) as short,
          0 as short, 1 as short, 256 as short, 16384 as short, Short.MAX_VALUE];
        let count: int = 9;
        let expectedDbls: double[] = [-32768.0, -16384.0, -256.0, -1.0, 0.0, 1.0, 256.0, 16384.0, 32767.0];
        for (let i: int = 0; i < count; i++) {
          expect(Short.toDouble(testVals[i])).assertEqual(expectedDbls[i]);
        }
      }

      {
        for (let raw: int = -128; raw <= 127; raw++) {
          let sVal: short = Int.toShort(raw);
          let expected: double = raw;
          expect(Short.toDouble(sVal)).assertEqual(expected);
        }
      }

      {
        let testVals: short[] = [
          Short.MIN_VALUE, (-1) as short, 0 as short, 1 as short,
          127 as short, 128 as short, 255 as short, 256 as short,
          1024 as short, 4096 as short, 16384 as short, Short.MAX_VALUE
        ];
        let count: int = 12;
        let expectedDbls: double[] = [-32768.0, -1.0, 0.0, 1.0, 127.0, 128.0, 255.0, 256.0, 1024.0, 4096.0, 16384.0, 32767.0];
        for (let k: int = 0; k < count; k++) {
          expect(Short.toDouble(testVals[k])).assertEqual(expectedDbls[k]);
        }
        for (let i: int = 0; i < count; i++) {
          for (let j: int = i + 1; j < count; j++) {
            let di: double = Short.toDouble(testVals[i]);
            let dj: double = Short.toDouble(testVals[j]);
            expect(di !== dj).assertTrue();
          }
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TODOUBLE_0800
     * @tc.name testShortToDouble_merged8
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toDouble, including type conversion, equality consistency, business scenarios, and division and modulo.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToDouble_merged8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let fibVals: short[] = [0 as short, 1 as short, 1 as short, 2 as short, 3 as short, 5 as short,
          8 as short, 13 as short, 21 as short, 34 as short, 55 as short, 89 as short, 144 as short,
          233 as short, 377 as short, 610 as short, 987 as short, 1597 as short, 2584 as short,
          4181 as short, 6765 as short, 10946 as short, 17711 as short, 28657 as short];
        let fibExpected: double[] = [0.0, 1.0, 1.0, 2.0, 3.0, 5.0, 8.0, 13.0, 21.0, 34.0, 55.0, 89.0,
          144.0, 233.0, 377.0, 610.0, 987.0, 1597.0, 2584.0, 4181.0, 6765.0, 10946.0, 17711.0, 28657.0];
        let count: int = 24;
        for (let i: int = 0; i < count; i++) {
          expect(Short.toDouble(fibVals[i])).assertEqual(fibExpected[i]);
        }
      }

      {
        let base: Short = new Short(20 as short);
        let height: Short = new Short(30 as short);
        let baseD: double = base.toDouble();
        let heightD: double = height.toDouble();
        let area: double = (baseD * heightD) / 2.0;
        expect(area).assertEqual(300.0);
        let base2: Short = new Short(15 as short);
        let height2: Short = new Short(7 as short);
        let area2: double = (base2.toDouble() * height2.toDouble()) / 2.0;
        expect(area2).assertEqual(52.5);
      }

      {
        let x1: Short = new Short(3 as short);
        let y1: Short = new Short(4 as short);
        let x2: Short = new Short(5 as short);
        let y2: Short = new Short(6 as short);
        let dot: double = x1.toDouble() * x2.toDouble() + y1.toDouble() * y2.toDouble();
        expect(dot).assertEqual(39.0);
        let x3: Short = new Short((-2) as short);
        let y3: Short = new Short(7 as short);
        let x4: Short = new Short(10 as short);
        let y4: Short = new Short((-3) as short);
        let dot2: double = x3.toDouble() * x4.toDouble() + y3.toDouble() * y4.toDouble();
        expect(dot2).assertEqual(-41.0);
      }

      {
        let a: Short = new Short(2 as short);
        let b: Short = new Short(3 as short);
        let c: Short = new Short(5 as short);
        let x: Short = new Short(10 as short);
        let xD: double = x.toDouble();
        let result: double = a.toDouble() * xD * xD + b.toDouble() * xD + c.toDouble();
        expect(result).assertEqual(235.0);
        let a2: Short = new Short(1 as short);
        let b2: Short = new Short((-4) as short);
        let c2: Short = new Short(4 as short);
        let x2D: double = Short.toDouble(2 as short);
        let result2: double = a2.toDouble() * x2D * x2D + b2.toDouble() * x2D + c2.toDouble();
        expect(result2).assertEqual(0.0);
      }

      {
        let sVal: short = 42 as short;
        let fromShort: double = Short.toDouble(sVal);
        let numVal: double = 10.0;
        let sum: double = fromShort + numVal;
        let product: double = fromShort * numVal;
        let quotient: double = fromShort / numVal;
        expect(sum).assertEqual(52.0);
        expect(product).assertEqual(420.0);
        expect(quotient).assertEqual(4.2);
        let fromShort2: double = Short.toDouble((-30) as short);
        let combined: double = (fromShort2 + numVal) * 2.0;
        expect(combined).assertEqual(-40.0);
      }

      {
        let primes: short[] = [2 as short, 3 as short, 5 as short, 7 as short, 11 as short, 13 as short,
          17 as short, 19 as short, 23 as short, 29 as short, 31 as short, 37 as short, 41 as short,
          43 as short, 47 as short, 53 as short, 59 as short, 61 as short, 67 as short, 71 as short,
          73 as short, 79 as short, 83 as short, 89 as short, 97 as short, 101 as short];
        let expected: double[] = [2.0, 3.0, 5.0, 7.0, 11.0, 13.0, 17.0, 19.0, 23.0, 29.0, 31.0, 37.0,
          41.0, 43.0, 47.0, 53.0, 59.0, 61.0, 67.0, 71.0, 73.0, 79.0, 83.0, 89.0, 97.0, 101.0];
        let count: int = 26;
        for (let i: int = 0; i < count; i++) {
          expect(Short.toDouble(primes[i])).assertEqual(expected[i]);
        }
        for (let i: int = 0; i < count; i++) {
          for (let j: int = i + 1; j < count; j++) {
            expect(Short.toDouble(primes[i]) !== Short.toDouble(primes[j])).assertTrue();
          }
        }
      }

      {
        let triVals: short[] = [0 as short, 1 as short, 3 as short, 6 as short, 10 as short,
          15 as short, 21 as short, 28 as short, 36 as short, 45 as short, 55 as short];
        let triExpected: double[] = [0.0, 1.0, 3.0, 6.0, 10.0, 15.0, 21.0, 28.0, 36.0, 45.0, 55.0];
        let count: int = 11;
        for (let i: int = 0; i < count; i++) {
          expect(Short.toDouble(triVals[i])).assertEqual(triExpected[i]);
        }
        for (let n: int = 1; n <= 10; n++) {
          let expectedTri: double = (n * (n + 1)) / 2.0;
          let sN: short = Int.toShort(n * (n + 1) / 2);
          expect(Short.toDouble(sN)).assertEqual(expectedTri);
        }
      }

      {
        let a: Short = new Short(4 as short);
        let b: Short = new Short(9 as short);
        let geoMean: double = Math.sqrt(a.toDouble() * b.toDouble());
        expect(geoMean).assertEqual(6.0);
        let c: Short = new Short(16 as short);
        let d: Short = new Short(25 as short);
        let geoMean2: double = Math.sqrt(c.toDouble() * d.toDouble());
        expect(geoMean2).assertEqual(20.0);
      }

      {
        let weights: Short[] = [new Short(2 as short), new Short(3 as short), new Short(5 as short)];
        let values: Short[] = [new Short(80 as short), new Short(90 as short), new Short(100 as short)];
        let weightSum: double = 0.0;
        let weightedSum: double = 0.0;
        let wCount: int = 3;
        for (let i: int = 0; i < wCount; i++) {
          let w: double = weights[i].toDouble();
          let v: double = values[i].toDouble();
          weightSum += w;
          weightedSum += w * v;
        }
        let weightedAvg: double = weightedSum / weightSum;
        expect(weightSum).assertEqual(10.0);
        expect(weightedAvg).assertEqual(93.0);
      }

      {
        let leg1: Short = new Short(3 as short);
        let leg2: Short = new Short(4 as short);
        let hyp: double = Math.sqrt(leg1.toDouble() * leg1.toDouble() + leg2.toDouble() * leg2.toDouble());
        expect(hyp).assertEqual(5.0);
        let a: Short = new Short(5 as short);
        let b: Short = new Short(12 as short);
        let hyp2: double = Math.sqrt(a.toDouble() * a.toDouble() + b.toDouble() * b.toDouble());
        expect(hyp2).assertEqual(13.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TODOUBLE_0900
     * @tc.name testShortToDouble_merged9
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toDouble, including type conversion, division and modulo, equality consistency, containers and references, and sliding window.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToDouble_merged9', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let upperA: short = 65 as short;
        let lowerA: short = 97 as short;
        let upperZ: short = 90 as short;
        let lowerZ: short = 122 as short;
        let upperM: short = 77 as short;
        let lowerM: short = 109 as short;
        let diffA: double = Short.toDouble(lowerA) - Short.toDouble(upperA);
        let diffZ: double = Short.toDouble(lowerZ) - Short.toDouble(upperZ);
        let diffM: double = Short.toDouble(lowerM) - Short.toDouble(upperM);
        expect(diffA).assertEqual(32.0);
        expect(diffZ).assertEqual(32.0);
        expect(diffM).assertEqual(32.0);
        for (let letter: int = 0; letter < 26; letter++) {
          let upper: short = Int.toShort(65 + letter);
          let lower: short = Int.toShort(97 + letter);
          expect(Short.toDouble(lower) - Short.toDouble(upper)).assertEqual(32.0);
        }
      }

      {
        let samples: short[] = [10 as short, 20 as short, 30 as short, 40 as short, 50 as short];
        let expectedAvgs: double[] = [20.0, 30.0, 40.0];
        let count: int = 3;
        for (let i: int = 0; i < count; i++) {
          let windowSum: double = Short.toDouble(samples[i]) + Short.toDouble(samples[i + 1]) +
            Short.toDouble(samples[i + 2]);
          let windowAvg: double = windowSum / 3.0;
          expect(windowAvg).assertEqual(expectedAvgs[i]);
        }
      }

      {
        let first: Short = new Short(1 as short);
        let last: Short = new Short(100 as short);
        let n: double = 100.0;
        let seriesSum: double = n * (first.toDouble() + last.toDouble()) / 2.0;
        expect(seriesSum).assertEqual(5050.0);
        let first2: Short = new Short(5 as short);
        let last2: Short = new Short(50 as short);
        let n2: double = 10.0;
        let seriesSum2: double = n2 * (first2.toDouble() + last2.toDouble()) / 2.0;
        expect(seriesSum2).assertEqual(275.0);
      }

      {
        let a: Short = new Short(2 as short);
        let b: Short = new Short(6 as short);
        let sumRecip: double = 1.0 / a.toDouble() + 1.0 / b.toDouble();
        let harmMean: double = 2.0 / sumRecip;
        expect(harmMean).assertEqual(3.0);
        let c: Short = new Short(10 as short);
        let d: Short = new Short(20 as short);
        let e: Short = new Short(40 as short);
        let sumRecip2: double = 1.0 / c.toDouble() + 1.0 / d.toDouble() + 1.0 / e.toDouble();
        let harmMean2: double = 3.0 / sumRecip2;
        expect(Math.abs(harmMean2 * 120.0 - 17.142857142857142 * 120.0) < 0.01).assertTrue();
      }

      {
        let a: Short = new Short(100 as short);
        let b: Short = new Short(35 as short);
        let absDiff1: double = Math.abs(a.toDouble() - b.toDouble());
        expect(absDiff1).assertEqual(65.0);
        let absDiff2: double = Math.abs(b.toDouble() - a.toDouble());
        expect(absDiff2).assertEqual(65.0);
        expect(absDiff1).assertEqual(absDiff2);
        let c: Short = new Short((-50) as short);
        let d: Short = new Short(75 as short);
        let absDiff3: double = Math.abs(c.toDouble() - d.toDouble());
        expect(absDiff3).assertEqual(125.0);
      }

      {
        let vals: short[] = [
          (-20000) as short, (-42) as short, 0 as short, 137 as short, 30000 as short
        ];
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          let dVal: double = Short.toDouble(vals[i]);
          expect(Math.floor(dVal)).assertEqual(dVal);
          expect(dVal % 1.0).assertEqual(0.0);
        }
      }

      {
        let a: Short = new Short(50 as short);
        let b: Short = new Short(60 as short);
        let prodDouble: double = a.toDouble() * b.toDouble();
        expect(prodDouble).assertEqual(3000.0);
        let prodShort: short = Int.toShort(50 * 60);
        expect(Short.toDouble(prodShort)).assertEqual(prodDouble);
        let c: Short = new Short(100 as short);
        let d: Short = new Short(200 as short);
        let prodDouble2: double = c.toDouble() * d.toDouble();
        expect(prodDouble2).assertEqual(20000.0);
      }

      {
        let sq4: Short = new Short(4 as short);
        let sq9: Short = new Short(9 as short);
        let sq16: Short = new Short(16 as short);
        let sq25: Short = new Short(25 as short);
        let sq100: Short = new Short(100 as short);
        expect(Math.sqrt(sq4.toDouble())).assertEqual(2.0);
        expect(Math.sqrt(sq9.toDouble())).assertEqual(3.0);
        expect(Math.sqrt(sq16.toDouble())).assertEqual(4.0);
        expect(Math.sqrt(sq25.toDouble())).assertEqual(5.0);
        expect(Math.sqrt(sq100.toDouble())).assertEqual(10.0);
      }

      {
        let base: Short = new Short(2 as short);
        let exp: Short = new Short(10 as short);
        let powResult: double = Math.pow(base.toDouble(), exp.toDouble());
        expect(powResult).assertEqual(1024.0);
        let base2: Short = new Short(3 as short);
        let exp2: Short = new Short(5 as short);
        let powResult2: double = Math.pow(base2.toDouble(), exp2.toDouble());
        expect(powResult2).assertEqual(243.0);
      }

      {
        let v1: Short = new Short(1 as short);
        let vE: Short = new Short(100 as short);
        expect(Math.log(v1.toDouble())).assertEqual(0.0);
        let log100: double = Math.log(vE.toDouble());
        let expLog: double = Math.exp(log100);
        expect(Math.abs(expLog - 100.0) < 0.000001).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TODOUBLE_1000
     * @tc.name testShortToDouble_merged10
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toDouble, including type conversion.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToDouble_merged10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let zero: Short = new Short(0 as short);
        let one: Short = new Short(1 as short);
        let two: Short = new Short(2 as short);
        expect(Math.exp(zero.toDouble())).assertEqual(1.0);
        let exp1: double = Math.exp(one.toDouble());
        expect(Math.abs(exp1 - 2.718281828459045) < 0.0001).assertTrue();
        let exp2: double = Math.exp(two.toDouble());
        expect(Math.abs(exp2 - 7.38905609893065) < 0.0001).assertTrue();
      }

      {
        let angle0: Short = new Short(0 as short);
        let angle90: Short = new Short(90 as short);
        let angle30: Short = new Short(30 as short);
        let sin0: double = Math.sin(angle0.toDouble() * Math.PI / 180.0);
        expect(Math.abs(sin0 - 0.0) < 0.000001).assertTrue();
        let sin90: double = Math.sin(angle90.toDouble() * Math.PI / 180.0);
        expect(Math.abs(sin90 - 1.0) < 0.000001).assertTrue();
        let sin30: double = Math.sin(angle30.toDouble() * Math.PI / 180.0);
        expect(Math.abs(sin30 - 0.5) < 0.000001).assertTrue();
      }

      {
        let angle0: Short = new Short(0 as short);
        let angle60: Short = new Short(60 as short);
        let angle90: Short = new Short(90 as short);
        let cos0: double = Math.cos(angle0.toDouble() * Math.PI / 180.0);
        expect(Math.abs(cos0 - 1.0) < 0.000001).assertTrue();
        let cos60: double = Math.cos(angle60.toDouble() * Math.PI / 180.0);
        expect(Math.abs(cos60 - 0.5) < 0.000001).assertTrue();
        let cos90: double = Math.cos(angle90.toDouble() * Math.PI / 180.0);
        expect(Math.abs(cos90 - 0.0) < 0.000001).assertTrue();
      }

      {
        let angle0: Short = new Short(0 as short);
        let angle45: Short = new Short(45 as short);
        let tan0: double = Math.tan(angle0.toDouble() * Math.PI / 180.0);
        expect(Math.abs(tan0 - 0.0) < 0.000001).assertTrue();
        let tan45: double = Math.tan(angle45.toDouble() * Math.PI / 180.0);
        expect(Math.abs(tan45 - 1.0) < 0.000001).assertTrue();
      }

      {
        let y1: Short = new Short(1 as short);
        let x1: Short = new Short(0 as short);
        let y2: Short = new Short(1 as short);
        let x2: Short = new Short(1 as short);
        let atan2A: double = Math.atan2(y1.toDouble(), x1.toDouble());
        expect(Math.abs(atan2A - Math.PI / 2.0) < 0.000001).assertTrue();
        let atan2B: double = Math.atan2(y2.toDouble(), x2.toDouble());
        expect(Math.abs(atan2B - Math.PI / 4.0) < 0.000001).assertTrue();
      }

      {
        let dx1: Short = new Short(3 as short);
        let dy1: Short = new Short(4 as short);
        let dx2: Short = new Short(5 as short);
        let dy2: Short = new Short(12 as short);
        let hyp1: double = Math.hypot(dx1.toDouble(), dy1.toDouble());
        expect(hyp1).assertEqual(5.0);
        let hyp2: double = Math.hypot(dx2.toDouble(), dy2.toDouble());
        expect(hyp2).assertEqual(13.0);
      }

      {
        let x0: Short = new Short(0 as short);
        let sigmoid0: double = 1.0 / (1.0 + Math.exp(-x0.toDouble()));
        expect(sigmoid0).assertEqual(0.5);
        let x5: Short = new Short(5 as short);
        let sigmoid5: double = 1.0 / (1.0 + Math.exp(-x5.toDouble()));
        expect(sigmoid5 > 0.99).assertTrue();
        let xNeg5: Short = new Short((-5) as short);
        let sigmoidNeg5: double = 1.0 / (1.0 + Math.exp(-xNeg5.toDouble()));
        expect(sigmoidNeg5 < 0.01).assertTrue();
      }

      {
        let samples: short[] = [10 as short, 20 as short, 30 as short, 40 as short, 50 as short];
        let sum: double = 0.0;
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          sum += Short.toDouble(samples[i]);
        }
        let mean: double = sum / count;
        expect(mean).assertEqual(30.0);
        let samples2: short[] = [2 as short, 4 as short, 6 as short, 8 as short];
        let sum2: double = 0.0;
        let count2: int = 4;
        for (let i: int = 0; i < count2; i++) {
          sum2 += Short.toDouble(samples2[i]);
        }
        let mean2: double = sum2 / count2;
        expect(mean2).assertEqual(5.0);
      }

      {
        let samples: short[] = [2 as short, 4 as short, 4 as short, 4 as short, 5 as short, 5 as short, 7 as short, 9 as short];
        let count: int = 8;
        let sum: double = 0.0;
        for (let i: int = 0; i < count; i++) {
          sum += Short.toDouble(samples[i]);
        }
        let mean: double = sum / count;
        let variance: double = 0.0;
        for (let i: int = 0; i < count; i++) {
          let diff: double = Short.toDouble(samples[i]) - mean;
          variance += diff * diff;
        }
        variance = variance / count;
        expect(variance).assertEqual(4.0);
      }

      {
        let samples: short[] = [2 as short, 4 as short, 4 as short, 4 as short, 5 as short, 5 as short, 7 as short, 9 as short];
        let count: int = 8;
        let sum: double = 0.0;
        for (let i: int = 0; i < count; i++) {
          sum += Short.toDouble(samples[i]);
        }
        let mean: double = sum / count;
        let variance: double = 0.0;
        for (let i: int = 0; i < count; i++) {
          let diff: double = Short.toDouble(samples[i]) - mean;
          variance += diff * diff;
        }
        variance = variance / count;
        let stddev: double = Math.sqrt(variance);
        expect(stddev).assertEqual(2.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TODOUBLE_1100
     * @tc.name testShortToDouble_merged11
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toDouble, including type conversion, business scenarios, comparison and ordering, containers and references, and equality consistency.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToDouble_merged11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let x: short[] = [1 as short, 2 as short, 3 as short, 4 as short, 5 as short];
        let y: short[] = [2 as short, 4 as short, 6 as short, 8 as short, 10 as short];
        let count: int = 5;
        let sumX: double = 0.0;
        let sumY: double = 0.0;
        for (let i: int = 0; i < count; i++) {
          sumX += Short.toDouble(x[i]);
          sumY += Short.toDouble(y[i]);
        }
        let meanX: double = sumX / count;
        let meanY: double = sumY / count;
        let cov: double = 0.0;
        for (let i: int = 0; i < count; i++) {
          cov += (Short.toDouble(x[i]) - meanX) * (Short.toDouble(y[i]) - meanY);
        }
        cov = cov / count;
        expect(cov).assertEqual(4.0);
      }

      {
        let x: short[] = [1 as short, 2 as short, 3 as short, 4 as short, 5 as short];
        let y: short[] = [2 as short, 4 as short, 6 as short, 8 as short, 10 as short];
        let count: int = 5;
        let sumX: double = 0.0;
        let sumY: double = 0.0;
        for (let i: int = 0; i < count; i++) {
          sumX += Short.toDouble(x[i]);
          sumY += Short.toDouble(y[i]);
        }
        let meanX: double = sumX / count;
        let meanY: double = sumY / count;
        let cov: double = 0.0;
        let varX: double = 0.0;
        let varY: double = 0.0;
        for (let i: int = 0; i < count; i++) {
          let dx: double = Short.toDouble(x[i]) - meanX;
          let dy: double = Short.toDouble(y[i]) - meanY;
          cov += dx * dy;
          varX += dx * dx;
          varY += dy * dy;
        }
        let stdX: double = Math.sqrt(varX / count);
        let stdY: double = Math.sqrt(varY / count);
        let correlation: double = (cov / count) / (stdX * stdY);
        expect(Math.abs(correlation - 1.0) < 0.000001).assertTrue();
      }

      {
        let x: short[] = [1 as short, 2 as short, 3 as short, 4 as short, 5 as short];
        let y: short[] = [3 as short, 5 as short, 7 as short, 9 as short, 11 as short];
        let count: int = 5;
        let sumX: double = 0.0;
        let sumY: double = 0.0;
        let sumXY: double = 0.0;
        let sumX2: double = 0.0;
        for (let i: int = 0; i < count; i++) {
          let xi: double = Short.toDouble(x[i]);
          let yi: double = Short.toDouble(y[i]);
          sumX += xi;
          sumY += yi;
          sumXY += xi * yi;
          sumX2 += xi * xi;
        }
        let slope: double = (count * sumXY - sumX * sumY) / (count * sumX2 - sumX * sumX);
        expect(slope).assertEqual(2.0);
      }

      {
        let sortedVals: short[] = [10 as short, 20 as short, 30 as short, 40 as short, 50 as short,
          60 as short, 70 as short, 80 as short, 90 as short, 100 as short];
        let count: int = 10;
        let p50Idx: double = 0.5 * (count - 1);
        let lowerIdx: int = Double.toInt(Math.floor(p50Idx));
        let upperIdx: int = Double.toInt(Math.ceil(p50Idx));
        let frac: double = p50Idx - lowerIdx;
        let p50: double = Short.toDouble(sortedVals[lowerIdx]) * (1.0 - frac) +
          Short.toDouble(sortedVals[upperIdx]) * frac;
        expect(p50).assertEqual(55.0);
      }

      {
        let oddArr: short[] = [1 as short, 2 as short, 3 as short, 4 as short, 5 as short];
        let evenArr: short[] = [1 as short, 2 as short, 3 as short, 4 as short, 5 as short, 6 as short];
        let oddCount: int = 5;
        let evenCount: int = 6;
        let medianOdd: double = Short.toDouble(oddArr[(oddCount - 1) / 2]);
        expect(medianOdd).assertEqual(3.0);
        let medianEven: double = (Short.toDouble(evenArr[evenCount / 2 - 1]) + Short.toDouble(evenArr[evenCount / 2])) / 2.0;
        expect(medianEven).assertEqual(3.5);
      }

      {
        let mass: Short = new Short(10 as short);
        let g: double = 9.81;
        let force: double = mass.toDouble() * g;
        expect(Math.abs(force - 98.1) < 0.0000001).assertTrue();
        expect(force).assertEqual(98.10000000000001);
        let mass2: Short = new Short(50 as short);
        let force2: double = mass2.toDouble() * g;
        expect(force2).assertEqual(490.5);
      }

      {
        let mass: Short = new Short(2 as short);
        let velocity: Short = new Short(10 as short);
        let kinetic: double = 0.5 * mass.toDouble() * velocity.toDouble() * velocity.toDouble();
        expect(kinetic).assertEqual(100.0);
        let mass2: Short = new Short(4 as short);
        let velocity2: Short = new Short(5 as short);
        let kinetic2: double = 0.5 * mass2.toDouble() * velocity2.toDouble() * velocity2.toDouble();
        expect(kinetic2).assertEqual(50.0);
      }

      {
        let altitude: Short = new Short(400 as short);
        let earthRadius: double = 6371.0;
        let gm: double = 398600.0;
        let r: double = altitude.toDouble() + earthRadius;
        let semiMajor: double = r;
        let velocity: double = Math.sqrt(gm * (2.0 / r - 1.0 / semiMajor));
        expect(Math.abs(velocity - 7.672) < 0.01).assertTrue();
        let altitude2: Short = new Short(200 as short);
        let r2: double = altitude2.toDouble() + earthRadius;
        let velocity2: double = Math.sqrt(gm * (2.0 / r2 - 1.0 / r2));
        expect(Math.abs(velocity2 - 7.788) < 0.01).assertTrue();
      }

      {
        let signal: Short = new Short(1000 as short);
        let noise: Short = new Short(10 as short);
        let snr: double = 10.0 * Math.log10(signal.toDouble() / noise.toDouble());
        expect(snr).assertEqual(20.0);
        let signal2: Short = new Short(500 as short);
        let noise2: Short = new Short(5 as short);
        let snr2: double = 10.0 * Math.log10(signal2.toDouble() / noise2.toDouble());
        expect(snr2).assertEqual(20.0);
      }

      {
        let probabilities: Short[] = [
          new Short(5000 as short), new Short(2500 as short),
          new Short(1250 as short), new Short(1250 as short)
        ];
        let total: double = 0.0;
        let probCount: int = 4;
        for (let i: int = 0; i < probCount; i++) {
          total += probabilities[i].toDouble();
        }
        let entropy: double = 0.0;
        for (let i: int = 0; i < probCount; i++) {
          let p: double = probabilities[i].toDouble() / total;
          if (p > 0.0) {
            entropy -= p * Math.log2(p);
          }
        }
        expect(entropy > 1.7 && entropy < 1.9).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TODOUBLE_1200
     * @tc.name testShortToDouble_merged12
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toDouble, including type conversion, business scenarios, and comparison and ordering.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToDouble_merged12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let incomes: short[] = [10 as short, 20 as short, 30 as short, 40 as short];
        let count: int = 4;
        let sumAbsDiff: double = 0.0;
        for (let i: int = 0; i < count; i++) {
          for (let j: int = 0; j < count; j++) {
            sumAbsDiff += Math.abs(Short.toDouble(incomes[i]) - Short.toDouble(incomes[j]));
          }
        }
        let sumIncomes: double = 0.0;
        for (let i: int = 0; i < count; i++) {
          sumIncomes += Short.toDouble(incomes[i]);
        }
        let gini: double = sumAbsDiff / (2.0 * count * sumIncomes);
        expect(Math.abs(gini - 0.25) < 0.0001).assertTrue();
      }

      {
        let initial: Short = new Short(1000 as short);
        let lambda: double = 0.1;
        let t: Short = new Short(10 as short);
        let decayed: double = initial.toDouble() * Math.exp(-lambda * t.toDouble());
        expect(Math.abs(decayed - 367.879) < 0.01).assertTrue();
        let t2: Short = new Short(0 as short);
        let decayed2: double = initial.toDouble() * Math.exp(-lambda * t2.toDouble());
        expect(decayed2).assertEqual(1000.0);
      }

      {
        let k: double = 1000.0;
        let n0: Short = new Short(10 as short);
        let r: double = 0.5;
        let t: Short = new Short(10 as short);
        let numerator: double = k;
        let denominator: double = 1.0 + (k - n0.toDouble()) / n0.toDouble() * Math.exp(-r * t.toDouble());
        let logistic: double = numerator / denominator;
        expect(logistic > 550.0 && logistic < 650.0).assertTrue();
        let t0: Short = new Short(0 as short);
        let denominator0: double = 1.0 + (k - n0.toDouble()) / n0.toDouble() * Math.exp(-r * t0.toDouble());
        let logistic0: double = numerator / denominator0;
        expect(logistic0).assertEqual(10.0);
      }

      {
        let r: Short = new Short(128 as short);
        let g: Short = new Short(64 as short);
        let b: Short = new Short(255 as short);
        let rLinear: double = r.toDouble() / 255.0;
        let gLinear: double = g.toDouble() / 255.0;
        let bLinear: double = b.toDouble() / 255.0;
        expect(Math.abs(rLinear * 255.0 - 128.0) < 0.000001).assertTrue();
        expect(Math.abs(gLinear * 255.0 - 64.0) < 0.000001).assertTrue();
        expect(bLinear).assertEqual(1.0);
      }

      {
        let v0: Short = new Short(0 as short);
        let v255: Short = new Short(255 as short);
        let gamma0: double = Math.pow(v0.toDouble() / 255.0, 2.2) * 255.0;
        expect(gamma0).assertEqual(0.0);
        let gamma255: double = Math.pow(v255.toDouble() / 255.0, 2.2) * 255.0;
        expect(gamma255).assertEqual(255.0);
      }

      {
        let pressureRef: double = 0.00002;
        let pressure: Short = new Short(2000 as short);
        let dbSpl: double = 20.0 * Math.log10(pressure.toDouble() / pressureRef);
        let expected: double = 20.0 * Math.log10(2000.0 / 0.00002);
        expect(Math.abs(dbSpl - expected) < 0.000001).assertTrue();
      }

      {
        let dN: Short = new Short(1 as short);
        let dE: Short = new Short(0 as short);
        let bearing: double = Math.atan2(dN.toDouble(), dE.toDouble()) * 180.0 / Math.PI;
        expect(bearing).assertEqual(90.0);
        let dN2: Short = new Short(0 as short);
        let dE2: Short = new Short(1 as short);
        let bearing2: double = Math.atan2(dN2.toDouble(), dE2.toDouble()) * 180.0 / Math.PI;
        expect(bearing2).assertEqual(0.0);
      }

      {
        let lat1: Short = new Short(40 as short);
        let lon1: Short = new Short((-74) as short);
        let lat2: Short = new Short(34 as short);
        let lon2: Short = new Short((-118) as short);
        let earthR: double = 6371.0;
        let dLatRad: double = (lat2.toDouble() - lat1.toDouble()) * Math.PI / 180.0;
        let dLonRad: double = (lon2.toDouble() - lon1.toDouble()) * Math.PI / 180.0;
        let a: double = Math.sin(dLatRad / 2.0) * Math.sin(dLatRad / 2.0) +
          Math.cos(lat1.toDouble() * Math.PI / 180.0) * Math.cos(lat2.toDouble() * Math.PI / 180.0) *
          Math.sin(dLonRad / 2.0) * Math.sin(dLonRad / 2.0);
        let c: double = 2.0 * Math.atan2(Math.sqrt(a), Math.sqrt(1.0 - a));
        let distance: double = earthR * c;
        expect(distance > 3900.0 && distance < 4000.0).assertTrue();
      }

      {
        let ratePercent: Short = new Short(5 as short);
        let n: Short = new Short(12 as short);
        let rate: double = ratePercent.toDouble() / 100.0;
        let apr: double = Math.pow(1.0 + rate / n.toDouble(), n.toDouble()) - 1.0;
        expect(Math.abs(apr - 0.05116) < 0.0001).assertTrue();
        let ratePercent2: Short = new Short(10 as short);
        let rate2: double = ratePercent2.toDouble() / 100.0;
        let apr2: double = Math.pow(1.0 + rate2 / n.toDouble(), n.toDouble()) - 1.0;
        expect(apr2 > 0.10).assertTrue();
      }

      {
        let principal: Short = new Short(10000 as short);
        let annualRate: double = 0.06;
        let months: Short = new Short(12 as short);
        let monthlyRate: double = annualRate / 12.0;
        let factor: double = Math.pow(1.0 + monthlyRate, months.toDouble());
        let payment: double = principal.toDouble() * monthlyRate * factor / (factor - 1.0);
        expect(Math.abs(payment - 860.66) < 0.1).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TODOUBLE_1300
     * @tc.name testShortToDouble_merged13
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toDouble, including type conversion, business scenarios, and saturation and clamping.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToDouble_merged13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let s: Short = new Short(100 as short);
        let kVal: Short = new Short(100 as short);
        let r: double = 0.05;
        let sigma: double = 0.2;
        let t: Short = new Short(1 as short);
        let d1: double = (Math.log(s.toDouble() / kVal.toDouble()) +
          (r + sigma * sigma / 2.0) * t.toDouble()) / (sigma * Math.sqrt(t.toDouble()));
        let d2: double = d1 - sigma * Math.sqrt(t.toDouble());
        expect(Math.abs(d1 - 0.35) < 0.01).assertTrue();
        expect(Math.abs(d2 - 0.15) < 0.01).assertTrue();
      }

      {
        let x: Short = new Short(100 as short);
        let y: Short = new Short(50 as short);
        let z: Short = new Short(200 as short);
        let projX: double = x.toDouble() / z.toDouble();
        let projY: double = y.toDouble() / z.toDouble();
        expect(projX).assertEqual(0.5);
        expect(projY).assertEqual(0.25);
        let x2: Short = new Short(0 as short);
        let y2: Short = new Short(0 as short);
        let z2: Short = new Short(100 as short);
        let projX2: double = x2.toDouble() / z2.toDouble();
        let projY2: double = y2.toDouble() / z2.toDouble();
        expect(projX2).assertEqual(0.0);
        expect(projY2).assertEqual(0.0);
      }

      {
        let colorR: Short = new Short(200 as short);
        let colorG: Short = new Short(150 as short);
        let colorB: Short = new Short(100 as short);
        let attenuation: double = 0.5;
        let tracedR: double = colorR.toDouble() * attenuation;
        let tracedG: double = colorG.toDouble() * attenuation;
        let tracedB: double = colorB.toDouble() * attenuation;
        expect(tracedR).assertEqual(100.0);
        expect(tracedG).assertEqual(75.0);
        expect(tracedB).assertEqual(50.0);
        let attenuation2: double = 1.0;
        expect(colorR.toDouble() * attenuation2).assertEqual(200.0);
      }

      {
        let inside: Short = new Short(785 as short);
        let total: Short = new Short(1000 as short);
        let piEstimate: double = inside.toDouble() / total.toDouble() * 4.0;
        expect(Math.abs(piEstimate - 3.14) < 0.01).assertTrue();
        let inside2: Short = new Short(0 as short);
        let piZero: double = inside2.toDouble() / total.toDouble() * 4.0;
        expect(piZero).assertEqual(0.0);
      }

      {
        let real: Short = new Short(3 as short);
        let imag: Short = new Short(4 as short);
        let realD: double = real.toDouble();
        let imagD: double = imag.toDouble();
        let magnitude: double = Math.sqrt(realD * realD + imagD * imagD);
        let phase: double = Math.atan2(imagD, realD);
        expect(magnitude).assertEqual(5.0);
        expect(Math.abs(magnitude - 5.0) < 0.0001).assertTrue();
        expect(phase > 0.0).assertTrue();
      }

      {
        let predErr: Short = new Short(4 as short);
        let measErr: Short = new Short(1 as short);
        let kalmanGain: double = predErr.toDouble() / (predErr.toDouble() + measErr.toDouble());
        expect(kalmanGain).assertEqual(0.8);
        let predErr2: Short = new Short(1 as short);
        let measErr2: Short = new Short(1 as short);
        let kalmanGain2: double = predErr2.toDouble() / (predErr2.toDouble() + measErr2.toDouble());
        expect(kalmanGain2).assertEqual(0.5);
      }

      {
        let kp: double = 2.0;
        let ki: double = 0.5;
        let kd: double = 1.0;
        let error: double = 10.0;
        let integral: Short = new Short(50 as short);
        let derivative: Short = new Short((-5) as short);
        let pid: double = kp * error + ki * integral.toDouble() + kd * derivative.toDouble();
        expect(pid).assertEqual(40.0);
        let integral2: Short = new Short(0 as short);
        let derivative2: Short = new Short(0 as short);
        let pid2: double = kp * error + ki * integral2.toDouble() + kd * derivative2.toDouble();
        expect(pid2).assertEqual(20.0);
      }

      {
        let q1: Short = new Short(1 as short);
        let q2: Short = new Short(0 as short);
        let t: double = 0.5;
        let omega: double = Math.PI / 2.0;
        let factor1: double = Math.sin((1.0 - t) * omega) / Math.sin(omega);
        let factor2: double = Math.sin(t * omega) / Math.sin(omega);
        let slerpResult: double = factor1 * q1.toDouble() + factor2 * q2.toDouble();
        expect(Math.abs(slerpResult - Math.sin(Math.PI / 4.0)) < 0.000001).assertTrue();
        let q1b: Short = new Short(10 as short);
        let q2b: Short = new Short(10 as short);
        let slerpSame: double = factor1 * q1b.toDouble() + factor2 * q2b.toDouble();
        expect(Math.abs(slerpSame - 10.0 * Math.sqrt(2.0)) < 0.000001).assertTrue();
      }

      {
        let clamp = (v: double, lo: double, hi: double): double => Math.min(hi, Math.max(lo, v));
        expect(clamp(Short.toDouble(50 as short), 0.0, 100.0)).assertEqual(50.0);
        expect(clamp(Short.toDouble((-10) as short), 0.0, 100.0)).assertEqual(0.0);
        expect(clamp(Short.toDouble(200 as short), 0.0, 100.0)).assertEqual(100.0);
  
        expect(clamp(Short.toDouble(0 as short), 0.0, 100.0)).assertEqual(0.0);
        expect(clamp(Short.toDouble(100 as short), 0.0, 100.0)).assertEqual(100.0);
  
        expect(clamp(Short.toDouble(Short.MIN_VALUE), -40000.0, 40000.0)).assertEqual(-32768.0);
        expect(clamp(Short.toDouble(Short.MAX_VALUE), -40000.0, 40000.0)).assertEqual(32767.0);
      }

      {
        let m1: Short = new Short(100 as short);
        let m2: Short = new Short(200 as short);
        let r: Short = new Short(10 as short);
        let force: double = 6.674e-11 * m1.toDouble() * m2.toDouble() / (r.toDouble() * r.toDouble());
        expect(force > 1.3e-8 && force < 1.4e-8).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TODOUBLE_1400
     * @tc.name testShortToDouble_merged14
     * @tc.desc CrossTypeRoundTrip / RadixConversion: covers 10 merged test points for Short.toDouble, including type conversion, radix conversion, loop accumulation, business scenarios, and boundary values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToDouble_merged14', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let a: Short = new Short(8 as short);
        let b: Short = new Short(27 as short);
        let c: Short = new Short(64 as short);
        let product: double = a.toDouble() * b.toDouble() * c.toDouble();
        let geoMean: double = Math.cbrt(product);
        expect(geoMean).assertEqual(24.0);
      }

      {
        let f: Short = new Short(1000);
        let mel: double = 2595.0 * Math.log10(1.0 + f.toDouble() / 700.0);
        expect(Math.abs(mel - 1000) < 1.0).assertTrue();
        expect(mel).assertEqual(999.9855371396244);
      }

      {
        let tShort: Short = new Short(500);
        let t: double = tShort.toDouble() / 1000.0;
        let B: double = 3 * t * (1 - t) * (1 - t);
        expect(Math.abs(B - 0.375) < 0.0001).assertTrue();
        expect(B).assertEqual(0.375);
      }

      {
        let prev: double = Short.toDouble((-501) as short);
        let violations: int = 0;
        for (let i: int = -500; i <= 500; i++) {
          let curr: double = Short.toDouble(Int.toShort(i));
          if (curr <= prev) {
            violations++;
          }
          prev = curr;
        }
        expect(violations).assertEqual(0);
      }

      {
        let prev: double = Short.toDouble(31999 as short);
        let violations: int = 0;
        for (let i: int = 32000; i <= 32767; i++) {
          let curr: double = Short.toDouble(Int.toShort(i));
          if (curr <= prev) {
            violations++;
          }
          prev = curr;
        }
        expect(violations).assertEqual(0);
      }

      {
        let val: int = 1;
        let i: int = 0;
        while (val <= 16384 && i < 20) {
          let s: short = Int.toShort(val);
          let d: double = Short.toDouble(s);
          let expected: double = Int.toDouble(val);
          expect(d).assertEqual(expected);
          val = val * 2;
          i++;
        }
        expect(Short.toDouble(1 as short)).assertEqual(1.0);
        expect(Short.toDouble(1024 as short)).assertEqual(1024.0);
        expect(Short.toDouble(16384 as short)).assertEqual(16384.0);
      }

      {
        let acc: Short = new Short(0 as short);
        let n: int = 1;
        while (n <= 10) {
          acc = acc.add(new Short(Int.toShort(n)));
          let expectedSum: int = n * (n + 1) / 2;
          expect(acc.toDouble()).assertEqual(Int.toDouble(expectedSum));
          n++;
        }
        expect(acc.toShort()).assertEqual(55 as short);
        expect(acc.toDouble()).assertEqual(55.0);
      }

      {
        expect(Short.toDouble(0x100 as short)).assertEqual(256.0);
        expect(Short.toDouble(0x0FF as short)).assertEqual(255.0);
        expect(Short.toDouble(0x200 as short)).assertEqual(512.0);
        expect(Short.toDouble(0x7FFF as short)).assertEqual(32767.0);
      }

      {
        expect(Short.toDouble(0x0000 as short)).assertEqual(0.0);
        expect(Short.toDouble(0x7FFF as short)).assertEqual(32767.0);
        expect(Short.toDouble((-0x8000) as short)).assertEqual(-32768.0);
        expect(Short.toDouble(0x3FFF as short)).assertEqual(16383.0);
        expect(Short.toDouble((-0x4000) as short)).assertEqual(-16384.0);
      }

      {
        let parsedVal: short = Short.parseInt('999', 10);
        let hexVal: short = 0x3FF as short;
        let boxedParsed: Short = new Short(parsedVal);
        let boxedHex: Short = new Short(hexVal);
        let parsedDouble: double = boxedParsed.toDouble();
        let hexDouble: double = boxedHex.toDouble();
        expect(parsedDouble).assertEqual(999.0);
        expect(hexDouble).assertEqual(1023.0);
        expect(boxedParsed.toShort()).assertEqual(999 as short);
        expect(boxedHex.toShort()).assertEqual(1023 as short);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TODOUBLE_1500
     * @tc.name testShortToDouble_merged15
     * @tc.desc RadixConversion / Idempotent: covers 10 merged test points for Short.toDouble, including type conversion, equality consistency, radix conversion, constructor forms, and business scenarios.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToDouble_merged15', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        expect(Short.toDouble((-0x10) as short)).assertEqual(-16.0);
        expect(Short.toDouble((-0x64) as short)).assertEqual(-100.0);
        expect(Short.toDouble((-0x100) as short)).assertEqual(-256.0);
        expect(Short.toDouble((-0x400) as short)).assertEqual(-1024.0);
      }

      {
        let fromHex: short = Short.parseInt('7FFF', 16);
        let fromBin: short = Short.parseInt('111111111111111', 2);
        expect(Short.toDouble(fromHex)).assertEqual(32767.0);
        expect(Short.toDouble(fromBin)).assertEqual(32767.0);
        let negFromHex: short = Short.parseInt('-8000', 16);
        expect(Short.toDouble(negFromHex)).assertEqual(-32768.0);
        let fromOctal: short = Short.parseInt('77777', 8);
        expect(Short.toDouble(fromOctal)).assertEqual(32767.0);
      }

      {
        let fromOctal1: short = Short.parseInt('377', 8);
        let fromOctal2: short = Short.parseInt('200', 8);
        let fromOctal3: short = Short.parseInt('77777', 8);
        let fromOctal4: short = Short.parseInt('-100000', 8);
        expect(Short.toDouble(fromOctal1)).assertEqual(255.0);
        expect(Short.toDouble(fromOctal2)).assertEqual(128.0);
        expect(Short.toDouble(fromOctal3)).assertEqual(32767.0);
        expect(Short.toDouble(fromOctal4)).assertEqual(-32768.0);
      }

      {
        let testVals: short[] = [1 as short, 127 as short, 128 as short, 255 as short, 256 as short, 1024 as short, 2048 as short,
          (-1) as short, (-128) as short, (-256) as short, (-1024) as short];
        let count: int = 11;
        for (let i: int = 0; i < count; i++) {
          let s: Short = new Short(testVals[i]);
          let doubleResult: double = s.toDouble();
          let intResult: int = s.toInt();
          expect(doubleResult).assertEqual(Int.toDouble(intResult));
        }
      }

      {
        let fromLiteral: Short = new Short(255 as short);
        let fromParseDec: Short = new Short(Short.parseInt('255', 10));
        let fromParseHex: Short = new Short(Short.parseInt('FF', 16));
        let fromIntToShort: Short = new Short(Int.toShort(255));
        expect(fromLiteral.toDouble()).assertEqual(255.0);
        expect(fromParseDec.toDouble()).assertEqual(255.0);
        expect(fromParseHex.toDouble()).assertEqual(255.0);
        expect(fromIntToShort.toDouble()).assertEqual(255.0);
        expect(fromLiteral.toShort()).assertEqual(255 as short);
        expect(fromParseDec.toShort()).assertEqual(255 as short);
        expect(fromParseHex.toShort()).assertEqual(255 as short);
        expect(fromIntToShort.toShort()).assertEqual(255 as short);
      }

      {
        let testVals: short[] = [1 as short, 2 as short, 4 as short, 8 as short, 16 as short, 32 as short,
          64 as short, 128 as short, 256 as short, 512 as short, 1024 as short, 2048 as short, 4096 as short, 16384 as short];
        let count: int = 14;
        for (let i: int = 0; i < count; i++) {
          let negVal: short = Int.toShort(-testVals[i]);
          let posDouble: double = Short.toDouble(testVals[i]);
          let negDouble: double = Short.toDouble(negVal);
          expect(-posDouble).assertEqual(negDouble);
        }
      }

      {
        let box1: Short = new Short(500 as short);
        let box2: Short = new Short(500 as short);
        let box3: Short = new Short(500 as short);
        expect(box1.toDouble()).assertEqual(500.0);
        expect(box2.toDouble()).assertEqual(500.0);
        expect(box3.toDouble()).assertEqual(500.0);
        expect(box1.toDouble()).assertEqual(box2.toDouble());
        expect(box2.toDouble()).assertEqual(box3.toDouble());
      }

      {
        let hexVal: short = 0xFF as short;
        let octVal: short = 0o200 as short;
        let parsedVal: short = Short.parseInt('512', 10);
        let dirVal: short = 64 as short;
        expect(Short.toDouble(hexVal)).assertEqual(255.0);
        expect(Short.toDouble(octVal)).assertEqual(128.0);
        expect(Short.toDouble(parsedVal)).assertEqual(512.0);
        expect(Short.toDouble(dirVal)).assertEqual(64.0);
      }

      {
        let base: Short = new Short(2 as short);
        let multiplier: Short = new Short(3 as short);
        let r1: Short = base.mul(multiplier);
        let r2: Short = r1.mul(multiplier);
        let r3: Short = r2.mul(multiplier);
        expect(r1.toDouble()).assertEqual(6.0);
        expect(r2.toDouble()).assertEqual(18.0);
        expect(r3.toDouble()).assertEqual(54.0);
      }

      {
        let base: Short = new Short(1000 as short);
        let divisor: Short = new Short(2 as short);
        let r1: Short = base.div(divisor);
        let r2: Short = r1.div(divisor);
        let r3: Short = r2.div(divisor);
        expect(r1.toDouble()).assertEqual(500.0);
        expect(r2.toDouble()).assertEqual(250.0);
        expect(r3.toDouble()).assertEqual(125.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TODOUBLE_1600
     * @tc.name testShortToDouble_merged16
     * @tc.desc Idempotent / BusinessScenario: covers 5 merged test points for Short.toDouble, including equality consistency, type conversion, zero values, loop accumulation, and algebraic properties.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToDouble_merged16', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let zeroLiteral: double = Short.toDouble(0 as short);
        let zeroVar: short = 0 as short;
        let zeroVarResult: double = Short.toDouble(zeroVar);
        let zeroBox: Short = new Short(0 as short);
        let zeroBoxResult: double = zeroBox.toDouble();
        expect(zeroLiteral).assertEqual(0.0);
        expect(zeroVarResult).assertEqual(0.0);
        expect(zeroBoxResult).assertEqual(0.0);
        expect(zeroLiteral).assertEqual(zeroVarResult);
        expect(zeroVarResult).assertEqual(zeroBoxResult);
      }

      {
        let rawValues: int[] = [100, 200, 300, 400, 500];
  
        let shortVals: Short[] = [];
        let intVals: int[] = [];
        let doubleVals: double[] = [];
  
        for (let v of rawValues) {
          let s: Short = new Short(Int.toShort(v));
          shortVals.push(s);
          intVals.push(s.toInt());
          doubleVals.push(s.toDouble());
        }
  
        let shortSum: Short = new Short(0 as short);
        for (let s of shortVals) shortSum = shortSum.add(s);
  
        let intSum: int = 0;
        for (let i of intVals) intSum += i;
  
        let doubleSum: double = 0.0;
        for (let d of doubleVals) doubleSum += d;
  
        expect(shortSum.toInt()).assertEqual(1500);
        expect(shortSum.toInt()).assertEqual(intSum);
        expect(doubleSum).assertEqual(1500.0);
  
        let intMean: double = intSum / intVals.length;
        let doubleMean: double = doubleSum / doubleVals.length;
        expect(doubleMean).assertEqual(intMean);
      }

      {
        let a: Short = new Short(7 as short);
        let b: Short = new Short(11 as short);
        let c: Short = new Short(13 as short);
        let left: double = a.toDouble() * (b.toDouble() + c.toDouble());
        let right: double = a.toDouble() * b.toDouble() + a.toDouble() * c.toDouble();
        expect(left).assertEqual(right);
        expect(left).assertEqual(168.0);
        let a2: Short = new Short((-5) as short);
        let b2: Short = new Short(20 as short);
        let c2: Short = new Short((-8) as short);
        let left2: double = a2.toDouble() * (b2.toDouble() + c2.toDouble());
        let right2: double = a2.toDouble() * b2.toDouble() + a2.toDouble() * c2.toDouble();
        expect(left2).assertEqual(right2);
        expect(left2).assertEqual(-60.0);
      }

      {
        let x: Short = new Short(0 as short);
        let mu: Short = new Short(0 as short);
        let sigma: double = 1.0;
        let diff: double = x.toDouble() - mu.toDouble();
        let normalPdf: double = Math.exp(-diff * diff / (2.0 * sigma * sigma)) / (sigma * Math.sqrt(2.0 * Math.PI));
        expect(Math.abs(normalPdf - 0.3989422804) < 0.0001).assertTrue();
        let x2: Short = new Short(1 as short);
        let diff2: double = x2.toDouble() - mu.toDouble();
        let normalPdf2: double = Math.exp(-diff2 * diff2 / (2.0 * sigma * sigma)) / (sigma * Math.sqrt(2.0 * Math.PI));
        expect(Math.abs(normalPdf2 - 0.2419707245) < 0.0001).assertTrue();
      }

      {
        let signErrors: int = 0;
        let testVals: short[] = [
          (-1) as short, (-100) as short, (-1000) as short,
          (-16384) as short, (-32767) as short, (-32768) as short
        ];
        for (let val of testVals) {
          let d: double = Short.toDouble(val);
          if (d >= 0.0) {
            signErrors++;
          }
        }
        expect(signErrors).assertEqual(0);
        let zeroDouble: double = Short.toDouble(0 as short);
        expect(zeroDouble >= 0.0).assertTrue();
      }
    });

  });
}