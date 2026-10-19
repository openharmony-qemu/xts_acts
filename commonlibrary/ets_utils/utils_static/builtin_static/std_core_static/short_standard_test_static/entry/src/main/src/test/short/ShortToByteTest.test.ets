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

export default function shortToByteTest(): void {
  describe('ShortToByteTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOBYTE_0100
     * @tc.name testShortToByte_merged1
     * @tc.desc BoundaryOverflow: covers 10 merged test points for Short.toByte, including type conversion, fractions and rounding, overflow, boundary values, and negative values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToByte_merged1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let zeroValue: short = 0 as short;
        let positiveValue: short = 42 as short;
        let negativeValue: short = (-1) as short;
        let zeroResult: byte = Short.toByte(zeroValue);
        let positiveResult: byte = Short.toByte(positiveValue);
        let negativeResult: byte = Short.toByte(negativeValue);
        expect(zeroResult).assertEqual(0 as byte);
        expect(positiveResult).assertEqual(42 as byte);
        expect(negativeResult).assertEqual((-1) as byte);
      }

      {
        let minByteBoundary: short = (-128) as short;
        let maxByteBoundary: short = 127 as short;
        let minByteResult: byte = Short.toByte(minByteBoundary);
        let maxByteResult: byte = Short.toByte(maxByteBoundary);
        expect(minByteResult).assertEqual((-128) as byte);
        expect(maxByteResult).assertEqual(127 as byte);
      }

      {
        let positiveOverflowValue: short = 128 as short;
        let negativeOverflowValue: short = (-129) as short;
        let positiveOverflowResult: byte = Short.toByte(positiveOverflowValue);
        let negativeOverflowResult: byte = Short.toByte(negativeOverflowValue);
        expect(positiveOverflowResult).assertEqual((-128) as byte);
        expect(negativeOverflowResult).assertEqual(127 as byte);
      }

      {
        let minShortValue: short = Short.MIN_VALUE;
        let maxShortValue: short = Short.MAX_VALUE;
        let minShortResult: byte = Short.toByte(minShortValue);
        let maxShortResult: byte = Short.toByte(maxShortValue);
        expect(minShortResult).assertEqual(0 as byte);
        expect(maxShortResult).assertEqual((-1) as byte);
      }

      {
        let testValues: short[] = [
          Short.MIN_VALUE,
          (-16384) as short,
          (-128) as short,
          0 as short,
          127 as short,
          16383 as short,
          Short.MAX_VALUE
        ];
        let expectedValues: byte[] = [
          0 as byte,
          0 as byte,
          (-128) as byte,
          0 as byte,
          127 as byte,
          (-1) as byte,
          (-1) as byte
        ];
        let caseCount: int = 7;
        for (let i: int = 0; i < caseCount; i++) {
          let actualResult: byte = Short.toByte(testValues[i]);
          expect(actualResult).assertEqual(expectedValues[i]);
        }
      }

      {
        let positiveFiveValue: short = 5 as short;
        let negativeFiveValue: short = (-5) as short;
        let positiveBoundaryValue: short = 127 as short;
        let negativeBoundaryValue: short = (-127) as short;
        let positiveOverflowValue: short = 128 as short;
        let negativeOverflowValue: short = (-128) as short;
        let positiveFiveResult: byte = Short.toByte(positiveFiveValue);
        let negativeFiveResult: byte = Short.toByte(negativeFiveValue);
        let positiveBoundaryResult: byte = Short.toByte(positiveBoundaryValue);
        let negativeBoundaryResult: byte = Short.toByte(negativeBoundaryValue);
        let positiveOverflowResult: byte = Short.toByte(positiveOverflowValue);
        let negativeOverflowResult: byte = Short.toByte(negativeOverflowValue);
        let positiveFiveAsInt: int = positiveFiveResult;
        let negativeFiveAsInt: int = negativeFiveResult;
        let positiveBoundaryAsInt: int = positiveBoundaryResult;
        let negativeBoundaryAsInt: int = negativeBoundaryResult;
        expect(positiveFiveResult).assertEqual(5 as byte);
        expect(negativeFiveResult).assertEqual((-5) as byte);
        expect(positiveFiveAsInt).assertEqual(-negativeFiveAsInt);
        expect(positiveBoundaryResult).assertEqual(127 as byte);
        expect(negativeBoundaryResult).assertEqual((-127) as byte);
        expect(positiveBoundaryAsInt).assertEqual(-negativeBoundaryAsInt);
        expect(positiveOverflowResult).assertEqual((-128) as byte);
        expect(negativeOverflowResult).assertEqual((-128) as byte);
      }

      {
        let normalValue: short = 0 as short;
        let overflowValue: short = 128 as short;
        let extremeValue: short = Short.MAX_VALUE;
        let conversionResults: byte[] = [];
        conversionResults.push(Short.toByte(normalValue));
        conversionResults.push(Short.toByte(overflowValue));
        conversionResults.push(Short.toByte(extremeValue));
        expect(conversionResults[0]).assertEqual(0 as byte);
        expect(conversionResults[1]).assertEqual((-128) as byte);
        expect(conversionResults[2]).assertEqual((-1) as byte);
      }

      {
        let testValues: short[] = [
          0 as short,
          42 as short,
          (-1) as short,
          (-128) as short,
          127 as short,
          128 as short,
          (-129) as short,
          Short.MAX_VALUE
        ];
        let expectedValues: byte[] = [
          0 as byte,
          42 as byte,
          (-1) as byte,
          (-128) as byte,
          127 as byte,
          (-128) as byte,
          127 as byte,
          (-1) as byte
        ];
        let caseCount: int = 8;
        for (let i: int = 0; i < caseCount; i++) {
          let firstResult: byte = Short.toByte(testValues[i]);
          let secondResult: byte = Short.toByte(testValues[i]);
          let thirdResult: byte = Short.toByte(testValues[i]);
          expect(firstResult).assertEqual(expectedValues[i]);
          expect(secondResult).assertEqual(expectedValues[i]);
          expect(thirdResult).assertEqual(expectedValues[i]);
          expect(firstResult).assertEqual(secondResult);
          expect(secondResult).assertEqual(thirdResult);
        }
      }

      {
        let viaNegOne: short = Short.parseInt('-1', 10);
        expect(Short.toByte(viaNegOne)).assertEqual((-1) as byte);
        let viaNeg128: short = Short.parseInt('-128', 10);
        expect(Short.toByte(viaNeg128)).assertEqual((-128) as byte);
        let viaNeg129: short = Short.parseInt('-129', 10);
        expect(Short.toByte(viaNeg129)).assertEqual(127 as byte);
        let viaNeg255: short = Short.parseInt('-255', 10);
        expect(Short.toByte(viaNeg255)).assertEqual(1 as byte);
        let viaNeg256: short = Short.parseInt('-256', 10);
        expect(Short.toByte(viaNeg256)).assertEqual(0 as byte);
        let viaMin: short = Short.parseInt('-32768', 10);
        expect(Short.toByte(viaMin)).assertEqual(0 as byte);
      }

      {
        let charInputs: char[] = [c'A', c'z', c'\u00FF', c'\u0100', c'\u4E2D'];
        let expectedBytes: byte[] = [65 as byte, 122 as byte, (-1) as byte, 0 as byte, 45 as byte];
        let caseCount: int = 5;
        for (let i: int = 0; i < caseCount; i++) {
          let derivedShort: short = Char.toShort(charInputs[i]);
          let result: byte = Short.toByte(derivedShort);
          expect(result).assertEqual(expectedBytes[i]);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOBYTE_0200
     * @tc.name testShortToByte_merged2
     * @tc.desc BoundaryOverflow: covers 10 merged test points for Short.toByte, including type conversion, fractions and rounding, overflow, wrapping, and boundary values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToByte_merged2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let sourceValue: short = (-128) as short;
        let boxedValue: Short = new Short(sourceValue);
        let instanceResult: byte = boxedValue.toByte();
        let staticResult: byte = Short.toByte(sourceValue);
        expect(instanceResult).assertEqual((-128) as byte);
        expect(staticResult).assertEqual((-128) as byte);
        expect(instanceResult).assertEqual(staticResult);
        expect(boxedValue.toShort()).assertEqual(sourceValue);
      }

      {
        let sourceValue: short = 128 as short;
        let boxedValue: Short = new Short(sourceValue);
        let instanceResult: byte = boxedValue.toByte();
        let staticResult: byte = Short.toByte(sourceValue);
        expect(instanceResult).assertEqual((-128) as byte);
        expect(staticResult).assertEqual((-128) as byte);
        expect(instanceResult).assertEqual(staticResult);
        expect(boxedValue.toShort()).assertEqual(sourceValue);
      }

      {
        let overflowMagnitudes: short[] = [200 as short, 255 as short];
        let positiveLowBytes: byte[] = [(-56) as byte, (-1) as byte];
        let negativeLowBytes: byte[] = [56 as byte, 1 as byte];
        for (let i: int = 0; i < overflowMagnitudes.length; i++) {
          let positive: short = overflowMagnitudes[i];
          let negative: short = Int.toShort(-positive.toInt());
          let positiveLow: byte = Short.toByte(positive);
          let negativeLow: byte = Short.toByte(negative);
          expect(positiveLow).assertEqual(positiveLowBytes[i]);
          expect(negativeLow).assertEqual(negativeLowBytes[i]);
          expect(Byte.toInt(positiveLow) + Byte.toInt(negativeLow)).assertEqual(0);
        }
      }

      {
        let value126: short = 126 as short;
        let valueMinus129: short = (-129) as short;
        let result126: byte = Short.toByte(value126);
        let resultMinus129: byte = Short.toByte(valueMinus129);
        expect(result126).assertEqual(126 as byte);
        expect(resultMinus129).assertEqual(127 as byte);
      }

      {
        let alphaValue: byte = Short.toByte(Short.parseInt("65", 10));
        let alphaCategory: string = "";
        switch (Short.toInt(alphaValue)) {
          case 0:
            alphaCategory = "zero";
            break;
          case 65:
            alphaCategory = "alpha";
            break;
          default:
            alphaCategory = "other";
            break;
        }
        expect(alphaCategory).assertEqual("alpha");
        let wrappedSelector: byte = Short.toByte(Short.parseInt("256", 10));
        let wrappedCategory: string = "";
        switch (Short.toInt(wrappedSelector)) {
          case 0:
            wrappedCategory = "zero";
            break;
          default:
            wrappedCategory = "other";
            break;
        }
        expect(wrappedCategory).assertEqual("zero");
      }

      {
        let loopLimit: int = Short.toByte(Short.parseInt("5", 10));
        let visitCount: int = 0;
        let accumulatedSum: int = 0;
        for (let index: int = 0; index < loopLimit; index++) {
          accumulatedSum = accumulatedSum + index;
          visitCount = visitCount + 1;
        }
        expect(visitCount).assertEqual(5);
        expect(accumulatedSum).assertEqual(10);
        let wrappedLimit: int = Short.toByte(Short.parseInt("260", 10));
        expect(wrappedLimit).assertEqual(4);
        let negativeLimit: int = Short.toByte(Short.parseInt("-5", 10));
        let negativeVisits: int = 0;
        for (let index: int = 0; index < negativeLimit; index++) {
          negativeVisits = negativeVisits + 1;
        }
        expect(negativeVisits).assertEqual(0);
      }

      {
        let firstValues: short[] = [100 as short, 200 as short, 300 as short, (-100) as short, 128 as short, 2000 as short];
        let secondValues: short[] = [156 as short, 56 as short, 212 as short, (-128) as short, 129 as short, 500 as short];
        let caseCount: int = 6;
        for (let i: int = 0; i < caseCount; i++) {
          let a: int = Short.toInt(firstValues[i]);
          let b: int = Short.toInt(secondValues[i]);
          let directResult: byte = Short.toByte(Int.toShort(a + b));
          let aByte: byte = Short.toByte(firstValues[i]);
          let bByte: byte = Short.toByte(secondValues[i]);
          let sumResult: byte = Int.toByte(aByte + bByte);
          expect(directResult).assertEqual(sumResult);
        }
      }

      {
        let maxShort: Short = new Short(Short.MAX_VALUE);
        let minShort: Short = new Short(Short.MIN_VALUE);
        expect(maxShort.toByte()).assertEqual((-1) as byte);
        expect(minShort.toByte()).assertEqual(0 as byte);
        expect(maxShort.toByte()).assertEqual(Short.toByte(Short.MAX_VALUE));
        expect(minShort.toByte()).assertEqual(Short.toByte(Short.MIN_VALUE));
        expect(maxShort.toShort()).assertEqual(Short.MAX_VALUE);
        expect(minShort.toShort()).assertEqual(Short.MIN_VALUE);
      }

      {
        let inRange: short = 100 as short;
        let overflow: short = 300 as short;
        let byteInRange: byte = Short.toByte(inRange);
        let byteOverflow: byte = Short.toByte(overflow);
        expect(inRange).assertEqual(Short.toShort(byteInRange));
        expect(Short.toShort(byteOverflow)).assertEqual(44);
      }

      {
        let testValues: int[] = [0, 127, 128, 255, 256, 257, 512, -1, -128, -256];
        let expectedBytes: int[] = [0, 127, -128, -1, 0, 1, 0, -1, -128, 0];
  
        for (let i: int = 0; i < testValues.length; i++) {
          let s: Short = new Short(Int.toShort(testValues[i]));
          let b: byte = s.toByte();
          expect(b).assertEqual(expectedBytes[i]);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOBYTE_0300
     * @tc.name testShortToByte_merged3
     * @tc.desc BoundaryOverflow: covers 10 merged test points for Short.toByte, including type conversion, fractions and rounding, overflow, business scenarios, and wrapping.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToByte_merged3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let shortValues: Short[] = [
          new Short(Int.toShort(0x00)), new Short(Int.toShort(0x7F)), new Short(Int.toShort(0x80)),
          new Short(Int.toShort(0xFF)), new Short(Int.toShort(0x100))
        ];
  
        let byteArray: Uint8Array = new Uint8Array(shortValues.length);
        for (let i: int = 0; i < shortValues.length; i++) {
          byteArray[i] = shortValues[i].toByte() & 0xFF;
        }
  
        expect(byteArray[0]).assertEqual(0x00);
        expect(byteArray[1]).assertEqual(0x7F);
        expect(byteArray[2]).assertEqual(0x80);
        expect(byteArray[3]).assertEqual(0xFF);
        expect(byteArray[4]).assertEqual(0x00);
      }

      {
        let sourceValues: int[] = [0, 256, 512, -256, 127, 128, 255, -1];
  
        let signedSet: Set<int> = new Set<int>();
        let unsignedSet: Set<int> = new Set<int>();
  
        for (let val of sourceValues) {
          let s: Short = new Short(Int.toShort(val));
          let b: byte = s.toByte();
          signedSet.add(b);
          unsignedSet.add(b & 0xFF);
        }
  
        expect(signedSet.size).assertEqual(4);
        expect(unsignedSet.size).assertEqual(4);
        let expectedBytes: byte[] = [0 as byte, 0 as byte, 0 as byte, 0 as byte, 127 as byte, (-128) as byte, (-1) as byte, (-1) as byte];
        for (let i: int = 0; i < sourceValues.length; i++) {
          expect(new Short(Int.toShort(sourceValues[i])).toByte()).assertEqual(expectedBytes[i]);
        }
      }

      {
        let byteRange: short[] = [(-128) as short, (-64) as short, 0 as short, 64 as short, 127 as short];
        let overflow: short[] = [128 as short, 256 as short, (-129) as short, (-256) as short];
        let expectedOverflow: short[] = [(-128) as short, 0 as short, 127 as short, 0 as short];
        let count1: int = 5;
        let count2: int = 4;
        for (let i: int = 0; i < count1; i++) {
          expect(Short.toShort(Short.toByte(byteRange[i]))).assertEqual(byteRange[i]);
        }
        for (let i: int = 0; i < count2; i++) {
          expect(Short.toShort(Short.toByte(overflow[i]))).assertEqual(expectedOverflow[i]);
        }
      }

      {
        let values: short[] = [0 as short, 127 as short, 128 as short, 255 as short, 256 as short,
          (-1) as short, (-128) as short, (-129) as short, (-256) as short];
        let count: int = 9;
        for (let i: int = 0; i < count; i++) {
          let direct: byte = Short.toByte(values[i]);
          let masked: byte = Int.toByte(Short.toInt(values[i]) & 0xFF);
          expect(direct).assertEqual(masked);
        }
      }

      {
        let factor1: short = 200 as short;
        let factor2: short = 200 as short;
        let product: int = Short.toInt(factor1) * Short.toInt(factor2);
        let productShort: short = Int.toShort(product);
        let byteResult: byte = Short.toByte(productShort);
        let expected: byte = Int.toByte(product & 0xFF);
        expect(byteResult).assertEqual(expected);
      }

      {
        let samples: short[] = [100 as short, 120 as short, 115 as short, 140 as short, 130 as short];
        let deltas: short[] = [100 as short, 20 as short, (-5) as short, 25 as short, (-10) as short];
        let count: int = 5;
        let prev: short = 0 as short;
        for (let i: int = 0; i < count; i++) {
          let delta: short = Int.toShort(samples[i] - prev);
          expect(delta).assertEqual(deltas[i]);
          let encoded: byte = Short.toByte(delta);
          expect(Short.toShort(encoded)).assertEqual(delta);
          prev = samples[i];
        }
      }

      {
        let period: int = 256;
        let positiveWrap: short = 511 as short;
        let negativeWrap: short = Int.toShort(-511);
        let positiveLow: byte = Short.toByte(positiveWrap);
        let negativeLow: byte = Short.toByte(negativeWrap);
        expect(positiveLow).assertEqual((-1) as byte);
        expect(negativeLow).assertEqual(1 as byte);
        expect(Int.toByte(Short.toInt(positiveWrap) % period)).assertEqual(positiveLow);
        expect(Byte.toInt(positiveLow) + Byte.toInt(negativeLow)).assertEqual(0);
      }

      {
        let inRangeValues: short[] = [(-128) as short, (-1) as short, 0 as short, 1 as short, 127 as short];
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          let rawByte: byte = Short.toByte(inRangeValues[i]);
          let rebuilt: Short = new Short(Byte.toShort(rawByte));
          expect(rebuilt.toByte()).assertEqual(rawByte);
          expect(rebuilt.toShort()).assertEqual(inRangeValues[i]);
        }
        let truncatedValue: short = 300 as short;
        let truncatedByte: byte = Short.toByte(truncatedValue);
        let rebuiltTruncated: Short = new Short(Byte.toShort(truncatedByte));
        expect(truncatedByte).assertEqual(44 as byte);
        expect(rebuiltTruncated.toByte()).assertEqual(truncatedByte);
        expect(rebuiltTruncated.toShort()).assertEqual(44 as short);
        expect(rebuiltTruncated.toShort() !== truncatedValue).assertTrue();
      }

      {
        let kValues: short[] = [(-1) as short, 0 as short, 1 as short, 2 as short];
        let bValues: short[] = [(-128) as short, (-1) as short, 0 as short, 1 as short, 127 as short];
        let kCount: int = 4;
        let bCount: int = 5;
        for (let ki: int = 0; ki < kCount; ki++) {
          for (let bi: int = 0; bi < bCount; bi++) {
            let k: short = kValues[ki];
            let b: short = bValues[bi];
            let combined: short = Int.toShort(Short.toInt(k) * 256 + Short.toInt(b));
            expect(Short.toByte(combined)).assertEqual(Short.toByte(b));
          }
        }
      }

      {
        let firstValue: short = 0x2C as short;
        let secondValue: short = 0x2D as short;
        let firstGray: int = Short.toInt(firstValue) ^ (Short.toInt(firstValue) >> 1);
        let secondGray: int = Short.toInt(secondValue) ^ (Short.toInt(secondValue) >> 1);
        let xorDiff: int = firstGray ^ secondGray;
        let changedBits: int = 0;
        for (let bit: int = 0; bit < 8; bit++) {
          if ((xorDiff & (1 << bit)) !== 0) {
            changedBits = changedBits + 1;
          }
        }
        expect(changedBits).assertEqual(1);
        let grayByte: byte = Short.toByte(Int.toShort(firstGray));
        expect(grayByte).assertEqual(Int.toByte(0x3A));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOBYTE_0400
     * @tc.name testShortToByte_merged4
     * @tc.desc BoundaryOverflow / ErrorException / CrossTypeRoundTrip: covers 10 merged test points for Short.toByte, including type conversion, business scenarios, fractions and rounding, boundary values, and comparison and ordering.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToByte_merged4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let s127: Short = new Short(127 as short);
        let s128: Short = new Short(128 as short);
        expect(s127.isLessThan(s128)).assertTrue();
        expect(s127.toByte() > s128.toByte()).assertTrue();
        let sM1: Short = new Short((-1) as short);
        let s0: Short = new Short(0 as short);
        expect(sM1.toByte() < s0.toByte()).assertTrue();
        expect(s127.toByte()).assertEqual(127 as byte);
        expect(s128.toByte()).assertEqual((-128) as byte);
        expect(sM1.toByte()).assertEqual((-1) as byte);
        expect(s0.toByte()).assertEqual(0 as byte);
      }

      {
        let values: short[] = [0x00 as short, 0x01 as short, 0x03 as short, 0x07 as short, 0x0F as short, 0xFF as short];
        let expectedParity: int[] = [0, 1, 0, 1, 0, 0];
        let count: int = 6;
        for (let i: int = 0; i < count; i++) {
          let b: byte = Short.toByte(values[i]);
          let parity: int = 0;
          let val: int = Short.toInt(Short.toShort(b)) & 0xFF;
          for (let bit: int = 0; bit < 8; bit++) {
            parity = parity ^ ((val >> bit) & 1);
          }
          expect(parity).assertEqual(expectedParity[i]);
        }
      }

      {
        let distinctBytes: Set<int> = new Set<int>();
        let minByte: int = 0;
        let maxByte: int = 0;
        let firstValue: boolean = true;
        for (let v: int = 0; v <= 255; v++) {
          let converted: byte = Short.toByte(Int.toShort(v));
          distinctBytes.add(converted);
          if (firstValue) {
            minByte = converted;
            maxByte = converted;
            firstValue = false;
          } else {
            if (converted < minByte) {
              minByte = converted;
            }
            if (converted > maxByte) {
              maxByte = converted;
            }
          }
        }
        expect(distinctBytes.size).assertEqual(256);
        expect(minByte).assertEqual(-128);
        expect(maxByte).assertEqual(127);
        expect(Short.toByte(Int.toShort(255))).assertEqual((-1) as byte);
        expect(Short.toByte(Int.toShort(128))).assertEqual((-128) as byte);
      }

      {
        let doubleInputs: double[] = [3.9, (-3.9), 255.7, 256.0, (-128.5), 32767.2];
        let expectedBytes: byte[] = [3 as byte, (-3) as byte, (-1) as byte, 0 as byte, (-128) as byte, (-1) as byte];
        let caseCount: int = 6;
        for (let i: int = 0; i < caseCount; i++) {
          let derivedShort: short = Double.toShort(doubleInputs[i]);
          let result: byte = Short.toByte(derivedShort);
          expect(result).assertEqual(expectedBytes[i]);
        }
      }

      {
        let sourceValue: short = 42 as short;
        let boxedValue: Short = new Short(sourceValue);
        let instanceResult: byte = boxedValue.toByte();
        let staticResult: byte = Short.toByte(sourceValue);
        expect(instanceResult).assertEqual(42 as byte);
        expect(staticResult).assertEqual(42 as byte);
        expect(instanceResult).assertEqual(staticResult);
        expect(boxedValue.toShort()).assertEqual(sourceValue);
      }

      {
        let testValues: short[] = [0 as short, 64 as short, (-64) as short, 127 as short, (-128) as short];
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          let boxed: Short = new Short(testValues[i]);
          let instanceResult: byte = boxed.toByte();
          let staticResult: byte = Short.toByte(testValues[i]);
          expect(instanceResult).assertEqual(staticResult);
          expect(boxed.toShort()).assertEqual(testValues[i]);
        }
      }

      {
        let boxed1: Short = new Short(10 as short);
        let boxed2: Short = new Short((-10) as short);
        let boxed3: Short = new Short(130 as short);
        let result1: byte = boxed1.toByte();
        let result2: byte = boxed2.toByte();
        let result3: byte = boxed3.toByte();
        expect(result1).assertEqual(10 as byte);
        expect(result2).assertEqual((-10) as byte);
        expect(result3).assertEqual((-126) as byte);
        expect(boxed1.toShort()).assertEqual(10 as short);
        expect(boxed2.toShort()).assertEqual((-10) as short);
        expect(boxed3.toShort()).assertEqual(130 as short);
      }

      {
        let parsedValue: short = Short.parseInt('99', 10);
        let boxed: Short = new Short(parsedValue);
        let instanceResult: byte = boxed.toByte();
        let staticResult: byte = Short.toByte(parsedValue);
        expect(instanceResult).assertEqual(99 as byte);
        expect(staticResult).assertEqual(99 as byte);
        expect(instanceResult).assertEqual(staticResult);
      }

      {
        let testValues: short[] = [0 as short, 42 as short, (-42) as short, 127 as short, (-128) as short];
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          let byteResult: byte = Short.toByte(testValues[i]);
          let shortResult: short = Short.toShort(byteResult);
          expect(shortResult).assertEqual(testValues[i]);
        }
      }

      {
        let valA: short = 50 as short;
        let valB: short = 30 as short;
        let byteA: byte = Short.toByte(valA);
        let byteB: byte = Short.toByte(valB);
        let sumAsInt: int = byteA + byteB;
        expect(byteA).assertEqual(50 as byte);
        expect(byteB).assertEqual(30 as byte);
        expect(sumAsInt).assertEqual(80);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOBYTE_0500
     * @tc.name testShortToByte_merged5
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toByte, including type conversion, byte structure, business scenarios, containers and references, and loop accumulation.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToByte_merged5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let leftOperand: Short = new Short(200 as short);
        let rightOperand: Short = new Short(100 as short);
        let difference: Short = leftOperand.sub(rightOperand);
        let byteResult: byte = difference.toByte();
        expect(difference.toShort()).assertEqual(100 as short);
        expect(byteResult).assertEqual(100 as byte);
      }

      {
        let directValue: byte = Short.toByte(Short.parseInt("10", 10));
        let wrappedValue: byte = Short.toByte(Short.parseInt("266", 10));
        let negativeValue: byte = Short.toByte(Short.parseInt("-1", 10));
        let highValue: byte = Short.toByte(Short.parseInt("300", 10));
        let byteValues: byte[] = [directValue, wrappedValue, negativeValue, highValue];
        expect(byteValues).assertDeepEquals([10 as byte, 10 as byte, (-1) as byte, 44 as byte]);
        expect(Short.toInt(wrappedValue)).assertEqual(10);
        expect(Short.toInt(highValue)).assertEqual(44);
      }

      {
        let lowBytePairs: [short, short, byte][] = [
          [0 as short, 256 as short, 0 as byte],
          [127 as short, 383 as short, 127 as byte],
          [(-1) as short, 255 as short, (-1) as byte],
          [(-128) as short, 128 as short, (-128) as byte],
          [42 as short, 298 as short, 42 as byte]
        ];
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          expect(Short.toByte(lowBytePairs[i][0])).assertEqual(lowBytePairs[i][2]);
          expect(Short.toByte(lowBytePairs[i][1])).assertEqual(lowBytePairs[i][2]);
        }
      }

      {
        let value: Short = new Short(Int.toShort(0x4A3F));
  
        let highByte: byte = Short.toByte(Int.toShort(value.toInt() >> 8));
        let lowByte: byte = value.toByte();
  
        expect(highByte).assertEqual(74);
        expect(lowByte).assertEqual(63);
  
        let reconstructed: Short = new Short(Int.toShort((highByte << 8) | (lowByte & 0xFF)));
        expect(reconstructed.toShort()).assertEqual(value.toShort());
      }

      {
        let data: Short[] = [
          new Short(Int.toShort(0x12)), new Short(Int.toShort(0x34)), new Short(Int.toShort(0x56)), new Short(Int.toShort(0x78))
        ];
  
        let sum: Short = new Short(0 as short);
        for (let d of data) {
          sum = sum.add(d);
        }
  
        let checksum: byte = sum.toByte();
        expect(checksum).assertEqual(0x14);
  
        let total: Short = sum.add(new Short(Int.toShort(checksum)));
        let verification: byte = total.toByte();
        expect(verification).assertEqual(0x28);
      }

      {
        let value: Short = new Short(Int.toShort(0xABCD));
  
        let byteVal: byte = value.toByte();
        let shortVal: Short = new Short(Int.toShort(value));
  
        expect(byteVal & 0xFF).assertEqual(shortVal.toInt() & 0xFF);
        expect((byteVal & 0xFF)).assertEqual(0xCD);
      }

      {
        let sensor16bit: Short[] = [
          new Short(32001 as short), new Short(16000 as short), new Short(8000 as short), new Short(4000 as short)
        ];
  
        let compressed: byte[] = [];
        for (let s of sensor16bit) {
          let scaled: Short = s.div(new Short(256 as short));
          compressed.push(scaled.toByte());
        }
  
        expect(compressed[0]).assertEqual(125);
        expect(compressed[1]).assertEqual(62);
        expect(compressed[2]).assertEqual(31);
        expect(compressed[3]).assertEqual(15);
  
        let restored: Short = new Short(Int.toShort(Byte.toInt(compressed[0]) * 256));
        expect(restored.isLessThan(sensor16bit[0])).assertTrue();
      }

      {
        let data: Short[] = [
          new Short(0 as short), new Short(100 as short), new Short(255 as short),
          new Short(256 as short), new Short(-1 as short), new Short(-128 as short)
        ];
  
        let expectedMap: Map<int, int> = new Map<int, int>();
        expectedMap.set(0, 0);
        expectedMap.set(100, 100);
        expectedMap.set(255, -1);
        expectedMap.set(256, 0);
        expectedMap.set(-1, -1);
        expectedMap.set(-128, -128);
  
        let bytes: byte[] = [];
        let checksumInt: int = 0;
  
        for (let i: int = 0; i < data.length; i++) {
          let b: byte = data[i].toByte();
          bytes.push(b);
          checksumInt += (b & 0xFF);
  
          expect(b).assertEqual(expectedMap.get(data[i].toInt())!);
        }
  
        expect(checksumInt).assertEqual(738);
      }

      {
        let positiveVal: short = 100 as short;
        let negativeVal: short = (-100) as short;
        let posByte: byte = Short.toByte(positiveVal);
        let negByte: byte = Short.toByte(negativeVal);
        let posInt: int = Short.toInt(Short.toShort(posByte));
        let negInt: int = Short.toInt(Short.toShort(negByte));
        expect(posInt).assertEqual(100);
        expect(negInt).assertEqual(-100);
        expect(Short.toInt(Short.toShort(Short.toByte((-1) as short)))).assertEqual(-1);
      }

      {
        let valA: short = 42 as short;
        let valB: short = (-42) as short;
        let negA: short = Int.toShort(-valA);
        let negB: short = Int.toShort(-valB);
        expect(Short.toByte(valA)).assertEqual(42 as byte);
        expect(Short.toByte(negA)).assertEqual((-42) as byte);
        expect(Short.toByte(valB)).assertEqual((-42) as byte);
        expect(Short.toByte(negB)).assertEqual(42 as byte);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOBYTE_0600
     * @tc.name testShortToByte_merged6
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toByte, including type conversion, business scenarios, bitwise operations, loop accumulation, and comparison and ordering.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToByte_merged6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let val: short = 0x55 as short;
        let b: byte = Short.toByte(val);
        let leftShifted: int = b << 1;
        let rightShifted: int = b >> 1;
        expect(leftShifted).assertEqual(0xAA);
        expect(rightShifted).assertEqual(0x2A);
      }

      {
        let a: short = 10 as short;
        let b: short = 20 as short;
        let c: short = 3 as short;
        let result: int = Short.toInt(a) * Short.toInt(b) + Short.toInt(c);
        let resultShort: short = Int.toShort(result);
        let byteResult: byte = Short.toByte(resultShort);
        expect(byteResult).assertEqual(Int.toByte((10 * 20 + 3) & 0xFF));
      }

      {
        let rgb565: short = 0x781F as short;
        let blueComponent: short = Int.toShort(Short.toInt(rgb565) & 0x1F);
        let scaledBlue: short = Int.toShort(Short.toInt(blueComponent) * 255 / 31);
        let blueByte: byte = Short.toByte(scaledBlue);
        expect(blueComponent).assertEqual(0x1F as short);
        expect(blueByte).assertEqual(Int.toByte(31 * 255 / 31));
      }

      {
        let upperA: short = 0x41 as short;
        let lowerA: short = 0x61 as short;
        let digit0: short = 0x30 as short;
        let upperByte: byte = Short.toByte(upperA);
        let lowerByte: byte = Short.toByte(lowerA);
        let digitByte: byte = Short.toByte(digit0);
        expect(upperByte >= 65 as byte && upperByte <= 90 as byte).assertTrue();
        expect(lowerByte >= 97 as byte && lowerByte <= 122 as byte).assertTrue();
        expect(digitByte >= 48 as byte && digitByte <= 57 as byte).assertTrue();
        expect(upperByte).assertEqual(65 as byte);
        expect(lowerByte).assertEqual(97 as byte);
        expect(digitByte).assertEqual(48 as byte);
      }

      {
        let seed: short = 12345 as short;
        let multiplier: short = 11035 as short;
        let increment: short = 12345 as short;
        let generatedBytes: byte[] = [];
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          let nextVal: int = Short.toInt(seed) * Short.toInt(multiplier) + Short.toInt(increment);
          seed = Int.toShort(nextVal);
          generatedBytes.push(Short.toByte(seed));
        }
        expect(generatedBytes.length).assertEqual(5);
        let allSame: boolean = true;
        for (let i: int = 1; i < count; i++) {
          if (generatedBytes[i] !== generatedBytes[0]) {
            allSame = false;
          }
        }
        expect(!allSame).assertTrue();
      }

      {
        let plaintext: byte[] = [0x48 as byte, 0x65 as byte, 0x6C as byte, 0x6C as byte, 0x6F as byte];
        let ciphertext: byte[] = [];
        let decrypted: byte[] = [];
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          let counterShort: short = Int.toShort(i * 17 + 42);
          let keyByte: byte = Short.toByte(counterShort);
          ciphertext.push(Int.toByte(Short.toInt(Short.toShort(plaintext[i])) ^ Short.toInt(Short.toShort(keyByte))));
        }
        for (let i: int = 0; i < count; i++) {
          let counterShort: short = Int.toShort(i * 17 + 42);
          let keyByte: byte = Short.toByte(counterShort);
          decrypted.push(Int.toByte(Short.toInt(Short.toShort(ciphertext[i])) ^ Short.toInt(Short.toShort(keyByte))));
        }
        for (let i: int = 0; i < count; i++) {
          expect(decrypted[i]).assertEqual(plaintext[i]);
        }
      }

      {
        let timerMax: short = 1000 as short;
        let compareValues: short[] = [0 as short, 250 as short, 500 as short, 750 as short, 1000 as short];
        let expectedDuty: byte[] = [0 as byte, 64 as byte, (-128) as byte, (-64) as byte, 0 as byte];
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          let scaled: short = Int.toShort(Short.toInt(compareValues[i]) * 256 / Short.toInt(timerMax));
          let dutyByte: byte = Short.toByte(scaled);
          expect(dutyByte).assertEqual(expectedDuty[i]);
        }
      }

      {
        let runPairs: short[] = [3 as short, 65 as short, 2 as short, 66 as short];
        let decoded: byte[] = [];
        let pairCount: int = runPairs.length / 2;
        for (let i: int = 0; i < pairCount; i++) {
          let repeat: int = Short.toInt(runPairs[i * 2]);
          let valueByte: byte = Short.toByte(runPairs[i * 2 + 1]);
          for (let j: int = 0; j < repeat; j++) {
            decoded.push(valueByte);
          }
        }
        expect(decoded.length).assertEqual(5);
        expect(decoded[0]).assertEqual(65 as byte);
        expect(decoded[2]).assertEqual(65 as byte);
        expect(decoded[3]).assertEqual(66 as byte);
        expect(Byte.toInt(decoded[4])).assertEqual(66);
      }

      {
        let values: short[] = [50 as short, 110 as short, 300 as short, (-50) as short, (-150) as short];
        let threshold: byte = 100 as byte;
        let aboveCount: int = 0;
        let belowCount: int = 0;
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          let b: byte = Short.toByte(values[i]);
          if (b > threshold) {
            aboveCount++;
          } else {
            belowCount++;
          }
        }
        expect(aboveCount).assertEqual(2);
        expect(belowCount).assertEqual(3);
      }

      {
        let highByte: byte = 0x12 as byte;
        let lowByte: byte = 0x34 as byte;
        let bigEndian: short = Int.toShort((Short.toInt(Short.toShort(highByte)) << 8) | (Short.toInt(Short.toShort(lowByte)) & 0xFF));
        let littleEndian: short = Int.toShort((Short.toInt(Short.toShort(lowByte)) << 8) | (Short.toInt(Short.toShort(highByte)) & 0xFF));
        let beLowByte: byte = Short.toByte(bigEndian);
        let leLowByte: byte = Short.toByte(littleEndian);
        expect(beLowByte).assertEqual(lowByte);
        expect(leLowByte).assertEqual(highByte);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOBYTE_0700
     * @tc.name testShortToByte_merged7
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toByte, including type conversion, equality consistency, business scenarios, negative values, and algebraic properties.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToByte_merged7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let viaInt: short = Int.toShort(300);
        let viaDouble: short = Double.toShort(300.0);
        let viaLong: short = Long.toShort(Long.toLong(300));
        expect(Short.toByte(viaInt)).assertEqual(44 as byte);
        expect(Short.toByte(viaDouble)).assertEqual(44 as byte);
        expect(Short.toByte(viaLong)).assertEqual(44 as byte);
  
        viaInt = Int.toShort(-128);
        viaDouble = Double.toShort(-128.0);
        viaLong = Long.toShort(Long.toLong(-128));
        expect(Short.toByte(viaInt)).assertEqual((-128) as byte);
        expect(Short.toByte(viaDouble)).assertEqual((-128) as byte);
        expect(Short.toByte(viaLong)).assertEqual((-128) as byte);
  
        viaInt = Int.toShort(32767);
        viaDouble = Double.toShort(32767.0);
        viaLong = Long.toShort(Long.toLong(32767));
        expect(Short.toByte(viaInt)).assertEqual((-1) as byte);
        expect(Short.toByte(viaDouble)).assertEqual((-1) as byte);
        expect(Short.toByte(viaLong)).assertEqual((-1) as byte);
  
        viaInt = Int.toShort(50000);
        viaDouble = Double.toShort(50000.0);
        viaLong = Long.toShort(Long.toLong(50000));
        expect(Short.toByte(viaInt)).assertEqual(80 as byte);
        expect(Short.toByte(viaDouble)).assertEqual(80 as byte);
        expect(Short.toByte(viaLong)).assertEqual(80 as byte);
      }

      {
        let baseValues: short[] = [(-128) as short, (-64) as short, (-1) as short, 0 as short, 1 as short, 64 as short, 127 as short, 128 as short];
        let count: int = 8;
        for (let i: int = 0; i < count; i++) {
          let base: short = baseValues[i];
          let shifted: short = Int.toShort(Short.toInt(base) + 256);
          expect(Short.toByte(base)).assertEqual(Short.toByte(shifted));
        }
        let nonPeriod: short = 0 as short;
        let nonPeriodShifted: short = Int.toShort(Short.toInt(nonPeriod) + 128);
        expect(Short.toByte(nonPeriod)).assertEqual(0 as byte);
        expect(Short.toByte(nonPeriodShifted)).assertEqual((-128) as byte);
        expect(Short.toByte(nonPeriod) !== Short.toByte(nonPeriodShifted)).assertTrue();
      }

      {
        let values: short[] = [(-300) as short, (-129) as short, (-128) as short, (-1) as short, 0 as short, 127 as short, 128 as short, 255 as short, 300 as short];
        let count: int = 9;
        for (let i: int = 0; i < count; i++) {
          let v: short = values[i];
          let vInt: int = Short.toInt(v);
          let expectedByte: byte = Int.toByte(((vInt % 256) + 256) % 256 - ((vInt % 256) > 127 ? 256 : 0));
          let actual: byte = Short.toByte(v);
          expect(actual).assertEqual(expectedByte);
        }
      }

      {
        let values: short[] = [(-128) as short, (-1) as short, 0 as short, 127 as short, (-129) as short, 128 as short];
        let count: int = 6;
        for (let i: int = 0; i < count; i++) {
          let v: short = values[i];
          let b: byte = Short.toByte(v);
          let bSigned: int = Byte.toInt(b);
          let unsigned: int = bSigned < 0 ? bSigned + 256 : bSigned;
          let expectedLower8: int = Short.toInt(v) & 0xFF;
          expect(unsigned).assertEqual(expectedLower8);
        }
      }

      {
        let frequency: int[] = Array.create<int>(256, 0);
        for (let i: int = 0; i < 65536; i++) {
          let v: short = Int.toShort(i - 32768);
          let b: int = Byte.toInt(Short.toByte(v));
          frequency[b + 128]++;
        }
        for (let j: int = 0; j < 256; j++) {
          expect(frequency[j]).assertEqual(256);
        }
      }

      {
        let seed: int = 12345;
        let allMatch: boolean = true;
        for (let i: int = 0; i < 1000; i++) {
          seed = (seed * 1103515245 + 12345) & 0x7FFFFFFF;
          let v: short = Int.toShort(seed);
          let boxed: Short = new Short(v);
          let instanceResult: byte = boxed.toByte();
          let staticResult: byte = Short.toByte(v);
          if (instanceResult !== staticResult) {
            allMatch = false;
          }
        }
        expect(allMatch).assertTrue();
      }

      {
        let original: Short = new Short(200 as short);
        let copy: Short = new Short(original.toShort());
        expect(copy.toByte()).assertEqual(original.toByte());
        expect(copy.toShort()).assertEqual(original.toShort());
        let parsedVal: short = Short.parseInt("200", 10);
        let parsedShort: Short = new Short(parsedVal);
        let literalShort: Short = new Short(200 as short);
        expect(parsedShort.toByte()).assertEqual(literalShort.toByte());
        expect(parsedShort.toShort()).assertEqual(literalShort.toShort());
      }

      {
        expect(Short.toByte(42 as short)).assertEqual(42 as byte);
        expect(Short.toByte((-100) as short)).assertEqual((-100) as byte);
        expect(Short.toByte(200 as short)).assertEqual((-56) as byte);
      }

      {
        let viaLiteral: Short = new Short(100 as short);
        let viaParseInt: Short = new Short(Short.parseInt("100", 10));
        let viaCopy: Short = new Short(viaLiteral.toShort());
        let viaIntConversion: Short = new Short(Int.toShort(100));
        expect(viaLiteral.toByte()).assertEqual(100 as byte);
        expect(viaParseInt.toByte()).assertEqual(viaLiteral.toByte());
        expect(viaCopy.toByte()).assertEqual(viaLiteral.toByte());
        expect(viaIntConversion.toByte()).assertEqual(viaLiteral.toByte());
      }

      {
        let val: short = 0x1234 as short;
        let s: Short = new Short(val);
        let byteArray: byte[] = [0 as byte, 0 as byte];
        byteArray[0] = Int.toByte((s.toInt() >> 8) & 0xFF);
        byteArray[1] = s.toByte();
        expect(byteArray[0]).assertEqual(0x12 as byte);
        expect(byteArray[1]).assertEqual(0x34 as byte);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOBYTE_0800
     * @tc.name testShortToByte_merged8
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toByte, including type conversion, business scenarios, round-trip conversion, radix conversion, and comparison and ordering.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToByte_merged8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let val: short = 0x4A3F as short;
        let s: Short = new Short(val);
        let hi: int = (s.toInt() >> 8) & 0xFF;
        let lo: int = s.toInt() & 0xFF;
        let group1: byte = Int.toByte(hi >> 2);
        let group2: byte = Int.toByte(((hi & 0x03) << 4) | (lo >> 4));
        let group3: byte = Int.toByte((lo & 0x0F) << 2);
        expect(group1).assertEqual(Int.toByte(0x4A >> 2));
        expect(group2).assertEqual(Int.toByte(((0x4A & 0x03) << 4) | (0x3F >> 4)));
        expect(group3).assertEqual(Int.toByte((0x3F & 0x0F) << 2));
      }

      {
        let rotateSource: short = 0x96 as short;
        let sourceByte: byte = Short.toByte(rotateSource);
        let rotatedLeft: byte = Int.toByte(((Byte.toInt(sourceByte) << 1) & 0xFF) | ((Byte.toInt(sourceByte) >> 7) & 0x01));
        expect(rotatedLeft).assertEqual(Int.toByte(0x2D));
        let rotatedBack: byte = Int.toByte(((Byte.toInt(rotatedLeft) >> 1) & 0x7F) | ((Byte.toInt(rotatedLeft) << 7) & 0x80));
        expect(rotatedBack).assertEqual(sourceByte);
      }

      {
        let byteA: byte = Short.toByte(0xB5 as short);
        let byteB: byte = Short.toByte(0x9C as short);
        let diffBits: int = (Byte.toInt(byteA) & 0xFF) ^ (Byte.toInt(byteB) & 0xFF);
        let distance: int = 0;
        for (let bit: int = 0; bit < 8; bit++) {
          if ((diffBits & (1 << bit)) !== 0) {
            distance = distance + 1;
          }
        }
        expect(distance).assertEqual(3);
      }

      {
        let lowValue: short = 0x0F as short;
        let sourceByte: byte = Short.toByte(lowValue);
        let spread: int = 0;
        for (let bit: int = 0; bit < 8; bit++) {
          if ((Byte.toInt(sourceByte) & (1 << bit)) !== 0) {
            spread = spread | (1 << (bit * 2));
          }
        }
        expect(spread).assertEqual(0x0055);
      }

      {
        let index: short = 0x53 as short;
        let s: Short = new Short(index);
        let sboxIdx: byte = s.toByte();
        expect(sboxIdx).assertEqual(0x53 as byte);
        let sboxVal: byte = Int.toByte(0xED);
        let sboxIdxUnsigned: int = Byte.toInt(sboxIdx) & 0xFF;
        expect(sboxIdxUnsigned).assertEqual(0x53);
        expect(Byte.toInt(sboxVal)).assertEqual((-19));
      }

      {
        let values: short[] = [
          0 as short, 1 as short, 2 as short, 3 as short, 42 as short, 43 as short,
          100 as short, 127 as short, 128 as short, 129 as short, 200 as short, 255 as short,
          256 as short, 257 as short,
          (-1) as short, (-2) as short, (-128) as short, (-129) as short, (-256) as short,
          Short.MAX_VALUE, Short.MIN_VALUE
        ];
        let count: int = 21;
        for (let i: int = 0; i < count; i++) {
          let v: short = values[i];
          let b: byte = Short.toByte(v);
          let vParity: int = Short.toInt(v) & 1;
          let bParity: int = Byte.toInt(b) & 1;
          expect(vParity).assertEqual(bParity);
        }
      }

      {
        let values: short[] = [
          0 as short, 1 as short, 42 as short, 127 as short,
          (-1) as short, (-128) as short, 255 as short, 256 as short,
          0x4A3F as short, Short.MAX_VALUE, Short.MIN_VALUE
        ];
        let count: int = 11;
        for (let i: int = 0; i < count; i++) {
          let v: short = values[i];
          let notV: short = Int.toShort(~Short.toInt(v));
          let toByteOfNot: byte = Short.toByte(notV);
          let notOfToByte: byte = Int.toByte(~Byte.toInt(Short.toByte(v)));
          expect(toByteOfNot).assertEqual(notOfToByte);
        }
      }

      {
        let sampleCount: int = 0;
        let passCount: int = 0;
        for (let v: int = 0; v <= 127; v++) {
          let sv: short = Int.toShort(v);
          let b: byte = Short.toByte(sv);
          let restored: short = Byte.toShort(b);
          sampleCount++;
          if (restored == sv) {
            passCount++;
          }
        }
        expect(sampleCount).assertEqual(128);
        expect(passCount).assertEqual(128);
      }

      {
        let passCount: int = 0;
        for (let v: int = -128; v <= -1; v++) {
          let sv: short = Int.toShort(v);
          let b: byte = Short.toByte(sv);
          let restored: short = Byte.toShort(b);
          if (Short.toInt(restored) == v) {
            passCount++;
          }
        }
        expect(passCount).assertEqual(128);
      }

      {
        let expectedBytes: byte[] = [
          1 as byte, 2 as byte, 4 as byte, 8 as byte, 16 as byte,
          32 as byte, 64 as byte, (-128) as byte, 0 as byte,
          0 as byte, 0 as byte, 0 as byte, 0 as byte, 0 as byte, 0 as byte
        ];
        let pow2: short = 1 as short;
        for (let k: int = 0; k < 15; k++) {
          expect(Short.toByte(pow2)).assertEqual(expectedBytes[k]);
          pow2 = Int.toShort(pow2 * 2);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOBYTE_0900
     * @tc.name testShortToByte_merged9
     * @tc.desc RadixConversion / Idempotent: covers 10 merged test points for Short.toByte, including type conversion, business scenarios, radix conversion, equality consistency, and fractions and rounding.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToByte_merged9', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let literalShort: Short = new Short(0 as short);
        let parsedDecShort: Short = new Short(Short.parseInt("0", 10));
        let parsedHexShort: Short = new Short(Short.parseInt("0", 16));
        expect(literalShort.toByte()).assertEqual(0 as byte);
        expect(parsedDecShort.toByte()).assertEqual(0 as byte);
        expect(parsedHexShort.toByte()).assertEqual(0 as byte);
        expect(literalShort.toByte()).assertEqual(Short.toByte(0 as short));
        expect(parsedDecShort.toByte()).assertEqual(Short.toByte(Short.parseInt("0", 10)));
        expect(parsedHexShort.toByte()).assertEqual(Short.toByte(Short.parseInt("0", 16)));
        expect(literalShort.toShort()).assertEqual(0 as short);
        expect(parsedDecShort.toShort()).assertEqual(0 as short);
        expect(parsedHexShort.toShort()).assertEqual(0 as short);
      }

      {
        let hexZero: short = 0x00 as short;
        let hexMax: short = 0x7F as short;
        let hexOverflow: short = 0x80 as short;
        let hexNegative: short = 0xFF as short;
        expect(Short.toByte(hexZero)).assertEqual(0 as byte);
        expect(Short.toByte(hexMax)).assertEqual(127 as byte);
        expect(Short.toByte(hexOverflow)).assertEqual((-128) as byte);
        expect(Short.toByte(hexNegative)).assertEqual((-1) as byte);
        let val1: short = 0x0100 as short;
        let val2: short = 0x01FF as short;
        let val3: short = 0x0200 as short;
        expect(Short.toByte(val1)).assertEqual(0 as byte);
        expect(Short.toByte(val2)).assertEqual((-1) as byte);
        expect(Short.toByte(val3)).assertEqual(0 as byte);
      }

      {
        let octalVal: short = Short.parseInt("377", 8);
        let boxed: Short = new Short(octalVal);
        expect(octalVal).assertEqual(255 as short);
        expect(boxed.toByte()).assertEqual((-1) as byte);
        expect(Short.toByte(octalVal)).assertEqual((-1) as byte);
        expect(boxed.toShort()).assertEqual(255 as short);
      }

      {
        let decimalValue: short = 12345 as short;
        let lowDigit: short = Int.toShort(Short.toInt(decimalValue) % 100);
        let highDigit: short = Int.toShort(Short.toInt(decimalValue) / 100);
        let lowByte: byte = Short.toByte(lowDigit);
        let highByte: byte = Short.toByte(highDigit);
        expect(lowByte).assertEqual(45 as byte);
        expect(highByte).assertEqual(123 as byte);
      }

      {
        let val: short = 0xAB as short;
        let s: Short = new Short(val);
        let b: byte = s.toByte();
        let bUnsigned: int = Byte.toInt(b) & 0xFF;
        let highNibble: int = (bUnsigned >> 4) & 0x0F;
        let lowNibble: int = bUnsigned & 0x0F;
        expect(highNibble).assertEqual(0x0A);
        expect(lowNibble).assertEqual(0x0B);
      }

      {
        let repeatedInputValue: short = 100 as short;
        let zeroValue: short = 0 as short;
        let maxByteBoundary: short = 127 as short;
        let minByteBoundary: short = (-128) as short;
        let firstRepeatedResult: byte = Short.toByte(repeatedInputValue);
        let secondRepeatedResult: byte = Short.toByte(repeatedInputValue);
        let zeroResult: byte = Short.toByte(zeroValue);
        let maxBoundaryResult: byte = Short.toByte(maxByteBoundary);
        let minBoundaryResult: byte = Short.toByte(minByteBoundary);
        expect(firstRepeatedResult).assertEqual(100 as byte);
        expect(secondRepeatedResult).assertEqual(100 as byte);
        expect(firstRepeatedResult).assertEqual(secondRepeatedResult);
        expect(zeroResult).assertEqual(0 as byte);
        expect(maxBoundaryResult).assertEqual(127 as byte);
        expect(minBoundaryResult).assertEqual((-128) as byte);
      }

      {
        let baseResult: byte = Short.toByte(42 as short);
        expect(baseResult).assertEqual(42 as byte);
        Short.toByte(128 as short);
        Short.toByte((-129) as short);
        Short.toByte(Short.MAX_VALUE);
        let afterResult: byte = Short.toByte(42 as short);
        expect(afterResult).assertEqual(42 as byte);
        expect(baseResult).assertEqual(afterResult);
      }

      {
        let testValues: short[] = [(-300) as short, (-150) as short, 0 as short, 150 as short, 300 as short, 512 as short];
        let expectedValues: byte[] = [(-44) as byte, 106 as byte, 0 as byte, (-106) as byte, 44 as byte, 0 as byte];
        let count: int = 6;
        for (let i: int = 0; i < count; i++) {
          expect(Short.toByte(testValues[i])).assertEqual(expectedValues[i]);
        }
      }

      {
        let hexParsed: short = Short.parseInt("FF", 16);
        let binParsed: short = Short.parseInt("11111111", 2);
        let hexBoxed: Short = new Short(hexParsed);
        let binBoxed: Short = new Short(binParsed);
        expect(hexBoxed.toByte()).assertEqual((-1) as byte);
        expect(binBoxed.toByte()).assertEqual((-1) as byte);
        expect(hexBoxed.toByte()).assertEqual(Short.toByte(hexParsed));
        expect(binBoxed.toByte()).assertEqual(Short.toByte(binParsed));
        expect(hexBoxed.toShort()).assertEqual(255 as short);
        expect(binBoxed.toShort()).assertEqual(255 as short);
        let octalParsed: short = Short.parseInt("377", 8);
        let octalBoxed: Short = new Short(octalParsed);
        expect(octalBoxed.toByte()).assertEqual((-1) as byte);
      }

      {
        let testVals: short[] = [(-128) as short, (-1) as short, 0 as short, 1 as short, 127 as short];
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          let originalByte: byte = Short.toByte(testVals[i]);
          let asShort: short = Short.toShort(originalByte);
          let asLong: long = Short.toLong(asShort);
          let backToByte: byte = Int.toByte(asLong.toInt());
          expect(backToByte).assertEqual(originalByte);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOBYTE_1000
     * @tc.name testShortToByte_merged10
     * @tc.desc Idempotent / BusinessScenario: covers 10 merged test points for Short.toByte, including business scenarios, loop accumulation, type conversion, byte structure, and positive values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToByte_merged10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let negCount: int = 0;
        let posCount: int = 0;
        let step: int = 64;
        let totalPositive: int = 0;
        for (let v: int = 0; v <= Short.toInt(Short.MAX_VALUE); v += step) {
          let sv: short = Int.toShort(v);
          let b: byte = Short.toByte(sv);
          totalPositive++;
          if (b < 0) {
            negCount++;
          } else {
            posCount++;
          }
        }
        expect(Math.abs(negCount - posCount) <= 2).assertTrue();
        expect(Short.toByte(128 as short)).assertEqual((-128) as byte);
        expect(Short.toByte(127 as short)).assertEqual(127 as byte);
        expect(Short.toByte(256 as short)).assertEqual(0 as byte);
      }

      {
        let v: Short = new Short(0x4A3F as short);
        let originalByte: byte = v.toByte();
        let hex: string = v.toString(16);
        let restored: Short = new Short(Short.parseInt(hex, 16));
        expect(restored.toByte()).assertEqual(originalByte);
      }

      {
        let base: short = 100 as short;
        let accumulator: int = base;
        let expected: byte = Short.toByte(base);
        let iterations: int = 0;
        while (iterations < 20) {
          accumulator = accumulator + 256;
          let current: short = Int.toShort(accumulator);
          expect(Short.toByte(current)).assertEqual(expected);
          iterations++;
        }
        expect(iterations).assertEqual(20);
      }

      {
        let data: short[] = [0x48 as short, 0x65 as short, 0x6C as short, 0x6C as short, 0x6F as short];
        let sum: int = 0;
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          sum = sum + Short.toInt(data[i]);
        }
        let sumShort: short = Int.toShort(sum);
        let checksum: byte = Short.toByte(sumShort);
        let expectedSum: int = 0x48 + 0x65 + 0x6C + 0x6C + 0x6F;
        expect(checksum).assertEqual(Int.toByte(expectedSum & 0xFF));
      }

      {
        let sample16bit: short = 0x3A7F as short;
        let highByte: byte = Int.toByte((Short.toInt(sample16bit) >> 8) & 0xFF);
        let lowByte: byte = Short.toByte(sample16bit);
        expect(highByte).assertEqual(0x3A as byte);
        expect(lowByte).assertEqual(0x7F as byte);
        expect(Short.toShort(highByte)).assertEqual(0x3A as short);
        expect(Short.toShort(lowByte)).assertEqual(127 as short);
      }

      {
        let addresses: short[] = [0x1400 as short, 0x1480 as short, 0x14FF as short, 0x1500 as short, 0x157F as short];
        let expectedOffsets: byte[] = [0 as byte, (-128) as byte, (-1) as byte, 0 as byte, 127 as byte];
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          let offset: byte = Short.toByte(addresses[i]);
          expect(offset).assertEqual(expectedOffsets[i]);
        }
      }

      {
        let codeUnit: short = 0x4E2D as short;
        let s: Short = new Short(codeUnit);
        let trailByte: byte = s.toByte();
        let leadByte: byte = Int.toByte(s.toInt() / 256);
        expect(trailByte).assertEqual(0x2D as byte);
        expect(leadByte).assertEqual(0x4E as byte);
      }

      {
        let glyphData: short = 0x3C7E as short;
        let s: Short = new Short(glyphData);
        let upperRow: int = (s.toInt() >> 8) & 0xFF;
        let glyphByte: byte = s.toByte();
        let lowerRow: int = Byte.toInt(glyphByte) & 0xFF;
        let upperLitPixels: int = 0;
        let lowerLitPixels: int = 0;
        for (let bit: int = 0; bit < 8; bit++) {
          if ((upperRow & (1 << bit)) !== 0) {
            upperLitPixels = upperLitPixels + 1;
          }
          if ((lowerRow & (1 << bit)) !== 0) {
            lowerLitPixels = lowerLitPixels + 1;
          }
        }
        expect(upperLitPixels).assertEqual(4);
        expect(lowerLitPixels).assertEqual(6);
        expect(upperLitPixels + lowerLitPixels).assertEqual(10);
      }

      {
        let firstRegister: short = 0x0F3C as short;
        let nextRegister: short = 0x0F3D as short;
        let firstReg: Short = new Short(firstRegister);
        let nextReg: Short = new Short(nextRegister);
        expect(firstReg.toByte()).assertEqual(0x3C as byte);
        expect(nextReg.toByte()).assertEqual(0x3D as byte);
        let firstPage: int = (firstReg.toInt() >> 8) & 0xFF;
        let nextPage: int = (nextReg.toInt() >> 8) & 0xFF;
        expect(firstPage).assertEqual(nextPage);
        expect(firstPage).assertEqual(0x0F);
      }

      {
        let payload: short[] = [0x12 as short, 0x34 as short, 0x56 as short, 0x78 as short];
        let runningSum: int = 0;
        let runningTotal: int = 0;
        for (let i: int = 0; i < payload.length; i++) {
          let dataByte: int = Byte.toInt(Short.toByte(payload[i])) & 0xFF;
          runningSum = (runningSum + dataByte) % 255;
          runningTotal = (runningTotal + runningSum) % 255;
        }
        expect(runningSum).assertEqual(21);
        expect(runningTotal).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOBYTE_1100
     * @tc.name testShortToByte_merged11
     * @tc.desc BusinessScenario: covers 9 merged test points for Short.toByte, including business scenarios, type conversion, bitwise operations, sign handling, and boundary values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToByte_merged11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dimmerVal: short = 32767 as short;
        let s: Short = new Short(dimmerVal);
        let scaled: short = Int.toShort(s.toInt() * 255 / 32767);
        let dmxByte: byte = Short.toByte(scaled);
        expect(dmxByte).assertEqual((-1) as byte);
      }

      {
        let dutyShort: short = 180 as short;
        let s: Short = new Short(dutyShort);
        let pwmByte: byte = s.toByte();
        expect(pwmByte).assertEqual((-76) as byte);
      }

      {
        let eepromVal: short = Int.toShort(0xBEEF);
        let s: Short = new Short(eepromVal);
        let byteLow: byte = s.toByte();
        let byteHigh: byte = Int.toByte((s.toInt() >> 8) & 0xFF);
        expect(byteLow).assertEqual(Int.toByte(0xEF));
        expect(byteHigh).assertEqual(Int.toByte(0xBE));
      }

      {
        let field1: Short = new Short(0x1234 as short);
        let field2: Short = new Short(0x5678 as short);
        let xorResult: int = Byte.toInt(Int.toByte((field1.toInt() >> 8) & 0xFF));
        xorResult = xorResult ^ Byte.toInt(field1.toByte());
        xorResult = xorResult ^ Byte.toInt(Int.toByte((field2.toInt() >> 8) & 0xFF));
        xorResult = xorResult ^ Byte.toInt(field2.toByte());
        let expected: int = 0x12 ^ 0x34 ^ 0x56 ^ 0x78;
        expect(xorResult).assertEqual(expected);
      }

      {
        let negativeByte: byte = Short.toByte((-100) as short);
        let magnitude: int = 0 - Byte.toInt(negativeByte);
        let signMagnitude: int = magnitude | 0x80;
        expect(signMagnitude).assertEqual(0xE4);
        let magnitudeBits: int = signMagnitude & 0x7F;
        let restored: byte = (signMagnitude & 0x80) !== 0 ? Int.toByte(-magnitudeBits) : Int.toByte(magnitudeBits);
        expect(restored).assertEqual(negativeByte);
      }

      {
        let rgb565: short = Int.toShort(0xF81F);
        let s: Short = new Short(rgb565);
        let highByte: byte = Int.toByte((s.toInt() >> 8) & 0xFF);
        let lowByte: byte = s.toByte();
        expect(highByte).assertEqual(Int.toByte(0xF8));
        expect(lowByte).assertEqual(Int.toByte(0x1F));
        let blueExtract: int = Byte.toInt(lowByte) & 0x1F;
        expect(blueExtract).assertEqual(0x1F);
      }

      {
        let audioFormat: short = 1 as short;
        let numChannels: short = 2 as short;
        let fmtByte: byte = Short.toByte(audioFormat);
        let chByte: byte = Short.toByte(numChannels);
        expect(fmtByte).assertEqual(1 as byte);
        expect(chByte).assertEqual(2 as byte);
        let fmtLE: byte[] = [fmtByte, 0 as byte];
        let chLE: byte[] = [chByte, 0 as byte];
        expect(fmtLE[0]).assertEqual(1 as byte);
        expect(chLE[0]).assertEqual(2 as byte);
      }

      {
        let windowData: short[] = [5 as short, 100 as short, 200 as short, 60 as short, 90 as short];
        let windowSize: int = 3;
        let windowMax: int[] = [];
        for (let i: int = 0; i + windowSize <= windowData.length; i++) {
          let currentMax: int = Byte.toInt(Short.toByte(windowData[i]));
          for (let j: int = i + 1; j < i + windowSize; j++) {
            let candidate: int = Byte.toInt(Short.toByte(windowData[j]));
            if (candidate > currentMax) {
              currentMax = candidate;
            }
          }
          windowMax.push(currentMax);
        }
        expect(windowMax.length).assertEqual(3);
        expect(windowMax[0]).assertEqual(100);
        expect(windowMax[1]).assertEqual(100);
        expect(windowMax[2]).assertEqual(90);
      }

      {
        let ipField: short = 0x4500 as short;
        let s: Short = new Short(ipField);
        let highByte: int = Byte.toInt(Int.toByte((s.toInt() >> 8) & 0xFF)) & 0xFF;
        let lowByte: int = Byte.toInt(s.toByte()) & 0xFF;
        let word: int = (highByte << 8) | lowByte;
        expect(word).assertEqual(0x4500);
      }
    });

  });
}