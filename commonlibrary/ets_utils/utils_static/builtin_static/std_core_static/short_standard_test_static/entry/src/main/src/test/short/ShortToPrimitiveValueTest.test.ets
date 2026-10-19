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

class PrimitiveValues {
  byteVal: byte;
  intVal: int;
  floatVal: float;
  constructor(byteVal: byte, intVal: int, floatVal: float) {
    this.byteVal = byteVal;
    this.intVal = intVal;
    this.floatVal = floatVal;
  }
}

export default function shortToPrimitiveValueTest(): void {
  describe('ShortToPrimitiveValueTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOPRIMITIVEVALUE_0100
     * @tc.name testShortToPrimitiveValue_merged1
     * @tc.desc BasicValue / BoundaryOverflow: covers 10 merged test points for Short.toPrimitiveValue, including type conversion, business scenarios, boundary values, positive values, and negative values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToPrimitiveValue_merged1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let zeroInstance: Short = new Short(0 as short);
        expect(zeroInstance.toByte()).assertEqual(0 as byte);
        expect(zeroInstance.toShort()).assertEqual(0 as short);
        expect(zeroInstance.toInt()).assertEqual(0);
        expect(zeroInstance.toLong()).assertEqual(Long.toLong(0));
        expect(zeroInstance.toFloat()).assertEqual(0.0f);
        expect(zeroInstance.toDouble()).assertEqual(0.0);
        expect(zeroInstance.toChar()).assertEqual(c'\u0000');
      }

      {
        let boxedValue: Short = new Short(42 as short);
        let byteResult: byte = boxedValue.toByte();
        let shortResult: short = boxedValue.toShort();
        let intResult: int = boxedValue.toInt();
        let longResult: long = boxedValue.toLong();
        let floatResult: float = boxedValue.toFloat();
        let doubleResult: double = boxedValue.toDouble();
        let charResult: char = boxedValue.toChar();
        expect(byteResult).assertEqual(42 as byte);
        expect(shortResult).assertEqual(42 as short);
        expect(intResult).assertEqual(42);
        expect(longResult).assertEqual(Long.toLong(42));
        expect(floatResult).assertEqual(42.0f);
        expect(doubleResult).assertEqual(42.0);
        expect(charResult).assertEqual(c'*');
      }

      {
        let boxedValue: Short = new Short((-1) as short);
        let byteResult: byte = boxedValue.toByte();
        let shortResult: short = boxedValue.toShort();
        let intResult: int = boxedValue.toInt();
        let longResult: long = boxedValue.toLong();
        let floatResult: float = boxedValue.toFloat();
        let doubleResult: double = boxedValue.toDouble();
        let charResult: char = boxedValue.toChar();
        expect(byteResult).assertEqual((-1) as byte);
        expect(shortResult).assertEqual((-1) as short);
        expect(intResult).assertEqual(-1);
        expect(longResult).assertEqual(Long.toLong(-1));
        expect(floatResult).assertEqual((-1.0f));
        expect(doubleResult).assertEqual((-1.0));
        expect(charResult).assertEqual(c'\uFFFF');
      }

      {
        let testPairs: short[][] = [
          [1 as short, (-1) as short],
          [100 as short, (-100) as short],
          [500 as short, (-500) as short],
          [2000 as short, (-2000) as short],
          [32767 as short, (-32768) as short]
        ];
        let pairCount: int = 5;
        for (let pairIndex: int = 0; pairIndex < pairCount; pairIndex++) {
          let posShort: short = testPairs[pairIndex][0];
          let negShort: short = testPairs[pairIndex][1];
          let posInstance: Short = new Short(posShort);
          let negInstance: Short = new Short(negShort);
          expect(posInstance.toInt()).assertEqual(Short.toInt(posShort));
          expect(negInstance.toInt()).assertEqual(Short.toInt(negShort));
          expect(posInstance.toLong()).assertEqual(Short.toLong(posShort));
          expect(negInstance.toLong()).assertEqual(Short.toLong(negShort));
          expect(posInstance.toFloat()).assertEqual(Short.toFloat(posShort));
          expect(negInstance.toFloat()).assertEqual(Short.toFloat(negShort));
          expect(posInstance.toDouble()).assertEqual(Short.toDouble(posShort));
          expect(negInstance.toDouble()).assertEqual(Short.toDouble(negShort));
        }
      }

      {
        let testValues: short[] = [
          0 as short, 1 as short, 65 as short, 255 as short,
          0x0100 as short, 0x4E00 as short, 0x7FFF as short,
          (-1) as short, (-32768) as short
        ];
        let caseCount: int = testValues.length;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let boxedValue: Short = new Short(testValues[caseIndex]);
          let charValue: char = boxedValue.toChar();
          let restoredShort: short = Char.toShort(charValue);
          expect(restoredShort).assertEqual(testValues[caseIndex]);
        }
      }

      {
        let testValues: short[] = [
          0 as short,
          42 as short,
          (-15) as short,
          Short.MAX_VALUE,
          Short.MIN_VALUE
        ];
        let expectedValues: long[] = [
          Long.toLong(0),
          Long.toLong(42),
          Long.toLong(-15),
          Long.toLong(32767),
          Long.toLong(-32768)
        ];
        let caseCount: int = 5;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let boxedValue: Short = new Short(testValues[caseIndex]);
          let actualResult: long = boxedValue.toLong();
          expect(actualResult).assertEqual(expectedValues[caseIndex]);
        }
      }

      {
        let boxedValue: Short = new Short(Short.MAX_VALUE);
        expect(boxedValue.toByte()).assertEqual((-1) as byte);
        expect(boxedValue.toShort()).assertEqual(32767 as short);
        expect(boxedValue.toInt()).assertEqual(32767);
        expect(boxedValue.toLong()).assertEqual(Long.toLong(32767));
        expect(boxedValue.toFloat()).assertEqual(32767.0f);
        expect(boxedValue.toDouble()).assertEqual(32767.0);
        expect(boxedValue.toChar()).assertEqual(c'\u7FFF');
      }

      {
        let boxedValue: Short = new Short(Short.MIN_VALUE);
        expect(boxedValue.toByte()).assertEqual(0 as byte);
        expect(boxedValue.toShort()).assertEqual((-32768) as short);
        expect(boxedValue.toInt()).assertEqual(-32768);
        expect(boxedValue.toLong()).assertEqual(Long.toLong(-32768));
        expect(boxedValue.toFloat()).assertEqual((-32768.0f));
        expect(boxedValue.toDouble()).assertEqual((-32768.0));
        expect(boxedValue.toChar()).assertEqual(c'\u8000');
      }

      {
        let adjMaxInstance: Short = new Short(32766 as short);
        let adjMinInstance: Short = new Short((-32767) as short);
        expect(adjMaxInstance.toByte()).assertEqual((-2) as byte);
        expect(adjMaxInstance.toShort()).assertEqual(32766 as short);
        expect(adjMaxInstance.toInt()).assertEqual(32766);
        expect(adjMaxInstance.toLong()).assertEqual(Long.toLong(32766));
        expect(adjMaxInstance.toFloat()).assertEqual(32766.0f);
        expect(adjMaxInstance.toDouble()).assertEqual(32766.0);
        expect(adjMaxInstance.toChar()).assertEqual(c'\u7FFE');
        expect(adjMinInstance.toByte()).assertEqual(1 as byte);
        expect(adjMinInstance.toShort()).assertEqual((-32767) as short);
        expect(adjMinInstance.toInt()).assertEqual(-32767);
        expect(adjMinInstance.toLong()).assertEqual(Long.toLong(-32767));
        expect(adjMinInstance.toFloat()).assertEqual((-32767.0f));
        expect(adjMinInstance.toDouble()).assertEqual((-32767.0));
        expect(adjMinInstance.toChar()).assertEqual(c'\u8001');
      }

      {
        let overflowValues: short[] = [
          128 as short, 255 as short, 256 as short, 257 as short,
          300 as short, 1000 as short, (-129) as short, (-200) as short,
          (-1000) as short
        ];
        let expectedBytes: byte[] = [
          (-128) as byte, (-1) as byte, 0 as byte, 1 as byte,
          44 as byte, (-24) as byte, 127 as byte, 56 as byte,
          24 as byte
        ];
        let caseCount: int = 9;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let boxedValue: Short = new Short(overflowValues[caseIndex]);
          expect(boxedValue.toByte()).assertEqual(expectedBytes[caseIndex]);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOPRIMITIVEVALUE_0200
     * @tc.name testShortToPrimitiveValue_merged2
     * @tc.desc BoundaryOverflow: covers 10 merged test points for Short.toPrimitiveValue, including type conversion, boundary values, wrapping, fractions and rounding, and containers and references.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToPrimitiveValue_merged2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let lowRangeValues: short[] = [0 as short, 100 as short, 1000 as short, 5000 as short, 10000 as short, 20000 as short, 30000 as short, 32767 as short];
        let highRangeValues: short[] = [(-1) as short, (-100) as short, (-1000) as short, (-5000) as short, (-10000) as short, (-20000) as short, (-30000) as short, (-32768) as short];
        let lowExpectedChars: char[] = [c'\u0000', c'\u0064', c'\u03E8', c'\u1388', c'\u2710', c'\u4E20', c'\u7530', c'\u7FFF'];
        let highExpectedChars: char[] = [c'\uFFFF', c'\uFF9C', c'\uFC18', c'\uEC78', c'\uD8F0', c'\uB1E0', c'\u8AD0', c'\u8000'];
        let lowCount: int = 8;
        let highCount: int = 8;
        for (let idx: int = 0; idx < lowCount; idx++) {
          let boxedVal: Short = new Short(lowRangeValues[idx]);
          expect(boxedVal.toChar()).assertEqual(lowExpectedChars[idx]);
        }
        for (let idx: int = 0; idx < highCount; idx++) {
          let boxedVal: Short = new Short(highRangeValues[idx]);
          expect(boxedVal.toChar()).assertEqual(highExpectedChars[idx]);
        }
      }

      {
        let boxed1: Short = new Short((-1) as short);
        expect(boxed1.toFloat()).assertEqual((-1.0f));
        expect(boxed1.toDouble()).assertEqual((-1.0));
        let boxed2: Short = new Short((-100) as short);
        expect(boxed2.toFloat()).assertEqual((-100.0f));
        expect(boxed2.toDouble()).assertEqual((-100.0));
        let boxed3: Short = new Short((-500) as short);
        expect(boxed3.toFloat()).assertEqual((-500.0f));
        expect(boxed3.toDouble()).assertEqual((-500.0));
        let boxed4: Short = new Short((-2000) as short);
        expect(boxed4.toFloat()).assertEqual((-2000.0f));
        expect(boxed4.toDouble()).assertEqual((-2000.0));
        let boxed5: Short = new Short((-10000) as short);
        expect(boxed5.toFloat()).assertEqual((-10000.0f));
        expect(boxed5.toDouble()).assertEqual((-10000.0));
        let boxed6: Short = new Short(Short.MIN_VALUE);
        expect(boxed6.toFloat()).assertEqual((-32768.0f));
        expect(boxed6.toDouble()).assertEqual((-32768.0));
      }

      {
        let multiplesPlusZero: short[] = [0 as short, 256 as short, 512 as short, 768 as short];
        let multiplesPlus127: short[] = [127 as short, 383 as short, 639 as short, 895 as short];
        let multiplesPlus128: short[] = [128 as short, 384 as short, 640 as short, 896 as short];
        let multiplesPlus255: short[] = [255 as short, 511 as short, 767 as short, 1023 as short];
        let zeroResult: byte = 0 as byte;
        let c127Result: byte = 127 as byte;
        let c128Result: byte = (-128) as byte;
        let c255Result: byte = (-1) as byte;
        let groupSize: int = 4;
        for (let gi: int = 0; gi < groupSize; gi++) {
          expect(new Short(multiplesPlusZero[gi]).toByte()).assertEqual(zeroResult);
          expect(new Short(multiplesPlus127[gi]).toByte()).assertEqual(c127Result);
          expect(new Short(multiplesPlus128[gi]).toByte()).assertEqual(c128Result);
          expect(new Short(multiplesPlus255[gi]).toByte()).assertEqual(c255Result);
        }
      }

      {
        let boundaryNegValues: short[] = [(-1) as short, (-2) as short, (-127) as short, (-128) as short, (-129) as short, (-255) as short, (-256) as short, (-32767) as short, (-32768) as short];
        let expectedInts: int[] = [-1, -2, -127, -128, -129, -255, -256, -32767, -32768];
        let caseCount: int = 9;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let boxedValue: Short = new Short(boundaryNegValues[caseIndex]);
          expect(boxedValue.toInt()).assertEqual(expectedInts[caseIndex]);
        }
      }

      {
        let maxVal: Short = new Short(32767 as short);
        let minVal: Short = new Short(-32768 as short);
  
        let maxByte: byte = maxVal.toByte();
        let maxShort: short = maxVal.toShort();
        let maxInt: int = maxVal.toInt();
  
        expect(maxInt).assertEqual(32767);
        expect(maxShort.toInt()).assertEqual(32767);
        expect(maxByte).assertEqual(-1);
  
        let minByte: byte = minVal.toByte();
        let minShort: short = minVal.toShort();
        let minInt: int = minVal.toInt();
  
        expect(minInt).assertEqual(-32768);
        expect(minShort.toInt()).assertEqual(-32768);
        expect(minByte).assertEqual(0);
  
        expect(maxVal.toInt() + minVal.toInt()).assertEqual(-1);
      }

      {
        let a: Short = new Short(16000 as short);
        let b: Short = new Short(16000 as short);
  
        let sumShort: Short = a.add(b);
        let sumInt: int = sumShort.toInt();
        let sumLong: long = sumShort.toLong();
        let sumFloat: float = sumShort.toFloat();
  
        expect(sumInt).assertEqual(32000);
        expect(sumLong.toInt()).assertEqual(32000);
        expect(Math.abs(sumFloat - 32000.0) < 0.01).assertTrue();
  
        let mulShort: Short = a.mul(new Short(3 as short));
        let mulInt: int = mulShort.toInt();
        expect(mulInt).assertEqual(-17536);
      }

      {
        let testPoints: [int, int][] = [
          [0, 0], [127, 127], [128, -128], [255, -1],
          [256, 0], [257, 1], [-1, -1], [-128, -128], [-129, 127]
        ];
  
        for (let i: int = 0; i < testPoints.length; i++) {
          let input: int = testPoints[i][0];
          let expected: int = testPoints[i][1];
          let s: Short = new Short(Double.toShort(input));
          let b: byte = s.toByte();
          expect(b).assertEqual(expected);
        }
  
        let v256: Short = new Short(256 as short);
        let b256: byte = v256.toByte();
        let restored: Short = new Short(Int.toShort(b256));
        expect(restored.toInt()).assertEqual(0);
        expect(v256.equals(restored)).assertFalse();
      }

      {
        let sourceValues: Short[] = [
          new Short(0 as short), new Short(1 as short), new Short(-1 as short), new Short(256 as short)
        ];
  
        let byteSet: Set<byte> = new Set<byte>();
        let intSet: Set<int> = new Set<int>();
        let floatSet: Set<float> = new Set<float>();
        let charSet: Set<string> = new Set<string>();
  
        for (let v of sourceValues) {
          byteSet.add(v.toByte());
          intSet.add(v.toInt());
          floatSet.add(v.toFloat());
          charSet.add(String.fromCharCode(v.toInt()));
        }
  
        expect(byteSet.size).assertEqual(3);
        expect(intSet.size).assertEqual(4);
        expect(floatSet.size).assertEqual(4);
        expect(charSet.size).assertEqual(4);
      }

      {
        let boundaryValues: Short[] = [
          new Short(127 as short), new Short(128 as short), new Short(-128 as short), new Short(-129 as short),
          new Short(255 as short), new Short(256 as short)
        ];
  
        let exportData: Map<int, PrimitiveValues> = new Map<int, PrimitiveValues>();
  
        for (let v of boundaryValues) {
          exportData.set(v.toInt(), new PrimitiveValues(v.toByte(), v.toInt(), v.toFloat()));
        }
  
        expect(exportData.get(128)!.byteVal).assertEqual(-128);
        expect(exportData.get(256)!.byteVal).assertEqual(0);
        expect(exportData.get(-129)!.byteVal).assertEqual(127);
  
        exportData.forEach((data: PrimitiveValues, key: int): void => {
          expect(data.intVal).assertEqual(key);
          expect(data.floatVal).assertEqual(Int.toDouble(key));
        });
      }

      {
        let testInts: int[] = [0, 1, -1, 32767, -32768, 32768, -32769, 65535, -65536];
        for (let i: int = 0; i < testInts.length; i++) {
          let s: Short = new Short(Int.toShort(testInts[i]));
          let expected: short = Int.toShort(testInts[i]);
          expect(s.toShort()).assertEqual(expected);
          expect(s.toInt()).assertEqual(Short.toInt(expected));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOPRIMITIVEVALUE_0300
     * @tc.name testShortToPrimitiveValue_merged3
     * @tc.desc BoundaryOverflow: covers 10 merged test points for Short.toPrimitiveValue, including type conversion, overflow, wrapping, loop accumulation, and boundary values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToPrimitiveValue_merged3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let maxBoxed: Short = new Short(Short.MAX_VALUE);
        let minBoxed: Short = new Short(Short.MIN_VALUE);
        let maxPrimitive: int = maxBoxed.toInt();
        let minPrimitive: int = minBoxed.toInt();
        expect(maxPrimitive).assertEqual(32767);
        expect(minPrimitive).assertEqual(-32768);
        expect((~maxPrimitive)).assertEqual(minPrimitive);
        expect((~minPrimitive)).assertEqual(maxPrimitive);
      }

      {
        let hexMax: short = Short.parseInt('7FFF', 16);
        let hexMin: short = Short.parseInt('-8000', 16);
        let sMax: Short = new Short(hexMax);
        let sMin: Short = new Short(hexMin);
        expect(sMax.toInt()).assertEqual(32767);
        expect(sMax.toLong().toInt()).assertEqual(32767);
        expect(sMax.toFloat()).assertEqual(32767.0f);
        expect(sMin.toInt()).assertEqual(-32768);
        expect(sMin.toLong().toInt()).assertEqual(-32768);
        expect(sMin.toFloat()).assertEqual((-32768.0f));
      }

      {
        let a: Short = new Short(20000 as short);
        let b: Short = new Short(20000 as short);
        let sumShort: Short = a.add(b);
        let sumViaInt: int = sumShort.toInt();
        let sumViaLong: long = a.toLong().add(b.toLong());
        expect(sumViaInt).assertEqual(-25536);
        expect(sumViaLong.toInt()).assertEqual(40000);
      }

      {
        let a: Short = new Short((-20000) as short);
        let b: Short = new Short(20000 as short);
        let diffShort: Short = a.sub(b);
        let diffViaInt: int = diffShort.toInt();
        let diffViaLong: long = a.toLong().sub(b.toLong());
        expect(diffViaInt).assertEqual(25536);
        expect(diffViaLong.toInt()).assertEqual(-40000);
      }

      {
        let a: Short = new Short(1000 as short);
        let b: Short = new Short(100 as short);
        let mulShort: Short = a.mul(b);
        let productViaLong: long = a.toLong().mul(b.toLong());
        expect(mulShort.toInt()).assertEqual(-31072);
        expect(productViaLong.toInt()).assertEqual(100000);
      }

      {
        let a: Short = new Short(10 as short);
        let b: Short = new Short(3 as short);
        let divShort: Short = a.div(b);
        expect(divShort.toInt()).assertEqual(3);
        let floatQuotient: float = a.toFloat() / b.toFloat();
        expect(floatQuotient > 3.0).assertTrue();
        expect(floatQuotient < 4.0).assertTrue();
      }

      {
        let s0: Short = new Short(Int.toShort(32768));
        expect(s0.toByte()).assertEqual(0 as byte);
        expect(s0.toInt()).assertEqual(-32768);
        let s127: Short = new Short(Int.toShort(32895));
        expect(s127.toByte()).assertEqual(127 as byte);
        let s128: Short = new Short(Int.toShort(32896));
        expect(s128.toByte()).assertEqual((-128) as byte);
        let s255: Short = new Short(Int.toShort(33023));
        expect(s255.toByte()).assertEqual((-1) as byte);
        let sMid: Short = new Short(Int.toShort(32928));
        expect(sMid.toByte()).assertEqual((-96) as byte);
      }

      {
        let testVals: short[] = [Short.MAX_VALUE, Short.MIN_VALUE, (-1) as short, 0 as short, 1 as short, 16384 as short, (-16384) as short];
        let expectedIntVals: int[] = [32767, -32768, -1, 0, 1, 16384, -16384];
        for (let i: int = 0; i < testVals.length; i++) {
          let s: Short = new Short(testVals[i]);
          let iv: int = s.toInt();
          expect(iv >= -32768).assertTrue();
          expect(iv <= 32767).assertTrue();
          expect(iv).assertEqual(expectedIntVals[i]);
        }
      }

      {
        let sMax: Short = new Short(Short.MAX_VALUE);
        let lMax: long = sMax.toLong();
        expect(lMax.toInt()).assertEqual(32767);
        let sMin: Short = new Short(Short.MIN_VALUE);
        let lMin: long = sMin.toLong();
        expect(lMin.toInt()).assertEqual(-32768);
      }

      {
        let sMax: Short = new Short(Short.MAX_VALUE);
        expect(sMax.toFloat()).assertEqual(32767.0f);
        expect(sMax.toDouble()).assertEqual(32767.0);
        let sMin: Short = new Short(Short.MIN_VALUE);
        expect(sMin.toFloat()).assertEqual((-32768.0f));
        expect(sMin.toDouble()).assertEqual(-32768.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOPRIMITIVEVALUE_0400
     * @tc.name testShortToPrimitiveValue_merged4
     * @tc.desc BoundaryOverflow / ErrorException / CrossTypeRoundTrip: covers 10 merged test points for Short.toPrimitiveValue, including type conversion, boundary values, wrapping, negative values, and zero values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToPrimitiveValue_merged4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let maxShort: Short = new Short(Short.MAX_VALUE);
        let overflowed: Short = maxShort.add(new Short(1 as short));
        expect(overflowed.toInt() !== 32768).assertTrue();
        expect(overflowed.toInt()).assertEqual(-32768);
      }

      {
        let s: Short = new Short(Int.toShort(32768));
        expect(s.toInt()).assertEqual(-32768);
        expect(s.toByte()).assertEqual(0 as byte);
        expect(s.toLong().toInt()).assertEqual(-32768);
        expect(s.toFloat()).assertEqual((-32768.0f));
        expect(s.toDouble()).assertEqual(-32768.0);
        let s2: Short = new Short(Int.toShort(33023));
        expect(s2.toInt()).assertEqual(-32513);
        expect(s2.toByte()).assertEqual((-1) as byte);
      }

      {
        for (let v: int = 0; v <= 255; v++) {
          let sv: short = Int.toShort(v);
          let s: Short = new Short(sv);
          let byteVal: int = Byte.toInt(s.toByte());
          let charCode: int = ('' + s.toChar()).charCodeAt(0);
          let expectedByte: int = (v < 128) ? v : (v - 256);
          expect(byteVal).assertEqual(expectedByte);
          expect(charCode).assertEqual(v);
        }
      }

      {
        let failCount: int = 0;
        for (let v: int = 0; v <= 255; v++) {
          let s: Short = new Short(Int.toShort(v));
          if (s.toFloat() !== Int.toFloat(v)) {
            failCount++;
          }
        }
        expect(failCount).assertEqual(0);
      }

      {
        let testValues: short[] = [
          0 as short,
          42 as short,
          (-1) as short,
          127 as short,
          (-128) as short
        ];
        let expectedValues: byte[] = [
          0 as byte,
          42 as byte,
          (-1) as byte,
          127 as byte,
          (-128) as byte
        ];
        let caseCount: int = 5;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let boxedValue: Short = new Short(testValues[caseIndex]);
          let actualResult: byte = boxedValue.toByte();
          expect(actualResult).assertEqual(expectedValues[caseIndex]);
        }
      }

      {
        let testValues: short[] = [
          0 as short,
          42 as short,
          (-15) as short,
          Short.MAX_VALUE,
          Short.MIN_VALUE
        ];
        let caseCount: int = 5;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let boxedValue: Short = new Short(testValues[caseIndex]);
          let actualResult: short = boxedValue.toShort();
          expect(actualResult).assertEqual(testValues[caseIndex]);
        }
      }

      {
        let testValues: short[] = [
          0 as short,
          42 as short,
          (-15) as short,
          100 as short,
          Short.MAX_VALUE
        ];
        let expectedValues: float[] = [
          0.0f,
          42.0f,
          (-15.0f),
          100.0f,
          32767.0f
        ];
        let caseCount: int = 5;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let boxedValue: Short = new Short(testValues[caseIndex]);
          let actualResult: float = boxedValue.toFloat();
          expect(actualResult).assertEqual(expectedValues[caseIndex]);
        }
      }

      {
        let testValues: short[] = [
          0 as short,
          42 as short,
          (-15) as short,
          100 as short,
          Short.MAX_VALUE,
          Short.MIN_VALUE
        ];
        let expectedValues: double[] = [
          0.0,
          42.0,
          (-15.0),
          100.0,
          32767.0,
          (-32768.0)
        ];
        let caseCount: int = 6;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let boxedValue: Short = new Short(testValues[caseIndex]);
          let actualResult: double = boxedValue.toDouble();
          expect(actualResult).assertEqual(expectedValues[caseIndex]);
        }
      }

      {
        let positiveInstance: Short = new Short(50 as short);
        let negativeInstance: Short = new Short((-50) as short);
        let zeroInstance: Short = new Short(0 as short);
        let positiveByteResult: byte = positiveInstance.toByte();
        let negativeByteResult: byte = negativeInstance.toByte();
        let zeroByteResult: byte = zeroInstance.toByte();
        expect(positiveByteResult).assertEqual(50 as byte);
        expect(negativeByteResult).assertEqual((-50) as byte);
        expect(zeroByteResult).assertEqual(0 as byte);
      }

      {
        let evenValues: short[] = [0 as short, 2 as short, 100 as short, 32766 as short, (-2) as short, (-32768) as short];
        let oddValues: short[] = [1 as short, 101 as short, 32767 as short, (-1) as short, (-32767) as short];
        let evenCount: int = evenValues.length;
        let oddCount: int = oddValues.length;
        for (let evenIndex: int = 0; evenIndex < evenCount; evenIndex++) {
          let boxedEven: Short = new Short(evenValues[evenIndex]);
          expect(boxedEven.toInt() & 1).assertEqual(0);
        }
        for (let oddIndex: int = 0; oddIndex < oddCount; oddIndex++) {
          let boxedOdd: Short = new Short(oddValues[oddIndex]);
          expect(boxedOdd.toInt() & 1).assertEqual(1);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOPRIMITIVEVALUE_0500
     * @tc.name testShortToPrimitiveValue_merged5
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toPrimitiveValue, including type conversion, business scenarios, containers and references, loop accumulation, and equality consistency.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToPrimitiveValue_merged5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let byteRangeValues: short[] = [
          0 as short,
          42 as short,
          (-1) as short,
          127 as short,
          (-128) as short
        ];
        let caseCount: int = 5;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let boxedValue: Short = new Short(byteRangeValues[caseIndex]);
          let directByteResult: byte = boxedValue.toByte();
          let intermediateShortResult: short = boxedValue.toShort();
          let intermediateIntResult: int = intermediateShortResult;
          let indirectByteResult: byte = Int.toByte(intermediateIntResult);
          expect(directByteResult).assertEqual(indirectByteResult);
        }
      }

      {
        let asciiChar: char = c'Q';
        let asciiShort: short = Char.toShort(asciiChar);
        let asciiBoxed: Short = new Short(asciiShort);
        expect(asciiBoxed.toInt()).assertEqual(81);
        expect(asciiBoxed.toShort()).assertEqual(81 as short);
        let cjkChar: char = c'\u4E2D';
        let cjkShort: short = Char.toShort(cjkChar);
        let cjkBoxed: Short = new Short(cjkShort);
        expect(cjkBoxed.toInt()).assertEqual(20013);
        expect(cjkBoxed.toShort()).assertEqual(Int.toShort(20013));
        let highChar: char = c'\uFF9C';
        let highShort: short = Char.toShort(highChar);
        let highBoxed: Short = new Short(highShort);
        expect(highBoxed.toInt()).assertEqual(-100);
        expect(highBoxed.toShort()).assertEqual((-100) as short);
      }

      {
        let charTestValues: short[] = [
          65 as short, 97 as short, 48 as short, 36 as short,
          126 as short, 0 as short, (-1) as short, 1000 as short,
          (-1000) as short, 20000 as short, (-20000) as short
        ];
        let expectedChars: char[] = [
          c'A', c'a', c'0', c'$',
          c'~', c'\u0000', c'\uFFFF', c'\u03E8',
          c'\uFC18', c'\u4E20', c'\uB1E0'
        ];
        let caseCount: int = 11;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let boxedValue: Short = new Short(charTestValues[caseIndex]);
          expect(boxedValue.toChar()).assertEqual(expectedChars[caseIndex]);
        }
      }

      {
        let chainValues: short[] = [42 as short, 0 as short, (-1) as short, 100 as short, (-256) as short];
        let caseCount: int = 5;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let boxedValue: Short = new Short(chainValues[caseIndex]);
          let intVal: int = boxedValue.toInt();
          let floatVal: float = boxedValue.toFloat();
          let doubleVal: double = boxedValue.toDouble();
          expect(boxedValue.toLong()).assertEqual(Long.toLong(intVal));
          expect(floatVal).assertEqual(Int.toFloat(intVal));
          expect(doubleVal).assertEqual(Int.toDouble(intVal));
          expect(doubleVal).assertEqual(Float.toDouble(floatVal));
        }
      }

      {
        for (let byteVal: int = -128; byteVal <= 127; byteVal++) {
          let shortVal: short = Int.toShort(byteVal);
          let boxedValue: Short = new Short(shortVal);
          let expectedByte: byte = Int.toByte(byteVal);
          expect(boxedValue.toByte()).assertEqual(expectedByte);
          expect(boxedValue.toShort()).assertEqual(shortVal);
        }
      }

      {
        let baseValues: short[] = [0 as short, 1 as short, 127 as short, (-128) as short, (-1) as short, 1000 as short, (-1000) as short];
        for (let i: int = 0; i < baseValues.length; i++) {
          let base: short = baseValues[i];
          let v1: Short = new Short(base);
          let offset: short = Int.toShort(Short.toInt(base) + 256);
          let v2: Short = new Short(offset);
          expect(v1.toByte()).assertEqual(v2.toByte());
        }
      }

      {
        let symbolCodes: short[] = [33 as short, 64 as short, 35 as short, 36 as short, 37 as short, 94 as short, 38 as short, 42 as short, 126 as short];
        let expectedSymbols: char[] = [c'!', c'@', c'#', c'$', c'%', c'^', c'&', c'*', c'~'];
        let caseCount: int = 9;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let boxedValue: Short = new Short(symbolCodes[caseIndex]);
          expect(boxedValue.toChar()).assertEqual(expectedSymbols[caseIndex]);
          expect(boxedValue.toShort()).assertEqual(symbolCodes[caseIndex]);
        }
      }

      {
        let upperCodes: short[] = [65 as short, 66 as short, 67 as short, 90 as short];
        let expectedLowerChars: char[] = [c'a', c'b', c'c', c'z'];
        let lowerCodes: short[] = [97 as short, 98 as short, 122 as short];
        let expectedUpperChars: char[] = [c'A', c'B', c'Z'];
        for (let uIndex: int = 0; uIndex < upperCodes.length; uIndex++) {
          let upperBoxed: Short = new Short(upperCodes[uIndex]);
          let lowerChar: char = new Short(Int.toShort(upperBoxed.toInt() + 32)).toChar();
          expect(lowerChar).assertEqual(expectedLowerChars[uIndex]);
        }
        for (let lIndex: int = 0; lIndex < lowerCodes.length; lIndex++) {
          let lowerBoxed: Short = new Short(lowerCodes[lIndex]);
          let upperChar: char = new Short(Int.toShort(lowerBoxed.toInt() - 32)).toChar();
          expect(upperChar).assertEqual(expectedUpperChars[lIndex]);
        }
      }

      {
        let uppercaseChars: char[] = [c'A', c'B', c'C', c'D', c'E', c'F', c'G', c'H', c'I', c'J', c'K', c'L', c'M', c'N', c'O', c'P', c'Q', c'R', c'S', c'T', c'U', c'V', c'W', c'X', c'Y', c'Z'];
        let letterCount: int = 26;
        for (let letterIdx: int = 0; letterIdx < letterCount; letterIdx++) {
          let codePoint: short = Int.toShort(65 + letterIdx);
          let boxedValue: Short = new Short(codePoint);
          expect(boxedValue.toChar()).assertEqual(uppercaseChars[letterIdx]);
        }
      }

      {
        let testValues: short[] = [0 as short, 1 as short, (-1) as short, 42 as short, (-128) as short, 32767 as short, (-32768) as short];
        let caseCount: int = 7;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let boxedValue: Short = new Short(testValues[caseIndex]);
          let shortResult: short = boxedValue.toShort();
          let directLongResult: long = boxedValue.toLong();
          let secondInstance: Short = new Short(shortResult);
          let chainLongResult: long = secondInstance.toLong();
          expect(chainLongResult).assertEqual(directLongResult);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOPRIMITIVEVALUE_0600
     * @tc.name testShortToPrimitiveValue_merged6
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toPrimitiveValue, including type conversion, business scenarios, zero values, fractions and rounding, and negative values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToPrimitiveValue_merged6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let testValues: short[] = [0 as short, 1 as short, 42 as short, 1000 as short, (-1) as short, (-1000) as short, Short.MAX_VALUE, Short.MIN_VALUE];
        for (let i: int = 0; i < testValues.length; i++) {
          let v: Short = new Short(testValues[i]);
          let f: float = v.toFloat();
          expect(Math.abs(f - Math.round(f)) < 0.001).assertTrue();
        }
        let expectedFloats: float[] = [0.0f, 1.0f, 42.0f, 1000.0f, -1.0f, -1000.0f, 32767.0f, -32768.0f];
        for (let i: int = 0; i < testValues.length; i++) {
          expect(new Short(testValues[i]).toFloat()).assertEqual(expectedFloats[i]);
        }
      }

      {
        let upperRangeValues: short[] = [(-1) as short, (-2) as short, (-128) as short, (-32768) as short];
        let expectedChars: char[] = [c'\uFFFF', c'\uFFFE', c'\uFF80', c'\u8000'];
        let caseCount: int = 4;
        for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
          let boxedValue: Short = new Short(upperRangeValues[caseIndex]);
          expect(boxedValue.toChar()).assertEqual(expectedChars[caseIndex]);
        }
      }

      {
        let arithValues: short[] = [
          (100 + 200) as short,
          (50 - 200) as short,
          (40 * 30) as short,
          (1000 / 10) as short
        ];
        let expectedInts: int[] = [300, -150, 1200, 100];
        let expectedBytes: byte[] = [44 as byte, 106 as byte, (-80) as byte, 100 as byte];
        let vCount: int = 4;
        for (let vi: int = 0; vi < vCount; vi++) {
          let boxedValue: Short = new Short(arithValues[vi]);
          expect(boxedValue.toByte()).assertEqual(expectedBytes[vi]);
          expect(boxedValue.toShort()).assertEqual(arithValues[vi]);
          expect(boxedValue.toInt()).assertEqual(expectedInts[vi]);
          expect(boxedValue.toFloat()).assertEqual(Int.toFloat(expectedInts[vi]));
          expect(boxedValue.toDouble()).assertEqual(Int.toDouble(expectedInts[vi]));
        }
      }

      {
        let message: Short[] = [
          new Short(0x12 as short),
          new Short(0x34 as short),
          new Short(0x56 as short),
          new Short(0x78 as short)
        ];
        let xorAccumulator: int = 0;
        for (let msgIndex: int = 0; msgIndex < message.length; msgIndex++) {
          xorAccumulator = xorAccumulator ^ message[msgIndex].toInt();
        }
        expect(xorAccumulator).assertEqual(0x12 ^ 0x34 ^ 0x56 ^ 0x78);
      }

      {
        let v: Short = new Short(12345 as short);
  
        let byteVal: byte = v.toByte();
        let shortVal: short = v.toShort();
        let intVal: int = v.toInt();
        let longVal: long = v.toLong();
        let floatVal: float = v.toFloat();
        let doubleVal: double = v.toDouble();
  
        expect(intVal).assertEqual(12345);
        expect(longVal.toInt()).assertEqual(12345);
        expect(shortVal.toInt()).assertEqual(12345);
  
        expect(Math.abs(floatVal - 12345.0) < 0.01).assertTrue();
        expect(Math.abs(doubleVal - 12345.0) < 0.01).assertTrue();
  
        expect(byteVal).assertEqual(57);
      }

      {
        let testValues: short[] = [0 as short, 1 as short, (-1) as short, 127 as short, (-128) as short, 1000 as short, (-1000) as short, Short.MAX_VALUE, Short.MIN_VALUE];
        for (let i: int = 0; i < testValues.length; i++) {
          let v: Short = new Short(testValues[i]);
          expect(v.toLong().toInt()).assertEqual(v.toInt());
        }
      }

      {
        let ascending: short[] = [(-32768) as short, (-10000) as short, (-1) as short, 0 as short, 1 as short, 10000 as short, 32767 as short];
        let expectedInts: int[] = [-32768, -10000, -1, 0, 1, 10000, 32767];
        for (let i: int = 0; i < ascending.length; i++) {
          expect(new Short(ascending[i]).toInt()).assertEqual(expectedInts[i]);
        }
      }

      {
        let ascending: short[] = [(-32768) as short, (-10000) as short, (-1) as short, 0 as short, 1 as short, 10000 as short, 32767 as short];
        for (let i: int = 1; i < ascending.length; i++) {
          let prev: Short = new Short(ascending[i - 1]);
          let curr: Short = new Short(ascending[i]);
          expect(curr.toLong().compareTo(prev.toLong()) > 0).assertTrue();
        }
        let expectedLongs: long[] = [Long.toLong(-32768), Long.toLong(-10000), Long.toLong(-1), Long.toLong(0), Long.toLong(1), Long.toLong(10000), Long.toLong(32767)];
        for (let i: int = 0; i < ascending.length; i++) {
          expect(new Short(ascending[i]).toLong()).assertEqual(expectedLongs[i]);
        }
      }

      {
        let ascending: short[] = [(-32768) as short, (-10000) as short, (-1) as short, 0 as short, 1 as short, 10000 as short, 32767 as short];
        let expectedFloats: float[] = [-32768.0f, -10000.0f, -1.0f, 0.0f, 1.0f, 10000.0f, 32767.0f];
        for (let i: int = 0; i < ascending.length; i++) {
          expect(new Short(ascending[i]).toFloat()).assertEqual(expectedFloats[i]);
        }
      }

      {
        let ascending: short[] = [(-32768) as short, (-10000) as short, (-1) as short, 0 as short, 1 as short, 10000 as short, 32767 as short];
        let expectedDoubles: double[] = [-32768.0, -10000.0, -1.0, 0.0, 1.0, 10000.0, 32767.0];
        for (let i: int = 1; i < ascending.length; i++) {
          let prev: Short = new Short(ascending[i - 1]);
          let curr: Short = new Short(ascending[i]);
          expect(prev.toDouble()).assertEqual(expectedDoubles[i - 1]);
          expect(curr.toDouble() >= prev.toDouble()).assertTrue();
        }
        expect(new Short(ascending[ascending.length - 1]).toDouble()).assertEqual(expectedDoubles[ascending.length - 1]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOPRIMITIVEVALUE_0700
     * @tc.name testShortToPrimitiveValue_merged7
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toPrimitiveValue, including type conversion, equality consistency, business scenarios, loop accumulation, and containers and references.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToPrimitiveValue_merged7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let lowercase: char[] = [c'a', c'b', c'c', c'd', c'e', c'f', c'g', c'h', c'i', c'j', c'k', c'l', c'm', c'n', c'o', c'p', c'q', c'r', c's', c't', c'u', c'v', c'w', c'x', c'y', c'z'];
        for (let idx: int = 0; idx < 26; idx++) {
          let s: Short = new Short(Int.toShort(97 + idx));
          expect(s.toChar()).assertEqual(lowercase[idx]);
        }
      }

      {
        let vectorA: short[] = [1 as short, 2 as short, 3 as short, 4 as short];
        let vectorB: short[] = [5 as short, 6 as short, 7 as short, 8 as short];
        let dotProduct: double = 0.0;
        for (let vecIndex: int = 0; vecIndex < vectorA.length; vecIndex++) {
          dotProduct = dotProduct + new Short(vectorA[vecIndex]).toFloat() * new Short(vectorB[vecIndex]).toFloat();
        }
        expect(Math.abs(dotProduct - 70.0) < 0.001).assertTrue();
      }

      {
        for (let v: int = 128; v <= 255; v++) {
          let s: Short = new Short(Int.toShort(v));
          expect(s.toByte() < 0).assertTrue();
        }
        expect(new Short(128 as short).toByte()).assertEqual((-128) as byte);
        expect(new Short(129 as short).toByte()).assertEqual((-127) as byte);
        expect(new Short(255 as short).toByte()).assertEqual((-1) as byte);
      }

      {
        for (let v: int = -50; v < 50; v++) {
          let s1: Short = new Short(Int.toShort(v));
          let s2: Short = new Short(Int.toShort(v + 1));
          expect(s2.toFloat() - s1.toFloat()).assertEqual(1.0);
        }
      }

      {
        for (let v: int = -50; v < 50; v++) {
          let s1: Short = new Short(Int.toShort(v));
          let s2: Short = new Short(Int.toShort(v + 1));
          expect(s2.toDouble() - s1.toDouble()).assertEqual(1.0);
        }
      }

      {
        let pairs: [short, short][] = [[100 as short, 200 as short], [(-50) as short, 50 as short], [1000 as short, (-300) as short], [16000 as short, 16000 as short]];
        for (let i: int = 0; i < pairs.length; i++) {
          let a: Short = new Short(pairs[i][0]);
          let b: Short = new Short(pairs[i][1]);
          let sumViaLong: long = a.toLong().add(b.toLong());
          let sumShort: short = a.add(b).toShort();
          expect(sumViaLong.toInt()).assertEqual(Short.toInt(sumShort));
        }
      }

      {
        let rawReadings: short[] = [0 as short, 16384 as short, 32767 as short, (-32768) as short];
        for (let i: int = 0; i < rawReadings.length; i++) {
          let s: Short = new Short(rawReadings[i]);
          let voltage: double = s.toFloat() * (3.3 / 32768.0);
          expect(s.toInt() <= 0 || voltage > 0.0).assertTrue();
          expect(voltage >= -3.3).assertTrue();
          expect(voltage <= 3.3).assertTrue();
        }
      }

      {
        let pcmSamples: short[] = [0 as short, 16384 as short, (-16384) as short, 32767 as short, (-32768) as short];
        let expectedNorm: double[] = [0.0, 0.5, -0.5, 32767.0 / 32768.0, -1.0];
        for (let i: int = 0; i < pcmSamples.length; i++) {
          let s: Short = new Short(pcmSamples[i]);
          let normalized: double = s.toFloat() / 32768.0;
          expect(normalized >= -1.0).assertTrue();
          expect(normalized <= 1.0).assertTrue();
          expect(normalized).assertEqual(expectedNorm[i]);
        }
      }

      {
        let red: Short = new Short(Int.toShort(0xF800));
        let green: Short = new Short(Int.toShort(0x07E0));
        let blue: Short = new Short(Int.toShort(0x001F));
        let redInt: int = red.toInt();
        let r: int = (redInt >> 11) & 0x1F;
        expect(r).assertEqual(31);
        let greenInt: int = green.toInt();
        let g: int = (greenInt >> 5) & 0x3F;
        expect(g).assertEqual(63);
        let blueInt: int = blue.toInt();
        let b: int = blueInt & 0x1F;
        expect(b).assertEqual(31);
      }

      {
        let values: short[] = [100 as short, 200 as short, 300 as short, 400 as short, 500 as short];
        let sum: int = 0;
        for (let i: int = 0; i < values.length; i++) {
          sum = sum + new Short(values[i]).toInt();
        }
        expect(sum).assertEqual(1500);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOPRIMITIVEVALUE_0800
     * @tc.name testShortToPrimitiveValue_merged8
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toPrimitiveValue, including type conversion, containers and references, business scenarios, loop accumulation, and comparison and ordering.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToPrimitiveValue_merged8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let unsorted: Short[] = [new Short(300 as short), new Short(100 as short), new Short(200 as short), new Short((-500) as short), new Short(0 as short)];
        let ints: int[] = [];
        for (let v of unsorted) {
          ints.push(v.toInt());
        }
        ints.sort((a: int, b: int): int => a - b);
        expect(ints[0]).assertEqual(-500);
        expect(ints[1]).assertEqual(0);
        expect(ints[2]).assertEqual(100);
        expect(ints[3]).assertEqual(200);
        expect(ints[4]).assertEqual(300);
      }

      {
        let mixed: Short[] = [new Short((-5) as short), new Short(10 as short), new Short((-100) as short), new Short(200 as short), new Short(0 as short)];
        let filtered: int[] = [];
        for (let v of mixed) {
          if (v.toInt() >= 0) {
            filtered.push(v.toInt());
          }
        }
        expect(filtered.length).assertEqual(3);
        expect(filtered[0]).assertEqual(10);
        expect(filtered[2]).assertEqual(0);
      }

      {
        let values: short[] = [10 as short, 20 as short, 30 as short, 40 as short, 50 as short];
        let sum: double = 0.0;
        for (let i: int = 0; i < values.length; i++) {
          sum = sum + new Short(values[i]).toFloat();
        }
        expect(Math.abs(sum - 150.0) < 0.01).assertTrue();
      }

      {
        let freq: Map<int, int> = new Map<int, int>();
        for (let v: int = 0; v < 1000; v++) {
          let s: Short = new Short(Int.toShort(v));
          let b: byte = s.toByte();
          let key: int = b;
          freq.set(key, (freq.get(key) ?? 0) + 1);
        }
        expect(freq.get(0)).assertEqual(4);
        expect(freq.get(1)!).assertEqual(4);
        expect(freq.get((-1) as int)!).assertEqual(3);
      }

      {
        let original: Short = new Short(12345 as short);
        let savedInt: int = original.toInt();
        let savedChar: char = original.toChar();
        let reconstructed: Short = new Short(Int.toShort(savedInt));
        expect(reconstructed.toInt()).assertEqual(original.toInt());
        expect(reconstructed.toShort()).assertEqual(original.toShort());
        expect(reconstructed.toDouble()).assertEqual(original.toDouble());
        expect(reconstructed.toChar()).assertEqual(savedChar);
      }

      {
        let values: short[] = [(-10) as short, (-5) as short, 0 as short, 5 as short, 10 as short, (-8) as short, 3 as short, 7 as short, (-2) as short, 1 as short];
        let sum: double = 0.0;
        for (let i: int = 0; i < values.length; i++) {
          sum = sum + new Short(values[i]).toFloat();
        }
        let mean: double = sum / values.length;
        expect(mean > 0.0).assertTrue();
        expect(mean < 1.0).assertTrue();
        let varianceSum: double = 0.0;
        for (let i: int = 0; i < values.length; i++) {
          let diff: double = new Short(values[i]).toFloat() - mean;
          varianceSum = varianceSum + diff * diff;
        }
        expect(varianceSum > 0.0).assertTrue();
      }

      {
        for (let v: int = 0; v < 1000; v++) {
          let s: Short = new Short(Int.toShort(v));
          expect(s.toInt()).assertEqual(v);
          expect(s.toLong().toInt()).assertEqual(v);
        }
      }

      {
        let testValues: short[] = [(-32768) as short, (-10000) as short, (-1) as short, 0 as short, 1 as short, 100 as short, 1000 as short, 10000 as short, 32767 as short, 255 as short];
        for (let i: int = 0; i < testValues.length; i++) {
          let s: Short = new Short(testValues[i]);
          let intVal: int = s.toInt();
          expect(s.toLong().toInt()).assertEqual(intVal);
          expect(s.toFloat()).assertEqual(Int.toFloat(intVal));
          expect(s.toDouble()).assertEqual(Int.toDouble(intVal));
          expect(s.toShort()).assertEqual(testValues[i]);
          expect('' + s.toChar()).assertEqual(String.fromCharCode(Short.toInt(testValues[i]) & 0xFFFF));
        }
      }

      {
        let cc: Short[] = [new Short(0 as short), new Short(9 as short), new Short(10 as short), new Short(13 as short), new Short(27 as short), new Short(127 as short)];
        expect(cc[0].toChar()).assertEqual(c'\u0000');
        expect(cc[0].toByte()).assertEqual(0 as byte);
        expect(cc[1].toChar()).assertEqual(c'\u0009');
        expect(cc[2].toChar()).assertEqual(c'\u000A');
        expect(cc[3].toChar()).assertEqual(c'\u000D');
        expect(cc[4].toChar()).assertEqual(c'\u001B');
        expect(cc[5].toChar()).assertEqual(c'\u007F');
        expect(cc[5].toByte()).assertEqual(127 as byte);
        expect(cc[5].toInt()).assertEqual(127);
      }

      {
        let prev: int = -33024;
        for (let i: int = 0; i < 256; i++) {
          let val: int = -32768 + i * 256;
          let s: Short = new Short(Int.toShort(val));
          expect(s.toInt()).assertEqual(val);
          expect(s.toInt() - prev).assertEqual(256);
          prev = s.toInt();
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOPRIMITIVEVALUE_0900
     * @tc.name testShortToPrimitiveValue_merged9
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toPrimitiveValue, including type conversion, business scenarios, sign handling, and algebraic properties.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToPrimitiveValue_merged9', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let negativeVals: short[] = [(-1) as short, (-128) as short];
        let expectedByte: byte[] = [(-1) as byte, (-128) as byte];
        let expectedInt: int[] = [-1, -128];
        for (let i: int = 0; i < negativeVals.length; i++) {
          let s: Short = new Short(negativeVals[i]);
          expect(s.toByte() < 0).assertTrue();
          expect(s.toShort() < 0).assertTrue();
          expect(s.toInt() < 0).assertTrue();
          expect(s.toLong().toInt() < 0).assertTrue();
          expect(s.toFloat() < 0).assertTrue();
          expect(s.toDouble() < 0).assertTrue();
          expect(s.toByte()).assertEqual(expectedByte[i]);
          expect(s.toInt()).assertEqual(expectedInt[i]);
          expect(s.toLong().toInt()).assertEqual(expectedInt[i]);
          expect(s.toFloat()).assertEqual(Int.toFloat(expectedInt[i]));
          expect(s.toDouble()).assertEqual(Int.toDouble(expectedInt[i]));
        }
      }

      {
        let s0: Short = new Short(0 as short);
        expect(s0.toChar()).assertEqual(c'\u0000');
        let sPos: Short = new Short(32767 as short);
        expect(sPos.toChar()).assertEqual(c'\u7FFF');
        let sNeg1: Short = new Short((-1) as short);
        expect(sNeg1.toChar()).assertEqual(c'\uFFFF');
        let sNegMax: Short = new Short((-32768) as short);
        expect(sNegMax.toChar()).assertEqual(c'\u8000');
        let s255: Short = new Short(Int.toShort(255));
        expect(s255.toChar()).assertEqual(c'\u00FF');
      }

      {
        let testVals: short[] = [(-32768) as short, (-1) as short, 0 as short, 1 as short, 32767 as short];
        for (let i: int = 0; i < testVals.length; i++) {
          let s: Short = new Short(testVals[i]);
          expect(s.toInt()).assertEqual(Short.toInt(s.toShort()));
        }
      }

      {
        let step: int = 257;
        for (let val: int = Short.MIN_VALUE; val <= Short.MAX_VALUE; val += step) {
          let s: Short = new Short(Int.toShort(val));
          let f: float = s.toFloat();
          let d: double = s.toDouble();
          expect(d).assertEqual(Float.toDouble(f));
          expect(f).assertEqual(Int.toFloat(val));
          expect(d).assertEqual(Int.toDouble(val));
        }
      }

      {
        let data: Short[] = [new Short(0x48 as short), new Short(0x65 as short), new Short(0x6C as short), new Short(0x6C as short), new Short(0x6F as short)];
        let bytes: byte[] = [];
        let checksum: int = 0;
        for (let i: int = 0; i < data.length; i++) {
          let b: byte = data[i].toByte();
          bytes.push(b);
          checksum = checksum + data[i].toInt();
        }
        expect(bytes[0]).assertEqual(0x48 as byte);
        expect(bytes[4]).assertEqual(0x6F as byte);
        expect(checksum).assertEqual(0x48 + 0x65 + 0x6C + 0x6C + 0x6F);
      }

      {
        let fieldValue: Short = new Short(150 as short);
        let varint: int = fieldValue.toInt();
        expect(varint).assertEqual(150);
        expect(varint >= 0).assertTrue();
        let negativeField: Short = new Short((-1) as short);
        let signExtended: int = negativeField.toInt();
        expect(signExtended).assertEqual(-1);
      }

      {
        let s1: Short = new Short(42 as short);
        let jsonNumber: double = s1.toDouble();
        expect(jsonNumber).assertEqual(42.0);
        let s2: Short = new Short((-100) as short);
        let jsonNeg: double = s2.toDouble();
        expect(jsonNeg).assertEqual(-100.0);
      }

      {
        let s: Short = new Short(12345 as short);
        let integerCol: int = s.toInt();
        expect(integerCol).assertEqual(12345);
        let bigintCol: long = s.toLong();
        expect(bigintCol.toInt()).assertEqual(12345);
      }

      {
        let reg16: Short = new Short(Int.toShort(0xABCD));
        let lowByte: byte = reg16.toByte();
        let fullReg: short = reg16.toShort();
        expect(fullReg).assertEqual(Int.toShort(0xABCD));
        expect(lowByte).assertEqual(Int.toByte(0xCD));
      }

      {
        let s: Short = new Short(1000 as short);
        let fpuVal: float = s.toFloat();
        expect(fpuVal).assertEqual(1000.0f);
        let result: float = fpuVal * 2.0f;
        expect(result).assertEqual(2000.0f);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOPRIMITIVEVALUE_1000
     * @tc.name testShortToPrimitiveValue_merged10
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short.toPrimitiveValue, including business scenarios and type conversion.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToPrimitiveValue_merged10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let s: Short = new Short(255 as short);
        let normalized: double = s.toFloat() / 255.0;
        expect(normalized).assertEqual(1.0);
        let sHalf: Short = new Short(128 as short);
        let halfNorm: double = sHalf.toFloat() / 255.0;
        expect(halfNorm > 0.5).assertTrue();
        expect(halfNorm < 0.51).assertTrue();
      }

      {
        let q15Max: Short = new Short(32767 as short);
        let normalizedMax: double = q15Max.toDouble() / 32768.0;
        expect(normalizedMax < 1.0).assertTrue();
        expect(normalizedMax > 0.999).assertTrue();
        let q15Min: Short = new Short((-32768) as short);
        let normalizedMin: double = q15Min.toDouble() / 32768.0;
        expect(normalizedMin).assertEqual(-1.0);
      }

      {
        let nonceHi: Short = new Short(0x1234 as short);
        let nonceLo: Short = new Short(0x5678 as short);
        let combined: int = (nonceHi.toInt() << 16) | (nonceLo.toInt() & 0xFFFF);
        expect(combined).assertEqual(0x12345678);
      }

      {
        let s1: Short = new Short(0x7FFF as short);
        let s2: Short = new Short(0x0001 as short);
        let lower: long = s1.toLong();
        let upper: long = s2.toLong();
        expect(lower.toInt()).assertEqual(32767);
        expect(upper.toInt()).assertEqual(1);
      }

      {
        let port80: Short = new Short(80 as short);
        expect(port80.toInt()).assertEqual(80);
        let port8080: Short = new Short(Int.toShort(8080));
        expect(port8080.toInt()).assertEqual(8080);
        let port443: Short = new Short(Int.toShort(443));
        expect(port443.toInt()).assertEqual(443);
      }

      {
        let success: Short = new Short(0 as short);
        expect(success.toByte()).assertEqual(0 as byte);
        let failure: Short = new Short(1 as short);
        expect(failure.toByte()).assertEqual(1 as byte);
        let signal: Short = new Short(Int.toShort(255));
        expect(signal.toByte()).assertEqual((-1) as byte);
      }

      {
        let ivtEntry: Short = new Short(0x0020 as short);
        expect(ivtEntry.toShort()).assertEqual(0x0020 as short);
        expect(ivtEntry.toInt()).assertEqual(32);
        let irqMask: Short = new Short(Int.toShort(0xFFFF));
        expect(irqMask.toShort()).assertEqual((-1) as short);
        expect(irqMask.toInt()).assertEqual(-1);
      }

      {
        let phaseInc: Short = new Short(1000 as short);
        let freq: double = phaseInc.toFloat() * (1000.0 / 65536.0);
        expect(freq > 0.0).assertTrue();
        expect(freq < 100.0).assertTrue();
        expect(Math.floor(freq)).assertEqual(15);
        expect(Math.abs(freq - 15.259) < 0.001).assertTrue();
      }

      {
        let pulseCount: Short = new Short(3600 as short);
        let kwh: double = pulseCount.toDouble() / 1000.0;
        expect(kwh).assertEqual(3.6);
      }

      {
        let pressureRaw: Short = new Short(Int.toShort(1013));
        let pressureInt: int = pressureRaw.toInt();
        expect(pressureInt).assertEqual(1013);
        let altitudeOffset: int = (1013 - pressureInt) * 9;
        expect(altitudeOffset).assertEqual(0);
      }
    });

  });
}