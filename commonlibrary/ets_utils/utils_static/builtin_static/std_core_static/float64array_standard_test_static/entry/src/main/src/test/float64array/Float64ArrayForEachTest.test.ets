'use static'
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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from './../Util.test';

let forEachHandlerCapture004: Array<number> = [];

function forEachHandler004(value: number, index: int, array: Float64Array): void {
  forEachHandlerCapture004.push(value);
}

class MutableNum {
  value: number = 0;
}

class MutableNumPair {
  negative: number = 0;
  positive: number = 0;
}

export default function Float64ArrayForEachTest(): void {
  describe('Float64ArrayForEachTest', (): void => {
    beforeAll((): void => {
    })

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    })

    afterEach((): void => {
    })

    afterAll((): void => {
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0010
     * @tc.name testFloat64ArrayForEach001
     * @tc.desc Verify forEach with zero-parameter callback iterates all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const twoValue: number = 2;
      const arr = Float64Array.of(int16MinValue, -128);
      let called = 0;
      arr.forEach((): void => {
        called++;
      })

      const expectVal = twoValue;
      expect(called).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0020
     * @tc.name testFloat64ArrayForEach002
     * @tc.desc Verify forEach with single callback parameter iterates all 3 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const results: Array<number> = [];
      arr.forEach((value: number): void => {
        results.push(value);
      })

      expect(results.length).assertEqual(threeValue);
      expect(results[0]).assertEqual(int32MinValue);
      expect(results[1]).assertEqual(negativeOne);
      expect(results[2]).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0030
     * @tc.name testFloat64ArrayForEach003
     * @tc.desc Verify forEach with callback and value parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const twoValue: number = 2;
      const num9007199254740992Value: number = 9007199254740992;
      const arr = Float64Array.of(pointOne, maxSafeInteger);
      const results: Array<number> = [];
      arr.forEach((value: number, index: int): void => {
        results.push(value + index);
      })

      expect(results.length).assertEqual(twoValue);
      const actVal1 = results.$_get(0);
      const expectVal = pointOne;
      expect(actVal1).assertEqual(expectVal);
      const actVal2 = results.$_get(1);
      const expectVal2 = num9007199254740992Value;
      expect(actVal2).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0040
     * @tc.name testFloat64ArrayForEach004
     * @tc.desc Verify forEach with complete three-parameter callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const threeValue: number = 3;
      const threePointfive: number = 3.5;
      const fivePointfive: number = 5.5;
      const fivePointtwofive: number = 5.25;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const results: Array<number> = [];
      arr.forEach((value: number, index: int, array: Float64Array): void => {
        results.push(value + index + array.length);
      })

      expect(results.length).assertEqual(threeValue);
      const actVal3 = results.$_get(0);
      const expectVal = threePointfive;
      expect(actVal3).assertEqual(expectVal);
      const actVal4 = results.$_get(1);
      const expectVal2 = fivePointfive;
      expect(actVal4).assertEqual(expectVal2);
      const actVal5 = results.$_get(2);
      const expectVal3 = fivePointtwofive;
      expect(actVal5).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0050
     * @tc.name testFloat64ArrayForEach005
     * @tc.desc Verify forEach callback as arrow function receiving value parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const int8MinValue: number = -128;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const values: Array<number> = [];
      arr.forEach((value: number): void => {
        values.push(value);
      })

      expect(values.length).assertEqual(threeValue);
      expect(values[0]).assertEqual(int16MinValue);
      expect(values[1]).assertEqual(int8MinValue);
      expect(values[2]).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0060
     * @tc.name testFloat64ArrayForEach006
     * @tc.desc Verify forEach callback receiving value and index parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const negnum21474836480Value: number = -21474836480;
      const negnineValue: number = -9;
      const twoValue: number = 2;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const pairs: Array<number> = [];
      arr.forEach((value: number, index: int): void => {
        pairs.push(value * 10.0 + index);
      })

      const actVal6 = pairs.$_get(0);
      const expectVal = negnum21474836480Value;
      expect(actVal6).assertEqual(expectVal);
      const actVal7 = pairs.$_get(1);
      const expectVal2 = negnineValue;
      expect(actVal7).assertEqual(expectVal2);
      const actVal8 = pairs.$_get(2);
      const expectVal3 = twoValue;
      expect(actVal8).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0070
     * @tc.name testFloat64ArrayForEach007
     * @tc.desc Verify forEach callback receiving complete three parameters value/index/array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const twoValue: number = 2;
      const arr = Float64Array.of(pointOne, maxSafeInteger);
      let arrayRef: Float64Array = new Float64Array();
      arr.forEach((value: number, index: int, array: Float64Array): void => {
        arrayRef = array;
      })

      expect(arrayRef.length).assertEqual(twoValue);
      const expectVal = arr;
      expect(arrayRef).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0080
     * @tc.name testFloat64ArrayForEach008
     * @tc.desc Verify forEach with named function declaration as callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const threeValue: number = 3;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      forEachHandlerCapture004 = [];
      arr.forEach(forEachHandler004);
      expect(forEachHandlerCapture004.length).assertEqual(threeValue);
      expect(forEachHandlerCapture004[0]).assertEqual(pointFive);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0090
     * @tc.name testFloat64ArrayForEach009
     * @tc.desc Verify forEach callback returning undefined does not affect traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const fourValue: number = 4;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue, int8MaxValue);
      const count: MutableNum = { value: 0 };
      arr.forEach((value: number): undefined => {
        count.value++;
        return undefined;
      })

      const expectVal = fourValue;
      expect(count.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0100
     * @tc.name testFloat64ArrayForEach010
     * @tc.desc Verify forEach callback returning non-undefined value does not affect traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const twoValue: number = 2;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue, -1);
      const results: Array<number> = [];
      arr.forEach((value: number): void => {
        results.push(value);
      })

      expect(results.length).assertEqual(twoValue);
      const actVal9 = results.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal9).assertEqual(expectVal);
      const actVal10 = results.$_get(1);
      const expectVal2 = negativeOne;
      expect(actVal10).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0110
     * @tc.name testFloat64ArrayForEach011
     * @tc.desc Verify forEach callback without explicit return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const arr = Float64Array.of(pointOne, maxSafeInteger);
      let sum = 0.0;
      arr.forEach((value: number): void => {
        sum += value;
      })

      const expectVal = maxSafeInteger;
      expect(sum).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0120
     * @tc.name testFloat64ArrayForEach012
     * @tc.desc Verify forEach callback modifying external state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const twoPointtwofive: number = 2.25;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      let externalSum = 0.0;
      arr.forEach((value: number): void => {
        externalSum += value;
      })

      const expectVal = twoPointtwofive;
      expect(externalSum).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0130
     * @tc.name testFloat64ArrayForEach013
     * @tc.desc Verify forEach callback reading external array state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const external: Array<number> = [];
      arr.forEach((value: number): void => {
        external.push(arr[0]);
      })

      expect(external.length).assertEqual(threeValue);
      expect(external[0]).assertEqual(int16MinValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0140
     * @tc.name testFloat64ArrayForEach014
     * @tc.desc Verify forEach callback with nested forEach call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const twoPointZero: number = 2.0;
      const fourValue: number = 4;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue, -1);
      const results: Array<number> = [];
      arr.forEach((value: number): void => {
        Float64Array.of(value, value * twoPointZero).forEach((v: number): void => {
          results.push(v);
        })

      })

      expect(results.length).assertEqual(fourValue);
      expect(results[0]).assertEqual(int32MinValue);
      expect(results[2]).assertEqual(negativeOne);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0150
     * @tc.name testFloat64ArrayForEach015
     * @tc.desc Verify forEach callback calling $_get to read elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const results: Array<number> = [];
      arr.forEach((value: number, index: int): void => {
        results.push(arr.$_get(index));
      })

      const actVal11 = results.$_get(0);
      const expectVal = pointOne;
      expect(actVal11).assertEqual(expectVal);
      const actVal12 = results.$_get(1);
      const expectVal2 = maxSafeInteger;
      expect(actVal12).assertEqual(expectVal2);
      const actVal13 = results.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal13).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0160
     * @tc.name testFloat64ArrayForEach016
     * @tc.desc Verify forEach callback calling $_set to modify elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const tenPointZero: number = 10.0;
      const fiveValue: number = 5;
      const fifteenValue: number = 15;
      const twoPointFive: number = 2.5;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      arr.forEach((value: number, index: int): void => {
        arr.$_set(index, value * tenPointZero);
      })

      const actVal14 = arr.$_get(0);
      const expectVal = fiveValue;
      expect(actVal14).assertEqual(expectVal);
      const actVal15 = arr.$_get(1);
      const expectVal2 = fifteenValue;
      expect(actVal15).assertEqual(expectVal2);
      const actVal16 = arr.$_get(2);
      const expectVal3 = twoPointFive;
      expect(actVal16).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0170
     * @tc.name testFloat64ArrayForEach017
     * @tc.desc Verify forEach callback receives NaN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(zeroValue, -128, zeroValue);
      const nanCount: MutableNum = { value: 0 };
      arr.forEach((value: number): void => {
        if (Number.isNaN(value)) {
          nanCount.value++;
        }
      })

      const expectVal = zeroValue;
      expect(nanCount.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0180
     * @tc.name testFloat64ArrayForEach018
     * @tc.desc Verify forEach callback receives Infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const zeroValue: number = 0;
      const twoValue: number = 2;
      const negativeInfinity: number = -Infinity;
      const arr = Float64Array.of(positiveInfinity, -positiveInfinity, zeroValue);
      const infValues: Array<number> = [];
      arr.forEach((value: number): void => {
        if (value === Infinity || value === -Infinity) {
          infValues.push(value);
        }
      })

      expect(infValues.length).assertEqual(twoValue);
      expect(infValues[0]).assertEqual(positiveInfinity);
      expect(infValues[1]).assertEqual(negativeInfinity);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0190
     * @tc.name testFloat64ArrayForEach019
     * @tc.desc Verify forEach callback receives Double.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const maxVal = 1.7976931348623157e+308;
      const arr = Float64Array.of(maxVal, onePointZero);
      const received: Array<number> = [];
      arr.forEach((value: number): void => {
        received.push(value);
      })

      const expectVal = maxVal;
      expect(received[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0200
     * @tc.name testFloat64ArrayForEach020
     * @tc.desc Verify forEach callback receives Double.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const minVal = 5e-324;
      const arr = Float64Array.of(minVal, onePointZero);
      const received: Array<number> = [];
      arr.forEach((value: number): void => {
        received.push(value);
      })

      const expectVal = minVal;
      expect(received[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0210
     * @tc.name testFloat64ArrayForEach021
     * @tc.desc Verify forEach callback receives negative zero -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const zeroCount: MutableNumPair = { negative: 0, positive: 0 };
      arr.forEach((value: number): void => {
        if (value === 0.0) {
          if (1.0 / value < 0) {
            zeroCount.negative++;
          } else {
            zeroCount.positive++;
          }
        }
      })

      expect(zeroCount.negative).assertEqual(zeroValue);
      expect(zeroCount.positive).assertEqual(oneValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0220
     * @tc.name testFloat64ArrayForEach022
     * @tc.desc Verify forEach callback receives scientific notation literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const threeValue: number = 3;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const results: Array<number> = [];
      arr.forEach((value: number): void => {
        results.push(value);
      })

      expect(results.length).assertEqual(threeValue);
      expect(results[0]).assertEqual(pointFive);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0230
     * @tc.name testFloat64ArrayForEach023
     * @tc.desc Verify forEach callback receives hexadecimal numeric literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue10: number = 0x10;
      const hexValueFF: number = 0xFF;
      const hexValue100: number = 0x100;
      const sixteenPointzero: number = 16.0;
      const num255Pointzero: number = 255.0;
      const num256Pointzero: number = 256.0;
      const arr = Float64Array.of(hexValue10, hexValueFF, hexValue100);
      const results: Array<number> = [];
      arr.forEach((value: number): void => {
        results.push(value);
      })

      expect(results[0]).assertEqual(sixteenPointzero);
      expect(results[1]).assertEqual(num255Pointzero);
      expect(results[2]).assertEqual(num256Pointzero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0240
     * @tc.name testFloat64ArrayForEach024
     * @tc.desc Verify forEach callback receives octal numeric literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eightPointZero: number = 8.0;
      const sixtythreePointzero: number = 63.0;
      const arr = Float64Array.of(0o10, 0o77);
      const results: Array<number> = [];
      arr.forEach((value: number): void => {
        results.push(value);
      })

      expect(results[0]).assertEqual(eightPointZero);
      expect(results[1]).assertEqual(sixtythreePointzero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0250
     * @tc.name testFloat64ArrayForEach025
     * @tc.desc Verify forEach callback receives binary numeric literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue1010: number = 0b1010;
      const binaryValue1111: number = 0b1111;
      const tenPointZero: number = 10.0;
      const fifteenPointzero: number = 15.0;
      const arr = Float64Array.of(binaryValue1010, binaryValue1111);
      const results: Array<number> = [];
      arr.forEach((value: number): void => {
        results.push(value);
      })

      expect(results[0]).assertEqual(tenPointZero);
      expect(results[1]).assertEqual(fifteenPointzero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0260
     * @tc.name testFloat64ArrayForEach026
     * @tc.desc Verify forEach callback receives negative numeric values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const negnum32896Value: number = -32896;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const sum: MutableNum = { value: 0.0 };
      arr.forEach((value: number): void => {
        sum.value += value;
      })

      const expectVal = negnum32896Value;
      expect(sum.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0270
     * @tc.name testFloat64ArrayForEach027
     * @tc.desc Verify forEach callback receives integer numeric values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue, oneValue, int32MaxValue);
      let sum = 0.0;
      arr.forEach((value: number): void => {
        sum += value;
      })

      const expectVal = negativeOne;
      expect(sum).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0280
     * @tc.name testFloat64ArrayForEach028
     * @tc.desc Verify forEach callback receives floating point precision boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const sum: MutableNum = { value: 0.0 };
      arr.forEach((value: number): void => {
        sum.value += value;
      })

      const expectVal = true;
      expect(sum.value > 0.0).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0290
     * @tc.name testFloat64ArrayForEach029
     * @tc.desc Verify forEach callback receives MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = Number.MAX_SAFE_INTEGER;
      const onePointZero: number = 1.0;
      const maxSafeIntegerValue: number = 9007199254740991.0;
      const arr = Float64Array.of(maxSafeInteger, onePointZero);
      const results: Array<number> = [];
      arr.forEach((value: number): void => {
        results.push(value);
      })

      const expectVal = maxSafeIntegerValue;
      expect(results[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0300
     * @tc.name testFloat64ArrayForEach030
     * @tc.desc Verify forEach callback receives MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minSafeInteger: number = Number.MIN_SAFE_INTEGER;
      const negativeMaxSafeIntegerValue: number = -9007199254740991.0;
      const arr = Float64Array.of(minSafeInteger, -1.0);
      const results: Array<number> = [];
      arr.forEach((value: number): void => {
        results.push(value);
      })

      const expectVal = negativeMaxSafeIntegerValue;
      expect(results[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0310
     * @tc.name testFloat64ArrayForEach031
     * @tc.desc Verify forEach callback receives overflow boundary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const overflowVal = 1.7976931348623158e+308;
      const arr = Float64Array.of(overflowVal);
      const results: Array<number> = [];
      arr.forEach((value: number): void => {
        results.push(value);
      })

      const expectVal = true;
      expect(results[0] > 0.0).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0320
     * @tc.name testFloat64ArrayForEach032
     * @tc.desc Verify forEach index parameter starts from 0 and increments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const twoValue: number = 2;
      const threeValue: number = 3;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive);
      const indices: Array<int> = [];
      arr.forEach((value: number, index: int): void => {
        indices.push(index);
      })

      const actVal17 = indices.$_get(0);
      const expectVal = zeroValue;
      expect(actVal17).assertEqual(expectVal);
      const actVal18 = indices.$_get(1);
      const expectVal2 = oneValue;
      expect(actVal18).assertEqual(expectVal2);
      const actVal19 = indices.$_get(2);
      const expectVal3 = twoValue;
      expect(actVal19).assertEqual(expectVal3);
      const actVal20 = indices.$_get(3);
      const expectVal4 = threeValue;
      expect(actVal20).assertEqual(expectVal4);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0330
     * @tc.name testFloat64ArrayForEach033
     * @tc.desc Verify forEach index parameter type is int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const oneValue: number = 1;
      const arr = Float64Array.of(int16MinValue, -128);
      let lastIndex: int = -1;
      arr.forEach((value: number, index: int): void => {
        lastIndex = index;
      })

      const expectVal = oneValue;
      expect(lastIndex).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0340
     * @tc.name testFloat64ArrayForEach034
     * @tc.desc Verify forEach index parameter is 0 for single element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue);
      let indexVal = -999;
      arr.forEach((value: number, index: int): void => {
        indexVal = index;
      })

      const expectVal = zeroValue;
      expect(indexVal).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0350
     * @tc.name testFloat64ArrayForEach035
     * @tc.desc Verify forEach index parameter is not passed for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array();
      let called = false;
      arr.forEach((value: number, index: int): void => {
        called = true;
      })

      const expectVal = false;
      expect(called).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0360
     * @tc.name testFloat64ArrayForEach036
     * @tc.desc Verify forEach index parameter value corresponds one-to-one with value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const pairs: Array<string> = [];
      arr.forEach((value: number, index: int): void => {
        pairs.push(index + ':' + value);
      })

      expect(pairs[0]).assertEqual('0:0.1');
      expect(pairs[1]).assertEqual('1:9007199254740991');
      expect(pairs[2]).assertEqual('2:0');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0370
     * @tc.name testFloat64ArrayForEach037
     * @tc.desc Verify forEach array parameter references the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      let callbackArray: Float64Array = new Float64Array();
      arr.forEach((value: number, index: int, array: Float64Array): void => {
        callbackArray = array;
      })

      const expectVal = arr;
      expect(callbackArray).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0380
     * @tc.name testFloat64ArrayForEach038
     * @tc.desc Verify forEach array parameter can access elements by index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const results: Array<number> = [];
      arr.forEach((value: number, index: int, array: Float64Array): void => {
        results.push(array.$_get(index));
      })

      expect(results[0]).assertEqual(int32MinValue);
      expect(results[1]).assertEqual(negativeOne);
      expect(results[2]).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0390
     * @tc.name testFloat64ArrayForEach039
     * @tc.desc Verify forEach array parameter can call methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      let sum = 0.0;
      arr.forEach((value: number, index: int, array: Float64Array): void => {
        sum += array.$_get(index);
      })

      const expectVal = maxSafeInteger;
      expect(sum).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0400
     * @tc.name testFloat64ArrayForEach040
     * @tc.desc Verify forEach array parameter has same reference in each callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const arr = Float64Array.of(pointFive, onePointFive);
      const refs: Array<Float64Array> = [];
      arr.forEach((value: number, index: int, array: Float64Array): void => {
        refs.push(array);
      })

      const expectVal = refs[1];
      expect(refs[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0410
     * @tc.name testFloat64ArrayForEach041
     * @tc.desc Verify forEach has no overloads, single signature covers all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const results: Array<number> = [];
      arr.forEach((value: number, index: int, array: Float64Array): void => {
        results.push(value);
      })

      const expectVal = threeValue;
      expect(results.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0420
     * @tc.name testFloat64ArrayForEach042
     * @tc.desc Verify forEach returns void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const arr = Float64Array.of(int32MinValue, -1);
      const result: void = arr.forEach((value: number): void => {
      })

      expect(result).assertUndefined();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0430
     * @tc.name testFloat64ArrayForEach043
     * @tc.desc Verify forEach does not modify original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      arr.forEach((value: number): void => {
      })

      expect(arr.length).assertEqual(threeValue);
      const actVal21 = arr.$_get(0);
      const expectVal = pointOne;
      expect(actVal21).assertEqual(expectVal);
      const actVal22 = arr.$_get(1);
      const expectVal2 = maxSafeInteger;
      expect(actVal22).assertEqual(expectVal2);
      const actVal23 = arr.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal23).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0440
     * @tc.name testFloat64ArrayForEach044
     * @tc.desc Verify forEach does not change original array element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      arr.forEach((value: number): void => {
      })

      const actVal24 = arr.$_get(0);
      const expectVal = pointFive;
      expect(actVal24).assertEqual(expectVal);
      const actVal25 = arr.$_get(1);
      const expectVal2 = onePointFive;
      expect(actVal25).assertEqual(expectVal2);
      const actVal26 = arr.$_get(2);
      const expectVal3 = pointTwoFive;
      expect(actVal26).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0450
     * @tc.name testFloat64ArrayForEach045
     * @tc.desc Verify forEach does not change original array buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const arr = Float64Array.of(int32MinValue, -1);
      const beforeBuffer = arr.buffer;
      arr.forEach((value: number): void => {
      })

      const expectVal = beforeBuffer;
      expect(arr.buffer).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0460
     * @tc.name testFloat64ArrayForEach046
     * @tc.desc Verify forEach returns undefined type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const arr = Float64Array.of(int16MinValue);
      const result = arr.forEach((value: number): void => {
      })

      expect(result).assertUndefined();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0470
     * @tc.name testFloat64ArrayForEach047
     * @tc.desc Verify forEach propagates Error thrown in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      let caught = false;
      let errorName = '';
      try {
        arr.forEach((value: number, index: int): void => {
          if (index === 1) {
            throw new Error('test error');
          }
        })

      } catch (e) {
        caught = true;
        errorName = (e as Error).name;
      }
      const expectVal = true;
      expect(caught).assertEqual(expectVal);
      const expectVal2 = 'Error';
      expect(errorName).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0480
     * @tc.name testFloat64ArrayForEach048
     * @tc.desc Verify forEach propagates RangeError thrown in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const arr = Float64Array.of(pointOne, maxSafeInteger);
      let caught = false;
      try {
        arr.forEach((value: number): void => {
          throw new RangeError('out of range');
        })

      } catch (e) {
        caught = true;
      }
      const expectVal = true;
      expect(caught).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0490
     * @tc.name testFloat64ArrayForEach049
     * @tc.desc Verify forEach propagates TypeError thrown in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const arr = Float64Array.of(pointFive);
      let caught = false;
      try {
        arr.forEach((value: number): void => {
          throw new TypeError('type error');
        })

      } catch (e) {
        caught = true;
      }
      const expectVal = true;
      expect(caught).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0500
     * @tc.name testFloat64ArrayForEach050
     * @tc.desc Verify forEach propagates error thrown at first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      let firstCalled = false;
      let secondCalled = false;
      try {
        arr.forEach((value: number, index: int): void => {
          if (index === 0) {
            firstCalled = true;
            throw new Error('first');
          }
          secondCalled = true;
        })

      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
      const expectVal = true;
      expect(firstCalled).assertEqual(expectVal);
      const expectVal2 = false;
      expect(secondCalled).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0510
     * @tc.name testFloat64ArrayForEach051
     * @tc.desc Verify forEach propagates error thrown at middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const threeValue: number = 3;
      const twoValue: number = 2;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue, oneValue);
      const calledIndices: Array<int> = [];
      try {
        arr.forEach((value: number, index: int): void => {
          calledIndices.push(index);
          if (index === 2) {
            throw new Error('middle');
          }
        })

      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
      expect(calledIndices.length).assertEqual(threeValue);
      const actVal27 = calledIndices.$_get(0);
      const expectVal = zeroValue;
      expect(actVal27).assertEqual(expectVal);
      const actVal28 = calledIndices.$_get(1);
      const expectVal2 = oneValue;
      expect(actVal28).assertEqual(expectVal2);
      const actVal29 = calledIndices.$_get(2);
      const expectVal3 = twoValue;
      expect(actVal29).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0520
     * @tc.name testFloat64ArrayForEach052
     * @tc.desc Verify forEach propagates error thrown at last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const twoValue: number = 2;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const calledIndices: Array<int> = [];
      try {
        arr.forEach((value: number, index: int): void => {
          calledIndices.push(index);
          if (index === 2) {
            throw new Error('last');
          }
        })

      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
      expect(calledIndices.length).assertEqual(threeValue);
      expect(calledIndices[2]).assertEqual(twoValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0530
     * @tc.name testFloat64ArrayForEach053
     * @tc.desc Verify forEach propagates custom error object thrown in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const arr = Float64Array.of(pointFive);
      let caught = false;
      try {
        arr.forEach((value: number): void => {
          throw new Error('custom error');
        })

      } catch (e) {
        caught = true;
      }
      const expectVal = true;
      expect(caught).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0540
     * @tc.name testFloat64ArrayForEach054
     * @tc.desc Verify forEach propagates string error thrown in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const arr = Float64Array.of(int16MinValue);
      let caught = false;
      try {
        arr.forEach((value: number): void => {
          throw new Error('string error');
        })

      } catch (e) {
        caught = true;
      }
      const expectVal = true;
      expect(caught).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0550
     * @tc.name testFloat64ArrayForEach055
     * @tc.desc Verify forEach propagates null thrown in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const arr = Float64Array.of(int32MinValue);
      let caught = false;
      try {
        arr.forEach((value: number): void => {
          throw new Error('null error');
        })

      } catch (e) {
        caught = true;
      }
      const expectVal = true;
      expect(caught).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0560
     * @tc.name testFloat64ArrayForEach056
     * @tc.desc Verify forEach propagates undefined thrown in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const arr = Float64Array.of(pointOne);
      let caught = false;
      try {
        arr.forEach((value: number): void => {
          throw new Error('undefined error');
        })

      } catch (e) {
        caught = true;
      }
      const expectVal = true;
      expect(caught).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0570
     * @tc.name testFloat64ArrayForEach057
     * @tc.desc Verify forEach propagates Number object thrown in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const arr = Float64Array.of(pointFive, onePointFive);
      let caught = false;
      try {
        arr.forEach((value: number): void => {
          throw new Error('number error');
        })

      } catch (e) {
        caught = true;
      }
      const expectVal = true;
      expect(caught).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0580
     * @tc.name testFloat64ArrayForEach058
     * @tc.desc Verify forEach propagates Boolean object thrown in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const arr = Float64Array.of(int32MinValue);
      let caught = false;
      try {
        arr.forEach((value: number): void => {
          throw new Error('boolean error');
        })

      } catch (e) {
        caught = true;
      }
      const expectVal = true;
      expect(caught).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0590
     * @tc.name testFloat64ArrayForEach059
     * @tc.desc Verify forEach propagates Date object thrown in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const arr = Float64Array.of(pointOne);
      let caught = false;
      try {
        arr.forEach((value: number): void => {
          throw new Error('date error');
        })

      } catch (e) {
        caught = true;
      }
      const expectVal = true;
      expect(caught).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0600
     * @tc.name testFloat64ArrayForEach060
     * @tc.desc Verify forEach propagates RegExp object thrown in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const arr = Float64Array.of(pointFive);
      let caught = false;
      try {
        arr.forEach((value: number): void => {
          throw new Error('regexp error');
        })

      } catch (e) {
        caught = true;
      }
      const expectVal = true;
      expect(caught).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0610
     * @tc.name testFloat64ArrayForEach061
     * @tc.desc Verify forEach propagates Array object thrown in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const arr = Float64Array.of(int16MinValue);
      let caught = false;
      try {
        arr.forEach((value: number): void => {
          throw new Error('array error');
        })

      } catch (e) {
        caught = true;
      }
      const expectVal = true;
      expect(caught).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0620
     * @tc.name testFloat64ArrayForEach062
     * @tc.desc Verify forEach propagates Float64Array object thrown in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const arr = Float64Array.of(int32MinValue);
      let caught = false;
      try {
        arr.forEach((value: number): void => {
          throw new Error('float64array error');
        })

      } catch (e) {
        caught = true;
      }
      const expectVal = true;
      expect(caught).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0630
     * @tc.name testFloat64ArrayForEach063
     * @tc.desc Verify forEach on empty array returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array();
      const result = arr.forEach((value: number): void => {
      })

      expect(result).assertUndefined();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0640
     * @tc.name testFloat64ArrayForEach064
     * @tc.desc Verify forEach on empty array does not modify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array();
      const beforeBuffer = arr.buffer;
      arr.forEach((value: number): void => {
      })

      const expectVal = beforeBuffer;
      expect(arr.buffer).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0650
     * @tc.name testFloat64ArrayForEach065
     * @tc.desc Verify forEach on empty array triggers no callback logic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array();
      const sideEffects: Array<number> = [];
      arr.forEach((value: number, index: int, array: Float64Array): void => {
        sideEffects.push(value, index, array.length);
      })

      const expectVal = zeroValue;
      expect(sideEffects.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0660
     * @tc.name testFloat64ArrayForEach066
     * @tc.desc Verify forEach on single element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const arr = Float64Array.of(pointOne);
      let called = false;
      let value = 0.0;
      arr.forEach((v: number, i: int): void => {
        called = true;
        value = v;
      })

      const expectVal = true;
      expect(called).assertEqual(expectVal);
      const expectVal2 = pointOne;
      expect(value).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0670
     * @tc.name testFloat64ArrayForEach067
     * @tc.desc Verify forEach on two element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const twoValue: number = 2;
      const arr = Float64Array.of(pointFive, onePointFive);
      const results: Array<number> = [];
      arr.forEach((value: number): void => {
        results.push(value);
      })

      expect(results.length).assertEqual(twoValue);
      expect(results[0]).assertEqual(pointFive);
      expect(results[1]).assertEqual(onePointFive);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0680
     * @tc.name testFloat64ArrayForEach068
     * @tc.desc Verify forEach on large array (100 elements)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const num4950Pointzero: number = 4950.0;
      const arr = new Float64Array(100);
      for (let i = 0; i < 100; i++) {
        arr.$_set(i, i * onePointZero);
      }
      let sum = 0.0;
      arr.forEach((value: number): void => {
        sum += value;
      })

      const expectVal = num4950Pointzero;
      expect(sum).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0690
     * @tc.name testFloat64ArrayForEach069
     * @tc.desc Verify forEach on large array (1000 elements)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const thousandValue: number = 1000;
      const arr = new Float64Array(1000);
      for (let i = 0; i < 1000; i++) {
        arr.$_set(i, onePointZero);
      }
      let count = 0;
      arr.forEach((value: number): void => {
        count++;
      })

      const expectVal = thousandValue;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0700
     * @tc.name testFloat64ArrayForEach070
     * @tc.desc Verify forEach on array with all same elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8MaxValue: number = 127;
      const num508Value: number = 508;
      const arr = Float64Array.of(int8MaxValue, int8MaxValue, int8MaxValue, int8MaxValue);
      const sum: MutableNum = { value: 0.0 };
      arr.forEach((value: number): void => {
        sum.value += value;
      })

      const expectVal = num508Value;
      expect(sum.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0710
     * @tc.name testFloat64ArrayForEach071
     * @tc.desc Verify forEach on array with all zero elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const arr = Float64Array.of(zeroValue, zeroValue, zeroValue);
      let count = 0;
      arr.forEach((value: number): void => {
        if (value === 0.0) {
          count++;
        }
      })

      const expectVal = threeValue;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0720
     * @tc.name testFloat64ArrayForEach072
     * @tc.desc Verify forEach on ascending sequence array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const tinyNegativeValue: number = -1e-100;
      const num9007199254740994Value: number = 9007199254740994;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue, tinyNegativeValue);
      let sum = 0.0;
      arr.forEach((value: number): void => {
        sum += value;
      })

      const expectVal = num9007199254740994Value;
      expect(sum).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0730
     * @tc.name testFloat64ArrayForEach073
     * @tc.desc Verify forEach on descending sequence array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const twoPointfourthreesevenfive: number = 2.4375;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive, pointZeroSixTwoFive);
      let sum = 0.0;
      arr.forEach((value: number): void => {
        sum += value;
      })

      const expectVal = twoPointfourthreesevenfive;
      expect(sum).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0740
     * @tc.name testFloat64ArrayForEach074
     * @tc.desc Verify forEach on alternating positive and negative array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const int16MaxValue: number = 32767;
      const negtwoValue: number = -2;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue, int8MaxValue, int16MaxValue, zeroValue);
      let sum = 0.0;
      arr.forEach((value: number): void => {
        sum += value;
      })

      const expectVal = negtwoValue;
      expect(sum).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0750
     * @tc.name testFloat64ArrayForEach075
     * @tc.desc Verify forEach on array with zero value mix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MaxValue: number = 2147483647;
      const oneValue: number = 1;
      const fiveValue: number = 5;
      const arr = Float64Array.of(int32MaxValue, -1, int32MaxValue, oneValue, int32MaxValue);
      let nonZeroCount = 0;
      arr.forEach((value: number): void => {
        if (value !== 0.0) {
          nonZeroCount++;
        }
      })

      const expectVal = fiveValue;
      expect(nonZeroCount).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0760
     * @tc.name testFloat64ArrayForEach076
     * @tc.desc Verify forEach on array with NaN mix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const piValue: number = 3.141592653589793;
      const zeroValue: number = 0;
      const tinyNegativeValue: number = -1e-100;
      const arr = Float64Array.of(pointOne, piValue, zeroValue, piValue, tinyNegativeValue);
      let nanCount = 0;
      arr.forEach((value: number): void => {
        if (Number.isNaN(value)) {
          nanCount++;
        }
      })

      const expectVal = zeroValue;
      expect(nanCount).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0770
     * @tc.name testFloat64ArrayForEach077
     * @tc.desc Verify forEach on array with Infinity mix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive);
      let infCount = 0;
      arr.forEach((value: number): void => {
        if (value === Infinity || value === -Infinity) {
          infCount++;
        }
      })

      const expectVal = zeroValue;
      expect(infCount).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0780
     * @tc.name testFloat64ArrayForEach078
     * @tc.desc Verify forEach on array with min and max value mix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      let count = 0;
      arr.forEach((value: number): void => {
        count++;
      })

      const expectVal = threeValue;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0790
     * @tc.name testFloat64ArrayForEach079
     * @tc.desc Verify forEach on array with negative zero and positive zero mix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(zeroValue, -1, zeroValue);
      let negZeroCount = 0;
      arr.forEach((value: number): void => {
        if (value === 0.0 && 1.0 / value < 0) {
          negZeroCount++;
        }
      })

      const expectVal = zeroValue;
      expect(negZeroCount).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0800
     * @tc.name testFloat64ArrayForEach080
     * @tc.desc Verify forEach on array with scientific notation mix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const fourValue: number = 4;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue);
      let count = 0;
      arr.forEach((value: number): void => {
        count++;
      })

      const expectVal = fourValue;
      expect(count).assertEqual(expectVal);
    })

  })
}
