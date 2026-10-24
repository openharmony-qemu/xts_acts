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

class DataHolder {
  field: short;
  constructor(v: short) {
    this.field = v;
  }
}

export default function shortConstructorTest(): void {
  describe('ShortConstructorTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_CONSTRUCTOR_0100
     * @tc.name testShortConstructor_merged1
     * @tc.desc BasicValue: covers 10 merged test points for Short constructor, including constructor forms, negative values, zero values, business scenarios, and type conversion.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortConstructor_merged1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let value: Short = new Short();
        let resultShort: short = value.toShort();
        let resultInt: int = value.toInt();
        let resultLong: long = value.toLong();
        expect(resultShort).assertEqual(0 as short);
        expect(resultInt).assertEqual(0);
        expect(resultLong).assertEqual(Long.toLong(0));
      }

      {
        let positiveValues: short[] = [
          1 as short,
          100 as short,
          Short.MAX_VALUE
        ];
        let caseCount: int = 3;
        for (let i: int = 0; i < caseCount; i++) {
          let input: short = positiveValues[i];
          let value: Short = new Short(input);
          expect(value.toShort()).assertEqual(input);
        }
      }

      {
        let negativeValues: short[] = [
          (-1) as short,
          (-100) as short,
          Short.MIN_VALUE
        ];
        let caseCount: int = 3;
        for (let i: int = 0; i < caseCount; i++) {
          let input: short = negativeValues[i];
          let value: Short = new Short(input);
          expect(value.toShort()).assertEqual(input);
        }
      }

      {
        let one: Short = new Short(1 as short);
        let hundred: Short = new Short(100 as short);
        let normal: Short = new Short(2048 as short);
        let nearMax: Short = new Short(32760 as short);
        let maxValue: Short = new Short(Short.MAX_VALUE);
        expect(one.toString()).assertEqual("1");
        expect(hundred.toString()).assertEqual("100");
        expect(normal.toString()).assertEqual("2048");
        expect(nearMax.toString()).assertEqual("32760");
        expect(maxValue.toString()).assertEqual("32767");
      }

      {
        let negativeOne: Short = new Short((-1) as short);
        let negativeHundred: Short = new Short((-100) as short);
        let minValue: Short = new Short(Short.MIN_VALUE);
        expect(negativeOne.toString()).assertEqual("-1");
        expect(negativeHundred.toString()).assertEqual("-100");
        expect(minValue.toString()).assertEqual("-32768");
      }

      {
        let zeroValue: Short = new Short(0 as short);
        expect(zeroValue.toShort()).assertEqual(0 as short);
        expect(zeroValue.toInt()).assertEqual(0);
        expect(zeroValue.toString()).assertEqual("0");
      }

      {
        let productTerm: int = 300 * 40;
        let result1: int = productTerm - 2000;
        let positive: Short = new Short(Int.toShort(result1));
        expect(positive.toShort()).assertEqual(10000 as short);
        expect(positive.toInt()).assertEqual(10000);
        let result2: int = 150 * 3 - 2000;
        let negative: Short = new Short(Int.toShort(result2));
        expect(negative.toShort()).assertEqual((-1550) as short);
        expect(negative.toInt()).assertEqual(-1550);
      }

      {
        let negValues: short[] = [
          (-1) as short,
          (-256) as short,
          (-1024) as short,
          (-2048) as short
        ];
        let expectedInts: int[] = [-1, -256, -1024, -2048];
        let count: int = 4;
        for (let i: int = 0; i < count; i++) {
          let instance: Short = new Short(negValues[i]);
          expect(instance.toShort()).assertEqual(negValues[i]);
          expect(instance.toInt()).assertEqual(expectedInts[i]);
          expect(instance.toString()).assertEqual(expectedInts[i].toString());
        }
      }

      {
        let byteMax: Short = new Short(127 as short);
        let byteOverflow: Short = new Short(128 as short);
        let byteMin: Short = new Short((-128) as short);
        expect(byteMax.toShort()).assertEqual(127 as short);
        expect(byteMax.toInt()).assertEqual(127);
        expect(byteOverflow.toShort()).assertEqual(128 as short);
        expect(byteOverflow.toInt()).assertEqual(128);
        expect(byteMin.toShort()).assertEqual((-128) as short);
        expect(byteMin.toInt()).assertEqual(-128);
      }

      {
        let defaultZero: Short = new Short();
        let explicitZero: Short = new Short(0 as short);
        let negZero: Short = new Short((-0) as short);
        let parsedZero: Short = new Short(Short.parseInt("0", 10));
        expect(defaultZero.equals(explicitZero)).assertTrue();
        expect(explicitZero.equals(negZero)).assertTrue();
        expect(negZero.equals(parsedZero)).assertTrue();
        expect(parsedZero.equals(defaultZero)).assertTrue();
        expect(defaultZero.compareTo(explicitZero)).assertEqual(0);
        expect(explicitZero.compareTo(negZero)).assertEqual(0);
        expect(negZero.compareTo(parsedZero)).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_CONSTRUCTOR_0200
     * @tc.name testShortConstructor_merged2
     * @tc.desc BasicValue: covers 10 merged test points for Short constructor, including constructor forms, bitwise operations, negative values, zero values, and positive values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortConstructor_merged2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let a: Short = new Short(0x1234 as short);
        let b: Short = new Short(0x0FF0 as short);
        let aInt: int = a.toInt();
        let bInt: int = b.toInt();
        let andResult: short = Int.toShort(aInt & bInt);
        let sAnd: Short = new Short(andResult);
        expect(sAnd.toShort()).assertEqual(0x0230 as short);
        expect(sAnd.toInt()).assertEqual(560);
      }

      {
        let a: Short = new Short(0x0F00 as short);
        let b: Short = new Short(0x00F0 as short);
        let aInt: int = a.toInt();
        let bInt: int = b.toInt();
        let xorResult: short = Int.toShort(aInt ^ bInt);
        let sXor: Short = new Short(xorResult);
        expect(sXor.toShort()).assertEqual(0x0FF0 as short);
        expect(sXor.toInt()).assertEqual(4080);
      }

      {
        let bitValues: short[] = [
          Int.toShort(0x0001), Int.toShort(0x0002), Int.toShort(0x0004), Int.toShort(0x0008),
          Int.toShort(0x0010), Int.toShort(0x0020), Int.toShort(0x0040), Int.toShort(0x0080),
          Int.toShort(0x0100), Int.toShort(0x0200), Int.toShort(0x0400), Int.toShort(0x0800),
          Int.toShort(0x1000), Int.toShort(0x2000), Int.toShort(0x4000), Int.toShort(0x8000)
        ];
        let expectedInts: int[] = [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, -32768];
        let count: int = 16;
        for (let i: int = 0; i < count; i++) {
          let instance: Short = new Short(bitValues[i]);
          expect(instance.toShort()).assertEqual(bitValues[i]);
          expect(instance.toInt()).assertEqual(expectedInts[i]);
        }
      }

      {
        let negZero: Short = new Short((-0) as short);
        let explicitZero: Short = new Short(0 as short);
        let defaultZero: Short = new Short();
        expect(negZero.toShort()).assertEqual(0 as short);
        expect(negZero.toInt()).assertEqual(0);
        expect(negZero.toString()).assertEqual("0");
        expect(negZero.equals(explicitZero)).assertTrue();
        expect(negZero.equals(defaultZero)).assertTrue();
        expect(negZero.compareTo(explicitZero)).assertEqual(0);
        expect(negZero.compareTo(defaultZero)).assertEqual(0);
      }

      {
        let modPositive: Short = new Short(Int.toShort(32767 % 1000));
        let modNegative: Short = new Short(Int.toShort(-32768 % 1000));
        let modByte: Short = new Short(Int.toShort(12345 % 256));
        expect(modPositive.toShort()).assertEqual(767 as short);
        expect(modPositive.toInt()).assertEqual(767);
        expect(modNegative.toShort()).assertEqual((-768) as short);
        expect(modNegative.toInt()).assertEqual(-768);
        expect(modByte.toShort()).assertEqual(57 as short);
        expect(modByte.toInt()).assertEqual(57);
      }

      {
        let testCases: int[] = [75, -30, 0];
        let count: int = 3;
        for (let i: int = 0; i < count; i++) {
          let val: int = testCases[i];
          let result: Short;
          if (val > 0) {
            result = new Short(100 as short);
          } else if (val < 0) {
            result = new Short((-100) as short);
          } else {
            result = new Short(0 as short);
          }
          let expectedVal: int = val > 0 ? 100 : (val < 0 ? -100 : 0);
          expect(result.toShort()).assertEqual(Int.toShort(expectedVal));
          expect(result.toInt()).assertEqual(expectedVal);
        }
      }

      {
        let complement42: Short = new Short(Int.toShort(~42));
        let complement0: Short = new Short(Int.toShort(~0));
        let complement1: Short = new Short(Int.toShort(~1));
        expect(complement42.toInt()).assertEqual(-43);
        expect(complement0.toInt()).assertEqual(-1);
        expect(complement1.toInt()).assertEqual(-2);
        expect(complement42.toShort()).assertEqual(Int.toShort(-43));
      }

      {
        let count: int = 32;
        for (let i: int = 1; i <= count; i++) {
          let negValue: int = -(i * 1000);
          let shortVal: short = Int.toShort(negValue);
          let instance: Short = new Short(shortVal);
          expect(instance.toShort()).assertEqual(shortVal);
          expect(instance.toInt()).assertEqual(negValue);
        }
      }

      {
        let innerFunc = (): short => {
          return 77 as short;
        };
        let middleFunc = (): short => {
          return innerFunc();
        };
        let outerFunc = (): short => {
          return middleFunc();
        };
        let fromNestedCall: Short = new Short(outerFunc());
        expect(fromNestedCall.toShort()).assertEqual(77 as short);
        expect(fromNestedCall.toInt()).assertEqual(77);
      }

      {
        let iterations: int = 100;
        let history: Short[] = new Array<Short>();
        let source: short = 0 as short;
        for (let i: int = 0; i < iterations; i++) {
          source = Int.toShort(i);
          history.push(new Short(source));
          source = Int.toShort(-i);
        }
        expect(history.length).assertEqual(100);
        for (let i: int = 0; i < iterations; i++) {
          expect(history[i].toInt()).assertEqual(i);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_CONSTRUCTOR_0300
     * @tc.name testShortConstructor_merged3
     * @tc.desc BasicValue / BoundaryOverflow: covers 10 merged test points for Short constructor, including constructor forms, boundary values, type conversion, fractions and rounding, and business scenarios.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortConstructor_merged3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let maxVal: int = Short.toInt(Short.MAX_VALUE);
        let quarterPoints: int[] = [0, maxVal / 4, maxVal / 2, (maxVal * 3) / 4, maxVal];
        let expectedValues: int[] = [0, 8191, 16383, 24575, 32767];
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          let val: short = Int.toShort(quarterPoints[i]);
          let instance: Short = new Short(val);
          expect(instance.toShort()).assertEqual(val);
          expect(instance.toInt()).assertEqual(expectedValues[i]);
        }
      }

      {
        let negOne: Short = new Short((-1) as short);
        let zero: Short = new Short(0 as short);
        let posOne: Short = new Short(1 as short);
        expect(negOne.toShort()).assertEqual((-1) as short);
        expect(negOne.toInt()).assertEqual(-1);
        expect(zero.toShort()).assertEqual(0 as short);
        expect(zero.toInt()).assertEqual(0);
        expect(posOne.toShort()).assertEqual(1 as short);
        expect(posOne.toInt()).assertEqual(1);
        expect(negOne.compareTo(zero)).assertEqual(-1);
        expect(zero.compareTo(posOne)).assertEqual(-1);
        expect(negOne.compareTo(posOne)).assertEqual(-1);
      }

      {
        let wide255: Short = new Short(255 as short);
        let wide128: Short = new Short(128 as short);
        let wide200: Short = new Short(200 as short);
        expect(wide255.toByte()).assertEqual((-1) as byte);
        expect(wide128.toByte()).assertEqual((-128) as byte);
        expect(wide200.toByte()).assertEqual((-56) as byte);
        expect(wide255.toShort()).assertEqual(255 as short);
        expect(wide128.toInt()).assertEqual(128);
        expect(wide200.toShort()).assertEqual(200 as short);
      }

      {
        let minValue: Short = new Short(Short.MIN_VALUE);
        expect(minValue.toShort()).assertEqual(Short.MIN_VALUE);
        expect(minValue.toInt()).assertEqual(-32768);
        expect(minValue.toString()).assertEqual("-32768");
      }

      {
        let maxValue: Short = new Short(Short.MAX_VALUE);
        expect(maxValue.toShort()).assertEqual(Short.MAX_VALUE);
        expect(maxValue.toInt()).assertEqual(32767);
        expect(maxValue.toString()).assertEqual("32767");
      }

      {
        let nearMax: Short = new Short(32766 as short);
        let nearMin: Short = new Short((-32767) as short);
        expect(nearMax.toShort()).assertEqual(32766 as short);
        expect(nearMax.toInt()).assertEqual(32766);
        expect(nearMin.toShort()).assertEqual((-32767) as short);
        expect(nearMin.toInt()).assertEqual(-32767);
      }

      {
        let minValue: Short = new Short(Short.MIN_VALUE);
        let maxValue: Short = new Short(Short.MAX_VALUE);
        expect(minValue.toShort()).assertEqual(Short.MIN_VALUE);
        expect(maxValue.toShort()).assertEqual(Short.MAX_VALUE);
        expect(minValue.compareTo(maxValue)).assertEqual(-1);
        expect(maxValue.compareTo(minValue)).assertEqual(1);
        expect(minValue.compareTo(minValue)).assertEqual(0);
        expect(maxValue.compareTo(maxValue)).assertEqual(0);
      }

      {
        let maxValue: Short = new Short(Short.MAX_VALUE);
        expect(maxValue.toShort()).assertEqual(Short.MAX_VALUE);
        expect(maxValue.toInt()).assertEqual(32767);
        expect(maxValue.toLong()).assertEqual(Long.toLong(32767));
        expect(maxValue.toFloat()).assertEqual(32767.0);
        expect(maxValue.toDouble()).assertEqual(32767.0);
      }

      {
        let minValue: Short = new Short(Short.MIN_VALUE);
        expect(minValue.toShort()).assertEqual(Short.MIN_VALUE);
        expect(minValue.toInt()).assertEqual(-32768);
        expect(minValue.toLong()).assertEqual(Long.toLong(-32768));
        expect(minValue.toFloat()).assertEqual(-32768.0);
        expect(minValue.toDouble()).assertEqual(-32768.0);
      }

      {
        let fromFloatMax: Short = new Short(Double.toShort(32767.9));
        let fromDoubleMin: Short = new Short(Double.toShort(-32768.9));
        let fromFraction: Short = new Short(Double.toShort(123.456));
        expect(fromFloatMax.toInt()).assertEqual(32767);
        expect(fromDoubleMin.toInt()).assertEqual(-32768);
        expect(fromFraction.toInt()).assertEqual(123);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_CONSTRUCTOR_0400
     * @tc.name testShortConstructor_merged4
     * @tc.desc BoundaryOverflow / SpecialValue / CrossTypeRoundTrip: covers 10 merged test points for Short constructor, including constructor forms, fractions and rounding, type conversion, business scenarios, and boundary values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortConstructor_merged4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let step: int = 4096;
        let sampledValues: short[] = [];
        for (let v: int = -32768; v <= 32767; v += step) {
          sampledValues.push(Int.toShort(v));
        }
        for (let i: int = 0; i < sampledValues.length; i++) {
          let instance: Short = new Short(sampledValues[i]);
          expect(instance.toShort()).assertEqual(sampledValues[i]);
        }
      }

      {
        let longVal: long = Long.toLong(100000);
        let value: Short = new Short(Int.toShort(longVal.toInt()));
        expect(value.toShort()).assertEqual(Int.toShort(100000));
        expect(value.toInt()).assertEqual(Short.toInt(Int.toShort(100000)));
      }

      {
        let charVal: short = Int.toShort(0x8000);
        let value: Short = new Short(charVal);
        expect(value.toShort()).assertEqual(Short.MIN_VALUE);
        expect(value.toInt()).assertEqual(-32768);
      }

      {
        let v: short = Double.toShort(Double.POSITIVE_INFINITY);
        let value: Short = new Short(v);
        expect(value.toShort()).assertEqual((-1) as short);
        expect(value.toInt()).assertEqual(-1);
      }

      {
        let sum1: int = 40000 + 30000;
        let truncated1: short = Int.toShort(sum1);
        let s1: Short = new Short(truncated1);
        expect(s1.toShort()).assertEqual(truncated1);
        let sum2: int = 32767 + 1;
        let truncated2: short = Int.toShort(sum2);
        let s2: Short = new Short(truncated2);
        expect(s2.toShort()).assertEqual(Short.MIN_VALUE);
        let sum3: int = -32768 - 1;
        let truncated3: short = Int.toShort(sum3);
        let s3: Short = new Short(truncated3);
        expect(s3.toShort()).assertEqual(Short.MAX_VALUE);
      }

      {
        let beyondMax1: Short = new Short(Int.toShort(32768));
        let beyondMax2: Short = new Short(Int.toShort(32769));
        let beyondMin1: Short = new Short(Int.toShort(-32769));
        let beyondMin2: Short = new Short(Int.toShort(-32770));
        expect(beyondMax1.toInt()).assertEqual(-32768);
        expect(beyondMax2.toInt()).assertEqual(-32767);
        expect(beyondMin1.toInt()).assertEqual(32767);
        expect(beyondMin2.toInt()).assertEqual(32766);
        expect(beyondMax1.toShort()).assertEqual(Short.MIN_VALUE);
        expect(beyondMin1.toShort()).assertEqual(Short.MAX_VALUE);
      }

      {
        let v: short = Double.toShort(Double.NaN);
        let value: Short = new Short(v);
        expect(value.toShort()).assertEqual(0 as short);
        expect(value.toInt()).assertEqual(0);
      }

      {
        let inputs: short[] = [
          0 as short,
          123 as short,
          (-456) as short,
          Short.MAX_VALUE
        ];
        let count: int = 4;
        for (let i: int = 0; i < count; i++) {
          let instance: Short = new Short(inputs[i]);
          expect(instance.toInt()).assertEqual(Short.toInt(inputs[i]));
          expect(instance.toShort()).assertEqual(inputs[i]);
        }
      }

      {
        let inputs: short[] = [
          0 as short,
          1 as short,
          (-1) as short,
          100 as short,
          (-100) as short
        ];
        let expectedInts: int[] = [
          0,
          1,
          -1,
          100,
          -100
        ];
        let caseCount: int = 5;
        for (let i: int = 0; i < caseCount; i++) {
          let value: Short = new Short(inputs[i]);
          expect(value.toShort()).assertEqual(inputs[i]);
          expect(value.toInt()).assertEqual(expectedInts[i]);
        }
      }

      {
        let value: Short = new Short();
        expect(value.toShort()).assertEqual(0 as short);
        expect(value.toByte()).assertEqual(0 as byte);
        expect(value.toChar()).assertEqual(new Short(Int.toShort(0)).toChar());
        expect(value.toDouble()).assertEqual(0.0);
        expect(value.toFloat()).assertEqual(0.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_CONSTRUCTOR_0500
     * @tc.name testShortConstructor_merged5
     * @tc.desc CrossTypeRoundTrip: covers 10 merged test points for Short constructor, including type conversion, constructor forms, round-trip conversion, business scenarios, and radix conversion.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortConstructor_merged5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let one: Short = new Short(1 as short);
        expect(one.toShort()).assertEqual(1 as short);
        expect(one.toInt()).assertEqual(1);
        expect(one.toLong()).assertEqual(Long.toLong(1));
        expect(one.toByte()).assertEqual(1 as byte);
        expect(one.toChar()).assertEqual(new Short(Int.toShort(1)).toChar());
      }

      {
        let fromString: short = Short.parseInt("12345", 10);
        let fromNumber: Short = new Short(10000 as short);
        let fromComputed: Short = new Short(15000 as short).add(new Short(5000 as short));
  
        let parsed: Short = new Short(Int.toShort(fromString));
        let constructed: Short = new Short(Int.toShort(fromNumber.toInt()));
        let computed: Short = new Short(Int.toShort(fromComputed.toInt()));
  
        expect(parsed.toInt()).assertEqual(12345);
        expect(constructed.toInt()).assertEqual(10000);
        expect(computed.toInt()).assertEqual(20000);
  
        let sum: Short = parsed.add(constructed);
        expect(sum.toInt()).assertEqual(22345);
      }

      {
        let positiveOverflow: int = 100000;
        let positiveShort: Short = new Short(Int.toShort(positiveOverflow));
        expect(positiveShort.toInt() !== positiveOverflow).assertTrue();
        expect(positiveShort.toInt()).assertEqual(-31072);
  
        let negativeOverflow: int = -100000;
        let negativeShort: Short = new Short(Int.toShort(negativeOverflow));
        expect(negativeShort.toInt() !== negativeOverflow).assertTrue();
        expect(negativeShort.toInt()).assertEqual(31072);
      }

      {
        let original: Short = new Short(12345 as short);
        let floatForm: float = original.toFloat();
        let reconstructed: Short = new Short(Double.toShort(floatForm));
        expect(reconstructed.toShort()).assertEqual(12345 as short);
        expect(reconstructed.toInt()).assertEqual(12345);
        let negativeOriginal: Short = new Short((-7777) as short);
        let negFloat: float = negativeOriginal.toFloat();
        let negReconstructed: Short = new Short(Double.toShort(negFloat));
        expect(negReconstructed.toShort()).assertEqual((-7777) as short);
        expect(negReconstructed.toInt()).assertEqual(-7777);
      }

      {
        let allOnes: Short = new Short(Int.toShort(0xFFFF));
        expect(allOnes.toShort()).assertEqual((-1) as short);
        expect(allOnes.toInt()).assertEqual(-1);
      }

      {
        let byteVal: byte = 100 as byte;
        let shortFromByte: Short = new Short(Int.toShort(Byte.toInt(byteVal)));
        expect(shortFromByte.toShort()).assertEqual(100 as short);
        expect(shortFromByte.toInt()).assertEqual(100);
      }

      {
        let byteVal: byte = (-128) as byte;
        let value: Short = new Short(Int.toShort(Byte.toInt(byteVal)));
        expect(value.toShort()).assertEqual((-128) as short);
        expect(value.toInt()).assertEqual(-128);
      }

      {
        let minBoundary: int = -32768;
        let minShort: Short = new Short(Int.toShort(minBoundary));
        expect(minShort.toInt()).assertEqual(minBoundary);
  
        let arbitraryNeg: int = -12345;
        let arbitraryNegShort: Short = new Short(Int.toShort(arbitraryNeg));
        expect(arbitraryNegShort.toInt()).assertEqual(arbitraryNeg);
  
        let negOne: int = -1;
        let negOneShort: Short = new Short(Int.toShort(negOne));
        expect(negOneShort.toInt()).assertEqual(negOne);
  
        let zero: int = 0;
        let zeroShort: Short = new Short(Int.toShort(zero));
        expect(zeroShort.toInt()).assertEqual(zero);
  
        let posOne: int = 1;
        let posOneShort: Short = new Short(Int.toShort(posOne));
        expect(posOneShort.toInt()).assertEqual(posOne);
  
        let arbitraryPos: int = 12345;
        let arbitraryPosShort: Short = new Short(Int.toShort(arbitraryPos));
        expect(arbitraryPosShort.toInt()).assertEqual(arbitraryPos);
  
        let maxBoundary: int = 32767;
        let maxShort: Short = new Short(Int.toShort(maxBoundary));
        expect(maxShort.toInt()).assertEqual(maxBoundary);
      }

      {
        let original: Short = new Short(255 as short);
        let fromString: Short = new Short(Short.parseInt(original.toString(), 10));
        expect(fromString.toShort()).assertEqual(255 as short);
        expect(fromString.toInt()).assertEqual(255);
        expect(original.compareTo(fromString)).assertEqual(0);
      }

      {
        let original: Short = new Short(150 as short);
        let fromInt: Short = new Short(Int.toShort(original.toInt()));
        expect(fromInt.toShort()).assertEqual(150 as short);
        expect(fromInt.toInt()).assertEqual(150);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_CONSTRUCTOR_0600
     * @tc.name testShortConstructor_merged6
     * @tc.desc CrossTypeRoundTrip / RadixConversion / Idempotent: covers 10 merged test points for Short constructor, including constructor forms, type conversion, equality consistency, radix conversion, and comparison and ordering.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortConstructor_merged6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let first: Short = new Short(75 as short);
        let second: Short = new Short(75 as short);
        expect(first.equals(second)).assertTrue();
        expect(first.compareTo(second)).assertEqual(0);
        expect(first.toShort()).assertEqual(second.toShort());
        expect(first.toInt()).assertEqual(second.toInt());
      }

      {
        let testValues: short[] = [Short.MIN_VALUE, (-1000) as short, 0 as short, 1000 as short, Short.MAX_VALUE];
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          let original: short = testValues[i];
          let constructed: Short = new Short(original);
          expect(constructed.toShort()).assertEqual(original);
        }
      }

      {
        let fromPositive: Short = new Short(Short.toShort(255));
        let fromNegative: Short = new Short(Short.toShort(-1));
        let fromZero: Short = new Short(Short.toShort(0));
        let fromMax: Short = new Short(Short.toShort(Short.MAX_VALUE));
        let fromMin: Short = new Short(Short.toShort(Short.MIN_VALUE));
        expect(fromPositive.toShort()).assertEqual(255 as short);
        expect(fromPositive.toInt()).assertEqual(255);
        expect(fromNegative.toShort()).assertEqual((-1) as short);
        expect(fromNegative.toInt()).assertEqual(-1);
        expect(fromZero.toShort()).assertEqual(0 as short);
        expect(fromMax.toShort()).assertEqual(Short.MAX_VALUE);
        expect(fromMin.toShort()).assertEqual(Short.MIN_VALUE);
      }

      {
        let original: Short = new Short(120 as short);
        let b: byte = original.toByte();
        let reconstructed: Short = new Short(Int.toShort(b));
        expect(reconstructed.toShort()).assertEqual(120 as short);
        expect(reconstructed.toByte()).assertEqual(120 as byte);
        expect(reconstructed.compareTo(original)).assertEqual(0);
      }

      {
        let original: Short = new Short(5000 as short);
        let l: long = original.toLong();
        let truncated: short = Long.toShort(l);
        let reconstructed: Short = new Short(truncated);
        expect(reconstructed.toShort()).assertEqual(5000 as short);
        expect(reconstructed.toLong()).assertEqual(Long.toLong(5000));
        expect(reconstructed.compareTo(original)).assertEqual(0);
      }

      {
        let hexMax: Short = new Short(0x7FFF as short);
        let octalMax: Short = new Short(0o77777 as short);
        expect(hexMax.toShort()).assertEqual(Short.MAX_VALUE);
        expect(hexMax.toString()).assertEqual("32767");
        expect(octalMax.toShort()).assertEqual(Short.MAX_VALUE);
        expect(octalMax.toString()).assertEqual("32767");
      }

      {
        let fromDec: Short = new Short(255 as short);
        let fromHex: Short = new Short(0xFF as short);
        let fromOct: Short = new Short(0o377 as short);
        let fromBin: Short = new Short(0b11111111 as short);
        expect(fromDec.toShort()).assertEqual(255 as short);
        expect(fromHex.toShort()).assertEqual(255 as short);
        expect(fromOct.toShort()).assertEqual(255 as short);
        expect(fromBin.toShort()).assertEqual(255 as short);
        expect(fromDec.compareTo(fromHex)).assertEqual(0);
        expect(fromHex.compareTo(fromOct)).assertEqual(0);
        expect(fromOct.compareTo(fromBin)).assertEqual(0);
      }

      {
        let negHex1: Short = new Short((-0x1) as short);
        let negHex2: Short = new Short((-0xFF) as short);
        let negHex3: Short = new Short((-0x4000) as short);
        let negHex4: Short = new Short((-0x7FFF) as short);
        let negHex5: Short = new Short((-0x8000) as short);
        expect(negHex1.toInt()).assertEqual(-1);
        expect(negHex2.toInt()).assertEqual(-255);
        expect(negHex3.toInt()).assertEqual(-16384);
        expect(negHex4.toInt()).assertEqual(-32767);
        expect(negHex5.toInt()).assertEqual(-32768);
        expect(negHex1.toString()).assertEqual("-1");
        expect(negHex5.toString()).assertEqual("-32768");
      }

      {
        let a: Short = new Short(100 as short);
        let b: Short = new Short(200 as short);
        expect(a.compareTo(b)).assertEqual(-1);
        let negA: Short = new Short(Int.toShort(-a.toInt()));
        let negB: Short = new Short(Int.toShort(-b.toInt()));
        expect(negA.toShort()).assertEqual((-100) as short);
        expect(negB.toShort()).assertEqual((-200) as short);
        expect(negA.compareTo(negB)).assertEqual(1);
      }

      {
        let positiveParam: short = 100 as short;
        let positiveOne: Short = new Short(positiveParam);
        let positiveTwo: Short = new Short(positiveParam);
        let positiveThree: Short = new Short(positiveParam);
        let negativeParam: short = (-50) as short;
        let negativeOne: Short = new Short(negativeParam);
        let negativeTwo: Short = new Short(negativeParam);
        let negativeThree: Short = new Short(negativeParam);
        expect(positiveOne.toShort()).assertEqual(100 as short);
        expect(positiveTwo.toShort()).assertEqual(100 as short);
        expect(positiveThree.toShort()).assertEqual(100 as short);
        expect(negativeOne.toShort()).assertEqual((-50) as short);
        expect(negativeTwo.toShort()).assertEqual((-50) as short);
        expect(negativeThree.toShort()).assertEqual((-50) as short);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_CONSTRUCTOR_0700
     * @tc.name testShortConstructor_merged7
     * @tc.desc Idempotent / ArithmeticBitwise: covers 10 merged test points for Short constructor, including constructor forms, equality consistency, type conversion, radix conversion, and comparison and ordering.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortConstructor_merged7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let prior: Short = new Short(42 as short);
        let priorShort: short = prior.toShort();
        let priorInt: int = prior.toInt();
        let priorText: String = prior.toString();
        let nextMin: Short = new Short(Short.MIN_VALUE);
        let nextMax: Short = new Short(Short.MAX_VALUE);
        let nextNegative: Short = new Short((-1) as short);
        expect(prior.toShort()).assertEqual(priorShort);
        expect(prior.toInt()).assertEqual(priorInt);
        expect(prior.toString()).assertEqual(priorText);
        expect(prior.toShort()).assertEqual(42 as short);
        expect(nextMin.toShort()).assertEqual(Short.MIN_VALUE);
        expect(nextMax.toShort()).assertEqual(Short.MAX_VALUE);
        expect(nextNegative.toShort()).assertEqual((-1) as short);
      }

      {
        let bitSize: byte = Short.BIT_SIZE;
        let byteSize: byte = Short.BYTE_SIZE;
        expect(bitSize).assertEqual(16 as byte);
        expect(byteSize).assertEqual(2 as byte);
        expect(bitSize).assertEqual(Int.toByte(byteSize * 8));
  
        let widthMask: int = (1 << (byteSize * 8)) - 1;
        let stored: short[] = [(-32768) as short, (-1) as short, 0 as short, 1 as short, 32767 as short];
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          let instance: Short = new Short(stored[i]);
          let unsignedView: int = instance.toInt() & widthMask;
          expect(Int.toShort(unsignedView)).assertEqual(instance.toShort());
        }
      }

      {
        let values: short[] = [Short.MIN_VALUE, (-1) as short, 0 as short, 1 as short, Short.MAX_VALUE];
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          let constructed: Short = new Short(values[i]);
          let fromParseInt: Short = new Short(Short.parseInt(values[i].toString(), 10));
          expect(constructed.equals(fromParseInt)).assertTrue();
          expect(constructed.compareTo(fromParseInt)).assertEqual(0);
        }
      }

      {
        let value: Short = new Short(Short.parseInt('128', 10));
        expect(value.toShort()).assertEqual(128 as short);
        expect(value.toInt()).assertEqual(128);
        expect(value.toString()).assertEqual("128");
      }

      {
        let fixedPoint: int = 0x0180;
        let value: Short = new Short(Int.toShort(fixedPoint));
        expect(value.toShort()).assertEqual(384 as short);
        let intPart: int = (value.toInt() >> 8) & 0xFF;
        let fracPart: int = value.toInt() & 0xFF;
        expect(intPart).assertEqual(1);
        expect(fracPart).assertEqual(128);
        let negFixed: int = -512;
        let negValue: Short = new Short(Int.toShort(negFixed));
        expect(negValue.toInt()).assertEqual(-512);
      }

      {
        let packed: int = 0x12340056;
        let lowField: int = packed & 0xFFFF;
        let highField: int = (packed >> 16) & 0xFFFF;
        let lowShort: Short = new Short(Int.toShort(lowField));
        let highShort: Short = new Short(Int.toShort(highField));
        expect(lowShort.toShort()).assertEqual(86 as short);
        expect(highShort.toShort()).assertEqual(4660 as short);
        expect(lowShort.toInt()).assertEqual(86);
        expect(highShort.toInt()).assertEqual(4660);
        expect(lowShort.compareTo(highShort)).assertEqual(-1);
      }

      {
        let rawNumber: int = 123;
        let value: Short = new Short(Int.toShort(rawNumber));
        expect(value.toShort()).assertEqual(123 as short);
        expect(value.toInt()).assertEqual(123);
        expect(value.toLong()).assertEqual(Long.toLong(123));
        expect(value.toDouble()).assertEqual(123.0);
      }

      {
        let instanceCount: int = 100;
        let instances: Short[] = new Array<Short>();
        for (let i: int = 0; i < instanceCount; i++) {
          let value: short = Int.toShort(i - 50);
          instances.push(new Short(value));
        }
        expect(instances.length).assertEqual(100);
        for (let i: int = 0; i < instanceCount; i++) {
          let expected: int = i - 50;
          expect(instances[i].toInt()).assertEqual(expected);
          expect(instances[i].toShort()).assertEqual(Int.toShort(expected));
        }
      }

      {
        let holder: DataHolder = new DataHolder(999 as short);
        let fromProperty: Short = new Short(holder.field);
        expect(fromProperty.toShort()).assertEqual(999 as short);
        expect(fromProperty.toInt()).assertEqual(999);
        holder.field = (-555) as short;
        expect(fromProperty.toShort()).assertEqual(999 as short);
        expect(fromProperty.toInt()).assertEqual(999);
      }

      {
        let trueCondition: boolean = true;
        let falseCondition: boolean = false;
        let trueShort: Short = new Short(Int.toShort(trueCondition ? 1 : 0));
        let falseShort: Short = new Short(Int.toShort(falseCondition ? 1 : 0));
        expect(trueShort.toShort()).assertEqual(1 as short);
        expect(trueShort.toInt()).assertEqual(1);
        expect(falseShort.toShort()).assertEqual(0 as short);
        expect(falseShort.toInt()).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_CONSTRUCTOR_0800
     * @tc.name testShortConstructor_merged8
     * @tc.desc ArithmeticBitwise / SortCompare / BusinessScenario: covers 10 merged test points for Short constructor, including constructor forms, comparison and ordering, containers and references, loop accumulation, and bitwise operations.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortConstructor_merged8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let count: int = 256;
        for (let i: int = 0; i < count; i++) {
          let byteVal: short = Int.toShort(i);
          let instance: Short = new Short(byteVal);
          expect(instance.toShort()).assertEqual(byteVal);
          expect(instance.toInt()).assertEqual(i);
        }
      }

      {
        let a: int = 10;
        let b: int = 5;
        let fromTrue: Short = new Short(Int.toShort(a > b ? 100 : -100));
        let fromFalse: Short = new Short(Int.toShort(a < b ? 200 : -200));
        expect(fromTrue.toShort()).assertEqual(100 as short);
        expect(fromTrue.toInt()).assertEqual(100);
        expect(fromFalse.toShort()).assertEqual((-200) as short);
        expect(fromFalse.toInt()).assertEqual(-200);
      }

      {
        let product1: int = 100 * 200;
        let product2: int = 50 * 500;
        let product3: int = 163 * 200;
        let s1: Short = new Short(Int.toShort(product1));
        let s2: Short = new Short(Int.toShort(product2));
        let s3: Short = new Short(Int.toShort(product3));
        expect(s1.toShort()).assertEqual(20000 as short);
        expect(s1.toInt()).assertEqual(20000);
        expect(s2.toShort()).assertEqual(25000 as short);
        expect(s2.toInt()).assertEqual(25000);
        expect(s3.toShort()).assertEqual(32600 as short);
        expect(s3.toInt()).assertEqual(32600);
      }

      {
        let reverseBits16 = (n: int): int => {
          let result: int = 0;
          for (let i: int = 0; i < 16; i++) {
            result = (result << 1) | ((n >> i) & 1);
          }
          return result;
        };
        let reversed1: Short = new Short(Int.toShort(reverseBits16(0x5555)));
        let reversed2: Short = new Short(Int.toShort(reverseBits16(0x00FF)));
        expect(reversed1.toShort()).assertEqual(Int.toShort(reverseBits16(0x5555)));
        expect(reversed2.toShort()).assertEqual(Int.toShort(reverseBits16(0x00FF)));
        let twiceReversed: Short = new Short(Int.toShort(reverseBits16(reversed1.toInt())));
        expect(twiceReversed.toInt()).assertEqual(0x5555);
      }

      {
        let a: Short = new Short(0x0F00 as short);
        let b: Short = new Short(0x00F0 as short);
        let aInt: int = a.toInt();
        let bInt: int = b.toInt();
        let orResult: short = Int.toShort(aInt | bInt);
        let sOr: Short = new Short(orResult);
        expect(sOr.toShort()).assertEqual(0x0FF0 as short);
        expect(sOr.toInt()).assertEqual(4080);
      }

      {
        let orderedValues: short[] = [
          (-5000) as short,
          (-1) as short,
          0 as short,
          500 as short,
          1000 as short
        ];
        let instances: Short[] = new Array<Short>();
        let count: int = 5;
        for (let i: int = 0; i < count; i++) {
          instances.push(new Short(orderedValues[i]));
        }
        for (let i: int = 0; i < count - 1; i++) {
          expect(instances[i].compareTo(instances[i + 1])).assertEqual(-1);
          expect(instances[i + 1].compareTo(instances[i])).assertEqual(1);
        }
        expect(instances[0].compareTo(instances[count - 1])).assertEqual(-1);
      }

      {
        let first: Short = new Short(42 as short);
        let second: Short = new Short(42 as short);
        let firstValue: short = first.toShort();
        let secondValue: short = second.toShort();
        expect(firstValue).assertEqual(42 as short);
        expect(secondValue).assertEqual(42 as short);
        expect(first.compareTo(second)).assertEqual(0);
        expect(second.compareTo(first)).assertEqual(0);
        expect(first.compareTo(first)).assertEqual(0);
      }

      {
        let highByte: int = 0x01;
        let lowByte: int = 0x02;
        let combined: int = (highByte << 8) | lowByte;
        let value: Short = new Short(Int.toShort(combined));
        expect(value.toShort()).assertEqual(258 as short);
        expect(value.toInt()).assertEqual(258);
        let extractedHigh: int = (value.toInt() >> 8) & 0xFF;
        let extractedLow: int = value.toInt() & 0xFF;
        expect(extractedHigh).assertEqual(highByte);
        expect(extractedLow).assertEqual(lowByte);
      }

      {
        let rawNumbers: int[] = [0, 255, -1, 32767, -32768, 255, 0];
  
        let shorts: Short[] = [];
        let valueSet: Set<int> = new Set<int>();
  
        for (let n of rawNumbers) {
          let s: Short = new Short(Int.toShort(n));
          shorts.push(s);
          valueSet.add(s.toInt());
        }
  
        expect(shorts.length).assertEqual(7);
        expect(valueSet.size).assertEqual(5);
  
        let uniqueValues: int[] = [];
        valueSet.forEach((v: int): void => { uniqueValues.push(v); });
        uniqueValues.sort((a: int, b: int): int => a - b);
        expect(uniqueValues[0]).assertEqual(-32768);
        expect(uniqueValues[4]).assertEqual(32767);
      }

      {
        let count: int = 1000;
        let instances: Short[] = new Array<Short>();
        for (let i: int = 0; i < count; i++) {
          instances.push(new Short(Int.toShort(i % 32768)));
        }
        expect(instances.length).assertEqual(1000);
        expect(instances[0].toInt()).assertEqual(0);
        expect(instances[999].toInt()).assertEqual(999);
        expect(instances[500].toInt()).assertEqual(500);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_CONSTRUCTOR_0900
     * @tc.name testShortConstructor_merged9
     * @tc.desc BusinessScenario / Other: covers 9 merged test points for Short constructor, including constructor forms, business scenarios, containers and references, loop accumulation, and division and modulo.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortConstructor_merged9', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let pool: Short[] = Array.create<Short>(256, new Short(0 as short));
        for (let i: int = -128; i <= 127; i++) {
          pool[i + 128] = new Short(Int.toShort(i));
        }
        expect(pool.length).assertEqual(256);
        expect(pool[0].toShort()).assertEqual((-128) as short);
        expect(pool[128].toShort()).assertEqual(0 as short);
        expect(pool[255].toShort()).assertEqual(127 as short);
      }

      {
        let byteStream: byte[] = [
          0x12 as byte,
          0x34 as byte,
          0x7F as byte,
          Int.toByte(0xFF),
          Int.toByte(0x80),
          0x00 as byte
        ];
        let shorts: Short[] = new Array<Short>();
        let count: int = 3;
        for (let i: int = 0; i < count; i++) {
          let hi: int = Byte.toInt(byteStream[i * 2]) & 0xFF;
          let lo: int = Byte.toInt(byteStream[i * 2 + 1]) & 0xFF;
          let combined: int = (hi << 8) | lo;
          let shortVal: short = Int.toShort(combined);
          shorts.push(new Short(shortVal));
        }
        expect(shorts[0].toInt()).assertEqual(0x1234);
        expect(shorts[1].toInt()).assertEqual(Short.toInt(Short.MAX_VALUE));
        expect(shorts[2].toInt()).assertEqual(Short.toInt(Short.MIN_VALUE));
      }

      {
        let fromInt: int = 12345;
        let fromFloat: double = 32767.9;
        let fromDouble: double = -32768.1;
        let fromLong: long = Long.toLong(255);
  
        let sFromInt: Short = new Short(Int.toShort(fromInt));
        let sFromFloat: Short = new Short(Double.toShort(fromFloat));
        let sFromDouble: Short = new Short(Double.toShort(fromDouble));
        let sFromLong: Short = new Short(Int.toShort(fromLong.toInt()));
  
        expect(sFromInt.toInt()).assertEqual(12345);
        expect(sFromFloat.toInt()).assertEqual(32767);
        expect(sFromDouble.toInt()).assertEqual(-32768);
        expect(sFromLong.toInt()).assertEqual(255);
      }

      {
        let original: Short = new Short(88 as short);
        let copy1: Short = new Short(original.toShort());
        let copy2: Short = new Short(copy1.toShort());
        let copy3: Short = new Short(copy2.toShort());
        expect(original.toShort()).assertEqual(88 as short);
        expect(copy1.toShort()).assertEqual(88 as short);
        expect(copy2.toShort()).assertEqual(88 as short);
        expect(copy3.toShort()).assertEqual(88 as short);
        expect(original.equals(copy3)).assertTrue();
      }

      {
        let a: Short = new Short(100 as short);
        let b: Short = new Short(200 as short);
        let fromSum: Short = new Short(a.add(b));
        expect(fromSum.toShort()).assertEqual(300 as short);
        expect(fromSum.toInt()).assertEqual(300);
      }

      {
        let a: Short = new Short(500 as short);
        let b: Short = new Short(120 as short);
        let fromDiff: Short = new Short(a.sub(b));
        expect(fromDiff.toShort()).assertEqual(380 as short);
        expect(fromDiff.toInt()).assertEqual(380);
      }

      {
        let a: Short = new Short(25 as short);
        let b: Short = new Short(40 as short);
        let fromProd: Short = new Short(a.mul(b));
        expect(fromProd.toShort()).assertEqual(1000 as short);
        expect(fromProd.toInt()).assertEqual(1000);
      }

      {
        let a: Short = new Short(1000 as short);
        let b: Short = new Short(40 as short);
        let fromQuot: Short = new Short(a.div(b));
        expect(fromQuot.toShort()).assertEqual(25 as short);
        expect(fromQuot.toInt()).assertEqual(25);
      }

      {
        let series: Short[] = [];
        let start: short = 10 as short;
        let step: short = 3 as short;
        for (let i: int = 0; i < 5; i++) {
          let val: short = Int.toShort(start + i * step);
          series.push(new Short(val));
        }
        expect(series[0].toShort()).assertEqual(10 as short);
        expect(series[1].toShort()).assertEqual(13 as short);
        expect(series[2].toShort()).assertEqual(16 as short);
        expect(series[3].toShort()).assertEqual(19 as short);
        expect(series[4].toShort()).assertEqual(22 as short);
      }
    });

  });
}