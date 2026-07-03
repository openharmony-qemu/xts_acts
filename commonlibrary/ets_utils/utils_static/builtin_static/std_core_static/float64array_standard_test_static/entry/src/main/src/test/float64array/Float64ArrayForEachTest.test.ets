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
      const twoValue: number = 2;
      const arr = Float64Array.of(-32768, -128);
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
      const arr = new Float64Array([int32MinValue, -1, zeroValue]);
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
      const twoValue: number = 2;
      const num9007199254740992Value: number = 9007199254740992;
      const arr = Float64Array.of(pointOne, 9007199254740991);
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
      const threeValue: number = 3;
      const threePointfive: number = 3.5;
      const fivePointfive: number = 5.5;
      const fivePointtwofive: number = 5.25;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
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
      const arr = new Float64Array([int16MinValue, -128, zeroValue]);
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
      const negnum21474836480Value: number = -21474836480;
      const negnineValue: number = -9;
      const twoValue: number = 2;
      const arr = Float64Array.of(-2147483648, -1, 0);
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
      const twoValue: number = 2;
      const arr = new Float64Array([0.1, 9007199254740991]);
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
      const threeValue: number = 3;
      const arr = Float64Array.of(pointFive, 1.5, 0.25);
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
      const fourValue: number = 4;
      const arr = Float64Array.of(-32768, -128, 0, 127);
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
      const maxSafeInteger: number = 9007199254740991;
      const arr = Float64Array.of(0.1, maxSafeInteger);
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
      const twoPointtwofive: number = 2.25;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
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
      const threeValue: number = 3;
      const arr = Float64Array.of(int16MinValue, -128, 0);
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
      const fourValue: number = 4;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue, -1);
      const results: Array<number> = [];
      arr.forEach((value: number): void => {
        new Float64Array([value, value * 2.0]).forEach((v: number): void => {
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
      const tenPointZero: number = 10.0;
      const fiveValue: number = 5;
      const fifteenValue: number = 15;
      const twoPointFive: number = 2.5;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
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
      const arr = new Float64Array([zeroValue, -128, zeroValue]);
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
      const twoValue: number = 2;
      const negativeInfinity: number = -Infinity;
      const arr = Float64Array.of(positiveInfinity, -positiveInfinity, 0);
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
      const maxVal = 1.7976931348623157e+308;
      const arr = new Float64Array([maxVal, 1.0]);
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
      const minVal = 5e-324;
      const arr = new Float64Array([minVal, 1.0]);
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
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const arr = Float64Array.of(0.1, 9007199254740991, zeroValue);
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
      const threeValue: number = 3;
      const arr = Float64Array.of(pointFive, 1.5, 0.25);
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
      const negnum32896Value: number = -32896;
      const arr = new Float64Array([-32768, -128, 0]);
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
      const negativeOne: number = -1;
      const arr = new Float64Array([-2147483648, -1, 0, 1, 2147483647]);
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
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
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
      const maxSafeIntegerValue: number = 9007199254740991.0;
      const arr = new Float64Array([maxSafeInteger, 1.0]);
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
      const arr = new Float64Array([minSafeInteger, -1.0]);
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
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const twoValue: number = 2;
      const threeValue: number = 3;
      const arr = new Float64Array([0.5, 1.5, 0.25, 0.125]);
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
      const oneValue: number = 1;
      const arr = Float64Array.of(-32768, -128);
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
      const zeroValue: number = 0;
      const arr = Float64Array.of(-2147483648);
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
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
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
      const arr = new Float64Array([0.5, 1.5, 0.25]);
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
      const arr = new Float64Array([int32MinValue, -1, zeroValue]);
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
      const maxSafeInteger: number = 9007199254740991;
      const arr = Float64Array.of(0.1, maxSafeInteger, 0);
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
      const arr = Float64Array.of(0.5, 1.5);
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
      const threeValue: number = 3;
      const arr = new Float64Array([-32768, -128, 0]);
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
      const arr = new Float64Array([-2147483648, -1]);
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
      const arr = new Float64Array([pointFive, onePointFive, pointTwoFive]);
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
      const arr = new Float64Array([-2147483648, -1]);
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
      const arr = new Float64Array([-32768]);
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
      const arr = Float64Array.of(-2147483648, -1, 0);
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
      const arr = new Float64Array([0.1, 9007199254740991]);
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
      const arr = new Float64Array([0.5]);
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
      const arr = new Float64Array([-32768, -128, 0]);
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
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const threeValue: number = 3;
      const twoValue: number = 2;
      const arr = Float64Array.of(-2147483648, -1, zeroValue, oneValue);
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
      const threeValue: number = 3;
      const twoValue: number = 2;
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
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
      const arr = new Float64Array([0.5]);
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
      const arr = new Float64Array([-32768]);
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
      const arr = Float64Array.of(-2147483648);
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
      const arr = Float64Array.of(0.1);
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
      const arr = Float64Array.of(0.5, 1.5);
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
      const arr = Float64Array.of(-2147483648);
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
      const arr = Float64Array.of(0.1);
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
      const arr = new Float64Array([0.5]);
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
      const arr = new Float64Array([-32768]);
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
      const arr = Float64Array.of(-2147483648);
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
      const arr = new Float64Array([pointOne]);
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
      const arr = new Float64Array([pointFive, onePointFive]);
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
      const arr = new Float64Array([zeroValue, zeroValue, zeroValue]);
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
      const num9007199254740994Value: number = 9007199254740994;
      const arr = Float64Array.of(0.1, 9007199254740991, 0, 3.141592653589793, -1e-100);
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
      const twoPointfourthreesevenfive: number = 2.4375;
      const arr = new Float64Array([0.5, 1.5, 0.25, 0.125, 0.0625]);
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
      const zeroValue: number = 0;
      const negtwoValue: number = -2;
      const arr = Float64Array.of(-32768, -128, zeroValue, 127, 32767, zeroValue);
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
      const fiveValue: number = 5;
      const arr = Float64Array.of(int32MaxValue, -1, int32MaxValue, 1, int32MaxValue);
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
      const piValue: number = 3.141592653589793;
      const zeroValue: number = 0;
      const arr = Float64Array.of(0.1, piValue, zeroValue, piValue, -1e-100);
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
      const zeroValue: number = 0;
      const arr = new Float64Array([0.5, 1.5, 0.25, 0.125]);
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
      const threeValue: number = 3;
      const arr = new Float64Array([-32768, -128, 0]);
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
      const arr = new Float64Array([zeroValue, -1, zeroValue]);
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
      const fourValue: number = 4;
      const arr = Float64Array.of(0.1, 9007199254740991, 0, 3.141592653589793);
      let count = 0;
      arr.forEach((value: number): void => {
        count++;
      })

      const expectVal = fourValue;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0810
     * @tc.name testFloat64ArrayForEach081
     * @tc.desc Verify forEach on array with hexadecimal values mix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue1: number = 0x1;
      const hexValue10: number = 0x10;
      const hexValueFF: number = 0xFF;
      const hexValue100: number = 0x100;
      const num528Pointzero: number = 528.0;
      const arr = Float64Array.of(hexValue1, hexValue10, hexValueFF, hexValue100);
      const sum: MutableNum = { value: 0.0 };
      arr.forEach((value: number): void => {
        sum.value += value;
      })

      const expectVal = num528Pointzero;
      expect(sum.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0820
     * @tc.name testFloat64ArrayForEach082
     * @tc.desc Verify forEach on array with octal values mix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const seventytwoPointzero: number = 72.0;
      const arr = Float64Array.of(0o1, 0o10, 0o77);
      const sum: MutableNum = { value: 0.0 };
      arr.forEach((value: number): void => {
        sum.value += value;
      })

      const expectVal = seventytwoPointzero;
      expect(sum.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0830
     * @tc.name testFloat64ArrayForEach083
     * @tc.desc Verify forEach on array with binary values mix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue1: number = 0b1;
      const binaryValue10: number = 0b10;
      const binaryValue111: number = 0b111;
      const tenPointZero: number = 10.0;
      const arr = new Float64Array([binaryValue1, binaryValue10, binaryValue111]);
      const sum: MutableNum = { value: 0.0 };
      arr.forEach((value: number): void => {
        sum.value += value;
      })

      const expectVal = tenPointZero;
      expect(sum.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0840
     * @tc.name testFloat64ArrayForEach084
     * @tc.desc Verify forEach callback modifies external accumulator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointthreesevenfive: number = 2.375;
      const arr = new Float64Array([0.5, 1.5, 0.25, 0.125]);
      let sum = 0.0;
      arr.forEach((value: number): void => {
        sum += value;
      })

      const expectVal = twoPointthreesevenfive;
      expect(sum).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0850
     * @tc.name testFloat64ArrayForEach085
     * @tc.desc Verify forEach callback collects all elements into a new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const int8MinValue: number = -128;
      const arr = new Float64Array([int16MinValue, -128, zeroValue]);
      const collected: Array<number> = [];
      arr.forEach((value: number): void => {
        collected.push(value);
      })

      expect(collected.length).assertEqual(threeValue);
      expect(collected[0]).assertEqual(int16MinValue);
      expect(collected[1]).assertEqual(int8MinValue);
      expect(collected[2]).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0860
     * @tc.name testFloat64ArrayForEach086
     * @tc.desc Verify forEach callback collects elements matching condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const twoValue: number = 2;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue, 1, 2147483647);
      const evenValues: Array<number> = [];
      arr.forEach((value: number): void => {
        if (value % 2.0 === 0.0) {
          evenValues.push(value);
        }
      })

      expect(evenValues.length).assertEqual(twoValue);
      const actVal30 = evenValues.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal30).assertEqual(expectVal);
      const actVal31 = evenValues.$_get(1);
      const expectVal2 = zeroValue;
      expect(actVal31).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0870
     * @tc.name testFloat64ArrayForEach087
     * @tc.desc Verify forEach callback modifies original array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const twoPointZero: number = 2.0;
      const pointTwo: number = 0.2;
      const num18014398509481982Value: number = 18014398509481982;
      const arr = Float64Array.of(0.1, 9007199254740991, zeroValue);
      arr.forEach((value: number, index: int): void => {
        arr.$_set(index, value * twoPointZero);
      })

      const actVal32 = arr.$_get(0);
      const expectVal = pointTwo;
      expect(actVal32).assertEqual(expectVal);
      const actVal33 = arr.$_get(1);
      const expectVal2 = num18014398509481982Value;
      expect(actVal33).assertEqual(expectVal2);
      const actVal34 = arr.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal34).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0880
     * @tc.name testFloat64ArrayForEach088
     * @tc.desc Verify forEach callback reads and modifies other position elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const twoValue: number = 2;
      const twoPointtwofive: number = 2.25;
      const arr = Float64Array.of(pointFive, 1.5, 0.25);
      arr.forEach((value: number, index: int): void => {
        if (index > 0) {
          arr.$_set(index, arr.$_get(index - 1) + value);
        }
      })

      const actVal35 = arr.$_get(0);
      const expectVal = pointFive;
      expect(actVal35).assertEqual(expectVal);
      const actVal36 = arr.$_get(1);
      const expectVal2 = twoValue;
      expect(actVal36).assertEqual(expectVal2);
      const actVal37 = arr.$_get(2);
      const expectVal3 = twoPointtwofive;
      expect(actVal37).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0890
     * @tc.name testFloat64ArrayForEach089
     * @tc.desc Verify two consecutive forEach calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sixValue: number = 6;
      const arr = new Float64Array([-32768, -128, 0]);
      let count = 0;
      arr.forEach((value: number): void => {
        count++;
      })

      arr.forEach((value: number): void => {
        count++;
      })

      const expectVal = sixValue;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0900
     * @tc.name testFloat64ArrayForEach090
     * @tc.desc Verify forEach after another forEach preserves immutability
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum2147483649Value: number = -2147483649;
      const arr = Float64Array.of(-2147483648, -1, 0);
      arr.forEach((value: number): void => {
      })

      let sum = 0.0;
      arr.forEach((value: number): void => {
        sum += value;
      })

      const expectVal = negnum2147483649Value;
      expect(sum).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0910
     * @tc.name testFloat64ArrayForEach091
     * @tc.desc Verify forEach nested calling itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const fourValue: number = 4;
      const pointTwo: number = 0.2;
      const num18014398509481982Value: number = 18014398509481982;
      const arr = Float64Array.of(0.1, maxSafeInteger);
      const results: Array<number> = [];
      arr.forEach((value: number): void => {
        arr.forEach((v: number): void => {
          results.push(value + v);
        })

      })

      expect(results.length).assertEqual(fourValue);
      const actVal38 = results.$_get(0);
      const expectVal = pointTwo;
      expect(actVal38).assertEqual(expectVal);
      const actVal39 = results.$_get(1);
      const expectVal2 = maxSafeInteger;
      expect(actVal39).assertEqual(expectVal2);
      const actVal40 = results.$_get(2);
      const expectVal3 = maxSafeInteger;
      expect(actVal40).assertEqual(expectVal3);
      const actVal41 = results.$_get(3);
      const expectVal4 = num18014398509481982Value;
      expect(actVal41).assertEqual(expectVal4);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0920
     * @tc.name testFloat64ArrayForEach092
     * @tc.desc Verify forEach records callback indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fourValue: number = 4;
      const arr = Float64Array.of(-32768, -128, 0, 127);
      const indexes: Array<int> = [];
      arr.forEach((value: number, index: int): void => {
        indexes.push(index);
      })

      expect(indexes.length).assertEqual(fourValue);
      expect(indexes[0]).assertEqual(0);
      expect(indexes[3]).assertEqual(3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0930
     * @tc.name testFloat64ArrayForEach093
     * @tc.desc Verify forEach can read array length from callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const arr = Float64Array.of(-2147483648, -1, 0);
      const lengths: Array<number> = [];
      arr.forEach((value: number, index: int, array: Float64Array): void => {
        lengths.push(array.length);
      })

      expect(lengths.length).assertEqual(threeValue);
      expect(lengths[0]).assertEqual(threeValue);
      expect(lengths[2]).assertEqual(threeValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0940
     * @tc.name testFloat64ArrayForEach094
     * @tc.desc Verify forEach callback can update external state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const threeValue: number = 3;
      const arr = new Float64Array([pointOne, 9007199254740991, 0]);
      let callCount = 0;
      arr.forEach((value: number): void => {
        callCount++;
      })

      const expectVal = threeValue;
      expect(callCount).assertEqual(expectVal);
      const actVal42 = arr.$_get(0);
      const expectVal2 = pointOne;
      expect(actVal42).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0950
     * @tc.name testFloat64ArrayForEach095
     * @tc.desc Verify forEach callback observes values in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const pointTwoFive: number = 0.25;
      const pointZeroSixTwoFive: number = 0.0625;
      const arr = Float64Array.of(pointFive, 1.5, pointTwoFive, 0.125, pointZeroSixTwoFive);
      const collected: Array<number> = [];
      arr.forEach((value: number): void => {
        collected.push(value);
      })

      expect(collected[0]).assertEqual(pointFive);
      expect(collected[2]).assertEqual(pointTwoFive);
      expect(collected[4]).assertEqual(pointZeroSixTwoFive);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0960
     * @tc.name testFloat64ArrayForEach096
     * @tc.desc Verify forEach callback receives original order values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const arr = new Float64Array([int16MinValue, -128, zeroValue]);
      const collected: Array<number> = [];
      arr.forEach((value: number): void => {
        collected.push(value);
      })

      expect(collected[0]).assertEqual(int16MinValue);
      expect(collected[2]).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0970
     * @tc.name testFloat64ArrayForEach097
     * @tc.desc Verify forEach callback sees negative integer values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr = new Float64Array([int32MinValue, -1, zeroValue]);
      const collected: Array<number> = [];
      arr.forEach((value: number): void => {
        collected.push(value);
      })

      expect(collected[0]).assertEqual(int32MinValue);
      expect(collected[1]).assertEqual(negativeOne);
      expect(collected[2]).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0980
     * @tc.name testFloat64ArrayForEach098
     * @tc.desc Verify forEach collects doubled values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const pointTwo: number = 0.2;
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      const collected: Array<number> = [];
      arr.forEach((value: number): void => {
        collected.push(value * 2.0);
      })
      expect(collected.length).assertEqual(threeValue);
      expect(collected[0]).assertEqual(pointTwo);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_0990
     * @tc.name testFloat64ArrayForEach099
     * @tc.desc Verify forEach conditionally collects values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const twoValue: number = 2;
      const arr = Float64Array.of(pointFive, 1.5, 0.25, 0.125);
      const collected: Array<number> = [];
      arr.forEach((value: number): void => {
        if (value > 0.3) {
          collected.push(value);
        }
      })
      expect(collected.length).assertEqual(twoValue);
      expect(collected[0]).assertEqual(pointFive);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1000
     * @tc.name testFloat64ArrayForEach100
     * @tc.desc Verify forEach calling at accesses element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointtwofive: number = 2.25;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      let sum = 0.0;
      arr.forEach((value: number, index: int): void => {
        sum += arr.$_get(index);
      })

      const expectVal = twoPointtwofive;
      expect(sum).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1010
     * @tc.name testFloat64ArrayForEach101
     * @tc.desc Verify forEach callback reaches target index while calling with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue99: number = 99.0;
      const threeValue: number = 3;
      const arr = new Float64Array([-32768, -128, 0]);
      let callCount = 0;
      let reachedIndexOne = false;
      arr.forEach((value: number, index: int): void => {
        callCount++;
        if (index === 1) {
          arr.with(1, fillValue99);
          reachedIndexOne = true;
        }
      })

      const expectVal = threeValue;
      expect(callCount).assertEqual(expectVal);
      const expectVal2 = true;
      expect(reachedIndexOne).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1020
     * @tc.name testFloat64ArrayForEach102
     * @tc.desc Verify forEach accessing buffer property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sixteenValue: number = 16;
      const arr = new Float64Array([-2147483648, -1]);
      let buf: ArrayBuffer = new ArrayBuffer(0);
      arr.forEach((value: number): void => {
        buf = arr.buffer;
      })

      const expectVal = sixteenValue;
      expect(buf.byteLength).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1030
     * @tc.name testFloat64ArrayForEach103
     * @tc.desc Verify forEach accessing byteLength property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twentyfourValue: number = 24;
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      let byteLen = 0;
      arr.forEach((value: number): void => {
        byteLen = arr.byteLength;
      })

      const expectVal = twentyfourValue;
      expect(byteLen).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1040
     * @tc.name testFloat64ArrayForEach104
     * @tc.desc Verify forEach accessing byteOffset property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(0.5, 1.5);
      let offset = -1;
      arr.forEach((value: number): void => {
        offset = arr.byteOffset;
      })

      const expectVal = zeroValue;
      expect(offset).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1050
     * @tc.name testFloat64ArrayForEach105
     * @tc.desc Verify forEach accessing length property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fourValue: number = 4;
      const arr = Float64Array.of(-32768, -128, 0, 127);
      let len = 0;
      arr.forEach((value: number): void => {
        len = arr.length;
      })

      const expectVal = fourValue;
      expect(len).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1060
     * @tc.name testFloat64ArrayForEach106
     * @tc.desc Verify forEach accessing BYTES_PER_ELEMENT property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eightValue: number = 8;
      const arr = new Float64Array([-2147483648, -1]);
      let bpe = 0;
      arr.forEach((value: number): void => {
        bpe = arr.BYTES_PER_ELEMENT;
      })

      const expectVal = eightValue;
      expect(bpe).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1070
     * @tc.name testFloat64ArrayForEach107
     * @tc.desc Verify forEach accessing name property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(0.1);
      let name = '';
      arr.forEach((value: number): void => {
        name = arr.name;
      })

      const expectVal = 'Float64Array';
      expect(name).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1080
     * @tc.name testFloat64ArrayForEach108
     * @tc.desc Verify forEach iterates a derived view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const arr = new Float64Array([0.5, 1.5, 0.25, 0.125]);
      const view = arr.subarray(1, 3);
      let callCount = 0;
      view.forEach((value: number): void => {
        callCount++;
      })

      const expectVal = twoValue;
      expect(callCount).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1090
     * @tc.name testFloat64ArrayForEach109
     * @tc.desc Verify parent array forEach changes visible in child view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPointZero: number = 10.0;
      const negnum327680Value: number = -327680;
      const negnum1280Value: number = -1280;
      const arr = new Float64Array([-32768, -128, 0]);
      const view = arr.subarray(0, 2);
      arr.forEach((value: number, index: int): void => {
        arr.$_set(index, value * tenPointZero);
      })

      const actVal43 = view.$_get(0);
      const expectVal = negnum327680Value;
      expect(actVal43).assertEqual(expectVal);
      const actVal44 = view.$_get(1);
      const expectVal2 = negnum1280Value;
      expect(actVal44).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1100
     * @tc.name testFloat64ArrayForEach110
     * @tc.desc Verify child view forEach changes visible in parent array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPointZero: number = 10.0;
      const negnum21474836480Value: number = -21474836480;
      const negtenValue: number = -10;
      const arr = Float64Array.of(-2147483648, -1, 0);
      const view = arr.subarray(0, 2);
      view.forEach((value: number, index: int): void => {
        view.$_set(index, value * tenPointZero);
      })

      const actVal45 = arr.$_get(0);
      const expectVal = negnum21474836480Value;
      expect(actVal45).assertEqual(expectVal);
      const actVal46 = arr.$_get(1);
      const expectVal2 = negtenValue;
      expect(actVal46).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1110
     * @tc.name testFloat64ArrayForEach111
     * @tc.desc Verify forEach iterates multiple views
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const arr = Float64Array.of(0.1, 9007199254740991, 0, 3.141592653589793);
      const v1 = arr.subarray(0, 2);
      const v2 = arr.subarray(2, 4);
      let count1 = 0;
      let count2 = 0;
      v1.forEach((value: number): void => {
        count1++;
      })

      v2.forEach((value: number): void => {
        count2++;
      })

      const expectVal = twoValue;
      expect(count1).assertEqual(expectVal);
      const expectVal2 = twoValue;
      expect(count2).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1120
     * @tc.name testFloat64ArrayForEach112
     * @tc.desc Verify forEach interacting with set method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const source = Float64Array.of(int16MinValue, -128);
      arr.forEach((value: number, index: int): void => {
        if (index < 2) {
          arr.set(source, 0);
        }
      })

      const actVal47 = arr.$_get(0);
      const expectVal = int16MinValue;
      expect(actVal47).assertEqual(expectVal);
      const actVal48 = arr.$_get(1);
      const expectVal2 = int8MinValue;
      expect(actVal48).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1130
     * @tc.name testFloat64ArrayForEach113
     * @tc.desc Verify forEach interacting with fill method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const fillValue99: number = 99.0;
      const arr = new Float64Array([-2147483648, -1, zeroValue]);
      let first = true;
      arr.forEach((value: number): void => {
        if (first) {
          arr.fill(fillValue99, 0, 2);
          first = false;
        }
      })

      const actVal49 = arr.$_get(0);
      const expectVal = fillValue99;
      expect(actVal49).assertEqual(expectVal);
      const actVal50 = arr.$_get(1);
      const expectVal2 = fillValue99;
      expect(actVal50).assertEqual(expectVal2);
      const actVal51 = arr.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal51).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1140
     * @tc.name testFloat64ArrayForEach114
     * @tc.desc Verify forEach interacting with copyWithin method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const arr = new Float64Array([0.1, 9007199254740991, zeroValue, piValue, -1e-100]);
      let first = true;
      arr.forEach((value: number): void => {
        if (first) {
          arr.copyWithin(0, 2, 4);
          first = false;
        }
      })

      const actVal52 = arr.$_get(0);
      const expectVal = zeroValue;
      expect(actVal52).assertEqual(expectVal);
      const actVal53 = arr.$_get(1);
      const expectVal2 = piValue;
      expect(actVal53).assertEqual(expectVal2);
      const actVal54 = arr.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal54).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1150
     * @tc.name testFloat64ArrayForEach115
     * @tc.desc Verify forEach reaches target index while calling slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fourValue: number = 4;
      const arr = new Float64Array([0.5, 1.5, 0.25, 0.125]);
      let callCount = 0;
      let reachedIndexOne = false;
      arr.forEach((value: number, index: int): void => {
        callCount++;
        if (index === 1) {
          arr.slice(1, 3);
          reachedIndexOne = true;
        }
      })

      const expectVal = fourValue;
      expect(callCount).assertEqual(expectVal);
      const expectVal2 = true;
      expect(reachedIndexOne).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1160
     * @tc.name testFloat64ArrayForEach116
     * @tc.desc Verify forEach interacting with reverse method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const arr = new Float64Array([int16MinValue, -128, zeroValue]);
      let reversed = false;
      arr.forEach((value: number, index: int): void => {
        if (index === 0) {
          arr.reverse();
          reversed = true;
        }
      })

      const expectVal = true;
      expect(reversed).assertEqual(expectVal);
      const actVal55 = arr.$_get(0);
      const expectVal2 = zeroValue;
      expect(actVal55).assertEqual(expectVal2);
      const actVal56 = arr.$_get(2);
      const expectVal3 = int16MinValue;
      expect(actVal56).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1170
     * @tc.name testFloat64ArrayForEach117
     * @tc.desc Verify forEach interacting with sort method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const arr = new Float64Array([int32MinValue, -1, zeroValue]);
      let sorted = false;
      arr.forEach((value: number, index: int): void => {
        if (index === 0) {
          arr.sort();
          sorted = true;
        }
      })

      const expectVal = true;
      expect(sorted).assertEqual(expectVal);
      const actVal57 = arr.$_get(0);
      const expectVal2 = int32MinValue;
      expect(actVal57).assertEqual(expectVal2);
      const actVal58 = arr.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal58).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1180
     * @tc.name testFloat64ArrayForEach118
     * @tc.desc Verify forEach callback runs while calling map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const threeValue: number = 3;
      const arr = new Float64Array([pointOne, 9007199254740991, 0]);
      let callCount = 0;
      arr.forEach((value: number): void => {
        arr.map((v: number): number => {
          return v * 2.0;
        })
        callCount++;
      })

      const expectVal = threeValue;
      expect(callCount).assertEqual(expectVal);
      const actVal59 = arr.$_get(0);
      const expectVal2 = pointOne;
      expect(actVal59).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1190
     * @tc.name testFloat64ArrayForEach119
     * @tc.desc Verify forEach interacting with at method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum32896Value: number = -32896;
      const arr = new Float64Array([-32768, -128, 0]);
      let sum = 0.0;
      arr.forEach((value: number, index: int): void => {
        sum += arr.$_get(index);
      })

      const expectVal = negnum32896Value;
      expect(sum).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1200
     * @tc.name testFloat64ArrayForEach120
     * @tc.desc Verify forEach reaches target index while calling with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue99: number = 99.0;
      const negativeOne: number = -1;
      const threeValue: number = 3;
      const arr = Float64Array.of(-2147483648, -1, 0);
      let callCount = 0;
      let reachedIndexOne = false;
      arr.forEach((value: number, index: int): void => {
        callCount++;
        if (index === 1) {
          arr.with(1, fillValue99);
          reachedIndexOne = true;
        }
      })

      const expectVal = threeValue;
      expect(callCount).assertEqual(expectVal);
      const expectVal2 = true;
      expect(reachedIndexOne).assertEqual(expectVal2);
      const actVal60 = arr.$_get(1);
      const expectVal3 = negativeOne;
      expect(actVal60).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1210
     * @tc.name testFloat64ArrayForEach121
     * @tc.desc Verify forEach callback handles NaN values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([zeroValue, zeroValue, zeroValue]);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1220
     * @tc.name testFloat64ArrayForEach122
     * @tc.desc Verify forEach callback handles Infinity values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = new Float64Array([maxSafeInteger, maxSafeInteger]);
      let infCount = 0;
      arr.forEach((value: number): void => {
        if (value === Infinity) {
          infCount++;
        }
      })

      const expectVal = zeroValue;
      expect(infCount).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1230
     * @tc.name testFloat64ArrayForEach123
     * @tc.desc Verify forEach callback handles -Infinity values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointTwoFive: number = 0.25;
      const zeroValue: number = 0;
      const arr = new Float64Array([pointTwoFive, pointTwoFive, pointTwoFive]);
      let negInfCount = 0;
      arr.forEach((value: number): void => {
        if (value === -Infinity) {
          negInfCount++;
        }
      })

      const expectVal = zeroValue;
      expect(negInfCount).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1240
     * @tc.name testFloat64ArrayForEach124
     * @tc.desc Verify forEach callback handles MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-32768]);
      let received = false;
      arr.forEach((value: number): void => {
        if (value === 1.7976931348623157e+308) {
          received = true;
        }
      })

      const expectVal = false;
      expect(received).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1250
     * @tc.name testFloat64ArrayForEach125
     * @tc.desc Verify forEach callback handles MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648);
      let received = false;
      arr.forEach((value: number): void => {
        if (value === 5e-324) {
          received = true;
        }
      })

      const expectVal = false;
      expect(received).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1260
     * @tc.name testFloat64ArrayForEach126
     * @tc.desc Verify forEach callback handles negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(0.1);
      let isNegZero = false;
      arr.forEach((value: number): void => {
        if (value === 0.0 && 1.0 / value < 0) {
          isNegZero = true;
        }
      })

      const expectVal = false;
      expect(isNegZero).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1270
     * @tc.name testFloat64ArrayForEach127
     * @tc.desc Verify forEach callback handles positive zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5]);
      let isPosZero = false;
      arr.forEach((value: number): void => {
        if (value === 0.0 && 1.0 / value > 0) {
          isPosZero = true;
        }
      })

      const expectVal = false;
      expect(isPosZero).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1280
     * @tc.name testFloat64ArrayForEach128
     * @tc.desc Verify forEach callback handles MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-32768]);
      let received = false;
      arr.forEach((value: number): void => {
        if (value === 9007199254740991.0) {
          received = true;
        }
      })

      const expectVal = false;
      expect(received).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1290
     * @tc.name testFloat64ArrayForEach129
     * @tc.desc Verify forEach callback handles MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648);
      let received = false;
      arr.forEach((value: number): void => {
        if (value === -9007199254740991.0) {
          received = true;
        }
      })

      const expectVal = false;
      expect(received).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1300
     * @tc.name testFloat64ArrayForEach130
     * @tc.desc Verify forEach callback handles overflow value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(0.1);
      let received = false;
      arr.forEach((value: number): void => {
        if (value > 1.7976931348623157e+308) {
          received = true;
        }
      })

      const expectVal = false;
      expect(received).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1310
     * @tc.name testFloat64ArrayForEach131
     * @tc.desc Verify forEach callback handles floating point precision boundary 0.1+0.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointtwofive: number = 2.25;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      let sum = 0.0;
      arr.forEach((value: number): void => {
        sum += value;
      })

      const expectVal = twoPointtwofive;
      expect(sum).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1320
     * @tc.name testFloat64ArrayForEach132
     * @tc.desc Verify forEach callback handles scientific notation max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(-32768, -128);
      let count = 0;
      arr.forEach((value: number): void => {
        if (value > 1.0e+307) {
          count++;
        }
      })

      const expectVal = zeroValue;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1330
     * @tc.name testFloat64ArrayForEach133
     * @tc.desc Verify forEach callback handles scientific notation min
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const arr = new Float64Array([-2147483648, -1]);
      let count = 0;
      arr.forEach((value: number): void => {
        if (value < 1.0e-307) {
          count++;
        }
      })

      const expectVal = twoValue;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1340
     * @tc.name testFloat64ArrayForEach134
     * @tc.desc Verify forEach callback handles hexadecimal max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValueFFFFFF: number = 0xFFFFFF;
      const arr = new Float64Array([hexValueFFFFFF]);
      let received = false;
      arr.forEach((value: number): void => {
        if (value === 16777215.0) {
          received = true;
        }
      })

      const expectVal = true;
      expect(received).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1350
     * @tc.name testFloat64ArrayForEach135
     * @tc.desc Verify forEach callback handles octal max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(0.1);
      let received = false;
      arr.forEach((value: number): void => {
        if (value >= 134217727.0) {
          received = true;
        }
      })

      const expectVal = false;
      expect(received).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1360
     * @tc.name testFloat64ArrayForEach136
     * @tc.desc Verify forEach callback handles binary max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue11111111: number = 0b11111111;
      const arr = Float64Array.of(binaryValue11111111);
      let received = false;
      arr.forEach((value: number): void => {
        if (value === 255.0) {
          received = true;
        }
      })

      const expectVal = true;
      expect(received).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1370
     * @tc.name testFloat64ArrayForEach137
     * @tc.desc Verify forEach callback handles negative large numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(0.5, 1.5);
      let count = 0;
      arr.forEach((value: number): void => {
        if (value < -1.0e+307) {
          count++;
        }
      })

      const expectVal = zeroValue;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1380
     * @tc.name testFloat64ArrayForEach138
     * @tc.desc Verify forEach callback handles negative small numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum32896Value: number = -32896;
      const arr = new Float64Array([-32768, -128, 0]);
      let sum = 0.0;
      arr.forEach((value: number): void => {
        sum += value;
      })

      const expectVal = negnum32896Value;
      expect(sum).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1390
     * @tc.name testFloat64ArrayForEach139
     * @tc.desc Verify forEach callback value parameter type is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = new Float64Array([-2147483648, -1]);
      let firstValue: number = 0;
      arr.forEach((value: number, index: int, array: Float64Array): void => {
        firstValue = value;
      })
      const expectVal = negativeOne;
      expect(firstValue).assertEqual(expectVal);

    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1400
     * @tc.name testFloat64ArrayForEach140
     * @tc.desc Verify forEach callback index parameter type is int (number)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([0.1, 9007199254740991]);
      let firstIndex: int = -1;
      arr.forEach((value: number, index: int, array: Float64Array): void => {
        if (firstIndex === -1) {
          firstIndex = index;
        }
      })
      const expectVal = zeroValue;
      expect(firstIndex).assertEqual(expectVal);

    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1410
     * @tc.name testFloat64ArrayForEach141
     * @tc.desc Verify forEach callback array parameter type is Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const arr = Float64Array.of(0.5, 1.5);
      arr.forEach((value: number, index: int, array: Float64Array): void => {
        const expectVal = twoValue;
        expect(array.length).assertEqual(expectVal);
      })

    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1420
     * @tc.name testFloat64ArrayForEach142
     * @tc.desc Verify forEach finds value in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const arr = Float64Array.of(int16MinValue, -128);
      let found = false;
      arr.forEach((value: number): void => {
        if (value === int16MinValue) {
          found = true;
        }
      });
      const expectVal = true;
      expect(found).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1430
     * @tc.name testFloat64ArrayForEach143
     * @tc.desc Verify forEach callback with single parameter type check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const arr = new Float64Array([int32MinValue]);
      arr.forEach((value: number): void => {
        const expectVal = int32MinValue;
        expect(value).assertEqual(expectVal);
      })
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1440
     * @tc.name testFloat64ArrayForEach144
     * @tc.desc Verify forEach callback returning non-void type check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const arr = new Float64Array([pointOne]);
      let x: number = 0;
      arr.forEach((value: number): void => {
        x = value;
      })
      const expectVal = pointOne;
      expect(x).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1450
     * @tc.name testFloat64ArrayForEach145
     * @tc.desc Verify forEach iterates all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const values = new Float64Array([0.5, 1.5]);
      let sum = 0.0;
      values.forEach((value) => {
        sum += value;
      })

      const expectVal = twoValue;
      expect(sum).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1460
     * @tc.name testFloat64ArrayForEach146
     * @tc.desc Verify forEach does not execute callback for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array();
      let called = false;
      values.forEach((value) => {
        called = true;
      })

      const expectVal = false;
      expect(called).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1470
     * @tc.name testFloat64ArrayForEach147
     * @tc.desc Verify forEach executes once for single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const values = Float64Array.of(-32768);
      let count = 0;
      values.forEach((value) => {
        count++;
      })

      const expectVal = oneValue;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1480
     * @tc.name testFloat64ArrayForEach148
     * @tc.desc Verify forEach callback accesses index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-2147483648, -1, 0]);
      let indices = "";
      values.forEach((value, index) => {
        indices += index;
      })

      const expectVal = "012";
      expect(indices).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1490
     * @tc.name testFloat64ArrayForEach149
     * @tc.desc Verify forEach callback accesses external state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num18014398509481982Value: number = 18014398509481982;
      const values = Float64Array.of(0.1, 9007199254740991);
      let external = 0.0;
      values.forEach((value) => {
        external += value * 2;
      })

      const expectVal = num18014398509481982Value;
      expect(external).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1500
     * @tc.name testFloat64ArrayForEach150
     * @tc.desc Verify forEach callback error propagation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([0.5, 1.5]);
      try {
        values.forEach((value) => {
          throw new Error("test");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1510
     * @tc.name testFloat64ArrayForEach151
     * @tc.desc Verify forEach with NaN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const values = new Float64Array([-32768, -128]);
      let nanCount = 0;
      values.forEach((value) => {
        if (Number.isNaN(value)) {
          nanCount++;
        }
      })

      const expectVal = zeroValue;
      expect(nanCount).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1520
     * @tc.name testFloat64ArrayForEach152
     * @tc.desc Verify forEach with Infinity element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const values = new Float64Array([-2147483648, -1]);
      let infCount = 0;
      values.forEach((value) => {
        if (value === Infinity) {
          infCount++;
        }
      })

      const expectVal = zeroValue;
      expect(infCount).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1530
     * @tc.name testFloat64ArrayForEach153
     * @tc.desc Verify forEach with hex literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValueFF: number = 0xFF;
      const hexValueAA: number = 0xAA;
      const num425Pointzero: number = 425.0;
      const arr = Float64Array.of(hexValueFF, hexValueAA);
      let sum = 0.0;
      arr.forEach((v: number): void => sum += v);
      const expectVal = num425Pointzero;
      expect(sum).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1540
     * @tc.name testFloat64ArrayForEach154
     * @tc.desc Verify forEach with binary literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue11111111: number = 0b11111111;
      const binaryValue10101010: number = 0b10101010;
      const num425Pointzero: number = 425.0;
      const arr = Float64Array.of(binaryValue11111111, binaryValue10101010);
      let sum = 0.0;
      arr.forEach((v: number): void => sum += v);
      const expectVal = num425Pointzero;
      expect(sum).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1550
     * @tc.name testFloat64ArrayForEach155
     * @tc.desc Verify foreach with Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Double.NaN;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(nanValue, doubleMaxValue);
      let hasNaN = false;
      arr.forEach((v: number): void => {
        if (Number.isNaN(v)) {
          hasNaN = true;
        }
      });
      const expectVal = true;
      expect(hasNaN).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FOREACH_1560
     * @tc.name testFloat64ArrayForEach156
     * @tc.desc Verify foreach with Double.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayForEach156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const arr = Float64Array.of(positiveInfinity, negativeInfinity);
      let foundPositive = false;
      arr.forEach((v: number): void => {
        if (v > 0.0) {
          foundPositive = true;
        }
      });
      const expectVal = true;
      expect(foundPositive).assertEqual(expectVal);
    })

  })
}

