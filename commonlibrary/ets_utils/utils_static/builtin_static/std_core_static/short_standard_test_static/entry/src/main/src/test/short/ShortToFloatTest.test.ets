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

class AlertEntry {
  index: int;
  value: float;
  constructor(index: int, value: float) {
    this.index = index;
    this.value = value;
  }
}

export default function shortToFloatTest(): void {
  describe('ShortToFloatTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOFLOAT_0100
     * @tc.name testShortToFloat_merged1
     * @tc.desc BoundaryOverflow: covers 10 merged test points for Short.toFloat, including type conversion, boundary values, wrapping, business scenarios, and zero values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToFloat_merged1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let maxShortValue: short = Short.MAX_VALUE;
        let actualResult: float = Short.toFloat(maxShortValue);
        expect(actualResult).assertEqual(32767.0f);
      }

      {
        let repeatedValue: short = 100 as short;
        expect(Short.toFloat(repeatedValue)).assertEqual(100.0f);
        expect(Short.toFloat(repeatedValue)).assertEqual(100.0f);
        expect(Short.toFloat(repeatedValue)).assertEqual(100.0f);
        repeatedValue = Short.MIN_VALUE;
        expect(Short.toFloat(repeatedValue)).assertEqual(-32768.0f);
        expect(Short.toFloat(repeatedValue)).assertEqual(-32768.0f);
        expect(Short.toFloat(repeatedValue)).assertEqual(-32768.0f);
        repeatedValue = Short.MAX_VALUE;
        expect(Short.toFloat(repeatedValue)).assertEqual(32767.0f);
        expect(Short.toFloat(repeatedValue)).assertEqual(32767.0f);
        expect(Short.toFloat(repeatedValue)).assertEqual(32767.0f);
        repeatedValue = 0 as short;
        expect(Short.toFloat(repeatedValue)).assertEqual(0.0f);
        expect(Short.toFloat(repeatedValue)).assertEqual(0.0f);
        expect(Short.toFloat(repeatedValue)).assertEqual(0.0f);
      }

      {
        let shortFromA: short = Char.toShort(c'A');
        expect(Short.toFloat(shortFromA)).assertEqual(65.0f);
        let shortFromZ: short = Char.toShort(c'z');
        expect(Short.toFloat(shortFromZ)).assertEqual(122.0f);
        let shortFromFF: short = Char.toShort(c'\u00FF');
        expect(Short.toFloat(shortFromFF)).assertEqual(255.0f);
        let shortFrom1234: short = Char.toShort(c'\u1234');
        expect(Short.toFloat(shortFrom1234)).assertEqual(4660.0f);
        let shortFrom4E2D: short = Char.toShort(c'\u4E2D');
        expect(Short.toFloat(shortFrom4E2D)).assertEqual(20013.0f);
        let shortFromFFFF: short = Char.toShort(c'\uFFFF');
        expect(Short.toFloat(shortFromFFFF)).assertEqual(-1.0f);
      }

      {
        let minValue: short = Short.MIN_VALUE;
        let minFloat: float = Short.toFloat(minValue);
        let negatedFloat: float = (-minFloat);
        let shortWrap: short = Int.toShort((-Short.toInt(minValue)));
        expect(minFloat).assertEqual((-32768.0f));
        expect(negatedFloat).assertEqual(32768.0f);
        expect(Short.toFloat(shortWrap)).assertEqual((-32768.0f));
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
        let expectedValues: float[] = [
          0.0f,
          42.0f,
          -42.0f,
          32766.0f,
          -32767.0f,
          32767.0f,
          -32768.0f
        ];
        let boxedValues: Short[] = [
          new Short(testValues[0]),
          new Short(testValues[1]),
          new Short(testValues[2]),
          new Short(testValues[3]),
          new Short(testValues[4]),
          new Short(testValues[5]),
          new Short(testValues[6])
        ];
        expect(boxedValues[0].toFloat()).assertEqual(expectedValues[0]);
        expect(Short.toFloat(testValues[0])).assertEqual(expectedValues[0]);
        expect(boxedValues[0].toShort()).assertEqual(testValues[0]);
        expect(boxedValues[1].toFloat()).assertEqual(expectedValues[1]);
        expect(Short.toFloat(testValues[1])).assertEqual(expectedValues[1]);
        expect(boxedValues[1].toShort()).assertEqual(testValues[1]);
        expect(boxedValues[2].toFloat()).assertEqual(expectedValues[2]);
        expect(Short.toFloat(testValues[2])).assertEqual(expectedValues[2]);
        expect(boxedValues[2].toShort()).assertEqual(testValues[2]);
        expect(boxedValues[3].toFloat()).assertEqual(expectedValues[3]);
        expect(Short.toFloat(testValues[3])).assertEqual(expectedValues[3]);
        expect(boxedValues[3].toShort()).assertEqual(testValues[3]);
        expect(boxedValues[4].toFloat()).assertEqual(expectedValues[4]);
        expect(Short.toFloat(testValues[4])).assertEqual(expectedValues[4]);
        expect(boxedValues[4].toShort()).assertEqual(testValues[4]);
        expect(boxedValues[5].toFloat()).assertEqual(expectedValues[5]);
        expect(Short.toFloat(testValues[5])).assertEqual(expectedValues[5]);
        expect(boxedValues[5].toShort()).assertEqual(testValues[5]);
        expect(boxedValues[6].toFloat()).assertEqual(expectedValues[6]);
        expect(Short.toFloat(testValues[6])).assertEqual(expectedValues[6]);
        expect(boxedValues[6].toShort()).assertEqual(testValues[6]);
      }

      {
        let doubleSource: short = Double.toShort(123.9);
        let actualResult: float = Short.toFloat(doubleSource);
        expect(actualResult).assertEqual(123.0f);
        let negDoubleSource: short = Double.toShort(-45.9);
        expect(Short.toFloat(negDoubleSource)).assertEqual((-45.0f));
      }

      {
        let adjacentMaxValue: short = Int.toShort(32766);
        let actualResult: float = Short.toFloat(adjacentMaxValue);
        expect(actualResult).assertEqual(32766.0f);
      }

      {
        let actualResult: float = Short.toFloat((-32767) as short);
        expect(actualResult).assertEqual((-32767.0f));
      }

      {
        let longWrap: short = Long.toShort(Long.toLong(40000));
        let actualResult: float = Short.toFloat(longWrap);
        expect(actualResult).assertEqual((-25536.0f));
        let longWrapNeg: short = Long.toShort(Long.toLong(-40000));
        expect(Short.toFloat(longWrapNeg)).assertEqual(25536.0f);
      }

      {
        let rawValues: Short[] = [
          new Short(-32768 as short), new Short(0 as short), new Short(16384 as short), new Short(32767 as short)
        ];
        let normalizationMap: Map<int, float> = new Map<int, float>();
        let minFloat: float = Short.toFloat(new Short(-32768 as short));
        let maxFloat: float = Short.toFloat(new Short(32767 as short));
        let range: float = maxFloat - minFloat;
        for (let v of rawValues) {
          let fVal: float = v.toFloat();
          let normalized: float = (fVal - minFloat) / range;
          normalizationMap.set(v.toInt(), normalized);
        }
  
        let minNorm: float = normalizationMap.get(-32768) as float;
        let maxNorm: float = normalizationMap.get(32767) as float;
        let midNorm: float = normalizationMap.get(0) as float;
        let halfNorm: float = normalizationMap.get(16384) as float;
        expect(minNorm).assertEqual(0.0f);
        expect(maxNorm).assertEqual(1.0f);
        expect(midNorm > 0.499 && midNorm < 0.501).assertTrue();
        expect(halfNorm > midNorm).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOFLOAT_0200
     * @tc.name testShortToFloat_merged2
     * @tc.desc BoundaryOverflow: covers 10 merged test points for Short.toFloat, including type conversion, wrapping, fractions and rounding, boundary values, and equality consistency.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToFloat_merged2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let wrapMin: short = Int.toShort(0x8000);
        let wrapNegOne: short = Int.toShort(0xFFFF);
        let wrapNegMax: short = Int.toShort(0x8001);
        expect(Short.toFloat(wrapMin)).assertEqual(-32768.0f);
        expect(Short.toFloat(wrapNegOne)).assertEqual(-1.0f);
        expect(Short.toFloat(wrapNegMax)).assertEqual(-32767.0f);
      }

      {
        let negShift: short = Int.toShort((-8) >> 1);
        let posShift: short = Int.toShort(32767 >> 5);
        expect(Short.toFloat(negShift)).assertEqual(-4.0f);
        expect(Short.toFloat(posShift)).assertEqual(1023.0f);
      }

      {
        let overflowAdd: short = Int.toShort(20000 + 20000);
        let overflowMul: short = Int.toShort(200 * 200);
        expect(Short.toFloat(overflowAdd)).assertEqual(-25536.0f);
        expect(Short.toFloat(overflowMul)).assertEqual(-25536.0f);
      }

      {
        let maxPlusOne: short = Int.toShort(32767 + 1);
        let minMinusOne: short = Int.toShort(-32768 - 1);
        expect(Short.toFloat(maxPlusOne)).assertEqual(-32768.0f);
        expect(Short.toFloat(minMinusOne)).assertEqual(32767.0f);
      }

      {
        let posDiv: short = Int.toShort(7 / 2);
        let negDiv: short = Int.toShort((-7) / 2);
        let negDiv2: short = Int.toShort(7 / (-2));
        expect(Short.toFloat(posDiv)).assertEqual(3.0f);
        expect(Short.toFloat(negDiv)).assertEqual(-3.0f);
        expect(Short.toFloat(negDiv2)).assertEqual(-3.0f);
      }

      {
        let negMin: short = Int.toShort(-Short.MIN_VALUE);
        expect(Short.toFloat(negMin)).assertEqual(-32768.0f);
        expect(Short.toFloat(Short.MIN_VALUE)).assertEqual(Short.toFloat(negMin));
      }

      {
        expect(Short.toFloat(Int.toShort(32768))).assertEqual(-32768.0f);
        expect(Short.toFloat(Int.toShort(65535))).assertEqual(-1.0f);
        expect(Short.toFloat(Int.toShort(65536))).assertEqual(0.0f);
        expect(Short.toFloat(Int.toShort(-32769))).assertEqual(32767.0f);
      }

      {
        let testVals: short[] = [Short.MIN_VALUE, (-16384) as short, (-1) as short, 0 as short,
          1 as short, 16384 as short, Short.MAX_VALUE, 255 as short, (-255) as short];
        let count: int = 9;
        for (let i: int = 0; i < count; i++) {
          let fVal: float = Short.toFloat(testVals[i]);
          let intVal: int = Short.toInt(testVals[i]);
          expect(Math.round(fVal)).assertEqual(intVal);
        }
      }

      {
        let pairs: short[][] = [[1 as short, (-1) as short], [100 as short, (-100) as short],
          [16384 as short, (-16384) as short], [32767 as short, (-32767) as short]];
        let pCount: int = 4;
        for (let i: int = 0; i < pCount; i++) {
          expect(Math.abs(Short.toFloat(pairs[i][0]))).assertEqual(Short.toFloat(pairs[i][0]));
          expect(Math.abs(Short.toFloat(pairs[i][1]))).assertEqual(Short.toFloat(pairs[i][0]));
        }
      }

      {
        let altBits1: short = 0x5555 as short;
        let altBits2: short = Int.toShort(0xAAAA);
        let nibbleHi: short = 0x0FFF as short;
        expect(Short.toFloat(altBits1)).assertEqual(21845.0f);
        expect(Short.toFloat(altBits2)).assertEqual(-21846.0f);
        expect(Short.toFloat(nibbleHi)).assertEqual(4095.0f);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOFLOAT_0300
     * @tc.name testShortToFloat_merged3
     * @tc.desc BoundaryOverflow / ErrorException / CrossTypeRoundTrip: covers 10 merged test points for Short.toFloat, including type conversion, overflow, radix conversion, positive values, and negative values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToFloat_merged3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let sum: double = 0.0;
        let batchCount: int = 100;
        for (let i: int = 1; i <= batchCount; i++) {
          let sVal: short = Int.toShort(i * 100);
          sum = sum + Short.toFloat(sVal);
        }
        let expectedSum: float = Int.toFloat(505000);
        expect(sum).assertEqual(expectedSum);
      }

      {
        let zeroBin: short = Short.parseInt('0', 2);
        let maxBin: short = Short.parseInt('111111111111111', 2);
        let midBin: short = Int.toShort(0x8000);
        let smallBin: short = Short.parseInt('101010', 2);
        expect(Short.toFloat(zeroBin)).assertEqual(0.0f);
        expect(Short.toFloat(maxBin)).assertEqual(32767.0f);
        expect(Short.toFloat(midBin)).assertEqual(-32768.0f);
        expect(Short.toFloat(smallBin)).assertEqual(42.0f);
      }

      {
        let zeroResult: float = Short.toFloat(0 as short);
        expect(zeroResult).assertEqual(0.0f);
        let posResult: float = Short.toFloat(1 as short);
        expect(posResult).assertEqual(1.0f);
        let negResult: float = Short.toFloat((-1) as short);
        expect(negResult).assertEqual((-1.0f));
        let maxResult: float = Short.toFloat(Short.MAX_VALUE);
        expect(maxResult).assertEqual(32767.0f);
        let minResult: float = Short.toFloat(Short.MIN_VALUE);
        expect(minResult).assertEqual((-32768.0f));
      }

      {
        let a: short = 100 as short;
        let b: short = 200 as short;
        let sumShort: short = Int.toShort(a + b);
        let sumFloat: float = Short.toFloat(sumShort);
        let aFloat: float = Short.toFloat(a);
        let bFloat: float = Short.toFloat(b);
        expect(sumFloat).assertEqual(aFloat + bFloat);
        let c: short = 1000 as short;
        let d: short = 500 as short;
        let sumCD: short = Int.toShort(c + d);
        let sumCDFloat: float = Short.toFloat(sumCD);
        expect(sumCDFloat).assertEqual(Short.toFloat(c) + Short.toFloat(d));
      }

      {
        let a: short = 10 as short;
        let b: short = 50 as short;
        let prodShort: short = Int.toShort(a * b);
        let prodFloat: float = Short.toFloat(prodShort);
        let aFloat: float = Short.toFloat(a);
        let bFloat: float = Short.toFloat(b);
        expect(prodFloat).assertEqual(aFloat * bFloat);
        let c: short = 3 as short;
        let d: short = 7 as short;
        let prodCD: short = Int.toShort(c * d);
        expect(Short.toFloat(prodCD)).assertEqual(Short.toFloat(c) * Short.toFloat(d));
      }

      {
        let sortedShorts: short[] = [10 as short, 20 as short, 30 as short, 40 as short, 50 as short, 60 as short, 70 as short, 80 as short, 90 as short, 100 as short];
        let targetFound: short = 70 as short;
        let low: int = 0;
        let high: int = sortedShorts.length - 1;
        let found: boolean = false;
        while (low <= high) {
          let mid: int = (low + high) >> 1;
          let midFloat: float = Short.toFloat(sortedShorts[mid]);
          let targetFloat: float = Short.toFloat(targetFound);
          if (midFloat === targetFloat) {
            found = true;
            break;
          }
          if (midFloat < targetFloat) {
            low = mid + 1;
          } else {
            high = mid - 1;
          }
        }
        expect(found).assertTrue();
        let targetMissing: short = 35 as short;
        let low2: int = 0;
        let high2: int = sortedShorts.length - 1;
        let found2: boolean = false;
        while (low2 <= high2) {
          let mid2: int = (low2 + high2) >> 1;
          let midFloat2: float = Short.toFloat(sortedShorts[mid2]);
          let targetFloat2: float = Short.toFloat(targetMissing);
          if (midFloat2 === targetFloat2) {
            found2 = true;
            break;
          }
          if (midFloat2 < targetFloat2) {
            low2 = mid2 + 1;
          } else {
            high2 = mid2 - 1;
          }
        }
        expect(found2).assertFalse();
      }

      {
        let error: short = 10 as short;
        let integral: short = 5 as short;
        let Kp: double = 2.0;
        let Ki: double = 0.5;
        let pidOutput: double = Short.toFloat(error) * Kp + Short.toFloat(integral) * Ki;
        expect(pidOutput).assertEqual(22.5);
        let error2: short = (-5) as short;
        let integral2: short = 3 as short;
        let pid2: double = Short.toFloat(error2) * Kp + Short.toFloat(integral2) * Ki;
        expect(pid2).assertEqual(-8.5);
      }

      {
        let zeroValue: short = 0 as short;
        let actualResult: float = Short.toFloat(zeroValue);
        expect(actualResult).assertEqual(0.0f);
      }

      {
        let actualResult: float = Short.toFloat(9 as short);
        expect(actualResult).assertEqual(9.0f);
      }

      {
        let negativeValue: short = (-123) as short;
        let actualResult: float = Short.toFloat(negativeValue);
        expect(actualResult).assertEqual((-123.0f));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOFLOAT_0400
     * @tc.name testShortToFloat_merged4
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toFloat, including type conversion, business scenarios, negative values, radix conversion, and positive values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToFloat_merged4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let testValues: short[] = [
          1 as short,
          255 as short,
          1024 as short,
          16384 as short,
          Short.MAX_VALUE
        ];
        let expectedValues: float[] = [
          1.0f,
          255.0f,
          1024.0f,
          16384.0f,
          32767.0f
        ];
        let caseCount: int = 5;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let actualResult: float = Short.toFloat(testValues[caseIndex]);
          expect(actualResult).assertEqual(expectedValues[caseIndex]);
        }
      }

      {
        let testValues: short[] = [
          (-1) as short,
          (-128) as short,
          Short.MIN_VALUE,
          (-10000) as short
        ];
        let expectedValues: float[] = [
          -1.0f,
          -128.0f,
          -32768.0f,
          -10000.0f
        ];
        expect(Short.toFloat(testValues[0])).assertEqual(expectedValues[0]);
        expect(Short.toFloat(testValues[1])).assertEqual(expectedValues[1]);
        expect(Short.toFloat(testValues[2])).assertEqual(expectedValues[2]);
        expect(Short.toFloat(testValues[3])).assertEqual(expectedValues[3]);
      }

      {
        let dividend: short = 17 as short;
        let divisor: short = 5 as short;
        expect(Short.toFloat(dividend) % Short.toFloat(divisor)).assertEqual(Int.toFloat(Short.toInt(dividend) % Short.toInt(divisor)));
        dividend = (-17) as short;
        expect(Short.toFloat(dividend) % Short.toFloat(divisor)).assertEqual(Int.toFloat(Short.toInt(dividend) % Short.toInt(divisor)));
        dividend = 0 as short;
        divisor = 9 as short;
        expect(Short.toFloat(dividend) % Short.toFloat(divisor)).assertEqual(Int.toFloat(Short.toInt(dividend) % Short.toInt(divisor)));
        dividend = 255 as short;
        divisor = 256 as short;
        expect(Short.toFloat(dividend) % Short.toFloat(divisor)).assertEqual(Int.toFloat(Short.toInt(dividend) % Short.toInt(divisor)));
        dividend = (-255) as short;
        expect(Short.toFloat(dividend) % Short.toFloat(divisor)).assertEqual(Int.toFloat(Short.toInt(dividend) % Short.toInt(divisor)));
      }

      {
        let gradeShorts: short[] = [80 as short, 90 as short, 70 as short];
        let gradeWeights: short[] = [2 as short, 3 as short, 5 as short];
        let caseCount: int = 3;
        let weightedSum: float = 0.0f;
        let weightSum: float = 0.0f;
        for (let i: int = 0; i < caseCount; i++) {
          weightedSum = weightedSum + Short.toFloat(gradeShorts[i]) * Short.toFloat(gradeWeights[i]);
          weightSum = weightSum + Short.toFloat(gradeWeights[i]);
        }
        let weightedAvg: float = weightedSum / weightSum;
        expect(weightedSum).assertEqual(780.0f);
        expect(weightSum).assertEqual(10.0f);
        expect(weightedAvg).assertEqual(78.0f);
      }

      {
        let result1: float = Short.toFloat((-50) as short);
        expect(result1).assertEqual((-50.0f));
        let result2: float = Short.toFloat((-200) as short);
        expect(result2).assertEqual((-200.0f));
        let result3: float = Short.toFloat((-750) as short);
        expect(result3).assertEqual((-750.0f));
        let result4: float = Short.toFloat((-3000) as short);
        expect(result4).assertEqual((-3000.0f));
        let result5: float = Short.toFloat((-12000) as short);
        expect(result5).assertEqual((-12000.0f));
        let result6: float = Short.toFloat((-20000) as short);
        expect(result6).assertEqual((-20000.0f));
        let result7: float = Short.toFloat((-30000) as short);
        expect(result7).assertEqual((-30000.0f));
      }

      {
        let parsedValue: int = Int.parseInt("1234", 10);
        let shortValue: short = Int.toShort(parsedValue);
        let actualResult: float = Short.toFloat(shortValue);
        expect(actualResult).assertEqual(1234.0f);
      }

      {
        let parsedValue: int = Int.parseInt("-5678", 10);
        let shortValue: short = Int.toShort(parsedValue);
        let actualResult: float = Short.toFloat(shortValue);
        expect(actualResult).assertEqual((-5678.0f));
      }

      {
        let value: short = 0 as short;
        let staticResult: float = Short.toFloat(value);
        expect(Double.toFloat(Short.toDouble(value))).assertEqual(staticResult);
        expect(new Short(value).toFloat()).assertEqual(staticResult);
        expect(staticResult).assertEqual(0.0f);
  
        value = (-1) as short;
        staticResult = Short.toFloat(value);
        expect(Double.toFloat(Short.toDouble(value))).assertEqual(staticResult);
        expect(new Short(value).toFloat()).assertEqual(staticResult);
        expect(staticResult).assertEqual(-1.0f);
  
        value = 100 as short;
        staticResult = Short.toFloat(value);
        expect(Double.toFloat(Short.toDouble(value))).assertEqual(staticResult);
        expect(new Short(value).toFloat()).assertEqual(staticResult);
        expect(staticResult).assertEqual(100.0f);
  
        value = 255 as short;
        staticResult = Short.toFloat(value);
        expect(Double.toFloat(Short.toDouble(value))).assertEqual(staticResult);
        expect(new Short(value).toFloat()).assertEqual(staticResult);
        expect(staticResult).assertEqual(255.0f);
  
        value = 32767 as short;
        staticResult = Short.toFloat(value);
        expect(Double.toFloat(Short.toDouble(value))).assertEqual(staticResult);
        expect(new Short(value).toFloat()).assertEqual(staticResult);
        expect(staticResult).assertEqual(32767.0f);
  
        value = (-32768) as short;
        staticResult = Short.toFloat(value);
        expect(Double.toFloat(Short.toDouble(value))).assertEqual(staticResult);
        expect(new Short(value).toFloat()).assertEqual(staticResult);
        expect(staticResult).assertEqual(-32768.0f);
      }

      {
        let ax1: short = 5 as short;
        let ay1: short = 2 as short;
        let bx1: short = 3 as short;
        let by1: short = 4 as short;
        let cross1: float = Short.toFloat(ax1) * Short.toFloat(by1) - Short.toFloat(ay1) * Short.toFloat(bx1);
        expect(cross1).assertEqual(14.0f);
  
        let ax2: short = 10 as short;
        let ay2: short = 5 as short;
        let bx2: short = 5 as short;
        let by2: short = 10 as short;
        let cross2: float = Short.toFloat(ax2) * Short.toFloat(by2) - Short.toFloat(ay2) * Short.toFloat(bx2);
        expect(cross2).assertEqual(75.0f);
  
        let ax3: short = 7 as short;
        let ay3: short = 0 as short;
        let bx3: short = 3 as short;
        let by3: short = 4 as short;
        let cross3: float = Short.toFloat(ax3) * Short.toFloat(by3) - Short.toFloat(ay3) * Short.toFloat(bx3);
        expect(cross3).assertEqual(28.0f);
      }

      {
        let operandA: short = 100 as short;
        let operandB: short = 200 as short;
        let addResult: short = Int.toShort(operandA + operandB);
        let actualResult: float = Short.toFloat(addResult);
        expect(actualResult).assertEqual(300.0f);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOFLOAT_0500
     * @tc.name testShortToFloat_merged5
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toFloat, including type conversion, business scenarios, division and modulo, equality consistency, and constructor forms.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToFloat_merged5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let operandA: short = 500 as short;
        let operandB: short = 123 as short;
        let subResult: short = Int.toShort(operandA - operandB);
        let actualResult: float = Short.toFloat(subResult);
        expect(actualResult).assertEqual(377.0f);
      }

      {
        let operandA: short = 50 as short;
        let operandB: short = 3 as short;
        let mulResult: short = Int.toShort(operandA * operandB);
        let actualResult: float = Short.toFloat(mulResult);
        expect(actualResult).assertEqual(150.0f);
      }

      {
        let operandA: short = 1000 as short;
        let operandB: short = 10 as short;
        let divResult: short = Int.toShort(operandA / operandB);
        let actualResult: float = Short.toFloat(divResult);
        expect(actualResult).assertEqual(100.0f);
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
          let expectedValue: float = Int.toFloat(intValue);
          let actualResult: float = Short.toFloat(powOf2Values[caseIndex]);
          expect(actualResult).assertEqual(expectedValue);
        }
      }

      {
        let itemCosts: short[] = [100 as short, 150 as short, 150 as short];
        let total: float = Short.toFloat(100 as short) + Short.toFloat(150 as short) + Short.toFloat(150 as short);
        expect(total).assertEqual(400.0f);
        let expectedPercentages: float[] = [25.0f, 37.5f, 37.5f];
        let caseCount: int = 3;
        for (let i: int = 0; i < caseCount; i++) {
          let percentage: float = Short.toFloat(itemCosts[i]) * 100.0f / total;
          expect(percentage).assertEqual(expectedPercentages[i]);
          expect(percentage > 0.0).assertTrue();
        }
      }

      {
        let byteSource: short = Byte.toShort(100 as byte);
        let actualResult: float = Short.toFloat(byteSource);
        expect(actualResult).assertEqual(100.0f);
        let negByteSource: short = Byte.toShort((-100) as byte);
        expect(Short.toFloat(negByteSource)).assertEqual((-100.0f));
      }

      {
        let byteBoundaryValue: short = 255 as short;
        let staticResult: float = Short.toFloat(byteBoundaryValue);
        let boxedValue: Short = new Short(byteBoundaryValue);
        let instanceResult: float = boxedValue.toFloat();
        expect(staticResult).assertEqual(255.0f);
        expect(instanceResult).assertEqual(255.0f);
        expect(staticResult).assertEqual(instanceResult);
      }

      {
        let byteBoundaryNegValue: short = (-128) as short;
        let staticResult: float = Short.toFloat(byteBoundaryNegValue);
        let boxedValue: Short = new Short(byteBoundaryNegValue);
        let instanceResult: float = boxedValue.toFloat();
        expect(staticResult).assertEqual((-128.0f));
        expect(instanceResult).assertEqual((-128.0f));
        expect(staticResult).assertEqual(instanceResult);
      }

      {
        let valueA: Short = new Short(789 as short);
        let valueB: Short = new Short(789 as short);
        let resultA: float = valueA.toFloat();
        let resultB: float = valueB.toFloat();
        expect(resultA).assertEqual(789.0f);
        expect(resultB).assertEqual(789.0f);
        expect(resultA).assertEqual(resultB);
      }

      {
        let startValue: int = -25;
        let batchCount: int = 50;
        for (let loopIndex: int = 0; loopIndex < batchCount; loopIndex++) {
          let intVal: int = startValue + loopIndex;
          let shortValue: short = Int.toShort(intVal);
          let actualResult: float = Short.toFloat(shortValue);
          expect(actualResult).assertEqual(Int.toFloat(intVal));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOFLOAT_0600
     * @tc.name testShortToFloat_merged6
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toFloat, including type conversion, business scenarios, division and modulo, loop accumulation, and comparison and ordering.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToFloat_merged6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let sourceBoxed: Short = new Short(4567 as short);
        let extractedShort: short = sourceBoxed.toShort();
        let actualResult: float = Short.toFloat(extractedShort);
        expect(actualResult).assertEqual(4567.0f);
      }

      {
        let originalValue: short = 500 as short;
        let addValue: short = 300 as short;
        let subValue: short = 300 as short;
        let intermediateValue: short = Int.toShort(originalValue + addValue);
        let finalValue: short = Int.toShort(intermediateValue - subValue);
        let actualResult: float = Short.toFloat(finalValue);
        expect(actualResult).assertEqual(500.0f);
      }

      {
        let pixelValues: Short[] = [
          new Short(0 as short), new Short(8192 as short), new Short(16384 as short), new Short(32767 as short)
        ];
        let maxPixel: float = Short.toFloat(new Short(32767 as short));
        let normalized: float[] = [];
  
        for (let pixel of pixelValues) {
          let p: float = pixel.toFloat();
          normalized.push(p / maxPixel);
        }
  
        expect(normalized[0]).assertEqual(0.0f);
        expect(normalized[3]).assertEqual(1.0f);
        expect(normalized[3] > 0.999 && normalized[3] <= 1.0).assertTrue();
        expect(normalized[1] < normalized[2]).assertTrue();
      }

      {
        let pcmSamples: Short[] = [
          new Short(0 as short), new Short(16000 as short), new Short(-16000 as short),
          new Short(32767 as short), new Short(-32768 as short)
        ];
  
        let floatSamples: double[] = [];
        let maxAmplitude: double = 32768.0;
  
        for (let sample of pcmSamples) {
          floatSamples.push(sample.toFloat() / maxAmplitude);
        }
  
        expect(floatSamples[0]).assertEqual(0.0);
        expect(floatSamples[1]).assertEqual(0.48828125);
        expect(floatSamples[2]).assertEqual(-0.48828125);
        expect(floatSamples[3]).assertEqual(0.999969482421875);
        expect(floatSamples[4]).assertEqual(-1.0);
        expect(floatSamples[1] > 0.48 && floatSamples[1] < 0.49).assertTrue();
        expect(floatSamples[2] < -0.48 && floatSamples[2] > -0.49).assertTrue();
        expect(floatSamples[3] > 0.999).assertTrue();
        expect(floatSamples[4] < -0.999).assertTrue();
      }

      {
        let accelX: Short = new Short(800 as short);
        let accelY: Short = new Short(600 as short);
        let accelZ: Short = new Short(0 as short);
  
        let fx: float = accelX.toFloat();
        let fy: float = accelY.toFloat();
        let fz: float = accelZ.toFloat();
        let magnitude: double = Math.sqrt(fx * fx + fy * fy + fz * fz);
  
        expect(magnitude).assertEqual(1000.0);
        expect(fx / magnitude).assertEqual(0.8);
      }

      {
        let readings: Short[] = [
          new Short(250 as short), new Short(260 as short), new Short(255 as short), new Short(245 as short)
        ];
  
        let sumFloat: float = 0.0f;
        for (let r of readings) {
          sumFloat += r.toFloat();
        }
        let avg: float = sumFloat / readings.length;
  
        expect(avg).assertEqual(252.5f);
  
        let filtered: Short[] = [];
        for (let r of readings) {
          if (Math.abs(r.toFloat() - avg) <= 10.0) {
            filtered.push(r);
          }
        }
        expect(filtered.length).assertEqual(4);
  
        let anomaly: Short = new Short(300 as short);
        expect(Math.abs(anomaly.toFloat() - avg) > 10.0).assertTrue();
      }

      {
        let dividendValues: short[] = [1 as short, 2 as short, 5 as short, 10 as short, 7 as short, (-5) as short];
        let divisorValues: short[] = [3 as short, 3 as short, 7 as short, 4 as short, 2 as short, 2 as short];
        let caseCount: int = 6;
        for (let i: int = 0; i < caseCount; i++) {
          let quotientFloat: float = Short.toFloat(dividendValues[i]) / Short.toFloat(divisorValues[i]);
          let quotientDouble: double = Short.toDouble(dividendValues[i]) / Short.toDouble(divisorValues[i]);
          expect(Math.abs(quotientFloat - quotientDouble) < 0.0001).assertTrue();
        }
        let exactQuotient: float = Short.toFloat(10 as short) / Short.toFloat(4 as short);
        expect(exactQuotient).assertEqual(2.5f);
        let negQuotient: float = Short.toFloat((-5) as short) / Short.toFloat(2 as short);
        expect(negQuotient).assertEqual((-2.5f));
      }

      {
        let sensorReadings: Short[] = [
          new Short(2300 as short), new Short(4500 as short), new Short(1800 as short),
          new Short(6200 as short), new Short(3100 as short)
        ];
  
        let floatThreshold: float = 5000.0f;
        let alerts: AlertEntry[] = [];
  
        for (let i: int = 0; i < sensorReadings.length; i++) {
          let fVal: float = sensorReadings[i].toFloat();
          if (fVal > floatThreshold) {
            alerts.push(new AlertEntry(i, fVal));
          }
        }
  
        expect(alerts.length).assertEqual(1);
        expect(alerts[0].index).assertEqual(3);
  
        let alertShort: Short = sensorReadings[alerts[0].index];
        let floatVal: float = alertShort.toFloat();
        let doubleVal: double = alertShort.toDouble();
        expect(Math.abs(floatVal - doubleVal) < 1.0).assertTrue();
      }

      {
        let floatSet: Set<float> = new Set<float>();
        let collisionDetected: boolean = false;
  
        for (let i: int = -1000; i <= 1000; i++) {
          let s: Short = new Short(Int.toShort(i));
          let f: float = s.toFloat();
          if (floatSet.has(f)) {
            collisionDetected = true;
            break;
          }
          floatSet.add(f);
        }
  
        expect(collisionDetected).assertFalse();
        expect(floatSet.size).assertEqual(2001);
  
        let largeSet: Set<float> = new Set<float>();
        for (let i: int = 30000; i <= 32767; i++) {
          largeSet.add(Short.toFloat(new Short(Int.toShort(i))));
        }
        expect(largeSet.size).assertEqual(32767 - 30000 + 1);
      }

      {
        let testVals: short[] = [Short.MIN_VALUE, (-16384) as short, (-256) as short, (-1) as short,
          0 as short, 1 as short, 256 as short, 16384 as short, Short.MAX_VALUE];
        let count: int = 9;
        let expectedFloats: float[] = [-32768.0f, -16384.0f, -256.0f, -1.0f, 0.0f, 1.0f, 256.0f, 16384.0f, 32767.0f];
        for (let i: int = 0; i < count; i++) {
          expect(Short.toFloat(testVals[i])).assertEqual(expectedFloats[i]);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOFLOAT_0700
     * @tc.name testShortToFloat_merged7
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toFloat, including type conversion, equality consistency, division and modulo, bitwise operations, and positive values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToFloat_merged7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let evenValues: short[] = [0 as short, 2 as short, 4 as short, 100 as short, 30000 as short, (-2) as short];
        let evenCount: int = 6;
        for (let i: int = 0; i < evenCount; i++) {
          let remainder: float = Short.toFloat(evenValues[i]) % 2.0f;
          expect(remainder).assertEqual(0.0f);
        }
        let posOddValues: short[] = [1 as short, 3 as short, 101 as short, 32767 as short];
        let posOddCount: int = 4;
        for (let i: int = 0; i < posOddCount; i++) {
          let remainder: float = Short.toFloat(posOddValues[i]) % 2.0f;
          expect(remainder).assertEqual(1.0f);
        }
        let negOddValues: short[] = [(-1) as short, (-3) as short, (-32767) as short];
        let negOddCount: int = 3;
        for (let i: int = 0; i < negOddCount; i++) {
          let remainder: float = Short.toFloat(negOddValues[i]) % 2.0f;
          expect(remainder).assertEqual((-1.0f));
        }
      }

      {
        let modRes1: short = Int.toShort(1000 % 7);
        let modRes2: short = Int.toShort(12345 % 256);
        let modRes3: short = Int.toShort((-1000) % 7);
        expect(Short.toFloat(modRes1)).assertEqual(6.0f);
        expect(Short.toFloat(modRes2)).assertEqual(57.0f);
        expect(Short.toFloat(modRes3)).assertEqual(-6.0f);
      }

      {
        let andRes: short = Int.toShort(0b1100 & 0b1010);
        let orRes: short = Int.toShort(0b1100 | 0b1010);
        let xorRes: short = Int.toShort(0b1100 ^ 0b1010);
        expect(Short.toFloat(andRes)).assertEqual(8.0f);
        expect(Short.toFloat(orRes)).assertEqual(14.0f);
        expect(Short.toFloat(xorRes)).assertEqual(6.0f);
      }

      {
        let shift10: short = Int.toShort(1 << 10);
        let shift14: short = Int.toShort(1 << 14);
        let shift15: short = Int.toShort(1 << 15);
        expect(Short.toFloat(shift10)).assertEqual(1024.0f);
        expect(Short.toFloat(shift14)).assertEqual(16384.0f);
        expect(Short.toFloat(shift15)).assertEqual(-32768.0f);
      }

      {
        let precChain: short = Int.toShort(10 + 20 * 3);
        let parenChain: short = Int.toShort((10 + 20) * 3);
        expect(Short.toFloat(precChain)).assertEqual(70.0f);
        expect(Short.toFloat(parenChain)).assertEqual(90.0f);
      }

      {
        let base: int = 100;
        base++;
        let incVal: short = Int.toShort(base);
        base = base - 2;
        let decVal: short = Int.toShort(base);
        expect(Short.toFloat(incVal)).assertEqual(101.0f);
        expect(Short.toFloat(decVal)).assertEqual(99.0f);
      }

      {
        let seed: int = 1;
        let sampleCount: int = 25;
        for (let i: int = 0; i < sampleCount; i++) {
          seed = (seed * 1103515245 + 12345) & 0x7FFFFFFF;
          let intVal: int = (seed % 65536) - 32768;
          let sVal: short = Int.toShort(intVal);
          expect(Short.toFloat(sVal)).assertEqual(Int.toFloat(intVal));
        }
      }

      {
        let testVals: short[] = [Short.MIN_VALUE, (-10000) as short, (-1) as short, 0 as short,
          1 as short, 10000 as short, Short.MAX_VALUE];
        let count: int = 7;
        for (let i: int = 0; i < count; i++) {
          let fVal: float = Short.toFloat(testVals[i]);
          let dVal: double = Short.toDouble(testVals[i]);
          expect(fVal).assertEqual(Int.toFloat(testVals[i]));
          expect(dVal).assertEqual(Int.toDouble(testVals[i]));
          let diff: double = Math.abs(fVal - dVal);
          expect(diff < 0.0001).assertTrue();
        }
      }

      {
        let fibVals: short[] = [0 as short, 1 as short, 1 as short, 2 as short, 3 as short, 5 as short,
          8 as short, 13 as short, 21 as short, 34 as short, 55 as short, 89 as short, 144 as short,
          233 as short, 377 as short, 610 as short, 987 as short, 1597 as short, 2584 as short,
          4181 as short, 6765 as short, 10946 as short, 17711 as short, 28657 as short];
        let fibExpected: float[] = [0.0f, 1.0f, 1.0f, 2.0f, 3.0f, 5.0f, 8.0f, 13.0f, 21.0f, 34.0f,
          55.0f, 89.0f, 144.0f, 233.0f, 377.0f, 610.0f, 987.0f, 1597.0f, 2584.0f, 4181.0f, 6765.0f,
          10946.0f, 17711.0f, 28657.0f];
        let count: int = 24;
        for (let i: int = 0; i < count; i++) {
          expect(Short.toFloat(fibVals[i])).assertEqual(fibExpected[i]);
        }
      }

      {
        let sqCount: int = 20;
        for (let n: int = 1; n <= sqCount; n++) {
          let sVal: short = Int.toShort(n * n);
          let expected: float = Int.toFloat(n * n);
          expect(Short.toFloat(sVal)).assertEqual(expected);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOFLOAT_0800
     * @tc.name testShortToFloat_merged8
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toFloat, including type conversion, business scenarios, containers and references, negative values, and division and modulo.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToFloat_merged8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let mersCount: int = 14;
        for (let n: int = 1; n <= mersCount; n++) {
          let mersenne: int = (1 << n) - 1;
          let sVal: short = Int.toShort(mersenne);
          expect(Short.toFloat(sVal)).assertEqual(Int.toFloat(mersenne));
        }
      }

      {
        let negPowVals: short[] = [(-1) as short, (-2) as short, (-4) as short, (-8) as short,
          (-16) as short, (-32) as short, (-64) as short, (-128) as short, (-256) as short,
          (-512) as short, (-1024) as short, (-2048) as short, (-4096) as short, (-8192) as short,
          (-16384) as short];
        let negPowExpected: float[] = [-1.0f, -2.0f, -4.0f, -8.0f, -16.0f, -32.0f, -64.0f, -128.0f,
          -256.0f, -512.0f, -1024.0f, -2048.0f, -4096.0f, -8192.0f, -16384.0f];
        let count: int = 15;
        for (let i: int = 0; i < count; i++) {
          expect(Short.toFloat(negPowVals[i])).assertEqual(negPowExpected[i]);
        }
      }

      {
        let adcReading: Short = new Short(1250 as short);
        let temperature: double = adcReading.toFloat() / 100.0;
        expect(temperature).assertEqual(12.5);
        let adcNeg: Short = new Short((-550) as short);
        let tempNeg: double = adcNeg.toFloat() / 100.0;
        expect(tempNeg).assertEqual(-5.5);
      }

      {
        let rawMin: Short = new Short(Short.MIN_VALUE);
        let rawMid: Short = new Short(0 as short);
        let rawMax: Short = new Short(Short.MAX_VALUE);
        let range: double = 32767.0 - (-32768.0);
        let normMin: double = (rawMin.toFloat() - (-32768.0)) / range * 2.0 - 1.0;
        let normMid: double = (rawMid.toFloat() - (-32768.0)) / range * 2.0 - 1.0;
        let normMax: double = (rawMax.toFloat() - (-32768.0)) / range * 2.0 - 1.0;
        expect(normMin).assertEqual(-1.0);
        expect(normMax).assertEqual(1.0);
        expect(normMin > -1.01 && normMin < -0.99).assertTrue();
        expect(normMid > -0.01 && normMid < 0.01).assertTrue();
        expect(normMax > 0.99 && normMax < 1.01).assertTrue();
      }

      {
        let samples: Short[] = [new Short(3 as short), new Short(4 as short), new Short(3 as short), new Short(4 as short)];
        let sumSquares: double = 0.0;
        let sCount: int = 4;
        for (let i: int = 0; i < sCount; i++) {
          let fVal: float = samples[i].toFloat();
          sumSquares = sumSquares + fVal * fVal;
        }
        let rms: double = Math.sqrt(sumSquares / sCount);
        expect(rms > 3.5 && rms < 3.6).assertTrue();
      }

      {
        let data: Short[] = [new Short(2 as short), new Short(4 as short), new Short(4 as short), new Short(4 as short),
          new Short(5 as short), new Short(5 as short), new Short(7 as short), new Short(9 as short)];
        let dCount: int = 8;
        let sum: double = 0.0;
        for (let i: int = 0; i < dCount; i++) {
          sum = sum + data[i].toFloat();
        }
        let mean: double = sum / dCount;
        expect(mean).assertEqual(5.0);
        let sqDiffs: double = 0.0;
        for (let i: int = 0; i < dCount; i++) {
          let diff: double = data[i].toFloat() - mean;
          sqDiffs = sqDiffs + diff * diff;
        }
        let variance: double = sqDiffs / dCount;
        let stdDev: double = Math.sqrt(variance);
        expect(stdDev).assertEqual(2.0);
      }

      {
        let pwmZero: Short = new Short(0 as short);
        let pwmHalf: Short = new Short(16384 as short);
        let pwmMax: Short = new Short(32767 as short);
        let dutyZero: double = (pwmZero.toFloat() / 32767.0) * 100.0;
        let dutyHalf: double = (pwmHalf.toFloat() / 32767.0) * 100.0;
        let dutyMax: double = (pwmMax.toFloat() / 32767.0) * 100.0;
        expect(dutyZero).assertEqual(0.0);
        expect(dutyMax).assertEqual(100.0);
        expect(dutyHalf > 49.99 && dutyHalf < 50.01).assertTrue();
        expect(dutyMax > 99.99 && dutyMax <= 100.0).assertTrue();
      }

      {
        let startPoint: Short = new Short(10 as short);
        let endPoint: Short = new Short(20 as short);
        let t: double = 0.5;
        let interpolated: double = startPoint.toFloat() + t * (endPoint.toFloat() - startPoint.toFloat());
        expect(interpolated).assertEqual(15.0);
        let start2: Short = new Short((-100) as short);
        let end2: Short = new Short(100 as short);
        let interp2: double = start2.toFloat() + 0.25 * (end2.toFloat() - start2.toFloat());
        expect(interp2).assertEqual(-50.0);
      }

      {
        let vals: Short[] = [new Short(42 as short), new Short((-17) as short), new Short(256 as short),
          new Short(0 as short), new Short((-999) as short)];
        let minVal: float = vals[0].toFloat();
        let maxVal: float = vals[0].toFloat();
        let vCount: int = 5;
        for (let i: int = 1; i < vCount; i++) {
          let f: float = vals[i].toFloat();
          if (f < minVal) {
            minVal = f;
          }
          if (f > maxVal) {
            maxVal = f;
          }
        }
        expect(minVal).assertEqual(-999.0f);
        expect(maxVal).assertEqual(256.0f);
      }

      {
        let input: Short = new Short(75 as short);
        let inMin: double = 0.0;
        let inMax: double = 100.0;
        let outMin: double = 10.0;
        let outMax: double = 50.0;
        let mapped: double = outMin + (input.toFloat() - inMin) / (inMax - inMin) * (outMax - outMin);
        expect(mapped).assertEqual(40.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOFLOAT_0900
     * @tc.name testShortToFloat_merged9
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toFloat, including type conversion, business scenarios, loop accumulation, comparison and ordering, and containers and references.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToFloat_merged9', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let unsorted: Short[] = [new Short(100 as short), new Short((-50) as short), new Short(0 as short),
          new Short(200 as short), new Short((-200) as short)];
        let floatVals: float[] = [];
        let usCount: int = 5;
        for (let i: int = 0; i < usCount; i++) {
          floatVals.push(unsorted[i].toFloat());
        }
        let expectedFloats: float[] = [100.0f, -50.0f, 0.0f, 200.0f, -200.0f];
        for (let i: int = 0; i < usCount; i++) {
          expect(floatVals[i]).assertEqual(expectedFloats[i]);
        }
        for (let i: int = 0; i < usCount - 1; i++) {
          for (let j: int = 0; j < usCount - 1 - i; j++) {
            if (floatVals[j] > floatVals[j + 1]) {
              let tmp: float = floatVals[j];
              floatVals[j] = floatVals[j + 1];
              floatVals[j + 1] = tmp;
            }
          }
        }
        for (let i: int = 1; i < usCount; i++) {
          expect(floatVals[i - 1] <= floatVals[i]).assertTrue();
        }
      }

      {
        let samples: Short[] = [new Short(5 as short), new Short(3 as short), new Short(5 as short),
          new Short(7 as short), new Short(3 as short)];
        let freqMap: Map<float, int> = new Map<float, int>();
        let sCount: int = 5;
        for (let i: int = 0; i < sCount; i++) {
          let key: float = samples[i].toFloat();
          let existing: int | undefined = freqMap.get(key);
          if (existing == undefined) {
            freqMap.set(key, 1);
          } else {
            freqMap.set(key, existing + 1);
          }
        }
        expect(freqMap.size).assertEqual(3);
        expect(freqMap.get(5.0) as int).assertEqual(2);
        expect(freqMap.get(3.0) as int).assertEqual(2);
        expect(freqMap.get(7.0) as int).assertEqual(1);
      }

      {
        let inputs: Short[] = [new Short(10 as short), new Short(100 as short), new Short(500 as short),
          new Short(2000 as short), new Short(10000 as short)];
        let levels: int[] = [0, 0, 0, 0, 0];
        let iCount: int = 5;
        for (let i: int = 0; i < iCount; i++) {
          let f: float = inputs[i].toFloat();
          if (f < 50.0) {
            levels[i] = 0;
          } else if (f < 500.0) {
            levels[i] = 1;
          } else if (f < 2000.0) {
            levels[i] = 2;
          } else {
            levels[i] = 3;
          }
        }
        expect(levels[0]).assertEqual(0);
        expect(levels[1]).assertEqual(1);
        expect(levels[2]).assertEqual(2);
        expect(levels[3]).assertEqual(3);
        expect(levels[4]).assertEqual(3);
      }

      {
        let weight1: short = 49 as short;
        let heightCm1: short = 175 as short;
        let heightM1: double = Short.toFloat(heightCm1) / 100.0;
        let bmi1: double = Short.toFloat(weight1) / (heightM1 * heightM1);
        expect(heightM1).assertEqual(1.75);
        expect(bmi1).assertEqual(16.0);
        let weight2: short = 50 as short;
        let heightCm2: short = 125 as short;
        let heightM2: double = Short.toFloat(heightCm2) / 100.0;
        let bmi2: double = Short.toFloat(weight2) / (heightM2 * heightM2);
        expect(heightM2).assertEqual(1.25);
        expect(bmi2).assertEqual(32.0);
      }

      {
        let original: Short = new Short(12345 as short);
        let extracted: short = original.toShort();
        let reBoxed: Short = new Short(extracted);
        expect(reBoxed.toFloat()).assertEqual(original.toFloat());
        expect(reBoxed.toFloat()).assertEqual(12345.0f);
      }

      {
        let nonNeg: short[] = [0 as short, 1 as short, 255 as short, 16384 as short, Short.MAX_VALUE];
        let negVals: short[] = [(-1) as short, (-128) as short, (-16384) as short, Short.MIN_VALUE];
        let nnCount: int = 5;
        let nCount: int = 4;
        let expectedNonNeg: float[] = [0.0f, 1.0f, 255.0f, 16384.0f, 32767.0f];
        for (let i: int = 0; i < nnCount; i++) {
          expect(Short.toFloat(nonNeg[i])).assertEqual(expectedNonNeg[i]);
        }
        let expectedNeg: float[] = [-1.0f, -128.0f, -16384.0f, -32768.0f];
        for (let i: int = 0; i < nCount; i++) {
          expect(Short.toFloat(negVals[i])).assertEqual(expectedNeg[i]);
        }
      }

      {
        let terms: short[] = [1000 as short, 250 as short, (-750) as short, 1500 as short,
          (-250) as short, 3000 as short, (-1000) as short, 500 as short];
        let floatAcc: float = 0.0f;
        let doubleAcc: double = 0.0;
        let termCount: int = terms.length;
        for (let i: int = 0; i < termCount; i++) {
          floatAcc = floatAcc + Short.toFloat(terms[i]);
          doubleAcc = doubleAcc + Short.toDouble(terms[i]);
          expect(Math.abs(floatAcc - doubleAcc) < 0.0001).assertTrue();
        }
        expect(floatAcc).assertEqual(4250.0f);
        expect(doubleAcc).assertEqual(4250.0);
      }

      {
        let oddVals: short[] = [
          1 as short, 3 as short, 5 as short, 7 as short, 9 as short,
          11 as short, 101 as short, 255 as short, 1001 as short,
          16383 as short, 32767 as short, (-1) as short, (-3) as short,
          (-5) as short, (-7) as short, (-32767) as short
        ];
        let count: int = oddVals.length;
        for (let i: int = 0; i < count; i++) {
          let fVal: float = Short.toFloat(oddVals[i]);
          let backVal: short = Float.toShort(fVal);
          expect(backVal).assertEqual(oddVals[i]);
          expect(Int.toFloat(Short.toInt(oddVals[i]))).assertEqual(fVal);
        }
      }

      {
        let testVals: short[] = [
          Short.MIN_VALUE, (-1) as short, 0 as short, 1 as short,
          Short.MAX_VALUE, 32766 as short, (-32767) as short, 128 as short
        ];
        let count: int = testVals.length;
        for (let i: int = 0; i < count; i++) {
          let fVal: float = Short.toFloat(testVals[i]);
          let isFiniteResult: double = fVal + 1.0;
          expect(isFiniteResult < fVal + 2.0).assertTrue();
        }
        let expectedFloats: float[] = [-32768.0f, -1.0f, 0.0f, 1.0f, 32767.0f, 32766.0f, -32767.0f, 128.0f];
        for (let i: int = 0; i < count; i++) {
          expect(Short.toFloat(testVals[i])).assertEqual(expectedFloats[i]);
        }
      }

      {
        let one: short = 1 as short;
        let three: short = 3 as short;
        let ratio: float = Short.toFloat(one) / Short.toFloat(three);
        expect(ratio > 0.333 && ratio < 0.334).assertTrue();
        expect(Math.abs(ratio - 1.0 / 3.0) < 0.001).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOFLOAT_1000
     * @tc.name testShortToFloat_merged10
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toFloat, including type conversion and business scenarios.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToFloat_merged10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let squares: short[] = [
          0 as short, 1 as short, 4 as short, 9 as short, 16 as short,
          25 as short, 36 as short, 49 as short, 64 as short, 81 as short,
          100 as short, 144 as short, 256 as short, 1024 as short, 10000 as short
        ];
        let sqCount: int = squares.length;
        for (let i: int = 0; i < sqCount; i++) {
          let fVal: float = Short.toFloat(squares[i]);
          let sqrtResult: double = Math.sqrt(fVal);
          let intVal: int = Short.toInt(squares[i]);
          expect(sqrtResult).assertEqual(Math.sqrt(intVal));
        }
      }

      {
        let angleDeg: short = 30 as short;
        let rad: double = Short.toFloat(angleDeg) * Math.PI / 180.0;
        let sinVal: double = Math.sin(rad);
        expect(sinVal > 0.49 && sinVal < 0.51).assertTrue();
        let angle90: short = 90 as short;
        let rad90: double = Short.toFloat(angle90) * Math.PI / 180.0;
        let sin90: double = Math.sin(rad90);
        expect(sin90 > 0.99 && sin90 < 1.01).assertTrue();
      }

      {
        let angle0: short = 0 as short;
        let rad0: double = Short.toFloat(angle0) * Math.PI / 180.0;
        let cos0: double = Math.cos(rad0);
        expect(cos0 > 0.99 && cos0 < 1.01).assertTrue();
        let angle60: short = 60 as short;
        let rad60: double = Short.toFloat(angle60) * Math.PI / 180.0;
        let cos60: double = Math.cos(rad60);
        expect(cos60 > 0.49 && cos60 < 0.51).assertTrue();
      }

      {
        let base: short = 2 as short;
        let exp: short = 10 as short;
        let powResult: double = Math.pow(Short.toFloat(base), Short.toFloat(exp));
        expect(powResult).assertEqual(1024.0);
        let base3: short = 3 as short;
        let exp4: short = 4 as short;
        let pow34: double = Math.pow(Short.toFloat(base3), Short.toFloat(exp4));
        expect(pow34).assertEqual(81.0);
      }

      {
        let step: int = 128;
        let rangeStart: int = -32768;
        let rangeEnd: int = 32767;
        let prevFloat: float = Short.toFloat(Int.toShort(rangeStart));
        expect(Short.toFloat(Short.MIN_VALUE)).assertEqual(-32768.0f);
        expect(Short.toFloat(0 as short)).assertEqual(0.0f);
        expect(Short.toFloat(16384 as short)).assertEqual(16384.0f);
        expect(Short.toFloat(Short.MAX_VALUE)).assertEqual(32767.0f);
        for (let i: int = rangeStart + step; i <= rangeEnd; i += step) {
          let sVal: short = Int.toShort(i);
          let currFloat: float = Short.toFloat(sVal);
          expect(prevFloat < currFloat).assertTrue();
          prevFloat = currFloat;
        }
        let lastFloat: float = Short.toFloat(Short.MAX_VALUE);
        expect(prevFloat <= lastFloat).assertTrue();
      }

      {
        let seed: int = 42;
        let sampleCount: int = 1000;
        for (let i: int = 0; i < sampleCount; i++) {
          seed = (seed * 1103515245 + 12345) & 0x7FFFFFFF;
          let intVal: int = (seed % 65536) - 32768;
          let sVal: short = Int.toShort(intVal);
          let staticResult: float = Short.toFloat(sVal);
          let boxed: Short = new Short(sVal);
          let instanceResult: float = boxed.toFloat();
          expect(instanceResult).assertEqual(staticResult);
        }
      }

      {
        let pixelBlack: short = 0 as short;
        let pixelGray: short = 128 as short;
        let pixelWhite: short = 255 as short;
        let normBlack: float = Short.toFloat(pixelBlack) / 255.0f;
        let normGray: float = Short.toFloat(pixelGray) / 255.0f;
        let normWhite: float = Short.toFloat(pixelWhite) / 255.0f;
        expect(normBlack).assertEqual(0.0f);
        expect(normGray > 0.501 && normGray < 0.503).assertTrue();
        expect(normWhite).assertEqual(1.0f);
      }

      {
        let position: short = 100 as short;
        let timeScale: double = 0.5;
        let motion: double = Short.toFloat(position) * timeScale;
        expect(motion).assertEqual(50.0);
        let pos2: short = 200 as short;
        let vel2: double = Short.toFloat(pos2) * 2.0;
        expect(vel2).assertEqual(400.0);
      }

      {
        let gyroDeg: short = 90 as short;
        let gyroRad: double = Short.toFloat(gyroDeg) * 0.0175;
        expect(gyroRad > 1.57 && gyroRad < 1.58).assertTrue();
        let gyro180: short = 180 as short;
        let rad180: double = Short.toFloat(gyro180) * 0.0175;
        expect(rad180 > 3.13 && rad180 < 3.16).assertTrue();
      }

      {
        let vx: short = 10 as short;
        let vy: short = 20 as short;
        let vz: short = 30 as short;
        let scale: double = 2.0;
        let fx: double = Short.toFloat(vx) * scale;
        let fy: double = Short.toFloat(vy) * scale;
        let fz: double = Short.toFloat(vz) * scale;
        expect(fx).assertEqual(20.0);
        expect(fy).assertEqual(40.0);
        expect(fz).assertEqual(60.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOFLOAT_1100
     * @tc.name testShortToFloat_merged11
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toFloat, including business scenarios, type conversion, comparison and ordering, and division and modulo.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToFloat_merged11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let x: short = 15 as short;
        let mean: double = 10.0;
        let stdDev: double = 2.0;
        let zScore: double = (Short.toFloat(x) - mean) / stdDev;
        expect(zScore).assertEqual(2.5);
        let x2: short = 7 as short;
        let z2: double = (Short.toFloat(x2) - mean) / stdDev;
        expect(z2).assertEqual(-1.5);
      }

      {
        let q11: short = 0 as short;
        let q12: short = 10 as short;
        let q21: short = 0 as short;
        let q22: short = 10 as short;
        let tx: double = 0.5;
        let ty: double = 0.5;
        let f11: float = Short.toFloat(q11);
        let f12: float = Short.toFloat(q12);
        let f21: float = Short.toFloat(q21);
        let f22: float = Short.toFloat(q22);
        let lerpX1: double = f11 + tx * (f12 - f11);
        let lerpX2: double = f21 + tx * (f22 - f21);
        let result: double = lerpX1 + ty * (lerpX2 - lerpX1);
        expect(result).assertEqual(5.0);
      }

      {
        let fgVal: short = 200 as short;
        let bgVal: short = 100 as short;
        let alpha: double = 0.7;
        let blended: double = Short.toFloat(fgVal) * alpha + Short.toFloat(bgVal) * (1.0 - alpha);
        expect(blended).assertEqual(170.0);
        let fg2: short = 255 as short;
        let bg2: short = 0 as short;
        let blended2: double = Short.toFloat(fg2) * 0.5 + Short.toFloat(bg2) * 0.5;
        expect(blended2).assertEqual(127.5);
      }

      {
        let input1: short = 5 as short;
        let input2: short = 3 as short;
        let w1: double = 0.5;
        let w2: double = 0.3;
        let bias: double = -1.0;
        let sum: double = Short.toFloat(input1) * w1 + Short.toFloat(input2) * w2 + bias;
        expect(sum > 2.39 && sum < 2.41).assertTrue();
        let output: double = sum > 0.0 ? 1.0 : 0.0;
        expect(output).assertEqual(1.0);
      }

      {
        let measurement: short = 100 as short;
        let predicted: double = 95.0;
        let kalmanGain: double = 0.5;
        let corrected: double = predicted + kalmanGain * (Short.toFloat(measurement) - predicted);
        expect(corrected).assertEqual(97.5);
        let meas2: short = 80 as short;
        let pred2: double = 85.0;
        let corrected2: double = pred2 + 0.3 * (Short.toFloat(meas2) - pred2);
        expect(corrected2).assertEqual(83.5);
      }

      {
        let cashflow: short = 1100 as short;
        let rate: double = 0.1;
        let years: short = 1 as short;
        let pv: double = Short.toFloat(cashflow) / Math.pow(1.0 + rate, Short.toFloat(years));
        expect(Math.abs(pv - 1000.0) < 0.0000001).assertTrue();
        let cf2: short = 1210 as short;
        let yr2: short = 2 as short;
        let pv2: double = Short.toFloat(cf2) / Math.pow(1.0 + rate, Short.toFloat(yr2));
        expect(Math.abs(pv2 - 1000.0) < 0.0000001).assertTrue();
      }

      {
        let uere: double = 5.0;
        let hdopValues: short[] = [2 as short, 3 as short];
        let expectedAccuracy: double[] = [10.0, 15.0];
        for (let i: int = 0; i < hdopValues.length; i++) {
          expect(Short.toFloat(hdopValues[i]) * uere).assertEqual(expectedAccuracy[i]);
        }
      }

      {
        let vin: short = 10 as short;
        let R1: double = 1000.0;
        let R2: double = 2000.0;
        let vout: double = Short.toFloat(vin) * (R2 / (R1 + R2));
        expect(vout > 6.666 && vout < 6.667).assertTrue();
        let vin2: short = 5 as short;
        let vout2: double = Short.toFloat(vin2) * (R2 / (R1 + R2));
        expect(vout2 > 3.333 && vout2 < 3.334).assertTrue();
      }

      {
        let amplitude: short = 1000 as short;
        let reference: double = 100.0;
        let db: double = 20.0 * Math.log10(Short.toFloat(amplitude) / reference);
        expect(db).assertEqual(20.0);
        let amp2: short = 100 as short;
        let db2: double = 20.0 * Math.log10(Short.toFloat(amp2) / reference);
        expect(db2).assertEqual(0.0);
      }

      {
        let celsius: short = 0 as short;
        let fahrenheit: double = Short.toFloat(celsius) * (9.0 / 5.0) + 32.0;
        expect(fahrenheit).assertEqual(32.0);
        let celsius100: short = 100 as short;
        let fah100: double = Short.toFloat(celsius100) * (9.0 / 5.0) + 32.0;
        expect(fah100).assertEqual(212.0);
        let celsiusNeg40: short = (-40) as short;
        let fahNeg40: double = Short.toFloat(celsiusNeg40) * (9.0 / 5.0) + 32.0;
        expect(fahNeg40).assertEqual(-40.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOFLOAT_1200
     * @tc.name testShortToFloat_merged12
     * @tc.desc CrossTypeRoundTrip / RadixConversion: covers 10 merged test points for Short.toFloat, including type conversion, business scenarios, radix conversion, sliding window, and round-trip conversion.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToFloat_merged12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dx: short = 3 as short;
        let dy: short = 4 as short;
        let fdx: float = Short.toFloat(dx);
        let fdy: float = Short.toFloat(dy);
        let distance: double = Math.sqrt(fdx * fdx + fdy * fdy);
        expect(distance).assertEqual(5.0);
        let dx2: short = 6 as short;
        let dy2: short = 8 as short;
        let fdx2: float = Short.toFloat(dx2);
        let fdy2: float = Short.toFloat(dy2);
        let dist2: double = Math.sqrt(fdx2 * fdx2 + fdy2 * fdy2);
        expect(dist2).assertEqual(10.0);
      }

      {
        let angle: short = 370 as short;
        let normalized: float = Short.toFloat(Int.toShort(angle % 360));
        expect(normalized).assertEqual(10.0f);
        let angle2: short = (-10) as short;
        let modResult: int = angle2 % 360;
        let norm2: float = Short.toFloat(Int.toShort(modResult));
        let intVal: int = Short.toInt(angle2);
        let expectedNorm: int = intVal % 360;
        expect(norm2).assertEqual(Int.toFloat(expectedNorm));
      }

      {
        let values: short[] = [10 as short, 20 as short, 30 as short, 40 as short, 50 as short];
        let sum: double = 0.0;
        let n: int = values.length;
        for (let i: int = 0; i < n; i++) {
          sum = sum + Short.toFloat(values[i]);
        }
        let avg: double = sum / n;
        expect(avg).assertEqual(30.0);
        let values2: short[] = [5 as short, 5 as short, 5 as short];
        let sum2: double = 0.0;
        let n2: int = values2.length;
        for (let i: int = 0; i < n2; i++) {
          sum2 = sum2 + Short.toFloat(values2[i]);
        }
        expect(sum2 / n2).assertEqual(5.0);
      }

      {
        let newVal: short = 100 as short;
        let prevEMA: double = 80.0;
        let alpha: double = 0.2;
        let ema: double = alpha * Short.toFloat(newVal) + (1.0 - alpha) * prevEMA;
        expect(ema).assertEqual(84.0);
        let newVal2: short = 80 as short;
        let ema2: double = alpha * Short.toFloat(newVal2) + (1.0 - alpha) * ema;
        expect(ema2).assertEqual(83.2);
      }

      {
        let v: short = 50 as short;
        let minVal: double = 0.0;
        let maxVal: double = 100.0;
        let normalized: double = (Short.toFloat(v) - minVal) / (maxVal - minVal);
        expect(normalized).assertEqual(0.5);
        let v2: short = 75 as short;
        let norm2: double = (Short.toFloat(v2) - minVal) / (maxVal - minVal);
        expect(norm2).assertEqual(0.75);
        let v3: short = 25 as short;
        let norm3: double = (Short.toFloat(v3) - minVal) / (maxVal - minVal);
        expect(norm3).assertEqual(0.25);
      }

      {
        let mass: Short = new Short(10 as short);
        let speed: Short = new Short(20 as short);
        let ke: float = (0.5 as float) * mass.toFloat() * speed.toFloat() * speed.toFloat();
        expect(ke).assertEqual(2000.0);
      }

      {
        let testVals: short[] = [
          0 as short, 1 as short, (-1) as short, 100 as short, (-100) as short,
          255 as short, (-255) as short, 1000 as short, (-1000) as short,
          32767 as short, (-32768) as short
        ];
        for (let val of testVals) {
          let floatVal: float = Short.toFloat(val);
          let backToShort: short = Float.toShort(floatVal);
          expect(backToShort).assertEqual(val);
        }
      }

      {
        let prev: float = Short.toFloat((-2001) as short);
        let violations: int = 0;
        for (let i: int = -2000; i <= 2000; i++) {
          let curr: float = Short.toFloat(Int.toShort(i));
          if (curr <= prev) {
            violations++;
          }
          prev = curr;
        }
        expect(violations).assertEqual(0);
      }

      {
        let binVal1: short = 0b1010 as short;
        let binVal2: short = 0b11111111 as short;
        let binVal3: short = 0b111111111111111 as short;
        let binVal4: short = 0b0 as short;
        expect(Short.toFloat(binVal1)).assertEqual(10.0f);
        expect(Short.toFloat(binVal2)).assertEqual(255.0f);
        expect(Short.toFloat(binVal3)).assertEqual(32767.0f);
        expect(Short.toFloat(binVal4)).assertEqual(0.0f);
      }

      {
        expect(Short.toFloat(0x0000 as short)).assertEqual(0.0f);
        expect(Short.toFloat(0x7FFF as short)).assertEqual(32767.0f);
        expect(Short.toFloat(0x3FFF as short)).assertEqual(16383.0f);
        expect(Short.toFloat(0x1000 as short)).assertEqual(4096.0f);
        expect(Short.toFloat(0x00FF as short)).assertEqual(255.0f);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOFLOAT_1300
     * @tc.name testShortToFloat_merged13
     * @tc.desc RadixConversion / Idempotent: covers 10 merged test points for Short.toFloat, including type conversion, equality consistency, radix conversion, fractions and rounding, and constructor forms.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToFloat_merged13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let fromBin: short = Short.parseInt('111111111111111', 2);
        let fromOct: short = Short.parseInt('77777', 8);
        let fromHex: short = Short.parseInt('7FFF', 16);
        expect(Short.toFloat(fromBin)).assertEqual(32767.0f);
        expect(Short.toFloat(fromOct)).assertEqual(32767.0f);
        expect(Short.toFloat(fromHex)).assertEqual(32767.0f);
      }

      {
        let parsed: short = Short.parseInt('FF', 16);
        let boxed: Short = new Short(parsed);
        let result: float = boxed.toFloat();
        expect(result).assertEqual(255.0f);
        let parsedNeg: short = Short.parseInt('-80', 16);
        let boxedNeg: Short = new Short(parsedNeg);
        expect(boxedNeg.toFloat()).assertEqual(-128.0f);
      }

      {
        let principal1: short = 400 as short;
        let ratePct1: short = 25 as short;
        let years1: short = 4 as short;
        let rateF1: double = Short.toFloat(ratePct1) / 100.0;
        let interest1: double = Short.toFloat(principal1) * rateF1 * Short.toFloat(years1);
        let total1: double = Short.toFloat(principal1) + interest1;
        expect(rateF1).assertEqual(0.25);
        expect(interest1).assertEqual(400.0);
        expect(total1).assertEqual(800.0);
        let principal2: short = 256 as short;
        let ratePct2: short = 50 as short;
        let years2: short = 2 as short;
        let rateF2: double = Short.toFloat(ratePct2) / 100.0;
        let interest2: double = Short.toFloat(principal2) * rateF2 * Short.toFloat(years2);
        let total2: double = Short.toFloat(principal2) + interest2;
        expect(rateF2).assertEqual(0.5);
        expect(interest2).assertEqual(256.0);
        expect(total2).assertEqual(512.0);
      }

      {
        let factorsA: short[] = [2 as short, 3 as short, 5 as short];
        let productA: float = 1.0f;
        let caseCountA: int = 3;
        for (let i: int = 0; i < caseCountA; i++) {
          productA = productA * Short.toFloat(factorsA[i]);
        }
        expect(productA).assertEqual(30.0f);
  
        let factorsB: short[] = [7 as short, 11 as short];
        let productB: float = 1.0f;
        let caseCountB: int = 2;
        for (let i: int = 0; i < caseCountB; i++) {
          productB = productB * Short.toFloat(factorsB[i]);
        }
        expect(productB).assertEqual(77.0f);
  
        let factorsC: short[] = [(-2) as short, 5 as short, 3 as short];
        let productC: float = 1.0f;
        let caseCountC: int = 3;
        for (let i: int = 0; i < caseCountC; i++) {
          productC = productC * Short.toFloat(factorsC[i]);
        }
        expect(productC).assertEqual((-30.0f));
      }

      {
        let positiveValue: Short = new Short(888 as short);
        let posFirst: float = positiveValue.toFloat();
        let posSecond: float = positiveValue.toFloat();
        let posThird: float = positiveValue.toFloat();
        expect(posFirst).assertEqual(888.0f);
        expect(posSecond).assertEqual(888.0f);
        expect(posThird).assertEqual(888.0f);
        expect(posFirst).assertEqual(posSecond);
        expect(posSecond).assertEqual(posThird);
  
        let negativeValue: Short = new Short((-999) as short);
        let negFirst: float = negativeValue.toFloat();
        let negSecond: float = negativeValue.toFloat();
        let negThird: float = negativeValue.toFloat();
        expect(negFirst).assertEqual((-999.0f));
        expect(negSecond).assertEqual((-999.0f));
        expect(negThird).assertEqual((-999.0f));
        expect(negFirst).assertEqual(negSecond);
        expect(negSecond).assertEqual(negThird);
  
        let zeroValue: Short = new Short(0 as short);
        let zeroFirst: float = zeroValue.toFloat();
        let zeroSecond: float = zeroValue.toFloat();
        let zeroThird: float = zeroValue.toFloat();
        expect(zeroFirst).assertEqual(0.0f);
        expect(zeroSecond).assertEqual(0.0f);
        expect(zeroThird).assertEqual(0.0f);
        expect(zeroFirst).assertEqual(zeroSecond);
        expect(zeroSecond).assertEqual(zeroThird);
      }

      {
        let inputA: short = 111 as short;
        let inputB: short = 222 as short;
        let inputC: short = 333 as short;
        let resultA1: float = Short.toFloat(inputA);
        let resultB: float = Short.toFloat(inputB);
        let resultA2: float = Short.toFloat(inputA);
        let resultC: float = Short.toFloat(inputC);
        let resultB2: float = Short.toFloat(inputB);
        expect(resultA1).assertEqual(111.0f);
        expect(resultA2).assertEqual(111.0f);
        expect(resultB).assertEqual(222.0f);
        expect(resultB2).assertEqual(222.0f);
        expect(resultC).assertEqual(333.0f);
        expect(resultA1).assertEqual(resultA2);
        expect(resultB).assertEqual(resultB2);
      }

      {
        let externalValue: int = 42;
        let beforeValue: int = externalValue;
        let shortInput: short = 777 as short;
        let floatResult: float = Short.toFloat(shortInput);
        let midValue: int = externalValue;
        let anotherInput: short = 888 as short;
        let anotherResult: float = Short.toFloat(anotherInput);
        let afterValue: int = externalValue;
        expect(floatResult).assertEqual(777.0f);
        expect(anotherResult).assertEqual(888.0f);
        expect(beforeValue).assertEqual(42);
        expect(midValue).assertEqual(42);
        expect(afterValue).assertEqual(42);
      }

      {
        let testVals: short[] = [1 as short, 128 as short, 1000 as short, 16384 as short, Short.MAX_VALUE,
          (-1) as short, (-128) as short, (-1000) as short, (-16384) as short, (-32767) as short];
        let count: int = 10;
        for (let i: int = 0; i < count; i++) {
          let posVal: short = testVals[i];
          let negVal: short = Int.toShort(-posVal);
          expect(Short.toFloat(negVal)).assertEqual(-Short.toFloat(posVal));
        }
      }

      {
        let testVals: short[] = [
          0 as short, 1 as short, (-1) as short, 255 as short, (-128) as short,
          1024 as short, 16384 as short, (-100) as short, Short.MAX_VALUE, Short.MIN_VALUE
        ];
        let count: int = testVals.length;
        for (let i: int = 0; i < count; i++) {
          let fVal: float = Short.toFloat(testVals[i]);
          let intVal: int = Short.toInt(testVals[i]);
          let intAsFloat: float = Int.toFloat(intVal);
          expect(fVal).assertEqual(intAsFloat);
        }
      }

      {
        let testVals: short[] = [
          0 as short, 1 as short, (-1) as short, 255 as short, (-128) as short,
          Short.MAX_VALUE, Short.MIN_VALUE, 1000 as short, (-1000) as short
        ];
        let count: int = testVals.length;
        for (let i: int = 0; i < count; i++) {
          let fVal: float = Short.toFloat(testVals[i]);
          let longVal: long = Short.toLong(testVals[i]);
          let longAsFloat: float = Long.toFloat(longVal);
          expect(fVal).assertEqual(longAsFloat);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOFLOAT_1400
     * @tc.name testShortToFloat_merged14
     * @tc.desc BusinessScenario: covers 1 merged test points for Short.toFloat, including business scenarios and type conversion.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToFloat_merged14', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let timeDomain: short[] = [
          0 as short, 100 as short, 200 as short, 100 as short,
          0 as short, (-100) as short, (-200) as short, (-100) as short
        ];
        let freqDomain: float[] = [];
        let n: int = timeDomain.length;
        for (let i: int = 0; i < n; i++) {
          freqDomain.push(Short.toFloat(timeDomain[i]));
        }
        let magnitude: double = 0.0;
        for (let i: int = 0; i < n; i++) {
          magnitude = magnitude + Math.abs(freqDomain[i]);
        }
        expect(magnitude).assertEqual(800.0);
        expect(freqDomain[0]).assertEqual(0.0f);
        expect(freqDomain[2] > freqDomain[0]).assertTrue();
      }
    });

  });
}